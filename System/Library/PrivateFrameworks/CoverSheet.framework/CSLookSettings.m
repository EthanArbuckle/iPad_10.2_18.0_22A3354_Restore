@implementation CSLookSettings

- (void)setDefaultValues
{
  -[CSLookSettings setUseSettingsDateTime:](self, "setUseSettingsDateTime:", 0);
  -[CSLookSettings setCustomizesDateTime:](self, "setCustomizesDateTime:", 1);
  -[CSLookSettings setSubtitleAboveTime:](self, "setSubtitleAboveTime:", 1);
  -[CSLookSettings setTimeFontSize:](self, "setTimeFontSize:", 80.0);
  -[CSLookSettings setTimeFontWeight:](self, "setTimeFontWeight:", *MEMORY[0x1E0CEB5D8]);
  -[CSLookSettings setTimeFontDesign:](self, "setTimeFontDesign:", *MEMORY[0x1E0CEB4F8]);
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
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[4];
  _QWORD v41[9];
  _QWORD v42[2];
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("useSettingsDateTime = YES"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Custom Values"), CFSTR("useSettingsDateTime"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Customizes Date/Time"), CFSTR("customizesDateTime"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Subtitle Above Time"), CFSTR("subtitleAboveTime"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v42[0] = v36;
  v42[1] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:condition:", v5, CFSTR("Layout"), v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Size"), CFSTR("timeFontSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "possibleValues:titles:", &unk_1E8E89DC0, &unk_1E8E89DD8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB610]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB600]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5E0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5F8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5D0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5D8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5C8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Weight"), CFSTR("timeFontWeight"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "possibleValues:titles:", v30, &unk_1E8E89DF0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = *MEMORY[0x1E0CEB4F8];
  v40[0] = *MEMORY[0x1E0CEB4E8];
  v40[1] = v18;
  v19 = *MEMORY[0x1E0CEB4F0];
  v40[2] = *MEMORY[0x1E0CEB500];
  v40[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Design"), CFSTR("timeFontDesign"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "possibleValues:titles:", v20, &unk_1E8E89E08);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v39[0] = v31;
  v39[1] = v17;
  v39[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:title:condition:", v24, CFSTR("Time Font"), v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v38[0] = v34;
  v38[1] = v33;
  v38[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moduleWithTitle:contents:", CFSTR("Look Around"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)customTimeFont
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:design:", self->_timeFontDesign, self->_timeFontSize, self->_timeFontWeight);
}

- (BOOL)useSettingsDateTime
{
  return self->_useSettingsDateTime;
}

- (void)setUseSettingsDateTime:(BOOL)a3
{
  self->_useSettingsDateTime = a3;
}

- (BOOL)customizesDateTime
{
  return self->_customizesDateTime;
}

- (void)setCustomizesDateTime:(BOOL)a3
{
  self->_customizesDateTime = a3;
}

- (BOOL)subtitleAboveTime
{
  return self->_subtitleAboveTime;
}

- (void)setSubtitleAboveTime:(BOOL)a3
{
  self->_subtitleAboveTime = a3;
}

- (double)timeFontSize
{
  return self->_timeFontSize;
}

- (void)setTimeFontSize:(double)a3
{
  self->_timeFontSize = a3;
}

- (double)timeFontWeight
{
  return self->_timeFontWeight;
}

- (void)setTimeFontWeight:(double)a3
{
  self->_timeFontWeight = a3;
}

- (NSString)timeFontDesign
{
  return self->_timeFontDesign;
}

- (void)setTimeFontDesign:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeFontDesign, 0);
}

@end
