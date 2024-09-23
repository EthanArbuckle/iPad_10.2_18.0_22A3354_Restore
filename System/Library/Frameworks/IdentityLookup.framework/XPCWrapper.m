@implementation XPCWrapper

+ (BOOL)supportsSecureCoding
{
  return byte_254B55720;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_254B55720 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  id v6;
  _TtC14IdentityLookup10XPCWrapper *v7;
  void *v8;
  id v9;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data);
  v5 = *(_QWORD *)&self->data[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data];
  v6 = a3;
  v7 = self;
  sub_2126EAA30(v4, v5);
  v8 = (void *)sub_2126EF38C();
  sub_2126EABC8(v4, v5);
  v9 = (id)sub_2126EF4A0();
  objc_msgSend(v6, sel_encodeObject_forKey_, v8, v9);

}

- (_TtC14IdentityLookup10XPCWrapper)initWithCoder:(id)a3
{
  return (_TtC14IdentityLookup10XPCWrapper *)sub_2126ECB6C(a3);
}

- (_TtC14IdentityLookup10XPCWrapper)init
{
  _TtC14IdentityLookup10XPCWrapper *result;

  result = (_TtC14IdentityLookup10XPCWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2126EABC8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data), *(_QWORD *)&self->data[OBJC_IVAR____TtC14IdentityLookup10XPCWrapper_data]);
}

@end
