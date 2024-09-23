@implementation AATracker

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AATracker *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  BridgedTracker.submit(rawEvent:onlyIfTimed:)(v6, v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)popDataEventByName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  AATracker *v10;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v8 = *(_QWORD *)(v7 + 80);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v4;
  v9[4] = v6;
  v10 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_1A5EEC784(v8, (uint64_t)sub_1A5F2E68C, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)pushDataEvent:(id)a3 traits:(id)a4 file:(id)a5 line:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  AATracker *v14;

  v10 = sub_1A5F64130();
  v12 = v11;
  swift_unknownObjectRetain();
  v13 = a4;
  v14 = self;
  BridgedTracker.push(data:traits:file:line:)((uint64_t)a3, (uint64_t)a4, v10, v12, a6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)submitRawEvent:(id)a3
{
  -[AATracker submitRawEvent:onlyIfTimed:](self, sel_submitRawEvent_onlyIfTimed_, a3, 0);
}

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F6410C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)identifier
{
  void *v2;

  if (*(_QWORD *)&self->name[OBJC_IVAR___AATracker_identifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A5F6410C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (AATracker)init
{
  AATracker *result;

  result = (AATracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)timeEventType:(Class)a3
{
  -[AATracker timeEventType:submitAndRestartWithSession:](self, sel_timeEventType_submitAndRestartWithSession_, a3, 1);
}

- (void)timeEventType:(Class)a3 startTime:(id)a4
{
  sub_1A5F1B500(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, char *))BridgedTracker.time(eventType:startTime:));
}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t ObjCClassMetadata;
  AATracker *v7;

  v4 = a4;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = self;
  BridgedTracker.time(eventType:submitAndRestartWithSession:)(ObjCClassMetadata, v4);

}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
  sub_1A5F1B720(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))BridgedTracker.time(eventType:submitAndRestartWithSession:startTime:));
}

- (void)timeRawEvent:(id)a3
{
  -[AATracker timeRawEvent:submitAndRestartWithSession:](self, sel_timeRawEvent_submitAndRestartWithSession_, a3, 1);
}

- (void)timeRawEvent:(id)a3 startTime:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  AATracker *v11;
  void *v12;
  uint64_t v13;

  v6 = sub_1A5F63F08();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63EE4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1A5F63EA8();
  -[AATracker timeRawEvent:submitAndRestartWithSession:startTime:](v11, sel_timeRawEvent_submitAndRestartWithSession_startTime_, v10, 1, v12);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AATracker *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  BridgedTracker.time(rawEvent:submitAndRestartWithSession:)(v6, v4);

}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  AATracker *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;

  v24 = a4;
  v7 = sub_1A5F63F08();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v21 - v12;
  sub_1A5F63EE4();
  v14 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v15 = *(_QWORD *)(v14 + 88);
  v22 = *(_QWORD *)(v14 + 80);
  v23 = v15;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, v13, v7);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = v16 + v9;
  v18 = (char *)swift_allocObject();
  *((_QWORD *)v18 + 2) = v14;
  *((_QWORD *)v18 + 3) = a3;
  *((_QWORD *)v18 + 4) = 0x8000000000000000;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v16], v10, v7);
  v18[v17] = v24;
  v19 = a3;
  v20 = self;
  swift_retain();
  sub_1A5EEC784(v22, (uint64_t)sub_1A5F2E000, (uint64_t)v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)submitEventType:(Class)a3
{
  -[AATracker submitEventType:onlyIfTimed:](self, sel_submitEventType_onlyIfTimed_, a3, 0);
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t ObjCClassMetadata;
  AATracker *v7;

  v4 = a4;
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = self;
  BridgedTracker.submit(eventType:onlyIfTimed:)(ObjCClassMetadata, v4);

}

- (void)submitEventType:(Class)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  AATracker *v9;
  _QWORD v10[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v10[4] = sub_1A5F232F4;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1A5F1A97C;
  v10[3] = &block_descriptor_310;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  -[AATracker submitEventType:onlyIfTimed:completion:](v9, sel_submitEventType_onlyIfTimed_completion_, a3, 0, v8);
  _Block_release(v8);

  swift_release();
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t ObjCClassMetadata;
  uint64_t v9;
  AATracker *v10;

  v5 = a4;
  v7 = _Block_copy(a5);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  BridgedTracker.submit(eventType:onlyIfTimed:completion:)(ObjCClassMetadata, v5, (uint64_t)sub_1A5F232F4, v9);

  swift_release();
}

