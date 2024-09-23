@implementation AASession

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)kind
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___AASession_kind);
}

- (NSString)name
{
  void *v2;

  if (*(_QWORD *)&self->identifier[OBJC_IVAR___AASession_name])
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

- (NSDate)startDate
{
  return (NSDate *)(id)sub_1A5F63EA8();
}

- (NSDictionary)sessionData
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F640A0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (AASession)init
{
  AASession *result;

  result = (AASession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AASession_startDate;
  v4 = sub_1A5F63F08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
