@implementation TetraErrorHelpers

+ (BOOL)shouldMarkForStateResetWithString:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = specialized static TetraErrorHelpers.shouldMarkForStateReset(string:)(v3);

  return v4 & 1;
}

- (_TtC17MessageProtection17TetraErrorHelpers)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TetraErrorHelpers();
  return -[TetraErrorHelpers init](&v3, sel_init);
}

@end
