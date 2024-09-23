@implementation AASessionData

- (AASessionData)initWithKey:(id)a3 data:(id)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1A5F64130();
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___AASessionData_key);
  *v8 = v7;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AASessionData_data) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  swift_unknownObjectRetain();
  return -[AASessionData init](&v11, sel_init);
}

- (AASessionData)init
{
  AASessionData *result;

  result = (AASessionData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
