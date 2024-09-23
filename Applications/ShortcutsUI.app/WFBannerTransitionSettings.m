@implementation WFBannerTransitionSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBannerTransitionSettings;
  -[WFBannerTransitionSettings setDefaultValues](&v3, "setDefaultValues");
  -[WFBannerTransitionSettings setHintDuration:](self, "setHintDuration:", 300.0);
  -[WFBannerTransitionSettings setHintAnimationResponse:](self, "setHintAnimationResponse:", 1.0);
  -[WFBannerTransitionSettings setHintAnimationTargetScale:](self, "setHintAnimationTargetScale:", 0.9);
  -[WFBannerTransitionSettings setPoofInScale:](self, "setPoofInScale:", 0.7);
  -[WFBannerTransitionSettings setPoofInScaleResponse:](self, "setPoofInScaleResponse:", 0.55);
  -[WFBannerTransitionSettings setPoofInScaleDamping:](self, "setPoofInScaleDamping:", 0.68);
  -[WFBannerTransitionSettings setPoofInBlurRadius:](self, "setPoofInBlurRadius:", 50.0);
  -[WFBannerTransitionSettings setPoofInBlurResponse:](self, "setPoofInBlurResponse:", 0.37);
  -[WFBannerTransitionSettings setPoofInAlphaResponse:](self, "setPoofInAlphaResponse:", 0.2);
  -[WFBannerTransitionSettings setPoofOutScale:](self, "setPoofOutScale:", 0.81);
  -[WFBannerTransitionSettings setPoofOutScaleResponse:](self, "setPoofOutScaleResponse:", 0.45);
  -[WFBannerTransitionSettings setPoofOutBlurRadius:](self, "setPoofOutBlurRadius:", 24.0);
  -[WFBannerTransitionSettings setPoofOutBlurResponse:](self, "setPoofOutBlurResponse:", 0.45);
  -[WFBannerTransitionSettings setPoofOutBlurDelay:](self, "setPoofOutBlurDelay:", 0.0);
  -[WFBannerTransitionSettings setPoofOutAlphaResponse:](self, "setPoofOutAlphaResponse:", 0.18);
  -[WFBannerTransitionSettings setPoofOutAlphaDelay:](self, "setPoofOutAlphaDelay:", 0.11);
  -[WFBannerTransitionSettings setDisableTransition:](self, "setDisableTransition:", 0);
}

- (double)hintDuration
{
  return self->_hintDuration;
}

- (void)setHintDuration:(double)a3
{
  self->_hintDuration = a3;
}

- (double)hintAnimationResponse
{
  return self->_hintAnimationResponse;
}

- (void)setHintAnimationResponse:(double)a3
{
  self->_hintAnimationResponse = a3;
}

- (double)hintAnimationTargetScale
{
  return self->_hintAnimationTargetScale;
}

- (void)setHintAnimationTargetScale:(double)a3
{
  self->_hintAnimationTargetScale = a3;
}

- (double)poofInScale
{
  return self->_poofInScale;
}

- (void)setPoofInScale:(double)a3
{
  self->_poofInScale = a3;
}

- (double)poofInScaleResponse
{
  return self->_poofInScaleResponse;
}

- (void)setPoofInScaleResponse:(double)a3
{
  self->_poofInScaleResponse = a3;
}

- (double)poofInScaleDamping
{
  return self->_poofInScaleDamping;
}

- (void)setPoofInScaleDamping:(double)a3
{
  self->_poofInScaleDamping = a3;
}

- (double)poofInBlurRadius
{
  return self->_poofInBlurRadius;
}

- (void)setPoofInBlurRadius:(double)a3
{
  self->_poofInBlurRadius = a3;
}

- (double)poofInBlurResponse
{
  return self->_poofInBlurResponse;
}

- (void)setPoofInBlurResponse:(double)a3
{
  self->_poofInBlurResponse = a3;
}

- (double)poofInAlphaResponse
{
  return self->_poofInAlphaResponse;
}

- (void)setPoofInAlphaResponse:(double)a3
{
  self->_poofInAlphaResponse = a3;
}

- (double)poofOutScale
{
  return self->_poofOutScale;
}

- (void)setPoofOutScale:(double)a3
{
  self->_poofOutScale = a3;
}

- (double)poofOutScaleResponse
{
  return self->_poofOutScaleResponse;
}

- (void)setPoofOutScaleResponse:(double)a3
{
  self->_poofOutScaleResponse = a3;
}

- (double)poofOutScaleDamping
{
  return self->_poofOutScaleDamping;
}

