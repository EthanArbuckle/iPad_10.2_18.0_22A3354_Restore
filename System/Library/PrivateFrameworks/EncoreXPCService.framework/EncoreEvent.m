@implementation EncoreEvent

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_2569C7020;
}

- (NSString)description
{
  EncoreEvent *v2;
  void *v3;

  v2 = self;
  sub_23A89F51C();

  v3 = (void *)sub_23A8A93E4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  EncoreEvent *v5;

  v4 = a3;
  v5 = self;
  sub_23A89F98C(v4);

}

- (EncoreEvent)initWithCoder:(id)a3
{
  return (EncoreEvent *)EncoreEvent.init(coder:)(a3);
}

- (EncoreEvent)init
{
  EncoreEvent *result;

  result = (EncoreEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23A8A13D0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___EncoreEvent_data), *(_QWORD *)&self->id[OBJC_IVAR___EncoreEvent_data]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
