@implementation CAMDrawerFlashButton

- (int64_t)controlType
{
  return 0;
}

- (void)setFlashMode:(int64_t)a3
{
  -[CAMDrawerFlashButton setFlashMode:animated:](self, "setFlashMode:animated:", a3, 0);
}

- (void)setFlashMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    -[CAMControlDrawerButton updateImageAnimated:](self, "updateImageAnimated:", a4);
    -[CAMControlDrawerMenuButton updateLabelsIfNeeded](self, "updateLabelsIfNeeded");
  }
}

- (BOOL)isMenuItemSelected:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  LOBYTE(self) = v5 == -[CAMDrawerFlashButton flashMode](self, "flashMode");

  return (char)self;
}

- (void)setFlashUnavailable:(BOOL)a3
{
  if (self->_flashUnavailable != a3)
  {
    self->_flashUnavailable = a3;
    -[CAMControlDrawerButton updateImage](self, "updateImage");
  }
}

- (id)loadMenuItems
{
  CAMControlDrawerMenuItem *v2;
  void *v3;
  void *v4;
  CAMControlDrawerMenuItem *v5;
  CAMControlDrawerMenuItem *v6;
  void *v7;
  void *v8;
  CAMControlDrawerMenuItem *v9;
  CAMControlDrawerMenuItem *v10;
  void *v11;
  void *v12;
  CAMControlDrawerMenuItem *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("FLASH_AUTO"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("FLASH_FLASH_AUTO"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v2, "initWithTitle:selectedTitle:value:", v3, v4, &unk_1EA3B0EB0);

  v6 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("FLASH_ON"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("FLASH_FLASH_ON"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v6, "initWithTitle:selectedTitle:value:", v7, v8, &unk_1EA3B0EC8);

  v10 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("FLASH_OFF"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("FLASH_FLASH_OFF"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v10, "initWithTitle:selectedTitle:value:", v11, v12, &unk_1EA3B0EE0);

  v16[0] = v5;
  v16[1] = v9;
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)didSelectMenuItem:(id)a3
{
  int64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (!-[CAMDrawerFlashButton isFlashUnavailable](self, "isFlashUnavailable"))
  {
    v4 = -[CAMDrawerFlashButton flashMode](self, "flashMode");
    objc_msgSend(v7, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 != v4)
    {
      -[CAMDrawerFlashButton setFlashMode:animated:](self, "setFlashMode:animated:", v6, 1);
      -[CAMDrawerFlashButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
    }
  }

}

- (id)imageNameForCurrentState
{
  if (-[CAMDrawerFlashButton isFlashUnavailable](self, "isFlashUnavailable"))
    return CFSTR("bolt.trianglebadge.exclamationmark.fill");
  else
    return CFSTR("bolt.fill");
}

- (id)imageNameForAXHUD
{
  __CFString *v3;

  if (-[CAMDrawerFlashButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
  {
    v3 = CFSTR("bolt.slash.fill");
  }
  else
  {
    -[CAMDrawerFlashButton imageNameForCurrentState](self, "imageNameForCurrentState");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return -[CAMDrawerFlashButton flashMode](self, "flashMode") == 1;
}

- (id)imageSymbolColorConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (!-[CAMDrawerFlashButton isFlashUnavailable](self, "isFlashUnavailable"))
    return 0;
  v2 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemYellowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.5, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationWithPaletteColors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isExpandable
{
  return !-[CAMDrawerFlashButton isFlashUnavailable](self, "isFlashUnavailable");
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  if (-[CAMDrawerFlashButton flashMode](self, "flashMode"))
    return 0;
  else
    return !-[CAMDrawerFlashButton isFlashUnavailable](self, "isFlashUnavailable");
}

- (BOOL)isFlashUnavailable
{
  return self->_flashUnavailable;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

@end
