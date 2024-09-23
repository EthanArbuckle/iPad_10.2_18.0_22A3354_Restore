@implementation TodayFeedQuerySidecar

- (id)additionalChannelsToQuery
{
  return sub_1D67A4234((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D67A38B4, (unint64_t *)&qword_1ED5F9930);
}

- (id)additionalSectionIDsToQueryForChannel:(id)a3
{
  void *v4;

  swift_unknownObjectRetain();
  swift_retain();
  sub_1D67A3CF8(a3);
  swift_unknownObjectRelease();
  swift_release();
  v4 = (void *)sub_1D6E26D68();
  swift_bridgeObjectRelease();
  return v4;
}

- (BOOL)shouldIncludePaidFeedForChannel:(id)a3
{
  return 1;
}

- (id)additionalTopicsToQuery
{
  return sub_1D67A4234((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_1D67A3F98, (unint64_t *)&qword_1ED5F42C0);
}

@end
