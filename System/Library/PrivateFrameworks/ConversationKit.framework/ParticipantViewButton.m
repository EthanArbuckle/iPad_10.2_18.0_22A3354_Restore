@implementation ParticipantViewButton

- (BOOL)isSelected
{
  _TtC15ConversationKit21ParticipantViewButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ParticipantViewButton.isSelected.getter();

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  _TtC15ConversationKit21ParticipantViewButton *v4;

  v4 = self;
  ParticipantViewButton.isSelected.setter(a3);

}

- (BOOL)isHighlighted
{
  _TtC15ConversationKit21ParticipantViewButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ParticipantViewButton.isHighlighted.getter();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC15ConversationKit21ParticipantViewButton *v4;

  v4 = self;
  ParticipantViewButton.isHighlighted.setter(a3);

}

- (BOOL)isEnabled
{
  _TtC15ConversationKit21ParticipantViewButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = ParticipantViewButton.isEnabled.getter();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _TtC15ConversationKit21ParticipantViewButton *v4;

  v4 = self;
  ParticipantViewButton.isEnabled.setter(a3);

}

- (_TtC15ConversationKit21ParticipantViewButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ParticipantViewButton.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit21ParticipantViewButton *v2;

  v2 = self;
  ParticipantViewButton.layoutSubviews()();

}

- (_TtC15ConversationKit21ParticipantViewButton)initWithFrame:(CGRect)a3
{
  ParticipantViewButton.init(frame:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_imageView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_blurView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_discView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit21ParticipantViewButton_image);
  swift_bridgeObjectRelease();
}

@end
