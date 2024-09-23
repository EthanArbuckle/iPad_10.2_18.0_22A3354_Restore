@implementation HUHomePodMediaUIVendor

+ (id)sharedInstance
{
  if (qword_1ED580AB8 != -1)
    dispatch_once(&qword_1ED580AB8, &__block_literal_global_87);
  return (id)_MergedGlobals_620;
}

void __40__HUHomePodMediaUIVendor_sharedInstance__block_invoke()
{
  HUHomePodMediaUIVendor *v0;
  void *v1;

  v0 = objc_alloc_init(HUHomePodMediaUIVendor);
  v1 = (void *)_MergedGlobals_620;
  _MergedGlobals_620 = (uint64_t)v0;

}

- (MRUNowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
}

@end
