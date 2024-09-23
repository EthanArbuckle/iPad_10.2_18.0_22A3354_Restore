@implementation PersistenceEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EECDE953;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EECDE953 = a3;
}

- (_TtC9BlastDoor28PersistenceEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor28PersistenceEventSecureCoding *)sub_1AD5F4B48(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor28PersistenceEventSecureCoding *v5;

  v4 = a3;
  v5 = self;
  sub_1AD5F4E10(v4);

}

- (_TtC9BlastDoor28PersistenceEventSecureCoding)init
{
  _TtC9BlastDoor28PersistenceEventSecureCoding *result;

  result = (_TtC9BlastDoor28PersistenceEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR____TtC9BlastDoor28PersistenceEventSecureCoding_persistenceEvent, type metadata accessor for PersistenceEvent);
}

@end
