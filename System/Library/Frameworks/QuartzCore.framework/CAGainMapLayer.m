@implementation CAGainMapLayer

- (void)didChangeValueForKey:(id)a3
{
  CA::Transaction *v5;
  CA::Transaction *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  if ((_DWORD)v5 == 457)
  {
    v6 = CA::Transaction::ensure_compat(v5);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0x10000);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAGainMapLayer;
  -[CAGainMapLayer didChangeValueForKey:](&v7, sel_didChangeValueForKey_, a3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  id v7;
  malloc_zone_t *malloc_zone;
  unsigned int *v9;
  unsigned int *v10;
  NSString *v11;
  char v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CAGainMapLayer;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v17, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (!v7 || (*((_BYTE *)a5 + 2) & 1) == 0)
    return v7;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v9 = (unsigned int *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
  v10 = v9;
  if (v9)
  {
    *((_QWORD *)v9 + 2) = 0;
    v9[2] = 1;
    v9[3] = 19;
    ++dword_1ECDC7C74;
    *(_QWORD *)v9 = off_1E1596968;
  }
  v11 = -[CAGainMapLayer renderMode](self, "renderMode");
  if (-[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("gainBorder")))
  {
    v12 = 1;
  }
  else if (-[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("gainFill")))
  {
    v12 = 2;
  }
  else
  {
    if (!-[NSString isEqualToString:](v11, "isEqualToString:", CFSTR("gainBorderRenderFill")))
    {
      *((_BYTE *)v10 + 16) = 0;
      goto LABEL_12;
    }
    v12 = 3;
  }
  *((_BYTE *)v10 + 16) = v12;
LABEL_12:
  CA::Render::Layer::set_subclass((unsigned int *)v7, (CA::Render::LayerSubclass *)v10);
  v13 = v10 + 2;
  do
  {
    v14 = __ldaxr(v13);
    v15 = v14 - 1;
  }
  while (__stlxr(v15, v13));
  if (!v15)
    (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 16))(v10);
  return v7;
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

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

+ (id)defaultValueForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("renderMode")) & 1) != 0)
    return CFSTR("gainBorder");
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAGainMapLayer;
  return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAGainMapLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a3 == 457)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CAGainMapLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v4, sel__renderLayerDefinesProperty_);
}

@end
