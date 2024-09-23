@implementation GCControllerElement

- (GCControllerElement)init
{
  GCControllerElement *v2;
  uint64_t v3;
  NSMutableSet *aliases;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCControllerElement;
  v2 = -[GCControllerElement init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    aliases = v2->_aliases;
    v2->_aliases = (NSMutableSet *)v3;

  }
  return v2;
}

- (void)setDevice:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  GCControllerElement *v8;
  id v9;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_device, obj);
    v6 = objc_loadWeakRetained((id *)&self->_collection);
    v5 = obj;
    if (v6)
    {
      v7 = v6;
      v8 = (GCControllerElement *)objc_loadWeakRetained((id *)&self->_collection);

      v5 = obj;
      if (v8 != self)
      {
        v9 = objc_loadWeakRetained((id *)&self->_collection);
        objc_msgSend(v9, "setDevice:", obj);

        v5 = obj;
      }
    }
  }

}

- (int)getAndResetTimesPressed
{
  return 0;
}

- (float)value
{
  +[NSException raise:format:](&off_254DEE1B8, "raise:format:", *MEMORY[0x24BDBCAB0], &stru_24D2B85A8);
  return 0.0;
}

- (BOOL)isAnalog
{
  return 1;
}

- (BOOL)_setPendingValueIfChanged:(float)a3
{
  double v5;
  float v6;

  -[GCControllerElement value](self, "value");
  v6 = *(float *)&v5;
  if (*(float *)&v5 != a3)
  {
    *(float *)&v5 = a3;
    -[GCControllerElement _setPendingValue:](self, "_setPendingValue:", v5);
  }
  return v6 != a3;
}

- (void)_setPendingValue:(float)a3
{
  if (self->_updatePending)
  {
    if (fabsf(a3) > fabsf(self->_pendingValue))
      self->_pendingValue = a3;
  }
  else
  {
    self->_pendingValue = a3;
    self->_updatePending = 1;
  }
}

- (void)_resetPendingValue
{
  self->_pendingValue = 0.0;
  self->_updatePending = 0;
}

- (BOOL)_commitPendingValueOnQueue:(id)a3
{
  id v4;
  float pendingValue;
  double v6;
  BOOL v7;

  v4 = a3;
  if (self->_updatePending)
  {
    pendingValue = self->_pendingValue;
    -[GCControllerElement value](self, "value");
    v7 = pendingValue != *(float *)&v6;
    if (pendingValue != *(float *)&v6)
    {
      *(float *)&v6 = self->_pendingValue;
      -[GCControllerElement _setValue:queue:](self, "_setValue:queue:", v4, v6);
    }
    -[GCControllerElement _resetPendingValue](self, "_resetPendingValue");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_setValue:(float)a3
{
  return -[GCControllerElement _setValue:queue:](self, "_setValue:queue:", MEMORY[0x24BDAC9B8]);
}

- (BOOL)_setValue:(float)a3 queue:(id)a4
{
  +[NSException raise:format:](&off_254DEE1B8, "raise:format:", *MEMORY[0x24BDBCAB0], &stru_24D2B85A8);
  return 0;
}

- (NSSet)aliases
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_aliases, "copy");
}

- (void)setAliases:(id)a3
{
  -[NSMutableSet setSet:](self->_aliases, "setSet:", a3);
  if (self->_primaryAlias)
    -[NSMutableSet addObject:](self->_aliases, "addObject:");
}

- (NSString)primaryAlias
{
  return self->_primaryAlias;
}

- (void)setPrimaryAlias:(id)a3
{
  NSString *v5;
  NSString *primaryAlias;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  primaryAlias = self->_primaryAlias;
  if (primaryAlias != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](primaryAlias, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      if (self->_primaryAlias)
      {
        -[NSMutableSet removeObject:](self->_aliases, "removeObject:");
        v5 = v8;
      }
      if (v5)
        -[NSMutableSet addObject:](self->_aliases, "addObject:", v8);
      objc_storeStrong((id *)&self->_primaryAlias, a3);
      v5 = v8;
    }
  }

}

- (void)setUnmappedSfSymbolsName:(NSString *)unmappedSfSymbolsName
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  NSString *sfSymbolsName;

  v4 = unmappedSfSymbolsName;
  v5 = (NSString *)-[NSString copy](v4, "copy");
  v6 = self->_unmappedSfSymbolsName;
  self->_unmappedSfSymbolsName = v5;

  v7 = (NSString *)-[NSString copy](v4, "copy");
  sfSymbolsName = self->_sfSymbolsName;
  self->_sfSymbolsName = v7;

}

