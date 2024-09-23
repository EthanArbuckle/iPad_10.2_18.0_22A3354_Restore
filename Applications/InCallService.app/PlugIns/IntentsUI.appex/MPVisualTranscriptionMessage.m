@implementation MPVisualTranscriptionMessage

- (NSAttributedString)attributedText
{
  void *v2;
  MPVisualTranscriptionMessage *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSString v8;
  id v9;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript);
  v3 = self;
  v4 = objc_msgSend(v2, "transcriptionString");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = objc_allocWithZone((Class)NSAttributedString);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend(v7, "initWithString:", v8);

  return (NSAttributedString *)v9;
}

- (NSString)text
{
  void *v2;
  MPVisualTranscriptionMessage *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript);
  v3 = self;
  v4 = objc_msgSend(v2, "transcriptionString");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (unint64_t)confidenceRating
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript), "confidenceRating");
}

- (double)confidence
{
  float v2;

  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript), "confidence");
  return v2;
}

- (MPVisualTranscriptionMessage)initWithVMTranscript:(id)a3
{
  return (MPVisualTranscriptionMessage *)sub_10003E850((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript, type metadata accessor for VisualTranscriptionMessage);
}

- (MPVisualTranscriptionMessage)init
{
  MPVisualTranscriptionMessage *result;

  result = (MPVisualTranscriptionMessage *)_swift_stdlib_reportUnimplementedInitializer("IntentsUI.VisualTranscriptionMessage", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
