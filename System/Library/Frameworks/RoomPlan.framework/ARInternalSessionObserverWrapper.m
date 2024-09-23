@implementation ARInternalSessionObserverWrapper

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v6;
  id v7;
  _TtC8RoomPlan32ARInternalSessionObserverWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22651BBF8(v6, v7);

}

- (void)session:(id)a3 didUpdateSpatialMappingPointClouds:(id)a4
{
  sub_226522074(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_2558481A0, 0x24BDB1568, (void (*)(uint64_t))sub_226528B50);
}

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  id v4;
  _TtC8RoomPlan32ARInternalSessionObserverWrapper *v5;

  v4 = a3;
  v5 = self;
  sub_226528D3C();

}

- (void)session:(id)a3 requestedRunWithConfiguration:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  _TtC8RoomPlan32ARInternalSessionObserverWrapper *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_226528DE4(v7);

}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC8RoomPlan32ARInternalSessionObserverWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_226529044(v7);

}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC8RoomPlan32ARInternalSessionObserverWrapper *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2265293D4();

}

- (void)sessionWasInterrupted:(id)a3
{
  uint64_t Strong;
  id v6;
  _TtC8RoomPlan32ARInternalSessionObserverWrapper *v7;

  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (*(_BYTE *)(Strong + OBJC_IVAR____TtC8RoomPlan18RoomCaptureSession_runActive) == 1)
    {
      v6 = a3;
      v7 = self;
      sub_226518980();

    }
    swift_release();
  }
}

- (BOOL)sessionShouldAttemptRelocalization:(id)a3
{
  return 1;
}

- (_TtC8RoomPlan32ARInternalSessionObserverWrapper)init
{
  return (_TtC8RoomPlan32ARInternalSessionObserverWrapper *)sub_226522260(self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC8RoomPlan32ARInternalSessionObserverWrapper_captureSession, (uint64_t (*)(uint64_t))type metadata accessor for ARInternalSessionObserverWrapper);
}

- (void).cxx_destruct
{
  swift_weakDestroy();
}

@end
