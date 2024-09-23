@implementation LocalizedStringsCache.Key

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (int64_t)hash
{
  _TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_19CD17004();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key *v4;
  _TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_19CFE004C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_19CD3F404((uint64_t)v8);

  sub_19CD3F190((uint64_t)v8);
  return v6 & 1;
}

- (_TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key)init
{
  _TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key *result;

  result = (_TtCC9JetEngine21LocalizedStringsCacheP33_5B10CF4EC9E6563F43A45CEBFA8559793Key *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
