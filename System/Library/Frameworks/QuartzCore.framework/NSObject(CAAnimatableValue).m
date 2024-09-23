@implementation NSObject(CAAnimatableValue)

- (CGColorRef)CA_addValue:()CAAnimatableValue multipliedBy:
{
  CGColor *v6;
  CFTypeID v7;
  CGColorSpace *v8;
  unint64_t v9;
  float64x2_t v10;
  _OWORD v12[2];
  CGFloat components[2];
  __int128 v14;
  uint64_t v15;

  v6 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  v7 = CFGetTypeID(a1);
  if (v7 == CGColorGetTypeID())
  {
    *(_OWORD *)components = 0u;
    v14 = 0u;
    memset(v12, 0, sizeof(v12));
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents(v6, v8, components);
    CA_CGColorGetRGBComponents(a3, v8, (CGFloat *)v12);
    v9 = 0;
    v10 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)a4), 0);
    do
    {
      *(float64x2_t *)&components[v9 / 8] = vmlaq_f64(*(float64x2_t *)&components[v9 / 8], v10, (float64x2_t)v12[v9 / 0x10]);
      v9 += 16;
    }
    while (v9 != 32);
    return CGColorCreate(v8, components);
  }
  else if (v7 == CGPathGetTypeID())
  {
    return CGPathRetain(v6);
  }
  return v6;
}

- (CGColorRef)CA_interpolateValue:()CAAnimatableValue byFraction:
{
  CFTypeID v7;
  CGColorSpace *v8;
  uint64_t v9;
  float64x2_t v10;
  const CGPath *v12;
  CA::Render::Object *v13;
  const CGPath *v14;
  CA::Render::Object **v15;
  CA::Render::Path *v16;
  unsigned int *v17;
  unsigned int v18;
  const CGPath *v19;
  CGPathRef v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  CA::Render::Path *v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  CA::Render::Path *v35[2];
  __int128 v36;
  ValueInterpolator components;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = CFGetTypeID(a1);
  if (v7 == CGColorGetTypeID())
  {
    memset(&components, 0, 32);
    *(_OWORD *)v35 = 0u;
    v36 = 0u;
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents((CGColor *)a1, v8, &components.var0);
    CA_CGColorGetRGBComponents(a4, v8, (CGFloat *)v35);
    v9 = 0;
    v10 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2), 0);
    do
    {
      *(float64x2_t *)((char *)&components.var0 + v9 * 8) = vmlaq_f64(*(float64x2_t *)((char *)&components.var0 + v9 * 8), v10, vsubq_f64(*(float64x2_t *)&v35[v9], *(float64x2_t *)((char *)&components.var0 + v9 * 8)));
      v9 += 2;
    }
    while (v9 != 4);
    return CGColorCreate(v8, &components.var0);
  }
  else if (v7 == CGPathGetTypeID())
  {
    v13 = (CA::Render::Object *)CA::Render::Path::new_path((CGPathRef)a1, v12);
    v15 = (CA::Render::Object **)CA::Render::Path::new_path(a4, v14);
    components.var0 = a2;
    memset(&components.var1, 0, 112);
    v35[0] = 0;
    CA::Render::mix_objects((uint64_t)v35, v13, v15, &components);
    v16 = v35[0];
    if (v35[0])
    {
      if (*((_BYTE *)v35[0] + 12) == 36)
      {
        v17 = (unsigned int *)((char *)v35[0] + 8);
        do
          v18 = __ldaxr(v17);
        while (__stlxr(v18 + 1, v17));
        if (!v18)
        {
          v16 = 0;
          do
            v34 = __ldaxr(v17);
          while (__stlxr(v34 - 1, v17));
        }
        v19 = (const CGPath *)CA::Render::Path::cg_path(v16);
        v20 = CGPathRetain(v19);
        if (v16)
        {
          v21 = (unsigned int *)((char *)v16 + 8);
          do
          {
            v22 = __ldaxr(v21);
            v23 = v22 - 1;
          }
          while (__stlxr(v23, v21));
          if (!v23)
            (*(void (**)(CA::Render::Path *))(*(_QWORD *)v16 + 16))(v16);
        }
      }
      else
      {
        v20 = 0;
      }
      v24 = v35[0];
      if (v35[0])
      {
        v25 = (unsigned int *)((char *)v35[0] + 8);
        do
        {
          v26 = __ldaxr(v25);
          v27 = v26 - 1;
        }
        while (__stlxr(v27, v25));
        if (!v27)
          (*(void (**)(CA::Render::Path *))(*(_QWORD *)v24 + 16))(v24);
      }
    }
    else
    {
      v20 = 0;
    }
    if (v15)
    {
      v28 = (unsigned int *)(v15 + 1);
      do
      {
        v29 = __ldaxr(v28);
        v30 = v29 - 1;
      }
      while (__stlxr(v30, v28));
      if (!v30)
        (*((void (**)(CA::Render::Object **))*v15 + 2))(v15);
    }
    if (v13)
    {
      v31 = (unsigned int *)((char *)v13 + 8);
      do
      {
        v32 = __ldaxr(v31);
        v33 = v32 - 1;
      }
      while (__stlxr(v33, v31));
      if (!v33)
        (*(void (**)(CA::Render::Object *))(*(_QWORD *)v13 + 16))(v13);
    }
    return v20;
  }
  else if (a2 >= 0.5)
  {
    return a4;
  }
  else
  {
    return (CGColorRef)a1;
  }
}

