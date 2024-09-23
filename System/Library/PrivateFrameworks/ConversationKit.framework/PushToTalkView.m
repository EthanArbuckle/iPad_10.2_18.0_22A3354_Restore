@implementation PushToTalkView

- (_TtC15ConversationKit14PushToTalkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PushToTalkView.init(coder:)();
}

- (void)openPTTApp:(id)a3
{
  id v4;
  _TtC15ConversationKit14PushToTalkView *v5;

  v4 = a3;
  v5 = self;
  PushToTalkView.openPTTApp(_:)((UITapGestureRecognizer *)v5);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit14PushToTalkView *v6;
  _TtC15ConversationKit14PushToTalkView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PushToTalkView.traitCollectionDidChange(_:)(v8);

}

- (_TtC15ConversationKit14PushToTalkView)initWithFrame:(CGRect)a3
{
  PushToTalkView.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView_leaveButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView_talkButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView_pttSessionDetailsView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView____lazy_storage___leaveLabelButtonView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView____lazy_storage___talkLabelButtonView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView_leftMarginLayoutGuide);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView_rightMarginLayoutGuide);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit14PushToTalkView_centerContentLayoutGuide);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit14PushToTalkView_alwaysOnDisplayDimmingView));
}

@end
