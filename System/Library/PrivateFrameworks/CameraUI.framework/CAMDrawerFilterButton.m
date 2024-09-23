@implementation CAMDrawerFilterButton

- (int64_t)controlType
{
  return 4;
}

- (BOOL)isSelfExpanding
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return CFSTR("camera.filters");
}

- (id)imageSymbolColorConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithHierarchicalColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setOn:(BOOL)a3
{
  if (self->_on != a3)
  {
    self->_on = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (BOOL)isOn
{
  return self->_on;
}

@end
