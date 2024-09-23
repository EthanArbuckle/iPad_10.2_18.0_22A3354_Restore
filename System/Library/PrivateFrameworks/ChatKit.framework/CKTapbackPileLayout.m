@implementation CKTapbackPileLayout

- (CKTapbackPileLayout)initWithSourcePoint:(CGPoint)a3 viewModel:(id)a4
{
  double y;
  double x;
  id v6;
  CKTapbackPileLayout *v7;

  y = a3.y;
  x = a3.x;
  v6 = a4;
  v7 = (CKTapbackPileLayout *)sub_18E712078((uint64_t)v6, x, y);

  return v7;
}

- (CGSize)pilePositioningSize
{
  CKTapbackPileLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_18E711AF4();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CKTapbackPileLayout)init
{
  CKTapbackPileLayout *result;

  result = (CKTapbackPileLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
