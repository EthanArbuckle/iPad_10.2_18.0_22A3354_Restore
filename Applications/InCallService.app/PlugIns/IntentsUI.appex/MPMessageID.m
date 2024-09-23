@implementation MPMessageID

- (NSString)stringValue
{
  MPMessageID *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10004EE44();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSUUID)messageUUID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v3 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100031408(&qword_100091A98);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003D880((uint64_t)self + OBJC_IVAR___MPMessageID_value, (uint64_t)v5);
  LODWORD(v3) = swift_getEnumCaseMultiPayload(v5, v3);
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((_DWORD)v3 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v8, v5, v9);
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, v11, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return (NSUUID *)0;
  isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  return (NSUUID *)isa;
}

- (NSString)description
{
  MPMessageID *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_10004EE44();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (MPMessageID)initWithValue:(unint64_t)a3
{
  char *v4;
  uint64_t v5;
  objc_super v7;

  v4 = (char *)self + OBJC_IVAR___MPMessageID_value;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___MPMessageID_value) = (Class)a3;
  v5 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v4, v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MessageID(0);
  return -[MPMessageID init](&v7, "init");
}

- (MPMessageID)initWithUuid:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  objc_class *v11;
  MPMessageID *v12;
  objc_super v14;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (char *)self + OBJC_IVAR___MPMessageID_value;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)self + OBJC_IVAR___MPMessageID_value, v8, v5);
  v10 = type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload(v9, v10, 1);
  v11 = (objc_class *)type metadata accessor for MessageID(0);
  v14.receiver = self;
  v14.super_class = v11;
  v12 = -[MPMessageID init](&v14, "init");
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v12;
}

- (MPMessageID)init
{
  MPMessageID *result;

  result = (MPMessageID *)_swift_stdlib_reportUnimplementedInitializer("IntentsUI.MessageID", 19, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003D8C4((uint64_t)self + OBJC_IVAR___MPMessageID_value);
}

- (int64_t)hash
{
  MPMessageID *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_10004E9AC();

  return v3;
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
  v8 = sub_10004F3B0((uint64_t)v10);

  sub_100031760((uint64_t)v10, &qword_1000920E8);
  return v8 & 1;
}

@end
