@implementation PushToTalkSessionDetailsView

- (_TtC15ConversationKit28PushToTalkSessionDetailsView)initWithFrame:(CGRect)a3
{
  PushToTalkSessionDetailsView.init(frame:)();
}

- (_TtC15ConversationKit28PushToTalkSessionDetailsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  PushToTalkSessionDetailsView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit28PushToTalkSessionDetailsView *v6;
  _TtC15ConversationKit28PushToTalkSessionDetailsView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PushToTalkSessionDetailsView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_avatarView));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView____lazy_storage___titleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_disclosureButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_textAreaLayoutGuide);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_disclosureButtonLayoutGuide);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_textAreaLeadingAnchorConstraint);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit28PushToTalkSessionDetailsView_textAreaCenterYAnchorConstraint));
}

@end
