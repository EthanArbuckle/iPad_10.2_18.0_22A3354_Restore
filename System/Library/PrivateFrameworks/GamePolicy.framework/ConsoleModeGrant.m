@implementation ConsoleModeGrant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10GamePolicy16ConsoleModeGrant)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return -[GamePolicyAssertion.Grant init](&v4, sel_init);
}

- (_TtC10GamePolicy16ConsoleModeGrant)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ConsoleModeGrant();
  return -[GamePolicyAssertion.Grant init](&v3, sel_init);
}

- (NSString)description
{
  return (NSString *)(id)sub_23C976B34();
}

@end
