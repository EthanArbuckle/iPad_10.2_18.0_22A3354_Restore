@implementation IdentityLivenessResults

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC13CoreIDVShared23IdentityLivenessResults)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared23IdentityLivenessResults *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared23IdentityLivenessResults *)sub_1CFA23E5C(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared23IdentityLivenessResults *v5;

  v4 = a3;
  v5 = self;
  IdentityLivenessResults.encode(with:)((NSCoder)v4);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1CF98A92C(self, (uint64_t)a2, (void (*)(void))IdentityLivenessResults.debugDescription.getter);
}

- (_TtC13CoreIDVShared23IdentityLivenessResults)init
{
  _TtC13CoreIDVShared23IdentityLivenessResults *result;

  result = (_TtC13CoreIDVShared23IdentityLivenessResults *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
