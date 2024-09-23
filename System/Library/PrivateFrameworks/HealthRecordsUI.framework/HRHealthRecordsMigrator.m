@implementation HRHealthRecordsMigrator

- (HRHealthRecordsMigrator)initWithHealthStore:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  HRHealthRecordsMigrator *v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = qword_1ED6A4898;
  v6 = a3;
  if (v5 != -1)
    swift_once();
  v7 = qword_1ED6A7228;
  v8 = objc_allocWithZone(ObjectType);
  swift_retain();
  v9 = (HRHealthRecordsMigrator *)sub_1BC5E2780(v6, v7);

  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (void)migrateIfNeededWithCompletion:(id)a3
{
  void *v4;
  HRHealthRecordsMigrator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1BC5E2A7C((char *)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (HRHealthRecordsMigrator)init
{
  HRHealthRecordsMigrator *result;

  result = (HRHealthRecordsMigrator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
