@implementation FTMessage

- (_TtC20FaceTimeMessageStore7Message)ftMessage
{
  return (_TtC20FaceTimeMessageStore7Message *)*(id *)self->ftMessage;
}

- (MPMessageID)identifier
{
  void *v3;
  void *v4;

  swift_retain();
  sub_10015398C();
  v4 = v3;
  swift_release(self);
  return (MPMessageID *)v4;
}

- (NSString)provider
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  swift_retain();
  sub_100153A9C();
  v4 = v3;
  swift_release(self);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSUUID)callUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  v3 = sub_1001085C0(&qword_1002D7D78);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100153B7C((uint64_t)v6);
  swift_release(self);
  v7 = type metadata accessor for UUID(0);
  isa = 0;
  if (sub_100109FF4((uint64_t)v6, 1, v7) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  return (NSUUID *)isa;
}

- (int64_t)messageType
{
  int64_t v3;

  swift_retain();
  v3 = sub_100153BEC();
  swift_release(self);
  return v3;
}

- (TUHandle)senderHandle
{
  void *v3;
  void *v4;

  swift_retain();
  sub_100153D30();
  v4 = v3;
  swift_release(self);
  return (TUHandle *)v4;
}

- (NSString)senderDestinationID
{
  return (NSString *)sub_100153DC4((uint64_t)self);
}

- (NSString)senderISOCountryCode
{
  return (NSString *)sub_100153DC4((uint64_t)self);
}

- (NSString)receiverDestinationID
{
  return (NSString *)sub_100153DC4((uint64_t)self);
}

- (NSString)receiverISOCountryCode
{
  return (NSString *)sub_100153DC4((uint64_t)self);
}

- (NSString)callbackDestinationID
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  swift_retain(self);
  sub_100153FA4();
  v4 = v3;
  swift_release(self);
  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (int64_t)folder
{
  int64_t v3;
  int64_t v4;

  swift_retain();
  sub_100154038();
  v4 = v3;
  swift_release(self);
  return v4;
}

- (void)setFolder:(int64_t)a3
{
  sub_1001540B4(a3);
}

- (BOOL)isRead
{
  BOOL result;

  sub_10015504C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_100154120);
  return result;
}

- (void)setIsRead:(BOOL)a3
{
  sub_100154184(a3);
}

- (NSDate)date
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for Date(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100154234();
  swift_release(self);
  isa = Date._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return (NSDate *)isa;
}

- (BOOL)isTranscriptionAvailable
{
  BOOL result;

  sub_10015504C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_100154260);
  return result;
}

- (double)duration
{
  double v3;
  double v4;

  swift_retain();
  sub_100154830();
  v4 = v3;
  swift_release(self);
  return v4;
}

- (BOOL)isTranscriptionRated
{
  return 0;
}

- (BOOL)isTranscribing
{
  return 0;
}

- (BOOL)transcriptionAttempted
{
  BOOL result;

  sub_10015504C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_10015486C);
  return result;
}

- (BOOL)isDeleted
{
  return sub_1001548F8() & 1;
}

- (void)setIsDeleted:(BOOL)a3
{
  sub_10015493C(a3);
}

- (BOOL)isSensitive
{
  BOOL result;

  sub_10015504C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_100154960);
  return result;
}

- (NSURL)dataURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = sub_1001085C0((uint64_t *)&unk_1002DB390);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100154A44();
  swift_release(self);
  v7 = type metadata accessor for URL(0);
  v9 = 0;
  if (sub_100109FF4((uint64_t)v6, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  return (NSURL *)v9;
}

- (void)setDataURL:(id)a3
{
  sub_100154EC4((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
}

- (NSURL)thumbnailURL
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = sub_1001085C0((uint64_t *)&unk_1002DB390);
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_100154CEC(&OBJC_IVAR____TtC13InCallService9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(void))&dispatch thunk of Message.sandboxThumbnailFile.getter);
  swift_release(self);
  v7 = type metadata accessor for URL(0);
  v9 = 0;
  if (sub_100109FF4((uint64_t)v6, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  }
  return (NSURL *)v9;
}

- (void)setThumbnailURL:(id)a3
{
  sub_100154EC4((uint64_t)self, (uint64_t)a2, (uint64_t)a3);
}

- (BOOL)isRTT
{
  BOOL result;

  sub_10015504C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_100154614);
  return result;
}

- (BOOL)isDataAvailable
{
  BOOL result;

  sub_10015504C((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_100155080);
  return result;
}

- (MPTranscriptMessage)transcript
{
  void *v3;
  void *v4;

  swift_retain();
  sub_100154634();
  v4 = v3;
  swift_release(self);
  return (MPTranscriptMessage *)v4;
}

- (void)setTranscript:(id)a3
{
  swift_unknownObjectRetain(a3);
  swift_retain();
  sub_100155208((uint64_t)a3);
  swift_release(self);
}

- (BOOL)shouldMarkAsReadForPlaybackCurrentTime:(double)a3
{
  BOOL v5;

  swift_retain();
  v5 = sub_100155B08(a3);
  swift_release(self);
  return v5;
}

- (id)contactUsingContactStore:(id)a3 withKeysToFetch:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;

  v7 = sub_1001085C0(&qword_1002D93E0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  swift_retain();
  sub_100155BAC(v9);
  v11 = v10;

  swift_release(self);
  swift_bridgeObjectRelease(v8);
  return v11;
}

- (id)displayNameUsingContactStore:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v4 = a3;
  swift_retain();
  sub_100155CFC(v4);
  v6 = v5;

  swift_release(self);
  if (v6)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
