@implementation SessionItemsView

- (_TtC13MediaControls16SessionItemsView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls16SessionItemsView *)sub_1AAAB433C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls16SessionItemsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAAB61B0();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC13MediaControls16SessionItemsView *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = *(_QWORD *)(sub_1AAAB3F70() + 16);
  swift_bridgeObjectRelease();
  if (qword_1EEB96B20 != -1)
    swift_once();
  v6 = *(double *)&qword_1EEB96EC8;

  v7 = v6 * (double)v5;
  v8 = width;
  result.height = v7;
  result.width = v8;
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC13MediaControls16SessionItemsView *v11;
  uint64_t v12;

  v6 = sub_1AAABA0AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AAABA094();
  v10 = a3;
  v11 = self;
  sub_1AAAB62D0();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void).cxx_destruct
{
  sub_1AAA7B7EC((uint64_t)self + OBJC_IVAR____TtC13MediaControls16SessionItemsView_viewModel, &qword_1EEB93B20);
  swift_bridgeObjectRelease();
  sub_1AAA8F81C(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls16SessionItemsView_tapHandler), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC13MediaControls16SessionItemsView_tapHandler));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls16SessionItemsView____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls16SessionItemsView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls16SessionItemsView_stylingProvider));
}

@end
