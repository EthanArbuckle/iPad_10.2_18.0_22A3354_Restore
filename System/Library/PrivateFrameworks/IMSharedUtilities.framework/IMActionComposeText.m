@implementation IMActionComposeText

- (NSString)phoneNumber
{
  return (NSString *)sub_19E325D9C();
}

- (NSString)text
{
  return (NSString *)sub_19E325D9C();
}

- (IMActionComposeText)initWithPhoneNumber:(id)a3 text:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  objc_super v13;

  v5 = sub_19E36F888();
  v7 = v6;
  v8 = sub_19E36F888();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionComposeText_phoneNumber);
  *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionComposeText_text);
  *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)IMActionComposeText;
  return -[IMActionComposeText init](&v13, sel_init);
}

- (IMActionComposeText)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionComposeText *)IMActionComposeText.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMActionComposeText *v2;
  void *v3;

  v2 = self;
  sub_19E3260E0();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMActionComposeText)init
{
  IMActionComposeText *result;

  result = (IMActionComposeText *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
