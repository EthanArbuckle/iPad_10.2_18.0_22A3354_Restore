@implementation CABackdropLayer

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  CA::Transaction *v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(12, (uint64_t)&-[CABackdropLayer didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CABackdropLayer;
  -[CABackdropLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  unint64_t v14;
  BOOL v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  BOOL v20;
  CA::Transaction *v21;
  CA::Transaction *v22;
  objc_super v23;
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)CABackdropLayer;
  -[CALayer layerDidBecomeVisible:](&v23, sel_layerDidBecomeVisible_);
  os_unfair_lock_lock(&_all_backdrops_lock);
  v5 = _all_backdrops;
  if (!_all_backdrops)
  {
    v5 = operator new();
    *(_QWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)v5 = v5 + 8;
    _all_backdrops = v5;
  }
  v7 = (uint64_t **)(v5 + 8);
  v6 = *(uint64_t **)(v5 + 8);
  if (v3)
  {
    v8 = (uint64_t *)(v5 + 8);
    if (v6)
    {
      while (1)
      {
        while (1)
        {
          v8 = v6;
          v9 = v6[4];
          if (v9 <= (unint64_t)self)
            break;
          v6 = (uint64_t *)*v6;
          v7 = (uint64_t **)v8;
          if (!*v8)
            goto LABEL_11;
        }
        if (v9 >= (unint64_t)self)
          break;
        v6 = (uint64_t *)v6[1];
        if (!v6)
        {
          v7 = (uint64_t **)(v8 + 1);
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      v10 = (uint64_t *)operator new(0x28uLL);
      v10[4] = (uint64_t)self;
      *v10 = 0;
      v10[1] = 0;
      v10[2] = (uint64_t)v8;
      *v7 = v10;
      v11 = **(_QWORD **)v5;
      if (v11)
      {
        *(_QWORD *)v5 = v11;
        v10 = *v7;
      }
      std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v5 + 8), v10);
      ++*(_QWORD *)(v5 + 16);
    }
    os_unfair_lock_unlock(&_all_backdrops_lock);
  }
  else
  {
    if (v6)
    {
      v12 = (uint64_t *)(v5 + 8);
      v13 = *(_QWORD **)(v5 + 8);
      do
      {
        v14 = v13[4];
        v15 = v14 >= (unint64_t)self;
        if (v14 >= (unint64_t)self)
          v16 = v13;
        else
          v16 = v13 + 1;
        if (v15)
          v12 = v13;
        v13 = (_QWORD *)*v16;
      }
      while (*v16);
      if (v12 != (uint64_t *)v7 && v12[4] <= (unint64_t)self)
      {
        v17 = (uint64_t *)v12[1];
        if (v17)
        {
          do
          {
            v18 = v17;
            v17 = (uint64_t *)*v17;
          }
          while (v17);
        }
        else
        {
          v19 = v12;
          do
          {
            v18 = (uint64_t *)v19[2];
            v20 = *v18 == (_QWORD)v19;
            v19 = v18;
          }
          while (!v20);
        }
        if (*(uint64_t **)v5 == v12)
          *(_QWORD *)v5 = v18;
        --*(_QWORD *)(v5 + 16);
        std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, v12);
        operator delete(v12);
      }
    }
    os_unfair_lock_unlock(&_all_backdrops_lock);
    v22 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v22)
      v22 = (CA::Transaction *)CA::Transaction::create(v21);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v22, 0);
  }
}

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 > 247)
  {
    if (v5 == 248)
      return CFSTR("owningContext");
    if (v5 == 475)
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  }
  else
  {
    if (v5 == 51)
      return (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
    if (v5 == 208)
      return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CABackdropLayer;
  return objc_msgSendSuper2(&v7, sel_defaultValueForKey_, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(12, (uint64_t)&-[CABackdropLayer _renderLayerDefinesProperty:]::atoms, a3) != -1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CABackdropLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v6, sel__renderLayerDefinesProperty_, v3);
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v3;
  objc_super v5;
  uint64_t v6;

  v3 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  while ((unsigned __int16)-[CABackdropLayer _renderLayerPropertyAnimationFlags:]::atoms[v3] != a3)
  {
    if (++v3 == 4)
    {
      v5.receiver = self;
      v5.super_class = (Class)CABackdropLayer;
      return -[CALayer _renderLayerPropertyAnimationFlags:](&v5, sel__renderLayerPropertyAnimationFlags_);
    }
  }
  return 32;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (void)setScale:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1DB, (const CGAffineTransform *)0x12, v3);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  id v7;
  malloc_zone_t *malloc_zone;
  int8x16_t *v9;
  int8x16_t *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int v15;
  int v16;
  char *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  int8x16_t v22;
  float64x2_t v23;
  float64x2_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  double v30;
  double v31;
  const __CFString *v32;
  const __CFString *v33;
  unsigned int *v34;
  unsigned int *v35;
  unsigned int *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  _BOOL4 v46;
  int v47;
  unsigned int *v48;
  unsigned int v49;
  unsigned int v50;
  char v52;
  objc_super v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)CABackdropLayer;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v53, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (!v7 || (*((_BYTE *)a5 + 2) & 1) == 0)
    return v7;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v9 = (int8x16_t *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x60uLL, 0x743898A5uLL);
  v10 = v9;
  if (v9)
  {
    v9->i32[2] = 1;
    v9->i32[3] = 3;
    ++dword_1ECDC7C34;
    v9->i64[0] = (uint64_t)off_1E1596DB8;
    v9[1].i64[0] = 0;
    v9[1].i64[1] = 0;
    v9[2].i64[0] = 1065353216;
    v9[2].i32[2] = 0;
    v9[5].i64[1] = 0;
    v9[3] = 0u;
    v9[4] = 0u;
    v9[5].i8[0] = 0;
  }
  v11 = -[CABackdropLayer isEnabled](self, "isEnabled");
  v12 = -[CABackdropLayer captureOnly](self, "captureOnly");
  v13 = -[CABackdropLayer reducesCaptureBitDepth](self, "reducesCaptureBitDepth");
  v14 = -[CABackdropLayer ignoresScreenClip](self, "ignoresScreenClip");
  v15 = v11 | 0x10;
  if (!v12)
    v15 = v11;
  if (v13)
    v15 |= 0x20u;
  if (v14)
    v16 = v15 | 0x100;
  else
    v16 = v15;
  if (CA::Render::Encoder::initialize_render_id_slide(void)::once[0] != -1)
    dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_11026);
  v17 = (char *)self + CA::Render::_render_id_slide;
  if (!self)
    v17 = 0;
  v10[1].i64[0] = (uint64_t)v17;
  -[CABackdropLayer scale](self, "scale");
  *(float *)&v18 = v18;
  v10[2].i32[0] = LODWORD(v18);
  -[CABackdropLayer backdropRect](self, "backdropRect");
  *(double *)v22.i64 = v21;
  v22.i64[1] = v19;
  v23.f64[0] = 0.0;
  v25.i64[0] = *(_QWORD *)&v24.f64[0];
  v25.i64[1] = v20;
  v26 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v23, v24).i64[0], 0);
  v27.i64[1] = v19;
  *(double *)v27.i64 = v24.f64[0] + v21;
  v28 = vbslq_s8(v26, v27, v22);
  v22.i64[1] = v20;
  *(double *)v22.i64 = -v24.f64[0];
  v29 = vbslq_s8(v26, v22, v25);
  if (*(double *)&v20 < 0.0)
  {
    *(double *)&v28.i64[1] = *(double *)&v20 + *(double *)&v19;
    *(double *)&v29.i64[1] = -*(double *)&v20;
  }
  v10[3] = v28;
  v10[4] = v29;
  -[CABackdropLayer zoom](self, "zoom");
  *(float *)&v30 = v30;
  v10[2].i32[2] = LODWORD(v30);
  -[CABackdropLayer marginWidth](self, "marginWidth");
  *(float *)&v31 = v31;
  v10[2].i32[1] = LODWORD(v31);
  if ((__CFString *)-[CABackdropLayer groupNamespace](self, "groupNamespace") != CFSTR("owningContext"))
  {
    if (-[NSString isEqualToString:](-[CABackdropLayer groupNamespace](self, "groupNamespace"), "isEqualToString:", CFSTR("global")))
    {
      v52 = 2;
    }
    else
    {
      if (!-[NSString isEqualToString:](-[CABackdropLayer groupNamespace](self, "groupNamespace"), "isEqualToString:", CFSTR("hostingNamespacedContext")))goto LABEL_19;
      v52 = 1;
    }
    v10[5].i8[0] = v52;
  }
