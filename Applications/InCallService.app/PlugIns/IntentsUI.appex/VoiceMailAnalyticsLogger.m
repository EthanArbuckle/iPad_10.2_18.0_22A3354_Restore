@implementation VoiceMailAnalyticsLogger

- (_TtC9IntentsUI24VoiceMailAnalyticsLogger)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _TtC9IntentsUI24VoiceMailAnalyticsLogger *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v2 = OBJC_IVAR____TtC9IntentsUI24VoiceMailAnalyticsLogger_logger;
  v3 = qword_100091070;
  v5 = self;
  if (v3 != -1)
    swift_once(&qword_100091070, sub_1000516C4);
  v6 = type metadata accessor for Logger(0, v4);
  v7 = sub_100030760(v6, (uint64_t)qword_100092E90);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))((char *)v5 + v2, v7, v6);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for VoiceMailAnalyticsLogger(0);
  return -[VoiceMailAnalyticsLogger init](&v9, "init");
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9IntentsUI24VoiceMailAnalyticsLogger_logger;
  v3 = type metadata accessor for Logger(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
