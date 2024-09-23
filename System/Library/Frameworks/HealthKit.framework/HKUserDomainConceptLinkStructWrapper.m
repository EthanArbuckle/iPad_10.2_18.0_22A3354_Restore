@implementation HKUserDomainConceptLinkStructWrapper

- (HKUserDomainConceptLinkStructWrapper)initWithLink:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HKUserDomainConceptLinkStructWrapper *v7;

  v4 = a3;
  objc_msgSend(v4, "targetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "type");

  v7 = -[HKUserDomainConceptLinkStructWrapper initWithTarget:type:](self, "initWithTarget:type:", v5, v6);
  return v7;
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value);
}

- (NSUUID)target
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v12;

  v3 = type metadata accessor for UserDomainConceptLinkStruct(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_19A353010();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A319A60((uint64_t)self + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value, (uint64_t)v5);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, &v5[*(int *)(v3 + 20)], v6);
  v10 = (void *)sub_19A352FE0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (NSUUID *)v10;
}

- (HKUserDomainConceptLinkStructWrapper)initWithTarget:(id)a3 type:(int64_t)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t *v11;
  uint64_t v12;
  HKUserDomainConceptLinkStructWrapper *v13;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = sub_19A353010();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A352FF8();
  v11 = (int64_t *)((char *)self + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value);
  v12 = type metadata accessor for UserDomainConceptLinkStruct(0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v11 + *(int *)(v12 + 20), v10, v7);
  *v11 = a4;
  v15.receiver = self;
  v15.super_class = ObjectType;
  v13 = -[HKUserDomainConceptLinkStructWrapper init](&v15, sel_init);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (NSString)description
{
  HKUserDomainConceptLinkStructWrapper *v2;
  void *v3;

  v2 = self;
  UserDomainConceptLinkStructWrapper.description.getter();

  v3 = (void *)sub_19A353400();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_19A31D6C4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))UserDomainConceptLinkStructWrapper.isEqual(_:));
}

- (int64_t)hash
{
  HKUserDomainConceptLinkStructWrapper *v3;
  int64_t v4;

  sub_19A353B38();
  sub_19A353B44();
  type metadata accessor for UserDomainConceptLinkStruct(0);
  sub_19A353010();
  sub_19A306A54(&qword_1EE397CE0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v3 = self;
  sub_19A35337C();
  v4 = sub_19A353B68();

  return v4;
}

- (HKUserDomainConceptLinkStructWrapper)init
{
  HKUserDomainConceptLinkStructWrapper *result;

  result = (HKUserDomainConceptLinkStructWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19A31E550((uint64_t)self + OBJC_IVAR___HKUserDomainConceptLinkStructWrapper_value);
}

@end
