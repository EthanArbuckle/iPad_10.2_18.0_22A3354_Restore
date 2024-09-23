@implementation AXLogColorizer

+ (id)defaultColorizer
{
  if (defaultColorizer_onceToken != -1)
    dispatch_once(&defaultColorizer_onceToken, &__block_literal_global);
  return (id)defaultColorizer__shared;
}

void __34__AXLogColorizer_defaultColorizer__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXLogColorizer _initAndManageWithSettings:]([AXLogColorizer alloc], "_initAndManageWithSettings:", 1);
  v1 = (void *)defaultColorizer__shared;
  defaultColorizer__shared = (uint64_t)v0;

}

+ (AXLogColorTheme)defaultLightColorsTheme
{
  *retstr = *(AXLogColorTheme *)ymmword_18EC6B3C0;
  return result;
}

+ (AXLogColorTheme)defaultDarkColorsTheme
{
  *retstr = *(AXLogColorTheme *)ymmword_18EC6B3E0;
  return result;
}

+ (char)ansiColorSeqForAXLogColor:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xD)
    return "\x1B[30m";
  else
    return off_1E28C1CE8[a3 - 1];
}

+ (id)coloredString:(id)a3 withColor:(int64_t)a4
{
  id v5;
  char *v6;
  void *v7;

  v5 = a3;
  v6 = +[AXLogColorizer ansiColorSeqForAXLogColor:](AXLogColorizer, "ansiColorSeqForAXLogColor:", a4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%@%s"), v6, v5, "\x1B[0m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)colorizeStringIfEnabled:(id)a3 withColor:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;

  v5 = a3;
  +[AXLogColorizer defaultColorizer](AXLogColorizer, "defaultColorizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if (v7)
  {
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v5, a4);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  return v5;
}

- (id)_initAndManageWithSettings:(BOOL)a3
{
  _BOOL8 v3;
  AXLogColorizer *v4;
  AXLogColorizer *v5;
  void *v6;
  AXLogColorizer *v7;
  AXLogColorizer *v8;
  _QWORD v10[9];
  _QWORD v11[4];
  AXLogColorizer *v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXLogColorizer;
  v4 = -[AXLogColorizer init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    -[AXLogColorizer setManagedBySettings:](v4, "setManagedBySettings:", v3);
    if (v3)
    {
      objc_msgSend(getAXSettingsClass(), "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __45__AXLogColorizer__initAndManageWithSettings___block_invoke;
      v11[3] = &unk_1E28C1C88;
      v7 = v5;
      v12 = v7;
      objc_msgSend(v6, "registerUpdateBlock:forRetrieveSelector:withListener:", v11, sel_internalLoggingColorTheme, v7);

      -[AXLogColorizer _updateSettingsFromUserPrefs](v7, "_updateSettingsFromUserPrefs");
    }
    else
    {
      -[AXLogColorizer setActive:](v5, "setActive:", 1);
      +[AXLogColorizer defaultLightColorsTheme](AXLogColorizer, "defaultLightColorsTheme");
      *(_OWORD *)v10 = *(_OWORD *)&v10[5];
      *(_OWORD *)&v10[2] = *(_OWORD *)&v10[7];
      -[AXLogColorizer setColorTheme:](v5, "setColorTheme:", v10);
      -[AXLogColorizer setPreferDarkColors:](v5, "setPreferDarkColors:", 0);
    }
    v8 = v5;
  }

  return v5;
}

uint64_t __45__AXLogColorizer__initAndManageWithSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSettingsFromUserPrefs");
}

- (AXLogColorizer)init
{
  return (AXLogColorizer *)-[AXLogColorizer _initAndManageWithSettings:](self, "_initAndManageWithSettings:", 0);
}

- (void)_updateSettingsFromUserPrefs
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[4];
  _OWORD v12[4];

  objc_msgSend(getAXSettingsClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "internalLoggingColorTheme");

  if (v4 == 1)
  {
    -[AXLogColorizer setActive:](self, "setActive:", 1);
    +[AXLogColorizer defaultLightColorsTheme](AXLogColorizer, "defaultLightColorsTheme");
    v5 = 0;
    v11[0] = v11[2];
    v11[1] = v11[3];
    v6 = v11;
  }
  else if (v4 == 2)
  {
    v5 = 1;
    -[AXLogColorizer setActive:](self, "setActive:", 1);
    +[AXLogColorizer defaultDarkColorsTheme](AXLogColorizer, "defaultDarkColorsTheme");
    v12[0] = v12[2];
    v12[1] = v12[3];
    v6 = v12;
  }
  else
  {
    -[AXLogColorizer setActive:](self, "setActive:", 0);
    +[AXLogColorizer defaultLightColorsTheme](AXLogColorizer, "defaultLightColorsTheme");
    v5 = 0;
    v7 = v9;
    v8 = v10;
    v6 = &v7;
  }
  -[AXLogColorizer setColorTheme:](self, "setColorTheme:", v6, v7, v8);
  -[AXLogColorizer setPreferDarkColors:](self, "setPreferDarkColors:", v5);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXLogColorizer isActive](self, "isActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXLogColorizer isManagedBySettings](self, "isManagedBySettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AXLogColorizer preferDarkColors](self, "preferDarkColors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXLogColorizer:<%p>. active:%@ managed:%@ preferDarkColors:%@"), self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)errorString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    -[AXLogColorizer colorTheme](self, "colorTheme");
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)warningString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    -[AXLogColorizer colorTheme](self, "colorTheme");
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)infoString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    -[AXLogColorizer colorTheme](self, "colorTheme");
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)debugString:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    -[AXLogColorizer colorTheme](self, "colorTheme");
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)whiteOrBlackString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 0;
    else
      v5 = 14;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)greyString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;

  return v6;
}

- (id)redString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 2;
    else
      v5 = 3;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)greenString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 4;
    else
      v5 = 5;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)yellowString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 6;
    else
      v5 = 7;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)blueString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 8;
    else
      v5 = 9;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)magentaString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 10;
    else
      v5 = 11;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (id)cyanString:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v4 = a3;
  if (-[AXLogColorizer isActive](self, "isActive"))
  {
    if (-[AXLogColorizer preferDarkColors](self, "preferDarkColors"))
      v5 = 12;
    else
      v5 = 13;
    +[AXLogColorizer coloredString:withColor:](AXLogColorizer, "coloredString:withColor:", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (AXLogColorTheme)colorTheme
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].errorColor;
  *(_OWORD *)&retstr->errorColor = *(_OWORD *)&self->infoColor;
  *(_OWORD *)&retstr->infoColor = v3;
  return self;
}

- (void)setColorTheme:(AXLogColorTheme *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->infoColor;
  *(_OWORD *)&self->_colorTheme.errorColor = *(_OWORD *)&a3->errorColor;
  *(_OWORD *)&self->_colorTheme.infoColor = v3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isManagedBySettings
{
  return self->_managedBySettings;
}

- (void)setManagedBySettings:(BOOL)a3
{
  self->_managedBySettings = a3;
}

- (BOOL)preferDarkColors
{
  return self->_preferDarkColors;
}

- (void)setPreferDarkColors:(BOOL)a3
{
  self->_preferDarkColors = a3;
}

@end