LABEL_19:
  if (-[CABackdropLayer allowsInPlaceFiltering](self, "allowsInPlaceFiltering"))
  {
    v16 |= 2u;
  }
  else
  {
    v32 = -[CABackdropLayer groupName](self, "groupName");
    if (v32)
    {
      v34 = CA::Render::String::new_string(v32, v33);
      v35 = (unsigned int *)v10[1].i64[1];
      if (v35 != v34)
      {
        if (v35)
        {
          v36 = v35 + 2;
          do
          {
            v37 = __ldaxr(v36);
            v38 = v37 - 1;
          }
          while (__stlxr(v38, v36));
          if (!v38)
            (*(void (**)(unsigned int *))(*(_QWORD *)v35 + 16))(v35);
        }
        if (v34)
        {
          v39 = v34 + 2;
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 + 1, v39));
          v41 = v34;
          if (!v40)
          {
            v41 = 0;
            do
              v42 = __ldaxr(v39);
            while (__stlxr(v42 - 1, v39));
          }
        }
        else
        {
          v41 = 0;
        }
        v10[1].i64[1] = (uint64_t)v41;
      }
      if (v34)
      {
        v43 = v34 + 2;
        do
        {
          v44 = __ldaxr(v43);
          v45 = v44 - 1;
        }
        while (__stlxr(v45, v43));
        if (!v45)
          (*(void (**)(unsigned int *))(*(_QWORD *)v34 + 16))(v34);
      }
    }
  }
  v46 = -[CABackdropLayer tracksLuma](self, "tracksLuma");
  v47 = v16 | 4;
  if (!v46)
    v47 = v16;
  if (v47)
    v10->i32[3] |= v47 << 8;
  CA::Render::Layer::set_subclass((unsigned int *)v7, (CA::Render::LayerSubclass *)v10);
  v48 = &v10->u32[2];
  do
  {
    v49 = __ldaxr(v48);
    v50 = v49 - 1;
  }
  while (__stlxr(v50, v48));
  if (!v50)
    (*(void (**)(int8x16_t *))(v10->i64[0] + 16))(v10);
  return v7;
}

