@implementation _BlastDoorCKUserIdentityLookupInfo

+ (BOOL)supportsSecureCoding
{
  return byte_1EECDE3E4;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EECDE3E4 = a3;
}

- (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo)initWithCoder:(id)a3
{
  id v3;
  _TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *v4;

  v3 = a3;
  v4 = (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *)sub_1AD597174(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *v5;

  v4 = a3;
  v5 = self;
  sub_1AD5923C0(v4);

}

- (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo)init
{
  _TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *result;

  result = (_TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_emailAddress));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_phoneNumber));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_userRecordID));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9BlastDoor34_BlastDoorCKUserIdentityLookupInfo_encryptedPersonalInfo));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
