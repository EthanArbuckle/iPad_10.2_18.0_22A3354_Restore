@implementation PlaceholderCallCenter

- (_TtC15ConversationKit21PlaceholderCallCenter)init
{
  PlaceholderCallCenter.init()();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit21PlaceholderCallCenter_conversationManager));

}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit21PlaceholderCallCenter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PlaceholderCallCenter.conversationManager(_:stateChangedFor:)();

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit21PlaceholderCallCenter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PlaceholderCallCenter.conversationManager(_:removedActiveConversation:)();

}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit21PlaceholderCallCenter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  PlaceholderCallCenter.conversationManager(_:avModeChangedFor:)();

}

@end
