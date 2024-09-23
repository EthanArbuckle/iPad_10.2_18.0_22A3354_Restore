@implementation MTAlarmSessionsProvider

- (BOOL)hasActiveAlarmSession
{
  _TtC18MobileTimerSupport23MTAlarmSessionsProvider *v2;
  char v3;

  v2 = self;
  v3 = sub_1B8D91CF0();

  return v3 & 1;
}

- (id)activeAlarmSessions
{
  _TtC18MobileTimerSupport23MTAlarmSessionsProvider *v2;
  void *v3;

  v2 = self;
  sub_1B8D91EC8();

  v3 = (void *)sub_1B8DFDC4C();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)createSessionWithContext:(id)a3 completion:(id)a4 forAlert:(BOOL)a5
{
  sub_1B8D92CC4(self, (int)a2, a3, a4, a5, (uint64_t)sub_1B8D9CC00, (void (*)(id, uint64_t, _QWORD *, uint64_t))sub_1B8D920C8);
}

- (void)updateSessionWithContext:(id)a3 completion:(id)a4
{
  sub_1B8D93250(self, (int)a2, a3, a4, (uint64_t)&unk_1E6F2ACD8, (uint64_t)sub_1B8D9D3AC, (void (*)(id, uint64_t, uint64_t))sub_1B8D92D50);
}

- (void)finishSessionWithAlarmId:(id)a3 completion:(id)a4
{
  sub_1B8D93950(self, (int)a2, (int)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1B8D9BF30);
}

- (void)restoreSessionsWithCompletion:(id)a3
{
  sub_1B8D93FF4(self, (int)a2, a3, (void (*)(void))sub_1B8D9C254);
}

- (id)activityIdForAlarmIdWithAlarmId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC18MobileTimerSupport23MTAlarmSessionsProvider *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sub_1B8DFDB68();
  v6 = v5;
  v7 = self;
  sub_1B8D94058(v4, v6);
  v9 = v8;
  swift_bridgeObjectRelease();

  if (v9)
  {
    v10 = (void *)sub_1B8DFDB5C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (int64_t)numberOfActiveSessions
{
  _TtC18MobileTimerSupport23MTAlarmSessionsProvider *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B8D945A4();

  return v3;
}

- (id)alertingSessionId
{
  return sub_1B8D94958(self, (uint64_t)a2, (void (*)(void))sub_1B8D94774);
}

- (_TtC18MobileTimerSupport23MTAlarmSessionsProvider)init
{
  return (_TtC18MobileTimerSupport23MTAlarmSessionsProvider *)MTAlarmSessionsProvider.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC18MobileTimerSupport23MTAlarmSessionsProvider_serializerQueue));
  swift_bridgeObjectRelease();
}

@end
