@implementation MSVolumeViewController

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDDCCF8]);
  objc_msgSend(v3, "sizeToFit");
  -[MSVolumeViewController setView:](self, "setView:", v3);

}

@end
