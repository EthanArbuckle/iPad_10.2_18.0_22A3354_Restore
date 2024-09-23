@implementation IMBMessage

- (id)makeRootObjectWithMessageData:(id)a3 dictionary:(id)a4 imageDictionary:(id)a5 version:(int64_t)a6
{
  uint64_t v10;
  unint64_t v11;
  id v12;
  _TtC8Business10IMBMessage *v13;
  void *v14;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  if (a5)
  {
    v11 = sub_10003CF18();
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, v11, &protocol witness table for String);
  }
  v12 = a3;
  v13 = self;
  v14 = (void *)sub_10003C3A4(v12, v10, (unint64_t)a5, a6);

  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(a5);
  return v14;
}

- (_TtC8Business10IMBMessage)initWithData:(id)a3 url:(id)a4 messageGUID:(id)a5 isFromMe:(BOOL)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v10 = sub_100007D40((uint64_t *)&unk_1000ED480);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v14 = a4;
    v15 = a5;
    v16 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v18 = v17;

    if (a4)
    {
LABEL_3:
      static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);

      v19 = type metadata accessor for URL(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v13, 0, 1, v19);
      goto LABEL_6;
    }
  }
  else
  {
    v20 = a4;
    v21 = a5;
    v18 = 0xF000000000000000;
    if (a4)
      goto LABEL_3;
  }
  v22 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v13, 1, 1, v22);
LABEL_6:
  if (a5)
  {
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v25 = v24;

  }
  else
  {
    v23 = 0;
    v25 = 0;
  }
  return (_TtC8Business10IMBMessage *)sub_10003CAAC((uint64_t)a3, v18, (uint64_t)v13, v23, v25, a6);
}

- (id)initFromOriginalMessage:(id)a3 rootKey:(id)a4 rootObject:(id)a5 receivedMessage:(id)a6 replyMessage:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  NSString v17;
  id v18;
  objc_super v20;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = a3;
  swift_unknownObjectRetain(a5);
  v15 = a6;
  v16 = a7;
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v13);
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for IMBMessage();
  v18 = -[IMBMessage initFromOriginalMessage:rootKey:rootObject:receivedMessage:replyMessage:](&v20, "initFromOriginalMessage:rootKey:rootObject:receivedMessage:replyMessage:", v14, v17, a5, v15, v16);

  swift_unknownObjectRelease(a5);
  return v18;
}

@end
