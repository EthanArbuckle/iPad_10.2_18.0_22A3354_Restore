@implementation CCUIControlResizingSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIControlResizingSettings;
  -[PTSettings setDefaultValues](&v7, sel_setDefaultValues);
  -[CCUIControlResizingSettings resizeHandleSettings](self, "resizeHandleSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[CCUIControlResizingSettings smallControlsResizeHandleSettings](self, "smallControlsResizeHandleSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultValues");

  -[CCUIControlResizingSettings smallControlsResizeHandleSettings](self, "smallControlsResizeHandleSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResizeHandleUsesTruncatedSectorHitArea:", 1);

  -[CCUIControlResizingSettings animationSettings](self, "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDefaultValues");

  -[CCUIControlResizingSettings setOversizeRubberbandingRange:](self, "setOversizeRubberbandingRange:", 20.0);
  -[CCUIControlResizingSettings setUndersizeRubberbandingRange:](self, "setUndersizeRubberbandingRange:", 10.0);
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  void *v33;
  _QWORD v34[2];
  void *v35;
  void *v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Resize Handles"), CFSTR("resizeHandleSettings"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v37[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("1x1 Resize Handles"), CFSTR("smallControlsResizeHandleSettings"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v36 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Resize Animation"), CFSTR("animationSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D83078];
  v35 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Oversize Rubberband Range"), CFSTR("oversizeRubberbandingRange"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 100.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v11;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Undersize Rubberband Range"), CFSTR("undersizeRubberbandingRange"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 100.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:action:", CFSTR("Restore Defaults"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v33 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x1E0D83078];
  v32[0] = v28;
  v32[1] = v27;
  v32[2] = v8;
  v32[3] = v16;
  v32[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "moduleWithTitle:contents:", CFSTR("Resizing"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (SBHIconResizingSettings)resizeHandleSettings
{
  return self->_resizeHandleSettings;
}

- (void)setResizeHandleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_resizeHandleSettings, a3);
}

- (SBHIconResizingSettings)smallControlsResizeHandleSettings
{
  return self->_smallControlsResizeHandleSettings;
}

- (void)setSmallControlsResizeHandleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_smallControlsResizeHandleSettings, a3);
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_animationSettings, a3);
}

- (double)oversizeRubberbandingRange
{
  return self->_oversizeRubberbandingRange;
}

- (void)setOversizeRubberbandingRange:(double)a3
{
  self->_oversizeRubberbandingRange = a3;
}

- (double)undersizeRubberbandingRange
{
  return self->_undersizeRubberbandingRange;
}

- (void)setUndersizeRubberbandingRange:(double)a3
{
  self->_undersizeRubberbandingRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_smallControlsResizeHandleSettings, 0);
  objc_storeStrong((id *)&self->_resizeHandleSettings, 0);
}

@end
