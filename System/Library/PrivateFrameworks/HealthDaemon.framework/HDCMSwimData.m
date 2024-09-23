@implementation HDCMSwimData

- (CMSwimData)data
{
  return (CMSwimData *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data));
}

- (NSDate)startDate
{
  return (NSDate *)sub_1B7858994((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], (SEL *)&selRef_startDate, (void (*)(void))MEMORY[0x1E0CB07E8], MEMORY[0x1E0CB06B8]);
}

- (NSDate)endDate
{
  return (NSDate *)sub_1B7858994((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], (SEL *)&selRef_endDate, (void (*)(void))MEMORY[0x1E0CB07E8], MEMORY[0x1E0CB06B8]);
}

- (int64_t)recordId
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_recordId);
}

- (NSUUID)sourceId
{
  return (NSUUID *)sub_1B7858994((char *)self, (uint64_t)a2, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], (SEL *)&selRef_sourceId, (void (*)(void))MEMORY[0x1E0CB0958], MEMORY[0x1E0CB0930]);
}

- (int64_t)lapCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_lapCount);
}

- (int64_t)segment
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_segment);
}

- (double)distance
{
  double result;

  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_distance);
  return result;
}

- (int64_t)strokeCount
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data), sel_strokeCount);
}

- (int64_t)strokeType
{
  _TtC12HealthDaemon12HDCMSwimData *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B7858BCC();

  return v3;
}

- (id)init:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12HealthDaemon12HDCMSwimData_data) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HDCMSwimData();
  v4 = a3;
  return -[HDCMSwimData init](&v6, sel_init);
}

- (_TtC12HealthDaemon12HDCMSwimData)init
{
  _TtC12HealthDaemon12HDCMSwimData *result;

  result = (_TtC12HealthDaemon12HDCMSwimData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
