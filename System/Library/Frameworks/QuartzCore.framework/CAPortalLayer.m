@implementation CAPortalLayer

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  CA::Transaction *v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(10, (uint64_t)&-[CAPortalLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CAPortalLayer;
  -[CAPortalLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  CA::Transaction *v5;
  CA::Transaction *v6;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAPortalLayer;
  v5 = (CA::Transaction *)-[CALayer layerDidBecomeVisible:](&v7, sel_layerDidBecomeVisible_);
  if (!a3)
  {
    v6 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v6)
      v6 = (CA::Transaction *)CA::Transaction::create(v5);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v6, 0);
  }
}

- (void)setSourceLayer:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1FE, (const CGAffineTransform *)4, v3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  id v7;
  malloc_zone_t *malloc_zone;
  _DWORD *v9;
  _DWORD *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  int v18;
  CALayer *v19;
  CALayer *v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int *v23;
  unsigned int *v24;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v38;
  objc_super v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)CAPortalLayer;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v39, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (!v7 || (*((_BYTE *)a5 + 2) & 1) == 0)
    return v7;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v9 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x40uLL, 0x743898A5uLL);
  v10 = v9;
  if (v9)
  {
    v9[2] = 1;
    v9[3] = 40;
    ++dword_1ECDC7CC8;
    *(_QWORD *)v9 = off_1E1596640;
    *((_QWORD *)v9 + 3) = 0;
    *((_QWORD *)v9 + 4) = 0;
    v9[10] = 0;
    *((_QWORD *)v9 + 6) = 0;
    *((_QWORD *)v9 + 7) = 0;
  }
  v11 = -[CAPortalLayer hidesSourceLayer](self, "hidesSourceLayer");
  v12 = -[CAPortalLayer matchesOpacity](self, "matchesOpacity");
  v13 = -[CAPortalLayer matchesPosition](self, "matchesPosition");
  v14 = -[CAPortalLayer matchesTransform](self, "matchesTransform");
  v15 = -[CAPortalLayer allowsBackdropGroups](self, "allowsBackdropGroups");
  v16 = -[CAPortalLayer crossDisplay](self, "crossDisplay");
  v17 = -[CAPortalLayer allowedInContextTransform](self, "allowedInContextTransform");
  v18 = v11 | 2;
  if (!v12)
    v18 = v11;
  if (v13)
    v18 |= 4u;
  if (v14)
    v18 |= 8u;
  if (v15)
    v18 |= 0x10u;
  if (v16)
    v18 |= 0x20u;
  if (v17)
    v18 |= 0x80u;
  if (v18)
    v10[3] |= v18 << 8;
  *((_QWORD *)v10 + 3) = CA::Render::Object::render_id((CA::Render::Object *)self->super._attr.layer);
  v19 = -[CAPortalLayer sourceLayer](self, "sourceLayer");
  v20 = v19;
  if (v19)
  {
    *((_QWORD *)v10 + 4) = CA::Render::Object::render_id((CA::Render::Object *)v19->_attr.layer);
    v21 = objc_msgSend(-[CALayer context](v20, "context"), "contextId");
LABEL_23:
    v10[10] = v21;
    goto LABEL_24;
  }
  v22 = -[CAPortalLayer sourceLayerRenderId](self, "sourceLayerRenderId");
  if (v22)
  {
    *((_QWORD *)v10 + 4) = v22;
    v21 = -[CAPortalLayer sourceContextId](self, "sourceContextId");
    goto LABEL_23;
  }
LABEL_24:
  v23 = -[NSDictionary CA_copyRenderKeyValueArray](-[CAPortalLayer overrides](self, "overrides"), "CA_copyRenderKeyValueArray");
  if (v23)
  {
    v24 = (unsigned int *)*((_QWORD *)v10 + 6);
    if (v24 != v23)
    {
      if (v24)
      {
        v25 = v24 + 2;
        do
        {
          v26 = __ldaxr(v25);
          v27 = v26 - 1;
        }
        while (__stlxr(v27, v25));
        if (!v27)
          (*(void (**)(unsigned int *))(*(_QWORD *)v24 + 16))(v24);
      }
      v28 = v23 + 2;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 + 1, v28));
      v30 = v23;
      if (!v29)
      {
        v30 = 0;
        do
          v38 = __ldaxr(v28);
        while (__stlxr(v38 - 1, v28));
      }
      *((_QWORD *)v10 + 6) = v30;
    }
    v31 = v23 + 2;
    do
    {
      v32 = __ldaxr(v31);
      v33 = v32 - 1;
    }
    while (__stlxr(v33, v31));
    if (!v33)
      (*(void (**)(unsigned int *))(*(_QWORD *)v23 + 16))(v23);
  }
  CA::Render::Layer::set_subclass((unsigned int *)v7, (CA::Render::LayerSubclass *)v10);
  v34 = v10 + 2;
  do
  {
    v35 = __ldaxr(v34);
    v36 = v35 - 1;
  }
  while (__stlxr(v36, v34));
  if (!v36)
    (*(void (**)(_DWORD *))(*(_QWORD *)v10 + 16))(v10);
  return v7;
}

- (CALayer)sourceLayer
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1FEu, (const CGAffineTransform *)4, v3);
  return (CALayer *)v3[0];
}

- (BOOL)matchesTransform
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x176u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)matchesPosition
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x175u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)matchesOpacity
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x174u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)hidesSourceLayer
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xFCu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)crossDisplay
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x95u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)allowsBackdropGroups
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 9u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(10, (uint64_t)&-[CAPortalLayer _renderLayerDefinesProperty:]::atoms, a3) != -1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CAPortalLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v6, sel__renderLayerDefinesProperty_, v3);
}

- (unint64_t)sourceLayerRenderId
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1FFu, (const CGAffineTransform *)0x10, v3);
  return (unint64_t)v3[0];
}

- (void)setSourceLayerRenderId:(unint64_t)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1FF, (const CGAffineTransform *)0x10, v3);
}

- (unsigned)sourceContextId
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1FCu, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (void)setSourceContextId:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1FC, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (void)setHidesSourceLayer:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xFC, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMatchesOpacity:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x174, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMatchesPosition:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x175, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setMatchesTransform:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x176, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setAllowsBackdropGroups:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)9, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setCrossDisplay:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x95, (const CGAffineTransform *)6, (double *)&v3);
}

- (NSDictionary)overrides
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x19Au, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (void)setOverrides:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x19A, (const CGAffineTransform *)3, v3);
}

- (BOOL)allowedInContextTransform
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 8u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setAllowedInContextTransform:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)8, (const CGAffineTransform *)6, (double *)&v3);
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
  v6.super_class = (Class)&OBJC_METACLASS___CAPortalLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end
