@implementation AARawEvent

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (AARawEvent)initWithName:(id)a3 properties:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t *v10;
  uint64_t v11;
  AARawEvent *v12;
  void *v13;
  id v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_1A5F64130();
  v8 = v7;
  type metadata accessor for BridgedRawEventProperty();
  v9 = (objc_class *)sub_1A5F640B8();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___AARawEvent_name);
  *v10 = v6;
  v10[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_properties) = v9;
  v11 = qword_1ED1CC1A8;
  v12 = self;
  if (v11 != -1)
    swift_once();
  v13 = (void *)qword_1ED1CC1A0;
  *(Class *)((char *)&v12->super.isa + OBJC_IVAR___AARawEvent_sessionGroup) = (Class)qword_1ED1CC1A0;
  *(Class *)((char *)&v12->super.isa + OBJC_IVAR___AARawEvent_timestampGranularity) = 0;
  v14 = v13;

  v16.receiver = v12;
  v16.super_class = ObjectType;
  return -[AARawEvent init](&v16, sel_init);
}

- (AARawEvent)initWithName:(id)a3 sessionGroup:(id)a4 timestampGranularity:(int64_t)a5 properties:(id)a6
{
  objc_class *ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t *v14;
  id v15;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = sub_1A5F64130();
  v12 = v11;
  type metadata accessor for BridgedRawEventProperty();
  v13 = (objc_class *)sub_1A5F640B8();
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___AARawEvent_name);
  *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_properties) = v13;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_sessionGroup) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_timestampGranularity) = (Class)a5;
  v17.receiver = self;
  v17.super_class = ObjectType;
  v15 = a4;
  return -[AARawEvent init](&v17, sel_init);
}

- (AARawEvent)init
{
  AARawEvent *result;

  result = (AARawEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
