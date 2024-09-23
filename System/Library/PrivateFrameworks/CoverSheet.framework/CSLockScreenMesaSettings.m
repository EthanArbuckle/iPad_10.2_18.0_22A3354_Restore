@implementation CSLockScreenMesaSettings

- (void)setDefaultValues
{
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

  -[CSLockScreenMesaSettings firstFailureSettings](self, "firstFailureSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setJiggleLock:", 1);

  -[CSLockScreenMesaSettings firstFailureSettings](self, "firstFailureSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVibrate:", 0);

  -[CSLockScreenMesaSettings firstFailureSettings](self, "firstFailureSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowPasscode:", 0);

  -[CSLockScreenMesaSettings firstFailureSettings](self, "firstFailureSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWaitUntilButtonUp:", 0);

  -[CSLockScreenMesaSettings secondFailureSettings](self, "secondFailureSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setJiggleLock:", 1);

  -[CSLockScreenMesaSettings secondFailureSettings](self, "secondFailureSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVibrate:", 0);

  -[CSLockScreenMesaSettings secondFailureSettings](self, "secondFailureSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShowPasscode:", 0);

  -[CSLockScreenMesaSettings secondFailureSettings](self, "secondFailureSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWaitUntilButtonUp:", 0);

  -[CSLockScreenMesaSettings thirdFailureSettings](self, "thirdFailureSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setJiggleLock:", 1);

  -[CSLockScreenMesaSettings thirdFailureSettings](self, "thirdFailureSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setVibrate:", 1);

  -[CSLockScreenMesaSettings thirdFailureSettings](self, "thirdFailureSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowPasscode:", 1);

  -[CSLockScreenMesaSettings thirdFailureSettings](self, "thirdFailureSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWaitUntilButtonUp:", 0);

  -[CSLockScreenMesaSettings fourthFailureSettings](self, "fourthFailureSettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setJiggleLock:", 1);

  -[CSLockScreenMesaSettings fourthFailureSettings](self, "fourthFailureSettings");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setVibrate:", 1);

  -[CSLockScreenMesaSettings fourthFailureSettings](self, "fourthFailureSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShowPasscode:", 1);

  -[CSLockScreenMesaSettings fourthFailureSettings](self, "fourthFailureSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWaitUntilButtonUp:", 1);

  -[CSLockScreenMesaSettings fifthFailureSettings](self, "fifthFailureSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setJiggleLock:", 1);

  -[CSLockScreenMesaSettings fifthFailureSettings](self, "fifthFailureSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setVibrate:", 1);

  -[CSLockScreenMesaSettings fifthFailureSettings](self, "fifthFailureSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setShowPasscode:", 1);

  -[CSLockScreenMesaSettings fifthFailureSettings](self, "fifthFailureSettings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWaitUntilButtonUp:", 1);

  -[CSLockScreenMesaSettings setPasscodeRequiredEventsCountAsFailures:](self, "setPasscodeRequiredEventsCountAsFailures:", 0);
  -[CSLockScreenMesaSettings setFlashRedOnPasscodeRequiredEvents:](self, "setFlashRedOnPasscodeRequiredEvents:", 0);
  -[CSLockScreenMesaSettings setSuccessFeedbackWaitsUntilButtonUp:](self, "setSuccessFeedbackWaitsUntilButtonUp:", 1);
  -[CSLockScreenMesaSettings setSlowPressDuration:](self, "setSlowPressDuration:", 0.25);
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[7];

  v32[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("First Failure"), CFSTR("firstFailureSettings"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Second Failure"), CFSTR("secondFailureSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Third Failure"), CFSTR("thirdFailureSettings"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Fourth Failure"), CFSTR("fourthFailureSettings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Fifth Failure"), CFSTR("fifthFailureSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D83078];
  v32[0] = v27;
  v32[1] = v26;
  v32[2] = v25;
  v32[3] = v24;
  v32[4] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Count as Failure"), CFSTR("passcodeRequiredEventsCountAsFailures"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Flash Red"), CFSTR("flashRedOnPasscodeRequiredEvents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D83078];
  v31[0] = v22;
  v31[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionWithRows:title:", v6, CFSTR("Passcode Required events"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Wait until button up"), CFSTR("successFeedbackWaitsUntilButtonUp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D83078];
  v30 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionWithRows:title:", v10, CFSTR("Match events"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Slow Press Duration (seconds)"), CFSTR("slowPressDuration"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83078];
  v29 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionWithRows:title:", v15, CFSTR("Press Speed"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v28[0] = v21;
  v28[1] = v7;
  v28[2] = v11;
  v28[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleWithTitle:contents:", CFSTR("Mesa Failure Settings"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (CSLockScreenBiometricFailureSettings)firstFailureSettings
{
  return self->_firstFailureSettings;
}

- (void)setFirstFailureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_firstFailureSettings, a3);
}

- (CSLockScreenBiometricFailureSettings)secondFailureSettings
{
  return self->_secondFailureSettings;
}

- (void)setSecondFailureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_secondFailureSettings, a3);
}

- (CSLockScreenBiometricFailureSettings)thirdFailureSettings
{
  return self->_thirdFailureSettings;
}

- (void)setThirdFailureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_thirdFailureSettings, a3);
}

- (CSLockScreenBiometricFailureSettings)fourthFailureSettings
{
  return self->_fourthFailureSettings;
}

- (void)setFourthFailureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fourthFailureSettings, a3);
}

- (CSLockScreenBiometricFailureSettings)fifthFailureSettings
{
  return self->_fifthFailureSettings;
}

- (void)setFifthFailureSettings:(id)a3
{
  objc_storeStrong((id *)&self->_fifthFailureSettings, a3);
}

- (BOOL)passcodeRequiredEventsCountAsFailures
{
  return self->_passcodeRequiredEventsCountAsFailures;
}

- (void)setPasscodeRequiredEventsCountAsFailures:(BOOL)a3
{
  self->_passcodeRequiredEventsCountAsFailures = a3;
}

- (BOOL)flashRedOnPasscodeRequiredEvents
{
  return self->_flashRedOnPasscodeRequiredEvents;
}

- (void)setFlashRedOnPasscodeRequiredEvents:(BOOL)a3
{
  self->_flashRedOnPasscodeRequiredEvents = a3;
}

- (BOOL)successFeedbackWaitsUntilButtonUp
{
  return self->_successFeedbackWaitsUntilButtonUp;
}

- (void)setSuccessFeedbackWaitsUntilButtonUp:(BOOL)a3
{
  self->_successFeedbackWaitsUntilButtonUp = a3;
}

- (double)slowPressDuration
{
  return self->_slowPressDuration;
}

- (void)setSlowPressDuration:(double)a3
{
  self->_slowPressDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fifthFailureSettings, 0);
  objc_storeStrong((id *)&self->_fourthFailureSettings, 0);
  objc_storeStrong((id *)&self->_thirdFailureSettings, 0);
  objc_storeStrong((id *)&self->_secondFailureSettings, 0);
  objc_storeStrong((id *)&self->_firstFailureSettings, 0);
}

@end
