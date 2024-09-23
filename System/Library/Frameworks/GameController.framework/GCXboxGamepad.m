@implementation GCXboxGamepad

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCXboxGamepad)initWithController:(id)a3
{
  id v4;
  uint64_t i;
  GCXboxGamepad *v6;
  GCXboxGamepad *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t j;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  uint8_t v20[16];
  objc_super v21;
  _OWORD v22[23];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  char v33;
  char v34;

  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  memset(v22, 0, sizeof(v22));
  GCExtendedGamepadInitInfoMake(v22);
  for (i = 9; i != 1161; i += 72)
    *((_BYTE *)v22 + i) = 1;
  BYTE1(v23) = 0;
  BYTE9(v27) = 0;
  v32 = 0;
  v33 = 0;
  v21.receiver = self;
  v21.super_class = (Class)GCXboxGamepad;
  v6 = -[GCExtendedGamepad initWithController:initInfo:](&v21, sel_initWithController_initInfo_, v4, v22);
  v7 = v6;
  if (v6)
  {
    -[GCPhysicalInputProfile controller](v6, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hidServices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberPropertyForKey:", CFSTR("ProductID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");

    if (v12 > 2848)
    {
      switch(v12)
      {
        case 2849:
          goto LABEL_16;
        case 2850:
        case 2852:
          goto LABEL_11;
        case 2851:
          goto LABEL_14;
        default:
          goto LABEL_18;
      }
    }
    if (v12 > 2833)
    {
      if ((v12 - 2834) < 2)
      {
LABEL_14:
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_215181000, v17, OS_LOG_TYPE_DEFAULT, "recognized series X controller", v20, 2u);
          }

        }
        v34 = 1;
        v13 = 3;
        goto LABEL_20;
      }
    }
    else
    {
      if (v12 == 2818 || v12 == 2821)
      {
LABEL_11:
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_215181000, v16, OS_LOG_TYPE_DEFAULT, "recognized elite controller", v20, 2u);
          }

        }
        v13 = 1;
        goto LABEL_20;
      }
      if (v12 == 2828)
      {
LABEL_16:
        if (gc_isInternalBuild())
        {
          getGCLogger();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v20 = 0;
            _os_log_impl(&dword_215181000, v18, OS_LOG_TYPE_DEFAULT, "recognized adaptive controller", v20, 2u);
          }

        }
        v13 = 2;
        goto LABEL_20;
      }
    }
LABEL_18:
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_215181000, v19, OS_LOG_TYPE_DEFAULT, "recognized standard controller", v20, 2u);
      }

    }
    v13 = 0;
LABEL_20:
    v7->_type = v13;
    -[GCXboxGamepad initializeExtraControllerElements](v7, "initializeExtraControllerElements");
  }
  for (j = 0; j != 1584; j += 72)
    __destructor_8_s0_s48_s56_s64((id *)((char *)v22 + j));

  return v7;
}

- (GCXboxGamepad)initWithIdentifier:(id)a3
{
  GCXboxGamepad *v3;
  GCXboxGamepad *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GCXboxGamepad;
  v3 = -[GCExtendedGamepad initWithIdentifier:](&v6, sel_initWithIdentifier_, a3);
  v4 = v3;
  if (v3)
    -[GCXboxGamepad initializeExtraControllerElements](v3, "initializeExtraControllerElements");
  return v4;
}

