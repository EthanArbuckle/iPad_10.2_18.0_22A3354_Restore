@implementation NSValue(CAAnimatableValue)

- (uint64_t)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  const char *v6;
  const char *v7;
  const double *v8;
  const double *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v16;
  float32x4_t v17;
  _OWORD v19[5];
  _OWORD v20[8];
  unint64_t v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  float64x2_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  float64x2_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  float64x2_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = -[NSValue objCType](a1, "objCType");
  v7 = v6;
  if (v6)
  {
    if (!strcmp(v6, "{CATransform3D=dddddddddddddddd}"))
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      if (a1)
      {
        -[NSValue CATransform3DValue](a1, "CATransform3DValue");
      }
      else
      {
        v43 = 0uLL;
        v44 = 0uLL;
        v41 = 0uLL;
        v42 = 0uLL;
        v39 = 0uLL;
        v40 = 0uLL;
        v37 = 0uLL;
        v38 = 0uLL;
      }
      v49 = v41;
      v50 = v42;
      v51 = v43;
      v52 = v44;
      v45 = v37;
      v46 = v38;
      v47 = v39;
      v48 = v40;
      if (a4)
      {
        -[NSValue CATransform3DValue](a4, "CATransform3DValue");
      }
      else
      {
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        *(_OWORD *)v21 = 0u;
        v22 = 0u;
      }
      v41 = v25;
      v42 = v26;
      v43 = v27;
      v44 = v28;
      v37 = *(float64x2_t *)v21;
      v38 = v22;
      v39 = v23;
      v40 = v24;
      CA::Mat4Impl::mat4_mix((CA::Mat4Impl *)&v29, &v45, v37.f64, v8, *(float *)&a2);
      v20[4] = v33;
      v20[5] = v34;
      v20[6] = v35;
      v20[7] = v36;
      v20[0] = v29;
      v20[1] = v30;
      v20[2] = v31;
      v20[3] = v32;
      return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v20);
    }
    if (!strcmp(v7, "{CGAffineTransform=dddddd}"))
    {
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
      if (a1)
      {
        -[NSValue CA_CGAffineTransformValue](a1, "CA_CGAffineTransformValue");
      }
      else
      {
        v38 = 0uLL;
        v39 = 0uLL;
        v37 = 0uLL;
      }
      v45 = v37;
      v46 = v38;
      v47 = v39;
      if (a4)
      {
        -[NSValue CA_CGAffineTransformValue](a4, "CA_CGAffineTransformValue");
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        *(_OWORD *)v21 = 0u;
      }
      v37 = *(float64x2_t *)v21;
      v38 = v22;
      v39 = v23;
      return objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v29, "{CGAffineTransform=dddddd}", CA::Mat2Impl::mat2_mix((CA::Mat2Impl *)&v29, v45.f64, v37.f64, v9, *(float *)&a2).f64[0]);
    }
  }
  if (!strcmp(v7, "{CAColorMatrix=ffffffffffffffffffff}"))
  {
    if (a1)
    {
      -[NSValue CAColorMatrixValue](a1, "CAColorMatrixValue");
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v37 = 0u;
    }
    v47 = v39;
    v48 = v40;
    v49 = v41;
    v45 = v37;
    v46 = v38;
    if (a4)
    {
      -[NSValue CAColorMatrixValue](a4, "CAColorMatrixValue");
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
    }
    v16 = 0;
    v39 = v31;
    v40 = v32;
    v41 = v33;
    v37 = v29;
    v38 = v30;
    v17 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a2, 0);
    do
    {
      *(float32x4_t *)((char *)&v45 + v16) = vmlaq_f32(*(float32x4_t *)((char *)&v45 + v16), v17, vsubq_f32(*(float32x4_t *)((char *)&v37 + v16), *(float32x4_t *)((char *)&v45 + v16)));
      v16 += 16;
    }
    while (v16 != 80);
    v19[2] = v47;
    v19[3] = v48;
    v19[4] = v49;
    v19[0] = v45;
    v19[1] = v46;
    return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v19);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21[0] = 8;
    getValues(a1, v37.f64, v21);
    getValues(a4, v29.f64, v21);
    v10 = v21[0];
    if (v21[0])
    {
      v11 = 0;
      do
      {
        v12 = v37.f64[v11];
        v13 = v29.f64[v11];
        if (v12 == v13)
          v14 = 0.0;
        else
          v14 = (v13 - v12) * *(float *)&a2;
        v45.f64[v11++] = v14 + v12;
      }
      while (v10 != v11);
      return makeValue(&v45, v10, (objc_object *)a1);
    }
    else
    {
      -[NSValue objCType](a1, "objCType");
      return 0;
    }
  }
}

