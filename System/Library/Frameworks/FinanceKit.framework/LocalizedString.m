@implementation LocalizedString

- (BOOL)isEqual:(id)a3
{
  _TtC10FinanceKit15LocalizedString *v4;
  _TtC10FinanceKit15LocalizedString *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23361EC24();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = LocalizedString.isEqual(_:)((uint64_t)v8);

  sub_23319F5C0((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC10FinanceKit15LocalizedString *v2;
  int64_t v3;

  v2 = self;
  v3 = LocalizedString.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10FinanceKit15LocalizedString)initWithCoder:(id)a3
{
  return (_TtC10FinanceKit15LocalizedString *)LocalizedString.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10FinanceKit15LocalizedString *v5;

  v4 = a3;
  v5 = self;
  LocalizedString.encode(with:)((NSCoder)v4);

}

- (_TtC10FinanceKit15LocalizedString)init
{
  _TtC10FinanceKit15LocalizedString *result;

  result = (_TtC10FinanceKit15LocalizedString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
