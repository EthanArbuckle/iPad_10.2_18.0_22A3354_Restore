@implementation MTLumaDodgePillSettings

+ (id)sharedInstance
{
  return +[MTLumaDodgePillDomain rootSettings](MTLumaDodgePillDomain, "rootSettings");
}

- (double)edgeSpacing
{
  return self->_edgeSpacing;
}

- (double)brightLumaThreshold
{
  return self->_brightLumaThreshold;
}

- (double)darkLumaThreshold
{
  return self->_darkLumaThreshold;
}

- (double)initialLumaThreshold
{
  return self->_initialLumaThreshold;
}

- (double)height
{
  return self->_height;
}

- (double)minWidth
{
  return self->_minWidth;
}

- (double)colorAddWhiteness
{
  return self->_colorAddWhiteness;
}

- (MTLumaDodgePillStyleSettings)noneSettings
{
  return self->_noneSettings;
}

- (MTLumaDodgePillStyleSettings)graySettings
{
  return self->_graySettings;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)cornerMask
{
  return self->_cornerMask;
}

- (MTLumaDodgePillStyleSettings)blackSettings
{
  return self->_blackSettings;
}

- (MTLumaDodgePillStyleSettings)whiteSettings
{
  return self->_whiteSettings;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (MTLumaDodgePillStyleSettings)thinSettings
{
  return self->_thinSettings;
}

- (void)setDefaultValues
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  double Height;
  double v19;
  void *v20;
  int v21;
  double v22;
  double v26;
  MTLumaDodgePillStyleSettings *v27;
  MTLumaDodgePillStyleSettings *v28;
  MTLumaDodgePillStyleSettings *v29;
  MTLumaDodgePillStyleSettings *v30;
  MTLumaDodgePillStyleSettings *v31;

  if (_RunningInSpringBoard___once != -1)
    dispatch_once(&_RunningInSpringBoard___once, &__block_literal_global_207);
  if (_RunningInSpringBoard___result)
  {
    _MainScreenReferenceBounds();
    v4 = v3;
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v4 = v8;
    v6 = v9;

  }
  -[MTLumaDodgePillSettings setMinWidth:](self, "setMinWidth:", round(v4 * 0.3574));
  -[MTLumaDodgePillSettings setMaxWidth:](self, "setMaxWidth:", round(v6 * 0.2571));
  -[MTLumaDodgePillSettings setHeight:](self, "setHeight:", 5.0);
  -[MTLumaDodgePillSettings setEdgeSpacing:](self, "setEdgeSpacing:", 8.0);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == (void *)1)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom") == 1)
    {
      if (_RunningInSpringBoard___once != -1)
        dispatch_once(&_RunningInSpringBoard___once, &__block_literal_global_207);
      v13 = _RunningInSpringBoard___result;
      if (_RunningInSpringBoard___result)
      {
        v14 = _MainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_referenceBounds");
      }
      Height = CGRectGetHeight(*(CGRect *)&v14);
      if (!v13)

      if (Height > 1210.0)
      {
        -[MTLumaDodgePillSettings setMinWidth:](self, "setMinWidth:", 315.0);
        v19 = 345.0;
        goto LABEL_29;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "userInterfaceIdiom") != 1)
    {

LABEL_30:
      -[MTLumaDodgePillSettings setHeight:](self, "setHeight:", 5.5);
      -[MTLumaDodgePillSettings setEdgeSpacing:](self, "setEdgeSpacing:", 7.5);
      goto LABEL_31;
    }
    if (_RunningInSpringBoard___once != -1)
      dispatch_once(&_RunningInSpringBoard___once, &__block_literal_global_207);
    v21 = _RunningInSpringBoard___result;
    if (_RunningInSpringBoard___result)
    {
      v22 = _MainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_referenceBounds");
    }
    v26 = CGRectGetHeight(*(CGRect *)&v22);
    if (!v21)

    if (v26 <= 1024.0)
      goto LABEL_30;
    -[MTLumaDodgePillSettings setMinWidth:](self, "setMinWidth:", 273.0);
    v19 = 315.0;
LABEL_29:
    -[MTLumaDodgePillSettings setMaxWidth:](self, "setMaxWidth:", v19);
    goto LABEL_30;
  }