- (uint64_t)CA_addValue:()CAAnimatableValue multipliedBy:
{
  const char *v7;
  const char *v8;
  const double *v9;
  const double *v10;
  const double *v11;
  const double *v12;
  unint64_t v13;
  uint64_t v14;
  const double *v16;
  uint64_t v17;
  int32x2_t v18;
  float32x4_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  _OWORD v23[5];
  _OWORD v24[8];
  unint64_t v25;
  float64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  float64x2_t v34;
  float64x2_t v35;
  float64x2_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = -[NSValue objCType](a1, "objCType");
  v8 = v7;
  if (!v7)
  {
LABEL_4:
    if (!strcmp(v8, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      if (a1)
      {
        -[NSValue CAColorMatrixValue](a1, "CAColorMatrixValue");
      }
      else
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
      }
      v44 = v36;
      v45 = v37;
      v46 = v38;
      v42 = v34;
      v43 = v35;
      if (a3)
      {
        -[NSValue CAColorMatrixValue](a3, "CAColorMatrixValue");
      }
      else
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
      }
      v17 = 0;
      v36 = v28;
      v37 = v29;
      v38 = v30;
      v18.i32[1] = HIDWORD(v27.f64[0]);
      v34 = v26;
      v35 = v27;
      *(float *)v18.i32 = (float)(int)a4;
      v19 = (float32x4_t)vdupq_lane_s32(v18, 0);
      do
      {
        *(float32x4_t *)((char *)&v42 + v17) = vmlaq_f32(*(float32x4_t *)((char *)&v42 + v17), v19, *(float32x4_t *)((char *)&v34 + v17));
        v17 += 16;
      }
      while (v17 != 80);
      v23[2] = v44;
      v23[3] = v45;
      v23[4] = v46;
      v23[0] = v42;
      v23[1] = v43;
      return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v23);
    }
    else
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = 8;
      getValues(a1, v34.f64, &v25);
      getValues(a3, v26.f64, &v25);
      v13 = v25;
      if (v25)
      {
        v14 = 0;
        do
        {
          v42.f64[v14] = v34.f64[v14] + v26.f64[v14] * (double)(int)a4;
          ++v14;
        }
        while (v13 != v14);
        return makeValue(&v42, v13, (objc_object *)a1);
      }
      else
      {
        -[NSValue objCType](a1, "objCType");
        return 0;
      }
    }
  }
  if (!strcmp(v7, "{CATransform3D=dddddddddddddddd}"))
  {
    if (a1)
    {
      -[NSValue CATransform3DValue](a1, "CATransform3DValue");
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
    }
    v46 = v38;
    v47 = v39;
    v48 = v40;
    v49 = v41;
    v42 = v34;
    v43 = v35;
    v44 = v36;
    v45 = v37;
    if (a3)
    {
      -[NSValue CATransform3DValue](a3, "CATransform3DValue");
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
    }
    v38 = v30;
    v39 = v31;
    v40 = v32;
    v41 = v33;
    v34 = v26;
    v35 = v27;
    v36 = v28;
    v37 = v29;
    if ((a4 & 0x80000000) != 0)
    {
      CA::Mat4Impl::mat4_invert((CA::Mat4Impl *)&v34, (CA::Mat4Impl *)&v34, v9);
      a4 = (double *)-(int)a4;
    }
    CA::Mat4Impl::mat4_pow((CA::Mat4Impl *)&v34, a4, v9, v10);
    CA::Mat4Impl::mat4_concat(&v42, v34.f64, v42.f64, v16);
    v24[4] = v46;
    v24[5] = v47;
    v24[6] = v48;
    v24[7] = v49;
    v24[0] = v42;
    v24[1] = v43;
    v24[2] = v44;
    v24[3] = v45;
    return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v24);
  }
  else
  {
    if (strcmp(v8, "{CGAffineTransform=dddddd}"))
      goto LABEL_4;
    if (a1)
    {
      -[NSValue CA_CGAffineTransformValue](a1, "CA_CGAffineTransformValue");
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
    }
    v42 = v34;
    v43 = v35;
    v44 = v36;
    if (a3)
    {
      -[NSValue CA_CGAffineTransformValue](a3, "CA_CGAffineTransformValue");
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
    }
    v34 = v26;
    v35 = v27;
    v36 = v28;
    if ((a4 & 0x80000000) != 0)
    {
      CA::Mat2Impl::mat2_invert((CA::Mat2Impl *)&v34, v34.f64, v11);
      a4 = (double *)-(int)a4;
    }
    CA::Mat2Impl::mat2_pow((CA::Mat2Impl *)&v34, a4, v11, v12);
    v20 = v42;
    v21 = v43;
    v22 = vmlaq_n_f64(vmulq_n_f64(v42, v35.f64[0]), v43, v35.f64[1]);
    v42 = vmlaq_n_f64(vmulq_n_f64(v42, v34.f64[0]), v43, v34.f64[1]);
    v43 = v22;
    v44 = vmlaq_n_f64(vmlaq_n_f64(v44, v20, v36.f64[0]), v21, v36.f64[1]);
    return objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", &v42, "{CGAffineTransform=dddddd}");
  }
}

