@implementation FeedbackServiceXPC.Server

- (void)logFeedback:(id)a3 ofType:(id)a4 ofVariant:(id)a5 forEvent:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 completion:(id)a9
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server *v30;
  uint64_t v31;
  _TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server *v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a8;
  v34 = a6;
  v14 = sub_1C106ADE0();
  v35 = *(_QWORD *)(v14 - 8);
  v36 = v14;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a9);
  v18 = a3;
  v19 = a4;
  v20 = a7;
  v32 = self;
  v21 = a5;
  v22 = sub_1C106AC18();
  v24 = v23;

  v31 = sub_1C106FB14();
  v26 = v25;

  if (v21)
  {
    v27 = sub_1C106FB14();
    v29 = v28;

  }
  else
  {
    v27 = 0;
    v29 = 0;
  }
  sub_1C106AD98();

  _Block_copy(v17);
  v30 = v32;
  sub_1C0A4E338(v22, v24, v31, v26, v27, v29, v34, (uint64_t)v16, v33, (uint64_t)v32, (void (**)(_QWORD, uint64_t, _QWORD))v17);
  _Block_release(v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C07B3374(v22, v24);

  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v36);
}

- (_TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server)init
{
  FeedbackServiceXPC.Server.init()();
}

- (void).cxx_destruct
{
  sub_1C07B2018((uint64_t)self + OBJC_IVAR____TtCC24IntelligencePlatformCore18FeedbackServiceXPC6Server_config, (uint64_t (*)(_QWORD))type metadata accessor for Configuration);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
