@implementation _EXExtensionInstanceIdentifier

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE20C068;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____EXExtensionInstanceIdentifier_identifier;
  v3 = sub_190CA84E8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (NSString)description
{
  _EXExtensionInstanceIdentifier *v2;
  void *v3;

  v2 = self;
  sub_190C29560();

  v3 = (void *)sub_190CA85D8();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXExtensionInstanceIdentifier *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_190CA84A0();
  v7 = (id)sub_190CA85D8();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (_EXExtensionInstanceIdentifier)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  _EXExtensionInstanceIdentifier *v10;
  _EXExtensionInstanceIdentifier *result;
  _EXExtensionInstanceIdentifier *v12;
  objc_class *v13;
  _EXExtensionInstanceIdentifier *v14;
  objc_super v15;

  v5 = sub_190CA84E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_190C2B30C(0, (unint64_t *)&unk_1EE20AB50);
  v9 = a3;
  v10 = self;
  result = (_EXExtensionInstanceIdentifier *)sub_190CA8878();
  if (result)
  {
    v12 = result;
    sub_190CA84B8();

    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v10 + OBJC_IVAR____EXExtensionInstanceIdentifier_identifier, v8, v5);
    v13 = (objc_class *)type metadata accessor for _EXExtensionInstanceIdentifier();
    v15.receiver = v10;
    v15.super_class = v13;
    v14 = -[_EXExtensionInstanceIdentifier init](&v15, sel_init);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _EXExtensionInstanceIdentifier *v4;
  _EXExtensionInstanceIdentifier *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_190CA8908();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_190C2B51C((uint64_t)v8);

  sub_190C38990((uint64_t)v8, &qword_1ECD98D20);
  return v6 & 1;
}

- (int64_t)hash
{
  _EXExtensionInstanceIdentifier *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_190CA84D0();

  return v3;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE20C068 = a3;
}

- (_EXExtensionInstanceIdentifier)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  _EXExtensionInstanceIdentifier *v8;
  uint64_t v10;

  v3 = sub_190CA84E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_190CA84DC();
  v7 = (void *)sub_190CA84A0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v8 = -[_EXExtensionInstanceIdentifier initWithIdentifier:](self, sel_initWithIdentifier_, v7);

  return v8;
}

- (_EXExtensionInstanceIdentifier)initWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECD98DB0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_190CA84B8();
    v7 = sub_190CA84E8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_190CA84E8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  return (_EXExtensionInstanceIdentifier *)_EXExtensionInstanceIdentifier.init(instanceIdentifier:)((uint64_t)v6);
}

- (NSUUID)identifier
{
  return (NSUUID *)(id)sub_190CA84A0();
}

- (BOOL)isDefault
{
  uint64_t v3;
  _EXExtensionInstanceIdentifier *v4;
  char v5;

  sub_190C2B30C(0, (unint64_t *)&unk_1ECD98C20);
  v3 = qword_1EE20B848;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = sub_190CA88A8();

  return v5 & 1;
}

@end
