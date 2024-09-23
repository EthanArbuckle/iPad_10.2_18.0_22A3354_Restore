@implementation CACarPlayRegionLayer

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v7;
  malloc_zone_t *malloc_zone;
  unsigned int *v9;
  unsigned int *v10;
  NSString *v11;
  NSString *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CACarPlayRegionLayer;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v17, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v7 && (*((_BYTE *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = (unsigned int *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v10 = v9;
    if (v9)
    {
      v9[2] = 1;
      v9[3] = 6;
      ++dword_1ECDC7C40;
      *(_QWORD *)v9 = off_1E1597E78;
      *((_QWORD *)v9 + 2) = 0;
    }
    v11 = -[CACarPlayRegionLayer identifier](self, "identifier");
    v12 = (NSString *)*((_QWORD *)v10 + 2);
    if (v12 != v11)
    {
      if (v12)
        CFRelease(v12);
      *((_QWORD *)v10 + 2) = v11;
      if (v11)
        CFRetain(v11);
    }
    CA::Render::Layer::set_subclass(v7, (CA::Render::LayerSubclass *)v10);
    v13 = v10 + 2;
    do
    {
      v14 = __ldaxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
      (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 16))(v10);
  }
  return v7;
}

- (NSString)identifier
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x103u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (void)setIdentifier:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x103, (const CGAffineTransform *)3, v3);
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
  v6.super_class = (Class)&OBJC_METACLASS___CACarPlayRegionLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end
