@implementation RecentsCollectionViewCollator

- (void)dealloc
{
  _TtC15ConversationKit29RecentsCollectionViewCollator *v2;

  v2 = self;
  RecentsCollectionViewCollator.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_updateQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_recentsController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_conversationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_dataSource));
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator__hasFinishedFirstLoad;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Published<Bool>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_2_22();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit29RecentsCollectionViewCollator_featureFlags));
}

- (_TtC15ConversationKit29RecentsCollectionViewCollator)init
{
  RecentsCollectionViewCollator.init()();
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit29RecentsCollectionViewCollator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:addedActiveConversation:)();

}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit29RecentsCollectionViewCollator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:stateChangedFor:)();

}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit29RecentsCollectionViewCollator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:removedActiveConversation:)();

}

- (void)conversationManager:(id)a3 didChangeActivatedLinks:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC15ConversationKit29RecentsCollectionViewCollator *v8;

  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for TUConversationLink);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = a3;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:didChangeActivatedLinks:)((uint64_t)v8, v6);

  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 linkChangedForConversation:(id)a4
{
  id v6;
  id v7;
  _TtC15ConversationKit29RecentsCollectionViewCollator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  RecentsCollectionViewCollator.conversationManager(_:linkChangedFor:)();

}

@end
