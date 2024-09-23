@implementation SessionsView

- (_TtC13MediaControls12SessionsView)initWithFrame:(CGRect)a3
{
  return (_TtC13MediaControls12SessionsView *)sub_1AAA82B6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC13MediaControls12SessionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA83FA0();
}

- (void)layoutSubviews
{
  _TtC13MediaControls12SessionsView *v2;

  v2 = self;
  sub_1AAA8320C();

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC13MediaControls12SessionsView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1AAA84180(v7);

  return v9 & 1;
}

- (void)backgroundTapAction:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  _TtC13MediaControls12SessionsView *v9;

  v4 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0x88);
  v5 = a3;
  v9 = self;
  if (v4())
  {
    v7 = v6;
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v7 + 24))(ObjectType, v7);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)visualStylingProviderDidChange:(id)a3
{
  _QWORD *v4;
  id v5;
  id v6;
  _TtC13MediaControls12SessionsView *v7;

  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls12SessionsView_sessionsContentView);
  v5 = a3;
  v7 = self;
  v6 = sub_1AAA83AFC();
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x2A8))(v6);

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls12SessionsView_sessionsContentView));
  sub_1AAA8429C((uint64_t)self + OBJC_IVAR____TtC13MediaControls12SessionsView_delegate);
  sub_1AAA824DC(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel), *(uint64_t *)((char *)&self->super._cachedTraitCollection + OBJC_IVAR____TtC13MediaControls12SessionsView_viewModel));
  swift_unknownObjectRelease();
  sub_1AAA842C0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC13MediaControls12SessionsView____lazy_storage___mtVisualStylingProvider));
  sub_1AAA842C0(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC13MediaControls12SessionsView____lazy_storage___stylingProvider));
}

@end
