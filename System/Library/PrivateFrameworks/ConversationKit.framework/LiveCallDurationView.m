@implementation LiveCallDurationView

- (void)dealloc
{
  _TtC15ConversationKit20LiveCallDurationView *v2;

  v2 = self;
  LiveCallDurationView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC15ConversationKit20LiveCallDurationView)initWithFrame:(CGRect)a3
{
  LiveCallDurationView.init(frame:)();
}

- (_TtC15ConversationKit20LiveCallDurationView)initWithCoder:(id)a3
{
  LiveCallDurationView.init(coder:)();
}

- (NSString)accessibilityLabel
{
  _TtC15ConversationKit20LiveCallDurationView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = self;
  LiveCallDurationView.accessibilityLabel.getter();
  v4 = v3;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1C3B72E00](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (void)setAccessibilityLabel:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC15ConversationKit20LiveCallDurationView *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  LiveCallDurationView.accessibilityLabel.setter(v4, v6);

}

- (double)alpha
{
  _TtC15ConversationKit20LiveCallDurationView *v2;
  double v3;
  double v4;

  v2 = self;
  LiveCallDurationView.alpha.getter();
  v4 = v3;

  return v4;
}

- (void)setAlpha:(double)a3
{
  _TtC15ConversationKit20LiveCallDurationView *v4;

  v4 = self;
  LiveCallDurationView.alpha.setter(a3);

}

- (BOOL)isHidden
{
  _TtC15ConversationKit20LiveCallDurationView *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = LiveCallDurationView.isHidden.getter();

  return v3 & 1;
}

- (void)setHidden:(BOOL)a3
{
  _TtC15ConversationKit20LiveCallDurationView *v4;

  v4 = self;
  LiveCallDurationView.isHidden.setter(a3);

}

- (void)didMoveToWindow
{
  _TtC15ConversationKit20LiveCallDurationView *v2;

  v2 = self;
  LiveCallDurationView.didMoveToWindow()();

}

- (void)layoutSubviews
{
  _TtC15ConversationKit20LiveCallDurationView *v2;

  v2 = self;
  LiveCallDurationView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _TtC15ConversationKit20LiveCallDurationView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = LiveCallDurationView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

@end
