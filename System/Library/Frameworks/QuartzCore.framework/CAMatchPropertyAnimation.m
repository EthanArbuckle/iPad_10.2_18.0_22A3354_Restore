@implementation CAMatchPropertyAnimation

- (void)applyForTime:(double)a3 presentationObject:(id)a4 modelObject:(id)a5
{
  CALayer *v8;
  CALayer *v9;
  CALayer *v10;
  NSString *v11;
  uint64_t v12;

  if (-[CAAnimation isEnabled](self, "isEnabled", a3))
  {
    v8 = -[CAMatchPropertyAnimation sourceLayer](self, "sourceLayer");
    v9 = v8;
    if (v8)
    {
      while (v8 != a5)
      {
        v8 = -[CALayer superlayer](v8, "superlayer");
        if (!v8)
          goto LABEL_5;
      }
    }
    else
    {
LABEL_5:
      v10 = (CALayer *)a4;
      if (v9 != a5)
        v10 = -[CALayer presentationLayer](v9, "presentationLayer");
      if (v10)
      {
        v11 = -[CAMatchPropertyAnimation keyPath](self, "keyPath");
        v12 = -[CALayer valueForKeyPath:](v10, "valueForKeyPath:", v11);
        if (-[CAMatchPropertyAnimation isAdditive](self, "isAdditive"))
          v12 = objc_msgSend((id)objc_msgSend(a4, "valueForKeyPath:", v11), "CA_addValue:multipliedBy:", v12, 1);
        objc_msgSend(a4, "setValue:forKeyPath:", v12, v11);
      }
    }
  }
}

- (BOOL)_setCARenderAnimation:(void *)a3 layer:(id)a4
{
  _BOOL4 v7;
  const __CFString *v8;
  const __CFString *v9;
  void **v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  _BOOL4 v14;
  CALayer *v15;
  CALayer *v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  unint64_t v21;
  objc_super v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)CAMatchPropertyAnimation;
  v7 = -[CAAnimation _setCARenderAnimation:layer:](&v22, sel__setCARenderAnimation_layer_);
  if (!v7)
    return v7;
  v8 = -[CAMatchPropertyAnimation keyPath](self, "keyPath");
  if (!v8)
  {
    v13 = 0;
    goto LABEL_15;
  }
  v21 = 0;
  CA::Render::key_path_set((CA::Render *)&v21, v8, v9);
  v11 = v21;
  if (!v21)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_10;
  }
  if ((v21 & 1) == 0)
  {
    if (*(_DWORD *)v21)
    {
      v12 = *(unsigned int *)(v21 + 4);
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  v12 = v21 >> 1;
LABEL_10:
  CA::Render::key_path_free(*((CA::Render **)a3 + 15), v10);
  *((_QWORD *)a3 + 15) = v11;
  if (a4)
    v13 = objc_msgSend(a4, "_renderLayerPropertyAnimationFlags:", v12) << 8;
  else
    v13 = 0;
  if (key_path_affects_container(v11))
    v13 |= 0x40000u;
LABEL_15:
  v14 = -[CAMatchPropertyAnimation isAdditive](self, "isAdditive");
  *((_QWORD *)a3 + 12) = CA::Render::Object::render_id(*((CA::Render::Object **)a4 + 2));
  v15 = -[CAMatchPropertyAnimation sourceLayer](self, "sourceLayer");
  if (v15)
  {
    v16 = v15;
    *((_QWORD *)a3 + 13) = CA::Render::Object::render_id((CA::Render::Object *)v15->_attr.layer);
    v17 = objc_msgSend(-[CALayer context](v16, "context"), "contextId");
LABEL_19:
    *((_DWORD *)a3 + 28) = v17;
    goto LABEL_20;
  }
  v18 = -[CAMatchPropertyAnimation sourceLayerRenderId](self, "sourceLayerRenderId");
  if (v18)
  {
    *((_QWORD *)a3 + 13) = v18;
    v17 = -[CAMatchPropertyAnimation sourceContextId](self, "sourceContextId");
    goto LABEL_19;
  }
LABEL_20:
  v19 = v13 | 0x200;
  if (!v14)
    v19 = v13;
  *((_DWORD *)a3 + 3) |= v19;
  return v7;
}

- (void)_copyRenderAnimationForLayer:(id)a3
{
  malloc_zone_t *malloc_zone;
  char *v6;
  char *v7;
  unsigned int *v8;
  unsigned int v9;

  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x88uLL, 0x743898A5uLL);
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
    *((_QWORD *)v6 + 13) = 0;
    *((_QWORD *)v6 + 15) = 0;
    *((_QWORD *)v6 + 16) = 0;
    *((_DWORD *)v6 + 3) = 32;
    ++dword_1ECDC7CA8;
    *(_QWORD *)v6 = off_1E1598560;
    if (!-[CAMatchPropertyAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", v6, a3))
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
    -[CAMatchPropertyAnimation _setCARenderAnimation:layer:](self, "_setCARenderAnimation:layer:", 0, a3);
  }
  return v7;
}

- (unsigned)_propertyFlagsForLayer:(id)a3
{
  return animation_property_flags((__CFString *)-[CAMatchPropertyAnimation keyPath](self, "keyPath"), (CALayer *)a3);
}

- (CALayer)sourceLayer
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 510, (const CGAffineTransform *)4, (CA::Mat4Impl *)v3);
  return (CALayer *)v3[0];
}

- (void)setSourceLayer:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1FE, 4, (unsigned __int8 *)v3);
}

- (unint64_t)sourceLayerRenderId
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 511, (const CGAffineTransform *)0x10, (CA::Mat4Impl *)v3);
  return v3[0];
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1FF, 16, (unsigned __int8 *)v3);
}

- (unsigned)sourceContextId
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CAAnimation_getter((CA::Transaction *)self, 508, (const CGAffineTransform *)0xC, (CA::Mat4Impl *)&v3);
  return v3;
}

- (void)setSourceContextId:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x1FC, 12, (unsigned __int8 *)&v3);
}

- (NSString)keyPath
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CAAnimation_getter((CA::Transaction *)self, 330, (const CGAffineTransform *)3, (CA::Mat4Impl *)v3);
  return (NSString *)v3[0];
}

- (void)setKeyPath:(id)a3
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CAAnimation_setter((uint64_t)self, (const void *)0x14A, 3, (unsigned __int8 *)v3);
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

- (void)setAdditive:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CAAnimation_setter((uint64_t)self, (const void *)2, 7, (unsigned __int8 *)&v3);
}

@end
