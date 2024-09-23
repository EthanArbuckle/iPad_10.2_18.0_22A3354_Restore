@implementation CAFUIStatusTableView

- (CAFUIStatusTableView)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAFUIStatusTableView;
  return -[CAFUIStatusTableView initWithFrame:style:](&v4, sel_initWithFrame_style_, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)update
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__CAFUIStatusTableView_update__block_invoke;
  block[3] = &unk_2508D1878;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __30__CAFUIStatusTableView_update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

@end
