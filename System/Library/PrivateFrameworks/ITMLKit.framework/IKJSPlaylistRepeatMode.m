@implementation IKJSPlaylistRepeatMode

- (IKJSPlaylistRepeatMode)init
{
  void *v3;
  IKJSPlaylistRepeatMode *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKJSPlaylistRepeatMode;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (int64_t)NONE
{
  return 0;
}

- (int64_t)ALL
{
  return 1;
}

- (int64_t)ONE
{
  return 2;
}

@end
