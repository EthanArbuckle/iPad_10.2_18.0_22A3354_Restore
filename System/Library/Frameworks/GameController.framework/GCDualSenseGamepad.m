@implementation GCDualSenseGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCDualSenseGamepad)initWithController:(id)a3
{
  id v4;
  uint64_t i;
  GCDualSenseGamepad *v6;
  GCDualSenseGamepad *v7;
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
  uint64_t v22;
  char v23;
  uint64_t v24;

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
  v23 = 0;
  v22 = 1;
  v24 = 1;
  v10.receiver = self;
  v10.super_class = (Class)GCDualSenseGamepad;
  v6 = -[GCExtendedGamepad initWithController:initInfo:](&v10, sel_initWithController_initInfo_, v4, v11);
  v7 = v6;
  if (v6)
    -[GCDualSenseGamepad initializeExtraControllerElements](v6, "initializeExtraControllerElements");
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v11 + j));

  return v7;
}

- (GCDualSenseGamepad)initWithCoder:(id)a3
{
  GCDualSenseGamepad *v3;
  GCDualSenseGamepad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCDualSenseGamepad;
  v3 = -[GCExtendedGamepad initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[GCDualSenseGamepad initializeExtraControllerElements](v3, "initializeExtraControllerElements");
  return v4;
}

- (GCDualSenseGamepad)initWithIdentifier:(id)a3
{
  id v4;
  GCDualSenseGamepad *v5;
  GCDualSenseGamepad *v6;
  uint64_t i;
  objc_super v9;
  _OWORD v10[42];
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  memset(v10, 0, 512);
  GCExtendedGamepadInitInfoMake(v10);
  v11 = 1;
  v12 = 1;
  v9.receiver = self;
  v9.super_class = (Class)GCDualSenseGamepad;
  v5 = -[GCExtendedGamepad initWithIdentifier:info:](&v9, sel_initWithIdentifier_info_, v4, v10);
  v6 = v5;
  if (v5)
    -[GCDualSenseGamepad initializeExtraControllerElements](v5, "initializeExtraControllerElements");
  for (i = 0; i != 1584; i += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v10 + i));

  return v6;
}

- (void)populateEncodedInitInfo:(id *)a3
{
  a3->var0[9].var3.var0.var3 = 1;
  a3->var0[10].var3.var0.var3 = 1;
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
  void *v32;
  void *v33;
  __CFString *v34;
  __int16 v35;
  __int128 v36;
  int v37;
  __int16 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  __int16 v44;
  __int128 v45;
  int v46;
  __int16 v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;

  v56 = 0u;
  v55 = 0u;
  v54 = 0u;
  v53 = 0u;
  v52 = CFSTR("Touchpad Button");
  LOWORD(v53) = 257;
  DWORD2(v53) = 33;
  LODWORD(v55) = 1;
  if (self)
  {
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v52);
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __destructor_8_s0_s48_s56_s64((id *)&v52);
    v3 = 0;
  }
  touchpadButton = self->_touchpadButton;
  self->_touchpadButton = v3;

  -[GCControllerElement setRemappable:](self->_touchpadButton, "setRemappable:", 1);
  -[GCControllerElement setUnmappedNameLocalizationKey:](self->_touchpadButton, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_TOUCHPAD"));
  -[GCControllerElement setUnmappedSfSymbolsName:](self->_touchpadButton, "setUnmappedSfSymbolsName:", CFSTR("plus.rectangle"));
  v43 = CFSTR("Touchpad 1");
  v44 = 1;
  v45 = xmmword_21526F5F0;
  v46 = 1;
  v47 = 0;
  v48 = 0;
  v50 = 0;
  v51 = 0;
  v49 = 0;
  -[GCPhysicalInputProfile _directionPadWithInfo:](self, "_directionPadWithInfo:", &v43);
  v5 = (GCControllerDirectionPad *)objc_claimAutoreleasedReturnValue();
  touchpadPrimary = self->_touchpadPrimary;
  self->_touchpadPrimary = v5;

  -[GCControllerElement setRemappable:](self->_touchpadPrimary, "setRemappable:", 1);
  -[GCControllerDirectionPad setUnmappedNameLocalizationKey:](self->_touchpadPrimary, "setUnmappedNameLocalizationKey:", CFSTR("DS4_TOUCHPAD_FINGER_ONE"));
  -[GCControllerElement setUnmappedSfSymbolsName:](self->_touchpadPrimary, "setUnmappedSfSymbolsName:", CFSTR("hand.draw"));
  v34 = CFSTR("Touchpad 2");
  v35 = 1;
  v36 = xmmword_21526F600;
  v37 = 1;
  v38 = 0;
  v39 = 0;
  v41 = 0;
  v42 = 0;
  v40 = 0;
  -[GCPhysicalInputProfile _directionPadWithInfo:](self, "_directionPadWithInfo:", &v34);
  v7 = (GCControllerDirectionPad *)objc_claimAutoreleasedReturnValue();
  touchpadSecondary = self->_touchpadSecondary;
  self->_touchpadSecondary = v7;

  -[GCControllerElement setRemappable:](self->_touchpadSecondary, "setRemappable:", 1);
  -[GCControllerDirectionPad setUnmappedNameLocalizationKey:](self->_touchpadSecondary, "setUnmappedNameLocalizationKey:", CFSTR("DS4_TOUCHPAD_FINGER_TWO"));
  -[GCControllerElement setUnmappedSfSymbolsName:](self->_touchpadSecondary, "setUnmappedSfSymbolsName:", CFSTR("hand.draw"));
  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIndex:", 0);
  objc_msgSend(v10, "setIndex:", 1);
  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_HOME"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnmappedNameLocalizationKey:", CFSTR("DUALSENSE_BUTTON_OPTIONS"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnmappedNameLocalizationKey:", CFSTR("DUALSENSE_BUTTON_MENU"));

  -[GCExtendedGamepad dpad](self, "dpad");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUnmappedNameLocalizationKey:", CFSTR("DS4_DIRECTION_PAD"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_A"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_B"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_X"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_Y"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUnmappedNameLocalizationKey:", CFSTR("DS4_LEFT_SHOULDER"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUnmappedNameLocalizationKey:", CFSTR("DS4_RIGHT_SHOULDER"));

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUnmappedNameLocalizationKey:", CFSTR("DS4_LEFT_TRIGGER"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUnmappedNameLocalizationKey:", CFSTR("DS4_RIGHT_TRIGGER"));

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUnmappedNameLocalizationKey:", CFSTR("DS4_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUnmappedNameLocalizationKey:", CFSTR("DS4_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUnmappedNameLocalizationKey:", CFSTR("DS4_BUTTON_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUnmappedSfSymbolsName:", CFSTR("xmark.circle"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setUnmappedSfSymbolsName:", CFSTR("circle.circle"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setUnmappedSfSymbolsName:", CFSTR("square.circle"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUnmappedSfSymbolsName:", CFSTR("triangle.circle"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUnmappedSfSymbolsName:", CFSTR("capsule.portrait"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUnmappedSfSymbolsName:", CFSTR("capsule.portrait"));

  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setUnmappedSfSymbolsName:", CFSTR("logo.playstation"));

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
