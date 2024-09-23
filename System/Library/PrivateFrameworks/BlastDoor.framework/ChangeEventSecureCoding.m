@implementation ChangeEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EECDE950;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EECDE950 = a3;
}

- (_TtC9BlastDoor23ChangeEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor23ChangeEventSecureCoding *)sub_1AD5F3370(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor23ChangeEventSecureCoding *v5;

  v4 = a3;
  v5 = self;
  sub_1AD5F364C(v4);

}

- (_TtC9BlastDoor23ChangeEventSecureCoding)init
{
  _TtC9BlastDoor23ChangeEventSecureCoding *result;

  result = (_TtC9BlastDoor23ChangeEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR____TtC9BlastDoor23ChangeEventSecureCoding_changeEvent, type metadata accessor for ChangeEvent);
}

@end
