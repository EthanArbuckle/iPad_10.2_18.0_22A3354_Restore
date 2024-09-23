@implementation WFBannerGestureSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFBannerGestureSettings;
  -[WFBannerGestureSettings setDefaultValues](&v3, "setDefaultValues");
  -[WFBannerGestureSettings setPoofResponse:](self, "setPoofResponse:", 0.55);
  -[WFBannerGestureSettings setPoofScaleUp:](self, "setPoofScaleUp:", 0.56);
  -[WFBannerGestureSettings setPoof_scale_multiplier_y:](self, "setPoof_scale_multiplier_y:", 0.92);
  -[WFBannerGestureSettings setPoofScaleDown:](self, "setPoofScaleDown:", 0.550000012);
  -[WFBannerGestureSettings setPoofThrowDistanceDown:](self, "setPoofThrowDistanceDown:", -110.0);
  -[WFBannerGestureSettings setPoofThrowDistanceUp:](self, "setPoofThrowDistanceUp:", -60.0);
  -[WFBannerGestureSettings setFixedEndTranslationUpEnabled:](self, "setFixedEndTranslationUpEnabled:", 1);
  -[WFBannerGestureSettings setFixedEndTranslationUp:](self, "setFixedEndTranslationUp:", 28.0);
  -[WFBannerGestureSettings setAlphaOutEnabled:](self, "setAlphaOutEnabled:", 1);
  -[WFBannerGestureSettings setPoofAlphaResponse:](self, "setPoofAlphaResponse:", 0.32);
  -[WFBannerGestureSettings setPoofAlphaDelay:](self, "setPoofAlphaDelay:", 0.12);
  -[WFBannerGestureSettings setPoofBlurRadius:](self, "setPoofBlurRadius:", 19.0);
  -[WFBannerGestureSettings setPoofBlurResponse:](self, "setPoofBlurResponse:", 0.45);
  -[WFBannerGestureSettings setPoofBlurDelay:](self, "setPoofBlurDelay:", 0.08);
  -[WFBannerGestureSettings setSqueezeEnabled:](self, "setSqueezeEnabled:", 1);
  -[WFBannerGestureSettings setTrackingSqueezeFactor:](self, "setTrackingSqueezeFactor:", 0.5);
  -[WFBannerGestureSettings setRubberBandingEnabled:](self, "setRubberBandingEnabled:", 1);
  -[WFBannerGestureSettings setTopLimit:](self, "setTopLimit:", -10.0);
  -[WFBannerGestureSettings setTopRubberBandRange:](self, "setTopRubberBandRange:", 32.0);
  -[WFBannerGestureSettings setBottomLimit:](self, "setBottomLimit:", 40.0);
  -[WFBannerGestureSettings setBottomRubberBandRange:](self, "setBottomRubberBandRange:", 220.0);
  -[WFBannerGestureSettings setHorizontalTrackingEnabled:](self, "setHorizontalTrackingEnabled:", 1);
  -[WFBannerGestureSettings setHorizontalTrackingFriction:](self, "setHorizontalTrackingFriction:", 0.99);
  -[WFBannerGestureSettings setTrackingBlurEnabled:](self, "setTrackingBlurEnabled:", 1);
  -[WFBannerGestureSettings setBlurTopLimit:](self, "setBlurTopLimit:", -65.0);
  -[WFBannerGestureSettings setBlurBottomLimit:](self, "setBlurBottomLimit:", 200.0);
  -[WFBannerGestureSettings setTrackingResponse:](self, "setTrackingResponse:", 0.14);
  -[WFBannerGestureSettings setTrackingDampingRatio:](self, "setTrackingDampingRatio:", 0.75);
  -[WFBannerGestureSettings setTrackingScale:](self, "setTrackingScale:", 0.38);
  -[WFBannerGestureSettings setSqueeze_up:](self, "setSqueeze_up:", 0.11);
  -[WFBannerGestureSettings setScrollDismissalActivationLeniency:](self, "setScrollDismissalActivationLeniency:", 12.0);
  -[WFBannerGestureSettings setTestUnregisteredVelocityEdgeCase:](self, "setTestUnregisteredVelocityEdgeCase:", 0);
  -[WFBannerGestureSettings setPhase1_response:](self, "setPhase1_response:", 0.5);
  -[WFBannerGestureSettings setPhase1_impulse:](self, "setPhase1_impulse:", 0.018);
  -[WFBannerGestureSettings setPhase1_impulse_unregisteredVelocity:](self, "setPhase1_impulse_unregisteredVelocity:", 0.042);
  -[WFBannerGestureSettings setPhase1_artificialInitialOffset:](self, "setPhase1_artificialInitialOffset:", 34.0);
  -[WFBannerGestureSettings setPhase1_initialScale:](self, "setPhase1_initialScale:", 0.6);
  -[WFBannerGestureSettings setPhase1_initialBlurRadius:](self, "setPhase1_initialBlurRadius:", 5.0);
  -[WFBannerGestureSettings setPhase1_phaseDuration:](self, "setPhase1_phaseDuration:", 0.08);
}

