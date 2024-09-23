@implementation GamePolicyAssertion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy19GamePolicyAssertion *v5;

  v4 = a3;
  v5 = self;
  GamePolicyAssertion.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy19GamePolicyAssertion)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy19GamePolicyAssertion *)GamePolicyAssertion.init(coder:)(a3);
}

- (int64_t)hash
{
  int64_t result;

  result = *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_identifier);
  if (result < 0)
    __break(1u);
  return result;
}

- (NSString)description
{
  return (NSString *)sub_23C966BC4(self, (uint64_t)a2, (void (*)(void))GamePolicyAssertion.description.getter);
}

- (_TtC10GamePolicy19GamePolicyAssertion)init
{
  _TtC10GamePolicy19GamePolicyAssertion *result;

  result = (_TtC10GamePolicy19GamePolicyAssertion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10GamePolicy19GamePolicyAssertion_target);
  swift_bridgeObjectRelease();
}

@end
