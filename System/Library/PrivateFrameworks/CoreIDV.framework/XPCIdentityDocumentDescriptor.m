@implementation XPCIdentityDocumentDescriptor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV29XPCIdentityDocumentDescriptor)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV29XPCIdentityDocumentDescriptor *)sub_20A1A4354((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A770C);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV29XPCIdentityDocumentDescriptor *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3620(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, type metadata accessor for IdentityDocumentDescriptor, (unint64_t *)&unk_2545DB0B0, (uint64_t)&protocol conformance descriptor for IdentityDocumentDescriptor);

}

- (_TtC7CoreIDV29XPCIdentityDocumentDescriptor)init
{
  _TtC7CoreIDV29XPCIdentityDocumentDescriptor *result;

  result = (_TtC7CoreIDV29XPCIdentityDocumentDescriptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A124284((uint64_t)self + OBJC_IVAR____TtC7CoreIDV29XPCIdentityDocumentDescriptor_value, type metadata accessor for IdentityDocumentDescriptor);
}

@end
