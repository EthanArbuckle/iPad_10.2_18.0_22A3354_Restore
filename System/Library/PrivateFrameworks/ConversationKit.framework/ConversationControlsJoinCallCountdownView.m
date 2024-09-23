@implementation ConversationControlsJoinCallCountdownView

- (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView *)ConversationControlsJoinCallCountdownView.init(frame:)();
}

- (_TtC15ConversationKit41ConversationControlsJoinCallCountdownView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationControlsJoinCallCountdownView.init(coder:)();
}

- (CGRect)frame
{
  _TtC15ConversationKit41ConversationControlsJoinCallCountdownView *v2;
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
  ConversationControlsJoinCallCountdownView.frame.getter();
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
  _TtC15ConversationKit41ConversationControlsJoinCallCountdownView *v3;

  v3 = self;
  ConversationControlsJoinCallCountdownView.frame.setter();

}

- (void)initializeCountdownWithInitialValue:(double)a3 fullValue:(double)a4
{
  _TtC15ConversationKit41ConversationControlsJoinCallCountdownView *v6;

  v6 = self;
  ConversationControlsJoinCallCountdownView.initializeCountdown(with:fullValue:)(a3, a4);

}

- (void)startCountdown
{
  _TtC15ConversationKit41ConversationControlsJoinCallCountdownView *v2;

  v2 = self;
  ConversationControlsJoinCallCountdownView.startCountdown()();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_ringLayer));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_countdownLayer);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_percentageAnimation);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_fillColor);
  OUTLINED_FUNCTION_23_77(*(id *)((char *)&self->super.super.super.isa
                                + OBJC_IVAR____TtC15ConversationKit41ConversationControlsJoinCallCountdownView_strokeColor));
}

@end
