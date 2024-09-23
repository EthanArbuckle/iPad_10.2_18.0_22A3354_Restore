@implementation DismissibleBoldTitleHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_1A99E8B04(a3);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1A99E96C0);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1A99E989C);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1A99E9AEC(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1A99E9B84);
}

- (id)accessibilityAccessoryLabel
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_accessoryLabel);
  swift_beginAccess();
  return *v2;
}

- (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView *)DismissibleBoldTitleHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView *)DismissibleBoldTitleHeaderView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_heightConstraint));
  sub_1A980D878((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_dataSource, &qword_1ED27BF10, (uint64_t)&qword_1ED27BF08, (uint64_t)&protocol descriptor for TileHeaderDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_detailContainerView));
  swift_bridgeObjectRelease();
}

@end
