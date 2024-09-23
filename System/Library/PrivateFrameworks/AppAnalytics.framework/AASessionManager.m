@implementation AASessionManager

- (AATracker)tracker
{
  return (AATracker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___AASessionManager_tracker));
}

- (AAProcessorManager)processorManager
{
  return (AAProcessorManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___AASessionManager_processorManager));
}

- (AASessionManager)init
{
  return (AASessionManager *)BridgedSessionManager.init()();
}

- (AASessionManager)initWithPrivacyValidationProvider:(id)a3
{
  return (AASessionManager *)BridgedSessionManager.init(privacyValidationProvider:)(a3);
}

- (AASessionManager)initWithAccessQueue:(id)a3
{
  return (AASessionManager *)BridgedSessionManager.init(accessQueue:)(a3);
}

- (AASessionManager)initWithAccessQueue:(id)a3 privacyValidationProvider:(id)a4
{
  return (AASessionManager *)BridgedSessionManager.init(accessQueue:privacyValidationProvider:)(a3, a4);
}

- (void).cxx_destruct
{

  swift_release();
}

- (void)pushSessionData:(id)a3
{
  id v5;
  id v6;
  AASessionManager *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_init);
  -[AASessionManager pushSessionData:traits:](v7, sel_pushSessionData_traits_, v6, v8);

}

- (void)pushSessionData:(id)a3 traits:(id)a4
{
  id v6;
  id v7;
  AASessionManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  BridgedSessionManager.push(_:traits:)((uint64_t)v6);

}

- (void)pushSessionData:(id)a3 submitEventQueues:(BOOL)a4
{
  id v6;
  id v7;
  AASessionManager *v8;
  id v9;

  v6 = objc_allocWithZone((Class)type metadata accessor for BridgedDataEventTraits());
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_init);
  -[AASessionManager pushSessionData:traits:](v8, sel_pushSessionData_traits_, v7, v9);

}

- (void)pushSessionData:(id)a3 traits:(id)a4 submitEventQueues:(BOOL)a5
{
  -[AASessionManager pushSessionData:traits:](self, sel_pushSessionData_traits_, a3, a4, a5);
}

- (void)transaction:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  AASessionManager *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AASessionManager_sessionManager);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1A5F2E940;
  *(_QWORD *)(v7 + 24) = v5;
  v8 = *(_QWORD *)(v6 + 48);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = sub_1A5F5D340;
  v9[3] = v7;
  v9[4] = v6;
  v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v8, (uint64_t)sub_1A5F5D33C, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AASessionManager *v9;

  if (a4)
  {
    v6 = sub_1A5F64130();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  BridgedSessionManager.start(for:name:)(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  AASessionManager *v14;
  void *v15;
  AASessionManager *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v8 = sub_1A5F63F08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a4)
  {
    sub_1A5F64130();
    goto LABEL_5;
  }
  sub_1A5F64130();
  v13 = v12;
  sub_1A5F64130();
  if (!v13)
  {
LABEL_5:
    v16 = self;
    v15 = 0;
    goto LABEL_6;
  }
  v14 = self;
  v15 = (void *)sub_1A5F6410C();
LABEL_6:
  v17 = (void *)sub_1A5F6410C();
  sub_1A5F63EFC();
  v18 = (void *)sub_1A5F63EA8();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  -[AASessionManager startSessionForKind:withName:identifier:startDate:](self, sel_startSessionForKind_withName_identifier_startDate_, a3, v15, v17, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 startDate:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  AASessionManager *v14;
  uint64_t v15;

  v8 = sub_1A5F63F08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v12 = sub_1A5F64130();
    a4 = v13;
  }
  else
  {
    v12 = 0;
  }
  sub_1A5F63EE4();
  v14 = self;
  BridgedSessionManager.start(for:name:startDate:)(a3, v12, a4);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  AASessionManager *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v9 = sub_1A5F63F08();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1A5F64130();
    a4 = v13;
  }
  sub_1A5F64130();
  sub_1A5F63EE4();
  v14 = self;
  if (a4)
    v15 = (void *)sub_1A5F6410C();
  else
    v15 = 0;
  v16 = (void *)sub_1A5F6410C();
  v17 = (void *)sub_1A5F63EA8();
  if (qword_1ED1CC0D8 != -1)
    swift_once();
  -[AASessionManager startSessionForKind:withName:identifier:startDate:timestampJitter:](self, sel_startSessionForKind_withName_identifier_startDate_timestampJitter_, a3, v15, v16, v17, qword_1ED1CC0D0);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)startSessionForKind:(int64_t)a3 withName:(id)a4 identifier:(id)a5 startDate:(id)a6 timestampJitter:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  AASessionManager *v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a3;
  v10 = sub_1A5F63F08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v14 = sub_1A5F64130();
    a4 = v15;
  }
  else
  {
    v14 = 0;
  }
  v16 = sub_1A5F64130();
  v18 = v17;
  sub_1A5F63EE4();
  v19 = a7;
  v20 = self;
  BridgedSessionManager.start(for:name:identifier:startDate:timestampJitter:)(v22, v14, (unint64_t)a4, v16, v18, (uint64_t)v13, v19);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)endSession
{
  AASessionManager *v2;

  v2 = self;
  BridgedSessionManager.end()();

}

- (void)endSync
{
  AASessionManager *v2;

  v2 = self;
  SessionManager.endSync(timeout:)(4.0);

}

- (void)endSessionWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  AASessionManager *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  BridgedSessionManager.end(completion:)((uint64_t)sub_1A5F5D334, v5);

  swift_release();
}

- (void)endSessionWithEndDate:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t (**v19)();
  uint64_t v20;
  AASessionManager *v21;

  v6 = sub_1A5F63F08();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v20 - v11;
  v13 = _Block_copy(a4);
  sub_1A5F63EE4();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AASessionManager_sessionManager);
  v20 = *(_QWORD *)(v15 + 48);
  v21 = self;
  sub_1A5F27680();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
  v16 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v17 = (v8 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v15;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v18 + v16, v9, v6);
  v19 = (uint64_t (**)())(v18 + v17);
  *v19 = sub_1A5F5D334;
  v19[1] = (uint64_t (*)())v14;
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v20, (uint64_t)sub_1A5F5D0E8, v18);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  AASessionManager *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A5EBC084;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  BridgedSessionManager.flush(callbackQueue:completion:)(v8, (uint64_t)v6, v7);
  sub_1A5ED0004((uint64_t)v6);

}

@end
