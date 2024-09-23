@implementation AchievementSummaryCollectionViewCell

- (_TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell *)sub_100480860(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10048169C();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell *v2;

  v2 = self;
  sub_1004811D8();

}

- (void)configureBackgroundColor
{
  _TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell *v2;

  v2 = self;
  sub_1004810F4();

}

- (void).cxx_destruct
{
  char *v3;
  __n128 v4;
  uint64_t v5;

  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_itemLayoutContext);
  v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_metrics;
  v5 = type metadata accessor for AchievementSummaryLayout.Metrics(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_outOfTotalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36AchievementSummaryCollectionViewCell_completedLabel));
}

@end
