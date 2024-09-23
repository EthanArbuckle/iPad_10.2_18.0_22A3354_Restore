@implementation IdentityProofingLivenessVideoURL

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingLivenessVideoURL.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)sub_1CFAD6BA8();

  return v4;
}

- (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL)init
{
  _TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *result;

  result = (_TtC13CoreIDVShared32IdentityProofingLivenessVideoURL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CF94C338((uint64_t)self + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_url);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_fileHandle));
  sub_1CF94C338((uint64_t)self + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryURL);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13CoreIDVShared32IdentityProofingLivenessVideoURL_auxiliaryFileHandle));
}

@end