- (void)setPoofOutScaleDamping:(double)a3
{
  self->_poofOutScaleDamping = a3;
}

- (double)poofOutBlurRadius
{
  return self->_poofOutBlurRadius;
}

- (void)setPoofOutBlurRadius:(double)a3
{
  self->_poofOutBlurRadius = a3;
}

- (double)poofOutBlurResponse
{
  return self->_poofOutBlurResponse;
}

- (void)setPoofOutBlurResponse:(double)a3
{
  self->_poofOutBlurResponse = a3;
}

- (double)poofOutBlurDelay
{
  return self->_poofOutBlurDelay;
}

- (void)setPoofOutBlurDelay:(double)a3
{
  self->_poofOutBlurDelay = a3;
}

- (double)poofOutAlphaResponse
{
  return self->_poofOutAlphaResponse;
}

- (void)setPoofOutAlphaResponse:(double)a3
{
  self->_poofOutAlphaResponse = a3;
}

- (double)poofOutAlphaDelay
{
  return self->_poofOutAlphaDelay;
}

- (void)setPoofOutAlphaDelay:(double)a3
{
  self->_poofOutAlphaDelay = a3;
}

- (BOOL)disableTransition
{
  return self->_disableTransition;
}

- (void)setDisableTransition:(BOOL)a3
{
  self->_disableTransition = a3;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
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
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  _QWORD v66[5];
  void *v67;
  _QWORD v68[7];
  _QWORD v69[6];
  _QWORD v70[3];
  void *v71;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:](PTRestoreDefaultSettingsRowAction, "actionWithSettingsKeyPath:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PTButtonRow rowWithTitle:action:](PTButtonRow, "rowWithTitle:action:", CFSTR("Restore Defaults"), v2));
  v71 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Duration (ms)"), CFSTR("hintDuration")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "between:and:", 0.0, 1.79769313e308));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "precision:", 0));
  v70[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Animation Response"), CFSTR("hintAnimationResponse")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "between:and:", 0.0, 1.79769313e308));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "precision:", 2));
  v70[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Target Scale"), CFSTR("hintAnimationTargetScale")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "between:and:", 0.0, 1.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "precision:", 2));
  v70[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 3));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v14, CFSTR("Hinting")));

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("poofInScale")));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "between:and:", 0.0, 1.79769313e308));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "precision:", 2));
  v69[0] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale Response"), CFSTR("poofInScaleResponse")));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "between:and:", 0.0, 1.79769313e308));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "precision:", 2));
  v69[1] = v51;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale Damping"), CFSTR("poofInScaleDamping")));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "between:and:", 0.0, 1.0));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "precision:", 2));
  v69[2] = v45;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("poofInBlurRadius")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "between:and:", 0.0, 1.79769313e308));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "precision:", 2));
  v69[3] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Response"), CFSTR("poofInBlurResponse")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "between:and:", 0.0, 1.79769313e308));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "precision:", 2));
  v69[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Alpha Response"), CFSTR("poofInAlphaResponse")));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "between:and:", 0.0, 1.79769313e308));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "precision:", 2));
  v69[5] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 6));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v24, CFSTR("Poof In")));

  v62 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("poofOutScale")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "between:and:", 0.0, 1.79769313e308));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "precision:", 2));
  v68[0] = v58;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale Response"), CFSTR("poofOutScaleResponse")));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "between:and:", 0.0, 1.79769313e308));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "precision:", 2));
  v68[1] = v52;
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("poofOutBlurRadius")));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "between:and:", 0.0, 1.79769313e308));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "precision:", 2));
  v68[2] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Response"), CFSTR("poofOutBlurResponse")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "between:and:", 0.0, 1.79769313e308));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "precision:", 2));
  v68[3] = v41;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Delay"), CFSTR("poofOutBlurDelay")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "between:and:", 0.0, 1.79769313e308));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "precision:", 2));
  v68[4] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Alpha Response"), CFSTR("poofOutAlphaResponse")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "between:and:", 0.0, 1.79769313e308));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "precision:", 2));
  v68[5] = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Alpha Delay"), CFSTR("poofOutAlphaDelay")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "between:and:", 0.0, 1.79769313e308));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "precision:", 2));
  v68[6] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 7));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v34, CFSTR("Poof Out")));

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Disable Transition"), CFSTR("disableTransition")));
  v67 = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v36, CFSTR("Debug")));

  v66[0] = v65;
  v66[1] = v64;
  v66[2] = v63;
  v66[3] = v48;
  v66[4] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 5));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", CFSTR("Custom Banner Transitions"), v38));

  return v39;
}

@end
