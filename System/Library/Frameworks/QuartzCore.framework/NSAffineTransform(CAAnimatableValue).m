@implementation NSAffineTransform(CAAnimatableValue)

- (void)CA_addValue:()CAAnimatableValue multipliedBy:
{
  double *v4;
  void *v6;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  _OWORD v14[3];
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  uint64_t v21;

  v4 = (double *)a4;
  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "CA_CGAffineTransformValue");
    v10 = v18;
    v11 = v19;
    v12 = v20;
    if (a3)
    {
LABEL_3:
      objc_msgSend(a3, "CA_CGAffineTransformValue");
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
    if (a3)
      goto LABEL_3;
  }
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
LABEL_6:
  v18 = v15;
  v19 = v16;
  v20 = v17;
  if ((v4 & 0x80000000) != 0)
  {
    CA::Mat2Impl::mat2_invert((CA::Mat2Impl *)&v18, v18.f64, (const double *)a3);
    v4 = (double *)-(int)v4;
  }
  CA::Mat2Impl::mat2_pow((CA::Mat2Impl *)&v18, v4, (const double *)a3, a4);
  v8 = vmlaq_n_f64(vmulq_n_f64(v10, v19.f64[0]), v11, v19.f64[1]);
  v9 = vmlaq_n_f64(vmulq_n_f64(v10, v18.f64[0]), v11, v18.f64[1]);
  v13 = vmlaq_n_f64(vmlaq_n_f64(v12, v10, v20.f64[0]), v11, v20.f64[1]);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3478], "transform");
  v14[0] = v9;
  v14[1] = v8;
  v14[2] = v13;
  objc_msgSend(v6, "setTransformStruct:", v14);
  return v6;
}

- (void)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  void *v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "CA_CGAffineTransformValue");
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
  }
  v19[0] = v16;
  v19[1] = v17;
  v19[2] = v18;
  if (a4)
  {
    objc_msgSend(a4, "CA_CGAffineTransformValue");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3478], "transform", CA::Mat2Impl::mat2_mix((CA::Mat2Impl *)&v13, (double *)v19, (const double *)&v16, a5, a2).f64[0]);
  v9[0] = v13;
  v9[1] = v14;
  v9[2] = v15;
  objc_msgSend(v7, "setTransformStruct:", v9);
  return v7;
}

@end
