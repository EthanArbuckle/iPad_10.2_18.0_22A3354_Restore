@implementation ConversationControlsNoticeCoordinator

- (_TtC15ConversationKit37ConversationControlsNoticeCoordinator)init
{
  return (_TtC15ConversationKit37ConversationControlsNoticeCoordinator *)ConversationControlsNoticeCoordinator.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit37ConversationControlsNoticeCoordinator_conversationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ConversationKit37ConversationControlsNoticeCoordinator_unblockTimer));
  v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit37ConversationControlsNoticeCoordinator__activeNotice;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Notice?>);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_32_2();
}

@end
