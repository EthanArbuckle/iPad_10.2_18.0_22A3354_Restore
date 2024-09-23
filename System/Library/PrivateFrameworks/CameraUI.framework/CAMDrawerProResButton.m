@implementation CAMDrawerProResButton

- (int64_t)controlType
{
  return 13;
}

- (void)setProResVideoMode:(int64_t)a3
{
  -[CAMDrawerProResButton setProResVideoMode:animated:](self, "setProResVideoMode:animated:", a3, 0);
}

- (void)setProResVideoMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_proResVideoMode != a3)
  {
    self->_proResVideoMode = a3;
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
  LOBYTE(self) = v5 == -[CAMDrawerProResButton proResVideoMode](self, "proResVideoMode");

  return (char)self;
}

- (id)loadMenuItems
{
  void *v2;
  CAMControlDrawerMenuItem *v3;
  void *v4;
  void *v5;
  CAMControlDrawerMenuItem *v6;
  CAMControlDrawerMenuItem *v7;
  void *v8;
  void *v9;
  CAMControlDrawerMenuItem *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("PRO_RES_ON"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("PRO_RES_PRO_RES_ON"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v3, "initWithTitle:selectedTitle:value:", v4, v5, &unk_1EA3B0EC8);

  objc_msgSend(v2, "addObject:", v6);
  v7 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("PRO_RES_OFF"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("PRO_RES_PRO_RES_OFF"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v7, "initWithTitle:selectedTitle:value:", v8, v9, &unk_1EA3B0EE0);

  objc_msgSend(v2, "addObject:", v10);
  return v2;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CAMDrawerProResButton proResVideoMode](self, "proResVideoMode");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (v5 != v7)
  {
    -[CAMDrawerProResButton setProResVideoMode:animated:](self, "setProResVideoMode:animated:", v7, 1);
    -[CAMDrawerProResButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (id)imageNameForCurrentState
{
  return CFSTR("CAMProResDrawerButtonOn");
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMDrawerProResButton proResVideoMode](self, "proResVideoMode") == 0;
}

- (id)imageNameForAXHUD
{
  __CFString *v3;

  if (-[CAMDrawerProResButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
  {
    v3 = CFSTR("CAMProResButtonOff-AXHUD");
  }
  else
  {
    -[CAMDrawerProResButton imageNameForCurrentState](self, "imageNameForCurrentState");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)proResVideoMode
{
  return self->_proResVideoMode;
}

@end
