@implementation XavierGroupingService

- (id)bestOfGroupFromHeadlines:(id)a3 configurationSet:(int64_t)a4
{
  unint64_t v5;
  void *v6;

  sub_1D5B54DF0(0, &qword_1ED9BE6F0);
  v5 = sub_1D5D1EF80();
  swift_retain();
  XavierGroupingService.bestOfGroup(fromHeadlines:configurationSet:)(v5, a4);
  swift_release();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_1D5D1EF68();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)bestOfGroupFromFeedItems:(id)a3 scoreProfiles:(id)a4 configurationSet:(int64_t)a5
{
  unint64_t v7;
  id v8;
  void *v9;

  sub_1D5B54DF0(0, (unint64_t *)&qword_1ED9C0BB0);
  v7 = sub_1D5D1EF80();
  v8 = a4;
  swift_retain();
  XavierGroupingService.bestOfGroup(fromFeedItems:scoreProfiles:configurationSet:)(v7, v8, a5);

  swift_release();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_1D5D1EF68();
  swift_bridgeObjectRelease();
  return v9;
}

@end
