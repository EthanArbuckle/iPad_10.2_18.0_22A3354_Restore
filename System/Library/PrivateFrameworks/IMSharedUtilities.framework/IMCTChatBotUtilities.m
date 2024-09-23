@implementation IMCTChatBotUtilities

+ (BOOL)IMHandleIsChatBot:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  char v6;

  v3 = sub_19E36F888();
  sub_19E33192C(v3, v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  return v6 & 1;
}

+ (id)IMChipListFromSuggestions:(id)a3
{
  id v3;

  sub_19E36F888();
  swift_getObjCClassMetadata();
  v3 = sub_19E330F20();
  swift_bridgeObjectRelease();
  return v3;
}

+ (id)IMChipListFromCTChipList:(id)a3 originalID:(id)a4
{
  id v5;
  void *v6;

  sub_19E36F888();
  swift_getObjCClassMetadata();
  v5 = a3;
  v6 = (void *)sub_19E33125C(a3);

  swift_bridgeObjectRelease();
  return v6;
}

+ (id)IMChipFromCTChip:(id)a3 originalID:(id)a4
{
  id v5;
  id v6;

  sub_19E36F888();
  v5 = a3;
  v6 = sub_19E3328D8(v5);

  swift_bridgeObjectRelease();
  return v6;
}

- (IMCTChatBotUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMCTChatBotUtilities;
  return -[IMCTChatBotUtilities init](&v3, sel_init);
}

@end
