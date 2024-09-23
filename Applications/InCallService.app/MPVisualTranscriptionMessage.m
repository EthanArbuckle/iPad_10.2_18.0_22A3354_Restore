@implementation MPVisualTranscriptionMessage

- (NSAttributedString)attributedText
{
  MPVisualTranscriptionMessage *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100185BB0();
  v4 = v3;

  return (NSAttributedString *)v4;
}

- (NSString)text
{
  MPVisualTranscriptionMessage *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100185C30();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (unint64_t)confidenceRating
{
  MPVisualTranscriptionMessage *v2;
  id v3;

  v2 = self;
  v3 = sub_100185CB4();

  return (unint64_t)v3;
}

- (double)confidence
{
  MPVisualTranscriptionMessage *v2;
  double v3;

  v2 = self;
  v3 = sub_100185D04();

  return v3;
}

- (MPVisualTranscriptionMessage)initWithVMTranscript:(id)a3
{
  return (MPVisualTranscriptionMessage *)sub_1001868C8((uint64_t)a3, &OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript, type metadata accessor for VisualTranscriptionMessage);
}

- (MPVisualTranscriptionMessage)init
{
  sub_100185D64();
}

- (void).cxx_destruct
{
  sub_1001877D0((uint64_t)self, OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript);
}

@end
