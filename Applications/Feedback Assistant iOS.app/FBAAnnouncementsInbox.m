@implementation FBAAnnouncementsInbox

- (NSString)displayText
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _TtC18Feedback_Assistant21FBAAnnouncementsInbox *v7;
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
  v9._object = (void *)0x80000001000D8F70;
  v9._countAndFlagsBits = 0xD000000000000014;
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
  return (NSString *)FBKSystemImageNameQuickFilterAnnouncements;
}

- (unint64_t)unreadCountForTeam:(id)a3
{
  id v5;
  _TtC18Feedback_Assistant21FBAAnnouncementsInbox *v6;
  unint64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10008D670((uint64_t)a3);

  return v7;
}

- (id)predicateForTeam:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  _TtC18Feedback_Assistant21FBAAnnouncementsInbox *v8;
  NSString v9;
  Class isa;
  id v11;

  v5 = sub_10004BB9C((uint64_t *)&unk_1001178F0);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_1000CC730;
  *(_QWORD *)(v6 + 56) = &type metadata for UInt;
  *(_QWORD *)(v6 + 32) = 2;
  v7 = a3;
  v8 = self;
  v9 = String._bridgeToObjectiveC()();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  v11 = objc_msgSend((id)objc_opt_self(NSPredicate), "predicateWithFormat:argumentArray:", v9, isa);

  return v11;
}

- (int64_t)type
{
  return 1;
}

- (_TtC18Feedback_Assistant21FBAAnnouncementsInbox)init
{
  return (_TtC18Feedback_Assistant21FBAAnnouncementsInbox *)sub_10008DA84(self, (uint64_t)a2, type metadata accessor for FBAAnnouncementsInbox);
}

@end
