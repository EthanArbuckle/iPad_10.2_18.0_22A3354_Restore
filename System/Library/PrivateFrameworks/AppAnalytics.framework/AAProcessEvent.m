@implementation AAProcessEvent

- (NSString)name
{
  return (NSString *)sub_1A5F0DAF8();
}

- (NSString)version
{
  return (NSString *)sub_1A5F0DAF8();
}

- (AAJSON)json
{
  return (AAJSON *)*(id *)((char *)&self->super.isa + OBJC_IVAR___AAProcessEvent_json);
}

- (NSString)groupName
{
  void *v2;

  if (*(_QWORD *)&self->name[OBJC_IVAR___AAProcessEvent_groupName])
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

- (AAProcessEvent)init
{
  AAProcessEvent *result;

  result = (AAProcessEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end
