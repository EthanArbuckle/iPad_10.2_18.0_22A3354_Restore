@implementation NSValue(CARenderValue)

- (uint64_t)CA_copyNumericValue:()CARenderValue
{
  const char *v5;
  const char *v6;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  float32x4_t v13;
  _OWORD v14[5];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (const char *)objc_msgSend(a1, "objCType");
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  if (!strcmp(v5, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    objc_msgSend(a1, "rectValue");
    *a3 = v8;
    a3[1] = v9;
    a3[2] = v8 + v10;
    a3[3] = v9 + v11;
    return 4;
  }
  if (!strcmp(v6, "{CGPoint=dd}") || !strcmp(v6, "{CGSize=dd}"))
  {
    objc_msgSend(a1, "getValue:size:", a3, 16);
    return 2;
  }
  if (!strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
  {
    objc_msgSend(a1, "getValue:size:", a3, 128);
    return 16;
  }
  if (!strcmp(v6, "{CAPoint3D=ddd}"))
  {
    objc_msgSend(a1, "getValue:size:", a3, 24);
    return 3;
  }
  if (!strcmp(v6, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
  {
    objc_msgSend(a1, "getValue:size:", a3, 64);
    return 8;
  }
  else
  {
LABEL_8:
    if (!strcmp(v6, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      memset(v14, 0, sizeof(v14));
      objc_msgSend(a1, "getValue:size:", v14, 80);
      for (i = 0; i != 5; ++i)
      {
        v13 = (float32x4_t)v14[i];
        *(float64x2_t *)a3 = vcvtq_f64_f32(*(float32x2_t *)v13.f32);
        *((float64x2_t *)a3 + 1) = vcvt_hight_f64_f32(v13);
        a3 += 4;
      }
      return 20;
    }
    else
    {
      return 0;
    }
  }
}

- (uint64_t)CA_numericValueCount
{
  const char *v1;
  const char *v2;

  v1 = (const char *)objc_msgSend(a1, "objCType");
  v2 = v1;
  if (!v1)
    goto LABEL_18;
  if (!strcmp(v1, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    return 4;
  if (!strcmp(v2, "{CGPoint=dd}") || !strcmp(v2, "{CGSize=dd}"))
    return 2;
  if (!strcmp(v2, "{CATransform3D=dddddddddddddddd}"))
    return 16;
  if (!strcmp(v2, "{CAPoint3D=ddd}"))
    return 3;
  if (!strcmp(v2, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
    return 8;
LABEL_18:
  if (!strcmp(v2, "{CAColorMatrix=ffffffffffffffffffff}"))
    return 20;
  return 0;
}

- (char)CA_copyRenderValue
{
  const char *v2;
  const char *v3;
  const double *v4;
  const CGAffineTransform *v5;
  const CA::Rect *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  float64x2_t *v13;
  float32x4_t v14;
  __int128 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (const char *)objc_msgSend(a1, "objCType");
  v3 = v2;
  if (!v2)
    goto LABEL_9;
  if (!strcmp(v2, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    objc_msgSend(a1, "rectValue");
    *(double *)&v30 = v8;
    *((double *)&v30 + 1) = v9;
    *(double *)&v31 = v10;
    *((double *)&v31 + 1) = v11;
    if (v10 < 0.0)
    {
      *(double *)&v30 = v10 + v8;
      *(double *)&v31 = -v10;
    }
    if (v11 < 0.0)
    {
      *((double *)&v30 + 1) = v11 + v9;
      *((double *)&v31 + 1) = -v11;
    }
    return CA::Render::Vector::new_rect((CA::Render::Vector *)&v30, v7);
  }
  if (!strcmp(v3, "{CGPoint=dd}"))
  {
    objc_msgSend(a1, "pointValue");
LABEL_21:
    *(_QWORD *)&v30 = v17;
    *((_QWORD *)&v30 + 1) = v18;
    v15 = &v30;
    v16 = 2;
    return (char *)CA::Render::Vector::new_vector((CA::Render::Vector *)v16, v15, v4);
  }
  if (!strcmp(v3, "{CGSize=dd}"))
  {
    objc_msgSend(a1, "sizeValue");
    goto LABEL_21;
  }
  if (!strcmp(v3, "{CATransform3D=dddddddddddddddd}"))
  {
    if (a1)
    {
      objc_msgSend(a1, "CATransform3DValue");
      v20 = v30;
      v19 = v31;
      v22 = v32;
      v21 = v33;
      v24 = v34;
      v23 = v35;
      v26 = v36;
      v25 = v37;
    }
    else
    {
      v25 = 0uLL;
      v26 = 0uLL;
      v23 = 0uLL;
      v24 = 0uLL;
      v21 = 0uLL;
      v22 = 0uLL;
      v19 = 0uLL;
      v20 = 0uLL;
    }
    v30 = v20;
    v31 = v19;
    v32 = v22;
    v33 = v21;
    v34 = v24;
    v35 = v23;
    v36 = v26;
    v37 = v25;
    v15 = &v30;
    v16 = 16;
    return (char *)CA::Render::Vector::new_vector((CA::Render::Vector *)v16, v15, v4);
  }
  if (strcmp(v3, "{CGAffineTransform=dddddd}"))
  {
    if (!strcmp(v3, "{CAPoint3D=ddd}"))
    {
      objc_msgSend(a1, "CAPoint3DValue");
      *(_QWORD *)&v30 = v27;
      *((_QWORD *)&v30 + 1) = v28;
      *(_QWORD *)&v31 = v29;
      v15 = &v30;
      v16 = 3;
    }
    else
    {
      if (strcmp(v3, "{CACornerRadii={CGSize=dd}{CGSize=dd}{CGSize=dd}{CGSize=dd}}"))
      {
LABEL_9:
        if (strcmp(v3, "{CAColorMatrix=ffffffffffffffffffff}"))
          return 0;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v40 = 0u;
        objc_msgSend(a1, "getValue:size:", &v40, 80);
        v12 = 0;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = (float64x2_t *)&v30;
        v30 = 0u;
        v31 = 0u;
        do
        {
          v14 = *(float32x4_t *)((char *)&v40 + v12);
          *v13 = vcvtq_f64_f32(*(float32x2_t *)v14.f32);
          v13[1] = vcvt_hight_f64_f32(v14);
          v13 += 2;
          v12 += 16;
        }
        while (v12 != 80);
        v15 = &v30;
        v16 = 20;
        return (char *)CA::Render::Vector::new_vector((CA::Render::Vector *)v16, v15, v4);
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      if (a1)
        objc_msgSend(a1, "CACornerRadiiValue");
      v40 = v30;
      v41 = v31;
      v42 = v32;
      v43 = v33;
      v15 = &v40;
      v16 = 8;
    }
    return (char *)CA::Render::Vector::new_vector((CA::Render::Vector *)v16, v15, v4);
  }
  if (a1)
  {
    objc_msgSend(a1, "CA_CGAffineTransformValue");
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
  }
  v30 = v40;
  v31 = v41;
  v32 = v42;
  return CA::Render::Vector::new_affine_transform((CA::Render::Vector *)&v30, v5);
}

@end
