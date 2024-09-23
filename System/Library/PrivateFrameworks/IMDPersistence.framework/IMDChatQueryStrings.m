@implementation IMDChatQueryStrings

+ (NSString)allColumns
{
  return (NSString *)(id)sub_1ABC64444();
}

+ (NSString)selectAllColumns
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, sel_allColumns);
  sub_1ABC64450();

  sub_1ABC64474();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1ABC64474();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1ABC64444();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (NSString)copyAllChatsQuery
{
  return (NSString *)sub_1ABC4D66C(a1);
}

+ (NSString)copyAllNamedChatsQuery
{
  return (NSString *)sub_1ABC4D66C(a1);
}

+ (NSString)remapChatsWithLastAddressedSIMIDToNewLastAddressedIDsQuery
{
  return (NSString *)(id)sub_1ABC64444();
}

+ (NSString)chatRowIDsSortedByLastMessageDate
{
  return (NSString *)(id)sub_1ABC64444();
}

+ (NSString)copyAllActiveChatsQuery
{
  return (NSString *)sub_1ABC4D66C(a1);
}

+ (NSString)copyChatForGUIDQuery
{
  return (NSString *)sub_1ABC4D66C(a1);
}

+ (NSString)copyChatForGUIDUnlockedQuery
{
  return (NSString *)sub_1ABC4D66C(a1);
}

+ (NSString)copyChatGUIDsWithUnreadMessagesQuery
{
  return (NSString *)sub_1ABC64444();
}

+ (NSString)copyChatsWithUnreadMessagesQuery
{
  return (NSString *)sub_1ABC64444();
}

+ (id)copyRecentChatsQueryWithFilterCount:(int)a3
{
  void *v3;

  sub_1ABC4D744(0xD000000000000294, 0x80000001ABCA1730, a3);
  sub_1ABC4DADC(&qword_1EEC3F810);
  sub_1ABC4DB1C();
  sub_1ABC64438();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1ABC64474();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1ABC64444();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)copyChatsWithUnreadMessagesWithLimit:(int64_t)a3
{
  void *v4;

  swift_getObjCClassMetadata();
  sub_1ABC4D91C(a3);
  v4 = (void *)sub_1ABC64444();
  swift_bridgeObjectRelease();
  return v4;
}

- (IMDChatQueryStrings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDChatQueryStrings;
  return -[IMDChatQueryStrings init](&v3, sel_init);
}

@end
