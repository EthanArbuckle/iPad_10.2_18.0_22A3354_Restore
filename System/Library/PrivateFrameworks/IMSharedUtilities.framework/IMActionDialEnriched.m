@implementation IMActionDialEnriched

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
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionDialEnriched_fallbackUrl);
}

- (NSString)subject
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionDialEnriched_subject);
}

- (IMActionDialEnriched)initWithPhoneNumber:(id)a3 fallbackUrl:(id)a4 subject:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  id *v16;
  uint64_t *v17;
  objc_super v19;

  v8 = sub_19E36F888();
  v10 = v9;
  if (!a4)
  {
    v12 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    v14 = 0;
    goto LABEL_6;
  }
  a4 = (id)sub_19E36F888();
  v12 = v11;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = sub_19E36F888();
LABEL_6:
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialEnriched_phoneNumber);
  *v15 = v8;
  v15[1] = v10;
  v16 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMActionDialEnriched_fallbackUrl);
  *v16 = a4;
  v16[1] = v12;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionDialEnriched_subject);
  *v17 = v13;
  v17[1] = v14;
  v19.receiver = self;
  v19.super_class = (Class)IMActionDialEnriched;
  return -[IMActionDialEnriched init](&v19, sel_init);
}

- (IMActionDialEnriched)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionDialEnriched *)IMActionDialEnriched.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMActionDialEnriched *v2;
  void *v3;

  v2 = self;
  sub_19E34E3E4();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMActionDialEnriched)init
{
  IMActionDialEnriched *result;

  result = (IMActionDialEnriched *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
