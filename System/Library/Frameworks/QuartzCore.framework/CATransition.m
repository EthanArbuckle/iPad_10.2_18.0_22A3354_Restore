@implementation CATransition

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  char *v7;
  unsigned int *v8;
  unsigned int v9;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x90uLL, 0x743898A5uLL);
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
    *((_DWORD *)v6 + 3) = 55;
    ++dword_1ECDC7D04;
    *(_QWORD *)v6 = off_1E1598180;
    *((_DWORD *)v6 + 23) = 0;
    *((_DWORD *)v6 + 24) = 0;
    *(_QWORD *)(v6 + 100) = 0x3F80000000000000;
    *((_OWORD *)v6 + 7) = 0u;
    *((_OWORD *)v6 + 8) = 0u;
    if (!-[CATransition _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", v6, a3))
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
    -[CATransition _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", 0, a3);
  }
  return v7;
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return 1;
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  const __CFString *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  const __CFString *v21;
  float v22;
  float v23;
  NSDictionary *v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  char v32;
  unsigned int v34;
  objc_super v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)CATransition;
  v6 = -[CAAnimation _setCARenderAnimation:layer:](&v35, sel__setCARenderAnimation_layer_, a3, a4);
  if (v6)
  {
    v7 = -[CATransition filter](self, "filter");
    if (v7)
    {
      *((_DWORD *)a3 + 23) = 221;
      v8 = objc_msgSend(v7, "CA_copyRenderValue");
      v9 = (unsigned int *)*((_QWORD *)a3 + 14);
      if (v9 != (unsigned int *)v8)
      {
        if (v9)
        {
          v10 = v9 + 2;
          do
          {
            v11 = __ldaxr(v10);
            v12 = v11 - 1;
          }
          while (__stlxr(v12, v10));
          if (!v12)
            (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
        }
        if (v8)
        {
          v13 = (unsigned int *)(v8 + 8);
          do
            v14 = __ldaxr(v13);
          while (__stlxr(v14 + 1, v13));
          v15 = v8;
          if (!v14)
          {
            v15 = 0;
            do
              v16 = __ldaxr(v13);
            while (__stlxr(v16 - 1, v13));
          }
        }
        else
        {
          v15 = 0;
        }
        *((_QWORD *)a3 + 14) = v15;
      }
      if (v8)
      {
        v18 = (unsigned int *)(v8 + 8);
        do
        {
          v19 = __ldaxr(v18);
          v20 = v19 - 1;
        }
        while (__stlxr(v20, v18));
        if (!v20)
          (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
      }
    }
    else
    {
      v17 = -[CATransition type](self, "type");
      if (v17)
        *((_DWORD *)a3 + 23) = CAInternAtom(v17, 1);
    }
    v21 = -[CATransition subtype](self, "subtype");
    if (v21)
      *((_DWORD *)a3 + 24) = CAInternAtom(v21, 1);
    -[CATransition startProgress](self, "startProgress");
    if (v22 != 0.0)
      *((float *)a3 + 25) = v22;
    -[CATransition endProgress](self, "endProgress");
    if (v23 != 1.0)
      *((float *)a3 + 26) = v23;
    v24 = -[CATransition options](self, "options");
    if (v24)
    {
      v25 = -[NSDictionary CA_copyRenderKeyValueArray](v24, "CA_copyRenderKeyValueArray");
      v26 = (unsigned int *)*((_QWORD *)a3 + 15);
      if (v26 != (unsigned int *)v25)
      {
        if (v26)
        {
          v27 = v26 + 2;
          do
          {
            v28 = __ldaxr(v27);
            v29 = v28 - 1;
          }
          while (__stlxr(v29, v27));
          if (!v29)
            (*(void (**)(unsigned int *))(*(_QWORD *)v26 + 16))(v26);
        }
        if (v25)
        {
          v30 = (unsigned int *)(v25 + 8);
          do
            v31 = __ldaxr(v30);
          while (__stlxr(v31 + 1, v30));
          if (!v31)
          {
            v25 = 0;
            do
              v34 = __ldaxr(v30);
            while (__stlxr(v34 - 1, v30));
          }
        }
        *((_QWORD *)a3 + 15) = v25;
      }
    }
    v32 = -[CATransition transitionFlags](self, "transitionFlags");
    if ((v32 & 1) != 0)
      *((_DWORD *)a3 + 3) |= 0x1000000u;
    if ((v32 & 2) != 0)
      *((_DWORD *)a3 + 3) |= 0x2000000u;
  }
  return v6;
}

- (unsigned)transitionFlags
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 560, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (NSDictionary)options
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 403, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSDictionary *)v3[0];
}

- (CATransitionType)type
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 566, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CATransitionType)v3[0];
}

- (CATransitionSubtype)subtype
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 541, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (CATransitionSubtype)v3[0];
}

- (float)startProgress
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 526, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (id)filter
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 221, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (id)v3[0];
}

- (float)endProgress
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CAAnimation_getter((CA::Transaction *)self, 212, (const CGAffineTransform *)0x11, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setType:(CATransitionType)type
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = type;
  CAAnimation_setter((uint64_t)self, (const void *)0x236, 3, (unsigned __int8 *)v3);
}

- (void)setSubtype:(CATransitionSubtype)subtype
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = subtype;
  CAAnimation_setter((uint64_t)self, (const void *)0x21D, 3, (unsigned __int8 *)v3);
}

- (void)setTransitionFlags:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x230, 12, (unsigned __int8 *)&v3);
}

- (void)setStartProgress:(float)startProgress
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = startProgress;
  CAAnimation_setter((uint64_t)self, (const void *)0x20E, 17, (unsigned __int8 *)&v3);
}

- (void)setEndProgress:(float)endProgress
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = endProgress;
  CAAnimation_setter((uint64_t)self, (const void *)0xD4, 17, (unsigned __int8 *)&v3);
}

- (void)setFilter:(id)filter
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = filter;
  CAAnimation_setter((uint64_t)self, (const void *)0xDD, 2, (unsigned __int8 *)v3);
}

- (void)setOptions:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x193, 3, (unsigned __int8 *)v3);
}

@end
