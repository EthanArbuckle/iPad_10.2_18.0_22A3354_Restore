@implementation AAAccessTracker

- (AAAccessTracker)init
{
  AAAccessTracker *result;

  result = (AAAccessTracker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)timeEventType:(Class)a3
{
  char *ObjCClassMetadata;
  AAAccessTracker *v5;

  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  v5 = self;
  BridgedAccessTracker.time(eventType:)(ObjCClassMetadata);

}

- (void)timeEventType:(Class)a3 startTime:(id)a4
{
  sub_1A5F1B500(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, char *))BridgedAccessTracker.time(eventType:startTime:));
}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4
{
  _BOOL4 v4;
  char *ObjCClassMetadata;
  AAAccessTracker *v7;

  v4 = a4;
  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  v7 = self;
  BridgedAccessTracker.time(eventType:submitAndRestartWithSession:)(ObjCClassMetadata, v4);

}

- (void)timeEventType:(Class)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
  sub_1A5F1B720(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))BridgedAccessTracker.time(eventType:submitAndRestartWithSession:startTime:));
}

- (void)timeRawEvent:(id)a3
{
  -[AAAccessTracker timeRawEvent:submitAndRestartWithSession:](self, sel_timeRawEvent_submitAndRestartWithSession_, a3, 1);
}

- (void)timeRawEvent:(id)a3 startTime:(id)a4
{
  sub_1A5F1BD4C(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_timeRawEvent_submitAndRestartWithSession_startTime_, 1);
}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AAAccessTracker *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  BridgedAccessTracker.time(rawEvent:submitAndRestartWithSession:)(v6, v4);

}

- (void)timeRawEvent:(id)a3 submitAndRestartWithSession:(BOOL)a4 startTime:(id)a5
{
  sub_1A5F1BF7C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t, char *))BridgedAccessTracker.time(rawEvent:submitAndRestartWithSession:startTime:));
}

- (void)submitEventType:(Class)a3
{
  -[AAAccessTracker submitEventType:onlyIfTimed:](self, sel_submitEventType_onlyIfTimed_, a3, 0);
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4
{
  _BOOL4 v4;
  char *ObjCClassMetadata;
  AAAccessTracker *v7;

  v4 = a4;
  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  v7 = self;
  BridgedAccessTracker.submit(eventType:onlyIfTimed:)(ObjCClassMetadata, v4);

}

- (void)submitEventType:(Class)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  AAAccessTracker *v9;
  _QWORD v10[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v10[4] = sub_1A5F232F4;
  v10[5] = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1A5F1A97C;
  v10[3] = &block_descriptor_70;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  -[AAAccessTracker submitEventType:onlyIfTimed:completion:](v9, sel_submitEventType_onlyIfTimed_completion_, a3, 0, v8);
  _Block_release(v8);

  swift_release();
}

- (void)submitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v7;
  char *ObjCClassMetadata;
  uint64_t v9;
  AAAccessTracker *v10;

  v5 = a4;
  v7 = _Block_copy(a5);
  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  BridgedAccessTracker.submit(eventType:onlyIfTimed:completion:)(ObjCClassMetadata, v5, (uint64_t)sub_1A5F232F4, v9);

  swift_release();
}

- (void)submitRawEvent:(id)a3
{
  -[AAAccessTracker submitRawEvent:onlyIfTimed:](self, sel_submitRawEvent_onlyIfTimed_, a3, 0);
}

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AAAccessTracker *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  BridgedAccessTracker.submit(rawEvent:onlyIfTimed:)(v6, v4);

}

- (void)submitRawEvent:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  AAAccessTracker *v10;
  _QWORD v11[6];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v11[4] = sub_1A5F232F4;
  v11[5] = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1A5F1A97C;
  v11[3] = &block_descriptor_59;
  v8 = _Block_copy(v11);
  v9 = a3;
  v10 = self;
  swift_retain();
  swift_release();
  -[AAAccessTracker submitRawEvent:onlyIfTimed:completion:](v10, sel_submitRawEvent_onlyIfTimed_completion_, v9, 0, v8);
  _Block_release(v8);

  swift_release();
}

