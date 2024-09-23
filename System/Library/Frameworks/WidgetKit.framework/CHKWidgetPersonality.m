@implementation CHKWidgetPersonality

- (NSString)extensionBundleIdentifier
{
  return (NSString *)sub_190990CB4();
}

- (NSString)kind
{
  return (NSString *)sub_190990CB4();
}

- (BOOL)matchesPersonality:(id)a3
{
  CHKWidgetPersonality *v5;
  char v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_190990EA0(a3);
  swift_unknownObjectRelease();

  return v6 & 1;
}

- (int64_t)hash
{
  CHKWidgetPersonality *v3;
  int64_t v4;

  sub_190A48814();
  v3 = self;
  swift_bridgeObjectRetain();
  sub_190A47B18();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_190A47B18();
  swift_bridgeObjectRelease();
  v4 = sub_190A487FC();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CHKWidgetPersonality *v4;
  CHKWidgetPersonality *v5;
  unsigned __int8 v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190A481B4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1909911A8((uint64_t)v8);

  sub_1908B4324((uint64_t)v8);
  return v6 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHKWidgetPersonality)initWithCoder:(id)a3
{
  return (CHKWidgetPersonality *)WidgetPersonality.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CHKWidgetPersonality *v5;

  v4 = a3;
  v5 = self;
  sub_19099144C(v4);

}

- (NSString)description
{
  CHKWidgetPersonality *v2;
  void *v3;

  v2 = self;
  swift_bridgeObjectRetain();
  sub_190A47B3C();
  swift_bridgeObjectRelease();
  sub_190A47B3C();
  swift_bridgeObjectRetain();
  sub_190A47B3C();
  swift_bridgeObjectRelease();
  sub_190A47B3C();

  v3 = (void *)sub_190A47AC4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CHKWidgetPersonality)init
{
  CHKWidgetPersonality *result;

  result = (CHKWidgetPersonality *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
