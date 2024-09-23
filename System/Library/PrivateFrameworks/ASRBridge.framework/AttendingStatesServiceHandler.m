@implementation AttendingStatesServiceHandler

- (void)localAttendingStartedWithRootRequestId:(id)a3
{
  sub_235C9FF20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_235C9F494);
}

- (void)localAttendingWillStartWithRootRequestId:(id)a3
{
  sub_235C9FF20(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_235C9F87C);
}

- (void)localAttendingStoppedUnexpectedlyWithError:(id)a3
{
  _TtC9ASRBridge29AttendingStatesServiceHandler *v4;
  id v5;

  v4 = self;
  v5 = a3;
  sub_235C9FF84(a3);

}

- (void)speechStartDetectedWithHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  _TtC9ASRBridge29AttendingStatesServiceHandler *v6;

  if (a5)
    sub_235CA37EC();
  v6 = self;
  sub_235CA2530();

  swift_bridgeObjectRelease();
}

- (void)speechStartDetectedWithShouldDuckTTS:(BOOL)a3
{
  _TtC9ASRBridge29AttendingStatesServiceHandler *v4;

  v4 = self;
  sub_235CA0B60(a3);

}

- (void)speechRecognizerReadyForNewTurnWithSpeechStartDetectedAtHostTime:(unint64_t)a3 audioRecordType:(int64_t)a4 audioRecordDeviceId:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC9ASRBridge29AttendingStatesServiceHandler *v11;

  if (a5)
  {
    v8 = sub_235CA37EC();
    v10 = v9;
  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  v11 = self;
  sub_235CA1354(a3, a4, v8, v10);

  swift_bridgeObjectRelease();
}

- (_TtC9ASRBridge29AttendingStatesServiceHandler)init
{
  _TtC9ASRBridge29AttendingStatesServiceHandler *result;

  result = (_TtC9ASRBridge29AttendingStatesServiceHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  v4 = sub_235CA2790();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher);
  swift_release();
}

@end
