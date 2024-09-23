@implementation CABackdropLayer(CoreMaterial_Internal)

+ (BOOL)mt_colorMatrixForOpacity:()CoreMaterial_Internal
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  _BOOL8 result;
  float v8;

  v4 = (_OWORD *)MEMORY[0x1E0CD2338];
  v5 = *(_OWORD *)(MEMORY[0x1E0CD2338] + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(MEMORY[0x1E0CD2338] + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = v4[4];
  v6 = v4[1];
  *(_OWORD *)a1 = *v4;
  *(_OWORD *)(a1 + 16) = v6;
  result = MTFloatIsOne(a2);
  if (!result)
  {
    v8 = a2;
    *(float *)(a1 + 72) = v8;
  }
  return result;
}

+ (id)mt_keyPathForColorMatrixDrivenOpacity
{
  void *v0;
  void *v1;

  MTFilterKeyPathForFilter(CFSTR("opacityColorMatrix"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputColorMatrix"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)mt_keyPathForColorMatrixDrivenInoperativeOpacity
{
  void *v0;
  void *v1;

  MTFilterKeyPathForFilter(CFSTR("inoperativeColorMatrix"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputColorMatrix"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
