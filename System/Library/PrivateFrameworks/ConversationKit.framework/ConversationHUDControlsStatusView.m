@implementation ConversationHUDControlsStatusView

- (_TtC15ConversationKit23ConversationDetailsView)conversationDetailsView
{
  _TtC15ConversationKit33ConversationHUDControlsStatusView *v2;
  void *v3;
  void *v4;

  v2 = self;
  ConversationHUDControlsStatusView.conversationDetailsView.getter();
  v4 = v3;

  return (_TtC15ConversationKit23ConversationDetailsView *)v4;
}

- (void)setConversationDetailsView:(id)a3
{
  id v4;
  _TtC15ConversationKit33ConversationHUDControlsStatusView *v5;

  v4 = a3;
  v5 = self;
  ConversationHUDControlsStatusView.conversationDetailsView.setter((uint64_t)v4);

}

- (_TtC15ConversationKit33ConversationHUDControlsStatusView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  ConversationHUDControlsStatusView.init(coder:)();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit33ConversationHUDControlsStatusView *v6;
  _TtC15ConversationKit33ConversationHUDControlsStatusView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  ConversationHUDControlsStatusView.traitCollectionDidChange(_:)(v8);

}

- (_TtC15ConversationKit33ConversationHUDControlsStatusView)initWithFrame:(CGRect)a3
{
  ConversationHUDControlsStatusView.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of ConversationControlsRecipe((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_recipe);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_controlsManager);
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_menuHostViewController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView____lazy_storage___conversationStatusHStack);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView____lazy_storage___trailingActionsView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView____lazy_storage___conversationDetailsView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit33ConversationHUDControlsStatusView_leadingAccessoryView));
}

- (void)setupRootView
{
  self;
  ConversationHUDControlsStatusView.setupRootView()();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15ConversationKit33ConversationHUDControlsStatusView *v11;
  UIPointerRegionRequest v12;
  UIPointerRegion v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v14 = (void *)ConversationHUDControlsStatusView.pointerInteraction(_:regionFor:defaultRegion:)((UIPointerInteraction)v8, v12, v13);

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit33ConversationHUDControlsStatusView *v8;
  UIPointerRegion v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10 = (void *)ConversationHUDControlsStatusView.pointerInteraction(_:styleFor:)((UIPointerInteraction)v6, v9);

  return v10;
}

@end
