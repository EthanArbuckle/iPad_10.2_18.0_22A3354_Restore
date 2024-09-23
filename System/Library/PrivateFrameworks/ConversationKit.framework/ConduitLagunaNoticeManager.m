@implementation ConduitLagunaNoticeManager

- (void)neighborhoodActivityConduit:(id)a3 splitSessionStarted:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  ConduitLagunaNoticeManager.neighborhoodActivityConduit(_:splitSessionStarted:)();
}

- (void)neighborhoodActivityConduit:(id)a3 splitSessionEnded:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26ConduitLagunaNoticeManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ConduitLagunaNoticeManager.neighborhoodActivityConduit(_:splitSessionEnded:)();

}

- (void)neighborhoodActivityConduit:(id)a3 suggestionUpdated:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit26ConduitLagunaNoticeManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  ConduitLagunaNoticeManager.neighborhoodActivityConduit(_:suggestionUpdated:)();

}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  self;
  ConduitLagunaNoticeManager.conversationManager(_:stateChangedFor:fromOldConversation:)();
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  ConduitLagunaNoticeManager.conversationManager(_:remoteMembersChangedFor:)();
}

- (_TtC15ConversationKit26ConduitLagunaNoticeManager)init
{
  ConduitLagunaNoticeManager.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_31(OBJC_IVAR____TtC15ConversationKit26ConduitLagunaNoticeManager_queue);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26ConduitLagunaNoticeManager_pushBannerInfo, &demangling cache variable for type metadata for ConduitLagunaNoticeManager.PushBannerInfo?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit26ConduitLagunaNoticeManager_callCenter));
}

@end
