@implementation _EXQueryResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_EXQueryResult)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXQueryResult();
  return -[_EXQueryResult init](&v3, sel_init);
}

- (_EXQueryResult)initWithIdentities:(id)a3
{
  objc_super v5;

  sub_190C2B30C(0, (unint64_t *)&qword_1ECD98C80);
  sub_190C6D7B8();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities) = (Class)sub_190CA8764();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _EXQueryResult();
  return -[_EXQueryResult init](&v5, sel_init);
}

- (_EXQueryResult)initWithAvailablility:(id)a3
{
  id v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_availablility) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for _EXQueryResult();
  v4 = a3;
  return -[_EXQueryResult init](&v6, sel_init);
}

- (_EXQueryResult)initWithCoder:(id)a3
{
  id v3;
  _EXQueryResult *v4;

  v3 = a3;
  v4 = (_EXQueryResult *)sub_190C8A184();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXQueryResult *v5;

  v4 = a3;
  v5 = self;
  sub_190C889FC(v4);

}

- (NSSet)identities
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____EXQueryResult_identities))
  {
    sub_190C2B30C(0, (unint64_t *)&qword_1ECD98C80);
    sub_190C6D7B8();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_190CA8758();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (_EXExtensionAvailablility)availablility
{
  return (_EXExtensionAvailablility *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                              + OBJC_IVAR____EXQueryResult_availablility));
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
