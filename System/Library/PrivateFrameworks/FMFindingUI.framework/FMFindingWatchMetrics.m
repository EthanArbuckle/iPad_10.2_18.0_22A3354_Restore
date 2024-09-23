@implementation FMFindingWatchMetrics

- (_TtC11FMFindingUI21FMFindingWatchMetrics)init
{
  return (_TtC11FMFindingUI21FMFindingWatchMetrics *)FMFindingWatchMetrics.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC11FMFindingUI21FMFindingWatchMetrics_instanceIdentifier;
  v4 = sub_23AA32E1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11FMFindingUI21FMFindingWatchMetrics_startTime;
  v6 = sub_23AA32DC8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
