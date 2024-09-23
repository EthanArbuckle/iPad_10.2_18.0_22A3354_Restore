@implementation AMSUICommonImageView

- (AMSUICommonImageView)init
{
  return -[AMSUICommonImageView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (AMSUICommonImageView)initWithCoder:(id)a3
{
  AMSUICommonImageView *v3;
  AMSUICommonImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonImageView;
  v3 = -[AMSUICommonImageView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AMSUICommonImageView _setup](v3, "_setup");
  return v4;
}

- (AMSUICommonImageView)initWithFrame:(CGRect)a3
{
  AMSUICommonImageView *v3;
  AMSUICommonImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonImageView;
  v3 = -[AMSUICommonImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AMSUICommonImageView _setup](v3, "_setup");
  return v4;
}

@end
