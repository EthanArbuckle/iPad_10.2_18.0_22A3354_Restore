@implementation VCPGeometryUtils

+ (CGRect)normalizedRectForRect:(CGRect)a3 inBoundsOfSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "normalizedRectForRect:inBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)normalizedRectForRect:(CGRect)a3 inBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;
  CGRect v18;

  if (a4.size.width <= 0.0)
    goto LABEL_5;
  height = a4.size.height;
  if (a4.size.height <= 0.0)
    goto LABEL_5;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  v18.origin.x = v11;
  v18.origin.y = v10;
  v18.size.width = v9;
  v18.size.height = v8;
  if (CGRectContainsRect(a4, v18))
  {
    v12 = v9 / width;
    v13 = v8 / height;
    v14 = (v11 - x) / width;
    v15 = (v10 - y) / height;
  }
  else
  {
LABEL_5:
    v14 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (CGRect)rectFromMappingNormalizedRect:(CGRect)a3 toBoundsOfSize:(CGSize)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(a1, "rectFromMappingNormalizedRect:toBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0, 0.0, a4.width, a4.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

+ (CGRect)rectFromMappingNormalizedRect:(CGRect)a3 toBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (CGRectIsNull(a4)
    || (v16.origin.x = x, v16.origin.y = y, v16.size.width = width, v16.size.height = height, CGRectIsInfinite(v16))
    || width <= 0.0
    || height <= 0.0)
  {
    v13 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v12 = v9 * width;
    v13 = x + v11 * width;
    v14 = v8 * height;
    v15 = y + v10 * height;
  }
  result.size.height = v14;
  result.size.width = v12;
  result.origin.y = v15;
  result.origin.x = v13;
  return result;
}

+ (CGPoint)pointFromNormalizedPoint:(CGPoint)a3 inBounds:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = a4.origin.x + a3.x * a4.size.width;
  v5 = a4.origin.y + a3.y * a4.size.height;
  result.y = v5;
  result.x = v4;
  return result;
}

@end
