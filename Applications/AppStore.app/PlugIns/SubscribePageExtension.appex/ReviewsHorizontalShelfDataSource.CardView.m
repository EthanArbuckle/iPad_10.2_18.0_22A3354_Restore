@implementation ReviewsHorizontalShelfDataSource.CardView

- (_TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView_reviewCell) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView_editorsChoiceCell) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ReviewsHorizontalShelfDataSource.CardView();
  v7 = -[ReviewsHorizontalShelfDataSource.CardView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  -[ReviewsHorizontalShelfDataSource.CardView setLayoutMargins:](v7, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  return v7;
}

- (_TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView)initWithCoder:(id)a3
{
  id v4;
  _TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView_reviewCell) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView_editorsChoiceCell) = 0;
  v4 = a3;

  result = (_TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/ReviewsHorizontalShelfDataSource.swift", 61, 2, 58, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView *v2;

  v2 = self;
  sub_100450120();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView_reviewCell));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22SubscribePageExtension32ReviewsHorizontalShelfDataSource8CardView_editorsChoiceCell));
}

@end
