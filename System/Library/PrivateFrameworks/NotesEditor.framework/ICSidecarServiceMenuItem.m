@implementation ICSidecarServiceMenuItem

- (NSString)type
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DD9D2140();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSData)data
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarServiceMenuItem_data);
  v3 = *(_QWORD *)&self->type[OBJC_IVAR___ICSidecarServiceMenuItem_data];
  sub_1DD8FE230(v2, v3);
  v4 = (void *)sub_1DD9D073C();
  sub_1DD8FE1B8(v2, v3);
  return (NSData *)v4;
}

- (ICSidecarServiceMenuItem)initWithType:(id)a3 data:(id)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1DD9D2170();
  v9 = v8;
  v10 = a4;
  v11 = sub_1DD9D0748();
  v13 = v12;

  v14 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarServiceMenuItem_type);
  *v14 = v7;
  v14[1] = v9;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarServiceMenuItem_data);
  *v15 = v11;
  v15[1] = v13;
  v17.receiver = self;
  v17.super_class = ObjectType;
  return -[ICSidecarServiceMenuItem init](&v17, sel_init);
}

- (ICSidecarServiceMenuItem)init
{
  ICSidecarServiceMenuItem *result;

  result = (ICSidecarServiceMenuItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1DD8FE1B8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarServiceMenuItem_data), *(_QWORD *)&self->type[OBJC_IVAR___ICSidecarServiceMenuItem_data]);
}

@end
