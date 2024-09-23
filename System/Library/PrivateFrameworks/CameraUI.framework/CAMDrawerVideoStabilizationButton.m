@implementation CAMDrawerVideoStabilizationButton

- (int64_t)controlType
{
  return 15;
}

- (void)setVideoStabilizationMode:(int64_t)a3
{
  -[CAMDrawerVideoStabilizationButton setVideoStabilizationMode:animated:](self, "setVideoStabilizationMode:animated:", a3, 0);
}

- (void)setVideoStabilizationMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_videoStabilizationMode != a3)
  {
    self->_videoStabilizationMode = a3;
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
  LOBYTE(self) = v5 == -[CAMDrawerVideoStabilizationButton videoStabilizationMode](self, "videoStabilizationMode");

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
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("ACTION_ON"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("ACTION_ACTION_ON"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v2, "initWithTitle:selectedTitle:value:", v3, v4, &unk_1EA3B0EC8);

  v6 = [CAMControlDrawerMenuItem alloc];
  CAMLocalizedFrameworkString(CFSTR("ACTION_OFF"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("ACTION_ACTION_OFF"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CAMControlDrawerMenuItem initWithTitle:selectedTitle:value:](v6, "initWithTitle:selectedTitle:value:", v7, v8, &unk_1EA3B0EE0);

  v12[0] = v5;
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)didSelectMenuItem:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[CAMDrawerVideoStabilizationButton videoStabilizationMode](self, "videoStabilizationMode");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  if (v5 != v7)
  {
    -[CAMDrawerVideoStabilizationButton setVideoStabilizationMode:animated:](self, "setVideoStabilizationMode:animated:", v7, 1);
    -[CAMDrawerVideoStabilizationButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  }
}

- (BOOL)shouldUseSlash
{
  return 1;
}

- (BOOL)shouldShowSlashForCurrentState
{
  return -[CAMDrawerVideoStabilizationButton videoStabilizationMode](self, "videoStabilizationMode") == 0;
}

- (BOOL)shouldUseActiveTintForCurrentState
{
  return -[CAMDrawerVideoStabilizationButton videoStabilizationMode](self, "videoStabilizationMode") != 0;
}

- (id)imageNameForCurrentState
{
  return CFSTR("figure.run.motion");
}

- (int64_t)videoStabilizationMode
{
  return self->_videoStabilizationMode;
}

@end
