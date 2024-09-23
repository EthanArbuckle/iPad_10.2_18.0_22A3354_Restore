@implementation _ClientRendererWindow

- (_ClientRendererWindow)init
{
  _ClientRendererWindow *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_ClientRendererWindow;
  v2 = -[_ClientRendererWindow initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ClientRendererWindow setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[_ClientRendererWindow setOpaque:](v2, "setOpaque:", 1);
  }
  return v2;
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
