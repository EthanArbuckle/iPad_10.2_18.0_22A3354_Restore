@implementation NSValue(_HKPropertyAnimationExtensions)

- (uint64_t)hk_animatable
{
  if ((objc_msgSend(a1, "_hk_isCGPoint") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_hk_isHKLinearTransform");
}

- (BOOL)_hk_isCGPoint
{
  return strcmp((const char *)objc_msgSend(objc_retainAutorelease(a1), "objCType"), "{CGPoint=dd}") == 0;
}

- (BOOL)_hk_isHKLinearTransform
{
  return strcmp((const char *)objc_msgSend(objc_retainAutorelease(a1), "objCType"), "{HKLinearTransform=dd}") == 0;
}

- (id)hk_midPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "_hk_isCGPoint"))
  {
    objc_msgSend(a1, "_hk_CGPointMidPointToValue:percentage:", v6, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(a1, "_hk_isHKLinearTransform"))
  {
    objc_msgSend(a1, "_hk_HKLinearTransformMidPointToValue:percentage:", v6, a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = a1;
  }
  v8 = v7;

  return v8;
}

- (uint64_t)_hk_HKLinearTransformMidPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a4;
  objc_msgSend(a1, "HKLinearTransformValue");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "HKLinearTransformValue");
  v12 = v11;
  v14 = v13;

  v15 = fmax(a2, 0.0);
  v16 = 1.0;
  if (v15 <= 1.0)
    v16 = v15;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithHKLinearTransform:", v8 + v16 * (v12 - v8), v10 + v16 * (v14 - v10));
}

- (uint64_t)_hk_CGPointMidPointToValue:()_HKPropertyAnimationExtensions percentage:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a4;
  objc_msgSend(a1, "CGPointValue");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "CGPointValue");
  v12 = v11;
  v14 = v13;

  v15 = fmax(a2, 0.0);
  v16 = 1.0;
  if (v15 <= 1.0)
    v16 = v15;
  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v8 + v16 * (v12 - v8), v10 + v16 * (v14 - v10));
}

@end
