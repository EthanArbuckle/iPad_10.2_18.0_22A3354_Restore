@implementation _BlastDoorCKRecordID

+ (BOOL)supportsSecureCoding
{
  return byte_1EECDE3E2;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1EECDE3E2 = a3;
}

- (_TtC9BlastDoor20_BlastDoorCKRecordID)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor20_BlastDoorCKRecordID *)sub_1AD591984(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor20_BlastDoorCKRecordID *v5;

  v4 = a3;
  v5 = self;
  sub_1AD591BB0(v4);

}

- (_TtC9BlastDoor20_BlastDoorCKRecordID)init
{
  _TtC9BlastDoor20_BlastDoorCKRecordID *result;

  result = (_TtC9BlastDoor20_BlastDoorCKRecordID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
