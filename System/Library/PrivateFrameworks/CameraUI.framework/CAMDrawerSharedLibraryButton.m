@implementation CAMDrawerSharedLibraryButton

- (int64_t)controlType
{
  return 14;
}

- (void)setSharedLibraryMode:(int64_t)a3
{
  -[CAMDrawerSharedLibraryButton setSharedLibraryMode:animated:](self, "setSharedLibraryMode:animated:", a3, 0);
}

- (void)setSharedLibraryMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_sharedLibraryMode != a3)
  {
    self->_sharedLibraryMode = a3;
    -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", a4);
    -[CAMControlDrawerMenuButton updateLabelsIfNeeded](self, "updateLabelsIfNeeded");
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CAMSharedLibraryModeIsOn(objc_msgSend(v4, "integerValue"));
  LOBYTE(self) = v5 ^ CAMSharedLibraryModeIsOn(-[CAMDrawerSharedLibraryButton sharedLibraryMode](self, "sharedLibraryMode")) ^ 1;

  return (char)self;
}

- (id)loadMenuItems
{
  void *v2;
  CAMControlDrawerMenuItem *v3;
  void *v4;
  CAMControlDrawerMenuItem *v5;
  CAMControlDrawerMenuItem *v6;
  void *v7;
  CAMControlDrawerMenuItem *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("SHARED"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMControlDrawerMenuItem initWithTitle:value:](v3, "initWithTitle:value:", v4, &unk_1EA3B0EB0);

  objc_msgSend(v2, "addObject:", v5);
  v6 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("PERSONAL"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CAMControlDrawerMenuItem initWithTitle:value:](v6, "initWithTitle:value:", v7, &unk_1EA3B0EF8);

  objc_msgSend(v2, "addObject:", v8);
  return v2;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CAMDrawerSharedLibraryButton sharedLibraryMode](self, "sharedLibraryMode");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (v5 != v7)
  {
    -[CAMDrawerSharedLibraryButton setSharedLibraryMode:animated:](self, "setSharedLibraryMode:animated:", v7, 1);
    -[CAMDrawerSharedLibraryButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return CAMSharedLibraryModeIsOn(-[CAMDrawerSharedLibraryButton sharedLibraryMode](self, "sharedLibraryMode"));
}

- (id)imageNameForCurrentState
{
  return CFSTR("person.2.fill");
}

- (BOOL)shouldShowSlashForCurrentState
{
  return CAMSharedLibraryModeIsOn(-[CAMDrawerSharedLibraryButton sharedLibraryMode](self, "sharedLibraryMode")) ^ 1;
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (int64_t)sharedLibraryMode
{
  return self->_sharedLibraryMode;
}

@end
