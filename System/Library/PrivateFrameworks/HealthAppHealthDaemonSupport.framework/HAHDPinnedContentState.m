@implementation HAHDPinnedContentState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  HAHDPinnedContentState *v5;

  v4 = a3;
  v5 = self;
  sub_23DB9D2D4(v4);

}

- (HAHDPinnedContentState)initWithCoder:(id)a3
{
  id v3;
  HAHDPinnedContentState *v4;

  v3 = a3;
  v4 = (HAHDPinnedContentState *)sub_23DB9D6AC(v3);

  return v4;
}

- (HAHDPinnedContentState)init
{
  HAHDPinnedContentState *result;

  result = (HAHDPinnedContentState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
