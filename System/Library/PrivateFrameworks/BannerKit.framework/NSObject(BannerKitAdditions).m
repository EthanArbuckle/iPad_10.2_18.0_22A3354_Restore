@implementation NSObject(BannerKitAdditions)

- (id)uniquePresentableIdentifier
{
  id v4;
  void *v5;
  void *v7;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObject+BannerKit.m"), 22, CFSTR("Attempt to obtain unique presentable identifier from object that isn't a presentable: %@"), a1);

  }
  v4 = a1;
  objc_sync_enter(v4);
  objc_getAssociatedObject(v4, "com.apple.BannerKit.presentableUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v5;
}

@end
