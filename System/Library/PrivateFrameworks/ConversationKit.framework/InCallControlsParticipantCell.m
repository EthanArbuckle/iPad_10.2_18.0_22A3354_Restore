@implementation InCallControlsParticipantCell

- (UILabel)nameLabel
{
  return (UILabel *)InCallControlsParticipantCell.nameLabel.getter();
}

- (UILabel)subtitleLabel
{
  return (UILabel *)InCallControlsParticipantCell.subtitleLabel.getter();
}

- (_TtC15ConversationKit19InCallControlButton)actionButton
{
  return (_TtC15ConversationKit19InCallControlButton *)InCallControlsParticipantCell.actionButton.getter();
}

- (_TtC15ConversationKit19InCallControlButton)lmiApproveButton
{
  _TtC15ConversationKit29InCallControlsParticipantCell *v2;
  id v3;

  v2 = self;
  v3 = PushToTalkDisclosureButton.label.getter(&OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiApproveButton, (uint64_t (*)(uint64_t))closure #1 in InCallControlsParticipantCell.lmiApproveButton.getter);

  return (_TtC15ConversationKit19InCallControlButton *)v3;
}

- (void)setLmiApproveButton:(id)a3
{
  id v4;
  _TtC15ConversationKit29InCallControlsParticipantCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsParticipantCell.lmiApproveButton.setter((uint64_t)v4);

}

- (_TtC15ConversationKit19InCallControlButton)lmiRejectButton
{
  _TtC15ConversationKit29InCallControlsParticipantCell *v2;
  id v3;

  v2 = self;
  v3 = PushToTalkDisclosureButton.label.getter(&OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiRejectButton, (uint64_t (*)(uint64_t))closure #1 in InCallControlsParticipantCell.lmiRejectButton.getter);

  return (_TtC15ConversationKit19InCallControlButton *)v3;
}

- (void)setLmiRejectButton:(id)a3
{
  id v4;
  _TtC15ConversationKit29InCallControlsParticipantCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsParticipantCell.lmiRejectButton.setter((uint64_t)v4);

}

- (_TtC15ConversationKit19InCallControlButton)kickMemberButton
{
  _TtC15ConversationKit29InCallControlsParticipantCell *v2;
  id v3;

  v2 = self;
  v3 = InCallControlsParticipantCell.kickMemberButton.getter();

  return (_TtC15ConversationKit19InCallControlButton *)v3;
}

- (void)setKickMemberButton:(id)a3
{
  id v4;
  _TtC15ConversationKit29InCallControlsParticipantCell *v5;

  v4 = a3;
  v5 = self;
  InCallControlsParticipantCell.kickMemberButton.setter((uint64_t)v4);

}

- (_TtC15ConversationKit29InCallControlsParticipantCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit29InCallControlsParticipantCell *)InCallControlsParticipantCell.init(frame:)();
}

- (_TtC15ConversationKit29InCallControlsParticipantCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  InCallControlsParticipantCell.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC15ConversationKit29InCallControlsParticipantCell *v2;

  v2 = self;
  InCallControlsParticipantCell.layoutSubviews()();

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC15ConversationKit29InCallControlsParticipantCell *v5;
  Class isa;

  v4 = a3;
  v5 = self;
  isa = InCallControlsParticipantCell.preferredLayoutAttributesFitting(_:)((UICollectionViewLayoutAttributes)v4).super.isa;

  return isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_nameLabel));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_subtitleLabel);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_statusIcon);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_avatarView);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_actionButton);
  outlined destroy of Conversation?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_viewModel, &demangling cache variable for type metadata for InCallControlsParticipantCellViewModel?);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_cameraSymbolImage);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_copresenceSymbolImage);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_linkSymbolImage);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_messagesSymbolImage);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiApproveButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___lmiRejectButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell____lazy_storage___kickMemberButton);
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_callDelegate));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29InCallControlsParticipantCell_participantCellDelegate);
}

@end
