@implementation AAEventData

- (NSString)eventID
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSDate)eventDate
{
  return (NSDate *)(id)sub_1A5F63EA8();
}

- (NSString)eventPath
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSString)sessionID
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSString)appSessionID
{
  void *v2;

  if (*(_QWORD *)&self->eventID[OBJC_IVAR___AAEventData_appSessionID])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A5F6410C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
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

- (AAEventData)init
{
  AAEventData *result;

  result = (AAEventData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AAEventData_eventDate;
  v4 = sub_1A5F63F08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
