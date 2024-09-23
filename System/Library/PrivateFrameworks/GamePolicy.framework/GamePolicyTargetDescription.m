@implementation GamePolicyTargetDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy27GamePolicyTargetDescription *v5;

  v4 = a3;
  v5 = self;
  GamePolicyTargetDescription.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy27GamePolicyTargetDescription)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy27GamePolicyTargetDescription *)GamePolicyTargetDescription.init(coder:)(a3);
}

- (int64_t)hash
{
  _TtC10GamePolicy27GamePolicyTargetDescription *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_23C976BD0();

  return v3;
}

- (NSString)description
{
  return (NSString *)sub_23C966BC4(self, (uint64_t)a2, (void (*)(void))GamePolicyTargetDescription.description.getter);
}

- (_TtC10GamePolicy27GamePolicyTargetDescription)init
{
  _TtC10GamePolicy27GamePolicyTargetDescription *result;

  result = (_TtC10GamePolicy27GamePolicyTargetDescription *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
