@implementation CAReplicatorLayer

- (void)didChangeValueForKey:(id)a3
{
  CA::Transaction *v5;
  int v6;
  uint64_t v7;
  CA::Transaction *v8;
  BOOL v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (CA::Transaction *)CAInternAtom((const __CFString *)a3, 0);
  v6 = (int)v5;
  v7 = 0;
  while ((_DWORD)v5 != (unsigned __int16)-[CAReplicatorLayer didChangeValueForKey:]::atoms[v7])
  {
    if (++v7 == 9)
      goto LABEL_6;
  }
  v8 = CA::Transaction::ensure_compat(v5);
  CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v8, 0x10000);
LABEL_6:
  if (v6 == 436)
  {
    v9 = -[CAReplicatorLayer preservesDepth](self, "preservesDepth");
    v10 = (unsigned int *)((char *)self->super._attr.layer + 4);
    if (v9)
    {
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 | 0x10000, v10));
    }
    else
    {
      do
        v12 = __ldaxr(v10);
      while (__stlxr(v12 & 0xFFFEFFFF, v10));
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)CAReplicatorLayer;
  -[CAReplicatorLayer didChangeValueForKey:](&v13, sel_didChangeValueForKey_, a3);
}

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  id result;
  CGColorSpace *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 == 316)
  {
    result = (id)+[CAReplicatorLayer defaultValueForKey:]::white;
    if (!+[CAReplicatorLayer defaultValueForKey:]::white)
    {
      v7 = (CGColorSpace *)CAGetColorSpace(0x1Du);
      result = CGColorCreate(v7, +[CAReplicatorLayer defaultValueForKey:]::values);
      +[CAReplicatorLayer defaultValueForKey:]::white = (uint64_t)result;
    }
  }
  else if (v5 == 317)
  {
    return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CAReplicatorLayer;
    return objc_msgSendSuper2(&v8, sel_defaultValueForKey_, a3);
  }
  return result;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAReplicatorLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a3 - 314 < 8)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CAReplicatorLayer;
  return -[CALayer _renderLayerDefinesProperty:](&v4, sel__renderLayerDefinesProperty_);
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a3 - 314 < 8)
    return dword_18475EE04[a3 - 314];
  v4.receiver = self;
  v4.super_class = (Class)CAReplicatorLayer;
  return -[CALayer _renderLayerPropertyAnimationFlags:](&v4, sel__renderLayerPropertyAnimationFlags_);
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 1;
}

