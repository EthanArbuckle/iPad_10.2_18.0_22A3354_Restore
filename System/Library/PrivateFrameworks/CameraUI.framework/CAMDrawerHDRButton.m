@implementation CAMDrawerHDRButton

- (int64_t)controlType
{
  return 5;
}

- (void)setAllowAutoHDR:(BOOL)a3
{
  if (self->_allowAutoHDR != a3)
  {
    self->_allowAutoHDR = a3;
    if (!a3 && -[CAMDrawerHDRButton hdrMode](self, "hdrMode") == 2)
      -[CAMDrawerHDRButton setHDRMode:](self, "setHDRMode:", -[CAMDrawerHDRButton allowHDROn](self, "allowHDROn"));
    -[CAMControlDrawerMenuButton setNeedsLoadMenuItems](self, "setNeedsLoadMenuItems");
  }
}

- (void)setAllowHDROn:(BOOL)a3
{
  uint64_t v4;

  if (self->_allowHDROn != a3)
  {
    self->_allowHDROn = a3;
    if (!a3 && -[CAMDrawerHDRButton hdrMode](self, "hdrMode") == 1)
    {
      if (-[CAMDrawerHDRButton allowAutoHDR](self, "allowAutoHDR"))
        v4 = 2;
      else
        v4 = 0;
      -[CAMDrawerHDRButton setHDRMode:](self, "setHDRMode:", v4);
    }
    -[CAMControlDrawerMenuButton setNeedsLoadMenuItems](self, "setNeedsLoadMenuItems");
  }
}

- (void)setHDRMode:(int64_t)a3
{
  -[CAMDrawerHDRButton setHDRMode:animated:](self, "setHDRMode:animated:", a3, 0);
}

- (void)setHDRMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_hdrMode != a3)
  {
    self->_hdrMode = a3;
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
  LOBYTE(self) = v5 == -[CAMDrawerHDRButton hdrMode](self, "hdrMode");

  return (char)self;
}

- (id)loadMenuItems
{
  void *v3;
  CAMControlDrawerMenuItem *v4;
  void *v5;
  void *v6;
  CAMControlDrawerMenuItem *v7;
  CAMControlDrawerMenuItem *v8;
  void *v9;
  void *v10;
  CAMControlDrawerMenuItem *v11;
  CAMControlDrawerMenuItem *v12;
  void *v13;
  void *v14;
  CAMControlDrawerMenuItem *v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMDrawerHDRButton allowAutoHDR](self, "allowAutoHDR"))
  {
    v4 = [CAMControlDrawerMenuItem alloc];
    CAMLocalizedFrameworkString(CFSTR("HDR_AUTO"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(CFSTR("HDR_HDR_AUTO"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v4, "initWithTitle:selectedTitle:value:", v5, v6, &unk_1EA3B0EB0);

    objc_msgSend(v3, "addObject:", v7);
  }
  if (-[CAMDrawerHDRButton allowHDROn](self, "allowHDROn"))
  {
    v8 = [CAMControlDrawerMenuItem alloc];
    CAMLocalizedFrameworkString(CFSTR("HDR_ON"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(CFSTR("HDR_HDR_ON"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v8, "initWithTitle:selectedTitle:value:", v9, v10, &unk_1EA3B0EC8);

    objc_msgSend(v3, "addObject:", v11);
  }
  v12 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("HDR_OFF"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("HDR_HDR_OFF"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v12, "initWithTitle:selectedTitle:value:", v13, v14, &unk_1EA3B0EE0);

  objc_msgSend(v3, "addObject:", v15);
  return v3;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CAMDrawerHDRButton hdrMode](self, "hdrMode");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  if (v7 != v5)
  {
    -[CAMDrawerHDRButton setHDRMode:animated:](self, "setHDRMode:animated:", v7, 1);
    -[CAMDrawerHDRButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (id)imageNameForCurrentState
{
  return CFSTR("CAMHDRDrawerButtonOn");
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMDrawerHDRButton hdrMode](self, "hdrMode") == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return -[CAMDrawerHDRButton hdrMode](self, "hdrMode") == 1 && -[CAMDrawerHDRButton allowAutoHDR](self, "allowAutoHDR");
}

- (id)imageNameForAXHUD
{
  if ((unint64_t)(-[CAMDrawerHDRButton hdrMode](self, "hdrMode") - 1) >= 2)
    return CFSTR("CAMHDRButtonOff-AXHUD");
  else
    return CFSTR("CAMHDRButton-AXHUD");
}

- (BOOL)allowAutoHDR
{
  return self->_allowAutoHDR;
}

- (BOOL)allowHDROn
{
  return self->_allowHDROn;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

@end
