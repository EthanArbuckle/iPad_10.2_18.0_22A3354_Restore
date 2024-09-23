@implementation GCGameIntentBlocklist

void __GCGameIntentBlocklist_block_invoke()
{
  uint64_t v0;
  void *v1;

  +[NSSet setWithObjects:](&off_254DEBEC0, "setWithObjects:", CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.SafariViewService"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GCGameIntentBlocklist__gameIntentBlockList;
  GCGameIntentBlocklist__gameIntentBlockList = v0;

}

@end
