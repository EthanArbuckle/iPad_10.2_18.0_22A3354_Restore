@implementation SessionsContentView

- (_TtC13MediaControls19SessionsContentView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls19SessionsContentView *)sub_1AAA85BA0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls19SessionsContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA8E7CC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  int v5;
  _TtC13MediaControls19SessionsContentView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = *((unsigned __int8 *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls19SessionsContentView_state);
  v6 = self;
  if (v5 == 2)
    v7 = sub_1AAA85FEC(width, height);
  else
    sub_1AAA86204(width, height);
  v9 = v7;
  v10 = v8;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_BYTE *, _QWORD);
  _QWORD *v14;
  _BYTE v15[32];
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for SessionsContentView();
  v2 = v16.receiver;
  v3 = -[SessionsContentView layoutSubviews](&v16, sel_layoutSubviews);
  v4 = (*(uint64_t (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x1A8))(v3);
  objc_msgSend(v2, sel_bounds);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v4 + 104))(v15);
  v14[1] = v6;
  v14[2] = v8;
  v14[3] = v10;
  v14[4] = v12;
  v13(v15, 0);
  swift_release();
  sub_1AAA88D80();

}

- (void).cxx_destruct
{
  sub_1AAA8429C((uint64_t)self + OBJC_IVAR____TtC13MediaControls19SessionsContentView_listener);
  sub_1AAA824DC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC13MediaControls19SessionsContentView_viewModel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls19SessionsContentView_itemTapHandler));
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls19SessionsContentView_sessionTapHandler));
  sub_1AAA8E77C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls19SessionsContentView_updateLayout));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls19SessionsContentView_stylingProvider));
}

@end
