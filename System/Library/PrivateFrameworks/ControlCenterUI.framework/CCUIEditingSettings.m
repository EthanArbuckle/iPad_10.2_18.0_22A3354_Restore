@implementation CCUIEditingSettings

- (void)setDefaultValues
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIEditingSettings;
  -[PTSettings setDefaultValues](&v4, sel_setDefaultValues);
  -[CCUIEditingSettings setPulsingBorderWidth:](self, "setPulsingBorderWidth:", 3.0);
  -[CCUIEditingSettings setPulsingBorderFadeDuration:](self, "setPulsingBorderFadeDuration:", 0.3);
  -[CCUIEditingSettings setPulsingBorderPulseDuration:](self, "setPulsingBorderPulseDuration:", 0.7);
  -[CCUIEditingSettings setPulsingBorderMinAlpha:](self, "setPulsingBorderMinAlpha:", 0.08);
  -[CCUIEditingSettings setPulsingBorderMaxAlpha:](self, "setPulsingBorderMaxAlpha:", 0.3);
  -[CCUIEditingSettings resizingSettings](self, "resizingSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[3];
  void *v35;
  void *v36;
  _QWORD v37[6];

  v37[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Border Width"), CFSTR("pulsingBorderWidth"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 10.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Fade Duration"), CFSTR("pulsingBorderFadeDuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 2.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "precision:", 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Pulse Duration"), CFSTR("pulsingBorderPulseDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 2);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Min Alpha"), CFSTR("pulsingBorderMinAlpha"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "precision:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Max Alpha"), CFSTR("pulsingBorderMaxAlpha"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precision:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v37[0] = v33;
  v37[1] = v32;
  v37[2] = v31;
  v37[3] = v30;
  v37[4] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, CFSTR("Pulsing Border"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Resizing"), CFSTR("resizingSettings"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D83078];
  v36 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sectionWithRows:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:action:", CFSTR("Restore Defaults"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v35 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sectionWithRows:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v34[0] = v15;
  v34[1] = v19;
  v34[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moduleWithTitle:contents:", CFSTR("Editing"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (double)pulsingBorderWidth
{
  return self->_pulsingBorderWidth;
}

- (void)setPulsingBorderWidth:(double)a3
{
  self->_pulsingBorderWidth = a3;
}

- (double)pulsingBorderFadeDuration
{
  return self->_pulsingBorderFadeDuration;
}

- (void)setPulsingBorderFadeDuration:(double)a3
{
  self->_pulsingBorderFadeDuration = a3;
}

- (double)pulsingBorderPulseDuration
{
  return self->_pulsingBorderPulseDuration;
}

- (void)setPulsingBorderPulseDuration:(double)a3
{
  self->_pulsingBorderPulseDuration = a3;
}

- (double)pulsingBorderMinAlpha
{
  return self->_pulsingBorderMinAlpha;
}

- (void)setPulsingBorderMinAlpha:(double)a3
{
  self->_pulsingBorderMinAlpha = a3;
}

- (double)pulsingBorderMaxAlpha
{
  return self->_pulsingBorderMaxAlpha;
}

- (void)setPulsingBorderMaxAlpha:(double)a3
{
  self->_pulsingBorderMaxAlpha = a3;
}

- (CCUIControlResizingSettings)resizingSettings
{
  return self->_resizingSettings;
}

- (void)setResizingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_resizingSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resizingSettings, 0);
}

@end
