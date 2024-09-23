@implementation MapsSyncStoreConfig

- (int64_t)primary
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary);
}

- (int64_t)cache
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache);
}

+ (id)withConfigWithPrimary:(int64_t)a3 cache:(int64_t)a4
{
  objc_class *v6;
  char *v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for MapsSyncStoreConfig();
  v7 = (char *)objc_allocWithZone(v6);
  *(_QWORD *)&v7[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_primary] = a3;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8MapsSync19MapsSyncStoreConfig_cache] = a4;
  v9.receiver = v7;
  v9.super_class = v6;
  return objc_msgSendSuper2(&v9, sel_init);
}

+ (_TtC8MapsSync19MapsSyncStoreConfig)defaultStoreConfig
{
  return (_TtC8MapsSync19MapsSyncStoreConfig *)_s8MapsSync0aB11StoreConfigC07defaultcD0ACvgZ_0();
}

- (_TtC8MapsSync19MapsSyncStoreConfig)init
{
  _TtC8MapsSync19MapsSyncStoreConfig *result;

  result = (_TtC8MapsSync19MapsSyncStoreConfig *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
