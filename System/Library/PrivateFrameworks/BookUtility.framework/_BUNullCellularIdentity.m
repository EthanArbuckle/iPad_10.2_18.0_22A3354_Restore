@implementation _BUNullCellularIdentity

- (_BUNullCellularIdentity)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_BUNullCellularIdentity;
  return -[BUCellularIdentity initWithSIMIdentity:roaming:](&v3, sel_initWithSIMIdentity_roaming_, CFSTR("00000000000000000000"), 0);
}

@end
