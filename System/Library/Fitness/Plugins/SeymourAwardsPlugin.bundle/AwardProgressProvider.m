@implementation AwardProgressProvider

- (BOOL)providesProgressForTemplate:(id)a3
{
  id v4;
  _TtC19SeymourAwardsPlugin21AwardProgressProvider *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_232DBB358(v4);

  return v6 & 1;
}

- (_TtC19SeymourAwardsPlugin21AwardProgressProvider)init
{
  return (_TtC19SeymourAwardsPlugin21AwardProgressProvider *)sub_232DBB5A0();
}

- (void).cxx_destruct
{

}

- (id)providerIdentifier
{
  void *v2;

  sub_232DBD0E0();
  sub_232DBD0D4();
  v2 = (void *)sub_232DBD140();
  swift_bridgeObjectRelease();
  return v2;
}

- (void)requestAchievementProgressUpdatesForTemplates:(id)a3
{
  unint64_t v4;
  _TtC19SeymourAwardsPlugin21AwardProgressProvider *v5;

  sub_232DBBD3C(0, (unint64_t *)&unk_254235FA0);
  v4 = sub_232DBD164();
  v5 = self;
  sub_232DBB9B4(v4);

  swift_bridgeObjectRelease();
}

@end