LABEL_31:
  -[MTLumaDodgePillSettings setColorAddWhiteness:](self, "setColorAddWhiteness:", 0.71);
  -[MTLumaDodgePillSettings setBrightLumaThreshold:](self, "setBrightLumaThreshold:", 0.7);
  -[MTLumaDodgePillSettings setDarkLumaThreshold:](self, "setDarkLumaThreshold:", 0.37);
  -[MTLumaDodgePillSettings setInitialLumaThreshold:](self, "setInitialLumaThreshold:", 0.5);
  -[MTLumaDodgePillSettings setCornerRadius:](self, "setCornerRadius:", 4.0);
  -[MTLumaDodgePillSettings setCornerMask:](self, "setCornerMask:", 0);
  v27 = -[PTSettings initWithDefaultValues]([MTLumaDodgePillStyleSettings alloc], "initWithDefaultValues");
  -[MTLumaDodgePillSettings setNoneSettings:](self, "setNoneSettings:", v27);

  v31 = -[PTSettings initWithDefaultValues]([MTLumaDodgePillStyleSettings alloc], "initWithDefaultValues");
  -[MTLumaDodgePillStyleSettings setColorAddOpacity:](v31, "setColorAddOpacity:", 0.525);
  -[MTLumaDodgePillStyleSettings setLumaMapPlusColorOpacity:](v31, "setLumaMapPlusColorOpacity:", 0.31);
  -[MTLumaDodgePillStyleSettings setOverlayBlendOpacity:](v31, "setOverlayBlendOpacity:", 0.4);
  -[MTLumaDodgePillStyleSettings setBlur:](v31, "setBlur:", 10.0);
  -[MTLumaDodgePillStyleSettings setBrightness:](v31, "setBrightness:", 0.06);
  -[MTLumaDodgePillStyleSettings setSaturation:](v31, "setSaturation:", 1.15);
  -[MTLumaDodgePillSettings setThinSettings:](self, "setThinSettings:", v31);
  v28 = -[PTSettings initWithDefaultValues]([MTLumaDodgePillStyleSettings alloc], "initWithDefaultValues");
  -[MTLumaDodgePillStyleSettings setColorAddOpacity:](v28, "setColorAddOpacity:", 0.5);
  -[MTLumaDodgePillStyleSettings setLumaMapPlusColorOpacity:](v28, "setLumaMapPlusColorOpacity:", 1.0);
  -[MTLumaDodgePillStyleSettings setBlur:](v28, "setBlur:", 10.0);
  -[MTLumaDodgePillSettings setGraySettings:](self, "setGraySettings:", v28);
  v29 = -[PTSettings initWithDefaultValues]([MTLumaDodgePillStyleSettings alloc], "initWithDefaultValues");
  -[MTLumaDodgePillStyleSettings setLumaMapPlusColorOpacity:](v29, "setLumaMapPlusColorOpacity:", 1.0);
  -[MTLumaDodgePillStyleSettings setBlur:](v29, "setBlur:", 10.0);
  -[MTLumaDodgePillSettings setBlackSettings:](self, "setBlackSettings:", v29);
  v30 = -[PTSettings initWithDefaultValues]([MTLumaDodgePillStyleSettings alloc], "initWithDefaultValues");
  -[MTLumaDodgePillStyleSettings setColorAddOpacity:](v30, "setColorAddOpacity:", 1.0);
  -[MTLumaDodgePillStyleSettings setLumaMapPlusColorOpacity:](v30, "setLumaMapPlusColorOpacity:", 1.0);
  -[MTLumaDodgePillStyleSettings setBlur:](v30, "setBlur:", 10.0);
  -[MTLumaDodgePillSettings setWhiteSettings:](self, "setWhiteSettings:", v30);

}

