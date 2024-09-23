@implementation MentionEventSecureCoding

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EECDE951;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EECDE951 = a3;
}

- (_TtC9BlastDoor24MentionEventSecureCoding)initWithCoder:(id)a3
{
  return (_TtC9BlastDoor24MentionEventSecureCoding *)sub_1AD5F3C4C(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9BlastDoor24MentionEventSecureCoding *v5;

  v4 = a3;
  v5 = self;
  sub_1AD5F3FC0(v4);

}

- (_TtC9BlastDoor24MentionEventSecureCoding)init
{
  _TtC9BlastDoor24MentionEventSecureCoding *result;

  result = (_TtC9BlastDoor24MentionEventSecureCoding *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR____TtC9BlastDoor24MentionEventSecureCoding_mentionEvent, type metadata accessor for MentionEvent);
}

@end
