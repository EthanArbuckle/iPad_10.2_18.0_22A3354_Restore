@implementation CSDashBoardRemoteContentSettings

- (void)setDefaultValues
{
  -[CSDashBoardRemoteContentSettings setOverrideContentPreferences:](self, "setOverrideContentPreferences:", 0);
  -[CSDashBoardRemoteContentSettings setDateTimeStyleOverride:](self, "setDateTimeStyleOverride:", 0);
  -[CSDashBoardRemoteContentSettings setBackgroundStyleOverride:](self, "setBackgroundStyleOverride:", 3);
  -[CSDashBoardRemoteContentSettings setHomeGestureModeOverride:](self, "setHomeGestureModeOverride:", 3);
  -[CSDashBoardRemoteContentSettings setDismissesOnTapOverride:](self, "setDismissesOnTapOverride:", 0);
  -[CSDashBoardRemoteContentSettings setPrefersInlinePresentationOverride:](self, "setPrefersInlinePresentationOverride:", 0);
  -[CSDashBoardRemoteContentSettings setForceLuminanceReduction:](self, "setForceLuminanceReduction:", 1);
  -[CSDashBoardRemoteContentSettings setAnimatesDimming:](self, "setAnimatesDimming:", 1);
  -[CSDashBoardRemoteContentSettings setDimDuration:](self, "setDimDuration:", 0.5);
  -[CSDashBoardRemoteContentSettings setAnimatesUndimming:](self, "setAnimatesUndimming:", 1);
  -[CSDashBoardRemoteContentSettings setUndimDuration:](self, "setUndimDuration:", 0.5);
  -[CSDashBoardRemoteContentSettings setUndimsOnTap:](self, "setUndimsOnTap:", 0);
  -[CSDashBoardRemoteContentSettings setAutoExtendsIdleTimer:](self, "setAutoExtendsIdleTimer:", 0);
  -[CSDashBoardRemoteContentSettings setBottomLuminanceValue:](self, "setBottomLuminanceValue:", 0.0);
  -[CSDashBoardRemoteContentSettings setLowerLuminanceValue:](self, "setLowerLuminanceValue:", 0.15);
  -[CSDashBoardRemoteContentSettings setUpperLuminanceValue:](self, "setUpperLuminanceValue:", 0.3);
  -[CSDashBoardRemoteContentSettings setTopLuminanceValue:](self, "setTopLuminanceValue:", 0.45);
  -[CSDashBoardRemoteContentSettings setLighterBottomLuminanceValue:](self, "setLighterBottomLuminanceValue:", 0.0);
  -[CSDashBoardRemoteContentSettings setLighterLowerLuminanceValue:](self, "setLighterLowerLuminanceValue:", 0.3);
  -[CSDashBoardRemoteContentSettings setLighterUpperLuminanceValue:](self, "setLighterUpperLuminanceValue:", 0.6);
  -[CSDashBoardRemoteContentSettings setLighterTopLuminanceValue:](self, "setLighterTopLuminanceValue:", 0.9);
  -[CSDashBoardRemoteContentSettings setUsesLegacyDismissalLogic:](self, "setUsesLegacyDismissalLogic:", 0);
  -[CSDashBoardRemoteContentSettings setLegacyThreshold:](self, "setLegacyThreshold:", 0.8);
  -[CSDashBoardRemoteContentSettings setDirectThreshold:](self, "setDirectThreshold:", 0.96);
  -[CSDashBoardRemoteContentSettings setDirectFlingDampeningFactor:](self, "setDirectFlingDampeningFactor:", 2.5);
  -[CSDashBoardRemoteContentSettings setHostsInlineContentNativelyInNotificationList:](self, "setHostsInlineContentNativelyInNotificationList:", 1);
  -[CSDashBoardRemoteContentSettings setIncludesDateTimeStandinInAdjunctList:](self, "setIncludesDateTimeStandinInAdjunctList:", 1);
}

