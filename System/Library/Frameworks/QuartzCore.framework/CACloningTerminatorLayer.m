@implementation CACloningTerminatorLayer

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v6;
  malloc_zone_t *malloc_zone;
  unsigned int *v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  objc_super v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)CACloningTerminatorLayer;
  v6 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v14, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v6 && (*((_BYTE *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v8 = (unsigned int *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
    if (v8)
    {
      v9 = v8;
      v8[2] = 1;
      v10 = v8 + 2;
      v8[3] = 8;
      ++dword_1ECDC7C48;
      *(_QWORD *)v8 = off_1E1598450;
      CA::Render::Layer::set_subclass(v6, (CA::Render::LayerSubclass *)v8);
      do
      {
        v11 = __ldaxr(v10);
        v12 = v11 - 1;
      }
      while (__stlxr(v12, v10));
      if (!v12)
        (*(void (**)(unsigned int *))(*(_QWORD *)v9 + 16))(v9);
    }
    else
    {
      CA::Render::Layer::set_subclass(v6, 0);
    }
  }
  return v6;
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
  v6.super_class = (Class)&OBJC_METACLASS___CACloningTerminatorLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end
