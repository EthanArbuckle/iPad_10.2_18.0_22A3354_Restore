@implementation CKInboxItemSwift

- (CKInboxItemSwift)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5 systemImage:(id)a6 accessoryText:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v9 = sub_1DB1F6238();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DB1F622C();
  v12 = sub_1DB1F6490();
  v14 = v13;
  if (a5)
  {
    a5 = (id)sub_1DB1F6490();
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  v17 = sub_1DB1F6490();
  v19 = v18;
  if (a7)
  {
    v21 = sub_1DB1F6490();
  }
  else
  {
    v21 = 0;
    v20 = 0;
  }
  return (CKInboxItemSwift *)InboxItem.init(identifier:title:subtitle:systemImage:accessoryText:)((uint64_t)v11, v12, v14, (uint64_t)a5, v16, v17, v19, v21, v20);
}

- (void)updateWithAccessoryText:(id)a3
{
  CKInboxItemSwift *v4;

  sub_1DB1F6490();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1DB1F62A4();
}

- (NSString)description
{
  CKInboxItemSwift *v2;
  void *v3;

  v2 = self;
  InboxItem.description.getter();

  v3 = (void *)sub_1DB1F6484();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (CKInboxItemSwift)init
{
  CKInboxItemSwift *result;

  result = (CKInboxItemSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR___CKInboxItemSwift_identifier;
  v4 = sub_1DB1F6238();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR___CKInboxItemSwift__accessoryText;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F02D1318);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
