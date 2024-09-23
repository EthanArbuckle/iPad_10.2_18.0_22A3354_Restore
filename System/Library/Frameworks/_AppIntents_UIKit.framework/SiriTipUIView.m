@implementation SiriTipUIView

- (BOOL)isPresented
{
  char v2;

  SiriTipUIView.isPresented.getter();
  return v2 & 1;
}

- (void)setIsPresented:(BOOL)a3
{
  _TtC17_AppIntents_UIKit13SiriTipUIView *v4;

  v4 = self;
  SiriTipUIView.isPresented.setter(a3);

}

- (_TtC17_AppIntents_UIKit13SiriTipUIView)initWithCoder:(id)a3
{
  sub_2217C01D4(a3);
  return 0;
}

- (CGSize)intrinsicContentSize
{
  _TtC17_AppIntents_UIKit13SiriTipUIView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  SiriTipUIView.intrinsicContentSize.getter();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC17_AppIntents_UIKit13SiriTipUIView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = SiriTipUIView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didMoveToWindow
{
  _TtC17_AppIntents_UIKit13SiriTipUIView *v2;

  v2 = self;
  SiriTipUIView.didMoveToWindow()();

}

- (_TtC17_AppIntents_UIKit13SiriTipUIView)initWithFrame:(CGRect)a3
{
  SiriTipUIView.init(frame:)();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_style;
  v4 = OUTLINED_FUNCTION_3_3();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_hostingView));
  swift_bridgeObjectRelease();
  sub_2217B9BE0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC17_AppIntents_UIKit13SiriTipUIView_phraseFetchBlock));
}

@end