- (BOOL)shouldHostContentInNotificationList
{
  return _os_feature_enabled_impl();
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
  _QWORD v67[7];
  _QWORD v68[2];
  _QWORD v69[4];
  _QWORD v70[4];
  void *v71;
  _QWORD v72[6];
  _QWORD v73[4];
  _QWORD v74[8];

  v74[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Override Preferences"), CFSTR("overrideContentPreferences"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Date/Time Style"), CFSTR("dateTimeStyleOverride"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "possibleValues:titles:", &unk_1E8E8A060, &unk_1E8E8A078);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Background Style"), CFSTR("backgroundStyleOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "possibleValues:titles:", &unk_1E8E8A090, &unk_1E8E8A0A8);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83018], "rowWithTitle:valueKeyPath:", CFSTR("Home Gesture Mode"), CFSTR("homeGestureModeOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "possibleValues:titles:", &unk_1E8E8A0C0, &unk_1E8E8A0D8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Dismisses On Tap"), CFSTR("dismissesOnTapOverride"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Prefers Inline Presentation"), CFSTR("prefersInlinePresentationOverride"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83078];
  v74[0] = v65;
  v74[1] = v64;
  v74[2] = v63;
  v74[3] = v62;
  v74[4] = v61;
  v74[5] = v60;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:", v6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Legacy Threshold"), CFSTR("usesLegacyDismissalLogic"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Legacy Threshold"), CFSTR("legacyThreshold"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Direct Threshold"), CFSTR("directThreshold"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dampening Factor"), CFSTR("directFlingDampeningFactor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  v73[0] = v59;
  v73[1] = v58;
  v73[2] = v57;
  v73[3] = v56;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v8);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Force Luminance Reduction"), CFSTR("forceLuminanceReduction"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animates Dimming"), CFSTR("animatesDimming"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Dimming Duration"), CFSTR("dimDuration"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 2.0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Animates Undimming"), CFSTR("animatesUndimming"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Undimming Duration"), CFSTR("undimDuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 2.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Undims on Tap"), CFSTR("undimsOnTap"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D83078];
  v72[0] = v55;
  v72[1] = v54;
  v72[2] = v53;
  v72[3] = v52;
  v72[4] = v51;
  v72[5] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Auto Extends Timer"), CFSTR("autoExtendsIdleTimer"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0D83078];
  v71 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:", v15);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(D) Minimum Luminance Factor"), CFSTR("bottomLuminanceValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "between:and:", 0.0, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(D) Lower Luminance Factor"), CFSTR("lowerLuminanceValue"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(D) Upper Luminance Factor"), CFSTR("upperLuminanceValue"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "between:and:", 0.0, 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(D) Maximum Luminance Factor"), CFSTR("topLuminanceValue"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "between:and:", 0.0, 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0D83078];
  v70[0] = v46;
  v70[1] = v45;
  v70[2] = v44;
  v70[3] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sectionWithRows:", v21);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(L) Minimum Luminance Factor"), CFSTR("lighterBottomLuminanceValue"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", 0.0, 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(L) Lower Luminance Factor"), CFSTR("lighterLowerLuminanceValue"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "between:and:", 0.0, 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(L) Upper Luminance Factor"), CFSTR("lighterUpperLuminanceValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 1.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("(L) Maximum Luminance Factor"), CFSTR("lighterTopLuminanceValue"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", 0.0, 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x1E0D83078];
  v69[0] = v41;
  v69[1] = v40;
  v69[2] = v39;
  v69[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sectionWithRows:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Hosts in Notification List"), CFSTR("hostsInlineContentNativelyInNotificationList"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Date Time Standin"), CFSTR("includesDateTimeStandinInAdjunctList"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x1E0D83078];
  v68[0] = v29;
  v68[1] = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sectionWithRows:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0D83078];
  v67[0] = v66;
  v67[1] = v50;
  v67[2] = v13;
  v67[3] = v47;
  v67[4] = v42;
  v67[5] = v28;
  v67[6] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "moduleWithTitle:contents:", CFSTR("Remote Content Settings"), v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (BOOL)overrideContentPreferences
{
  return self->_overrideContentPreferences;
}

- (void)setOverrideContentPreferences:(BOOL)a3
{
  self->_overrideContentPreferences = a3;
}

- (int64_t)dateTimeStyleOverride
{
  return self->_dateTimeStyleOverride;
}

- (void)setDateTimeStyleOverride:(int64_t)a3
{
  self->_dateTimeStyleOverride = a3;
}

- (int64_t)backgroundStyleOverride
{
  return self->_backgroundStyleOverride;
}

- (void)setBackgroundStyleOverride:(int64_t)a3
{
  self->_backgroundStyleOverride = a3;
}

- (int64_t)homeGestureModeOverride
{
  return self->_homeGestureModeOverride;
}

- (void)setHomeGestureModeOverride:(int64_t)a3
{
  self->_homeGestureModeOverride = a3;
}

- (BOOL)dismissesOnTapOverride
{
  return self->_dismissesOnTapOverride;
}

- (void)setDismissesOnTapOverride:(BOOL)a3
{
  self->_dismissesOnTapOverride = a3;
}

- (BOOL)prefersInlinePresentationOverride
{
  return self->_prefersInlinePresentationOverride;
}

- (void)setPrefersInlinePresentationOverride:(BOOL)a3
{
  self->_prefersInlinePresentationOverride = a3;
}

- (BOOL)forceLuminanceReduction
{
  return self->_forceLuminanceReduction;
}

- (void)setForceLuminanceReduction:(BOOL)a3
{
  self->_forceLuminanceReduction = a3;
}

- (BOOL)animatesDimming
{
  return self->_animatesDimming;
}

- (void)setAnimatesDimming:(BOOL)a3
{
  self->_animatesDimming = a3;
}

- (double)dimDuration
{
  return self->_dimDuration;
}

- (void)setDimDuration:(double)a3
{
  self->_dimDuration = a3;
}

- (BOOL)animatesUndimming
{
  return self->_animatesUndimming;
}

- (void)setAnimatesUndimming:(BOOL)a3
{
  self->_animatesUndimming = a3;
}

- (double)undimDuration
{
  return self->_undimDuration;
}

- (void)setUndimDuration:(double)a3
{
  self->_undimDuration = a3;
}

- (BOOL)undimsOnTap
{
  return self->_undimsOnTap;
}

- (void)setUndimsOnTap:(BOOL)a3
{
  self->_undimsOnTap = a3;
}

- (BOOL)autoExtendsIdleTimer
{
  return self->_autoExtendsIdleTimer;
}

- (void)setAutoExtendsIdleTimer:(BOOL)a3
{
  self->_autoExtendsIdleTimer = a3;
}

- (double)bottomLuminanceValue
{
  return self->_bottomLuminanceValue;
}

- (void)setBottomLuminanceValue:(double)a3
{
  self->_bottomLuminanceValue = a3;
}

- (double)lowerLuminanceValue
{
  return self->_lowerLuminanceValue;
}

- (void)setLowerLuminanceValue:(double)a3
{
  self->_lowerLuminanceValue = a3;
}

- (double)upperLuminanceValue
{
  return self->_upperLuminanceValue;
}

- (void)setUpperLuminanceValue:(double)a3
{
  self->_upperLuminanceValue = a3;
}

- (double)topLuminanceValue
{
  return self->_topLuminanceValue;
}

- (void)setTopLuminanceValue:(double)a3
{
  self->_topLuminanceValue = a3;
}

- (double)lighterBottomLuminanceValue
{
  return self->_lighterBottomLuminanceValue;
}

- (void)setLighterBottomLuminanceValue:(double)a3
{
  self->_lighterBottomLuminanceValue = a3;
}

- (double)lighterLowerLuminanceValue
{
  return self->_lighterLowerLuminanceValue;
}

- (void)setLighterLowerLuminanceValue:(double)a3
{
  self->_lighterLowerLuminanceValue = a3;
}

- (double)lighterUpperLuminanceValue
{
  return self->_lighterUpperLuminanceValue;
}

- (void)setLighterUpperLuminanceValue:(double)a3
{
  self->_lighterUpperLuminanceValue = a3;
}

- (double)lighterTopLuminanceValue
{
  return self->_lighterTopLuminanceValue;
}

- (void)setLighterTopLuminanceValue:(double)a3
{
  self->_lighterTopLuminanceValue = a3;
}

- (BOOL)usesLegacyDismissalLogic
{
  return self->_usesLegacyDismissalLogic;
}

- (void)setUsesLegacyDismissalLogic:(BOOL)a3
{
  self->_usesLegacyDismissalLogic = a3;
}

- (double)legacyThreshold
{
  return self->_legacyThreshold;
}

- (void)setLegacyThreshold:(double)a3
{
  self->_legacyThreshold = a3;
}

- (double)directThreshold
{
  return self->_directThreshold;
}

- (void)setDirectThreshold:(double)a3
{
  self->_directThreshold = a3;
}

- (double)directFlingDampeningFactor
{
  return self->_directFlingDampeningFactor;
}

- (void)setDirectFlingDampeningFactor:(double)a3
{
  self->_directFlingDampeningFactor = a3;
}

- (BOOL)hostsInlineContentNativelyInNotificationList
{
  return self->_hostsInlineContentNativelyInNotificationList;
}

- (void)setHostsInlineContentNativelyInNotificationList:(BOOL)a3
{
  self->_hostsInlineContentNativelyInNotificationList = a3;
}

- (BOOL)includesDateTimeStandinInAdjunctList
{
  return self->_includesDateTimeStandinInAdjunctList;
}

- (void)setIncludesDateTimeStandinInAdjunctList:(BOOL)a3
{
  self->_includesDateTimeStandinInAdjunctList = a3;
}

@end
