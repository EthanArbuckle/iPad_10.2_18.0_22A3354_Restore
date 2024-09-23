@implementation MCUIViewController

- (MCUIViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCUIViewController;
  return -[MCUIViewController init](&v3, sel_init);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MCUIViewController;
  -[MCUIViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)updateExtendedLayoutIncludesOpaqueBars
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D804B8], "appearance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MCUIViewController setExtendedLayoutIncludesOpaqueBars:](self, "setExtendedLayoutIncludesOpaqueBars:", objc_msgSend(v3, "extendedLayoutIncludesOpaqueBars"));

}

@end
