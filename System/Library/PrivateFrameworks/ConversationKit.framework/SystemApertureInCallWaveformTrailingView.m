@implementation SystemApertureInCallWaveformTrailingView

- (_TtC15ConversationKit40SystemApertureInCallWaveformTrailingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SystemApertureInCallWaveformTrailingView.init(coder:)();
}

- (void)dealloc
{
  _TtC15ConversationKit40SystemApertureInCallWaveformTrailingView *v2;

  v2 = self;
  SystemApertureInCallWaveformTrailingView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit40SystemApertureInCallWaveformTrailingView_viewModel));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit40SystemApertureInCallWaveformTrailingView____lazy_storage___backdropLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit40SystemApertureInCallWaveformTrailingView____lazy_storage___localAudioView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit40SystemApertureInCallWaveformTrailingView____lazy_storage___remoteAudioView));
}

- (CGRect)frame
{
  _TtC15ConversationKit40SystemApertureInCallWaveformTrailingView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  SystemApertureInCallWaveformTrailingView.frame.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  _TtC15ConversationKit40SystemApertureInCallWaveformTrailingView *v3;

  v3 = self;
  SystemApertureInCallWaveformTrailingView.frame.setter();

}

- (void)layoutSubviews
{
  _TtC15ConversationKit40SystemApertureInCallWaveformTrailingView *v2;

  v2 = self;
  SystemApertureInCallWaveformTrailingView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC15ConversationKit40SystemApertureInCallWaveformTrailingView *v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  CGSize result;

  v3 = self;
  SystemApertureInCallWaveformTrailingView.sizeThatFits(_:)((CGSize)__PAIR128__(v5, v4));

  v6 = 43.0;
  v7 = 19.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  _TtC15ConversationKit40SystemApertureInCallWaveformTrailingView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = self;
  SystemApertureInCallWaveformTrailingView.sizeThatFits(_:for:)();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC15ConversationKit40SystemApertureInCallWaveformTrailingView)initWithFrame:(CGRect)a3
{
  SystemApertureInCallWaveformTrailingView.init(frame:)();
}

@end
