@implementation HKCollectionViewLayoutEngineDefaults

+ (id)interSectionSpacing
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3378], "fixedSpacing:", 20.0);
}

+ (double)interItemSpacingForWidthDesignation:(int64_t)a3
{
  double result;

  result = 10.0;
  if ((unint64_t)(a3 - 3) <= 3)
    return dbl_1D7B82AA0[a3 - 3];
  return result;
}

+ (NSDirectionalEdgeInsets)edgeInsetsForWidthDesignation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  v3 = 0.0;
  if ((unint64_t)(a3 - 1) <= 5)
    v3 = dbl_1D7B82A70[a3 - 1];
  v4 = 0.0;
  v5 = 0.0;
  v6 = v3;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v3;
  result.top = v4;
  return result;
}

+ (id)accessibilitySizeThresholdForAdjustedLayout
{
  return (id)*MEMORY[0x1E0DC48D8];
}

+ (double)interRowSpacingForWidthDesignation:(int64_t)a3
{
  double result;

  result = 10.0;
  if ((unint64_t)(a3 - 3) <= 3)
    return dbl_1D7B82AA0[a3 - 3];
  return result;
}

@end
