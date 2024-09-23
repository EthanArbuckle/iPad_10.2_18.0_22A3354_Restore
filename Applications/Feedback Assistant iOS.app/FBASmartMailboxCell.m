@implementation FBASmartMailboxCell

- (UILabel)titleLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_titleLabel, a2);
}

- (void)setTitleLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_titleLabel, a3);
}

- (UIImageView)filterImage
{
  return (UIImageView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_filterImage, a2);
}

- (void)setFilterImage:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_filterImage, a3);
}

- (UILabel)countLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_countLabel, a2);
}

- (void)setCountLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_countLabel, a3);
}

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  NSString v3;

  if (qword_100115E40 != -1)
    swift_once(&qword_100115E40, sub_10008F688);
  v2 = unk_100119F80;
  swift_bridgeObjectRetain(unk_100119F80);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)awakeFromNib
{
  uint64_t v2;
  _TtC18Feedback_Assistant19FBASmartMailboxCell *v3;

  v3 = self;
  sub_10008F720((uint64_t)v3, v2);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant19FBASmartMailboxCell *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = -[FBASmartMailboxCell traitCollection](v5, "traitCollection");
  v7 = objc_msgSend(v6, "preferredContentSizeCategory");

  sub_10008F948((uint64_t)v7);
}

- (void)configureWithInbox:(id)a3
{
  id v4;
  _TtC18Feedback_Assistant19FBASmartMailboxCell *v5;

  v4 = a3;
  v5 = self;
  sub_10008FA74(v4, (uint64_t)v5);

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  return -[FBASmartMailboxCell isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  _TtC18Feedback_Assistant19FBASmartMailboxCell *v4;
  objc_super v5;

  v3 = a3;
  v4 = self;
  sub_1000905B0(v3);
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  -[FBASmartMailboxCell setHighlighted:](&v5, "setHighlighted:", v3);

}

- (_TtC18Feedback_Assistant19FBASmartMailboxCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_titleLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_filterImage, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_countLabel, 0);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  return -[FBASmartMailboxCell initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC18Feedback_Assistant19FBASmartMailboxCell)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_titleLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_filterImage, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_countLabel, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBASmartMailboxCell();
  return -[FBASmartMailboxCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_titleLabel);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_filterImage);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18Feedback_Assistant19FBASmartMailboxCell_countLabel);
}

@end
