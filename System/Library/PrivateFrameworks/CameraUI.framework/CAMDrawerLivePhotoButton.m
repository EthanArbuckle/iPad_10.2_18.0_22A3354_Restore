@implementation CAMDrawerLivePhotoButton

- (int64_t)controlType
{
  return 1;
}

- (void)setLivePhotoMode:(int64_t)a3
{
  -[CAMDrawerLivePhotoButton setLivePhotoMode:animated:](self, "setLivePhotoMode:animated:", a3, 0);
}

- (void)setLivePhotoMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_livePhotoMode != a3)
  {
    self->_livePhotoMode = a3;
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
  LOBYTE(self) = v5 == -[CAMDrawerLivePhotoButton livePhotoMode](self, "livePhotoMode");

  return (char)self;
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
  void *v10;
  CAMControlDrawerMenuItem *v11;
  void *v12;
  void *v13;
  CAMControlDrawerMenuItem *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("LIVE_PHOTO_BUTTON_ON"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("LIVE_LIVE_PHOTO_BUTTON_ON"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v2, "initWithTitle:selectedTitle:value:", v3, v4, &unk_1EA3B0EC8);

  v6 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("LIVE_PHOTO_BUTTON_OFF"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("LIVE_LIVE_PHOTO_BUTTON_OFF"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v6, "initWithTitle:selectedTitle:value:", v7, v8, &unk_1EA3B0EE0);

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isLivePhotoAutoModeSupported"))
  {
    v11 = [CAMControlDrawerMenuItem alloc];
    CAMLocalizedFrameworkString(CFSTR("LIVE_PHOTO_BUTTON_AUTO"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CAMLocalizedFrameworkString(CFSTR("LIVE_LIVE_PHOTO_BUTTON_AUTO"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v11, "initWithTitle:selectedTitle:value:", v12, v13, &unk_1EA3B0EB0);

    v18[0] = v14;
    v18[1] = v5;
    v18[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17[0] = v5;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)didSelectMenuItem:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 != -[CAMDrawerLivePhotoButton livePhotoMode](self, "livePhotoMode"))
  {
    -[CAMDrawerLivePhotoButton setLivePhotoMode:animated:](self, "setLivePhotoMode:animated:", v5, 1);
    -[CAMDrawerLivePhotoButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (id)imageNameForCurrentState
{
  return CFSTR("livephoto");
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMDrawerLivePhotoButton livePhotoMode](self, "livePhotoMode") == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return (-[CAMDrawerLivePhotoButton livePhotoMode](self, "livePhotoMode") & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (id)imageNameForAXHUD
{
  __CFString *v3;

  if (-[CAMDrawerLivePhotoButton shouldShowSlashForCurrentState](self, "shouldShowSlashForCurrentState"))
  {
    v3 = CFSTR("livephoto.slash");
  }
  else
  {
    -[CAMDrawerLivePhotoButton imageNameForCurrentState](self, "imageNameForCurrentState");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)livePhotoMode
{
  return self->_livePhotoMode;
}

@end
