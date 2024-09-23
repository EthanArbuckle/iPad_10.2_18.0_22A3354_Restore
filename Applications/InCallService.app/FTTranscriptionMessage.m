@implementation FTTranscriptionMessage

- (NSAttributedString)attributedText
{
  _TtC13InCallService22FTTranscriptionMessage *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100153514();
  v4 = v3;

  return (NSAttributedString *)v4;
}

- (NSString)text
{
  return (NSString *)sub_100153828(self, (uint64_t)a2, sub_10015355C);
}

- (unint64_t)confidenceRating
{
  return sub_1001535AC();
}

- (double)confidence
{
  return 1.0;
}

- (_TtC13InCallService22FTTranscriptionMessage)init
{
  sub_100153678();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13InCallService22FTTranscriptionMessage_transcriptData;
  v3 = sub_100156F1C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
