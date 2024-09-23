@implementation CABasicAnimation

- (void)setFromValue:(id)fromValue
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = fromValue;
  CAAnimation_setter((uint64_t)self, (const void *)0xEE, 2, (unsigned __int8 *)v3);
}

- (void)setToValue:(id)toValue
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = toValue;
  CAAnimation_setter((uint64_t)self, (const void *)0x226, 2, (unsigned __int8 *)v3);
}

- (void)setByValue:(id)byValue
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = byValue;
  CAAnimation_setter((uint64_t)self, (const void *)0x4C, 2, (unsigned __int8 *)v3);
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  char *v7;
  unsigned int *v8;
  unsigned int v9;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x98uLL, 0x743898A5uLL);
  v7 = v6;
  if (v6)
  {
    *((_DWORD *)v6 + 2) = 1;
    v8 = (unsigned int *)(v6 + 8);
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *((_QWORD *)v6 + 9) = 0;
    *((_QWORD *)v6 + 2) = 0;
    *((_QWORD *)v6 + 3) = 0;
    *((_DWORD *)v6 + 8) = 0;
    *((_QWORD *)v6 + 12) = 0;
    *((_QWORD *)v6 + 13) = 0;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    *((_QWORD *)v6 + 18) = 0;
    *((_DWORD *)v6 + 3) = 5;
    ++dword_1ECDC7C3C;
    *(_QWORD *)v6 = off_1E15972B8;
    if (!-[CABasicAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", v6, a3))
    {
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (v9 == 1)
        (*(void (**)(char *))(*(_QWORD *)v7 + 16))(v7);
      return 0;
    }
  }
  else
  {
    -[CABasicAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", 0, a3);
  }
  return v7;
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  NSString *v8;
  NSString *v9;
  objc_object *v10;
  objc_object *v11;
  id v12;
  id v13;
  objc_object *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  objc_object *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  objc_object *v27;
  CAValueFunction *v28;
  const char *v29;
  float64x2_t *v30;
  float64x2_t v31;
  float64_t v32;
  const char *v33;
  double *v34;
  const double *v35;
  const double *v36;
  float64x2_t v37;
  float64_t v38;
  float64_t v39;
  float64x2_t v40;
  float64x2_t v41;
  int v42;
  double v43[2];

  v43[1] = *(double *)MEMORY[0x1E0C80C00];
  v43[0] = a3;
  if (!-[CAAnimation isEnabled](self, "isEnabled"))
    return;
  v8 = -[CAPropertyAnimation keyPath](self, "keyPath");
  if (!v8)
    return;
  v9 = v8;
  v42 = 0;
  if (!mapAnimationTime(&self->super.super, v43, &v42))
    return;
  v10 = -[CABasicAnimation fromValue](self, "fromValue");
  v11 = -[CABasicAnimation toValue](self, "toValue");
  v12 = -[CABasicAnimation byValue](self, "byValue");
  v13 = v12;
  if (v10 && v11)
    goto LABEL_18;
  if (!v10 || !v12)
  {
    if (v11 && v12)
    {
      v16 = -[objc_object CA_addValue:multipliedBy:](v11, "CA_addValue:multipliedBy:", v12, 0xFFFFFFFFLL);
    }
    else
    {
      if (v10)
      {
        v15 = objc_msgSend(a5, "valueForKeyPath:", v9);
        goto LABEL_17;
      }
      if (!v11)
      {
        if (!v12)
          return;
        v14 = (objc_object *)objc_msgSend(a4, "valueForKeyPath:", v9);
        v10 = v14;
        goto LABEL_9;
      }
      v16 = objc_msgSend(a4, "valueForKeyPath:", v9);
    }
    v10 = (objc_object *)v16;
    if (!v16)
      return;
    goto LABEL_19;
  }
  v14 = v10;
LABEL_9:
  v15 = -[objc_object CA_addValue:multipliedBy:](v14, "CA_addValue:multipliedBy:", v13, 1);
LABEL_17:
  v11 = (objc_object *)v15;
LABEL_18:
  if (!v10)
    return;
LABEL_19:
  if (!v11)
    return;
  v17 = v43[0];
  v18 = v10;
  if (v43[0] <= 0.0)
    goto LABEL_30;
  v18 = v11;
  if (v43[0] >= 1.0)
    goto LABEL_30;
  -[CABasicAnimation _timeFunction:](self, "_timeFunction:", v43[0]);
  v20 = v19;
  v43[0] = v19;
  -[CABasicAnimation startAngle](self, "startAngle");
  v22 = v21;
  -[CABasicAnimation endAngle](self, "endAngle");
  v24 = v23;
  if ((v22 != 0.0 || v23 != 0.0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v25 = (const char *)-[objc_object objCType](v10, "objCType")) != 0
    && !strcmp(v25, "{CGPoint=dd}"))
  {
    v29 = (const char *)-[objc_object objCType](v10, "objCType");
    v30 = (float64x2_t *)MEMORY[0x1E0CB3430];
    if (v29 && !strcmp(v29, "{CGPoint=dd}"))
    {
      -[objc_object pointValue](v10, "pointValue");
      v31.f64[1] = v32;
    }
    else
    {
      v31 = *v30;
    }
    v33 = (const char *)-[objc_object objCType](v11, "objCType", *(_OWORD *)&v31);
    if (v33 && !strcmp(v33, "{CGPoint=dd}"))
    {
      -[objc_object pointValue](v11, "pointValue");
      v37.f64[0] = v38;
      v37.f64[1] = v39;
    }
    else
    {
      v37 = *v30;
    }
    v41 = 0uLL;
    CA::Render::point_interpolate(&v41, v34, v35, v36, v40, v37, v20, v22, v24);
    v26 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", v41.f64[0], v41.f64[1]);
  }
  else
  {
    *(float *)&v23 = v20;
    v18 = (objc_object *)-[objc_object CA_interpolateValue:byFraction:](v10, "CA_interpolateValue:byFraction:", v11, v23);
    if (!-[CABasicAnimation roundsToInteger](self, "roundsToInteger"))
      goto LABEL_30;
    v26 = -[objc_object CA_roundToIntegerFromValue:](v18, "CA_roundToIntegerFromValue:", v10);
  }
  v18 = (objc_object *)v26;
LABEL_30:
  if (-[CAPropertyAnimation isCumulative](self, "isCumulative", v17) && v42)
  {
    if (-[CAAnimation autoreverses](self, "autoreverses"))
      v27 = v10;
    else
      v27 = v11;
    v18 = (objc_object *)-[objc_object CA_addValue:multipliedBy:](v18, "CA_addValue:multipliedBy:", v27, v42);
  }
  v28 = -[CAPropertyAnimation valueFunction](self, "valueFunction");
  if (v28)
    v18 = (objc_object *)applyValueFunction(v28, v18, &self->super, (objc_object *)a4);
  if (-[CAPropertyAnimation isAdditive](self, "isAdditive"))
    v18 = (objc_object *)objc_msgSend((id)objc_msgSend(a4, "valueForKeyPath:", v9), "CA_addValue:multipliedBy:", v18, 1);
  objc_msgSend(a4, "setValue:forKeyPath:", v18, v9);
}

- (void)CA_prepareRenderValue
{
  objc_msgSend(-[CABasicAnimation fromValue](self, "fromValue"), "CA_prepareRenderValue");
  objc_msgSend(-[CABasicAnimation toValue](self, "toValue"), "CA_prepareRenderValue");
  objc_msgSend(-[CABasicAnimation byValue](self, "byValue"), "CA_prepareRenderValue");
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  _BOOL4 v6;
  id v7;
  CA::Render::Object *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  id v25;
  uint64_t v26;
  unsigned int *v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int *v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int *v35;
  unsigned int v36;
  unsigned int v37;
  double v38;
  double v39;
  objc_super v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)CABasicAnimation;
  v6 = -[CAPropertyAnimation _setCARenderAnimation:layer:](&v41, sel__setCARenderAnimation_layer_, a3, a4);
  if (v6)
  {
    v7 = -[CABasicAnimation fromValue](self, "fromValue");
    if (v7)
    {
      v8 = (CA::Render::Object *)objc_msgSend(v7, "CA_copyRenderValue");
      CA::Render::BasicAnimation0::set_from((CA::Render::BasicAnimation0 *)a3, v8);
      if (v8)
      {
        v9 = (unsigned int *)((char *)v8 + 8);
        do
        {
          v10 = __ldaxr(v9);
          v11 = v10 - 1;
        }
        while (__stlxr(v11, v9));
        if (!v11)
          (*(void (**)(CA::Render::Object *))(*(_QWORD *)v8 + 16))(v8);
      }
    }
    v12 = -[CABasicAnimation toValue](self, "toValue");
    if (v12)
    {
      v13 = objc_msgSend(v12, "CA_copyRenderValue");
      v14 = (unsigned int *)*((_QWORD *)a3 + 15);
      if (v14 != (unsigned int *)v13)
      {
        if (v14)
        {
          v15 = v14 + 2;
          do
          {
            v16 = __ldaxr(v15);
            v17 = v16 - 1;
          }
          while (__stlxr(v17, v15));
          if (!v17)
            (*(void (**)(unsigned int *))(*(_QWORD *)v14 + 16))(v14);
        }
        if (v13)
        {
          v18 = (unsigned int *)(v13 + 8);
          do
            v19 = __ldaxr(v18);
          while (__stlxr(v19 + 1, v18));
          v20 = v13;
          if (!v19)
          {
            v20 = 0;
            do
              v21 = __ldaxr(v18);
            while (__stlxr(v21 - 1, v18));
          }
        }
        else
        {
          v20 = 0;
        }
        *((_QWORD *)a3 + 15) = v20;
      }
      if (v13)
      {
        v22 = (unsigned int *)(v13 + 8);
        do
        {
          v23 = __ldaxr(v22);
          v24 = v23 - 1;
        }
        while (__stlxr(v24, v22));
        if (!v24)
          (*(void (**)(uint64_t))(*(_QWORD *)v13 + 16))(v13);
      }
    }
    v25 = -[CABasicAnimation byValue](self, "byValue");
    if (v25)
    {
      v26 = objc_msgSend(v25, "CA_copyRenderValue");
      v27 = (unsigned int *)*((_QWORD *)a3 + 16);
      if (v27 != (unsigned int *)v26)
      {
        if (v27)
        {
          v28 = v27 + 2;
          do
          {
            v29 = __ldaxr(v28);
            v30 = v29 - 1;
          }
          while (__stlxr(v30, v28));
          if (!v30)
            (*(void (**)(unsigned int *))(*(_QWORD *)v27 + 16))(v27);
        }
        if (v26)
        {
          v31 = (unsigned int *)(v26 + 8);
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 + 1, v31));
          v33 = v26;
          if (!v32)
          {
            v33 = 0;
            do
              v34 = __ldaxr(v31);
            while (__stlxr(v34 - 1, v31));
          }
        }
        else
        {
          v33 = 0;
        }
        *((_QWORD *)a3 + 16) = v33;
      }
      if (v26)
      {
        v35 = (unsigned int *)(v26 + 8);
        do
        {
          v36 = __ldaxr(v35);
          v37 = v36 - 1;
        }
        while (__stlxr(v37, v35));
        if (!v37)
          (*(void (**)(uint64_t))(*(_QWORD *)v26 + 16))(v26);
      }
    }
    if (-[CABasicAnimation roundsToInteger](self, "roundsToInteger"))
      *((_DWORD *)a3 + 3) |= 0x1000000u;
    -[CABasicAnimation startAngle](self, "startAngle");
    if (v38 != 0.0)
      *((double *)a3 + 17) = v38;
    -[CABasicAnimation endAngle](self, "endAngle");
    if (v39 != 0.0)
      *((double *)a3 + 18) = v39;
  }
  return v6;
}

- (id)fromValue
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 238, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (id)toValue
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 550, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (id)byValue
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 76, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (double)endAngle
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 210, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (double)startAngle
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 524, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (BOOL)roundsToInteger
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 473, (const CGAffineTransform *)6, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setRoundsToInteger:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1D9, 6, (unsigned __int8 *)&v3);
}

- (void)setStartAngle:(double)a3
{
  float v3;
  float v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  CAAnimation_setter((uint64_t)self, (const void *)0x20C, 17, (unsigned __int8 *)&v4);
}

- (void)setEndAngle:(double)a3
{
  float v3;
  float v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  CAAnimation_setter((uint64_t)self, (const void *)0xD2, 17, (unsigned __int8 *)&v4);
}

@end
