@implementation CSLockScreenPearlSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CSLockScreenPearlSettings setPearlDebugUIEnabled:](self, "setPearlDebugUIEnabled:", 0);
  -[CSLockScreenPearlSettings failureSettings](self, "failureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setJiggleLock:", 1);

  -[CSLockScreenPearlSettings failureSettings](self, "failureSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVibrate:", 1);

  -[CSLockScreenPearlSettings failureSettings](self, "failureSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowPasscode:", 0);

  -[CSLockScreenPearlSettings failureSettings](self, "failureSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWaitUntilButtonUp:", 0);

  SBUIProudLockContainerViewControllerConfigurationDefault();
  -[CSLockScreenPearlSettings setShowScanningStateOnLockScreen:](self, "setShowScanningStateOnLockScreen:", 0);
  -[CSLockScreenPearlSettings setShowScanningStateDuringFaceDetect:](self, "setShowScanningStateDuringFaceDetect:", 0);
  -[CSLockScreenPearlSettings setMinimumDurationBeforeShowingScanningState:](self, "setMinimumDurationBeforeShowingScanningState:", 0.0);
  -[CSLockScreenPearlSettings setMinimumDurationBetweenLeavingCoachingAndCoaching:](self, "setMinimumDurationBetweenLeavingCoachingAndCoaching:", 0.0);
  -[CSLockScreenPearlSettings setMinimumDurationShowingCoaching:](self, "setMinimumDurationShowingCoaching:", 0.0);
  -[CSLockScreenPearlSettings setDurationOnCameraCoveredGlyphBeforeCoaching:](self, "setDurationOnCameraCoveredGlyphBeforeCoaching:", 0.0);
  -[CSLockScreenPearlSettings setCoachingDelaysUnlock:](self, "setCoachingDelaysUnlock:", 0);
  -[CSLockScreenPearlSettings setSpinBeforeCoaching:](self, "setSpinBeforeCoaching:", 0);
  -[CSLockScreenPearlSettings setDurationToSuppressCameraCoveredWhenWakingWithSmartCover:](self, "setDurationToSuppressCameraCoveredWhenWakingWithSmartCover:", 0.0);
  -[CSLockScreenPearlSettings setDurationToSuppressCameraCoveredWhenWakingWithMagicKeyboard:](self, "setDurationToSuppressCameraCoveredWhenWakingWithMagicKeyboard:", 0.0);
  -[CSLockScreenPearlSettings setSystemApertureDismissDelayAuth:](self, "setSystemApertureDismissDelayAuth:", 0.35);
  -[CSLockScreenPearlSettings setSystemApertureDismissDelayDismissal:](self, "setSystemApertureDismissDelayDismissal:", 0.25);
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
  _QWORD v40[4];
  _QWORD v41[8];
  _QWORD v42[4];
  void *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Enable Pearl Debug UI"), CFSTR("pearlDebugUIEnabled"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v44[0] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v3, CFSTR("Debug UI"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Failure Settings"), CFSTR("failureSettings"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v43 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Feedbacks"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Show Scanning On LockScreen"), CFSTR("showScanningStateOnLockScreen"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Show Scanning During Face Detect"), CFSTR("showScanningStateDuringFaceDetect"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Coaching Delays Unlock"), CFSTR("coachingDelaysUnlock"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830D8], "rowWithTitle:valueKeyPath:", CFSTR("Spin Before Coaching"), CFSTR("spinBeforeCoaching"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D830B8];
  v42[0] = v36;
  v42[1] = v35;
  v42[2] = v34;
  v42[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionWithRows:title:", v7, CFSTR("Feedback"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Jindo Dismissal Delay"), CFSTR("systemApertureDismissDelayDismissal"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 2.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Jindo Auth Delay"), CFSTR("systemApertureDismissDelayAuth"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 2.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Before Show Scanning"), CFSTR("minimumDurationBeforeShowingScanningState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "between:and:", 0.0, 10.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Between Leaving and Coaching"), CFSTR("minimumDurationBetweenLeavingCoachingAndCoaching"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "between:and:", 0.0, 10.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Showing Coaching"), CFSTR("minimumDurationShowingCoaching"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 10.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Camera Covered Glyph"), CFSTR("durationOnCameraCoveredGlyphBeforeCoaching"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "between:and:", 0.0, 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Camera Covered (Smart Cover)"), CFSTR("durationToSuppressCameraCoveredWhenWakingWithSmartCover"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "between:and:", 0.0, 10.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Suppress Camera Covered (Magic Keyboard)"), CFSTR("durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 10.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D830B8];
  v41[0] = v30;
  v41[1] = v29;
  v41[2] = v28;
  v41[3] = v27;
  v41[4] = v26;
  v41[5] = v14;
  v41[6] = v16;
  v41[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sectionWithRows:title:", v20, CFSTR("Minimum Durations"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0D83078];
  v40[0] = v37;
  v40[1] = v32;
  v40[2] = v31;
  v40[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "moduleWithTitle:contents:", CFSTR("Pearl Settings"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- ($20D0CF0D87A8AD096D8C820DF2D4BB3C)proudLockControllerViewControllerConfiguration
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  $20D0CF0D87A8AD096D8C820DF2D4BB3C *result;
  double v11;

  *(_OWORD *)&retstr->var7 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  retstr->var0 = -[CSLockScreenPearlSettings showScanningStateOnLockScreen](self, "showScanningStateOnLockScreen");
  retstr->var1 = -[CSLockScreenPearlSettings showScanningStateDuringFaceDetect](self, "showScanningStateDuringFaceDetect");
  -[CSLockScreenPearlSettings minimumDurationBeforeShowingScanningState](self, "minimumDurationBeforeShowingScanningState");
  retstr->var2 = v5;
  retstr->var3 = 1;
  -[CSLockScreenPearlSettings minimumDurationBetweenLeavingCoachingAndCoaching](self, "minimumDurationBetweenLeavingCoachingAndCoaching");
  retstr->var4 = v6;
  -[CSLockScreenPearlSettings minimumDurationShowingCoaching](self, "minimumDurationShowingCoaching");
  retstr->var5 = v7;
  -[CSLockScreenPearlSettings durationOnCameraCoveredGlyphBeforeCoaching](self, "durationOnCameraCoveredGlyphBeforeCoaching");
  retstr->var6 = v8;
  retstr->var9 = -[CSLockScreenPearlSettings coachingDelaysUnlock](self, "coachingDelaysUnlock");
  retstr->var10 = 0;
  retstr->var11 = -[CSLockScreenPearlSettings spinBeforeCoaching](self, "spinBeforeCoaching");
  -[CSLockScreenPearlSettings durationToSuppressCameraCoveredWhenWakingWithSmartCover](self, "durationToSuppressCameraCoveredWhenWakingWithSmartCover");
  retstr->var7 = v9;
  result = ($20D0CF0D87A8AD096D8C820DF2D4BB3C *)-[CSLockScreenPearlSettings durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard](self, "durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard");
  retstr->var8 = v11;
  retstr->var12 = 0;
  return result;
}

- (BOOL)pearlDebugUIEnabled
{
  return self->_pearlDebugUIEnabled;
}

- (void)setPearlDebugUIEnabled:(BOOL)a3
{
  self->_pearlDebugUIEnabled = a3;
}

- (CSLockScreenBiometricFailureSettings)failureSettings
{
  return self->_failureSettings;
}

- (void)setFailureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_failureSettings, a3);
}

- (BOOL)showScanningStateOnLockScreen
{
  return self->_showScanningStateOnLockScreen;
}

- (void)setShowScanningStateOnLockScreen:(BOOL)a3
{
  self->_showScanningStateOnLockScreen = a3;
}

- (BOOL)showScanningStateDuringFaceDetect
{
  return self->_showScanningStateDuringFaceDetect;
}

- (void)setShowScanningStateDuringFaceDetect:(BOOL)a3
{
  self->_showScanningStateDuringFaceDetect = a3;
}

- (double)minimumDurationBeforeShowingScanningState
{
  return self->_minimumDurationBeforeShowingScanningState;
}

- (void)setMinimumDurationBeforeShowingScanningState:(double)a3
{
  self->_minimumDurationBeforeShowingScanningState = a3;
}

- (double)minimumDurationBetweenLeavingCoachingAndCoaching
{
  return self->_minimumDurationBetweenLeavingCoachingAndCoaching;
}

- (void)setMinimumDurationBetweenLeavingCoachingAndCoaching:(double)a3
{
  self->_minimumDurationBetweenLeavingCoachingAndCoaching = a3;
}

- (double)minimumDurationShowingCoaching
{
  return self->_minimumDurationShowingCoaching;
}

- (void)setMinimumDurationShowingCoaching:(double)a3
{
  self->_minimumDurationShowingCoaching = a3;
}

- (double)durationOnCameraCoveredGlyphBeforeCoaching
{
  return self->_durationOnCameraCoveredGlyphBeforeCoaching;
}

- (void)setDurationOnCameraCoveredGlyphBeforeCoaching:(double)a3
{
  self->_durationOnCameraCoveredGlyphBeforeCoaching = a3;
}

- (double)durationToSuppressCameraCoveredWhenWakingWithSmartCover
{
  return self->_durationToSuppressCameraCoveredWhenWakingWithSmartCover;
}

- (void)setDurationToSuppressCameraCoveredWhenWakingWithSmartCover:(double)a3
{
  self->_durationToSuppressCameraCoveredWhenWakingWithSmartCover = a3;
}

- (double)durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard
{
  return self->_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard;
}

- (void)setDurationToSuppressCameraCoveredWhenWakingWithMagicKeyboard:(double)a3
{
  self->_durationToSuppressCameraCoveredWhenWakingWithMagicKeyboard = a3;
}

- (BOOL)coachingDelaysUnlock
{
  return self->_coachingDelaysUnlock;
}

- (void)setCoachingDelaysUnlock:(BOOL)a3
{
  self->_coachingDelaysUnlock = a3;
}

- (BOOL)spinBeforeCoaching
{
  return self->_spinBeforeCoaching;
}

- (void)setSpinBeforeCoaching:(BOOL)a3
{
  self->_spinBeforeCoaching = a3;
}

- (BOOL)overrideCoachingConditionEnabled
{
  return self->_overrideCoachingConditionEnabled;
}

- (void)setOverrideCoachingConditionEnabled:(BOOL)a3
{
  self->_overrideCoachingConditionEnabled = a3;
}

- (unint64_t)overrideCoachingBiometricEvent
{
  return self->_overrideCoachingBiometricEvent;
}

- (void)setOverrideCoachingBiometricEvent:(unint64_t)a3
{
  self->_overrideCoachingBiometricEvent = a3;
}

- (double)systemApertureDismissDelayDismissal
{
  return self->_systemApertureDismissDelayDismissal;
}

- (void)setSystemApertureDismissDelayDismissal:(double)a3
{
  self->_systemApertureDismissDelayDismissal = a3;
}

- (double)systemApertureDismissDelayAuth
{
  return self->_systemApertureDismissDelayAuth;
}

- (void)setSystemApertureDismissDelayAuth:(double)a3
{
  self->_systemApertureDismissDelayAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureSettings, 0);
}

@end
