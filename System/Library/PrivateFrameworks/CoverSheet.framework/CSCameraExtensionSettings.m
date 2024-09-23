@implementation CSCameraExtensionSettings

- (void)setDefaultValues
{
  -[CSCameraExtensionSettings setCaptureExtensionsEnabled:](self, "setCaptureExtensionsEnabled:", 0);
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
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Launch Camera Extension from Quick Action Button"), CFSTR("captureExtensionsEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v11[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D83078];
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "moduleWithTitle:contents:", CFSTR("Camera Extension Settings"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)captureExtensionsEnabled
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setCaptureExtensionsEnabled:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

@end
