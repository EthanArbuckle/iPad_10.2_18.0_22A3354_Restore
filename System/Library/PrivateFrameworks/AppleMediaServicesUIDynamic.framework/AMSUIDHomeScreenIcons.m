@implementation AMSUIDHomeScreenIcons

+ (double)cornerRadius
{
  double result;

  objc_msgSend(a1, "variant");
  LIIconContinuousCornerRadiusForVariant();
  return result;
}

+ (CGSize)size
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "variant");
  LIIconOutputSizeForVariant();
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)scaledCornerRadiusForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.height;
  width = a3.width;
  objc_msgSend(a1, "size");
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "cornerRadius");
  v11 = height / v9;
  if (width > height)
    v11 = width / v7;
  return v10 * v11;
}

+ (int)variant
{
  if (qword_1EF24B338 != -1)
    dispatch_once(&qword_1EF24B338, &__block_literal_global);
  return _MergedGlobals;
}

uint64_t __32__AMSUIDHomeScreenIcons_variant__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  v2 = v1;

  v4 = v2;
  result = objc_msgSend(MEMORY[0x1E0DC3870], "_iconVariantForUIApplicationIconFormat:scale:", 2, &v4);
  _MergedGlobals = result;
  return result;
}

@end