- (CGColorRef)CA_interpolateValues:()CAAnimatableValue ::interpolator:
{
  CFTypeID v11;
  CGColorSpace *v12;
  double *v13;
  double *v14;
  double v15;
  _OWORD v17[2];
  _OWORD v18[2];
  _OWORD v19[2];
  _OWORD v20[2];
  CGFloat components[2];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = CFGetTypeID(a1);
  if (v11 != CGColorGetTypeID())
  {
    v15 = *a6;
    *(float *)&v15 = *a6;
    return (CGColorRef)objc_msgSend(a1, "CA_interpolateValue:byFraction:", a4, v15);
  }
  *(_OWORD *)components = 0u;
  v22 = 0u;
  memset(v20, 0, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, sizeof(v17));
  v12 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
  CA_CGColorGetRGBComponents((CGColor *)a1, v12, (CGFloat *)v19);
  CA_CGColorGetRGBComponents(a4, v12, (CGFloat *)v18);
  if (!a3)
  {
    v13 = 0;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v13 = (double *)v20;
  CA_CGColorGetRGBComponents(a3, v12, (CGFloat *)v20);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v14 = (double *)v17;
  CA_CGColorGetRGBComponents(a5, v12, (CGFloat *)v17);
LABEL_8:
  CA::Render::ValueInterpolator::mix_n<double>(a6, 4, components, v13, (double *)v19, (double *)v18, v14);
  return CGColorCreate(v12, components);
}

- (double)CA_distanceToValue:()CAAnimatableValue
{
  CFTypeID v5;
  CFTypeID TypeID;
  double result;
  CGColorSpace *v8;
  float64x2_t v9;
  uint64_t i;
  float64x2_t v11;
  _OWORD v12[2];
  _OWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = CFGetTypeID(a1);
  TypeID = CGColorGetTypeID();
  result = 1.0;
  if (v5 == TypeID)
  {
    memset(v13, 0, sizeof(v13));
    memset(v12, 0, sizeof(v12));
    v8 = (CGColorSpace *)CAGetColorSpace(0x1Cu);
    CA_CGColorGetRGBComponents((CGColor *)a1, v8, (CGFloat *)v13);
    CA_CGColorGetRGBComponents(a3, v8, (CGFloat *)v12);
    v9 = 0uLL;
    for (i = 0; i != 2; ++i)
    {
      v11 = vsubq_f64((float64x2_t)v13[i], (float64x2_t)v12[i]);
      v9 = vmlaq_f64(v9, v11, v11);
    }
    return sqrt(vaddvq_f64(v9));
  }
  return result;
}

@end
