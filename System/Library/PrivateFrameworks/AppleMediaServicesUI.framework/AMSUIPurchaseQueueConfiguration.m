@implementation AMSUIPurchaseQueueConfiguration

- (AMSUIPurchaseQueueConfiguration)initWithBag:(id)a3
{
  AMSUIPurchaseQueueConfiguration *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUIPurchaseQueueConfiguration;
  v3 = -[AMSPurchaseQueueConfiguration initWithBag:](&v5, sel_initWithBag_, a3);
  if (v3)
    -[AMSPurchaseQueueConfiguration setPurchaseTaskClass:](v3, "setPurchaseTaskClass:", objc_opt_class());
  return v3;
}

@end
