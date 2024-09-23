@implementation RequestNewSharingRelationshipCell

- (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell *)sub_1A9A2FA80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33RequestNewSharingRelationshipCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9A30BB4();
}

- (void).cxx_destruct
{
  sub_1A9643C10((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33RequestNewSharingRelationshipCell_item, (unint64_t *)&qword_1ED27B9E0, (void (*)(uint64_t))sub_1A96184A8);
  swift_bridgeObjectRelease();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI33RequestNewSharingRelationshipCell *v8;
  uint64_t v9;

  v4 = sub_1A9A93DB4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A93D9C();
  v8 = self;
  sub_1A9A305F0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
