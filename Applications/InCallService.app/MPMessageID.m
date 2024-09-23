@implementation MPMessageID

- (NSString)stringValue
{
  return (NSString *)sub_10011FE3C(self, (uint64_t)a2, (void (*)(void))sub_10011FBB8);
}

- (NSUUID)messageUUID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  Class isa;
  uint64_t v9;

  v2 = sub_1001085C0(&qword_1002D7D78);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10011FD84((uint64_t)v5);
  v6 = type metadata accessor for UUID(0);
  isa = 0;
  if (sub_100109FF4((uint64_t)v5, 1, v6) != 1)
  {
    isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  return (NSUUID *)isa;
}

- (NSString)description
{
  return (NSString *)sub_10011FE3C(self, (uint64_t)a2, (void (*)(void))sub_10011FE94);
}

- (MPMessageID)initWithValue:(unint64_t)a3
{
  return (MPMessageID *)sub_10011FE98(a3);
}

- (MPMessageID)initWithUuid:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = type metadata accessor for UUID(0);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (MPMessageID *)sub_10011FF20((uint64_t)v7);
}

- (MPMessageID)init
{
  sub_100120040();
}

- (void).cxx_destruct
{
  sub_1001089B0((uint64_t)self + OBJC_IVAR___MPMessageID_value);
}

- (int64_t)hash
{
  MPMessageID *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_100120374((uint64_t)v2);
  v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  MPMessageID *v5;
  uint64_t v6;
  MPMessageID *v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_1001203AC((uint64_t)v10);

  sub_1001209C8((uint64_t)v10, &qword_1002D84F0);
  return v8 & 1;
}

@end
