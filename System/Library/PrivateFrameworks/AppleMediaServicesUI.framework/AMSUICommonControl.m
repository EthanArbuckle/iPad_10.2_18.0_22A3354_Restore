@implementation AMSUICommonControl

- (AMSUICommonControl)init
{
  return -[AMSUICommonControl initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (AMSUICommonControl)initWithCoder:(id)a3
{
  AMSUICommonControl *v3;
  AMSUICommonControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonControl;
  v3 = -[AMSUICommonControl initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[AMSUICommonControl _setup](v3, "_setup");
  return v4;
}

- (AMSUICommonControl)initWithFrame:(CGRect)a3
{
  AMSUICommonControl *v3;
  AMSUICommonControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonControl;
  v3 = -[AMSUICommonControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AMSUICommonControl _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  -[AMSUICommonControl setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
}

- (BOOL)isTrackingMouse
{
  return self->_trackingMouse;
}

- (void)setTrackingMouse:(BOOL)a3
{
  self->_trackingMouse = a3;
}

@end
