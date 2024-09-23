@implementation LHStoreItem

- (unsigned)dataVersion
{
  unsigned int *v2;

  v2 = (unsigned int *)((char *)self + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_dataVersion);
  swift_beginAccess();
  return *v2;
}

- (void)setDataVersion:(unsigned int)a3
{
  unsigned int *v4;

  v4 = (unsigned int *)((char *)self + OBJC_IVAR____TtC20LighthouseBackground11LHStoreItem_dataVersion);
  swift_beginAccess();
  *v4 = a3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = sub_2402BD3F0();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)static LHStoreItem.event(with:dataVersion:)(v6, v8, a4);
  sub_24027F72C(v6, v8);
  return v9;
}

- (id)serialize
{
  _TtC20LighthouseBackground11LHStoreItem *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_2402B3EAC();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_2402BD3E4();
    sub_2402B5054(v3, v5);
  }
  return v6;
}

- (_TtC20LighthouseBackground11LHStoreItem)init
{
  _TtC20LighthouseBackground11LHStoreItem *result;

  result = (_TtC20LighthouseBackground11LHStoreItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
