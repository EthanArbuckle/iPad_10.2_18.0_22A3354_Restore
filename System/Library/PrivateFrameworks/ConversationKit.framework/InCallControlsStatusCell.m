@implementation InCallControlsStatusCell

- (UILabel)titleLabel
{
  _TtC15ConversationKit24InCallControlsStatusCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  InCallControlsStatusCell.titleLabel.getter();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setTitleLabel:(id)a3
{
  id v4;
  _TtC15ConversationKit24InCallControlsStatusCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsStatusCell.titleLabel.setter((uint64_t)v4);

}

- (UILabel)subtitleLabel
{
  _TtC15ConversationKit24InCallControlsStatusCell *v2;
  void *v3;
  void *v4;

  v2 = self;
  InCallControlsStatusCell.subtitleLabel.getter();
  v4 = v3;

  return (UILabel *)v4;
}

- (void)setSubtitleLabel:(id)a3
{
  id v4;
  _TtC15ConversationKit24InCallControlsStatusCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsStatusCell.subtitleLabel.setter((uint64_t)v4);

}

- (UIControl)actionButton
{
  return (UIControl *)InCallControlsStatusCell.actionButton.getter();
}

- (void)setActionButton:(id)a3
{
  id v5;
  _TtC15ConversationKit24InCallControlsStatusCell *v6;

  v5 = a3;
  v6 = self;
  InCallControlsStatusCell.actionButton.setter(a3);

}

- (_TtC15ConversationKit24InCallControlsStatusCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit24InCallControlsStatusCell *)InCallControlsStatusCell.init(frame:)();
}

- (_TtC15ConversationKit24InCallControlsStatusCell)initWithCoder:(id)a3
{
  InCallControlsStatusCell.init(coder:)((uint64_t)a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC15ConversationKit24InCallControlsStatusCell *v6;
  _TtC15ConversationKit24InCallControlsStatusCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  InCallControlsStatusCell.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  outlined consume of InCallControlsStatusCellViewModel?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(uint64_t *)((char *)&self->super.super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(uint64_t *)((char *)&self->super.super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel), *(void **)((char *)&self->super.super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_viewModel));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_menuHostViewController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_faceTimeSymbolImage);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_sharePlaySymbolImage);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___iconImageView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___titleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___subtitleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell_actionButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___conversationStatusHStack);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit24InCallControlsStatusCell____lazy_storage___conversationStatusDetailsVStack));
}

@end
