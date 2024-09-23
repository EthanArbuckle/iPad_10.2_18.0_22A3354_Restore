@implementation TrainingLoadSummaryQuery

+ (Class)configurationClass
{
  type metadata accessor for TrainingLoadDaySummaryQueryConfiguration();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)queue_populateConfiguration:(id)a3
{
  HKQueryServerConfiguration *v4;
  _TtC13HealthBalance24TrainingLoadSummaryQuery *v5;

  v4 = (HKQueryServerConfiguration *)a3;
  v5 = self;
  TrainingLoadSummaryQuery.queue_populateConfiguration(_:)(v4);

}

- (void)queue_deliverError:(id)a3
{
  _TtC13HealthBalance24TrainingLoadSummaryQuery *v4;
  id v5;

  v5 = a3;
  v4 = self;
  TrainingLoadSummaryQuery.queue_deliverError(_:)(v5);

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return (*((_BYTE *)&self->super.super.isa
          + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_continueAfterInitialResults) & 1) == 0;
}

- (void)queue_queryDidDeactivate:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC13HealthBalance24TrainingLoadSummaryQuery *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = sub_23DC29E78();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DC29E6C();
  v9 = self;
  v10 = (void *)sub_23DC29E60();
  v13.receiver = v9;
  v13.super_class = ObjectType;
  -[HKQuery queue_queryDidDeactivate:](&v13, sel_queue_queryDidDeactivate_, v10);

  v11 = (Class *)((char *)&v9->super.super.isa
                + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_queue_resultsHandler);
  v12 = *(uint64_t *)((char *)&v9->super.super.isa
                   + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_queue_resultsHandler);
  *v11 = 0;
  v11[1] = 0;
  sub_23DBC9C24(v12);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

+ (id)clientInterfaceProtocol
{
  return &unk_256CF55A0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;

  swift_getObjCClassMetadata();
  v4 = a3;
  static TrainingLoadSummaryQuery.configureClientInterface(_:)(v4);

}

- (void)client_deliverTrainingLoadSampleDaySummaries:(id)a3 queryUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  _TtC13HealthBalance24TrainingLoadSummaryQuery *v10;
  uint64_t v11;

  v5 = sub_23DC29E78();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23DC2A34C();
  sub_23DC29E6C();
  v10 = self;
  TrainingLoadSummaryQuery.client_deliverTrainingLoadSampleDaySummaries(_:queryUUID:)(v9, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC13HealthBalance24TrainingLoadSummaryQuery)initWithQueryDescriptors:(id)a3
{
  _TtC13HealthBalance24TrainingLoadSummaryQuery *result;

  result = (_TtC13HealthBalance24TrainingLoadSummaryQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23DBDD388((uint64_t)self + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_morningIndexRange);
  v3 = (char *)self + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_gregorianCalendar;
  v4 = sub_23DC29F80();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23DBC9C24(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC13HealthBalance24TrainingLoadSummaryQuery_queue_resultsHandler));
  swift_bridgeObjectRelease();
}

@end
