@implementation AARawDataEvent

- (id)toDict
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F640A0();
  swift_bridgeObjectRelease();
  return v2;
}

- (AARawDataEvent)initWithName:(id)a3 dictionary:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_1A5F64130();
  v8 = v7;
  v9 = (objc_class *)sub_1A5F640B8();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___AARawDataEvent_name);
  *v10 = v6;
  v10[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawDataEvent_dictionary) = v9;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[AARawDataEvent init](&v12, sel_init);
}

+ (NSString)dataName
{
  NSString *result;

  result = (NSString *)sub_1A5F6470C();
  __break(1u);
  return result;
}

- (AARawDataEvent)init
{
  AARawDataEvent *result;

  result = (AARawDataEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