- (void)submitRawEvent:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  AATracker *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  BridgedTracker.submit(rawEvent:completion:)(v8, (uint64_t)sub_1A5F232F4, v7);

  swift_release();
}

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  id v10;
  AATracker *v11;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  BridgedTracker.submit(rawEvent:onlyIfTimed:completion:)(v10, v5, (uint64_t)sub_1A5F232F4, v9);

  swift_release();
}

- (id)delayedSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t ObjCClassMetadata;
  uint64_t v9;
  AATracker *v10;
  id v11;

  v5 = a4;
  v7 = _Block_copy(a5);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  v11 = BridgedTracker.delayedSubmit(eventType:onlyIfTimed:completion:)(ObjCClassMetadata, v5, (uint64_t)sub_1A5F232F4, v9);

  swift_release();
  return v11;
}

- (id)delayedSubmitEventType:(Class)a3
{
  void *v5;
  AATracker *v6;
  id v7;
  _QWORD v9[6];

  v9[4] = j_nullsub_1;
  v9[5] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1A5F1A97C;
  v9[3] = &block_descriptor_287;
  v5 = _Block_copy(v9);
  v6 = self;
  v7 = -[AATracker delayedSubmitEventType:onlyIfTimed:completion:](v6, sel_delayedSubmitEventType_onlyIfTimed_completion_, a3, 0, v5);
  _Block_release(v5);

  return v7;
}

- (id)delayedSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  AATracker *v8;
  id v9;
  _QWORD v11[6];

  v4 = a4;
  v11[4] = j_nullsub_1;
  v11[5] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1A5F1A97C;
  v11[3] = &block_descriptor_284;
  v7 = _Block_copy(v11);
  v8 = self;
  v9 = -[AATracker delayedSubmitEventType:onlyIfTimed:completion:](v8, sel_delayedSubmitEventType_onlyIfTimed_completion_, a3, v4, v7);
  _Block_release(v7);

  return v9;
}

- (id)delayedSubmitEventType:(Class)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  AATracker *v9;
  id v10;
  _QWORD v12[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v12[4] = sub_1A5F232F4;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1A5F1A97C;
  v12[3] = &block_descriptor_281;
  v8 = _Block_copy(v12);
  v9 = self;
  swift_retain();
  swift_release();
  v10 = -[AATracker delayedSubmitEventType:onlyIfTimed:completion:](v9, sel_delayedSubmitEventType_onlyIfTimed_completion_, a3, 0, v8);
  _Block_release(v8);

  swift_release();
  return v10;
}

- (id)delayedSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  id v10;
  AATracker *v11;
  id v12;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = self;
  v12 = BridgedTracker.delayedSubmit(rawEvent:onlyIfTimed:completion:)(v10, v5, (uint64_t)sub_1A5F232F4, v9);

  swift_release();
  return v12;
}

- (id)delayedSubmitRawEvent:(id)a3
{
  void *v5;
  id v6;
  AATracker *v7;
  id v8;
  _QWORD v10[6];

  v10[4] = j_nullsub_1;
  v10[5] = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1A5F1A97C;
  v10[3] = &block_descriptor_270;
  v5 = _Block_copy(v10);
  v6 = a3;
  v7 = self;
  v8 = -[AATracker delayedSubmitRawEvent:onlyIfTimed:completion:](v7, sel_delayedSubmitRawEvent_onlyIfTimed_completion_, v6, 0, v5);
  _Block_release(v5);

  return v8;
}

- (id)delayedSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  AATracker *v9;
  id v10;
  _QWORD v12[6];

  v4 = a4;
  v12[4] = nullsub_1;
  v12[5] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1A5F1A97C;
  v12[3] = &block_descriptor_267;
  v7 = _Block_copy(v12);
  v8 = a3;
  v9 = self;
  v10 = -[AATracker delayedSubmitRawEvent:onlyIfTimed:completion:](v9, sel_delayedSubmitRawEvent_onlyIfTimed_completion_, v8, v4, v7);
  _Block_release(v7);

  return v10;
}

