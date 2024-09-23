@implementation SessionView

- (void)layoutSubviews
{
  _TtC13MediaControls11SessionView *v2;

  v2 = self;
  sub_1AAA9AA28();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  _TtC13MediaControls11SessionView *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11SessionView_headerView);
  v6 = self;
  v7 = objc_msgSend(v5, sel_sizeThatFits_, width, height);
  v9 = v8;
  if (((*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v6->super.super.super.isa) + 0xE8))(v7) & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11SessionView_itemsView), sel_sizeThatFits_, width, height);
    v11 = v10;
    if (qword_1EEB961E8 != -1)
      swift_once();
    v12 = *(double *)&qword_1EEB96DE0;

    if (v12 >= v11)
      v13 = v11;
    else
      v13 = v12;
    v9 = v9 + v13;
  }
  v14 = width;
  v15 = v9;
  result.height = v15;
  result.width = v14;
  return result;
}

- (_TtC13MediaControls11SessionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA9B824();
}

- (_TtC13MediaControls11SessionView)initWithFrame:(CGRect)a3
{
  _TtC13MediaControls11SessionView *result;

  result = (_TtC13MediaControls11SessionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1AAA8F81C(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls11SessionView_sessionTapHandler), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC13MediaControls11SessionView_sessionTapHandler));
  sub_1AAA8F654((uint64_t)self + OBJC_IVAR____TtC13MediaControls11SessionView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls11SessionView_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls11SessionView_stylingProvider));
}

@end
