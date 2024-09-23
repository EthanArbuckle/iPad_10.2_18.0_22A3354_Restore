@implementation HDAppAnalyticsAcceptanceStateSyncEntity

+ (HDStateSyncEntitySchema)stateEntitySchema
{
  if (qword_25431D9E8 != -1)
    swift_once();
  return (HDStateSyncEntitySchema *)(id)qword_25431D9E0;
}

+ (BOOL)updateDataWithStateStorage:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;

  swift_unknownObjectRetain();
  v9 = a4;
  v10 = a5;
  sub_23DB890A8(a3, v9, (uint64_t)v10);

  swift_unknownObjectRelease();
  return 1;
}

- (HDAppAnalyticsAcceptanceStateSyncEntity)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppAnalyticsAcceptanceStateSyncEntity();
  return -[HDAppAnalyticsAcceptanceStateSyncEntity init](&v3, sel_init);
}

@end
