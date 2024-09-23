@implementation _BlastDoorCKShareParticipant

+ (BOOL)supportsSecureCoding
{
  return byte_1EECDE3E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EECDE3E0 = a3;
}

- (_TtC9BlastDoor28_BlastDoorCKShareParticipant)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor28_BlastDoorCKShareParticipant *)sub_1AD58F684(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor28_BlastDoorCKShareParticipant *v5;

  v4 = a3;
  v5 = self;
  sub_1AD590510(v4);

}

- (_TtC9BlastDoor28_BlastDoorCKShareParticipant)init
{
  _TtC9BlastDoor28_BlastDoorCKShareParticipant *result;

  result = (_TtC9BlastDoor28_BlastDoorCKShareParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor28_BlastDoorCKShareParticipant_encryptedPersonalInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor28_BlastDoorCKShareParticipant_invitationToken));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor28_BlastDoorCKShareParticipant_protectionInfoPublicKey));
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