- (uint64_t)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  const char *v11;
  const char *v12;
  const double *v13;
  double *v14;
  double *v15;
  unint64_t v16;
  uint64_t v18;
  float64x2_t v19;
  float32x4_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float32x4_t v23;
  _OWORD v24[5];
  _OWORD v25[8];
  unint64_t v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  float64x2_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  float64x2_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  float64x2_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[4];
  _OWORD v59[4];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  v11 = -[NSValue objCType](a1, "objCType");
  v12 = v11;
  if (v11 && !strcmp(v11, "{CATransform3D=dddddddddddddddd}"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    if (a1)
    {
      -[NSValue CATransform3DValue](a1, "CATransform3DValue");
    }
    else
    {
      v48 = 0uLL;
      v49 = 0uLL;
      v46 = 0uLL;
      v47 = 0uLL;
      v44 = 0uLL;
      v45 = 0uLL;
      v42 = 0uLL;
      v43 = 0uLL;
    }
    v54 = v46;
    v55 = v47;
    v56 = v48;
    v57 = v49;
    v50 = v42;
    v51 = v43;
    v52 = v44;
    v53 = v45;
    if (a4)
    {
      -[NSValue CATransform3DValue](a4, "CATransform3DValue");
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      *(_OWORD *)v26 = 0u;
      v27 = 0u;
    }
    v46 = v30;
    v47 = v31;
    v48 = v32;
    v49 = v33;
    v42 = *(float64x2_t *)v26;
    v43 = v27;
    v44 = v28;
    v45 = v29;
    CA::Mat4Impl::mat4_mix((CA::Mat4Impl *)&v34, &v50, v42.f64, v13, *a6);
    v25[4] = v38;
    v25[5] = v39;
    v25[6] = v40;
    v25[7] = v41;
    v25[0] = v34;
    v25[1] = v35;
    v25[2] = v36;
    v25[3] = v37;
    return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v25);
  }
  else
  {
    if (strcmp(v12, "{CAColorMatrix=ffffffffffffffffffff}"))
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v26[0] = 8;
      getValues(a1, v42.f64, v26);
      getValues(a4, v34.f64, v26);
      if (a3)
      {
        v14 = (double *)v59;
        getValues(a3, (double *)v59, v26);
        if (a5)
        {
LABEL_6:
          v15 = (double *)v58;
          getValues(a5, (double *)v58, v26);
LABEL_13:
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v16 = v26[0];
          CA::Render::ValueInterpolator::mix_n<double>(a6, v26[0], v50.f64, v14, v42.f64, v34.f64, v15);
          return makeValue(&v50, v16, (objc_object *)a1);
        }
      }
      else
      {
        v14 = 0;
        if (a5)
          goto LABEL_6;
      }
      v15 = 0;
      goto LABEL_13;
    }
    if (a1)
    {
      -[NSValue CAColorMatrixValue](a1, "CAColorMatrixValue");
    }
    else
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v42 = 0u;
    }
    v52 = v44;
    v53 = v45;
    v54 = v46;
    v50 = v42;
    v51 = v43;
    if (a4)
    {
      -[NSValue CAColorMatrixValue](a4, "CAColorMatrixValue");
    }
    else
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
    }
    v18 = 0;
    v44 = v36;
    v45 = v37;
    v46 = v38;
    v42 = v34;
    v43 = v35;
    v19 = (float64x2_t)vdupq_lane_s64(*(_QWORD *)a6, 0);
    do
    {
      v20 = *(float32x4_t *)((char *)&v50 + v18);
      v21 = vcvtq_f64_f32(*(float32x2_t *)v20.f32);
      v22 = vcvt_hight_f64_f32(v20);
      v23 = vsubq_f32(*(float32x4_t *)((char *)&v42 + v18), v20);
      *(float32x4_t *)((char *)&v50 + v18) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_f64(v21, vcvtq_f64_f32(*(float32x2_t *)v23.f32), v19)), vmlaq_f64(v22, vcvt_hight_f64_f32(v23), v19));
      v18 += 16;
    }
    while (v18 != 80);
    v24[2] = v52;
    v24[3] = v53;
    v24[4] = v54;
    v24[0] = v50;
    v24[1] = v51;
    return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCAColorMatrix:", v24);
  }
}

