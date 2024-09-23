@implementation CSFocusSettings

- (void)setDefaultValues
{
  -[CSFocusSettings setGatesOnControlCenterAccess:](self, "setGatesOnControlCenterAccess:", 0);
  -[CSFocusSettings setRequiresAuthWithoutControlCenterAccess:](self, "setRequiresAuthWithoutControlCenterAccess:", 1);
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
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Blocks Interaction"), CFSTR("gatesOnControlCenterAccess"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Requests Authentication"), CFSTR("requiresAuthWithoutControlCenterAccess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D83078];
  v12[0] = v2;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:title:", v5, CFSTR("Control Center While Locked"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D83078];
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "moduleWithTitle:contents:", CFSTR("Focus Settings"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)gatesOnControlCenterAccess
{
  return *(&self->super.__isObservingChildren + 1);
}

- (void)setGatesOnControlCenterAccess:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 1) = a3;
}

- (BOOL)requiresAuthWithoutControlCenterAccess
{
  return *(&self->super.__isObservingChildren + 2);
}

- (void)setRequiresAuthWithoutControlCenterAccess:(BOOL)a3
{
  *(&self->super.__isObservingChildren + 2) = a3;
}

@end
