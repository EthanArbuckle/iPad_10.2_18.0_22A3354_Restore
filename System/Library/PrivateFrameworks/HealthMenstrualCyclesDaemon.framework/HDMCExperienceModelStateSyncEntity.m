@implementation HDMCExperienceModelStateSyncEntity

+ (HDStateSyncEntitySchema)stateEntitySchema
{
  if (qword_253E60D30 != -1)
    swift_once();
  return (HDStateSyncEntitySchema *)(id)qword_253E60D20;
}

- (HDMCExperienceModelStateSyncEntity)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ExperienceModelStateSyncEntity();
  return -[HDMCExperienceModelStateSyncEntity init](&v3, sel_init);
}

+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;

  swift_unknownObjectRetain();
  v9 = a4;
  v10 = a5;
  sub_219672F8C((uint64_t)a3, v9, (uint64_t)v10);

  swift_unknownObjectRelease();
  return 1;
}

+ (void)syncDidFinishWithResult:(int64_t)a3 stateStore:(id)a4 profile:(id)a5
{
  id v7;

  swift_getObjCClassMetadata();
  swift_unknownObjectRetain();
  v7 = a5;
  sub_219673218(a3, v7);
  swift_unknownObjectRelease();

}

@end
