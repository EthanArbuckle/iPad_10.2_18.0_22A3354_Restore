@implementation PKInterpolateColorAnimation

- (uint64_t)initWithStartColor:(void *)a3 endColor:(double)a4 startTime:(double)a5 duration:
{
  id v10;
  int v11;
  char v12;
  id v13;

  v10 = a3;
  if (a1)
  {
    *(double *)(a1 + 72) = a4;
    *(double *)(a1 + 80) = a5;
    v11 = objc_msgSend(a2, "getRed:green:blue:alpha:", a1 + 8, a1 + 16, a1 + 24, a1 + 32);
    v12 = objc_msgSend(v10, "getRed:green:blue:alpha:", a1 + 40, a1 + 48, a1 + 56, a1 + 64);
    if (!v11 || (v12 & 1) == 0)
      objc_storeStrong((id *)(a1 + 88), a3);
    v13 = (id)a1;
  }

  return a1;
}

- (id)colorAtTime:(uint64_t)a1
{
  void *v2;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  float64x2_t v8;
  double v9[5];

  v9[4] = *(double *)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(void **)(a1 + 88);
    if (v2)
      return v2;
    v4 = *(double *)(a1 + 80);
    v5 = a2 - *(double *)(a1 + 72);
    v6 = 0.0;
    if (v5 >= 0.0)
    {
      v6 = v5;
      if (v5 > v4)
        v6 = *(double *)(a1 + 80);
    }
    v7 = 0;
    v8 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v6 / v4), 0);
    do
    {
      *(float64x2_t *)&v9[v7] = vmlaq_f64(*(float64x2_t *)(a1 + v7 * 8 + 8), v8, vsubq_f64(*(float64x2_t *)(a1 + v7 * 8 + 40), *(float64x2_t *)(a1 + v7 * 8 + 8)));
      v7 += 2;
    }
    while (v7 != 4);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v9[0], v9[1], v9[2], v9[3]);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endColorFallback, 0);
}

@end
