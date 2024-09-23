@implementation LinkDetailParticipantCollectionViewCell

- (_TtC15ConversationKit39LinkDetailParticipantCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKit39LinkDetailParticipantCollectionViewCell *)LinkDetailParticipantCollectionViewCell.init(frame:)();
}

- (_TtC15ConversationKit39LinkDetailParticipantCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  LinkDetailParticipantCollectionViewCell.init(coder:)();
}

- (void)prepareForReuse
{
  _TtC15ConversationKit39LinkDetailParticipantCollectionViewCell *v2;

  v2 = self;
  LinkDetailParticipantCollectionViewCell.prepareForReuse()();

}

- (void).cxx_destruct
{
  outlined consume of LinkDetailParticipantCollectionViewCell.Style(*(void **)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell_style), *(_QWORD *)((char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell_style), *(unint64_t *)((char *)&self->super.super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell_style));
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell_avatarController);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell_joinButton);
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell_joinButtonFont);
  outlined destroy of Conversation?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell____lazy_storage___joinButtonConfiguration, &demangling cache variable for type metadata for UIButton.Configuration?);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit39LinkDetailParticipantCollectionViewCell____lazy_storage___imageView));
}

@end
