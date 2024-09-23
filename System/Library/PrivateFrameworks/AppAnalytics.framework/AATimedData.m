@implementation AATimedData

- (NSDate)startDate
{
  return (NSDate *)(id)sub_1A5F63EA8();
}

- (NSDate)endDate
{
  return (NSDate *)(id)sub_1A5F63EA8();
}

- (double)duration
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___AATimedData_duration);
}

+ (NSString)dataName
{
  return (NSString *)(id)sub_1A5F6410C();
}

- (id)toDict
{
  id result;

  result = (id)sub_1A5F6470C();
  __break(1u);
  return result;
}

- (AATimedData)init
{
  AATimedData *result;

  result = (AATimedData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___AATimedData_startDate;
  v4 = sub_1A5F63F08();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___AATimedData_endDate, v4);
}

@end