- (double)poofResponse
{
  return self->_poofResponse;
}

- (void)setPoofResponse:(double)a3
{
  self->_poofResponse = a3;
}

- (double)poofScaleUp
{
  return self->_poofScaleUp;
}

- (void)setPoofScaleUp:(double)a3
{
  self->_poofScaleUp = a3;
}

- (double)poofScaleDown
{
  return self->_poofScaleDown;
}

- (void)setPoofScaleDown:(double)a3
{
  self->_poofScaleDown = a3;
}

- (double)poofThrowDistanceUp
{
  return self->_poofThrowDistanceUp;
}

- (void)setPoofThrowDistanceUp:(double)a3
{
  self->_poofThrowDistanceUp = a3;
}

- (double)poofThrowDistanceDown
{
  return self->_poofThrowDistanceDown;
}

- (void)setPoofThrowDistanceDown:(double)a3
{
  self->_poofThrowDistanceDown = a3;
}

- (BOOL)fixedEndTranslationUpEnabled
{
  return self->_fixedEndTranslationUpEnabled;
}

- (void)setFixedEndTranslationUpEnabled:(BOOL)a3
{
  self->_fixedEndTranslationUpEnabled = a3;
}

- (double)fixedEndTranslationUp
{
  return self->_fixedEndTranslationUp;
}

- (void)setFixedEndTranslationUp:(double)a3
{
  self->_fixedEndTranslationUp = a3;
}

- (BOOL)alphaOutEnabled
{
  return self->_alphaOutEnabled;
}

- (void)setAlphaOutEnabled:(BOOL)a3
{
  self->_alphaOutEnabled = a3;
}

- (double)poofAlphaResponse
{
  return self->_poofAlphaResponse;
}

- (void)setPoofAlphaResponse:(double)a3
{
  self->_poofAlphaResponse = a3;
}

- (double)poofAlphaDelay
{
  return self->_poofAlphaDelay;
}

- (void)setPoofAlphaDelay:(double)a3
{
  self->_poofAlphaDelay = a3;
}

- (double)trackingResponse
{
  return self->_trackingResponse;
}

- (void)setTrackingResponse:(double)a3
{
  self->_trackingResponse = a3;
}

- (double)trackingDampingRatio
{
  return self->_trackingDampingRatio;
}

- (void)setTrackingDampingRatio:(double)a3
{
  self->_trackingDampingRatio = a3;
}

- (BOOL)squeezeEnabled
{
  return self->_squeezeEnabled;
}

- (void)setSqueezeEnabled:(BOOL)a3
{
  self->_squeezeEnabled = a3;
}

- (double)trackingSqueezeFactor
{
  return self->_trackingSqueezeFactor;
}

- (void)setTrackingSqueezeFactor:(double)a3
{
  self->_trackingSqueezeFactor = a3;
}

- (double)poofBlurRadius
{
  return self->_poofBlurRadius;
}

- (void)setPoofBlurRadius:(double)a3
{
  self->_poofBlurRadius = a3;
}

- (double)poofBlurResponse
{
  return self->_poofBlurResponse;
}

- (void)setPoofBlurResponse:(double)a3
{
  self->_poofBlurResponse = a3;
}

- (double)poofBlurDelay
{
  return self->_poofBlurDelay;
}

- (void)setPoofBlurDelay:(double)a3
{
  self->_poofBlurDelay = a3;
}

- (double)topLimit
{
  return self->_topLimit;
}

- (void)setTopLimit:(double)a3
{
  self->_topLimit = a3;
}