- (id)delayedSubmitRawEvent:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  AATracker *v10;
  id v11;
  _QWORD v13[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v13[4] = sub_1A5F232F4;
  v13[5] = v7;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1A5F1A97C;
  v13[3] = &block_descriptor_264;
  v8 = _Block_copy(v13);
  v9 = a3;
  v10 = self;
  swift_retain();
  swift_release();
  v11 = -[AATracker delayedSubmitRawEvent:onlyIfTimed:completion:](v10, sel_delayedSubmitRawEvent_onlyIfTimed_completion_, v9, 0, v8);
  _Block_release(v8);

  swift_release();
  return v11;
}

- (void)explicitSubmitEvent:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t ObjCClassMetadata;
  uint64_t v15;
  AATracker *v16;
  uint64_t v17;

  v7 = a4;
  v9 = sub_1A5F63F08();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_1A5F63EE4();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = self;
  BridgedTracker.explicitSubmit(eventType:onlyIfTimed:submitTime:completion:)(ObjCClassMetadata, v7, (uint64_t)v12, (uint64_t)sub_1A5F232F4, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)explicitSubmitEvent:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
  sub_1A5F1B720(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))BridgedTracker.explicitSubmit(eventType:onlyIfTimed:submitTime:));
}

- (void)explicitSubmitEvent:(Class)a3 submitTime:(id)a4
{
  sub_1A5F1B500(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, char *))BridgedTracker.explicitSubmit(eventType:submitTime:));
}

