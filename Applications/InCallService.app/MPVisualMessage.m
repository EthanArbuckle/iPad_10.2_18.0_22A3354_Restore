@implementation MPVisualMessage

- (VMVoicemail)vmMessage
{
  return (VMVoicemail *)sub_100185DEC();
}

- (MPMessageID)identifier
{
  MPVisualMessage *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100185E2C();
  v4 = v3;

  return (MPMessageID *)v4;
}

- (NSString)provider
{
  MPVisualMessage *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100185EC8();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (int64_t)messageType
{
  return 1;
}

- (NSUUID)callUUID
{
  return (NSUUID *)sub_1001867A0((uint64_t)self, (uint64_t)a2, &qword_1002D7D78, (void (*)(uint64_t))sub_100185F9C, (uint64_t (*)(_QWORD))&type metadata accessor for UUID, (uint64_t (*)(void))&UUID._bridgeToObjectiveC());
}

- (TUHandle)senderHandle
{
  MPVisualMessage *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_100185FF0((uint64_t)v2);
  v4 = v3;

  return (TUHandle *)v4;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_1001860A8(self, (uint64_t)a2, sub_100186090);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_1001860A8(self, (uint64_t)a2, sub_100186108);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_1001860A8(self, (uint64_t)a2, sub_100186120);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_1001860A8(self, (uint64_t)a2, sub_100186138);
}

- (NSString)callbackDestinationID
{
  return (NSString *)sub_1001860A8(self, (uint64_t)a2, sub_100186150);
}

- (int64_t)folder
{
  MPVisualMessage *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1001861E8((uint64_t)v2);
  v4 = v3;

  return v4;
}

- (BOOL)isRead
{
  MPVisualMessage *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100186280();

  return v3 & 1;
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  MPVisualMessage *v8;
  Class isa;
  uint64_t v11;

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_100186344();

  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSDate *)isa;
}

- (BOOL)isTranscriptionAvailable
{
  MPVisualMessage *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1001863C8();

  return v3 & 1;
}

- (double)duration
{
  MPVisualMessage *v2;
  double v3;
  double v4;

  v2 = self;
  sub_100186428();
  v4 = v3;

  return v4;
}

- (BOOL)isTranscriptionRated
{
  MPVisualMessage *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_100186470();

  return v3 & 1;
}

- (BOOL)isTranscribing
{
  MPVisualMessage *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_1001864C8();

  return v3;
}

- (BOOL)transcriptionAttempted
{
  MPVisualMessage *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100186528();

  return v3;
}

- (MPTranscriptMessage)transcript
{
  MPVisualMessage *v2;
  id v3;

  v2 = self;
  v3 = sub_100186588();

  return (MPTranscriptMessage *)v3;
}

- (BOOL)isDeleted
{
  MPVisualMessage *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_10018662C();

  return v3 & 1;
}

- (BOOL)isSensitive
{
  return 0;
}

- (NSURL)dataURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  MPVisualMessage *v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = sub_1001085C0((uint64_t *)&unk_1002DB390);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_10018671C((uint64_t)v6);

  v8 = type metadata accessor for URL(0);
  v10 = 0;
  if (sub_100109FF4((uint64_t)v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
  }
  return (NSURL *)v10;
}

- (NSURL)thumbnailURL
{
  return (NSURL *)sub_1001867A0((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1002DB390, (void (*)(uint64_t))sub_10018684C, (uint64_t (*)(_QWORD))&type metadata accessor for URL, (uint64_t (*)(void))&URL._bridgeToObjectiveC());
}

- (BOOL)isDataAvailable
{
  MPVisualMessage *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1001868A0();

  return v3 & 1;
}

- (MPVisualMessage)initWithVMVoicemail:(id)a3
{
  return (MPVisualMessage *)sub_1001868C8((uint64_t)a3, &OBJC_IVAR___MPVisualMessage_vmMessage, type metadata accessor for VisualMessage);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  MPVisualMessage *v4;
  unsigned __int8 v5;

  v4 = self;
  v5 = sub_100186934(a3);

  return v5 & 1;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  MPVisualMessage *v10;
  void *v11;
  void *v12;

  v7 = sub_1001085C0(&qword_1002D93E0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1001869A0((uint64_t)v9, v8);
  v12 = v11;

  swift_bridgeObjectRelease(v8);
  return v12;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v4;
  MPVisualMessage *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_100186A90((uint64_t)v4);
  v7 = v6;

  if (v7)
  {
    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (MPVisualMessage)init
{
  sub_100186B68();
}

- (void).cxx_destruct
{
  sub_1001877D0((uint64_t)self, OBJC_IVAR___MPVisualMessage_vmMessage);
}

@end
