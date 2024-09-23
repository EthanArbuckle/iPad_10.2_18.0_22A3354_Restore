@implementation FTTranscriptionMessage

- (NSAttributedString)attributedText
{
  _TtC9IntentsUI22FTTranscriptionMessage *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSString v6;
  id v7;

  v2 = self;
  Transcript.text.getter();
  v4 = v3;
  v5 = objc_allocWithZone((Class)NSAttributedString);
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v7 = objc_msgSend(v5, "initWithString:", v6);

  return (NSAttributedString *)v7;
}

- (NSString)text
{
  _TtC9IntentsUI22FTTranscriptionMessage *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  Transcript.text.getter();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (unint64_t)confidenceRating
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_confidenceRating);
}

- (double)confidence
{
  return 1.0;
}

- (_TtC9IntentsUI22FTTranscriptionMessage)init
{
  _TtC9IntentsUI22FTTranscriptionMessage *result;

  result = (_TtC9IntentsUI22FTTranscriptionMessage *)_swift_stdlib_reportUnimplementedInitializer("IntentsUI.FTTranscriptionMessage", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_transcriptData;
  v3 = type metadata accessor for Transcript(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