- (void)setInstanceTransform:(CATransform3D *)instanceTransform
{
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x141, (const CGAffineTransform *)0x16, &instanceTransform->m11);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v8;
  malloc_zone_t *malloc_zone;
  char *v10;
  const double *v11;
  char *v12;
  unsigned int *v13;
  const double *v14;
  double v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  CGColor *v32;
  CA::Transaction *v33;
  CGColor *v34;
  CGColorSpace *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  float64x2_t v43;
  float64x2_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  __int128 v52;
  float64x2_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)CAReplicatorLayer;
  v8 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v51, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v8)
  {
    if ((*((_BYTE *)a5 + 2) & 1) != 0)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v10 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x48uLL, 0x743898A5uLL);
      if (v10)
      {
        v12 = v10;
        *((_DWORD *)v10 + 2) = 1;
        v13 = (unsigned int *)(v10 + 8);
        ++dword_1ECDC7CD8;
        *(_QWORD *)v10 = off_1E1597788;
        *(_QWORD *)(v10 + 12) = 0x10000002CLL;
        v52 = xmmword_18474DF40;
        v53 = 0u;
        v54 = xmmword_18474DF50;
        v55 = 0u;
        v56 = 0u;
        v57 = xmmword_18474DF40;
        v58 = 0u;
        v59 = xmmword_18474DF50;
        *((_QWORD *)v10 + 3) = CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, &v52, v11);
        *((_OWORD *)v12 + 2) = xmmword_18474E7B0;
        *((_DWORD *)v12 + 12) = 1065353216;
        *(_QWORD *)(v12 + 60) = 0;
        *(_QWORD *)(v12 + 52) = 0;
        *((_DWORD *)v12 + 4) = -[CAReplicatorLayer instanceCount](self, "instanceCount");
        -[CAReplicatorLayer instanceDelay](self, "instanceDelay");
        *(float *)&v15 = v15;
        *((_DWORD *)v12 + 8) = LODWORD(v15);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        if (self && (-[CAReplicatorLayer instanceTransform](self, "instanceTransform"), v43.f64[0] == 1.0))
        {
          v25 = 1;
          while (v25 != 16)
          {
            v26 = v25;
            v27 = v43.f64[v25];
            v28 = *(&CATransform3DIdentity.m11 + v25++);
            if (v27 != v28)
            {
              if ((unint64_t)(v26 - 1) <= 0xE)
                goto LABEL_6;
              break;
            }
          }
        }
        else
        {
LABEL_6:
          v52 = (__int128)v43;
          v53 = v44;
          v54 = v45;
          v55 = v46;
          v56 = v47;
          v57 = v48;
          v58 = v49;
          v59 = v50;
          v16 = CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, &v52, v14);
          v17 = (unsigned int *)*((_QWORD *)v12 + 3);
          if (v17 != v16)
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
              v21 = v16 + 2;
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
            *((_QWORD *)v12 + 3) = v23;
          }
          if (v16)
          {
            v29 = v16 + 2;
            do
            {
              v30 = __ldaxr(v29);
              v31 = v30 - 1;
            }
            while (__stlxr(v31, v29));
            if (!v31)
              (*(void (**)(unsigned int *))(*(_QWORD *)v16 + 16))(v16);
          }
        }
        v32 = -[CAReplicatorLayer instanceColor](self, "instanceColor", *(_QWORD *)&v43.f64[0]);
        if (v32)
        {
          v34 = v32;
          v35 = (CGColorSpace *)CA::Context::current_colorspace((CA::Context *)a3, v33);
          v52 = 0u;
          v53 = 0u;
          CA_CGColorGetRGBComponents(v34, v35, (CGFloat *)&v52);
          *(float32x4_t *)(v12 + 36) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v52), v53);
        }
        -[CAReplicatorLayer instanceRedOffset](self, "instanceRedOffset");
        *((_DWORD *)v12 + 13) = v36;
        -[CAReplicatorLayer instanceGreenOffset](self, "instanceGreenOffset");
        *((_DWORD *)v12 + 14) = v37;
        -[CAReplicatorLayer instanceBlueOffset](self, "instanceBlueOffset");
        *((_DWORD *)v12 + 15) = v38;
        -[CAReplicatorLayer instanceAlphaOffset](self, "instanceAlphaOffset");
        *((_DWORD *)v12 + 16) = v39;
        CA::Render::Layer::set_subclass(v8, (CA::Render::LayerSubclass *)v12);
        do
        {
          v40 = __ldaxr(v13);
          v41 = v40 - 1;
        }
        while (__stlxr(v41, v13));
        if (!v41)
          (*(void (**)(char *))(*(_QWORD *)v12 + 16))(v12);
      }
    }
  }
  return v8;
}

- (float)instanceAlphaOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x13Au, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CATransform3D)instanceTransform
{
  CATransform3D *result;

  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x141u, (const CGAffineTransform *)0x16, (id *)retstr);
  return result;
}

- (float)instanceRedOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x140u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (float)instanceGreenOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x13Fu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CFTimeInterval)instanceDelay
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x13Eu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (NSInteger)instanceCount
{
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x13Du, (const CGAffineTransform *)0xB, (id *)&v3);
  return v3;
}

- (CGColorRef)instanceColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x13Cu, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (float)instanceBlueOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x13Bu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (void)setInstanceCount:(NSInteger)instanceCount
{
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = instanceCount;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x13D, (const CGAffineTransform *)0xB, (double *)&v3);
}

- (CAReplicatorLayer)init
{
  CAReplicatorLayer *v2;
  CAReplicatorLayer *v3;
  unsigned int *v4;
  unsigned int v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAReplicatorLayer;
  v2 = -[CALayer init](&v7, sel_init);
  v3 = v2;
  if (v2 && -[CAReplicatorLayer preservesDepth](v2, "preservesDepth"))
  {
    v4 = (unsigned int *)((char *)v3->super._attr.layer + 4);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 | 0x10000, v4));
  }
  return v3;
}

