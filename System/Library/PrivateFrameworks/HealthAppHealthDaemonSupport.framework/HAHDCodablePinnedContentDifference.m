@implementation HAHDCodablePinnedContentDifference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  HAHDCodablePinnedContentDifference *v5;

  v4 = a3;
  v5 = self;
  sub_23DBA7880(v4);

}

- (HAHDCodablePinnedContentDifference)initWithCoder:(id)a3
{
  id v3;
  HAHDCodablePinnedContentDifference *v4;

  v3 = a3;
  v4 = (HAHDCodablePinnedContentDifference *)sub_23DBA7C74(v3);

  return v4;
}

- (HAHDCodablePinnedContentDifference)init
{
  HAHDCodablePinnedContentDifference *result;

  result = (HAHDCodablePinnedContentDifference *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
