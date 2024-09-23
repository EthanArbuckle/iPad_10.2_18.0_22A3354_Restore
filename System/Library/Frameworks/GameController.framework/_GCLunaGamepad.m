@implementation _GCLunaGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GCLunaGamepad)initWithController:(id)a3
{
  id v4;
  uint64_t i;
  _GCLunaGamepad *v6;
  _GCLunaGamepad *v7;
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
  v10.super_class = (Class)_GCLunaGamepad;
  v6 = -[GCExtendedGamepad initWithController:initInfo:](&v10, sel_initWithController_initInfo_, v4, v11);
  v7 = v6;
  if (v6)
    -[_GCLunaGamepad initializeExtraControllerElements](v6, "initializeExtraControllerElements");
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v11 + j));

  return v7;
}

- (_GCLunaGamepad)initWithCoder:(id)a3
{
  _GCLunaGamepad *v3;
  _GCLunaGamepad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GCLunaGamepad;
  v3 = -[GCExtendedGamepad initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[_GCLunaGamepad initializeExtraControllerElements](v3, "initializeExtraControllerElements");
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
  id v22;

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUnmappedSfSymbolsName:", CFSTR("lt.rectangle.roundedtop"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnmappedSfSymbolsName:", CFSTR("rt.rectangle.roundedtop"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnmappedSfSymbolsName:", CFSTR("lb.rectangle.roundedbottom"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUnmappedSfSymbolsName:", CFSTR("rb.rectangle.roundedbottom"));

  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_HOME"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_OPTIONS"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_MENU"));

  -[GCExtendedGamepad dpad](self, "dpad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_DIRECTION_PAD"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_A"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_B"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_X"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_Y"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_LEFT_SHOULDER"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_RIGHT_SHOULDER"));

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_LEFT_TRIGGER"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_RIGHT_TRIGGER"));

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUnmappedNameLocalizationKey:", CFSTR("LUNA_BUTTON_RIGHT_THUMBSTICK"));

}

@end
