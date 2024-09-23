@implementation TodayCardThreeLineOverlayView

- (_TtC8AppStore29TodayCardThreeLineOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29TodayCardThreeLineOverlayView *)sub_1004BB0A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29TodayCardThreeLineOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004BC1FC();
}

- (void)layoutSubviews
{
  _TtC8AppStore29TodayCardThreeLineOverlayView *v2;

  v2 = self;
  sub_1004BB66C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore29TodayCardThreeLineOverlayView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1004BBA0C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8AppStore29TodayCardThreeLineOverlayView *v6;

  v5 = a3;
  v6 = self;
  sub_1004BBC20(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_headingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_descriptionLabel));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_clickActionHandler), *(_QWORD *)&self->headingLabel[OBJC_IVAR____TtC8AppStore29TodayCardThreeLineOverlayView_clickActionHandler]);
}

@end
