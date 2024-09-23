@implementation EventLogServiceXPC.Server

- (void)dealloc
{
  _TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server *v2;

  v2 = self;
  EventLogServiceXPC.Server.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

- (void)logStartWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 completion:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server *v14;
  uint64_t v15;

  v9 = sub_1C106ADE0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a7);
  sub_1C106AD98();
  sub_1C106FB14();
  *(_QWORD *)(swift_allocObject() + 16) = v13;
  v14 = self;
  EventLogServiceXPC.Server.logStart(withId:timestamp:name:parent:completion:)();

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)logEndWithId:(int64_t)a3 timestamp:(id)a4 dependencies:(id)a5 payloadType:(id)a6 payloadVariant:(id)a7 payload:(id)a8 completion:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;

  v29 = a3;
  v12 = sub_1C106ADE0();
  v30 = *(_QWORD *)(v12 - 8);
  v31 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = _Block_copy(a9);
  sub_1C106AD98();
  sub_1C07D4B70(0, (unint64_t *)&qword_1ED762C00);
  v15 = sub_1C106FF04();
  v16 = sub_1C106FB14();
  v18 = v17;
  if (a7)
  {
    v19 = sub_1C106FB14();
    a7 = v20;
  }
  else
  {
    v19 = 0;
  }
  v21 = a8;
  v22 = self;
  v23 = sub_1C106AC18();
  v25 = v24;

  v26 = swift_allocObject();
  *(_QWORD *)(v26 + 16) = v28;
  EventLogServiceXPC.Server.logEnd(withId:timestamp:dependencies:payloadType:payloadVariant:payload:completion:)(v29, (uint64_t)v14, v15, v16, v18, v19, (uint64_t)a7, v23, v25, (uint64_t)sub_1C09D5FD8, v26, v27, (uint64_t)v28, v29, v30, v31, v32, v33, v34,
    v35,
    v36,
    v37,
    v38);
  swift_release();
  sub_1C07B3374(v23, v25);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v31);
}

- (void)logInstantWithId:(int64_t)a3 timestamp:(id)a4 name:(id)a5 parent:(int64_t)a6 dependencies:(id)a7 payloadType:(id)a8 payloadVariant:(id)a9 payload:(id)a10 completion:(id)a11
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  _TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;

  v32 = a3;
  v33 = a6;
  v12 = a9;
  v13 = sub_1C106ADE0();
  v34 = *(_QWORD *)(v13 - 8);
  v35 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = _Block_copy(a11);
  sub_1C106AD98();
  v30 = sub_1C106FB14();
  v31 = v16;
  sub_1C07D4B70(0, (unint64_t *)&qword_1ED762C00);
  v17 = sub_1C106FF04();
  v28 = sub_1C106FB14();
  v19 = v18;
  if (a9)
  {
    v20 = sub_1C106FB14();
    v12 = v21;
  }
  else
  {
    v20 = 0;
  }
  v22 = a10;
  v23 = self;
  v24 = sub_1C106AC18();
  v26 = v25;

  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v29;
  EventLogServiceXPC.Server.logInstant(withId:timestamp:name:parent:dependencies:payloadType:payloadVariant:payload:completion:)(v32, (uint64_t)v15, v30, v31, v33, v17, v28, v19, v20, (uint64_t)v12, v24, v26, (uint64_t)sub_1C09D5F48, v27, v28, (uint64_t)v29, v30, v31, v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39);
  swift_release();
  sub_1C07B3374(v24, v26);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v15, v35);
}

- (_TtCC24IntelligencePlatformCore18EventLogServiceXPC6Server)init
{
  EventLogServiceXPC.Server.init()();
}

@end
