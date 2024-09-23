@implementation CSLockScreenPasscodeSettings

- (void)setDefaultValues
{
  -[CSLockScreenPasscodeSettings setLightenSourceOverColorWhite:](self, "setLightenSourceOverColorWhite:", 1.0);
  -[CSLockScreenPasscodeSettings setLightenSourceOverColorAlpha:](self, "setLightenSourceOverColorAlpha:", 0.25);
  -[CSLockScreenPasscodeSettings setPlusDColorWhite:](self, "setPlusDColorWhite:", 0.0);
  -[CSLockScreenPasscodeSettings setPlusDColorAlpha:](self, "setPlusDColorAlpha:", 0.2);
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
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("LightenSourceOver White"), CFSTR("lightenSourceOverColorWhite"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "between:and:", 0.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("LightenSourceOver Alpha"), CFSTR("lightenSourceOverColorAlpha"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "between:and:", 0.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("plusD White"), CFSTR("plusDColorWhite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("plusD Alpha"), CFSTR("plusDColorAlpha"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "between:and:", 0.0, 1.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83078];
  v18[0] = v3;
  v18[1] = v5;
  v18[2] = v7;
  v18[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v17 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "moduleWithTitle:contents:", CFSTR("Passcode Settings"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (double)lightenSourceOverColorWhite
{
  return self->_lightenSourceOverColorWhite;
}

- (void)setLightenSourceOverColorWhite:(double)a3
{
  self->_lightenSourceOverColorWhite = a3;
}

- (double)lightenSourceOverColorAlpha
{
  return self->_lightenSourceOverColorAlpha;
}

- (void)setLightenSourceOverColorAlpha:(double)a3
{
  self->_lightenSourceOverColorAlpha = a3;
}

- (double)plusDColorWhite
{
  return self->_plusDColorWhite;
}

- (void)setPlusDColorWhite:(double)a3
{
  self->_plusDColorWhite = a3;
}

- (double)plusDColorAlpha
{
  return self->_plusDColorAlpha;
}

- (void)setPlusDColorAlpha:(double)a3
{
  self->_plusDColorAlpha = a3;
}

@end