- (BOOL)tracksLuma
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x22Cu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (double)scale
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1DBu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)reducesCaptureBitDepth
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1C4u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSString)groupNamespace
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xF8u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (BOOL)captureOnly
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x50u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)allowsInPlaceFiltering
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x11u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)ignoresScreenClip
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x107u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (double)marginWidth
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x16Eu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (double)zoom
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x25Du, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)isEnabled
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xD0u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (CGRect)backdropRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = CALayer_getter_kCAValueRect((CA::Transaction *)self->super._attr.layer, 0x33u);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)groupName
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xF7u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (void)setGroupName:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xF7, (const CGAffineTransform *)3, v3);
}

- (void)setGroupNamespace:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xF8, (const CGAffineTransform *)3, v3);
}

- (void)setAllowsInPlaceFiltering:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x11, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setTracksLuma:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x22C, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setCaptureOnly:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x50, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xD0, (const CGAffineTransform *)6, (double *)&v3);
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CABackdropLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)setUsesGlobalGroupNamespace:(BOOL)a3
{
  -[CABackdropLayer setGroupNamespace:](self, "setGroupNamespace:", CFSTR("global"));
}

- (BOOL)usesGlobalGroupNamespace
{
  return -[NSString isEqualToString:](-[CABackdropLayer groupNamespace](self, "groupNamespace"), "isEqualToString:", CFSTR("global"));
}

- (void)setBackdropRect:(CGRect)a3
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x33, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (void)setZoom:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x25D, (const CGAffineTransform *)0x12, v3);
}

- (void)setMarginWidth:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x16E, (const CGAffineTransform *)0x12, v3);
}

- (void)setReducesCaptureBitDepth:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1C4, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setIgnoresScreenClip:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x107, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)disablesOccludedBackdropBlurs
{
  return self->_disablesOccludedBackdropBlurs;
}

- (void)setDisablesOccludedBackdropBlurs:(BOOL)a3
{
  self->_disablesOccludedBackdropBlurs = a3;
}

@end