- (GCXboxGamepad)initWithCoder:(id)a3
{
  id v4;
  GCXboxGamepad *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GCXboxGamepad;
  v5 = -[GCExtendedGamepad initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("GCXboxGamepadType"));
    -[GCXboxGamepad initializeExtraControllerElements](v5, "initializeExtraControllerElements");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GCXboxGamepad;
  v4 = a3;
  -[GCExtendedGamepad encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", +[GCXboxGamepad version](GCXboxGamepad, "version", v5.receiver, v5.super_class), CFSTR("version"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("GCXboxGamepadType"));

}

- (void)initializeExtraControllerElements
{
  GCControllerButtonInput *v3;
  GCControllerButtonInput *paddleButton1;
  GCControllerButtonInput *v5;
  GCControllerButtonInput *paddleButton2;
  GCControllerButtonInput *v7;
  GCControllerButtonInput *paddleButton3;
  GCControllerButtonInput *v9;
  GCControllerButtonInput *paddleButton4;
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
  __CFString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  __int16 v39;
  char v40;
  const __CFString *v41;
  const __CFString *v42;
  uint64_t v43;
  __CFString *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  __int16 v50;
  char v51;
  const __CFString *v52;
  const __CFString *v53;
  uint64_t v54;
  __CFString *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  __int16 v61;
  char v62;
  const __CFString *v63;
  const __CFString *v64;
  uint64_t v65;
  __CFString *v66;
  __int16 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  __int16 v72;
  char v73;
  const __CFString *v74;
  const __CFString *v75;
  uint64_t v76;

  if (self->_type == 1)
  {
    v66 = CFSTR("Paddle 1");
    v67 = 257;
    v69 = 0;
    v70 = 0;
    v68 = 25;
    v71 = 1;
    v72 = 1;
    v73 = 0;
    v74 = CFSTR("1.circle");
    v75 = CFSTR("XBOX_BUTTON_PADDLE_1");
    v76 = 0;
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v66);
    v3 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
    paddleButton1 = self->_paddleButton1;
    self->_paddleButton1 = v3;

    v55 = CFSTR("Paddle 2");
    v56 = 257;
    v58 = 0;
    v59 = 0;
    v57 = 26;
    v60 = 1;
    v61 = 1;
    v62 = 0;
    v63 = CFSTR("2.circle");
    v64 = CFSTR("XBOX_BUTTON_PADDLE_2");
    v65 = 0;
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v55);
    v5 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
    paddleButton2 = self->_paddleButton2;
    self->_paddleButton2 = v5;

    v44 = CFSTR("Paddle 3");
    v45 = 257;
    v47 = 0;
    v48 = 0;
    v46 = 27;
    v49 = 1;
    v50 = 1;
    v51 = 0;
    v52 = CFSTR("3.circle");
    v53 = CFSTR("XBOX_BUTTON_PADDLE_3");
    v54 = 0;
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v44);
    v7 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
    paddleButton3 = self->_paddleButton3;
    self->_paddleButton3 = v7;

    v33 = CFSTR("Paddle 4");
    v34 = 257;
    v36 = 0;
    v37 = 0;
    v35 = 28;
    v38 = 1;
    v39 = 1;
    v40 = 0;
    v41 = CFSTR("4.circle");
    v42 = CFSTR("XBOX_BUTTON_PADDLE_4");
    v43 = 0;
    -[GCPhysicalInputProfile _buttonWithInfo:](self, "_buttonWithInfo:", &v33);
    v9 = (GCControllerButtonInput *)objc_claimAutoreleasedReturnValue();
    paddleButton4 = self->_paddleButton4;
    self->_paddleButton4 = v9;

  }
  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUnmappedSfSymbolsName:", CFSTR("lt.rectangle.roundedtop"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUnmappedSfSymbolsName:", CFSTR("rt.rectangle.roundedtop"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUnmappedSfSymbolsName:", CFSTR("lb.rectangle.roundedbottom"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUnmappedSfSymbolsName:", CFSTR("rb.rectangle.roundedbottom"));

  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUnmappedSfSymbolsName:", CFSTR("logo.xbox"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setUnmappedSfSymbolsName:", CFSTR("rectangle.fill.on.rectangle.fill.circle"));

  -[GCExtendedGamepad buttonHome](self, "buttonHome");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_HOME"));

  -[GCExtendedGamepad buttonOptions](self, "buttonOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_OPTIONS"));

  -[GCExtendedGamepad buttonMenu](self, "buttonMenu");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_MENU"));

  -[GCExtendedGamepad dpad](self, "dpad");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_DIRECTION_PAD"));

  -[GCExtendedGamepad buttonA](self, "buttonA");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_A"));

  -[GCExtendedGamepad buttonB](self, "buttonB");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_B"));

  -[GCExtendedGamepad buttonX](self, "buttonX");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_X"));

  -[GCExtendedGamepad buttonY](self, "buttonY");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_Y"));

  -[GCExtendedGamepad leftShoulder](self, "leftShoulder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_LEFT_SHOULDER"));

  -[GCExtendedGamepad rightShoulder](self, "rightShoulder");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_RIGHT_SHOULDER"));

  -[GCExtendedGamepad leftTrigger](self, "leftTrigger");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_LEFT_TRIGGER"));

  -[GCExtendedGamepad rightTrigger](self, "rightTrigger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_RIGHT_TRIGGER"));

  -[GCExtendedGamepad leftThumbstick](self, "leftThumbstick");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstick](self, "rightThumbstick");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_RIGHT_THUMBSTICK"));

  -[GCExtendedGamepad leftThumbstickButton](self, "leftThumbstickButton");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_LEFT_THUMBSTICK"));

  -[GCExtendedGamepad rightThumbstickButton](self, "rightThumbstickButton");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setUnmappedNameLocalizationKey:", CFSTR("XBOX_BUTTON_RIGHT_THUMBSTICK"));

}

- (GCControllerButtonInput)paddleButton1
{
  return self->_paddleButton1;
}

- (GCControllerButtonInput)paddleButton2
{
  return self->_paddleButton2;
}

- (GCControllerButtonInput)paddleButton3
{
  return self->_paddleButton3;
}

- (GCControllerButtonInput)paddleButton4
{
  return self->_paddleButton4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddleButton4, 0);
  objc_storeStrong((id *)&self->_paddleButton3, 0);
  objc_storeStrong((id *)&self->_paddleButton2, 0);
  objc_storeStrong((id *)&self->_paddleButton1, 0);
}

@end
