@implementation AAGroup

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSDate)startDate
{
  return (NSDate *)(id)sub_1A5F63EA8();
}

- (AAGroup)init
{
  AAGroup *result;

  result = (AAGroup *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___AAGroup_startDate;
  v4 = sub_1A5F63F08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
