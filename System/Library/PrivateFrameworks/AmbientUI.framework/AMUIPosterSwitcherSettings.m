@implementation AMUIPosterSwitcherSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUIPosterSwitcherSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  self->_exitingCardBehaviorScaleDownOnly = 1;
  self->_verticalExitingCardTargetScale = 0.884615362;
  self->_horizontalExitingCardTargetScale = 0.61;
  self->_exitingCardTargetOpacity = 0.0;
  self->_verticalSwitcherCircular = 0;
  self->_horizontalSwitcherCircular = 0;
  self->_verticalScootch = 0.0;
  self->_forwardTimeFadeoutTargetProgress = 0.3;
  self->_reverseTimeFadeoutTargetProgress = 0.05;
  self->_chromeFadeoutTargetProgress = 0.05;
  self->_labelFadeinTargetProgress = 0.05;
  self->_useFallbackTitleAndSymbol = 0;
  self->_photoSymbolHugsEdge = 1;
  self->_horizontalScaleDampingRatio = 1.0;
  self->_horizontalScaleResponse = 0.35;
  self->_verticalScaleDampingRatio = 1.0;
  self->_verticalScaleResponse = 0.35;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  void *v54;
  _QWORD v55[2];
  _QWORD v56[4];
  _QWORD v57[2];
  _QWORD v58[11];

  v58[9] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Scale Down Only"), CFSTR("exitingCardBehaviorScaleDownOnly"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Switching Target Scale"), CFSTR("verticalExitingCardTargetScale"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Switching Target Scale"), CFSTR("horizontalExitingCardTargetScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minValue:maxValue:", 0.0, 1.0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Target Opacity"), CFSTR("exitingCardTargetOpacity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 1.0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Scale Damping Ratio"), CFSTR("horizontalScaleDampingRatio"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minValue:maxValue:", 0.0, 2.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Scale Response"), CFSTR("horizontalScaleResponse"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.0, 2.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Scale Damping Ratio"), CFSTR("verticalScaleDampingRatio"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 2.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Scale Response"), CFSTR("verticalScaleResponse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 2.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Scootch"), CFSTR("verticalScootch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", 0.0, 200.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BE7B338];
  v58[0] = v52;
  v58[1] = v51;
  v58[2] = v50;
  v58[3] = v49;
  v58[4] = v48;
  v58[5] = v47;
  v58[6] = v46;
  v58[7] = v45;
  v58[8] = v44;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:title:", v11, CFSTR("Outgoing Card Transitions"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Circular - Vertical"), CFSTR("verticalSwitcherCircular"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Circular - Horizontal"), CFSTR("horizontalSwitcherCircular"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BE7B338];
  v57[0] = v43;
  v57[1] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, CFSTR("Scrolling Behavior"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Forward Time Fadeout"), CFSTR("forwardTimeFadeoutTargetProgress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "minValue:maxValue:", 0.0, 0.5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Reverse Time Fadeout"), CFSTR("reverseTimeFadeoutTargetProgress"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minValue:maxValue:", 0.0, 0.25);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Chrome Fadeout"), CFSTR("chromeFadeoutTargetProgress"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "minValue:maxValue:", 0.0, 0.25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B380], "rowWithTitle:valueKeyPath:", CFSTR("Label Fadein"), CFSTR("labelFadeinTargetProgress"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "minValue:maxValue:", 0.0, 0.25);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x24BE7B338];
  v56[0] = v40;
  v56[1] = v39;
  v56[2] = v38;
  v56[3] = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v20, CFSTR("Transition Target Progresses"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Use Fallback Title When Unavailable"), CFSTR("useFallbackTitleAndSymbol"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE7B388], "rowWithTitle:valueKeyPath:", CFSTR("Symbols Hug Screen Edge"), CFSTR("photoSymbolHugsEdge"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BE7B338];
  v55[0] = v22;
  v55[1] = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sectionWithRows:title:", v25, CFSTR("Photo Labels"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x24BE7B300];
  objc_msgSend(MEMORY[0x24BE7B358], "actionWithSettingsKeyPath:", 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "rowWithTitle:action:", CFSTR("Restore Defaults"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x24BE7B338];
  v54 = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BE7B338];
  v53[0] = v12;
  v53[1] = v41;
  v53[2] = v21;
  v53[3] = v26;
  v53[4] = v32;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "moduleWithTitle:contents:", CFSTR("Quick Switching"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (BOOL)exitingCardBehaviorScaleDownOnly
{
  return self->_exitingCardBehaviorScaleDownOnly;
}

- (void)setExitingCardBehaviorScaleDownOnly:(BOOL)a3
{
  self->_exitingCardBehaviorScaleDownOnly = a3;
}

- (double)verticalExitingCardTargetScale
{
  return self->_verticalExitingCardTargetScale;
}

- (void)setVerticalExitingCardTargetScale:(double)a3
{
  self->_verticalExitingCardTargetScale = a3;
}

- (double)horizontalExitingCardTargetScale
{
  return self->_horizontalExitingCardTargetScale;
}

- (void)setHorizontalExitingCardTargetScale:(double)a3
{
  self->_horizontalExitingCardTargetScale = a3;
}

- (double)exitingCardTargetOpacity
{
  return self->_exitingCardTargetOpacity;
}

- (void)setExitingCardTargetOpacity:(double)a3
{
  self->_exitingCardTargetOpacity = a3;
}

- (BOOL)verticalSwitcherCircular
{
  return self->_verticalSwitcherCircular;
}

- (void)setVerticalSwitcherCircular:(BOOL)a3
{
  self->_verticalSwitcherCircular = a3;
}

- (BOOL)horizontalSwitcherCircular
{
  return self->_horizontalSwitcherCircular;
}

- (void)setHorizontalSwitcherCircular:(BOOL)a3
{
  self->_horizontalSwitcherCircular = a3;
}

- (double)verticalScootch
{
  return self->_verticalScootch;
}

- (void)setVerticalScootch:(double)a3
{
  self->_verticalScootch = a3;
}

- (double)forwardTimeFadeoutTargetProgress
{
  return self->_forwardTimeFadeoutTargetProgress;
}

- (void)setForwardTimeFadeoutTargetProgress:(double)a3
{
  self->_forwardTimeFadeoutTargetProgress = a3;
}

- (double)reverseTimeFadeoutTargetProgress
{
  return self->_reverseTimeFadeoutTargetProgress;
}

- (void)setReverseTimeFadeoutTargetProgress:(double)a3
{
  self->_reverseTimeFadeoutTargetProgress = a3;
}

- (double)chromeFadeoutTargetProgress
{
  return self->_chromeFadeoutTargetProgress;
}

- (void)setChromeFadeoutTargetProgress:(double)a3
{
  self->_chromeFadeoutTargetProgress = a3;
}

- (double)labelFadeinTargetProgress
{
  return self->_labelFadeinTargetProgress;
}

- (void)setLabelFadeinTargetProgress:(double)a3
{
  self->_labelFadeinTargetProgress = a3;
}

- (BOOL)useFallbackTitleAndSymbol
{
  return self->_useFallbackTitleAndSymbol;
}

- (void)setUseFallbackTitleAndSymbol:(BOOL)a3
{
  self->_useFallbackTitleAndSymbol = a3;
}

- (BOOL)photoSymbolHugsEdge
{
  return self->_photoSymbolHugsEdge;
}

- (void)setPhotoSymbolHugsEdge:(BOOL)a3
{
  self->_photoSymbolHugsEdge = a3;
}

- (double)horizontalScaleDampingRatio
{
  return self->_horizontalScaleDampingRatio;
}

- (void)setHorizontalScaleDampingRatio:(double)a3
{
  self->_horizontalScaleDampingRatio = a3;
}

- (double)horizontalScaleResponse
{
  return self->_horizontalScaleResponse;
}

- (void)setHorizontalScaleResponse:(double)a3
{
  self->_horizontalScaleResponse = a3;
}

- (double)verticalScaleDampingRatio
{
  return self->_verticalScaleDampingRatio;
}

- (void)setVerticalScaleDampingRatio:(double)a3
{
  self->_verticalScaleDampingRatio = a3;
}

- (double)verticalScaleResponse
{
  return self->_verticalScaleResponse;
}

- (void)setVerticalScaleResponse:(double)a3
{
  self->_verticalScaleResponse = a3;
}

@end
