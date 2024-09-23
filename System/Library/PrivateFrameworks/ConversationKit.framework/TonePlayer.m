@implementation TonePlayer

- (_TtC15ConversationKit10TonePlayer)init
{
  return (_TtC15ConversationKit10TonePlayer *)TonePlayer.init()();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit10TonePlayer_soundPlayer);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit10TonePlayer_lastPlayedConnectedToneUUID, (uint64_t *)&demangling cache variable for type metadata for UUID?);
  outlined destroy of OS_dispatch_queue.SchedulerOptions?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit10TonePlayer_lastPlayedSoundDate, (uint64_t *)&demangling cache variable for type metadata for Date?);
}

@end
