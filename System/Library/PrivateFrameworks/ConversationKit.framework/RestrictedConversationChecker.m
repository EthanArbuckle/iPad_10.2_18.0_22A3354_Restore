@implementation RestrictedConversationChecker

- (_TtC15ConversationKit29RestrictedConversationChecker)init
{
  RestrictedConversationChecker.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RestrictedConversationChecker_callFilterController));
  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 migratingFromConversation:(id)a4 toConversation:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15ConversationKit29RestrictedConversationChecker *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  RestrictedConversationChecker.conversationManager(_:migratingFrom:to:)();

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit29RestrictedConversationChecker *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RestrictedConversationChecker.conversationManager(_:removedActiveConversation:)();

}

@end