- (id)CA_roundToIntegerFromValue:()CAAnimatableValue
{
  const char *v5;
  unint64_t v6;
  uint64_t v7;
  objc_super v9;
  unint64_t v10;
  _OWORD v11[4];
  float64x2_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = -[NSValue objCType](a1, "objCType");
  if (v5 && !strcmp(v5, "{CATransform3D=dddddddddddddddd}"))
  {
    v9.receiver = a1;
    v9.super_class = (Class)&off_1EDD24F98;
    return -[NSValue CA_roundToIntegerFromValue:](&v9, sel_CA_roundToIntegerFromValue_, a3);
  }
  else
  {
    memset(&v12, 0, 64);
    memset(v11, 0, sizeof(v11));
    v10 = 8;
    getValues(a1, v12.f64, &v10);
    getValues(a3, (double *)v11, &v10);
    v6 = v10;
    if (v10)
    {
      v7 = 0;
      do
      {
        v12.f64[v7] = round(v12.f64[v7] - *((double *)v11 + v7)) + *((double *)v11 + v7);
        ++v7;
      }
      while (v6 != v7);
      return (id)makeValue(&v12, v6, (objc_object *)a1);
    }
    else
    {
      -[NSValue objCType](a1, "objCType");
      return 0;
    }
  }
}

- (float64_t)CA_distanceToValue:()CAAnimatableValue
{
  float64_t result;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  float64x2_t v8;
  unint64_t v9;
  float64x2_t v10[4];
  float64x2_t v11[4];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 0, sizeof(v11));
  memset(v10, 0, sizeof(v10));
  v9 = 8;
  getValues(a1, v11[0].f64, &v9);
  getValues(a3, v10[0].f64, &v9);
  if (v9 == 3)
  {
    v5 = vsubq_f64(*(float64x2_t *)((char *)v11 + 8), *(float64x2_t *)((char *)v10 + 8));
    v6 = vmulq_f64(v5, v5);
    v7 = v6.f64[0] + (v11[0].f64[0] - v10[0].f64[0]) * (v11[0].f64[0] - v10[0].f64[0]) + v6.f64[1];
    return sqrt(v7);
  }
  if (v9 == 2)
  {
    v8 = vsubq_f64(v11[0], v10[0]);
    v7 = vaddvq_f64(vmulq_f64(v8, v8));
    return sqrt(v7);
  }
  result = 0.0;
  if (v9 == 1)
    return v10[0].f64[0];
  return result;
}

@end
