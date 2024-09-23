@implementation AMSUICommonButton

- (AMSUICommonButton)init
{
  AMSUICommonButton *v2;
  AMSUICommonButton *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonButton;
  v2 = -[AMSUICommonButton init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AMSUICommonButton _setup](v2, "_setup");
  return v3;
}

@end
