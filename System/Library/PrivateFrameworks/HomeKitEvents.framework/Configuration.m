@implementation Configuration

- (_TtC13HomeKitEvents13Configuration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Configuration();
  return -[Configuration init](&v3, sel_init);
}

+ (CKContainerID)containerID
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  swift_getObjCClassMetadata();
  v2 = sub_23E90E754();
  v3 = objc_allocWithZone(MEMORY[0x24BDB9038]);
  v4 = (void *)sub_23E945B0C();
  v5 = objc_msgSend(v3, sel_initWithContainerIdentifier_environment_, v4, v2);

  return (CKContainerID *)v5;
}

+ (id)zoneUUIDForHomeIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  void *v11;
  uint64_t v13;

  v3 = sub_23E945A10();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  sub_23E9459E0();
  static Configuration.zoneUUID(forHomeIdentifier:)((uint64_t)v7, (uint64_t)v9);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  v11 = (void *)sub_23E9459C8();
  v10(v9, v3);
  return v11;
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = sub_23E945A10();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23E9459E0();
  v13 = sub_23E9459BC();
  v14 = v7;
  v11 = 0x2D73746E657665;
  v12 = 0xE700000000000000;
  v11 = sub_23E945BE4();
  v12 = v8;
  sub_23E945B9C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v9 = (void *)sub_23E945B0C();
  swift_bridgeObjectRelease();
  return v9;
}

+ (void)resetWithCompletion:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_getObjCClassMetadata();
  static Configuration.reset(completion:)((uint64_t)sub_23E90FE54, v4);
  swift_release();
}

@end
