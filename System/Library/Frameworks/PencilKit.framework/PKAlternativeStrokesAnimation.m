@implementation PKAlternativeStrokesAnimation

- (id)initWithStrokes:(void *)a3 shape:(double)a4 startTime:(double)a5 fadeDuration:
{
  id v10;
  id v11;
  id *v12;
  objc_super v14;

  v10 = a2;
  v11 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)PKAlternativeStrokesAnimation;
    v12 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a3);
      objc_storeStrong(a1 + 3, a2);
      *((double *)a1 + 4) = a4;
      a1[5] = 0;
      *((double *)a1 + 6) = a5;
      a1[7] = (id)0x3FE0000000000000;
    }
  }

  return a1;
}

- (double)alphaAtTime:(uint64_t)a1
{
  double result;
  double v4;
  double v5;
  double v6;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 9))
  {
    result = 1.0;
    if (!*(_BYTE *)(a1 + 8))
      return 0.0;
  }
  else
  {
    v4 = *(double *)(a1 + 40);
    v5 = *(double *)(a1 + 48);
    result = (a2 - *(double *)(a1 + 32)) / v5;
    if (result > 1.0)
      result = 1.0;
    if (v4 > 0.0)
    {
      v6 = (a2 - v4) / v5;
      if (v6 > 1.0)
        v6 = 1.0;
      if (*(_BYTE *)(a1 + 8))
        v6 = 0.0;
      return result - v6;
    }
  }
  return result;
}

- (double)originalStrokeAlphaAtTime:(uint64_t)a1
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 9))
  {
    v2 = 1.0;
    if (*(_BYTE *)(a1 + 8))
      return 0.0;
  }
  else
  {
    v3 = *(double *)(a1 + 40);
    v5 = *(double *)(a1 + 48);
    v4 = *(double *)(a1 + 56);
    v6 = (a2 - *(double *)(a1 + 32)) / v5;
    if (v6 > 1.0)
      v6 = 1.0;
    v2 = 1.0 - v6 * v4;
    if (v3 > 0.0)
    {
      v7 = (a2 - v3) / v5;
      if (v7 > 1.0)
        v7 = 1.0;
      v8 = v2 * (1.0 - v7);
      v9 = v2 + (1.0 - v4) * v7;
      if (*(_BYTE *)(a1 + 8))
        return v8;
      else
        return v9;
    }
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
  objc_storeStrong((id *)&self->_shape, 0);
}

@end
