@implementation IKJSPlaylistEndAction

- (IKJSPlaylistEndAction)init
{
  void *v3;
  IKJSPlaylistEndAction *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKJSPlaylistEndAction;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (int64_t)STOP
{
  return 0;
}

- (int64_t)PAUSE
{
  return 1;
}

- (int64_t)WAIT_FOR_MORE_ITEMS
{
  return 2;
}

@end
