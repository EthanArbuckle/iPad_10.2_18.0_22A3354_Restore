@implementation FMPhoneNumberUtil

+ (id)formatWithPhoneNumber:(id)a3
{
  return sub_1CCAD4CF0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1CCAD5118);
}

+ (id)formattedWithHandle:(id)a3
{
  return sub_1CCAD4CF0((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1CCAD5204);
}

+ (id)unformatWithPhoneNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = sub_1CCB63298();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CCB63988();
  v9 = v8;
  sub_1CCB63244();
  sub_1CCB63274();
  swift_bridgeObjectRetain();
  sub_1CCAD5328(v7, v9, (uint64_t)v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  v10 = (void *)sub_1CCB63964();
  swift_bridgeObjectRelease();
  return v10;
}

+ (BOOL)isEmailValidWithEmail:(id)a3
{
  void *v3;
  void *v4;

  sub_1CCB63988();
  if (qword_1EF9DEFF8 != -1)
    swift_once();
  v3 = (void *)qword_1EF9E62B0;
  v4 = (void *)sub_1CCB63964();
  LOBYTE(v3) = objc_msgSend(v3, sel_evaluateWithObject_, v4);
  swift_bridgeObjectRelease();

  return (char)v3;
}

+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = sub_1CCB63988();
  v5 = sub_1CCAD54B8(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC8FMIPCore17FMPhoneNumberUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return -[FMPhoneNumberUtil init](&v3, sel_init);
}

@end
