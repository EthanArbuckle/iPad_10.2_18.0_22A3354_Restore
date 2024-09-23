@implementation TabOverviewItemView.TitleView

- (_TtCC12MobileSafari19TabOverviewItemView9TitleView)init
{
  return -[TabOverviewItemView.TitleView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 160.0, 16.0);
}

- (_TtCC12MobileSafari19TabOverviewItemView9TitleView)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari19TabOverviewItemView9TitleView *)sub_18BA19C98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari19TabOverviewItemView9TitleView)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari19TabOverviewItemView9TitleView *)sub_18BA19E14(a3);
}

- (void)contentSizeCategoryDidChange
{
  _TtCC12MobileSafari19TabOverviewItemView9TitleView *v2;

  v2 = self;
  sub_18BA1A5F8();

}

- (void)layoutSubviews
{
  _TtCC12MobileSafari19TabOverviewItemView9TitleView *v2;

  v2 = self;
  sub_18BA1A7B8();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView9TitleView____lazy_storage___imageHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView9TitleView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView9TitleView____lazy_storage___imageWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView9TitleView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView9TitleView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari19TabOverviewItemView9TitleView_unreadIndicator));
}

@end
