@implementation AbsoluteVolumeControlView

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AbsoluteVolumeControlView(0);
  v2 = (char *)v4.receiver;
  -[AbsoluteVolumeControlView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_slider];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (_TtC13MediaControls25AbsoluteVolumeControlView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAA9D0CC();
}

- (CGRect)hitRect
{
  _QWORD *v2;
  id v3;
  void (*v4)(id);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for AbsoluteVolumeControlView(0);
  v2 = v21.receiver;
  v3 = -[AbsoluteVolumeControlView hitRect](&v21, sel_hitRect);
  v4 = *(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0x90);
  v4(v3);
  v7 = ((uint64_t (*)(uint64_t, uint64_t))v4)(v5, v6);
  v8 = ((uint64_t (*)(uint64_t))v4)(v7);
  v4((id)v8);
  UIRectInset();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC13MediaControls25AbsoluteVolumeControlView *v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[AbsoluteVolumeControlView hitRect](v8, sel_hitRect);
  v11.x = x;
  v11.y = y;
  v9 = CGRectContainsPoint(v12, v11);

  return v9;
}

- (void)sliderValueChanged:(id)a3
{
  id v4;
  _TtC13MediaControls25AbsoluteVolumeControlView *v5;

  v4 = a3;
  v5 = self;
  sub_1AAA9D5CC();

}

- (void)sliderTouchUpInside:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC13MediaControls25AbsoluteVolumeControlView *v6;

  v4 = *(void (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.super.isa) + 0xC8);
  v5 = a3;
  v6 = self;
  v4();

}

- (_TtC13MediaControls25AbsoluteVolumeControlView)initWithFrame:(CGRect)a3
{
  _TtC13MediaControls25AbsoluteVolumeControlView *result;

  result = (_TtC13MediaControls25AbsoluteVolumeControlView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_slider));
  sub_1AAA8429C((uint64_t)self + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_observer);
  sub_1AAA9C44C((uint64_t)self + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls25AbsoluteVolumeControlView_stylingProvider));
}

@end
