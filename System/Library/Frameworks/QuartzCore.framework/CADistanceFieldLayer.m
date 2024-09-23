@implementation CADistanceFieldLayer

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  unsigned __int8 v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 1);
  if (v5 == 457)
    return CFSTR("fill");
  if (v5 == 230)
  {
    if ((v6 & 1) == 0)
    {
      {
        +[CADistanceFieldLayer defaultValueForKey:]::color = (uint64_t)black();
      }
    }
    return (id)+[CADistanceFieldLayer defaultValueForKey:]::color;
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CADistanceFieldLayer;
    return objc_msgSendSuper2(&v8, sel_defaultValueForKey_, a3);
  }
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CADistanceFieldLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)didChangeValueForKey:(id)a3
{
  CA::Transaction *v5;
  uint64_t v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 1);
  v6 = 0;
  while ((_DWORD)v5 != (unsigned __int16)all_atoms[v6])
  {
    if (++v6 == 6)
      goto LABEL_8;
  }
  v7 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v7)
    v7 = (CA::Transaction *)CA::Transaction::create(v5);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
LABEL_8:
  v8.receiver = self;
  v8.super_class = (Class)CADistanceFieldLayer;
  -[CADistanceFieldLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v8;
  malloc_zone_t *malloc_zone;
  char *v10;
  unsigned int *v11;
  NSString *v12;
  NSString *v13;
  int v14;
  CGColor *v15;
  CA::Transaction *v16;
  CA::Render *v17;
  CGColor *v18;
  CA::Render::Pattern **v19;
  double v20;
  double v21;
  double v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v27;
  objc_super v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)CADistanceFieldLayer;
  v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v28, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v8 && (*((_BYTE *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v10 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x28uLL, 0x743898A5uLL);
    v11 = (unsigned int *)v10;
    if (v10)
    {
      *((_DWORD *)v10 + 2) = 1;
      *(_QWORD *)v10 = off_1E1597F88;
      *(_QWORD *)(v10 + 12) = 0x20000000CLL;
      ++dword_1ECDC7C58;
      *((_DWORD *)v10 + 5) = 255;
      *((_QWORD *)v10 + 3) = 0;
      *((_DWORD *)v10 + 8) = 0;
    }
    v12 = -[CADistanceFieldLayer renderMode](self, "renderMode");
    if (v12)
    {
      v13 = v12;
      if (-[NSString isEqualToString:](v12, "isEqualToString:", CFSTR("fill")))
      {
        v14 = 1;
      }
      else if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("stroke")))
      {
        v14 = 2;
      }
      else if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("innerStroke")))
      {
        v14 = 3;
      }
      else if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("outerStroke")))
      {
        v14 = 4;
      }
      else
      {
        v14 = 0;
      }
      v11[4] = v14;
    }
    v15 = -[CADistanceFieldLayer foregroundColor](self, "foregroundColor");
    if (v15)
    {
      v17 = v15;
      v18 = (CGColor *)CA::Context::current_colorspace((CA::Context *)a3, v16);
      v27 = 0;
      CA::Render::convert_cgcolor(v17, v18, (CGColorSpace *)&v27, 0, v19);
      v11[5] = v27;
    }
    -[CADistanceFieldLayer lineWidth](self, "lineWidth");
    *(float *)&v20 = v20;
    v11[6] = LODWORD(v20);
    -[CADistanceFieldLayer offset](self, "offset");
    *(float *)&v21 = v21;
    v11[7] = LODWORD(v21);
    -[CADistanceFieldLayer sharpness](self, "sharpness");
    *(float *)&v22 = v22;
    v11[8] = LODWORD(v22);
    if (-[CADistanceFieldLayer invertsShape](self, "invertsShape"))
      v11[3] |= 0x100u;
    CA::Render::Layer::set_subclass(v8, (CA::Render::LayerSubclass *)v11);
    v23 = v11 + 2;
    do
    {
      v24 = __ldaxr(v23);
      v25 = v24 - 1;
    }
    while (__stlxr(v25, v23));
    if (!v25)
      (*(void (**)(unsigned int *))(*(_QWORD *)v11 + 16))(v11);
  }
  return v8;
}

- (void)_colorSpaceDidChange
{
  CA::Transaction *v3;
  CA::Transaction *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)CADistanceFieldLayer;
  v3 = (CA::Transaction *)-[CALayer _colorSpaceDidChange](&v5, sel__colorSpaceDidChange);
  v4 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CA::Transaction *)CA::Transaction::create(v3);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v4, 0x10000);
}

- (unsigned)_renderImageCopyFlags
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CADistanceFieldLayer;
  return -[CALayer _renderImageCopyFlags](&v3, sel__renderImageCopyFlags) | 0x28;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v5;
  uint64_t v6;

  v3 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  while ((unsigned __int16)all_atoms[v3] != a3)
  {
    if (++v3 == 6)
    {
      v5.receiver = self;
      v5.super_class = (Class)CADistanceFieldLayer;
      return -[CALayer _renderLayerDefinesProperty:](&v5, sel__renderLayerDefinesProperty_);
    }
  }
  return 1;
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3;
  objc_super v5;
  uint64_t v6;

  v3 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  while ((unsigned __int16)animatable_atoms[v3] != a3)
  {
    if (++v3 == 5)
    {
      v5.receiver = self;
      v5.super_class = (Class)CADistanceFieldLayer;
      return -[CALayer _renderLayerPropertyAnimationFlags:](&v5, sel__renderLayerPropertyAnimationFlags_);
    }
  }
  return 32;
}

- (NSString)renderMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1C9u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (void)setRenderMode:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1C9, (const CGAffineTransform *)3, v3);
}

- (BOOL)invertsShape
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x147u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setInvertsShape:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x147, (const CGAffineTransform *)6, (double *)&v3);
}

- (double)lineWidth
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x15Du, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setLineWidth:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x15D, (const CGAffineTransform *)0x12, v3);
}

- (double)offset
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x18Bu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setOffset:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x18B, (const CGAffineTransform *)0x12, v3);
}

- (double)sharpness
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1F0u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setSharpness:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1F0, (const CGAffineTransform *)0x12, v3);
}

- (CGColor)foregroundColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xE6u, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (void)setForegroundColor:(CGColor *)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xE6, (const CGAffineTransform *)2, v3);
}

@end
