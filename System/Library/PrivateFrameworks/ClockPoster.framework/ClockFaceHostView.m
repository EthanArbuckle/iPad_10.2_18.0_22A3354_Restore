@implementation ClockFaceHostView

- (_TtC11ClockPoster17ClockFaceHostView)initWithCoder:(id)a3
{
  id v4;
  _TtC11ClockPoster17ClockFaceHostView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC11ClockPoster17ClockFaceHostView_wasUnsupportedPortraitInterface) = 0;
  v4 = a3;

  result = (_TtC11ClockPoster17ClockFaceHostView *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)didMoveToSuperview
{
  UIView *v2;
  UIView *v3;
  UIView *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClockFaceHostView();
  v2 = (UIView *)v5.receiver;
  -[ClockFaceHostView didMoveToSuperview](&v5, sel_didMoveToSuperview);
  v3 = -[UIView superview](v2, sel_superview, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    -[UIView bounds](v3, sel_bounds);
    -[UIView setFrame:](v2, sel_setFrame_);
    UIView.cp_applyFullscreenConstraints(inContainer:)(v4);

    v2 = v4;
  }

}

- (void)layoutSubviews
{
  _TtC11ClockPoster17ClockFaceHostView *v2;

  v2 = self;
  sub_237E6E89C();

}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClockFaceHostView();
  return -[ClockFaceHostView tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ClockFaceHostView();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[ClockFaceHostView setTintColor:](&v8, sel_setTintColor_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC11ClockPoster17ClockFaceHostView_hostedClockFace];
  v7 = objc_msgSend(v5, sel_tintColor, v8.receiver, v8.super_class);
  objc_msgSend(v6, sel_setTintColor_, v7);

}

- (_TtC11ClockPoster17ClockFaceHostView)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster17ClockFaceHostView *result;

  result = (_TtC11ClockPoster17ClockFaceHostView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster17ClockFaceHostView_hostedClockFace));
}

@end
