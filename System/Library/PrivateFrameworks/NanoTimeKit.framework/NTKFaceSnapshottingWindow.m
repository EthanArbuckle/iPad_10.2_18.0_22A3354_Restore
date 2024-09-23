@implementation NTKFaceSnapshottingWindow

- (NTKFaceSnapshottingWindow)init
{
  NTKFaceSnapshottingWindow *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKFaceSnapshottingWindow;
  v2 = -[NTKFaceSnapshottingWindow initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceSnapshottingWindow setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[NTKFaceSnapshottingWindow setOpaque:](v2, "setOpaque:", 1);
  }
  return v2;
}

- (void)updateForDevice:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  objc_msgSend(v4, "screenBounds");
  -[NTKFaceSnapshottingWindow setFrame:](self, "setFrame:");
  objc_msgSend(v4, "screenScale");
  v6 = v5;

  -[NTKFaceSnapshottingWindow setContentScaleFactor:](self, "setContentScaleFactor:", v6);
}

- (BOOL)_shouldUseRemoteContext
{
  return 1;
}

- (BOOL)_wantsSceneAssociation
{
  return 0;
}

- (BOOL)_isWindowServerHostingManaged
{
  return 1;
}

- (BOOL)_alwaysGetsContexts
{
  return 1;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end
