@implementation CASecureIndicatorLayer

- (void)didChangeValueForKey:(id)a3
{
  CA::Transaction *v5;
  CA::Transaction *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  if ((_DWORD)v5 == 438)
  {
    v6 = CA::Transaction::ensure_compat(v5);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0x10000);
  }
  v7.receiver = self;
  v7.super_class = (Class)CASecureIndicatorLayer;
  -[CASecureIndicatorLayer didChangeValueForKey:](&v7, sel_didChangeValueForKey_, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a3 == 438)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CASecureIndicatorLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v4, sel__renderLayerDefinesProperty_);
}

- (void)setPrivacyIndicatorType:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1B6, (const CGAffineTransform *)3, v3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v7;
  malloc_zone_t *malloc_zone;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CASecureIndicatorLayer;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v16, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v7 && (*((_BYTE *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = (unsigned int *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x18uLL, 0x743898A5uLL);
    v10 = v9;
    if (v9)
    {
      *((_QWORD *)v9 + 2) = 0;
      v9[2] = 1;
      v9[3] = 45;
      ++dword_1ECDC7CDC;
      *(_QWORD *)v9 = off_1E1598340;
    }
    *((_WORD *)v9 + 10) = -1;
    v11 = indicator_id_from_name(-[CASecureIndicatorLayer privacyIndicatorType](self, "privacyIndicatorType"));
    if (v11 == -1)
      __assert_rtn("-[CASecureIndicatorLayer _copyRenderLayer:layerFlags:commitFlags:]", "CASecureIndicatorLayer.mm", 136, "type != ~0U");
    v10[4] = v11;
    CA::Render::Layer::set_subclass(v7, (CA::Render::LayerSubclass *)v10);
    v12 = v10 + 2;
    do
    {
      v13 = __ldaxr(v12);
      v14 = v13 - 1;
    }
    while (__stlxr(v14, v12));
    if (!v14)
      (*(void (**)(unsigned int *))(*(_QWORD *)v10 + 16))(v10);
  }
  return v7;
}

- (NSString)privacyIndicatorType
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1B6u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
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
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("privacyIndicatorType")) & 1) != 0)
    return CFSTR("Microphone");
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CASecureIndicatorLayer;
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
  v6.super_class = (Class)&OBJC_METACLASS___CASecureIndicatorLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end
