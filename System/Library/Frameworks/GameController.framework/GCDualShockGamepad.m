@implementation GCDualShockGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDualShockGamepad)initWithController:(id)a3
{
  id v4;
  uint64_t i;
  GCDualShockGamepad *v6;
  GCDualShockGamepad *v7;
  uint64_t j;
  objc_super v10;
  _OWORD v11[23];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  char v22;

  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  memset(v11, 0, sizeof(v11));
  GCExtendedGamepadInitInfoMake(v11);
  for (i = 9; i != 1161; i += 72)
    *((_BYTE *)v11 + i) = 1;
  BYTE1(v12) = 0;
  BYTE9(v16) = 0;
  v21 = 0;
  v22 = 0;
  v10.receiver = self;
  v10.super_class = (Class)GCDualShockGamepad;
  v6 = -[GCExtendedGamepad initWithController:initInfo:](&v10, sel_initWithController_initInfo_, v4, v11);
  v7 = v6;
  if (v6)
    -[GCDualShockGamepad initializeExtraControllerElements](v6, "initializeExtraControllerElements");
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v11 + j));

  return v7;
}

- (GCDualShockGamepad)initWithCoder:(id)a3
{
  GCDualShockGamepad *v3;
  GCDualShockGamepad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDualShockGamepad;
  v3 = -[GCExtendedGamepad initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[GCDualShockGamepad initializeExtraControllerElements](v3, "initializeExtraControllerElements");
  return v4;
}

- (GCDualShockGamepad)initWithIdentifier:(id)a3
{
  GCDualShockGamepad *v3;
  GCDualShockGamepad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDualShockGamepad;
  v3 = -[GCExtendedGamepad initWithIdentifier:](&v6, sel_initWithIdentifier_, a3);
  v4 = v3;
  if (v3)
    -[GCDualShockGamepad initializeExtraControllerElements](v3, "initializeExtraControllerElements");
  return v4;
}

- (void)initializeExtraControllerElements
{
  GCControllerButtonInput *v3;
  GCControllerButtonInput *touchpadButton;
  GCControllerDirectionPad *v5;
  GCControllerDirectionPad *touchpadPrimary;
  GCControllerDirectionPad *v7;
  GCControllerDirectionPad *touchpadSecondary;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  __int16 v33;
  __int128 v34;
  int v35;
  __int16 v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  __int16 v42;
  __int128 v43;
  int v44;
  __int16 v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __CFString *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v54 = 0u;
  v53 = 0u;
  v52 = 0u;
  v51 = 0u;
  v50 = CFSTR("Touchpad Button");
  LOWORD(v51) = 257;
  DWORD2(v51) = 33;
  LODWORD(v53) = 1;
  if (self)
  {
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v50);
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __destructor_8_s0_s48_s56_s64((id *)&v50);
    v3 = 0;
  }
  touchpadButton = self->_touchpadButton;
  self->_touchpadButton = v3;

  -[GCControllerElement setRemappable:](self->_touchpadButton, "setRemappable:", 1);
  -[GCControllerElement setUnmappedNameLocalizationKey:](self->_touchpadButton, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_TOUCHPAD"));
  -[GCControllerElement setUnmappedSfSymbolsName:](self->_touchpadButton, "setUnmappedSfSymbolsName:", CFSTR("plus.rectangle"));
  v41 = CFSTR("Touchpad 1");
  v42 = 1;
  v43 = xmmword_21526F5F0;
  v44 = 1;
  v45 = 0;
  v46 = 0;
  v48 = 0;
  v49 = 0;
  v47 = 0;
  -[GCPhysicalInputProfile _directionPadWithInfo:](self, "_directionPadWithInfo:", &v41);
  v5 = (GCControllerDirectionPad *)objc_claimAutoreleasedReturnValue();
  touchpadPrimary = self->_touchpadPrimary;
  self->_touchpadPrimary = v5;

  -[GCControllerElement setRemappable:](self->_touchpadPrimary, "setRemappable:", 1);
  -[GCControllerDirectionPad setUnmappedNameLocalizationKey:](self->_touchpadPrimary, "setUnmappedNameLocalizationKey:", CFSTR("DS4_TOUCHPAD_FINGER_ONE"));
  -[GCControllerElement setUnmappedSfSymbolsName:](self->_touchpadPrimary, "setUnmappedSfSymbolsName:", CFSTR("hand.draw"));
  v32 = CFSTR("Touchpad 2");
  v33 = 1;
  v34 = xmmword_21526F600;
  v35 = 1;
  v36 = 0;
  v37 = 0;
  v39 = 0;
  v40 = 0;
  v38 = 0;
  -[GCPhysicalInputProfile _directionPadWithInfo:](self, "_directionPadWithInfo:", &v32);
  v7 = (GCControllerDirectionPad *)objc_claimAutoreleasedReturnValue();
  touchpadSecondary = self->_touchpadSecondary;
  self->_touchpadSecondary = v7;

  -[GCControllerElement setRemappable:](self->_touchpadSecondary, "setRemappable:", 1);
  -[GCControllerDirectionPad setUnmappedNameLocalizationKey:](self->_touchpadSecondary, "setUnmappedNameLocalizationKey:", CFSTR("DS4_TOUCHPAD_FINGER_TWO"));
  -[GCControllerElement setUnmappedSfSymbolsName:](self->_touchpadSecondary, "setUnmappedSfSymbolsName:", CFSTR("hand.draw"));
  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_HOME"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_OPTIONS"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_MENU"));

  -[GCExtendedGamepad dpad](self, "dpad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnmappedNameLocalizationKey:", CFSTR("DS4_DIRECTION_PAD"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_A"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_B"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_X"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_Y"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUnmappedNameLocalizationKey:", CFSTR("DS4_LEFT_SHOULDER"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUnmappedNameLocalizationKey:", CFSTR("DS4_RIGHT_SHOULDER"));

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUnmappedNameLocalizationKey:", CFSTR("DS4_LEFT_TRIGGER"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUnmappedNameLocalizationKey:", CFSTR("DS4_RIGHT_TRIGGER"));

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUnmappedNameLocalizationKey:", CFSTR("DS4_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUnmappedNameLocalizationKey:", CFSTR("DS4_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUnmappedSfSymbolsName:", CFSTR("xmark.circle"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUnmappedSfSymbolsName:", CFSTR("circle.circle"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUnmappedSfSymbolsName:", CFSTR("square.circle"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setUnmappedSfSymbolsName:", CFSTR("triangle.circle"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setUnmappedSfSymbolsName:", CFSTR("capsule.portrait"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUnmappedSfSymbolsName:", CFSTR("capsule.portrait"));

  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUnmappedSfSymbolsName:", CFSTR("logo.playstation"));

}

- (GCControllerButtonInput)touchpadButton
{
  return self->_touchpadButton;
}

- (GCControllerDirectionPad)touchpadPrimary
{
  return self->_touchpadPrimary;
}

- (GCControllerDirectionPad)touchpadSecondary
{
  return self->_touchpadSecondary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchpadSecondary, 0);
  objc_storeStrong((id *)&self->_touchpadPrimary, 0);
  objc_storeStrong((id *)&self->_touchpadButton, 0);
}

- (void)_activateExtendedSupport
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GCPhysicalInputProfile controller](self, "controller", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "conformsToProtocol:", &unk_254DCA8F0) & 1) != 0)
        break;
      if (v5 == (id)++v7)
      {
        v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    v5 = v8;

    if (v5)
    {
      objc_msgSend(v5, "registryID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          +[_GCControllerManager sharedInstance](_GCControllerManager, "sharedInstance");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "registryID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setProperty:forKey:forHIDServiceClientWithRegistryID:", MEMORY[0x24BDBD1C8], CFSTR("ActivateExtendedSupport"), v12);

          goto LABEL_14;
        }
      }
    }
  }
  else
  {
LABEL_14:

  }
}

@end
