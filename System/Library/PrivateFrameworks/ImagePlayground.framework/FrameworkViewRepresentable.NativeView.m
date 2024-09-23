@implementation FrameworkViewRepresentable.NativeView

- (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView)initWithCoder:(id)a3
{
  id v4;
  _TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didCallBack) = 0;
  v4 = a3;

  result = (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *)sub_23EFD1FDC();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  id v2;
  _TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *v3;
  uint64_t v4;
  _TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *v5;

  v5 = self;
  v2 = -[FrameworkViewRepresentable.NativeView window](v5, sel_window);

  v3 = v5;
  if (v2)
  {
    v4 = OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didCallBack;
    if ((*((_BYTE *)&v5->super.super.super.isa
          + OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didCallBack) & 1) == 0)
    {
      (*(void (**)(_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *))((char *)&v5->super.super.super.isa + OBJC_IVAR____TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView_didMoveToWindowCallback))(v5);
      v3 = v5;
      *((_BYTE *)&v5->super.super.super.isa + v4) = 1;
    }
  }

}

- (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView)initWithFrame:(CGRect)a3
{
  _TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *result;

  result = (_TtCV15ImagePlayground26FrameworkViewRepresentableP33_DCF4C31057CB9F9727EE901E55C8E38810NativeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