- (void)explicitSubmitEvent:(Class)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  AATracker *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[6];

  v8 = sub_1A5F63F08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1A5F63EE4();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = self;
  v15 = (void *)sub_1A5F63EA8();
  aBlock[4] = sub_1A5F232F4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A5F1A97C;
  aBlock[3] = &block_descriptor_253;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  -[AATracker explicitSubmitEvent:onlyIfTimed:submitTime:completion:](v14, sel_explicitSubmitEvent_onlyIfTimed_submitTime_completion_, a3, 0, v15, v16);
  _Block_release(v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  AATracker *v17;
  uint64_t v18;

  v7 = a4;
  v10 = sub_1A5F63F08();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_1A5F63EE4();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v14;
  v16 = a3;
  v17 = self;
  BridgedTracker.explicitSubmit(rawEvent:onlyIfTimed:submitTime:completion:)(v16, v7, (uint64_t)v13, (uint64_t)sub_1A5F232F4, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  AATracker *v13;
  uint64_t v14;

  v8 = sub_1A5F63F08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63EE4();
  v12 = a3;
  v13 = self;
  BridgedTracker.explicitSubmit(rawEvent:onlyIfTimed:submitTime:)(v12, a4, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  AATracker *v11;
  uint64_t v12;

  v6 = sub_1A5F63F08();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A5F63EE4();
  v10 = a3;
  v11 = self;
  BridgedTracker.explicitRawSubmit(rawEvent:submitTime:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  id v14;
  AATracker *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[6];

  v8 = sub_1A5F63F08();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  sub_1A5F63EE4();
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v12;
  v14 = a3;
  v15 = self;
  v16 = (void *)sub_1A5F63EA8();
  aBlock[4] = sub_1A5F22FE8;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A5F1A97C;
  aBlock[3] = &block_descriptor_242;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  -[AATracker explicitSubmitRawEvent:onlyIfTimed:submitTime:completion:](v15, sel_explicitSubmitRawEvent_onlyIfTimed_submitTime_completion_, v14, 0, v16, v17);
  _Block_release(v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)registerDataEventType:(Class)a3 block:(id)a4
{
  void *v5;
  uint64_t ObjCClassMetadata;
  uint64_t v7;
  AATracker *v8;

  v5 = _Block_copy(a4);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v5;
  v8 = self;
  BridgedTracker.register(dataType:block:)(ObjCClassMetadata, (uint64_t)sub_1A5F2EA54, v7);

  swift_release();
}

- (void)popDataEventType:(Class)a3
{
  uint64_t ObjCClassMetadata;
  AATracker *v5;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  BridgedTracker.pop(dataType:)(ObjCClassMetadata);

}

- (void)clearStack:(Class)a3
{
  uint64_t ObjCClassMetadata;
  AATracker *v5;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  BridgedTracker.clearStack(dataType:)(ObjCClassMetadata);

}

- (void)clearStackEventType:(Class)a3 includeParentTrackers:(BOOL)a4
{
  uint64_t ObjCClassMetadata;
  AATracker *v7;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  v7 = self;
  BridgedTracker.clearStack(of:includeParentTrackers:)(ObjCClassMetadata, a4);

}

- (id)chainWithName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AATracker *v7;
  id v8;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = self;
  v8 = BridgedTracker.chain(name:)(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)chainWithName:(id)a3 identifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  AATracker *v11;
  id v12;

  v6 = sub_1A5F64130();
  v8 = v7;
  if (a4)
  {
    v9 = sub_1A5F64130();
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  v12 = BridgedTracker.chain(name:identifier:)(v6, v8, v9, (uint64_t)a4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

- (NSArray)path
{
  return (NSArray *)sub_1A5F2CBD4(self, (uint64_t)a2, (void (*)(void))Tracker.path.getter);
}

- (NSArray)debugPath
{
  return (NSArray *)sub_1A5F2CBD4(self, (uint64_t)a2, (void (*)(void))Tracker.debugPath.getter);
}

- (id)onSessionChangeWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  AATracker *v6;
  id v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = BridgedTracker.onSessionChange(block:)((uint64_t)sub_1A5F2EA30, v5);

  swift_release();
  return v7;
}

- (void)removeSessionObserversForObject:(id)a3
{
  AATracker *v5;

  swift_unknownObjectRetain();
  v5 = self;
  BridgedTracker.removeSessionObservers(forObject:)((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)transactionWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  AATracker *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_1A5F2EE4C;
  v7[4] = v5;
  v8 = *(_QWORD *)(v6 + 80);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A5F2ED48;
  v9[4] = v7;
  v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v8, (uint64_t)sub_1A5F2EE40, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)dynamicTransactionWithIdentifier:(id)a3 block:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  AATracker *v14;

  v5 = _Block_copy(a4);
  v6 = sub_1A5F64130();
  v8 = v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v5;
  v10 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = self;
  v11[3] = sub_1A5F2EE4C;
  v11[4] = v9;
  v12 = *(_QWORD *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v6;
  v13[4] = v8;
  v13[5] = sub_1A5F2ED48;
  v13[6] = v11;
  v14 = self;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1A5EEC784(v12, (uint64_t)sub_1A5F2E798, (uint64_t)v13);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

- (void)whenSession:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  AATracker *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = sub_1A5F2EE4C;
  v7[3] = v5;
  v7[4] = self;
  v8 = *(_QWORD *)(v6 + 80);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A5F2ED4C;
  v9[4] = v7;
  v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v8, (uint64_t)sub_1A5F2EE3C, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)ifSession:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  AATracker *v10;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = sub_1A5F2E940;
  v7[3] = v5;
  v7[4] = self;
  v8 = *(_QWORD *)(v6 + 80);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v6;
  v9[3] = sub_1A5F2ED4C;
  v9[4] = v7;
  v10 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A5EEC784(v8, (uint64_t)sub_1A5F2EE38, (uint64_t)v9);

  swift_release();
  swift_release();
  swift_release();
}

- (void)enterGroupWithName:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  AATracker *v7;
  Swift::String v8;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BridgedTracker.enterGroup(groupName:)(v8);

  swift_bridgeObjectRelease();
}

- (void)enterGroupWithName:(id)a3 contentType:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  AATracker *v9;

  v6 = sub_1A5F64130();
  v8 = v7;
  v9 = self;
  BridgedTracker.enterGroup(groupName:contentType:)(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)enterGroup
{
  AATracker *v2;

  v2 = self;
  BridgedTracker.enterGroup()();

}

- (void)leaveGroup
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  AATracker *v6;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AATracker_tracker);
  v4 = *(_QWORD *)(v3 + 80);
  v5 = (_QWORD *)swift_allocObject();
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = v3;
  v6 = self;
  swift_retain();
  sub_1A5EEC784(v4, (uint64_t)sub_1A5F2EE34, (uint64_t)v5);

  swift_release();
}

- (void)suspend
{
  sub_1A5F2DF8C((char *)self, (uint64_t)a2, (void (*)(uint64_t))MEMORY[0x1E0C82D28]);
}

- (void)resume
{
  sub_1A5F2DF8C((char *)self, (uint64_t)a2, (void (*)(uint64_t))MEMORY[0x1E0C82D30]);
}

@end