- (NSString)localizedName
{
  NSString *localizedName;
  void *v4;

  localizedName = self->_localizedName;
  if (localizedName)
    return localizedName;
  if (self->_nameLocalizationKey)
  {
    _GCFConvertStringToLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)unmappedLocalizedName
{
  NSString *unmappedLocalizedName;
  void *v4;

  unmappedLocalizedName = self->_unmappedLocalizedName;
  if (unmappedLocalizedName)
    return unmappedLocalizedName;
  if (self->_unmappedNameLocalizationKey)
  {
    _GCFConvertStringToLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setUnmappedNameLocalizationKey:(id)a3
{
  id v4;
  NSString *v5;
  NSString *unmappedNameLocalizationKey;
  NSString *v7;
  NSString *nameLocalizationKey;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  unmappedNameLocalizationKey = self->_unmappedNameLocalizationKey;
  self->_unmappedNameLocalizationKey = v5;

  v7 = (NSString *)objc_msgSend(v4, "copy");
  nameLocalizationKey = self->_nameLocalizationKey;
  self->_nameLocalizationKey = v7;

}

- (GCControllerElement)collection
{
  return (GCControllerElement *)objc_loadWeakRetained((id *)&self->_collection);
}

- (void)setCollection:(id)a3
{
  objc_storeWeak((id *)&self->_collection, a3);
}

- (GCDevice)device
{
  return (GCDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (BOOL)updatePending
{
  return self->_updatePending;
}

- (void)setUpdatePending:(BOOL)a3
{
  self->_updatePending = a3;
}

- (float)pendingValue
{
  return self->_pendingValue;
}

- (void)setPendingValue:(float)a3
{
  self->_pendingValue = a3;
}

- (float)deadzone
{
  return self->_deadzone;
}

- (void)setDeadzone:(float)a3
{
  self->_deadzone = a3;
}

- (BOOL)isBoundToSystemGesture
{
  return self->_boundToSystemGesture;
}

- (void)setBoundToSystemGesture:(BOOL)a3
{
  self->_boundToSystemGesture = a3;
}

- (GCSystemGestureState)preferredSystemGestureState
{
  return self->_preferredSystemGestureState;
}

- (void)setPreferredSystemGestureState:(GCSystemGestureState)preferredSystemGestureState
{
  self->_preferredSystemGestureState = preferredSystemGestureState;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (void)setSfSymbolsName:(NSString *)sfSymbolsName
{
  objc_storeStrong((id *)&self->_sfSymbolsName, sfSymbolsName);
}

- (void)setLocalizedName:(NSString *)localizedName
{
  objc_storeStrong((id *)&self->_localizedName, localizedName);
}

- (NSString)unmappedSfSymbolsName
{
  return self->_unmappedSfSymbolsName;
}

- (void)setUnmappedLocalizedName:(NSString *)unmappedLocalizedName
{
  objc_storeStrong((id *)&self->_unmappedLocalizedName, unmappedLocalizedName);
}

- (BOOL)remappable
{
  return self->_remappable;
}

- (void)setRemappable:(BOOL)a3
{
  self->_remappable = a3;
}

- (int)remappingKey
{
  return self->_remappingKey;
}

- (void)setRemappingKey:(int)a3
{
  self->_remappingKey = a3;
}

- (BOOL)mappableToSystemGestures
{
  return self->_mappableToSystemGestures;
}

- (void)setMappableToSystemGestures:(BOOL)a3
{
  self->_mappableToSystemGestures = a3;
}

- (NSString)unmappedNameLocalizationKey
{
  return self->_unmappedNameLocalizationKey;
}

- (NSString)nameLocalizationKey
{
  return self->_nameLocalizationKey;
}

- (void)setNameLocalizationKey:(id)a3
{
  objc_storeStrong((id *)&self->_nameLocalizationKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_unmappedNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_unmappedLocalizedName, 0);
  objc_storeStrong((id *)&self->_unmappedSfSymbolsName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
  objc_storeStrong((id *)&self->_primaryAlias, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->_collection);
  objc_storeStrong((id *)&self->_aliases, 0);
}

@end
