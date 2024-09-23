@implementation GamePolicyAssertion.Attribute.Privileged

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtCCC10GamePolicy19GamePolicyAssertion9Attribute10Privileged)init
{
  return (_TtCCC10GamePolicy19GamePolicyAssertion9Attribute10Privileged *)sub_23C96737C(self, (uint64_t)a2, type metadata accessor for GamePolicyAssertion.Attribute.Privileged);
}

- (NSString)description
{
  return (NSString *)(id)sub_23C976B34();
}

- (id)initWithCoder:(void *)a1
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)type metadata accessor for GamePolicyAssertion.Attribute();
  return objc_msgSendSuper2(&v2, sel_init);
}

@end
