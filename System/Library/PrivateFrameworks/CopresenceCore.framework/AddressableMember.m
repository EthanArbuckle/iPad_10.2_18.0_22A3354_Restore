@implementation AddressableMember

- (BOOL)isEqual:(id)a3
{
  return @objc AddressableMember.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))AddressableMember.isEqual(_:));
}

- (int64_t)hash
{
  void *v3;
  _TtC14CopresenceCore17AddressableMember *v4;
  Swift::Int v5;

  Hasher.init()();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore17AddressableMember_handle);
  v4 = self;
  Hasher._combine(_:)((Swift::UInt)objc_msgSend(v3, sel_hash));
  v5 = Hasher.finalize()();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14CopresenceCore17AddressableMember)initWithCoder:(id)a3
{
  return (_TtC14CopresenceCore17AddressableMember *)AddressableMember.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC14CopresenceCore17AddressableMember *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore17AddressableMember_handle);
  v5 = a3;
  v6 = self;
  v7 = (id)MEMORY[0x1AF4480F4](0x656C646E6168, 0xE600000000000000);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

}

- (_TtC14CopresenceCore17AddressableMember)init
{
  _TtC14CopresenceCore17AddressableMember *result;

  result = (_TtC14CopresenceCore17AddressableMember *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (NSString)description
{
  _TtC14CopresenceCore17AddressableMember *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = AddressableMember.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

@end
