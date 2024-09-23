@implementation CRSUIClimatePopoverAction

- (CRSUIClimatePopoverAction)init
{
  id v3;
  CRSUIClimatePopoverAction *v4;
  objc_super v6;

  v3 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v3, "setObject:forSetting:", 0, 1);
  v6.receiver = self;
  v6.super_class = (Class)CRSUIClimatePopoverAction;
  v4 = -[CRSUIClimatePopoverAction initWithInfo:responder:](&v6, sel_initWithInfo_responder_, v3, 0);

  return v4;
}

@end
