@implementation PresenceSessionConnectionInfo

- (NSString)description
{
  _TtC14CopresenceCore29PresenceSessionConnectionInfo *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PresenceSessionConnectionInfo.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC14CopresenceCore29PresenceSessionConnectionInfo *v6;
  id v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore29PresenceSessionConnectionInfo_endpoint);
  v5 = a3;
  v6 = self;
  v7 = (id)MEMORY[0x1AF4480F4](0x746E696F70646E65, 0xE800000000000000);
  objc_msgSend(v5, sel_encodeObject_forKey_, v4, v7);

}

- (_TtC14CopresenceCore29PresenceSessionConnectionInfo)initWithCoder:(id)a3
{
  return (_TtC14CopresenceCore29PresenceSessionConnectionInfo *)PresenceSessionConnectionInfo.init(coder:)(a3);
}

- (_TtC14CopresenceCore29PresenceSessionConnectionInfo)init
{
  _TtC14CopresenceCore29PresenceSessionConnectionInfo *result;

  result = (_TtC14CopresenceCore29PresenceSessionConnectionInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14CopresenceCore29PresenceSessionConnectionInfo_endpoint));
}

@end
