@implementation AAEventProperty

- (AAEventProperty)initWithDataType:(Class)a3 requirement:(int64_t)a4
{
  void *ObjCClassFromMetadata;
  AAEventProperty *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  objc_super v14;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAEventProperty_dataType) = (Class)swift_getObjCClassMetadata();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAEventProperty_requirement) = (Class)a4;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v7 = self;
  v8 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
  v9 = sub_1A5F64130();
  v11 = v10;

  v12 = (uint64_t *)((char *)v7 + OBJC_IVAR___AAEventProperty_dataKey);
  *v12 = v9;
  v12[1] = v11;

  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for BridgedEventProperty();
  return -[AAEventProperty init](&v14, sel_init);
}

- (AAEventProperty)init
{
  AAEventProperty *result;

  result = (AAEventProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