- (void)submitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  uint64_t v9;
  char *v10;
  AAAccessTracker *v11;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (char *)a3;
  v11 = self;
  BridgedAccessTracker.submit(rawEvent:onlyIfTimed:completion:)(v10, v5, (uint64_t)sub_1A5F232F4, v9);

  swift_release();
}

- (void)explicitSubmitEventType:(Class)a3 submitTime:(id)a4
{
  sub_1A5F1B500(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, char *))BridgedAccessTracker.explicitSubmit(eventType:submitTime:));
}

- (void)explicitSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
  sub_1A5F1B720(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))BridgedAccessTracker.explicitSubmit(eventType:onlyIfTimed:submitTime:));
}

- (void)explicitSubmitEventType:(Class)a3 submitTime:(id)a4 completion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  AAAccessTracker *v14;
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
  aBlock[3] = &block_descriptor_48;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  -[AAAccessTracker explicitSubmitEventType:onlyIfTimed:submitTime:completion:](v14, sel_explicitSubmitEventType_onlyIfTimed_submitTime_completion_, a3, 0, v15, v16);
  _Block_release(v16);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)explicitSubmitEventType:(Class)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5 completion:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  char *ObjCClassMetadata;
  uint64_t v15;
  AAAccessTracker *v16;
  uint64_t v17;

  v9 = sub_1A5F63F08();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a6);
  ObjCClassMetadata = (char *)swift_getObjCClassMetadata();
  sub_1A5F63EE4();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  v16 = self;
  BridgedAccessTracker.explicitSubmit(eventType:onlyIfTimed:submitTime:completion:)(ObjCClassMetadata, a4, (uint64_t)v12, (uint64_t)sub_1A5F232F4, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)explicitSubmitRawEvent:(id)a3 submitTime:(id)a4
{
  sub_1A5F1BD4C(self, (uint64_t)a2, a3, (uint64_t)a4, (SEL *)&selRef_explicitSubmitRawEvent_onlyIfTimed_submitTime_, 0);
}

- (void)explicitSubmitRawEvent:(id)a3 onlyIfTimed:(BOOL)a4 submitTime:(id)a5
{
  sub_1A5F1BF7C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, uint64_t, char *))BridgedAccessTracker.explicitSubmit(rawEvent:onlyIfTimed:submitTime:));
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
  AAAccessTracker *v15;
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
  aBlock[4] = sub_1A5F232F4;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A5F1A97C;
  aBlock[3] = &block_descriptor_37;
  v17 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  -[AAAccessTracker explicitSubmitRawEvent:onlyIfTimed:submitTime:completion:](v15, sel_explicitSubmitRawEvent_onlyIfTimed_submitTime_completion_, v14, 0, v16, v17);
  _Block_release(v17);

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
  AAAccessTracker *v17;
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
  BridgedAccessTracker.explicitSubmit(rawEvent:onlyIfTimed:submitTime:completion:)(v16, v7, (uint64_t)v13, (uint64_t)sub_1A5F22FE8, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)pushDataEvent:(id)a3 traits:(id)a4 file:(id)a5 line:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  AAAccessTracker *v14;

  v10 = sub_1A5F64130();
  v12 = v11;
  swift_unknownObjectRetain();
  v13 = a4;
  v14 = self;
  BridgedAccessTracker.push(data:traits:file:line:)((uint64_t)a3, (uint64_t)a4, v10, v12, a6);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)popDataEventType:(Class)a3
{
  AAAccessTracker *v4;

  swift_getObjCClassMetadata();
  v4 = self;
  BridgedAccessTracker.pop(dataType:)();

}

- (void)popDataEventByName:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  AAAccessTracker *v7;
  Swift::String v8;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  BridgedAccessTracker.pop(dataName:)(v8);

  swift_bridgeObjectRelease();
}

- (id)peekDataEventByName:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  AAAccessTracker *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v4 = sub_1A5F64130();
  v6 = v5;
  v7 = self;
  BridgedAccessTracker.peek(dataName:)(v4, v6, (uint64_t)v16);

  swift_bridgeObjectRelease();
  v8 = v17;
  if (!v17)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1(v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v10 + 16))(v13, v11);
  v14 = (void *)sub_1A5F64874();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v14;
}

@end
