@implementation BSUIAnimationFactorySettings

- (double)effectiveSlowDownFactor
{
  if (self->_slowAnimations)
    return self->_slowDownFactor;
  else
    return 1.0;
}

- (void)setDefaultValues
{
  -[BSUIAnimationFactorySettings setSlowAnimations:](self, "setSlowAnimations:", 0);
  -[BSUIAnimationFactorySettings setSlowDownFactor:](self, "setSlowDownFactor:", 4.0);
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
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("slowAnimations == YES"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Slow Animations"), CFSTR("slowAnimations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0D830F8], "rowWithTitle:valueKeyPath:", CFSTR("Slow Factor"), CFSTR("slowDownFactor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 1.0, 5.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "condition:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "moduleWithTitle:contents:", CFSTR("Slow Animations"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)slowAnimations
{
  return self->_slowAnimations;
}

- (void)setSlowAnimations:(BOOL)a3
{
  self->_slowAnimations = a3;
}

- (double)slowDownFactor
{
  return self->_slowDownFactor;
}

- (void)setSlowDownFactor:(double)a3
{
  self->_slowDownFactor = a3;
}

@end
