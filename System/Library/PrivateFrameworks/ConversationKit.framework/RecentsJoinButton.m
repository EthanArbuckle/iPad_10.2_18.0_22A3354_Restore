@implementation RecentsJoinButton

- (_TtC15ConversationKit17RecentsJoinButton)init
{
  return (_TtC15ConversationKit17RecentsJoinButton *)RecentsJoinButton.init()();
}

- (_TtC15ConversationKit17RecentsJoinButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  RecentsJoinButton.init(coder:)();
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5;
  _TtC15ConversationKit17RecentsJoinButton *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  v9 = (void *)RecentsJoinButton.contextMenuInteraction(_:configurationForMenuAtLocation:)((UIContextMenuInteraction)v6, (CGPoint)__PAIR128__(v8, v7));

  return v9;
}

- (_TtC15ConversationKit17RecentsJoinButton)initWithFrame:(CGRect)a3
{
  RecentsJoinButton.init(frame:)();
}

- (void).cxx_destruct
{
  outlined destroy of RecentOngoingConversationMetadata?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit17RecentsJoinButton_conversationMetadata);
}

@end
