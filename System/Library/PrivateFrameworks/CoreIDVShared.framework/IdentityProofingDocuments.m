@implementation IdentityProofingDocuments

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13CoreIDVShared25IdentityProofingDocuments *v5;

  v4 = a3;
  v5 = self;
  IdentityProofingDocuments.encode(with:)((NSCoder)v4);

}

- (_TtC13CoreIDVShared25IdentityProofingDocuments)initWithCoder:(id)a3
{
  id v3;
  _TtC13CoreIDVShared25IdentityProofingDocuments *v4;

  v3 = a3;
  v4 = (_TtC13CoreIDVShared25IdentityProofingDocuments *)sub_1CF9D0548();

  return v4;
}

- (_TtC13CoreIDVShared25IdentityProofingDocuments)init
{
  _TtC13CoreIDVShared25IdentityProofingDocuments *result;

  result = (_TtC13CoreIDVShared25IdentityProofingDocuments *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
