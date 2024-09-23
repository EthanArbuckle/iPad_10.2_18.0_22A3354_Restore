@implementation FeedbackServiceNoOpServer

- (BOOL)logWithFeedbackData:(id)a3 type:(id)a4 variant:(id)a5 eventId:(int64_t)a6 withTimestamp:(id)a7 shouldProcessImmediately:(BOOL)a8 error:(id *)a9
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  _TtC20IntelligencePlatform25FeedbackServiceNoOpServer *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v27 = sub_1AE9248DC();
  v14 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = a3;
  v18 = a4;
  v19 = a7;
  v20 = self;
  v21 = a5;
  v22 = sub_1AE924834();
  v24 = v23;

  sub_1AE925E3C();
  if (v21)
  {
    sub_1AE925E3C();

  }
  sub_1AE9248A0();

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v27);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1AE50BDB4(v22, v24);
  return 1;
}

- (_TtC20IntelligencePlatform25FeedbackServiceNoOpServer)init
{
  return (_TtC20IntelligencePlatform25FeedbackServiceNoOpServer *)sub_1AE6700C4();
}

@end