- (BOOL)preservesDepth
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1B4u, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setInstanceAlphaOffset:(float)instanceAlphaOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = instanceAlphaOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x13A, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setInstanceColor:(CGColorRef)instanceColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = instanceColor;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x13C, (const CGAffineTransform *)2, v3);
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  id result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CAReplicatorLayer;
  result = -[CALayer implicitAnimationForKeyPath:](&v12, sel_implicitAnimationForKeyPath_);
  if (!result)
  {
    v6 = objc_msgSend(a3, "rangeOfString:", CFSTR("."));
    if (!v7)
    {
      v10 = CAInternAtom((const __CFString *)a3, 0);
      v9 = v10;
      v11 = 0;
      while (v10 != (unsigned __int16)-[CAReplicatorLayer implicitAnimationForKeyPath:]::atoms[v11])
      {
        if (++v11 == 8)
          return 0;
      }
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
    }
    v8 = CAInternAtom((const __CFString *)objc_msgSend(a3, "substringToIndex:", v6), 0);
    v9 = 0;
    if (v8 == 321)
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)self, a3, v9);
    return 0;
  }
  return result;
}

- (void)_renderSublayersInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSInteger v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  float64x2_t v18;
  const double *v19;
  uint64_t i;
  uint64_t j;
  uint64_t *v22;
  double v23;
  double v24;
  CGAffineTransform v25;
  float64x2_t v26[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[8];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v7 = (void *)-[NSArray copy](-[CALayer sublayers](self, "sublayers"), "copy");
  v8 = objc_msgSend(v7, "count");
  v9 = -[CAReplicatorLayer instanceCount](self, "instanceCount");
  v10 = 0uLL;
  v11 = 0uLL;
  v12 = 0uLL;
  v13 = 0uLL;
  v14 = 0uLL;
  v15 = 0uLL;
  v16 = 0uLL;
  v17 = 0uLL;
  v18 = 0uLL;
  if (self)
  {
    -[CAReplicatorLayer instanceTransform](self, "instanceTransform", 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    v10 = 0uLL;
    v18 = (float64x2_t)v33;
    v17 = v34;
    v16 = v35;
    v15 = v36;
    v14 = v37;
    v13 = v38;
    v12 = v39;
    v11 = v40;
  }
  v41[0] = v18;
  v41[1] = v17;
  v41[2] = v16;
  v41[3] = v15;
  v41[4] = v14;
  v41[5] = v13;
  v41[6] = v12;
  v41[7] = v11;
  v33 = xmmword_18474DF40;
  v34 = v10;
  v35 = xmmword_18474DF50;
  v36 = v10;
  v37 = v10;
  v38 = xmmword_18474DF40;
  v39 = v10;
  v40 = xmmword_18474DF50;
  CA::Transaction::unlock(v5);
  CGContextSaveGState(a3);
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      if (v8)
      {
        for (j = 0; j != v8; ++j)
        {
          v22 = (uint64_t *)objc_msgSend(v7, "objectAtIndex:", j);
          CGContextSaveGState(a3);
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          memset(v26, 0, sizeof(v26));
          CA::Layer::get_frame_transform(v22[2], v26, 0, (const double *)&v33, 0.0, v23, v24);
          *(float64x2_t *)&v25.a = v26[0];
          *(_OWORD *)&v25.c = v27;
          *(_OWORD *)&v25.tx = v31;
          CGContextConcatCTM(a3, &v25);
          objc_msgSend(v22, "renderInContext:", a3);
          CGContextRestoreGState(a3);
        }
      }
      CA::Mat4Impl::mat4_concat((float64x2_t *)&v33, (double *)v41, (const double *)&v33, v19);
    }
  }
  CGContextRestoreGState(a3);

}

- (void)setPreservesDepth:(BOOL)preservesDepth
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = preservesDepth;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1B4, (const CGAffineTransform *)7, (double *)&v3);
}

- (void)setInstanceDelay:(CFTimeInterval)instanceDelay
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = instanceDelay;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x13E, (const CGAffineTransform *)0x12, v3);
}

- (void)setInstanceRedOffset:(float)instanceRedOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = instanceRedOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x140, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setInstanceGreenOffset:(float)instanceGreenOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = instanceGreenOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x13F, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setInstanceBlueOffset:(float)instanceBlueOffset
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = instanceBlueOffset;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x13B, (const CGAffineTransform *)0x11, (double *)&v3);
}

@end
