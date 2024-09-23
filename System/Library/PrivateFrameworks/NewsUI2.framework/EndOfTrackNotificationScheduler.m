@implementation EndOfTrackNotificationScheduler

- (_TtC7NewsUI231EndOfTrackNotificationScheduler)init
{
  _TtC7NewsUI231EndOfTrackNotificationScheduler *result;

  result = (_TtC7NewsUI231EndOfTrackNotificationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_notificationService);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_readingHistory));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_currentlyPlayingObservableToken));
  sub_1D6B67AAC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState), *(_QWORD *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState], *(_QWORD *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 8], *(_QWORD *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 16], *(_QWORD *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 24], *(_QWORD *)&self->notificationService[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState + 32], *(_QWORD *)&self->currentlyPlaying[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState], *(_QWORD *)&self->readingHistory[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState], self->currentlyPlayingObservableToken[OBJC_IVAR____TtC7NewsUI231EndOfTrackNotificationScheduler_schedulerState]);
}

- (void)userInfoDidChangeEndOfAudioTrackNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI231EndOfTrackNotificationScheduler *v6;

  v5 = a3;
  v6 = self;
  sub_1D6B67E44(v5);

}

@end
