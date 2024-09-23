@implementation FMPhoneNumberUtil

+ (id)formatWithPhoneNumber:(id)a3
{
  return sub_211A036B8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_211A03AE0);
}

+ (id)formattedWithHandle:(id)a3
{
  return sub_211A036B8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_211A03D5C);
}

+ (id)unformatWithPhoneNumber:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v13;

  v3 = sub_211A46FBC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_211A47910();
  v10 = v9;
  sub_211A46F8C();
  sub_211A46FA4();
  swift_bridgeObjectRetain();
  sub_211A03BCC(v8, v10, (uint64_t)v7);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  swift_bridgeObjectRelease();
  v11 = (void *)sub_211A478EC();
  swift_bridgeObjectRelease();
  return v11;
}

+ (BOOL)isEmailValidWithEmail:(id)a3
{
  void *v3;
  void *v4;

  sub_211A47910();
  if (qword_254AC7B58 != -1)
    swift_once();
  v3 = (void *)qword_254ADC738;
  v4 = (void *)sub_211A478EC();
  LOBYTE(v3) = objc_msgSend(v3, sel_evaluateWithObject_, v4);
  swift_bridgeObjectRelease();

  return (char)v3;
}

+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = sub_211A47910();
  v5 = sub_211A03E80(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC7FMFCore17FMPhoneNumberUtil)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return -[FMPhoneNumberUtil init](&v3, sel_init);
}

@end
