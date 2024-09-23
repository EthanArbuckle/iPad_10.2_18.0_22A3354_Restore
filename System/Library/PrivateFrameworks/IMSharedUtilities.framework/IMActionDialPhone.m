@implementation IMActionDialPhone

- (NSString)phoneNumber
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_19E36F864();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)fallbackUrl
{
  void *v2;

  if (*(_QWORD *)&self->phoneNumber[OBJC_IVAR___IMActionDialPhone_fallbackUrl])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_19E36F864();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (IMActionDialPhone)initWithPhoneNumber:(id)a3 fallbackUrl:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  objc_super v14;

  v6 = sub_19E36F888();
  v8 = v7;
  if (a4)
  {
    v9 = sub_19E36F888();
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialPhone_phoneNumber);
  *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialPhone_fallbackUrl);
  *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)IMActionDialPhone;
  return -[IMActionDialPhone init](&v14, sel_init);
}

- (IMActionDialPhone)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionDialPhone *)IMActionDialPhone.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMActionDialPhone *v2;
  void *v3;

  v2 = self;
  sub_19E32AB10();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMActionDialPhone)init
{
  IMActionDialPhone *result;

  result = (IMActionDialPhone *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
