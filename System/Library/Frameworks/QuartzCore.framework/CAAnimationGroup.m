@implementation CAAnimationGroup

- (void)setDefaultDuration:(double)a3
{
  double v5;
  double v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;

  -[CAAnimation duration](self, "duration");
  v6 = v5;
  if (v5 <= 0.0)
  {
    -[CAAnimation setDuration:](self, "setDuration:", a3);
    v6 = a3;
  }
  v7 = -[CAAnimationGroup animations](self, "animations");
  v8 = -[NSArray count](v7, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      objc_msgSend(-[NSArray objectAtIndex:](v7, "objectAtIndex:", i), "setDefaultDuration:", v6);
  }
}

- (void)CA_prepareRenderValue
{
  NSArray *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;

  v2 = -[CAAnimationGroup animations](self, "animations");
  if (v2)
  {
    v3 = v2;
    v4 = -[NSArray count](v2, "count");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", i), "CA_prepareRenderValue");
    }
  }
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;

  v4 = -[CAAnimationGroup animations](self, "animations");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = -[NSArray count](v4, "count");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = 0;
  do
    v9 |= objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", v8++), "_propertyFlagsForLayer:", a3);
  while (v7 != v8);
  return v9;
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  int v10;
  CA::Render::Array *v11;
  uint64_t i;
  uint64_t v13;
  malloc_zone_t *malloc_zone;
  char *v15;
  char *v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v32;
  objc_super v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = -[CAAnimationGroup animations](self, "animations");
  v6 = -[NSArray count](v5, "count");
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 8 * v6;
  if ((unint64_t)(8 * v6) > 0x1000)
  {
    v9 = (char *)malloc_type_malloc(8 * v6, 0xF237A94CuLL);
    if (v9)
      goto LABEL_5;
    return 0;
  }
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v8);
LABEL_5:
  v10 = 0;
  v11 = 0;
  for (i = 0; i != v7; ++i)
  {
    v13 = objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", i), "_copyRenderAnimationForLayer:", a3);
    if (v13)
    {
      v10 |= *(_DWORD *)(v13 + 12) >> 8;
      *(_QWORD *)&v9[8 * (_QWORD)v11] = v13;
      v11 = (CA::Render::Array *)((char *)v11 + 1);
    }
  }
  if (!v11)
    goto LABEL_32;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v15 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x68uLL, 0x743898A5uLL);
  v16 = v15;
  if (v15)
  {
    *((_DWORD *)v15 + 2) = 1;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *((_QWORD *)v15 + 9) = 0;
    *((_QWORD *)v15 + 2) = 0;
    *((_QWORD *)v15 + 3) = 0;
    *((_DWORD *)v15 + 8) = 0;
    *((_DWORD *)v15 + 3) = 21;
    ++dword_1ECDC7C7C;
    *(_QWORD *)v15 = off_1E1597380;
    *((_QWORD *)v15 + 12) = 0;
  }
  v33.receiver = self;
  v33.super_class = (Class)CAAnimationGroup;
  if (-[CAAnimation _setCARenderAnimation:layer:](&v33, sel__setCARenderAnimation_layer_, v15, a3))
  {
    v17 = CA::Render::Array::new_array(v11, v9, 0, 0);
    v18 = (unsigned int *)*((_QWORD *)v16 + 12);
    if (v18 != v17)
    {
      if (v18)
      {
        v19 = v18 + 2;
        do
        {
          v20 = __ldaxr(v19);
          v21 = v20 - 1;
        }
        while (__stlxr(v21, v19));
        if (!v21)
          (*(void (**)(unsigned int *))(*(_QWORD *)v18 + 16))(v18);
      }
      if (v17)
      {
        v22 = v17 + 2;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 + 1, v22));
        v24 = v17;
        if (!v23)
        {
          v24 = 0;
          do
            v25 = __ldaxr(v22);
          while (__stlxr(v25 - 1, v22));
        }
      }
      else
      {
        v24 = 0;
      }
      *((_QWORD *)v16 + 12) = v24;
    }
    if (v17)
    {
      v28 = v17 + 2;
      do
      {
        v29 = __ldaxr(v28);
        v30 = v29 - 1;
      }
      while (__stlxr(v30, v28));
      if (!v30)
        (*(void (**)(unsigned int *))(*(_QWORD *)v17 + 16))(v17);
    }
    *((_DWORD *)v16 + 3) |= (v10 << 8) & 0x1D3000;
    goto LABEL_41;
  }
  if (v16)
  {
    v26 = (unsigned int *)(v16 + 8);
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (v27 == 1)
      (*(void (**)(char *))(*(_QWORD *)v16 + 16))(v16);
LABEL_32:
    v16 = 0;
  }
LABEL_41:
  if (v8 > 0x1000)
    free(v9);
  return v16;
}

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15[2];

  v15[1] = *(double *)MEMORY[0x1E0C80C00];
  v15[0] = a3;
  if (-[CAAnimation isEnabled](self, "isEnabled"))
  {
    v8 = -[CAAnimationGroup animations](self, "animations");
    v9 = -[NSArray count](v8, "count");
    if (v9)
    {
      v10 = v9;
      if (mapAnimationTime(&self->super, v15, 0))
      {
        v11 = v15[0];
        -[CAAnimation duration](self, "duration");
        v12 = 0;
        v14 = v13 * v11;
        do
          objc_msgSend(-[NSArray objectAtIndex:](v8, "objectAtIndex:", v12++), "applyForTime:presentationObject:modelObject:", a4, a5, v14);
        while (v10 != v12);
      }
    }
  }
}

- (NSArray)animations
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 31, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSArray *)v3[0];
}

- (void)setAnimations:(NSArray *)animations
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = animations;
  CAAnimation_setter((uint64_t)self, (const void *)0x1F, 3, (unsigned __int8 *)v3);
}

@end
