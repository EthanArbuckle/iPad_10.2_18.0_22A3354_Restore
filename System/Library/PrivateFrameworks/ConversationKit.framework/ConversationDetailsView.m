@implementation ConversationDetailsView

- (UIStackView)conversationDetailsVStack
{
  _TtC15ConversationKit23ConversationDetailsView *v2;
  void *v3;
  void *v4;

  v2 = self;
  ConversationDetailsView.conversationDetailsVStack.getter();
  v4 = v3;

  return (UIStackView *)v4;
}

- (void)setConversationDetailsVStack:(id)a3
{
  id v4;
  _TtC15ConversationKit23ConversationDetailsView *v5;

  v4 = a3;
  v5 = self;
  ConversationDetailsView.conversationDetailsVStack.setter((uint64_t)v4);

}

- (UILabel)conversationTitleLabel
{
  _TtC15ConversationKit23ConversationDetailsView *v2;
  void *v3;
  void *v4;

  v2 = self;
  ConversationDetailsView.conversationTitleLabel.getter();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setConversationTitleLabel:(id)a3
{
  id v4;
  _TtC15ConversationKit23ConversationDetailsView *v5;

  v4 = a3;
  v5 = self;
  ConversationDetailsView.conversationTitleLabel.setter((uint64_t)v4);

}

- (UILabel)conversationSubtitleLabel
{
  _TtC15ConversationKit23ConversationDetailsView *v2;
  void *v3;
  void *v4;

  v2 = self;
  ConversationDetailsView.conversationSubtitleLabel.getter();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setConversationSubtitleLabel:(id)a3
{
  id v4;
  _TtC15ConversationKit23ConversationDetailsView *v5;

  v4 = a3;
  v5 = self;
  ConversationDetailsView.conversationSubtitleLabel.setter((uint64_t)v4);

}

- (UILabel)chevronLabel
{
  _TtC15ConversationKit23ConversationDetailsView *v2;
  void *v3;
  void *v4;

  v2 = self;
  ConversationDetailsView.chevronLabel.getter();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setChevronLabel:(id)a3
{
  id v4;
  _TtC15ConversationKit23ConversationDetailsView *v5;

  v4 = a3;
  v5 = self;
  ConversationDetailsView.chevronLabel.setter((uint64_t)v4);

}

- (CGRect)frame
{
  _TtC15ConversationKit23ConversationDetailsView *v2;
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
  ConversationDetailsView.frame.getter();
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
  _TtC15ConversationKit23ConversationDetailsView *v3;

  v3 = self;
  ConversationDetailsView.frame.setter();

}

- (_TtC15ConversationKit23ConversationDetailsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationDetailsView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit23ConversationDetailsView *v6;
  _TtC15ConversationKit23ConversationDetailsView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ConversationDetailsView.traitCollectionDidChange(_:)(v8);

}

- (_TtC15ConversationKit23ConversationDetailsView)initWithFrame:(CGRect)a3
{
  ConversationDetailsView.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_recipe);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationDetailsVStack);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationSubtitleHStack);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_leadingAccessoryView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationTitleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___conversationSubtitleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView____lazy_storage___chevronLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_conversationSubtitleBadge);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit23ConversationDetailsView_controlsManager);
  swift_release();
}

@end
