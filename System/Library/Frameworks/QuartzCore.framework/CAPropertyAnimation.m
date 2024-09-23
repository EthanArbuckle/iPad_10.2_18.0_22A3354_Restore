@implementation CAPropertyAnimation

- (void)setKeyPath:(NSString *)keyPath
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = keyPath;
  CAAnimation_setter((uint64_t)self, (const void *)0x14A, 3, (unsigned __int8 *)v3);
}

- (NSString)keyPath
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 330, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setAdditive:(BOOL)additive
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = additive;
  CAAnimation_setter((uint64_t)self, (const void *)2, 7, (unsigned __int8 *)&v3);
}

- (void)setCumulative:(BOOL)cumulative
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = cumulative;
  CAAnimation_setter((uint64_t)self, (const void *)0x9D, 7, (unsigned __int8 *)&v3);
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  const __CFString *v7;
  const __CFString *v8;
  void **v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  CAValueFunction *v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  objc_super v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v30[0] = 0;
  v7 = -[CAPropertyAnimation keyPath](self, "keyPath");
  CA::Render::key_path_set((CA::Render *)v30, v7, v8);
  v10 = v30[0];
  if (!v30[0])
  {
LABEL_5:
    v11 = 0;
    goto LABEL_7;
  }
  if ((v30[0] & 1) == 0)
  {
    if (*(_DWORD *)v30[0])
    {
      v11 = *(unsigned int *)(v30[0] + 4);
      goto LABEL_7;
    }
    goto LABEL_5;
  }
  v11 = v30[0] >> 1;
LABEL_7:
  CA::Render::key_path_free(*((CA::Render **)a3 + 12), v9);
  *((_QWORD *)a3 + 12) = v10;
  if (a4)
  {
    v12 = objc_msgSend(a4, "_renderLayerDefinesProperty:", v11);
    if (!v12)
      return v12;
    v13 = objc_msgSend(a4, "_renderLayerPropertyAnimationFlags:", v11);
  }
  else
  {
    v13 = 0;
  }
  v29.receiver = self;
  v29.super_class = (Class)CAPropertyAnimation;
  v12 = -[CAAnimation _setCARenderAnimation:layer:](&v29, sel__setCARenderAnimation_layer_, a3, a4);
  if (v12)
  {
    if (key_path_affects_container(v10))
      v14 = v13 | 0x400;
    else
      v14 = v13;
    if (-[CAPropertyAnimation isAdditive](self, "isAdditive"))
      v14 |= 2u;
    if (-[CAPropertyAnimation isCumulative](self, "isCumulative"))
      v14 |= 4u;
    v15 = -[CAPropertyAnimation valueFunction](self, "valueFunction");
    if (v15)
    {
      v16 = -[CAValueFunction CA_copyRenderValue](v15, "CA_copyRenderValue");
      v17 = (unsigned int *)*((_QWORD *)a3 + 13);
      if (v17 != (unsigned int *)v16)
      {
        if (v17)
        {
          v18 = v17 + 2;
          do
          {
            v19 = __ldaxr(v18);
            v20 = v19 - 1;
          }
          while (__stlxr(v20, v18));
          if (!v20)
            (*(void (**)(unsigned int *))(*(_QWORD *)v17 + 16))(v17);
        }
        if (v16)
        {
          v21 = (unsigned int *)(v16 + 8);
          do
            v22 = __ldaxr(v21);
          while (__stlxr(v22 + 1, v21));
          v23 = v16;
          if (!v22)
          {
            v23 = 0;
            do
              v24 = __ldaxr(v21);
            while (__stlxr(v24 - 1, v21));
          }
        }
        else
        {
          v23 = 0;
        }
        *((_QWORD *)a3 + 13) = v23;
      }
      if (v16)
      {
        v25 = (unsigned int *)(v16 + 8);
        do
        {
          v26 = __ldaxr(v25);
          v27 = v26 - 1;
        }
        while (__stlxr(v27, v25));
        if (!v27)
          (*(void (**)(uint64_t))(*(_QWORD *)v16 + 16))(v16);
      }
    }
    if (v14)
      *((_DWORD *)a3 + 3) |= v14 << 8;
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (BOOL)isAdditive
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 2, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (CAValueFunction)valueFunction
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 573, (const CGAffineTransform *)2, (CA::Mat4Impl *)v3);
  return (CAValueFunction *)v3[0];
}

- (BOOL)isCumulative
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 157, (const CGAffineTransform *)7, (CA::Mat4Impl *)&v3);
  return v3 != 0;
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return animation_property_flags((__CFString *)-[CAPropertyAnimation keyPath](self, "keyPath"), (CALayer *)a3);
}

+ (CAPropertyAnimation)animationWithKeyPath:(NSString *)path
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setKeyPath:", path);
  return (CAPropertyAnimation *)v4;
}

- (void)setValueFunction:(CAValueFunction *)valueFunction
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = valueFunction;
  CAAnimation_setter((uint64_t)self, (const void *)0x23D, 2, (unsigned __int8 *)v3);
}

@end
