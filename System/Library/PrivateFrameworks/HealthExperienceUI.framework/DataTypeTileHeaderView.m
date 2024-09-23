@implementation DataTypeTileHeaderView

- (_TtC18HealthExperienceUI22DataTypeTileHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22DataTypeTileHeaderView *)DataTypeTileHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22DataTypeTileHeaderView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI22DataTypeTileHeaderView *)DataTypeTileHeaderView.init(coder:)(a3);
}

- (void)didReceiveSignificantTimeChangeNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI22DataTypeTileHeaderView *v8;
  uint64_t v9;

  v4 = sub_1A9A91A74();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A91A38();
  v8 = self;
  sub_1A98E7734();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI22DataTypeTileHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_1A98EA504(a3);

}

- (id)accessibilityAccessoryLabel
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_accessoryLabel);
  swift_beginAccess();
  return *v2;
}

- (void)updateTitleText
{
  _TtC18HealthExperienceUI22DataTypeTileHeaderView *v2;

  v2 = self;
  sub_1A98EADD8();

}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_heightConstraint));
  sub_1A96235BC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_currentTileHeaderDetailKind, &qword_1ED27E868, (uint64_t (*)(uint64_t))type metadata accessor for TileHeaderDetailKind);
  sub_1A980D878((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_dataSource, &qword_1ED27BF10, (uint64_t)&qword_1ED27BF08, (uint64_t)&protocol descriptor for TileHeaderDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22DataTypeTileHeaderView_detailContainerView));
}

@end
