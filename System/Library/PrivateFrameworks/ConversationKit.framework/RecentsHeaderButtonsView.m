@implementation RecentsHeaderButtonsView

- (_TtC15ConversationKit24RecentsHeaderButtonsView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit24RecentsHeaderButtonsView *)RecentsHeaderButtonsView.init(frame:)();
}

- (_TtC15ConversationKit24RecentsHeaderButtonsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  RecentsHeaderButtonsView.init(coder:)();
}

- (void)didTapNewCallButton
{
  _TtC15ConversationKit24RecentsHeaderButtonsView *v2;

  v2 = self;
  RecentsHeaderButtonsView.didTapNewCallButton()();

}

- (void)didTapNewLinkButton
{
  _TtC15ConversationKit24RecentsHeaderButtonsView *v2;

  v2 = self;
  RecentsHeaderButtonsView.didTapNewLinkButton()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit24RecentsHeaderButtonsView *v6;
  _TtC15ConversationKit24RecentsHeaderButtonsView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  RecentsHeaderButtonsView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_headerDelegate));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_featureFlags);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_newFaceTimeButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_createLinkButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_bottomAnchorConstraint);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView____lazy_storage___buttonsView);
  outlined destroy of UIButton.Configuration?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView____lazy_storage___newFaceTimeButtonConfiguration);
  outlined destroy of UIButton.Configuration?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView____lazy_storage___createLinkButtonConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24RecentsHeaderButtonsView_buttonTitleParagraphStyle));
}

@end
