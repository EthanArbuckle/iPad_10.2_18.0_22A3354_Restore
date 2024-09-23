@implementation _BlastDoorCKUserIdentity

+ (BOOL)supportsSecureCoding
{
  return byte_1EECDE3E1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EECDE3E1 = a3;
}

- (_TtC9BlastDoor24_BlastDoorCKUserIdentity)initWithCoder:(id)a3
{
  id v3;
  _TtC9BlastDoor24_BlastDoorCKUserIdentity *v4;

  v3 = a3;
  v4 = (_TtC9BlastDoor24_BlastDoorCKUserIdentity *)sub_1AD596B80(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor24_BlastDoorCKUserIdentity *v5;

  v4 = a3;
  v5 = self;
  sub_1AD59146C(v4);

}

- (_TtC9BlastDoor24_BlastDoorCKUserIdentity)init
{
  _TtC9BlastDoor24_BlastDoorCKUserIdentity *result;

  result = (_TtC9BlastDoor24_BlastDoorCKUserIdentity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor24_BlastDoorCKUserIdentity_outOfNetworkPrivateKey));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor24_BlastDoorCKUserIdentity_encryptedPersonalInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
