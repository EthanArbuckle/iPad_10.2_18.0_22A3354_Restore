@implementation UARPProductGroupMFi

- (UARPProductGroupMFi)initWithProductGroup:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UARPProductGroupMFi;
  return -[UARPProductGroup initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

@end
