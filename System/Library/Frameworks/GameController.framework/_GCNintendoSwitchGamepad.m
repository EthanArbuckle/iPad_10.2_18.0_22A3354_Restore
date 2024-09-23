@implementation _GCNintendoSwitchGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCNintendoSwitchGamepad)initWithController:(id)a3
{
  id v4;
  uint64_t i;
  _GCNintendoSwitchGamepad *v6;
  _GCNintendoSwitchGamepad *v7;
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
  for (i = 0; i != 1152; i += 72)
    *(_WORD *)((char *)v11 + i + 8) = 257;
  BYTE1(v12) = 0;
  BYTE9(v16) = 0;
  v10.receiver = self;
  v10.super_class = (Class)_GCNintendoSwitchGamepad;
  v6 = -[GCExtendedGamepad initWithController:initInfo:](&v10, sel_initWithController_initInfo_, v4, v11);
  v7 = v6;
  if (v6)
    -[_GCNintendoSwitchGamepad initializeExtraControllerElements](v6, "initializeExtraControllerElements");
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v11 + j));

  return v7;
}

- (_GCNintendoSwitchGamepad)initWithCoder:(id)a3
{
  _GCNintendoSwitchGamepad *v3;
  _GCNintendoSwitchGamepad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCNintendoSwitchGamepad;
  v3 = -[GCExtendedGamepad initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_GCNintendoSwitchGamepad initializeExtraControllerElements](v3, "initializeExtraControllerElements");
  return v4;
}

- (void)initializeExtraControllerElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  id v24;

  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_HOME"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_OPTIONS"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_MENU"));

  -[GCExtendedGamepad dpad](self, "dpad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_DIRECTION_PAD"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_A"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_B"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_X"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_Y"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_LEFT_SHOULDER"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_RIGHT_SHOULDER"));

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_LEFT_TRIGGER"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_RIGHT_TRIGGER"));

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUnmappedNameLocalizationKey:", CFSTR("SWITCH_BUTTON_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUnmappedSfSymbolsName:", CFSTR("zl.rectangle.roundedtop"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUnmappedSfSymbolsName:", CFSTR("zr.rectangle.roundedtop"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUnmappedSfSymbolsName:", CFSTR("l.rectangle.roundedbottom"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUnmappedSfSymbolsName:", CFSTR("r.rectangle.roundedbottom"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUnmappedSfSymbolsName:", CFSTR("minus.circle"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUnmappedSfSymbolsName:", CFSTR("plus.circle"));

}

@end
