@implementation _BlastDoorHKProfileIdentifier

+ (BOOL)supportsSecureCoding
{
  return byte_1EECDB2F0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EECDB2F0 = a3;
}

- (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier *)sub_1AD37CA14(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor29_BlastDoorHKProfileIdentifier *v5;

  v4 = a3;
  v5 = self;
  sub_1AD37CC80(v4);

}

- (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier)init
{
  _TtC9BlastDoor29_BlastDoorHKProfileIdentifier *result;

  result = (_TtC9BlastDoor29_BlastDoorHKProfileIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
