@implementation FBAAllInbox

- (NSString)displayText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC18Feedback_Assistant11FBAAllInbox *v7;
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
  v9._countAndFlagsBits = 0x544C49465F4C4C41;
  v9._object = (void *)0xEA00000000005245;
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
  return (NSString *)FBKSystemImageNameQuickFilterAll;
}

- (id)predicateForTeam:(id)a3
{
  return objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithValue:", 1);
}

- (int64_t)type
{
  return 1;
}

- (BOOL)isCountingUnreadOnly
{
  return 0;
}

- (_TtC18Feedback_Assistant11FBAAllInbox)init
{
  return (_TtC18Feedback_Assistant11FBAAllInbox *)sub_10008DA84(self, (uint64_t)a2, type metadata accessor for FBAAllInbox);
}

- (uint64_t)unreadCountForTeam:
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v0 = objc_msgSend((id)objc_opt_self(FBKData), "sharedInstance");
  v1 = objc_msgSend(v0, "currentUser");

  if (!v1)
    return 0;
  v2 = (uint64_t)objc_msgSend(v1, "contentItems");

  if (v2)
  {
    v3 = sub_100053458(0, (unint64_t *)&qword_100116990, FBKContentItem_ptr);
    v4 = sub_10008DEDC();
    v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v2, v3, v4);

    if ((v5 & 0xC000000000000001) == 0)
    {
      v2 = *(_QWORD *)(v5 + 16);
      swift_bridgeObjectRelease(v5);
      return v2;
    }
    v6 = v5 < 0 ? v5 : v5 & 0xFFFFFFFFFFFFFF8;
    v2 = __CocoaSet.count.getter(v6);
    swift_bridgeObjectRelease(v5);
    if (v2 < 0)
    {
      v8 = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Negative value is not representable", 35, 2, "Swift/Integers.swift", 20, v8, 3451, 0);
      __break(1u);
      return 0;
    }
  }
  return v2;
}

@end
