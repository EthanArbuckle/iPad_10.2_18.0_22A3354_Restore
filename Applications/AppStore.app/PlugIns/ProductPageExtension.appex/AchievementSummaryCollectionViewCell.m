@implementation AchievementSummaryCollectionViewCell

- (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell *)sub_1001B89C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001B9804();
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension36AchievementSummaryCollectionViewCell *v3;

  v3 = self;
  sub_1001B9340((uint64_t)v3, v2);

}

- (void)configureBackgroundColor
{
  _TtC20ProductPageExtension36AchievementSummaryCollectionViewCell *v2;

  v2 = self;
  sub_1001B925C();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_itemLayoutContext);
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_metrics;
  v4 = type metadata accessor for AchievementSummaryLayout.Metrics(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_outOfTotalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_completedLabel));
}

@end