- (double)bottomLimit
{
  return self->_bottomLimit;
}

- (void)setBottomLimit:(double)a3
{
  self->_bottomLimit = a3;
}

- (BOOL)trackingBlurEnabled
{
  return self->_trackingBlurEnabled;
}

- (void)setTrackingBlurEnabled:(BOOL)a3
{
  self->_trackingBlurEnabled = a3;
}

- (double)blurTopLimit
{
  return self->_blurTopLimit;
}

- (void)setBlurTopLimit:(double)a3
{
  self->_blurTopLimit = a3;
}

- (double)blurBottomLimit
{
  return self->_blurBottomLimit;
}

- (void)setBlurBottomLimit:(double)a3
{
  self->_blurBottomLimit = a3;
}

- (BOOL)rubberBandingEnabled
{
  return self->_rubberBandingEnabled;
}

- (void)setRubberBandingEnabled:(BOOL)a3
{
  self->_rubberBandingEnabled = a3;
}

- (double)topRubberBandRange
{
  return self->_topRubberBandRange;
}

- (void)setTopRubberBandRange:(double)a3
{
  self->_topRubberBandRange = a3;
}

- (double)bottomRubberBandRange
{
  return self->_bottomRubberBandRange;
}

- (void)setBottomRubberBandRange:(double)a3
{
  self->_bottomRubberBandRange = a3;
}

- (BOOL)horizontalTrackingEnabled
{
  return self->_horizontalTrackingEnabled;
}

- (void)setHorizontalTrackingEnabled:(BOOL)a3
{
  self->_horizontalTrackingEnabled = a3;
}

- (double)horizontalTrackingFriction
{
  return self->_horizontalTrackingFriction;
}

- (void)setHorizontalTrackingFriction:(double)a3
{
  self->_horizontalTrackingFriction = a3;
}

- (double)scrollDismissalActivationLeniency
{
  return self->_scrollDismissalActivationLeniency;
}

- (void)setScrollDismissalActivationLeniency:(double)a3
{
  self->_scrollDismissalActivationLeniency = a3;
}

- (double)squeeze_up
{
  return self->_squeeze_up;
}

- (void)setSqueeze_up:(double)a3
{
  self->_squeeze_up = a3;
}

- (double)poof_scale_multiplier_y
{
  return self->_poof_scale_multiplier_y;
}

- (void)setPoof_scale_multiplier_y:(double)a3
{
  self->_poof_scale_multiplier_y = a3;
}

- (double)trackingScale
{
  return self->_trackingScale;
}

- (void)setTrackingScale:(double)a3
{
  self->_trackingScale = a3;
}

- (BOOL)testUnregisteredVelocityEdgeCase
{
  return self->_testUnregisteredVelocityEdgeCase;
}

- (void)setTestUnregisteredVelocityEdgeCase:(BOOL)a3
{
  self->_testUnregisteredVelocityEdgeCase = a3;
}

- (double)phase1_response
{
  return self->_phase1_response;
}

- (void)setPhase1_response:(double)a3
{
  self->_phase1_response = a3;
}

- (double)phase1_impulse
{
  return self->_phase1_impulse;
}

- (void)setPhase1_impulse:(double)a3
{
  self->_phase1_impulse = a3;
}

- (double)phase1_impulse_unregisteredVelocity
{
  return self->_phase1_impulse_unregisteredVelocity;
}

- (void)setPhase1_impulse_unregisteredVelocity:(double)a3
{
  self->_phase1_impulse_unregisteredVelocity = a3;
}

- (double)phase1_artificialInitialOffset
{
  return self->_phase1_artificialInitialOffset;
}

- (void)setPhase1_artificialInitialOffset:(double)a3
{
  self->_phase1_artificialInitialOffset = a3;
}

- (double)phase1_initialScale
{
  return self->_phase1_initialScale;
}

- (void)setPhase1_initialScale:(double)a3
{
  self->_phase1_initialScale = a3;
}

- (double)phase1_initialBlurRadius
{
  return self->_phase1_initialBlurRadius;
}

- (void)setPhase1_initialBlurRadius:(double)a3
{
  self->_phase1_initialBlurRadius = a3;
}

- (double)phase1_phaseDuration
{
  return self->_phase1_phaseDuration;
}

