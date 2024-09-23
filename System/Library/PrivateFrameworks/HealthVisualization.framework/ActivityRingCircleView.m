@implementation ActivityRingCircleView

- (_TtC19HealthVisualization22ActivityRingCircleView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC19HealthVisualization22ActivityRingCircleView *v7;
  id v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization22ActivityRingCircleView____lazy_storage___activityRingView) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ActivityRingCircleView();
  v7 = -[ActivityRingCircleView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v8 = sub_1BCA19598();
  -[ActivityRingCircleView addSubview:](v7, sel_addSubview_, v8);

  v9 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  -[ActivityRingCircleView setBackgroundColor:](v7, sel_setBackgroundColor_, v9);

  return v7;
}

- (_TtC19HealthVisualization22ActivityRingCircleView)initWithCoder:(id)a3
{
  return (_TtC19HealthVisualization22ActivityRingCircleView *)sub_1BCA1972C(a3);
}

- (_TtC19HealthVisualization22ActivityRingCircleView)init
{
  _TtC19HealthVisualization22ActivityRingCircleView *v2;
  id v3;
  id v4;

  v2 = -[ActivityRingCircleView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v3 = sub_1BCA19598();
  -[ActivityRingCircleView addSubview:](v2, sel_addSubview_, v3);

  v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  -[ActivityRingCircleView setBackgroundColor:](v2, sel_setBackgroundColor_, v4);

  return v2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  _TtC19HealthVisualization22ActivityRingCircleView *v4;
  double v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = qword_1ED6C5FE0;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = *(double *)&qword_1ED6D39B0;
  v6 = -[ActivityRingCircleView traitCollection](v4, sel_traitCollection);
  v7 = objc_msgSend(v6, sel_preferredContentSizeCategory);

  LOBYTE(v6) = sub_1BCAB62AC();
  v8 = 1.0;
  if ((v6 & 1) != 0)
    v8 = 1.75;
  v9 = v5 * v8;
  v10 = v9;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC19HealthVisualization22ActivityRingCircleView *v2;

  v2 = self;
  sub_1BCA19984();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization22ActivityRingCircleView____lazy_storage___activityRingView));
}

@end
