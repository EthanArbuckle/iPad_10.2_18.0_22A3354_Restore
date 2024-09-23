@implementation MembershipEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EECDE952;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EECDE952 = a3;
}

- (_TtC9BlastDoor27MembershipEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor27MembershipEventSecureCoding *)sub_1AD5F4584(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor27MembershipEventSecureCoding *v5;

  v4 = a3;
  v5 = self;
  sub_1AD5F4858(v4);

}

- (_TtC9BlastDoor27MembershipEventSecureCoding)init
{
  _TtC9BlastDoor27MembershipEventSecureCoding *result;

  result = (_TtC9BlastDoor27MembershipEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR____TtC9BlastDoor27MembershipEventSecureCoding_membershipEvent, type metadata accessor for MembershipEvent);
}

@end
