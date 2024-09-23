@implementation ClientName

+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (a3)
  {
    v5 = sub_19A8C4944();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  swift_getObjCClassMetadata();
  static ClientName.extractClientNameFromUserAgent(_:allowAbbreviation:)(v5, v7, a4);
  v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_19A8C4938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)extractClientNameFromString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    v3 = sub_19A8C4944();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  static ClientName.extractClientNameFromString(_:)(v3, v5);
  v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    v8 = (void *)sub_19A8C4938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (_TtC10CoreParsec10ClientName)init
{
  return (_TtC10CoreParsec10ClientName *)ClientName.init()();
}

@end
