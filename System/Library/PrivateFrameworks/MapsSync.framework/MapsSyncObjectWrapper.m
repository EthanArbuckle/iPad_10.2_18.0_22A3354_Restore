@implementation MapsSyncObjectWrapper

- (id)copyWithZone:(void *)a3
{
  _TtC8MapsSync21MapsSyncObjectWrapper *v3;
  void *v4;
  uint64_t v6[4];

  v3 = self;
  sub_1A4151D88(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_1A423C7AC();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _TtC8MapsSync21MapsSyncObjectWrapper *v4;
  _TtC8MapsSync21MapsSyncObjectWrapper *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A423C488();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1A4152508((uint64_t)v8);

  sub_1A40CD40C((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  void *v3;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8MapsSync21MapsSyncObjectWrapper__managedObjectID);
  if (v3)
    return (int64_t)objc_msgSend(v3, sel_hash);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsSyncObjectWrapper();
  return -[MapsSyncObjectWrapper hash](&v5, sel_hash);
}

- (_TtC8MapsSync21MapsSyncObjectWrapper)init
{
  _TtC8MapsSync21MapsSyncObjectWrapper *result;

  result = (_TtC8MapsSync21MapsSyncObjectWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
