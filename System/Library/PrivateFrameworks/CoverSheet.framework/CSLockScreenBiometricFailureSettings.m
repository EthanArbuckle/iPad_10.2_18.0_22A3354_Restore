@implementation CSLockScreenBiometricFailureSettings

- (void)setDefaultValues
{
  -[CSLockScreenBiometricFailureSettings setJiggleLock:](self, "setJiggleLock:", 1);
  -[CSLockScreenBiometricFailureSettings setVibrate:](self, "setVibrate:", 1);
  -[CSLockScreenBiometricFailureSettings setShowPasscode:](self, "setShowPasscode:", 1);
  -[CSLockScreenBiometricFailureSettings setWaitUntilButtonUp:](self, "setWaitUntilButtonUp:", 1);
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
  void *v12;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Jiggle Lock"), CFSTR("jiggleLock"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v2;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Vibrate"), CFSTR("vibrate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v3;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Show Passcode"), CFSTR("showPasscode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v4;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Wait Until Button Up"), CFSTR("waitUntilButtonUp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D83078];
  v12 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moduleWithTitle:contents:", CFSTR("Failure Settings"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)jiggleLock
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setJiggleLock:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)vibrate
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setVibrate:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

- (BOOL)showPasscode
{
  return *(&self->super.__isObservingChildren + 3);
}

- (void)setShowPasscode:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 3) = a3;
}

- (BOOL)waitUntilButtonUp
{
  return *(&self->super.__isObservingChildren + 4);
}

- (void)setWaitUntilButtonUp:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 4) = a3;
}

@end
