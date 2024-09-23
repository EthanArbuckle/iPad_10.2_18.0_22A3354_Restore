@implementation AchievementSummaryCollectionViewCell

- (_TtC8AppStore36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36AchievementSummaryCollectionViewCell *)sub_1002FC0C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002FCF04();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC8AppStore36AchievementSummaryCollectionViewCell *v3;

  v3 = self;
  sub_1002FCA40((uint64_t)v3, v2);

}

- (void)configureBackgroundColor
{
  _TtC8AppStore36AchievementSummaryCollectionViewCell *v2;

  v2 = self;
  sub_1002FC95C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_itemLayoutContext);
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_metrics;
  v4 = type metadata accessor for AchievementSummaryLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_outOfTotalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36AchievementSummaryCollectionViewCell_completedLabel));
}

@end