- (void)setPhase1_phaseDuration:(double)a3
{
  self->_phase1_phaseDuration = a3;
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
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  _QWORD v130[13];
  void *v131;
  void *v132;
  _QWORD v133[2];
  _QWORD v134[3];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[5];
  _QWORD v138[2];
  _QWORD v139[7];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[8];
  void *v143;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PTRestoreDefaultSettingsRowAction actionWithSettingsKeyPath:](PTRestoreDefaultSettingsRowAction, "actionWithSettingsKeyPath:", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PTButtonRow rowWithTitle:action:](PTButtonRow, "rowWithTitle:action:", CFSTR("Restore Defaults"), v2));
  v143 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v143, 1));
  v129 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v4));

  v126 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Transform Response"), CFSTR("poofResponse")));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "between:and:", 0.0, 10.0));
  v142[0] = v124;
  v122 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale (Upward)"), CFSTR("poofScaleUp")));
  v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "between:and:", 0.0, 2.0));
  v142[1] = v119;
  v116 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Vertical Scale Multiplier"), CFSTR("poof_scale_multiplier_y")));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "between:and:", 0.0, 2.0));
  v142[2] = v112;
  v109 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Fixed Endpoint (Upward)"), CFSTR("fixedEndTranslationUpEnabled")));
  v142[3] = v109;
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Endpoint (Upward)"), CFSTR("fixedEndTranslationUp")));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "between:and:", -500.0, 500.0));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "precision:", 0));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "conditionFormat:", CFSTR("fixedEndTranslationUpEnabled = YES")));
  v142[4] = v100;
  v98 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Throw Distance (Upward)"), CFSTR("poofThrowDistanceUp")));
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "between:and:", -500.0, 500.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "precision:", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "conditionFormat:", CFSTR("fixedEndTranslationUpEnabled = NO")));
  v142[5] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale (Downward)"), CFSTR("poofScaleDown")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "between:and:", 0.0, 2.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "conditionFormat:", CFSTR("squeezeEnabled = NO")));
  v142[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Throw Distance (Downward)"), CFSTR("poofThrowDistanceDown")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "between:and:", -500.0, 500.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "precision:", 0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "conditionFormat:", CFSTR("squeezeEnabled = NO")));
  v142[7] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 8));
  v128 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v14, CFSTR("Interactive Poof (Phase 2)")));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Alpha"), CFSTR("alphaOutEnabled")));
  v141[0] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("poofAlphaResponse")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "between:and:", 0.0, 1.0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "conditionFormat:", CFSTR("alphaOutEnabled = YES")));
  v141[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Delay"), CFSTR("poofAlphaDelay")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "between:and:", 0.0, 1.0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "conditionFormat:", CFSTR("alphaOutEnabled = YES")));
  v141[2] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v141, 3));
  v127 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v22, 0));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("poofBlurRadius")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "between:and:", 0.0, 1.79769313e308));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "precision:", 0));
  v140[0] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Response"), CFSTR("poofBlurResponse")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "between:and:", 0.0, 1.79769313e308));
  v140[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Delay"), CFSTR("poofBlurDelay")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "between:and:", 0.0, 1.79769313e308));
  v140[2] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v140, 3));
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v30, 0));

  v120 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("phase1_response")));
  v139[0] = v120;
  v117 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Impulse"), CFSTR("phase1_impulse")));
  v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "between:and:", 0.0, 1.79769313e308));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "precision:", 3));
  v139[1] = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Impulse (Unregistered Velocity)"), CFSTR("phase1_impulse_unregisteredVelocity")));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "between:and:", 0.0, 1.79769313e308));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "precision:", 3));
  v139[2] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Offset"), CFSTR("phase1_artificialInitialOffset")));
  v139[3] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scale"), CFSTR("phase1_initialScale")));
  v139[4] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Radius"), CFSTR("phase1_initialBlurRadius")));
  v139[5] = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Intermediate Phase Duration"), CFSTR("phase1_phaseDuration")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "precision:", 2));
  v139[6] = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v139, 7));
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v40, CFSTR("Interactive Poof (Phase 1)")));

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Tracking Response"), CFSTR("trackingResponse")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "between:and:", 0.0, 1.79769313e308));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "precision:", 2));
  v138[0] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Tracking Damping Ratio"), CFSTR("trackingDampingRatio")));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "between:and:", 0.0, 1.79769313e308));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "precision:", 2));
  v138[1] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v138, 2));
  v121 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v47, CFSTR("Gesture")));

  v114 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Rubber Banding"), CFSTR("rubberBandingEnabled")));
  v137[0] = v114;
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Start Offset (Upward)"), CFSTR("topLimit")));
  v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "between:and:", -1.79769313e308, 0.0));
  v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "precision:", 0));
  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "conditionFormat:", CFSTR("rubberBandingEnabled = YES")));
  v137[1] = v103;
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Range (Upward)"), CFSTR("topRubberBandRange")));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "between:and:", 5.0, 1.79769313e308));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "precision:", 0));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "conditionFormat:", CFSTR("rubberBandingEnabled = YES")));
  v137[2] = v48;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Start Offset (Downward)"), CFSTR("bottomLimit")));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "between:and:", 0.0, 1.79769313e308));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "precision:", 0));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "conditionFormat:", CFSTR("rubberBandingEnabled = YES")));
  v137[3] = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Range (Downward)"), CFSTR("bottomRubberBandRange")));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "between:and:", 0.0, 1.79769313e308));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "precision:", 0));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "conditionFormat:", CFSTR("rubberBandingEnabled = YES")));
  v137[4] = v56;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 5));
  v118 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v57, 0));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Tracking"), CFSTR("horizontalTrackingEnabled")));
  v136[0] = v58;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Friction"), CFSTR("horizontalTrackingFriction")));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "between:and:", 0.0, 1.0));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "precision:", 3));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "conditionFormat:", CFSTR("horizontalTrackingEnabled = YES")));
  v136[1] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v136, 2));
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v63, 0));

  v64 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Squeeze"), CFSTR("squeezeEnabled")));
  v135[0] = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Strength"), CFSTR("trackingSqueezeFactor")));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "between:and:", 0.0, 1.0));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "conditionFormat:", CFSTR("squeezeEnabled = YES")));
  v135[1] = v67;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v135, 2));
  v111 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v68, 0));

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Tracking Blur"), CFSTR("trackingBlurEnabled")));
  v134[0] = v69;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Activation Offset (Upward)"), CFSTR("blurTopLimit")));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "between:and:", -1.79769313e308, 0.0));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "precision:", 0));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "conditionFormat:", CFSTR("trackingBlurEnabled == YES")));
  v134[1] = v73;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Blur Activation Offset (Downward)"), CFSTR("blurBottomLimit")));
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "between:and:", 0.0, 1.79769313e308));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "precision:", 0));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "conditionFormat:", CFSTR("trackingBlurEnabled == YES && squeezeEnabled = NO")));
  v134[2] = v77;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v134, 3));
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v78, 0));

  v79 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Tracking Scale"), CFSTR("trackingScale")));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "between:and:", 0.0, 1.0));
  v133[0] = v80;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Upwards Squeeze"), CFSTR("squeeze_up")));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "between:and:", 0.0, 1.0));
  v133[1] = v82;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v133, 2));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v83, 0));

  v85 = (void *)objc_claimAutoreleasedReturnValue(+[PTEditFloatRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Scroll Dismissal Leniency"), CFSTR("scrollDismissalActivationLeniency")));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "between:and:", 0.0, 1.79769313e308));
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "precision:", 0));
  v132 = v87;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v132, 1));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v88, 0));

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[PTSwitchRow rowWithTitle:valueKeyPath:](PTSwitchRow, "rowWithTitle:valueKeyPath:", CFSTR("Test Quick Flick"), CFSTR("testUnregisteredVelocityEdgeCase")));
  v131 = v90;
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v131, 1));
  v92 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule sectionWithRows:title:](PTModule, "sectionWithRows:title:", v91, CFSTR("Debug")));

  v130[0] = v129;
  v130[1] = v128;
  v130[2] = v127;
  v130[3] = v125;
  v130[4] = v123;
  v130[5] = v121;
  v130[6] = v118;
  v130[7] = v115;
  v130[8] = v111;
  v130[9] = v108;
  v130[10] = v84;
  v130[11] = v89;
  v130[12] = v92;
  v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v130, 13));
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", CFSTR("Custom Banner Transitions"), v93));

  return v94;
}

@end
