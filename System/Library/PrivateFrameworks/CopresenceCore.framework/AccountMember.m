@implementation AccountMember

- (_TtC14CopresenceCore13AccountMember)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountMember();
  return -[AccountMember init](&v3, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  return @objc AddressableMember.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))AccountMember.isEqual(_:));
}

- (int64_t)hash
{
  Hasher.init()();
  Hasher._combine(_:)(*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount));
  return Hasher.finalize()();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14CopresenceCore13AccountMember)initWithCoder:(id)a3
{
  id v4;
  _TtC14CopresenceCore13AccountMember *v5;
  void *v6;
  unsigned __int8 v7;
  _TtC14CopresenceCore13AccountMember *v8;
  objc_super v10;

  v4 = a3;
  v5 = self;
  v6 = (void *)MEMORY[0x1AF4480F4](0x416C61636F4C7369, 0xEE00746E756F6363);
  v7 = objc_msgSend(v4, sel_decodeBoolForKey_, v6);

  *((_BYTE *)&v5->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount) = v7;
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for AccountMember();
  v8 = -[AccountMember init](&v10, sel_init);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC14CopresenceCore13AccountMember *v6;
  id v7;

  v4 = *((unsigned __int8 *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore13AccountMember_isLocalAccount);
  v5 = a3;
  v6 = self;
  v7 = (id)MEMORY[0x1AF4480F4](0x416C61636F4C7369, 0xEE00746E756F6363);
  objc_msgSend(v5, sel_encodeBool_forKey_, v4, v7);

}

@end