+ (id)settingsControllerModule
{
  void *v2;
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
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[2];
  _QWORD v43[12];
  _QWORD v44[10];

  v44[8] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Narrow Width"), CFSTR("minWidth"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "valueValidator:", &__block_literal_global_0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v38;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("minWidth"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "minValue:maxValue:", 1.0, 300.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "valueValidator:", &__block_literal_global_0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v32;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Wide Width"), CFSTR("maxWidth"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "valueValidator:", &__block_literal_global_68);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v27;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("maxWidth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 1.0, 300.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueValidator:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v44[3] = v4;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Height"), CFSTR("height"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44[4] = v5;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("height"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 1.0, 30.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v44[5] = v7;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Edge Spacing"), CFSTR("edgeSpacing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44[6] = v8;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("edgeSpacing"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 30.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B338], "sectionWithRows:title:", v31, CFSTR("Geometry"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("+Color: Whiteness"), CFSTR("colorAddWhiteness"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v39;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("colorAddWhiteness"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "minValue:maxValue:", 0.0, 1.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v35;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Luma Threshold: Bright"), CFSTR("brightLumaThreshold"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v33;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("brightLumaThreshold"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "minValue:maxValue:", 0.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v28;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Luma Threshold: Dark"), CFSTR("darkLumaThreshold"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v26;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("darkLumaThreshold"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minValue:maxValue:", 0.0, 1.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v12;
  objc_msgSend(MEMORY[0x24BE7B320], "rowWithTitle:valueKeyPath:", CFSTR("Luma Threshold: Initial"), CFSTR("initialLumaThreshold"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v13;
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", 0, CFSTR("initialLumaThreshold"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minValue:maxValue:", 0.0, 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v15;
  objc_msgSend(MEMORY[0x24BE7B318], "rowWithTitle:childSettingsKeyPath:", CFSTR("Thin"), CFSTR("thinSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v16;
  objc_msgSend(MEMORY[0x24BE7B318], "rowWithTitle:childSettingsKeyPath:", CFSTR("Gray"), CFSTR("graySettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v17;
  objc_msgSend(MEMORY[0x24BE7B318], "rowWithTitle:childSettingsKeyPath:", CFSTR("Black"), CFSTR("blackSettings"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v18;
  objc_msgSend(MEMORY[0x24BE7B318], "rowWithTitle:childSettingsKeyPath:", CFSTR("White"), CFSTR("whiteSettings"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B338], "sectionWithRows:title:", v20, CFSTR("Mode Parameters"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x24BE7B338];
  v42[0] = v41;
  v42[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __51__MTLumaDodgePillSettings_settingsControllerModule__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;

  v4 = a2;
  objc_msgSend(a3, "maxWidth");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  if (v7 <= v6)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

id __51__MTLumaDodgePillSettings_settingsControllerModule__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;

  v4 = a2;
  objc_msgSend(a3, "minWidth");
  v6 = v5;
  objc_msgSend(v4, "doubleValue");
  if (v7 >= v6)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)setMinWidth:(double)a3
{
  self->_minWidth = a3;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (void)setEdgeSpacing:(double)a3
{
  self->_edgeSpacing = a3;
}

- (void)setColorAddWhiteness:(double)a3
{
  self->_colorAddWhiteness = a3;
}

- (void)setBrightLumaThreshold:(double)a3
{
  self->_brightLumaThreshold = a3;
}

- (void)setDarkLumaThreshold:(double)a3
{
  self->_darkLumaThreshold = a3;
}

- (void)setInitialLumaThreshold:(double)a3
{
  self->_initialLumaThreshold = a3;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (void)setCornerMask:(int64_t)a3
{
  self->_cornerMask = a3;
}

- (void)setNoneSettings:(id)a3
{
  objc_storeStrong((id *)&self->_noneSettings, a3);
}

- (void)setThinSettings:(id)a3
{
  objc_storeStrong((id *)&self->_thinSettings, a3);
}

- (void)setGraySettings:(id)a3
{
  objc_storeStrong((id *)&self->_graySettings, a3);
}

- (void)setBlackSettings:(id)a3
{
  objc_storeStrong((id *)&self->_blackSettings, a3);
}

- (void)setWhiteSettings:(id)a3
{
  objc_storeStrong((id *)&self->_whiteSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteSettings, 0);
  objc_storeStrong((id *)&self->_blackSettings, 0);
  objc_storeStrong((id *)&self->_graySettings, 0);
  objc_storeStrong((id *)&self->_thinSettings, 0);
  objc_storeStrong((id *)&self->_noneSettings, 0);
}

@end
