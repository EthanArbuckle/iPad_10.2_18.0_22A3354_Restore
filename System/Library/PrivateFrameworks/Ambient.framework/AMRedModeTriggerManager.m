@implementation AMRedModeTriggerManager

- (AMRedModeTriggerManager)init
{
  return -[AMRedModeTriggerManager initWithContext:](self, "initWithContext:", 0);
}

- (AMRedModeTriggerManager)initWithContext:(id)a3
{
  id v5;
  AMRedModeTriggerManager *v6;
  AMRedModeTriggerManager *v7;
  uint64_t v8;
  NSHashTable *observers;
  uint64_t v10;
  AMRedModeSettings *redModeSettings;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AMRedModeTriggerManager;
  v6 = -[AMRedModeTriggerManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_initializationContext, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    +[AMRedModeDomain rootSettings](AMRedModeDomain, "rootSettings");
    v10 = objc_claimAutoreleasedReturnValue();
    redModeSettings = v7->_redModeSettings;
    v7->_redModeSettings = (AMRedModeSettings *)v10;

    -[PTSettings addKeyObserver:](v7->_redModeSettings, "addKeyObserver:", v7);
  }

  return v7;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setRedModeDetectionEnabled:(BOOL)a3
{
  AMAmbientIlluminationTrigger *v4;
  AMAmbientIlluminationTrigger *ambientIlluminationTrigger;
  AMAmbientIlluminationTrigger *v6;
  AMAmbientIlluminationTrigger *v7;
  AMAmbientIlluminationTrigger *v8;

  if (self->_redModeDetectionEnabled != a3)
  {
    self->_redModeDetectionEnabled = a3;
    if (a3)
    {
      -[AMRedModeTriggerManager _getNewAmbientIlluminationTrigger](self, "_getNewAmbientIlluminationTrigger");
      v4 = (AMAmbientIlluminationTrigger *)objc_claimAutoreleasedReturnValue();
      ambientIlluminationTrigger = self->_ambientIlluminationTrigger;
      self->_ambientIlluminationTrigger = v4;

      -[AMAmbientIlluminationTrigger setDelegate:](self->_ambientIlluminationTrigger, "setDelegate:", self);
      v6 = self->_ambientIlluminationTrigger;
      -[AMRedModeSettings onLuxThreshold](self->_redModeSettings, "onLuxThreshold");
      -[AMAmbientIlluminationTrigger setActivationThresholdLux:](v6, "setActivationThresholdLux:");
      v7 = self->_ambientIlluminationTrigger;
      -[AMRedModeSettings offLuxThreshold](self->_redModeSettings, "offLuxThreshold");
      -[AMAmbientIlluminationTrigger setDeactivationThresholdLux:](v7, "setDeactivationThresholdLux:");
      -[AMRedModeTriggerManager _updateTriggerState](self, "_updateTriggerState");
    }
    else
    {
      -[AMAmbientIlluminationTrigger setDelegate:](self->_ambientIlluminationTrigger, "setDelegate:", 0);
      v8 = self->_ambientIlluminationTrigger;
      self->_ambientIlluminationTrigger = 0;

      -[AMRedModeTriggerManager _setRedModeTriggered:](self, "_setRedModeTriggered:", 0);
    }
  }
}

- (void)_setRedModeTriggered:(BOOL)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_redModeTriggered != a3)
  {
    self->_redModeTriggered = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_observers;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "redModeTriggerManager:didUpdateRedModeTriggeredState:", self, self->_redModeTriggered, (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  void *v7;
  AMAmbientIlluminationTrigger *ambientIlluminationTrigger;
  int v9;
  AMAmbientIlluminationTrigger *v10;
  void *v11;

  v6 = a4;
  v7 = v6;
  if (self->_redModeSettings == a3)
  {
    v11 = v6;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("onLuxThreshold")))
    {
      ambientIlluminationTrigger = self->_ambientIlluminationTrigger;
      -[AMRedModeSettings onLuxThreshold](self->_redModeSettings, "onLuxThreshold");
      -[AMAmbientIlluminationTrigger setActivationThresholdLux:](ambientIlluminationTrigger, "setActivationThresholdLux:");
LABEL_6:
      v7 = v11;
      goto LABEL_7;
    }
    v9 = objc_msgSend(v11, "isEqualToString:", CFSTR("offLuxThreshold"));
    v7 = v11;
    if (v9)
    {
      v10 = self->_ambientIlluminationTrigger;
      -[AMRedModeSettings offLuxThreshold](self->_redModeSettings, "offLuxThreshold");
      -[AMAmbientIlluminationTrigger setDeactivationThresholdLux:](v10, "setDeactivationThresholdLux:");
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)_updateTriggerState
{
  _BOOL8 v3;
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = -[AMAmbientIlluminationTrigger isTriggered](self->_ambientIlluminationTrigger, "isTriggered");
  AMLogRedMode();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109376;
    v5[1] = v3;
    v6 = 1024;
    v7 = v3;
    _os_log_impl(&dword_235FFE000, v4, OS_LOG_TYPE_DEFAULT, "Red mode should trigger: %{BOOL}u [ isDarkEnvironment : %{BOOL}u ]", (uint8_t *)v5, 0xEu);
  }

  -[AMRedModeTriggerManager _setRedModeTriggered:](self, "_setRedModeTriggered:", v3);
}

- (id)_getNewAmbientIlluminationTrigger
{
  AMAmbientIlluminationTrigger *v2;

  -[AMRedModeTriggerManagerContext ambientIlluminationTrigger](self->_initializationContext, "ambientIlluminationTrigger");
  v2 = (AMAmbientIlluminationTrigger *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = objc_alloc_init(AMAmbientIlluminationTrigger);
  return v2;
}

- (BOOL)isRedModeDetectionEnabled
{
  return self->_redModeDetectionEnabled;
}

- (BOOL)isRedModeTriggered
{
  return self->_redModeTriggered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_redModeSettings, 0);
  objc_storeStrong((id *)&self->_ambientIlluminationTrigger, 0);
  objc_storeStrong((id *)&self->_initializationContext, 0);
}

@end
