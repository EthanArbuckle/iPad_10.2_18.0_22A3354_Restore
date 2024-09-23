@implementation DashboardSectionHeaderView

- (_TtC11Diagnostics26DashboardSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics26DashboardSectionHeaderView *)sub_1000D92F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics26DashboardSectionHeaderView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics26DashboardSectionHeaderView *)sub_1000D95D0(a3);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DashboardSectionHeaderView();
  v2 = (char *)v5.receiver;
  -[DashboardSectionHeaderView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button];
  v4 = objc_msgSend(v3, "layer", v5.receiver, v5.super_class);
  objc_msgSend(v3, "bounds");
  objc_msgSend(v4, "setCornerRadius:", CGRectGetHeight(v6) * 0.5);

}

- (void)buttonPressedWithSender:(id)a3
{
  id v4;
  _TtC11Diagnostics26DashboardSectionHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_1000DA704();

}

- (void)buttonDownWithSender:(id)a3
{
  id v5;
  id v6;
  _TtC11Diagnostics26DashboardSectionHeaderView *v7;
  id v8;
  id v9;

  v5 = objc_allocWithZone((Class)UIColor);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "initWithRed:green:blue:alpha:", 0.0, 0.5, 1.0, 0.125);
  v9 = objc_msgSend(v8, "CGColor");

  sub_1000DA370((uint64_t)v9);
}

- (void)buttonUpWithSender:(id)a3
{
  id v4;
  _TtC11Diagnostics26DashboardSectionHeaderView *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = self;
  v6 = -[DashboardSectionHeaderView tintColor](v5, "tintColor");
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "CGColor");

    sub_1000DA370((uint64_t)v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)tintColorDidChange
{
  _TtC11Diagnostics26DashboardSectionHeaderView *v2;
  id v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = -[DashboardSectionHeaderView tintColor](v2, "tintColor");
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "CGColor");

    sub_1000DA370((uint64_t)v5);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v8;
  id v9;

  sub_100035D74(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction), *(_QWORD *)&self->textSize[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_buttonAction]);
  swift_bridgeObjectRelease(*(DARootViewController **)&self->textSize[OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_text], v3, v4, v5, v6, v7, v8, v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics26DashboardSectionHeaderView_button));
}

@end
