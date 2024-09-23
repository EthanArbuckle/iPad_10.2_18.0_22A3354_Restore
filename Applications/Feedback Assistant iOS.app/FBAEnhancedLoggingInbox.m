@implementation FBAEnhancedLoggingInbox

- (NSString)iconSystemImageName
{
  return (NSString *)FBKSystemImageNameEnhancedLogging;
}

- (int64_t)type
{
  return 4;
}

- (NSString)displayText
{
  void *v3;
  _TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *v4;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  NSString v9;
  Swift::String v11;

  v3 = (void *)objc_opt_self(NSBundle);
  v4 = self;
  v5 = objc_msgSend(v3, "mainBundle");
  v11._countAndFlagsBits = 0xD000000000000022;
  v11._object = (void *)0x80000001000D55A0;
  v6._object = (void *)0x80000001000D5560;
  v7._object = (void *)0x80000001000D5580;
  v6._countAndFlagsBits = 0xD000000000000010;
  v7._countAndFlagsBits = 0xD000000000000010;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v11)._object;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return (NSString *)v9;
}

- (BOOL)supportsDeletion
{
  return 1;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  void *v5;
  id v6;
  _TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *v7;
  id v8;
  unint64_t v9;
  unint64_t result;
  char v11;

  v5 = (void *)objc_opt_self(FBKEnhancedLoggingPersistence);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "sharedInstance");
  v9 = (unint64_t)objc_msgSend(v8, "loggingSessionCount");

  if ((v9 & 0x8000000000000000) != 0)
  {
    v11 = 2;
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, v11, 3451, 0);
    __break(1u);
  }
  else
  {

    return v9;
  }
  return result;
}

- (id)inboxItemsForTeam:(id)a3 withSortDescriptors:(id)a4
{
  void *v6;
  id v7;
  _TtC18Feedback_Assistant23FBAEnhancedLoggingInbox *v8;
  id v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class isa;

  v6 = (void *)objc_opt_self(FBKEnhancedLoggingPersistence);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, "sharedInstance");
  v10 = objc_msgSend(v9, "items");

  v11 = sub_100056E00();
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);

  v13 = sub_10007D6E8(v12);
  swift_bridgeObjectRelease(v12);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  return isa;
}

- (BOOL)isCountingUnreadOnly
{
  return 0;
}

- (_TtC18Feedback_Assistant23FBAEnhancedLoggingInbox)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBAEnhancedLoggingInbox();
  return -[FBAEnhancedLoggingInbox init](&v3, "init");
}

@end
