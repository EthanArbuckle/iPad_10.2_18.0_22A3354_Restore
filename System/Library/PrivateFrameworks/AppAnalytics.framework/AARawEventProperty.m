@implementation AARawEventProperty

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (AARawEventProperty)initWithDataName:(id)a3 requirement:(int64_t)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_1A5F64130();
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___AARawEventProperty_dataName);
  *v8 = v7;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEventProperty_requirement) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[AARawEventProperty init](&v11, sel_init);
}

- (AARawEventProperty)init
{
  AARawEventProperty *result;

  result = (AARawEventProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
