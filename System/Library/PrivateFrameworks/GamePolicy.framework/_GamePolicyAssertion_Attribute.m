@implementation _GamePolicyAssertion_Attribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_GamePolicyAssertion_Attribute)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return -[_GamePolicyAssertion_Attribute init](&v4, sel_init);
}

- (_GamePolicyAssertion_Attribute)init
{
  return (_GamePolicyAssertion_Attribute *)sub_23C96737C(self, (uint64_t)a2, type metadata accessor for GamePolicyAssertion.Attribute);
}

- (NSString)description
{
  return (NSString *)(id)sub_23C976B34();
}

@end
