@implementation SiriUIHostingView

- (BOOL)shouldAutomaticallyScaleContentInAmbient
{
  return 0;
}

- (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView)initWithCoder:(id)a3
{
  _TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView *result;

  result = (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000E1170, "Siri/SiriUIVisualResponseViewController.swift", 45, 2, 302, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)&self->SiriUICardSnippetView_opaque[OBJC_IVAR____TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView_rootView], "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v4.receiver;
  -[SiriUIHostingView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView_rootView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (BOOL)suppressVibrantBackground
{
  return 1;
}

- (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView)initWithFrame:(CGRect)a3
{
  _TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView *result;

  result = (_TtC4SiriP33_7351ACF3FB3EECEB6B17B4CD84C9F4C317SiriUIHostingView *)_swift_stdlib_reportUnimplementedInitializer("Siri.SiriUIHostingView", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
