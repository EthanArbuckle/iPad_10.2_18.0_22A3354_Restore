@implementation IdentityImageDimension

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EFBBFA91;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EFBBFA91 = a3;
}

- (_TtC13CoreIDVShared22IdentityImageDimension)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared22IdentityImageDimension *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared22IdentityImageDimension *)sub_1CF98FE80(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared22IdentityImageDimension *v5;

  v4 = a3;
  v5 = self;
  IdentityImageDimension.encode(with:)((NSCoder)v4);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))IdentityImageDimension.debugDescription.getter);
}

- (_TtC13CoreIDVShared22IdentityImageDimension)init
{
  _TtC13CoreIDVShared22IdentityImageDimension *result;

  result = (_TtC13CoreIDVShared22IdentityImageDimension *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
