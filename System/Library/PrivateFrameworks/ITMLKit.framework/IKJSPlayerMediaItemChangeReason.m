@implementation IKJSPlayerMediaItemChangeReason

- (IKJSPlayerMediaItemChangeReason)init
{
  void *v3;
  IKJSPlayerMediaItemChangeReason *v4;
  objc_super v6;

  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)IKJSPlayerMediaItemChangeReason;
  v4 = -[IKJSObject initWithAppContext:](&v6, sel_initWithAppContext_, v3);

  return v4;
}

- (int64_t)UNKNOWN
{
  return 0;
}

- (int64_t)PLAYED_TO_END
{
  return 1;
}

- (int64_t)FORWARDED_TO_END
{
  return 2;
}

- (int64_t)ERRORED
{
  return 3;
}

- (int64_t)PLAYLIST_CHANGED
{
  return 4;
}

- (int64_t)USER_INITIATED
{
  return 5;
}

@end
