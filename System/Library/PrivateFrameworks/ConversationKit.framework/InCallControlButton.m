@implementation InCallControlButton

- (BOOL)isSelected
{
  _TtC15ConversationKit19InCallControlButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = InCallControlButton.isSelected.getter();

  return v3 & 1;
}

- (void)setSelected:(BOOL)a3
{
  _TtC15ConversationKit19InCallControlButton *v4;

  v4 = self;
  InCallControlButton.isSelected.setter(a3);

}

- (BOOL)isHighlighted
{
  _TtC15ConversationKit19InCallControlButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = InCallControlButton.isHighlighted.getter();

  return v3 & 1;
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC15ConversationKit19InCallControlButton *v4;

  v4 = self;
  InCallControlButton.isHighlighted.setter(a3);

}

- (BOOL)isEnabled
{
  _TtC15ConversationKit19InCallControlButton *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = InCallControlButton.isEnabled.getter();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  _TtC15ConversationKit19InCallControlButton *v4;

  v4 = self;
  InCallControlButton.isEnabled.setter(a3);

}

- (_TtC15ConversationKit19InCallControlButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlButton.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit19InCallControlButton *v2;

  v2 = self;
  InCallControlButton.layoutSubviews()();

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (_TtC15ConversationKit19InCallControlButton)initWithFrame:(CGRect)a3
{
  InCallControlButton.init(frame:)();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discBackgroundEffectView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discBackgroundVibrancyView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discBackgroundFlatView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_imageView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_paragraphStyle);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_label);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_discView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit19InCallControlButton_image);
  swift_release();
  outlined consume of SymbolImageDescription?(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(void **)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super._animationInfo+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription), *(void **)((char *)&self->super.super._traitChangeRegistry+ OBJC_IVAR____TtC15ConversationKit19InCallControlButton_symbolDescription));
  swift_bridgeObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit19InCallControlButton_menuDataSource);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC15ConversationKit19InCallControlButton *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  v9 = (void *)InCallControlButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  @objc InCallControlButton.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))InCallControlButton.contextMenuInteraction(_:willDisplayMenuFor:animator:));
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  @objc InCallControlButton.contextMenuInteraction(_:willDisplayMenuFor:animator:)(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, id, uint64_t))InCallControlButton.contextMenuInteraction(_:willEndFor:animator:));
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15ConversationKit19InCallControlButton *v11;
  UIPointerRegionRequest v12;
  UIPointerRegion v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v14 = (void *)InCallControlButton.pointerInteraction(_:regionFor:defaultRegion:)((UIPointerInteraction)v8, v12, v13);

  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit19InCallControlButton *v8;
  UIPointerRegion v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v10 = (void *)InCallControlButton.pointerInteraction(_:styleFor:)((UIPointerInteraction)v6, v9);

  return v10;
}

@end
