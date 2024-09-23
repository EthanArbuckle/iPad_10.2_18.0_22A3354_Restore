@implementation FBARequestsInbox

- (NSString)displayText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC18Feedback_Assistant16FBARequestsInbox *v7;
  id v8;
  Swift::String v9;
  Swift::String_optional v10;
  Swift::String v11;
  void *object;
  NSString v13;
  Swift::String v15;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(FBKCommonStrings);
  v5 = v4;
  v6 = (void *)objc_opt_self(NSBundle);
  v7 = self;
  v8 = objc_msgSend(v6, "mainBundle");
  v15._object = (void *)0xE000000000000000;
  v9._countAndFlagsBits = 0x5354534555514552;
  v9._object = (void *)0xEF5245544C49465FLL;
  v10.value._countAndFlagsBits = v3;
  v10.value._object = v5;
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v15)._object;

  swift_bridgeObjectRelease(v5);
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return (NSString *)v13;
}

- (NSString)iconSystemImageName
{
  return (NSString *)FBKSystemImageNameQuickFilterRequests;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v5;
  _TtC18Feedback_Assistant16FBARequestsInbox *v6;
  unint64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10008D0C0((uint64_t)a3);

  return v7;
}

- (id)predicateForTeam:(id)a3
{
  return sub_10008DDC8();
}

- (int64_t)type
{
  return 1;
}

- (_TtC18Feedback_Assistant16FBARequestsInbox)init
{
  return (_TtC18Feedback_Assistant16FBARequestsInbox *)sub_10008DA84(self, (uint64_t)a2, type metadata accessor for FBARequestsInbox);
}

@end
