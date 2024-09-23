@implementation CALayer

- (CALayerDelegate)unsafeUnretainedDelegate
{
  char *layer;
  id *v3;

  layer = (char *)self->_attr.layer;
  v3 = (id *)(layer + 128);
  if (layer[136])
    return (CALayerDelegate *)objc_loadWeak(v3);
  else
    return (CALayerDelegate *)*v3;
}

- (void)observationInfo
{
  return self->_attr._objc_observation_info;
}

- (BOOL)flipsHorizontalAxis
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 4) & 1;
}

- (void)removeFromSuperlayer
{
  CA::Layer::remove_from_superlayer((CALayer **)self->_attr.layer);
}

- (BOOL)needsLayout
{
  CA::Layer *layer;
  unsigned int *v3;
  uint64_t v4;
  unsigned int v5;

  layer = (CA::Layer *)self->_attr.layer;
  v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = v3[24];
  if ((v4 & 0x80000000) != 0 || (v5 = *((_DWORD *)layer + v4 + 68)) == 0)
    v5 = *CA::Layer::thread_flags_(layer, (CA::Transaction *)v3);
  return (v5 >> 5) & 1;
}

- (int64_t)contentsGravityEnum
{
  return ((unint64_t)*((unsigned int *)self->_attr.layer + 11) >> 3) & 0xF;
}

- (void)setUnsafeUnretainedDelegate:(id)a3
{
  CA::Layer::set_delegate((CA::Layer *)self->_attr.layer, (objc_object *)a3, 0);
}

- (CGRect)frame
{
  CA::Transaction *v3;
  int v4;
  void *layer;
  double v6;
  double v7;
  int8x16_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float64x2_t v18[8];
  int8x16_t v19;
  double v20;
  double v21;
  uint64_t v22;
  CGRect result;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = self->_attr.layer;
  v6 = 0.5;
  v7 = 0.5;
  if ((*((_BYTE *)layer + 56) & 8) != 0)
    -[CALayer anchorPoint](self, "anchorPoint", 0.5, 0.5);
  v8 = *((int8x16_t *)layer + 6);
  v19 = v8;
  v9 = *((double *)layer + 14);
  v10 = *((double *)layer + 15);
  v20 = v9;
  v21 = v10;
  if ((*((_BYTE *)layer + 55) & 0x10) != 0)
  {
    memset(v18, 0, sizeof(v18));
    CA::Layer::get_frame_transform((uint64_t)layer, v18, 1, 0, 0.0, v6, *(double *)v8.i64);
    CA::Mat4Impl::mat4_apply_to_rect(v18, &v19, v13);
    v12 = *(double *)&v19.i64[1];
    v11 = *(double *)v19.i64;
    v9 = v20;
    v10 = v21;
  }
  else
  {
    v11 = *((double *)layer + 10) - v9 * v7;
    v12 = *((double *)layer + 11) - v10 * v6;
  }
  CA::Transaction::unlock(v3);
  v14 = v11;
  v15 = v12;
  v16 = v9;
  v17 = v10;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setPosition:(CGPoint)position
{
  double *layer;
  CGPoint v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  layer = (double *)self->_attr.layer;
  v4 = position;
  CA::Layer::set_position(layer, (uint64_t)&v4);
}

- (void)setNeedsLayout
{
  CA::Layer *layer;
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  _DWORD *v7;
  int v8;
  int *v9;
  unsigned int *v10;
  CA::Layer *v11;
  uint64_t v12;
  char *v13;
  int v14;
  int *v15;
  int v16;
  unsigned int v17;
  malloc_zone_t *malloc_zone;
  unsigned int v19;
  int v20;
  malloc_zone_t *v21;
  unsigned int *v22;

  layer = (CA::Layer *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) != 0)
    goto LABEL_35;
  v4 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  v5 = v4[25];
  v4[25] = v5 + 1;
  if (!v5)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v6 = v4[24];
  if ((v6 & 0x80000000) != 0 || (v7 = (_DWORD *)((char *)layer + 4 * v6), (v8 = v7[68]) == 0))
  {
    v9 = CA::Layer::thread_flags_(layer, (CA::Transaction *)v4);
    v8 = *v9;
    if ((*v9 & 0x20) != 0)
      goto LABEL_34;
  }
  else
  {
    v9 = v7 + 68;
    if ((v8 & 0x20) != 0)
      goto LABEL_34;
  }
  *v9 = v8 | 0x20;
  CA::Layer::invalidate_layout((uint64_t)layer);
  v10 = CA::Layer::retain_parent(layer, (CA::Transaction *)v4);
  if (!v10)
    goto LABEL_34;
  v11 = (CA::Layer *)v10;
  while (1)
  {
    v12 = v4[24];
    if ((v12 & 0x80000000) != 0)
      break;
    v13 = (char *)v11 + 4 * v12;
    v14 = *((_DWORD *)v13 + 68);
    if (!v14)
      break;
    v15 = (int *)(v13 + 272);
    if ((v14 & 0x40) != 0)
      goto LABEL_30;
LABEL_16:
    *v15 = v14 | 0x40;
    CA::Layer::invalidate_layout((uint64_t)v11);
    v22 = CA::Layer::retain_parent(v11, (CA::Transaction *)v4);
LABEL_17:
    v16 = *(_DWORD *)v11;
    if (*(_DWORD *)v11)
    {
      do
      {
        v17 = __ldaxr((unsigned int *)v11);
        if (v17 != v16)
        {
          __clrex();
          goto LABEL_17;
        }
      }
      while (__stlxr(v16 - 1, (unsigned int *)v11));
      if (v16 == 1)
      {
        CA::Layer::destroy(v11);
        CA::Layer::~Layer((CA::AttrList **)v11);
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        malloc_zone_free(malloc_zone, v11);
      }
    }
    v11 = (CA::Layer *)v22;
    if (!v22)
      goto LABEL_34;
  }
  v15 = CA::Layer::thread_flags_(v11, (CA::Transaction *)v4);
  v14 = *v15;
  if ((*v15 & 0x40) == 0)
    goto LABEL_16;
LABEL_30:
  v20 = *(_DWORD *)v11;
  if (*(_DWORD *)v11)
  {
    do
    {
      v19 = __ldaxr((unsigned int *)v11);
      if (v19 != v20)
      {
        __clrex();
        goto LABEL_30;
      }
    }
    while (__stlxr(v20 - 1, (unsigned int *)v11));
    if (v20 == 1)
    {
      CA::Layer::destroy(v11);
      CA::Layer::~Layer((CA::AttrList **)v11);
      v21 = (malloc_zone_t *)get_malloc_zone();
      malloc_zone_free(v21, v11);
    }
  }
LABEL_34:
  CA::Transaction::unlock((CA::Transaction *)v4);
LABEL_35:
  if (BYTE3(xmmword_1ECDC6AB0) | BYTE4(xmmword_1ECDC6AB0))
    -[CALayer _saveCurrentLayoutHash](self, "_saveCurrentLayoutHash");
}

- (BOOL)needsDisplayOnBoundsChange
{
  return *((unsigned __int8 *)self->_attr.layer + 48) >> 7;
}

- (id)actionForKey:(NSString *)event
{
  CA::Transaction *v5;
  int v6;
  char *layer;
  id *v8;
  id Weak;
  id v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id i;
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v16 = 0;
  v17[0] = 0;
  layer = (char *)self->_attr.layer;
  if ((layer[57] & 0x10) != 0)
  {
    v8 = (id *)(layer + 128);
    if (layer[136])
    {
      Weak = objc_loadWeak(v8);
      if (!Weak)
        goto LABEL_9;
    }
    else
    {
      Weak = *v8;
      if (!Weak)
        goto LABEL_9;
    }
    v10 = (id)objc_msgSend(Weak, "actionForLayer:forKey:", self, event);
    if (v10)
    {
LABEL_12:
      CA::Transaction::unlock(v5);
      goto LABEL_24;
    }
  }
LABEL_9:
  v11 = *((_QWORD *)layer + 9);
  if (v11)
  {
    if (CA::AttrList::get(v11, 1, (const CGAffineTransform *)1, (CA::Mat4Impl *)v17))
    {
      v10 = (id)objc_msgSend(v17[0], "objectForKey:", event);
      if (v10)
        goto LABEL_12;
    }
  }
  if ((layer[57] & 1) != 0)
  {
    v12 = *((_QWORD *)layer + 9);
    if (!v12 || (CA::AttrList::get(v12, 534, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v16) & 1) == 0)
    {
      v13 = (objc_class *)objc_opt_class();
      CAObject_defaultValueForAtom(v13, 534, (const CGAffineTransform *)1, (uint64_t)&v16);
    }
    for (i = v16; i; v16 = i)
    {
      v17[0] = (id)objc_msgSend(i, "objectForKey:", CFSTR("actions"));
      v10 = (id)objc_msgSend(v17[0], "objectForKey:", event);
      if (v10)
        goto LABEL_12;
      i = (id)objc_msgSend(v16, "objectForKey:", CFSTR("style"));
    }
  }
  v10 = (id)-[objc_class defaultActionForKey:](object_getClass(self), "defaultActionForKey:", event);
  CA::Transaction::unlock(v5);
  if (!v10)
  {
    if ((*((_DWORD *)self->_attr.layer + 1) & 0x4000) != 0)
      v10 = +[CATransaction _implicitAnimationForLayer:keyPath:](CATransaction, "_implicitAnimationForLayer:keyPath:", self, event);
    else
      v10 = 0;
  }
LABEL_24:
  if (v10 == (id)*MEMORY[0x1E0C9B0D0])
    return 0;
  else
    return v10;
}

- (id)contents
{
  return (id)*((_QWORD *)self->_attr.layer + 18);
}

- (BOOL)needsLayoutOnGeometryChange
{
  return *((_BYTE *)self->_attr.layer + 49) & 1;
}

- (BOOL)_defersDidBecomeVisiblePostCommit
{
  return 0;
}

+ (id)defaultActionForKey:(NSString *)event
{
  return 0;
}

- (id)ancestorSharedWithLayer:(id)a3
{
  CA::Layer **p_isa;
  CA::Transaction *v5;
  CALayer *v6;
  id result;
  CALayer *v8;
  BOOL v9;
  CA::Layer **v10;

  p_isa = &self->super.isa;
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  if (a3 == p_isa)
    return a3;
  if (!a3)
    return 0;
  v6 = p_isa ? CA::Layer::superlayer(p_isa[2], v5) : 0;
  if (v6 == a3)
    return a3;
  v8 = CA::Layer::superlayer(*((CA::Layer **)a3 + 2), v5);
  v9 = v8 == (CALayer *)p_isa;
  if (v8 == (CALayer *)p_isa)
    result = p_isa;
  else
    result = 0;
  if (!v9 && p_isa)
  {
    while (2)
    {
      v10 = (CA::Layer **)a3;
      do
      {
        if (p_isa == v10)
          return p_isa;
        v10 = (CA::Layer **)CA::Layer::superlayer(v10[2], v5);
      }
      while (v10);
      p_isa = (CA::Layer **)CA::Layer::superlayer(p_isa[2], v5);
      result = 0;
      if (p_isa)
        continue;
      break;
    }
  }
  return result;
}

- (CALayer)retain
{
  CALayerRetain((uint64_t)self);
  return self;
}

- (void)setNeedsDisplay
{
  -[CALayer setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
}

- (void)setNeedsDisplayInRect:(CGRect)r
{
  void *layer;
  double height;
  double width;
  CA::Transaction *v6;
  int v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  CFTypeID v11;
  uint64_t v12;
  float64x2_t v13;
  double v14;
  float64x2_t *v16;
  CGFloat y;
  CGFloat x;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  layer = self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    height = r.size.height;
    width = r.size.width;
    y = r.origin.y;
    x = r.origin.x;
    v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    if (width != 0.0 && height != 0.0)
    {
      v8 = (void *)*((_QWORD *)layer + 2);
      v9 = (const void *)objc_msgSend(v8, "contents");
      v10 = (uint64_t)v9;
      if (v9)
      {
        v11 = CFGetTypeID(v9);
        v12 = CABackingStoreGetTypeID::type;
        if (!CABackingStoreGetTypeID::type)
        {
          v12 = _CFRuntimeRegisterClass();
          CABackingStoreGetTypeID::type = v12;
        }
        if (v11 == v12)
        {
          v13.f64[0] = x;
          v13.f64[1] = y;
          v19 = vsubq_f64(v13, *((float64x2_t *)layer + 6));
          v20 = v19;
          v21 = width;
          v22 = height;
          if ((*((_BYTE *)layer + 56) & 1) != 0)
          {
            objc_msgSend(v8, "contentsScale");
            v20 = vmulq_n_f64(v19, v14);
            width = width * v14;
            height = height * v14;
            v21 = width;
            v22 = height;
          }
          if (height <= 1.00000002e30 && width <= 1.00000002e30)
            v16 = &v20;
          else
            v16 = 0;
          CABackingStoreInvalidate(v10, (uint64_t)v16);
        }
      }
    }
    CA::Layer::mark((CA::Layer *)layer, v6, 256, 512);
    CA::Transaction::unlock(v6);
  }
}

- (CGPoint)anchorPoint
{
  void *layer;
  int v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7[3];
  uint64_t v8;
  CGPoint result;

  v8 = *MEMORY[0x1E0C80C00];
  layer = self->_attr.layer;
  *(_OWORD *)v7 = 0uLL;
  v3 = *((_DWORD *)layer + 14);
  if ((v3 & 8) != 0)
  {
    if ((v3 & 0x10) != 0)
    {
      *(_OWORD *)v7 = *MEMORY[0x1E0C9D538];
    }
    else
    {
      v4 = *((_QWORD *)layer + 9);
      if (v4)
        CA::AttrList::get(v4, 25, (const CGAffineTransform *)0x13, (CA::Mat4Impl *)v7);
    }
  }
  else
  {
    CA::Layer::default_value((id *)layer, 0x19u, (const CGAffineTransform *)0x13, (uint64_t)v7);
  }
  v6 = v7[1];
  v5 = v7[0];
  result.y = v6;
  result.x = v5;
  return result;
}

- (void)setContentsChanged
{
  CA::Transaction *v3;
  int v4;

  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  CA::Layer::property_did_change((id *)self->_attr.layer, v3, 117);
  CA::Transaction::unlock(v3);
}

- (BOOL)_scheduleAnimationTimer
{
  return 1;
}

- (CGPoint)convertPoint:(CGPoint)p toLayer:(CALayer *)l
{
  double x;
  double y;
  CGPoint v6;
  uint64_t v7;
  CGPoint result;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = p;
  CA::Layer::map_geometry((CA::Transaction *)self, l, (void (*)(uint64_t, __int128 *))applyVec2r, (void (*)(_QWORD, _QWORD))unapplyVec2r, (uint64_t)&v6);
  y = v6.y;
  x = v6.x;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)convertRect:(CGRect)r toLayer:(CALayer *)l
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  CGRect result;

  height = r.size.height;
  width = r.size.width;
  y = r.origin.y;
  x = r.origin.x;
  v18 = *MEMORY[0x1E0C80C00];
  if (!CGRectIsNull(r))
  {
    v14 = x;
    v15 = y;
    v16 = width;
    v17 = height;
    if (width < 0.0)
    {
      v14 = width + x;
      v16 = -width;
    }
    if (height < 0.0)
    {
      v15 = height + y;
      v17 = -height;
    }
    CA::Layer::map_geometry((CA::Transaction *)self, l, (void (*)(uint64_t, __int128 *))applyRect, (void (*)(_QWORD, _QWORD))unapplyRect, (uint64_t)&v14);
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)convertRect:(CGRect)r fromLayer:(CALayer *)l
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  CGRect result;

  height = r.size.height;
  width = r.size.width;
  y = r.origin.y;
  x = r.origin.x;
  v18 = *MEMORY[0x1E0C80C00];
  if (!CGRectIsNull(r))
  {
    v14 = x;
    v15 = y;
    v16 = width;
    v17 = height;
    if (width < 0.0)
    {
      v14 = width + x;
      v16 = -width;
    }
    if (height < 0.0)
    {
      v15 = height + y;
      v17 = -height;
    }
    CA::Layer::map_geometry((CA::Transaction *)l, self, (void (*)(uint64_t, __int128 *))applyRect, (void (*)(_QWORD, _QWORD))unapplyRect, (uint64_t)&v14);
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)p fromLayer:(CALayer *)l
{
  double x;
  double y;
  CGPoint v6;
  uint64_t v7;
  CGPoint result;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = p;
  CA::Layer::map_geometry((CA::Transaction *)l, self, (void (*)(uint64_t, __int128 *))applyVec2r, (void (*)(_QWORD, _QWORD))unapplyVec2r, (uint64_t)&v6);
  y = v6.y;
  x = v6.x;
  result.y = y;
  result.x = x;
  return result;
}

- (CATransform3D)transform
{
  CATransform3D *result;

  result = (CATransform3D *)self->_attr.layer;
  if ((HIBYTE(result->m23) & 0x10) != 0)
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
    CA::Layer::getter((CA::Transaction *)result, 0x22Du, (const CGAffineTransform *)0x16, (id *)retstr);
  }
  else
  {
    *retstr = CATransform3DIdentity;
  }
  return result;
}

- (CGFloat)zPosition
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x25Cu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setContentsAlignsToPixels:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x76u, 72, 158, a3, 0, 0);
}

- (void)layoutBelowIfNeeded
{
  CA::Transaction *v3;

  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  CA::Layer::layout_if_needed((CA::Layer *)self->_attr.layer, v3);
}

- (void)setNeedsDisplayOnBoundsChange:(BOOL)needsDisplayOnBoundsChange
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x186u, 39, 124, needsDisplayOnBoundsChange, 0, 0);
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  __int16 v6;
  malloc_zone_t *malloc_zone;
  _DWORD *v10;
  CA::Transaction *v11;
  uint64_t v12;
  int v13;
  CA::AttrList **layer;
  unsigned int v15;
  CA::Layer *v16;
  CA::Layer *v17;
  CA::Render::Array *v18;
  _DWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  CA::Render::Array *v22;
  dispatch_once_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int v28;
  CALayer *v29;
  char *v30;
  CA::Render::Layer *v31;
  CGImage *v32;
  uint64_t v33;
  CA::Render *v34;
  const CGAffineTransform *v35;
  const double *v36;
  int v37;
  CA::Render *v38;
  CFTypeID v39;
  CGColorSpace *v40;
  char *v41;
  unsigned __int8 *v42;
  __int128 v43;
  float64x2_t v44;
  uint64_t v45;
  uint64_t v46;
  const CA::Bounds *v47;
  float64x2_t v48;
  unsigned int v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t v52;
  int8x16_t v53;
  float64x2_t v54;
  float64x2_t v55;
  int64x2_t v56;
  int8x16_t v57;
  float64x2_t v58;
  float64x2_t v59;
  int32x4_t v60;
  CA::Shape *v61;
  CA::AttrList *v62;
  unsigned int *v63;
  unsigned int v64;
  unsigned int v65;
  const CA::Rect *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  char *v71;
  unsigned int *v72;
  unsigned int v73;
  unsigned int v74;
  CA::Render *v75;
  CA::Render *v76;
  CFTypeID v77;
  char *v78;
  unsigned int *v79;
  unsigned int v80;
  unsigned int v81;
  NSObject *v82;
  const __CFArray *v83;
  unsigned int *v84;
  unsigned int *v85;
  unsigned int v86;
  unsigned int v87;
  float v88;
  float v89;
  double v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  float v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  CA::Render::Vector *v110;
  unsigned int *v111;
  unsigned int v112;
  unsigned int v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  CA::Render::Vector *v122;
  unsigned int *v123;
  unsigned int v124;
  unsigned int v125;
  char *v126;
  unsigned int *v127;
  unsigned int v128;
  unsigned int v129;
  const CA::Rect *v130;
  double v131;
  double v132;
  double v133;
  double v134;
  char *v135;
  unsigned int *v136;
  unsigned int v137;
  unsigned int v138;
  int v139;
  unsigned int *v140;
  unsigned int *v141;
  unsigned int v142;
  unsigned int v143;
  NSArray *v144;
  unsigned int *v145;
  unsigned int *v146;
  unsigned int v147;
  unsigned int v148;
  NSArray *v149;
  unsigned int *v150;
  unsigned int *v151;
  unsigned int v152;
  unsigned int v153;
  __CFString *v154;
  CA::Render::Filter *v155;
  CA::Render::Filter *v156;
  unsigned int *v157;
  unsigned int *v158;
  unsigned int v159;
  unsigned int v160;
  const CA::Rect *v161;
  double v162;
  double v163;
  double v164;
  double v165;
  char *v166;
  unsigned int *v167;
  unsigned int v168;
  unsigned int v169;
  unsigned int *v170;
  unsigned int v171;
  unsigned int v172;
  CAMeshTransform *v173;
  uint64_t v174;
  unsigned int *v175;
  unsigned int *v176;
  unsigned int v177;
  unsigned int v178;
  id v179;
  unsigned int *v180;
  unsigned int *v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double *v190;
  int v191;
  unint64_t v192;
  unint64_t v193;
  unint64_t v194;
  float v195;
  const __CFString *v196;
  const __CFString *v197;
  unsigned int *v198;
  unsigned int *v199;
  unsigned int *v200;
  unsigned int v201;
  unsigned int v202;
  unsigned int *v203;
  unsigned int v204;
  unsigned int *v205;
  unsigned int v206;
  unsigned int *v207;
  unsigned int v208;
  unsigned int v209;
  CGColor *v210;
  CA::Render::Pattern **v211;
  __int128 v212;
  uint64_t v213;
  uint64_t v214;
  unsigned int *v215;
  _QWORD *v216;
  unsigned int *v217;
  unsigned int *v218;
  unsigned int v219;
  unsigned int v220;
  unsigned int *v221;
  unsigned int v222;
  uint64_t v223;
  unsigned int *v224;
  unsigned int v225;
  unsigned int v226;
  unsigned int v227;
  const double *v228;
  double v229;
  float v230;
  float v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  CA::Render::Vector *v236;
  unsigned int *v237;
  unsigned int v238;
  unsigned int v239;
  unint64_t *v240;
  _BOOL4 v241;
  uint64_t v242;
  _BOOL4 v243;
  uint64_t v244;
  float v245;
  double v246;
  float v247;
  double v248;
  float v249;
  double v250;
  float v251;
  double v252;
  float v253;
  CGColor *v254;
  CA::Render::Pattern **v255;
  unsigned int *v256;
  _QWORD *v257;
  unsigned int *v258;
  unsigned int *v259;
  unsigned int v260;
  unsigned int v261;
  unsigned int *v262;
  unsigned int v263;
  uint64_t v264;
  unsigned int *v265;
  unsigned int v266;
  unsigned int v267;
  CGColor *v268;
  CA::Render::Pattern **v269;
  float v271;
  float v272;
  BOOL v273;
  BOOL v274;
  float v275;
  __CFString *v277;
  int v278;
  _QWORD *v279;
  _BOOL4 v280;
  unint64_t *v281;
  uint64_t v282;
  _BOOL4 v283;
  uint64_t v284;
  _BOOL4 v285;
  uint64_t v286;
  _BOOL4 v287;
  uint64_t v288;
  _BOOL4 v289;
  uint64_t v290;
  _BOOL4 v291;
  uint64_t v292;
  _BOOL4 v293;
  uint64_t v294;
  double v295;
  float v296;
  _BOOL4 v297;
  unint64_t *v298;
  uint64_t v299;
  _BOOL4 v300;
  uint64_t v301;
  _BOOL4 v302;
  uint64_t v303;
  _BOOL4 v304;
  uint64_t v305;
  _BOOL4 v306;
  uint64_t v307;
  _BOOL4 v308;
  uint64_t v309;
  _BOOL4 v310;
  uint64_t v311;
  _BOOL4 v312;
  uint64_t v313;
  _BOOL4 v314;
  uint64_t v315;
  _BOOL4 v316;
  uint64_t v317;
  _BOOL4 v318;
  uint64_t v319;
  _BOOL4 v320;
  uint64_t v321;
  _BOOL4 v322;
  uint64_t v323;
  float v324;
  float v325;
  CGColor *v326;
  CA::Render::Pattern **v327;
  float v328;
  BOOL v329;
  float v330;
  BOOL v331;
  double v332;
  double v333;
  float v334;
  float v335;
  float *v336;
  double v337;
  float v338;
  const CGPath *v339;
  const CGPath *v340;
  CA::Render::Path *v341;
  unsigned int *v342;
  unsigned int *v343;
  unsigned int v344;
  unsigned int v345;
  _BOOL4 v346;
  uint64_t v347;
  unint64_t v348;
  _BOOL4 v349;
  uint64_t v350;
  _BOOL4 v351;
  uint64_t v352;
  float v353;
  float v354;
  CGColor *v355;
  CA::Render::Pattern **v356;
  _BOOL4 v357;
  uint64_t v358;
  double v359;
  float v360;
  _BOOL4 v361;
  unint64_t *v362;
  uint64_t v363;
  _BOOL4 v364;
  uint64_t v365;
  unsigned int v366;
  unsigned int v368;
  unsigned int v369;
  __int128 v370;
  float64x2_t v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  unsigned int *v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  uint8_t buf[16];
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  uint64_t v392;

  v6 = a4;
  v392 = *MEMORY[0x1E0C80C00];
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v10 = malloc_type_zone_calloc(malloc_zone, 1uLL, 0x98uLL, 0x743898A5uLL);
  v12 = (uint64_t)v10;
  if (v10)
  {
    v10[2] = 1;
    ++dword_1ECDC7C9C;
    *(_QWORD *)v10 = off_1E15989E0;
    *((_QWORD *)v10 + 2) = 0;
    *((_QWORD *)v10 + 3) = 0;
    v10[8] = 16843007;
    v10[9] = v10[9] & 0x80000000 | 0xF9F11;
    *((_QWORD *)v10 + 5) = *((_QWORD *)v10 + 5) & 0xFFFF800000000000 | 0x1030C0004C00;
    *((_OWORD *)v10 + 3) = 0u;
    *((_OWORD *)v10 + 4) = 0u;
    *((_OWORD *)v10 + 5) = 0u;
    *((_QWORD *)v10 + 12) = 0;
    *((_OWORD *)v10 + 7) = 0u;
    *((_OWORD *)v10 + 8) = 0u;
    *((_QWORD *)v10 + 18) = 0;
    v13 = 29;
  }
  else
  {
    v13 = MEMORY[0xC];
  }
  v10[3] = v13 | 0x200;
  layer = (CA::AttrList **)self->_attr.layer;
  if ((v6 & 8) == 0)
  {
    v15 = 0;
LABEL_464:
    *a5 = v15;
    goto LABEL_465;
  }
  v375 = a5;
  if (((_BYTE)layer[5] & 2) != 0)
  {
    v16 = CA::Layer::sublayers((CA::Layer *)layer);
    if (v16)
    {
      v17 = v16;
      v18 = (CA::Render::Array *)*((_QWORD *)v16 + 2);
      v19 = CA::Render::Array::new_array(v18, 0, 0, 1);
      if (v19)
      {
        v20 = (uint64_t)v19;
        v21 = (_QWORD *)((char *)v17 + 8);
        v374 = a3;
        if (v21[1] != 1 || v21[2])
          v21 = (_QWORD *)*v21;
        if (v18)
        {
          v22 = 0;
          v23 = CA::Render::Encoder::initialize_render_id_slide(void)::once[0];
          do
          {
            v24 = *(_QWORD *)(v21[(_QWORD)v22] + 16);
            if (v23 != -1)
              dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_11026);
            v25 = CA::Render::_render_id_slide + v24;
            if (!v24)
              v25 = 0;
            *(_QWORD *)(v20 + 8 * v22 + 24) = v25;
            v22 = (CA::Render::Array *)((char *)v22 + 1);
            v23 = -1;
          }
          while (v18 != v22);
        }
        CA::Render::Layer::set_sublayers(v12, v20);
        v26 = (unsigned int *)(v20 + 8);
        do
        {
          v27 = __ldaxr(v26);
          v28 = v27 - 1;
        }
        while (__stlxr(v28, v26));
        a3 = v374;
        if (!v28)
          (*(void (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20);
      }
    }
  }
  if (((_BYTE)layer[5] & 4) != 0)
  {
    v29 = CA::Layer::mask((CA::Layer *)self->_attr.layer);
    if (v29)
    {
      v30 = (char *)v29->_attr.layer;
      if (CA::Render::Encoder::initialize_render_id_slide(void)::once[0] != -1)
        dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_11026);
      if (v30)
        v31 = (CA::Render::Layer *)&v30[CA::Render::_render_id_slide];
      else
        v31 = 0;
      CA::Render::Layer::set_mask((CA::Render::Layer *)v12, v31);
    }
    *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFF7FLL | ((((unint64_t)*((unsigned int *)layer
                                                                                                + 12) >> 19) & 1) << 7);
  }
  v32 = (CGImage *)CA::Context::current_colorspace((CA::Context *)a3, v11);
  v33 = CAGetColorSpace(0x1Du);
  v34 = -[CALayer contents](self, "contents");
  v37 = v6 & 0x400;
  if (v37 | (_DWORD)layer[5] & 1)
  {
    v38 = v34;
    if (v34)
    {
      v39 = CFGetTypeID(v34);
      if (v39 == CGImageGetTypeID())
      {
        v40 = (CGColorSpace *)-[CALayer _renderImageCopyFlags](self, "_renderImageCopyFlags");
        *((_DWORD *)layer + 13) = (*((_DWORD *)layer + 13) & 0xFF9FFFFF | ((v40 & 1) << 21) & 0xFFBFFFFF | (((v40 >> 8) & 1) << 22)) ^ 0x400000;
        v41 = CA::Render::copy_image(v38, v32, v40, 0.0, 1.0);
      }
      else
      {
        v41 = (char *)-[CA::Render CA_copyRenderValue](v38, "CA_copyRenderValue");
      }
      v42 = (unsigned __int8 *)v41;
      if (v41)
      {
        if ((*((_BYTE *)layer + 57) & 2) != 0)
        {
          -[CALayer contentsDirtyRect](self, "contentsDirtyRect");
          v370 = v43;
          v371 = v44;
          v372 = v45;
          v373 = v46;
          if (!CGRectIsNull(*(CGRect *)&v43))
          {
            v49 = v42[12];
            if (v49 <= 0x33 && ((1 << v49) & 0x8000000800200) != 0)
            {
              v50.i64[0] = v370;
              v50.i64[1] = v372;
              v48.f64[0] = 0.0;
              v51.i64[0] = *(_QWORD *)&v371.f64[0];
              v51.i64[1] = v373;
              v52 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v48, v371).i64[0], 0);
              v53.i64[1] = v372;
              *(double *)v53.i64 = v371.f64[0] + *(double *)&v370;
              v54 = (float64x2_t)vbslq_s8(v52, v53, v50);
              v53.i64[1] = v373;
              *(double *)v53.i64 = -v371.f64[0];
              v55 = (float64x2_t)vbslq_s8(v52, v53, v51);
              if (*(double *)&v373 < 0.0)
              {
                v54.f64[1] = *(double *)&v373 + *(double *)&v372;
                v55.f64[1] = -*(double *)&v373;
              }
              v56 = vceqzq_f64(v55);
              if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v56, 1), (int8x16_t)v56).u64[0] & 0x8000000000000000) != 0
                || (v57 = vorrq_s8((int8x16_t)vcltzq_f64(v55), (int8x16_t)vcgezq_f64(v55)),
                    (vornq_s8((int8x16_t)vdupq_laneq_s64((int64x2_t)vmvnq_s8(v57), 1), v57).u64[0] & 0x8000000000000000) != 0))
              {
                memset(buf, 0, sizeof(buf));
              }
              else
              {
                v58 = vmaxnmq_f64(v54, (float64x2_t)vdupq_n_s64(0xC1BFFFFFFF000000));
                v59 = vminnmq_f64(vaddq_f64(v54, v55), (float64x2_t)vdupq_n_s64(0x41C0000000000000uLL));
                v60 = (int32x4_t)vcvtmq_s64_f64(v58);
                *(int32x4_t *)buf = vuzp1q_s32(v60, (int32x4_t)vsubq_s64(vcvtpq_s64_f64(v59), (int64x2_t)v60));
              }
              v61 = (CA::Shape *)CA::Shape::new_shape((CA::Shape *)buf, v47);
              CA::Render::Texture::set_dirty_shape((CA::Render::Texture *)v42, v61);
              CA::Shape::unref(v61);
            }
          }
          *((_DWORD *)layer + 14) &= ~0x200u;
          v62 = layer[9];
          if (v62)
            v62 = CA::AttrList::remove(v62, (const void *)0x79);
          layer[9] = v62;
        }
        CA::Render::Layer::set_contents((CA::Render::Layer *)v12, (CA::Render::Object *)v42);
        v63 = (unsigned int *)(v42 + 8);
        do
        {
          v64 = __ldaxr(v63);
          v65 = v64 - 1;
        }
        while (__stlxr(v65, v63));
        if (!v65)
          (*(void (**)(unsigned __int8 *))(*(_QWORD *)v42 + 16))(v42);
      }
    }
  }
  a5 = v375;
  if ((*((_BYTE *)layer + 42) & 8) != 0)
  {
    if (((_BYTE)layer[7] & 4) != 0)
    {
      -[CALayer cornerContentsCenter](self, "cornerContentsCenter");
      *(double *)buf = v67;
      *(double *)&buf[8] = v68;
      *(double *)&v385 = v69;
      *((double *)&v385 + 1) = v70;
      if (v69 < 0.0)
      {
        *(double *)buf = v69 + v67;
        *(double *)&v385 = -v69;
      }
      if (v70 < 0.0)
      {
        *(double *)&buf[8] = v70 + v68;
        *((double *)&v385 + 1) = -v70;
      }
      v71 = CA::Render::Vector::new_rect((CA::Render::Vector *)buf, v66);
      CA::Render::Layer::set_corner_contents_center((unsigned int *)v12, (CA::Render::Vector *)v71);
      if (v71)
      {
        v72 = (unsigned int *)(v71 + 8);
        do
        {
          v73 = __ldaxr(v72);
          v74 = v73 - 1;
        }
        while (__stlxr(v74, v72));
        if (!v74)
          (*(void (**)(char *))(*(_QWORD *)v71 + 16))(v71);
      }
    }
    v75 = -[CALayer cornerContents](self, "cornerContents", v370, *(_OWORD *)&v371);
    if (v75)
    {
      v76 = v75;
      v77 = CFGetTypeID(v75);
      if (v77 == CGImageGetTypeID())
      {
        v78 = CA::Render::copy_image(v76, 0, (CGColorSpace *)2, 0.0, 1.0);
        CA::Render::Layer::set_corner_contents((unsigned int *)v12, (CA::Render::Object *)v78);
        v79 = (unsigned int *)(v78 + 8);
        do
        {
          v80 = __ldaxr(v79);
          v81 = v80 - 1;
        }
        while (__stlxr(v81, v79));
        a5 = v375;
        if (!v81)
          (*(void (**)(char *))(*(_QWORD *)v78 + 16))(v78);
      }
      else if (x_log_hook_p())
      {
        x_log_();
        a5 = v375;
      }
      else
      {
        v82 = x_log_category_api;
        a5 = v375;
        if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_184457000, v82, OS_LOG_TYPE_DEFAULT, "cornerContents must be a CGImageRef for now!\n", buf, 2u);
        }
      }
    }
  }
  if ((*((_BYTE *)layer + 41) & 0x40) != 0)
  {
    v83 = (const __CFArray *)*((_QWORD *)self->_attr.layer + 36);
    if (v83)
    {
      v84 = CA::Render::copy_render_array(v83, 42);
      CA::Render::Layer::set_modifiers((unsigned int *)v12, v84);
      if (v84)
      {
        v85 = v84 + 2;
        do
        {
          v86 = __ldaxr(v85);
          v87 = v86 - 1;
        }
        while (__stlxr(v87, v85));
        if (!v87)
          (*(void (**)(unsigned int *))(*(_QWORD *)v84 + 16))(v84);
      }
    }
  }
  if (((_BYTE)layer[5] & 8) != 0)
  {
    *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFEFFLL | ((((unint64_t)*((unsigned int *)layer
                                                                                                + 12) >> 5) & 1) << 8);
    *(_OWORD *)(v12 + 48) = *((_OWORD *)layer + 5);
    if ((*((_BYTE *)layer + 55) & 8) != 0)
    {
      -[CALayer opacity](self, "opacity");
      if (v88 > 1.0)
        v88 = 1.0;
      if (v88 >= 0.0)
        v89 = (float)(v88 * 255.0) + 0.5;
      else
        v89 = 0.5;
      *(_BYTE *)(v12 + 32) = (int)v89;
    }
    if (((_BYTE)layer[7] & 0x40) != 0)
    {
      -[CALayer zPosition](self, "zPosition");
      if (v90 != 0.0)
        *((double *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 24) = v90;
    }
  }
  if (((_BYTE)layer[5] & 0x10) != 0)
  {
    v91 = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFBFLL | ((((unint64_t)*((unsigned int *)layer + 12) >> 9) & 1) << 6);
    *(_QWORD *)(v12 + 40) = v91;
    v92 = v91 & 0xFFFFFFFFFFFFFDFFLL | ((((unint64_t)*((unsigned int *)layer + 12) >> 11) & 1) << 9);
    *(_QWORD *)(v12 + 40) = v92;
    v93 = v92 & 0xFFFFFFFFFFFFF7FFLL | ((((unint64_t)*((unsigned int *)layer + 12) >> 26) & 1) << 11);
    *(_QWORD *)(v12 + 40) = v93;
    v94 = v93 & 0xFFFFFFFFFFFFEFFFLL | ((((unint64_t)*((unsigned int *)layer + 12) >> 27) & 1) << 12);
    *(_QWORD *)(v12 + 40) = v94;
    v95 = v94 & 0xFFFFFFFFFFFDFFFFLL | ((((unint64_t)*((unsigned int *)layer + 13) >> 12) & 1) << 17);
    *(_QWORD *)(v12 + 40) = v95;
    *(_QWORD *)(v12 + 40) = v95 & 0xFFFFFFFFFFFFDFFFLL | ((((unint64_t)*((unsigned int *)layer + 12) >> 28) & 1) << 13);
    *(_OWORD *)(v12 + 64) = *((_OWORD *)layer + 6);
    *(_OWORD *)(v12 + 80) = *((_OWORD *)layer + 7);
    v96 = *((_DWORD *)layer + 14);
    if ((v96 & 8) != 0)
    {
      -[CALayer anchorPoint](self, "anchorPoint");
      *(_QWORD *)buf = v97;
      *(_QWORD *)&buf[8] = v98;
      CA::Render::Layer::set_anchor_point((_QWORD *)v12, (uint64_t)buf);
      v96 = *((_DWORD *)layer + 14);
    }
    if ((v96 & 0x20) != 0)
    {
      -[CALayer anchorPointZ](self, "anchorPointZ");
      if (v99 != 0.0 || *(_QWORD *)(v12 + 128))
        *((double *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 23) = v99;
      v96 = *((_DWORD *)layer + 14);
    }
    if ((v96 & 1) != 0)
    {
      -[CALayer contentsScale](self, "contentsScale");
      v101 = v100;
      if (v101 != 1.0)
        CA::Render::Layer::set_contents_scale((_QWORD *)v12, v101);
    }
  }
  if (((_BYTE)layer[5] & 0x20) != 0 && (*((_BYTE *)layer + 55) & 0x10) != 0)
  {
    if (self)
    {
      -[CALayer transform](self, "transform");
      v103 = v376;
      v102 = v377;
      v105 = v378;
      v104 = v379;
      v107 = v380;
      v106 = v381;
      v109 = v382;
      v108 = v383;
    }
    else
    {
      v108 = 0uLL;
      v382 = 0u;
      v383 = 0u;
      v109 = 0uLL;
      v380 = 0u;
      v381 = 0u;
      v378 = 0u;
      v379 = 0u;
      v106 = 0uLL;
      v107 = 0uLL;
      v104 = 0uLL;
      v105 = 0uLL;
      v102 = 0uLL;
      v103 = 0uLL;
      v376 = 0u;
      v377 = 0u;
    }
    *(_OWORD *)buf = v103;
    v385 = v102;
    v386 = v105;
    v387 = v104;
    v388 = v107;
    v389 = v106;
    v390 = v109;
    v391 = v108;
    v110 = (CA::Render::Vector *)CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, buf, v36);
    CA::Render::Layer::set_transform((unsigned int *)v12, v110);
    if (v110)
    {
      v111 = (unsigned int *)((char *)v110 + 8);
      do
      {
        v112 = __ldaxr(v111);
        v113 = v112 - 1;
      }
      while (__stlxr(v113, v111));
      if (!v113)
        (*(void (**)(CA::Render::Vector *))(*(_QWORD *)v110 + 16))(v110);
    }
  }
  if (((_BYTE)layer[5] & 0x40) != 0 && (*((_BYTE *)layer + 55) & 0x20) != 0)
  {
    if (self)
    {
      -[CALayer sublayerTransform](self, "sublayerTransform");
      v115 = v376;
      v114 = v377;
      v117 = v378;
      v116 = v379;
      v119 = v380;
      v118 = v381;
      v121 = v382;
      v120 = v383;
    }
    else
    {
      v120 = 0uLL;
      v382 = 0u;
      v383 = 0u;
      v121 = 0uLL;
      v380 = 0u;
      v381 = 0u;
      v378 = 0u;
      v379 = 0u;
      v118 = 0uLL;
      v119 = 0uLL;
      v116 = 0uLL;
      v117 = 0uLL;
      v114 = 0uLL;
      v115 = 0uLL;
      v376 = 0u;
      v377 = 0u;
    }
    *(_OWORD *)buf = v115;
    v385 = v114;
    v386 = v117;
    v387 = v116;
    v388 = v119;
    v389 = v118;
    v390 = v121;
    v391 = v120;
    v122 = (CA::Render::Vector *)CA::Render::Vector::new_vector((CA::Render::Vector *)0x10, buf, v36);
    CA::Render::Layer::set_sublayer_transform((unsigned int *)v12, v122);
    if (v122)
    {
      v123 = (unsigned int *)((char *)v122 + 8);
      do
      {
        v124 = __ldaxr(v123);
        v125 = v124 - 1;
      }
      while (__stlxr(v125, v123));
      if (!v125)
        (*(void (**)(CA::Render::Vector *))(*(_QWORD *)v122 + 16))(v122);
    }
  }
  if (((_BYTE)layer[5] & 0x80) != 0 && ((_BYTE)layer[7] & 2) != 0)
  {
    if (self)
    {
      -[CALayer contentsTransform](self, "contentsTransform");
    }
    else
    {
      v385 = 0u;
      v386 = 0u;
      *(_OWORD *)buf = 0u;
    }
    v126 = CA::Render::Vector::new_affine_transform((CA::Render::Vector *)buf, v35);
    CA::Render::Layer::set_contents_transform((unsigned int *)v12, (CA::Render::Vector *)v126);
    if (v126)
    {
      v127 = (unsigned int *)(v126 + 8);
      do
      {
        v128 = __ldaxr(v127);
        v129 = v128 - 1;
      }
      while (__stlxr(v129, v127));
      if (!v129)
        (*(void (**)(char *))(*(_QWORD *)v126 + 16))(v126);
    }
  }
  if ((*((_BYTE *)layer + 41) & 1) != 0 && (*((_DWORD *)layer + 13) & 0x80000000) != 0)
  {
    -[CALayer contentsRect](self, "contentsRect");
    *(double *)buf = v162;
    *(double *)&buf[8] = v163;
    *(double *)&v385 = v164;
    *((double *)&v385 + 1) = v165;
    if (v164 < 0.0)
    {
      *(double *)buf = v164 + v162;
      *(double *)&v385 = -v164;
    }
    if (v165 < 0.0)
    {
      *(double *)&buf[8] = v165 + v163;
      *((double *)&v385 + 1) = -v165;
    }
    v166 = CA::Render::Vector::new_rect((CA::Render::Vector *)buf, v161);
    CA::Render::Layer::set_contents_rect((unsigned int *)v12, (CA::Render::Vector *)v166);
    if (v166)
    {
      v167 = (unsigned int *)(v166 + 8);
      do
      {
        v168 = __ldaxr(v167);
        v169 = v168 - 1;
      }
      while (__stlxr(v169, v167));
      if (!v169)
        (*(void (**)(char *))(*(_QWORD *)v166 + 16))(v166);
    }
  }
  if ((*((_BYTE *)layer + 42) & 2) != 0 && (*((_BYTE *)layer + 55) & 0x40) != 0)
  {
    -[CALayer contentsCenter](self, "contentsCenter");
    *(double *)buf = v131;
    *(double *)&buf[8] = v132;
    *(double *)&v385 = v133;
    *((double *)&v385 + 1) = v134;
    if (v133 < 0.0)
    {
      *(double *)buf = v133 + v131;
      *(double *)&v385 = -v133;
    }
    if (v134 < 0.0)
    {
      *(double *)&buf[8] = v134 + v132;
      *((double *)&v385 + 1) = -v134;
    }
    v135 = CA::Render::Vector::new_rect((CA::Render::Vector *)buf, v130);
    CA::Render::Layer::set_contents_center((unsigned int *)v12, (CA::Render::Vector *)v135);
    if (v135)
    {
      v136 = (unsigned int *)(v135 + 8);
      do
      {
        v137 = __ldaxr(v136);
        v138 = v137 - 1;
      }
      while (__stlxr(v138, v136));
      if (!v138)
        (*(void (**)(char *))(*(_QWORD *)v135 + 16))(v135);
    }
  }
  v139 = *((_DWORD *)layer + 10);
  if ((v139 & 0x1000) != 0)
  {
    *(_QWORD *)buf = 0;
    CA::Layer::render_timing((uint64_t)buf, (CA::Transaction *)self->_attr.layer, (CA::Transaction *)a3);
    v140 = *(unsigned int **)buf;
    CA::Render::Layer::set_timing((unsigned int *)v12, *(unsigned int **)buf);
    if (v140)
    {
      v141 = v140 + 2;
      do
      {
        v142 = __ldaxr(v141);
        v143 = v142 - 1;
      }
      while (__stlxr(v143, v141));
      if (!v143)
        (*(void (**)(unsigned int *))(*(_QWORD *)v140 + 16))(v140);
    }
    v139 = *((_DWORD *)layer + 10);
  }
  if ((v139 & 0x200) != 0)
  {
    v144 = -[CALayer filters](self, "filters");
    if (v144)
    {
      v145 = CA::Render::copy_render_array((const __CFArray *)v144, 17);
      CA::Render::Layer::set_filters((unsigned int *)v12, v145);
      if (v145)
      {
        v146 = v145 + 2;
        do
        {
          v147 = __ldaxr(v146);
          v148 = v147 - 1;
        }
        while (__stlxr(v148, v146));
        if (!v148)
          (*(void (**)(unsigned int *))(*(_QWORD *)v145 + 16))(v145);
      }
    }
  }
  if ((*((_BYTE *)layer + 41) & 4) != 0)
  {
    v149 = -[CALayer backgroundFilters](self, "backgroundFilters");
    if (v149)
    {
      v150 = CA::Render::copy_render_array((const __CFArray *)v149, 17);
      CA::Render::Layer::set_background_filters((unsigned int *)v12, v150);
      if (v150)
      {
        v151 = v150 + 2;
        do
        {
          v152 = __ldaxr(v151);
          v153 = v152 - 1;
        }
        while (__stlxr(v153, v151));
        if (!v153)
          (*(void (**)(unsigned int *))(*(_QWORD *)v150 + 16))(v150);
      }
    }
  }
  if ((*((_BYTE *)layer + 41) & 8) != 0)
  {
    v154 = -[CALayer compositingFilter](self, "compositingFilter");
    if (v154)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v155 = (CA::Render::Filter *)CAInternAtom(v154, 0);
        v156 = CA::Render::Filter::shared_filter(v155);
        if (!v156)
          goto LABEL_195;
        v157 = (unsigned int *)v156;
        v158 = (unsigned int *)((char *)v156 + 8);
        do
          v159 = __ldaxr(v158);
        while (__stlxr(v159 + 1, v158));
        if (!v159)
        {
          do
            v160 = __ldaxr(v158);
          while (__stlxr(v160 - 1, v158));
          goto LABEL_195;
        }
      }
      else
      {
        v157 = (unsigned int *)-[__CFString CA_copyRenderValue](v154, "CA_copyRenderValue");
        if (!v157)
          goto LABEL_195;
      }
      if (*((_BYTE *)v157 + 12) == 17)
        CA::Render::Layer::set_compositing_filter((unsigned int *)v12, (CA::Render::Filter *)v157);
      v170 = v157 + 2;
      do
      {
        v171 = __ldaxr(v170);
        v172 = v171 - 1;
      }
      while (__stlxr(v172, v170));
      if (!v172)
        (*(void (**)(unsigned int *))(*(_QWORD *)v157 + 16))(v157);
    }
  }
LABEL_195:
  if ((*((_BYTE *)layer + 42) & 4) != 0)
  {
    v173 = -[CALayer meshTransform](self, "meshTransform");
    if (v173)
    {
      v174 = -[CAMeshTransform CA_copyRenderValue](v173, "CA_copyRenderValue");
      v175 = (unsigned int *)v174;
      if (v174)
      {
        if (*(_BYTE *)(v174 + 12) == 33)
          CA::Render::Layer::set_mesh_transform(v12, (os_unfair_lock_s *)v174);
        v176 = v175 + 2;
        do
        {
          v177 = __ldaxr(v176);
          v178 = v177 - 1;
        }
        while (__stlxr(v178, v176));
        if (!v178)
          (*(void (**)(unsigned int *))(*(_QWORD *)v175 + 16))(v175);
      }
    }
  }
  if ((*((_BYTE *)layer + 42) & 0x10) != 0)
  {
    v179 = CA::Layer::identifiers((CA::Layer *)self->_attr.layer);
    if (v179)
    {
      v180 = CA::Render::copy_render_array((const __CFArray *)objc_msgSend(v179, "allObjects"), 49);
      CA::Render::Layer::set_identifiers((unsigned int *)v12, v180);
      if (v180)
      {
        v181 = v180 + 2;
        do
        {
          v182 = __ldaxr(v181);
          v183 = v182 - 1;
        }
        while (__stlxr(v183, v181));
        if (!v183)
          (*(void (**)(unsigned int *))(*(_QWORD *)v180 + 16))(v180);
      }
    }
  }
  v184 = *((_DWORD *)layer + 10);
  if ((v184 & 0x8000) != 0)
  {
    -[CALayer backgroundColorPhase](self, "backgroundColorPhase");
    v187 = v186;
    v188 = v185;
    if (v186 != *MEMORY[0x1E0C9D820] || v185 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v190 = (double *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12);
      v190[19] = v187;
      v190[20] = v188;
    }
    v191 = *(_DWORD *)(v12 + 36);
    v192 = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFBFFFLL | ((((unint64_t)*((unsigned int *)layer + 13) >> 11) & 1) << 14);
    *(_QWORD *)(v12 + 40) = v192;
    v193 = v192 & 0xFFFFFFFFFFFEFFFFLL | ((((unint64_t)*((unsigned int *)layer + 13) >> 8) & 1) << 16);
    *(_QWORD *)(v12 + 40) = v193;
    *(_DWORD *)(v12 + 36) = v191 & 0xFFFF0FFF | (((*((_DWORD *)layer + 11) >> 3) & 0xF) << 12);
    v194 = v193 & 0xFFFFFFFFFFFF7FFFLL | ((((unint64_t)*((unsigned int *)layer + 13) >> 10) & 1) << 15);
    *(_QWORD *)(v12 + 40) = v194;
    *(_QWORD *)(v12 + 40) = v194 & 0xFFFFFFFFFFFFFFCFLL | (16
                                                         * (((unint64_t)*((unsigned int *)layer + 12) >> 3) & 3));
    *(_DWORD *)(v12 + 36) = *(_DWORD *)(v12 + 36) & 0xFFFFFF0F | (16
                                                                * CA::Render::Layer::image_filter_from_string((const __CFString *)-[CALayer magnificationFilter](self, "magnificationFilter", v370, *(_OWORD *)&v371), 0));
    *(_DWORD *)(v12 + 36) = *(_DWORD *)(v12 + 36) & 0xFFFFFFF0 | CA::Render::Layer::image_filter_from_string((const __CFString *)-[CALayer minificationFilter](self, "minificationFilter"), (const __CFString *)1);
    -[CALayer minificationFilterBias](self, "minificationFilterBias");
    if (v195 != 0.0)
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 72) = v195;
    v196 = -[CALayer name](self, "name");
    if (v196)
    {
      v198 = CA::Render::String::new_string(v196, v197);
      v199 = *(unsigned int **)(v12 + 120);
      if (v199 != v198)
      {
        if (v199)
        {
          v200 = v199 + 2;
          do
          {
            v201 = __ldaxr(v200);
            v202 = v201 - 1;
          }
          while (__stlxr(v202, v200));
          if (!v202)
            (*(void (**)(unsigned int *))(*(_QWORD *)v199 + 16))(v199);
        }
        if (v198)
        {
          v203 = v198 + 2;
          do
            v204 = __ldaxr(v203);
          while (__stlxr(v204 + 1, v203));
          v205 = v198;
          if (!v204)
          {
            v205 = 0;
            do
              v206 = __ldaxr(v203);
            while (__stlxr(v206 - 1, v203));
          }
        }
        else
        {
          v205 = 0;
        }
        *(_QWORD *)(v12 + 120) = v205;
      }
      if (v198)
      {
        v207 = v198 + 2;
        do
        {
          v208 = __ldaxr(v207);
          v209 = v208 - 1;
        }
        while (__stlxr(v209, v207));
        if (!v209)
          (*(void (**)(unsigned int *))(*(_QWORD *)v198 + 16))(v198);
      }
    }
    v210 = -[CALayer backgroundColor](self, "backgroundColor");
    if (!v210)
      goto LABEL_265;
    *(_QWORD *)&v376 = 0;
    memset(buf, 0, sizeof(buf));
    CA::Render::convert_cgcolor_to_float(v210, v32, (CGColorSpace *)buf, (float *)&v376, v211);
    v212 = *(_OWORD *)buf;
    if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vcgtq_f32((float32x4_t)vdupq_n_s32(0x3A800000u), vabsq_f32(*(float32x4_t *)buf))))) & 1) == 0)
    {
LABEL_250:
      v215 = (unsigned int *)v376;
      if ((_QWORD)v376)
      {
        v216 = CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12);
        v217 = (unsigned int *)v216[10];
        if (v217 != v215)
        {
          if (v217)
          {
            v218 = v217 + 2;
            do
            {
              v219 = __ldaxr(v218);
              v220 = v219 - 1;
            }
            while (__stlxr(v220, v218));
            if (!v220)
              (*(void (**)(unsigned int *))(*(_QWORD *)v217 + 16))(v217);
          }
          v221 = v215 + 2;
          do
            v222 = __ldaxr(v221);
          while (__stlxr(v222 + 1, v221));
          if (!v222)
          {
            v215 = 0;
            do
              v368 = __ldaxr(v221);
            while (__stlxr(v368 - 1, v221));
          }
          v216[10] = v215;
        }
        v223 = v376;
        v224 = (unsigned int *)(v376 + 8);
        do
        {
          v225 = __ldaxr(v224);
          v226 = v225 - 1;
        }
        while (__stlxr(v226, v224));
        if (!v226)
          (*(void (**)(uint64_t))(*(_QWORD *)v223 + 16))(v223);
      }
LABEL_265:
      v227 = *((_DWORD *)layer + 11);
      if (((v227 >> 7) & 0xF) != 0xF)
      {
        *(_DWORD *)(v12 + 36) = *(_DWORD *)(v12 + 36) & 0xFFFFF0FF | (((v227 >> 7) & 0xF) << 8);
        v227 = *((_DWORD *)layer + 11);
      }
      if (((v227 >> 11) & 0xF) != 0xF)
      {
        *(_DWORD *)(v12 + 36) = *(_DWORD *)(v12 + 36) & 0xFFF0FFFF | (((v227 >> 11) & 0xF) << 16);
        v227 = *((_DWORD *)layer + 11);
      }
      if (((v227 >> 15) & 0x7FF) != 0)
      {
        *(_DWORD *)(v12 + 36) = *(_DWORD *)(v12 + 36) & 0x800FFFFF | (((v227 >> 15) & 0x7FF) << 20);
        v227 = *((_DWORD *)layer + 11);
      }
      if (v227 >> 30)
        *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFF3 | (v227 >> 28) & 0xC;
      -[CALayer cornerRadius](self, "cornerRadius");
      if (v229 != 0.0)
      {
        v230 = v229;
        v231 = v230 >= 0.0 ? v230 : 0.0;
        if (v231 != 0.0 || *(_QWORD *)(v12 + 128))
          *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 57) = v231;
      }
      if ((*((_BYTE *)layer + 59) & 1) != 0)
      {
        v232 = 0uLL;
        v386 = 0u;
        v387 = 0u;
        *(_OWORD *)buf = 0u;
        v385 = 0u;
        v233 = 0uLL;
        v234 = 0uLL;
        v235 = 0uLL;
        if (self)
        {
          -[CALayer cornerRadii](self, "cornerRadii");
          v232 = *(_OWORD *)buf;
          v233 = v385;
          v234 = v386;
          v235 = v387;
        }
        v376 = v232;
        v377 = v233;
        v378 = v234;
        v379 = v235;
        v236 = (CA::Render::Vector *)CA::Render::Vector::new_vector((CA::Render::Vector *)8, &v376, v228);
        CA::Render::Layer::set_corner_radii((unsigned int *)v12, v236);
        if (v236)
        {
          v237 = (unsigned int *)((char *)v236 + 8);
          do
          {
            v238 = __ldaxr(v237);
            v239 = v238 - 1;
          }
          while (__stlxr(v239, v237));
          if (!v239)
            (*(void (**)(CA::Render::Vector *))(*(_QWORD *)v236 + 16))(v236);
        }
      }
      v240 = (unint64_t *)(v12 + 40);
      *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFFFCLL | ((unint64_t)*((unsigned int *)layer
                                                                                                + 12) >> 1) & 3;
      v241 = -[CALayer cornerContentsMasksEdges](self, "cornerContentsMasksEdges");
      v242 = 0x20000000000;
      if (!v241)
        v242 = 0;
      *v240 = *v240 & 0xFFFFFDFFFFFFFFFFLL | v242;
      v243 = -[CALayer contentsContainsSubtitles](self, "contentsContainsSubtitles");
      v244 = 0x80000000000;
      if (!v243)
        v244 = 0;
      *v240 = *v240 & 0xFFFFF7FFFFFFFFFFLL | v244;
      -[CALayer gain](self, "gain");
      if (v245 != 1.0 || *(_QWORD *)(v12 + 128))
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 73) = v245;
      -[CALayer contentsEDRStrength](self, "contentsEDRStrength");
      v247 = v246;
      if (v247 != 1.0 || *(_QWORD *)(v12 + 128))
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 64) = v247;
      -[CALayer contentsMaximumDesiredEDR](self, "contentsMaximumDesiredEDR");
      v249 = v248;
      if (v249 != 0.0 || *(_QWORD *)(v12 + 128))
        *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 65) = v249;
      -[CALayer borderWidth](self, "borderWidth");
      if (v250 > 0.0)
      {
        v251 = v250;
        if (v251 > 0.0 || *(_QWORD *)(v12 + 128))
          *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 59) = v251;
      }
      -[CALayer borderOffset](self, "borderOffset");
      if (v252 != 0.0)
      {
        v253 = v252;
        if (v253 != 0.0 || *(_QWORD *)(v12 + 128))
          *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 58) = v253;
      }
      v254 = -[CALayer borderColor](self, "borderColor");
      if (v254 && (v254 != (CGColor *)black || v32 != (CGImage *)v33))
      {
        *(_QWORD *)&v376 = 0;
        memset(buf, 0, sizeof(buf));
        CA::Render::convert_cgcolor_to_float(v254, v32, (CGColorSpace *)buf, (float *)&v376, v255);
        if (fabsf(*(float *)buf) >= 0.00097656
          || fabsf(*(float *)&buf[4]) >= 0.00097656
          || fabsf(*(float *)&buf[8]) >= 0.00097656
          || fabsf(*(float *)&buf[12] + -1.0) >= 0.00097656)
        {
          CA::Render::Layer::set_border_color((CA::Render::Layer *)v12, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
        }
        v256 = (unsigned int *)v376;
        if ((_QWORD)v376)
        {
          v257 = CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12);
          v258 = (unsigned int *)v257[16];
          if (v258 != v256)
          {
            if (v258)
            {
              v259 = v258 + 2;
              do
              {
                v260 = __ldaxr(v259);
                v261 = v260 - 1;
              }
              while (__stlxr(v261, v259));
              if (!v261)
                (*(void (**)(unsigned int *))(*(_QWORD *)v258 + 16))(v258);
            }
            v262 = v256 + 2;
            do
              v263 = __ldaxr(v262);
            while (__stlxr(v263 + 1, v262));
            if (!v263)
            {
              v256 = 0;
              do
                v369 = __ldaxr(v262);
              while (__stlxr(v369 - 1, v262));
            }
            v257[16] = v256;
          }
          v264 = v376;
          v265 = (unsigned int *)(v376 + 8);
          do
          {
            v266 = __ldaxr(v265);
            v267 = v266 - 1;
          }
          while (__stlxr(v267, v265));
          if (!v267)
            (*(void (**)(uint64_t))(*(_QWORD *)v264 + 16))(v264);
        }
      }
      v268 = -[CALayer contentsMultiplyColor](self, "contentsMultiplyColor");
      if (v268)
      {
        if (v268 != (CGColor *)white || v32 != (CGImage *)v33)
        {
          memset(buf, 0, sizeof(buf));
          CA::Render::convert_cgcolor_to_float(v268, v32, (CGColorSpace *)buf, 0, v269);
          v271 = fabsf(*(float *)&buf[4] + -1.0);
          v272 = fabsf(*(float *)&buf[8] + -1.0);
          v273 = fabsf(*(float *)buf + -1.0) < 0.00097656 && v271 < 0.00097656;
          v274 = v273 && v272 < 0.00097656;
          v275 = fabsf(*(float *)&buf[12] + -1.0);
          if (!v274 || v275 >= 0.00097656)
            CA::Render::Layer::set_contents_multiply_color((CA::Render::Layer *)v12, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
        }
      }
      v277 = -[CALayer contentsSwizzle](self, "contentsSwizzle");
      if (v277 != CFSTR("RGBA"))
      {
        v278 = -[__CFString isEqualToString:](v277, "isEqualToString:", CFSTR("AAAA"));
        if (((*(_QWORD *)(v12 + 128) == 0) & ~v278) == 0)
        {
          v279 = CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12);
          *((_BYTE *)v279 + 320) = v279[40] & 0xFE | v278;
        }
      }
      v280 = -[CALayer isDoubleSided](self, "isDoubleSided");
      v281 = (unint64_t *)(v12 + 40);
      v282 = 1024;
      if (!v280)
        v282 = 0;
      *v281 = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFFFFFBFFLL | v282;
      v283 = -[CALayer shouldRasterize](self, "shouldRasterize");
      v284 = 0x40000;
      if (!v283)
        v284 = 0;
      *v281 = *v281 & 0xFFFFFFFFFFFBFFFFLL | v284;
      v285 = -[CALayer shouldFlatten](self, "shouldFlatten");
      v286 = 0x80000;
      if (!v285)
        v286 = 0;
      *v281 = *v281 & 0xFFFFFFFFFFF7FFFFLL | v286;
      v287 = -[CALayer shouldReflatten](self, "shouldReflatten");
      v288 = 0x100000;
      if (!v287)
        v288 = 0;
      *v281 = *v281 & 0xFFFFFFFFFFEFFFFFLL | v288;
      v289 = -[CALayer rasterizationPrefersDisplayCompositing](self, "rasterizationPrefersDisplayCompositing");
      v290 = 0x200000;
      if (!v289)
        v290 = 0;
      *v281 = *v281 & 0xFFFFFFFFFFDFFFFFLL | v290;
      v291 = -[CALayer rasterizationPrefersWindowServerAwareBackdrops](self, "rasterizationPrefersWindowServerAwareBackdrops");
      v292 = 0x400000;
      if (!v291)
        v292 = 0;
      *v281 = *v281 & 0xFFFFFFFFFFBFFFFFLL | v292;
      v293 = -[CALayer preloadsCache](self, "preloadsCache");
      v294 = 0x800000;
      if (!v293)
        v294 = 0;
      *v281 = *v281 & 0xFFFFFFFFFF7FFFFFLL | v294;
      -[CALayer rasterizationScale](self, "rasterizationScale");
      if (v295 != 1.0)
      {
        v296 = v295;
        CA::Render::Layer::set_rasterization_scale((_QWORD *)v12, v296);
      }
      v297 = -[CALayer createsCompositingGroup](self, "createsCompositingGroup");
      v298 = (unint64_t *)(v12 + 40);
      v299 = 0x1000000;
      if (!v297)
        v299 = 0;
      *v298 = *(_QWORD *)(v12 + 40) & 0xFFFFFFFFFEFFFFFFLL | v299;
      v300 = -[CALayer allowsEdgeAntialiasing](self, "allowsEdgeAntialiasing");
      v301 = 0x4000000;
      if (!v300)
        v301 = 0;
      *v298 = *v298 & 0xFFFFFFFFFBFFFFFFLL | v301;
      v302 = -[CALayer allowsGroupOpacity](self, "allowsGroupOpacity");
      v303 = 0x20000000;
      if (!v302)
        v303 = 0;
      *v298 = *v298 & 0xFFFFFFFFDFFFFFFFLL | v303;
      v304 = -[CALayer allowsDisplayCompositing](self, "allowsDisplayCompositing");
      v305 = 0x2000000;
      if (!v304)
        v305 = 0;
      *v298 = *v298 & 0xFFFFFFFFFDFFFFFFLL | v305;
      v306 = -[CALayer wantsExtendedDynamicRangeContent](self, "wantsExtendedDynamicRangeContent");
      v307 = 0x8000000;
      if (!v306)
        v307 = 0;
      *v298 = *v298 & 0xFFFFFFFFF7FFFFFFLL | v307;
      v308 = -[CALayer toneMapToStandardDynamicRange](self, "toneMapToStandardDynamicRange");
      v309 = 0x10000000;
      if (!v308)
        v309 = 0;
      *v298 = *v298 & 0xFFFFFFFFEFFFFFFFLL | v309;
      v310 = -[CALayer allowsGroupBlending](self, "allowsGroupBlending");
      v311 = 0x40000000;
      if (!v310)
        v311 = 0;
      *v298 = *v298 & 0xFFFFFFFFBFFFFFFFLL | v311;
      v312 = -[CALayer allowsHitTesting](self, "allowsHitTesting");
      v313 = 0x80000000;
      if (!v312)
        v313 = 0;
      *v298 = *v298 & 0xFFFFFFFF7FFFFFFFLL | v313;
      v314 = -[CALayer hitTestsContentsAlphaChannel](self, "hitTestsContentsAlphaChannel");
      v315 = 0x100000000;
      if (!v314)
        v315 = 0;
      *v298 = *v298 & 0xFFFFFFFEFFFFFFFFLL | v315;
      v316 = -[CALayer hitTestsAsOpaque](self, "hitTestsAsOpaque");
      v317 = 0x8000000000;
      if (!v316)
        v317 = 0;
      *v298 = *v298 & 0xFFFFFF7FFFFFFFFFLL | v317;
      v318 = -[CALayer literalContentsCenter](self, "literalContentsCenter");
      v319 = 0x10000000000;
      if (!v318)
        v319 = 0;
      *v298 = *v298 & 0xFFFFFEFFFFFFFFFFLL | v319;
      v320 = -[CALayer inheritsTiming](self, "inheritsTiming");
      v321 = 0x100000000000;
      if (!v320)
        v321 = 0;
      *v298 = *v298 & 0xFFFFEFFFFFFFFFFFLL | v321;
      v322 = -[CALayer definesDisplayRegionOfInterest](self, "definesDisplayRegionOfInterest");
      v323 = 0x200000000000;
      if (!v322)
        v323 = 0;
      *v298 = *v298 & 0xFFFFDFFFFFFFFFFFLL | v323;
      v184 = *((_DWORD *)layer + 10);
      goto LABEL_394;
    }
    *(_OWORD *)(v12 + 16) = *(_OWORD *)buf;
    if (*((float *)&v212 + 2) == 0.0 && *(float *)&v212 == 0.0 && *((float *)&v212 + 1) == 0.0)
    {
      v213 = *(_QWORD *)(v12 + 40);
      if (*((float *)&v212 + 3) == 0.0)
      {
        v214 = 0;
LABEL_249:
        *(_QWORD *)(v12 + 40) = v214 | v213 & 0xFFFFFBFFFFFFFFFFLL;
        goto LABEL_250;
      }
    }
    else
    {
      v213 = *(_QWORD *)(v12 + 40);
    }
    v214 = 0x40000000000;
    goto LABEL_249;
  }
LABEL_394:
  if ((v184 & 0x2000) != 0)
  {
    -[CALayer shadowOpacity](self, "shadowOpacity");
    if (v324 > 1.0)
      v324 = 1.0;
    if (v324 >= 0.0)
      v325 = (float)(v324 * 255.0) + 0.5;
    else
      v325 = 0.5;
    *(_BYTE *)(v12 + 33) = (int)v325;
    v326 = -[CALayer shadowColor](self, "shadowColor", v370, *(_OWORD *)&v371);
    if (v326 && (v326 != (CGColor *)black || v32 != (CGImage *)v33))
    {
      memset(buf, 0, sizeof(buf));
      CA::Render::convert_cgcolor_to_float(v326, v32, (CGColorSpace *)buf, 0, v327);
      if (fabsf(*(float *)buf) >= 0.00097656
        || ((v328 = fabsf(*(float *)&buf[8]), fabsf(*(float *)&buf[4]) < 0.00097656)
          ? (v329 = v328 < 0.00097656)
          : (v329 = 0),
            (v330 = fabsf(*(float *)&buf[12] + -1.0), v329) ? (v331 = v330 < 0.00097656) : (v331 = 0),
            !v331))
      {
        CA::Render::Layer::set_shadow_color((CA::Render::Layer *)v12, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
      }
    }
    -[CALayer shadowOffset](self, "shadowOffset");
    if (v332 != 0.0 || v333 != -3.0)
    {
      v334 = v332;
      v335 = v333;
      if (v334 != 0.0 || v335 != -3.0 || *(_QWORD *)(v12 + 128))
      {
        v336 = (float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12);
        v336[54] = v334;
        v336[55] = v335;
      }
    }
    -[CALayer shadowRadius](self, "shadowRadius");
    v338 = v337;
    if (v338 != 3.0)
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 56) = v338;
    v339 = -[CALayer shadowPath](self, "shadowPath");
    if (v339)
    {
      v341 = (CA::Render::Path *)CA::Render::Path::new_path(v339, v340);
      if (v341)
      {
        v342 = (unsigned int *)v341;
        CA::Render::Layer::set_shadow_path((unsigned int *)v12, v341);
        v343 = v342 + 2;
        do
        {
          v344 = __ldaxr(v343);
          v345 = v344 - 1;
        }
        while (__stlxr(v345, v343));
        if (!v345)
          (*(void (**)(unsigned int *))(*(_QWORD *)v342 + 16))(v342);
      }
    }
    v346 = -[CALayer invertsShadow](self, "invertsShadow");
    v347 = 0x200000000;
    if (!v346)
      v347 = 0;
    *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFFDFFFFFFFFLL | v347;
    if (-[CALayer cornerContents](self, "cornerContents"))
    {
      v348 = *(_QWORD *)(v12 + 40) & 0xFFFFFFFBFFFFFFFFLL;
    }
    else
    {
      v349 = -[CALayer shadowPathIsBounds](self, "shadowPathIsBounds");
      v350 = 0x400000000;
      if (!v349)
        v350 = 0;
      v348 = *(_QWORD *)(v12 + 40) & 0xFFFFFFFBFFFFFFFFLL | v350;
    }
    *(_QWORD *)(v12 + 40) = v348;
    v351 = -[CALayer punchoutShadow](self, "punchoutShadow");
    v352 = 0x800000000;
    if (!v351)
      v352 = 0;
    *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFF7FFFFFFFFLL | v352;
    -[CALayer rimOpacity](self, "rimOpacity");
    if (v353 > 1.0)
      v353 = 1.0;
    if (v353 >= 0.0)
      v354 = v353;
    else
      v354 = 0.0;
    if (v354 > 0.0 || *(_QWORD *)(v12 + 128))
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 79) = v354;
    v355 = -[CALayer rimColor](self, "rimColor");
    if (v355 && (v355 != (CGColor *)black || v32 != (CGImage *)v33))
    {
      memset(buf, 0, sizeof(buf));
      CA::Render::convert_cgcolor_to_float(v355, v32, (CGColorSpace *)buf, 0, v356);
      if (fabsf(*(float *)buf) >= 0.00097656
        || fabsf(*(float *)&buf[4]) >= 0.00097656
        || fabsf(*(float *)&buf[8]) >= 0.00097656
        || fabsf(*(float *)&buf[12] + -1.0) >= 0.00097656)
      {
        CA::Render::Layer::set_rim_color((CA::Render::Layer *)v12, *(float *)buf, *(float *)&buf[4], *(float *)&buf[8], *(float *)&buf[12]);
      }
    }
    v357 = -[CALayer rimPathIsBounds](self, "rimPathIsBounds");
    v358 = 0x1000000000;
    if (!v357)
      v358 = 0;
    *(_QWORD *)(v12 + 40) = *(_QWORD *)(v12 + 40) & 0xFFFFFFEFFFFFFFFFLL | v358;
    -[CALayer rimWidth](self, "rimWidth");
    v360 = v359;
    if (v360 != 0.0 && (v360 > 0.0 || *(_QWORD *)(v12 + 128)))
      *((float *)CA::Render::Layer::ensure_ext((CA::Render::Layer *)v12) + 74) = v360;
    v361 = -[CALayer borderPathIsBounds](self, "borderPathIsBounds");
    v362 = (unint64_t *)(v12 + 40);
    v363 = 0x2000000000;
    if (!v361)
      v363 = 0;
    *v362 = *(_QWORD *)(v12 + 40) & 0xFFFFFFDFFFFFFFFFLL | v363;
    v364 = -[CALayer softRim](self, "softRim");
    v365 = 0x4000000000;
    if (!v364)
      v365 = 0;
    *v362 = *v362 & 0xFFFFFFBFFFFFFFFFLL | v365;
    v184 = *((_DWORD *)layer + 10);
  }
  v366 = v184 & 0x1FFFFF;
  *a5 = v366;
  if (v37)
  {
    v15 = v366 | 1;
    goto LABEL_464;
  }
LABEL_465:
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x10000) != 0)
    *(_DWORD *)(v12 + 12) |= 0x100u;
  if ((*((_BYTE *)layer + 51) & 0x40) != 0)
    *a5 |= 0x400000u;
  if ((*((_BYTE *)layer + 54) & 0x10) != 0)
    *a5 |= 0x200000u;
  return (void *)v12;
}

- (float)opacity
{
  CA::Transaction *layer;
  float result;
  float v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  layer = (CA::Transaction *)self->_attr.layer;
  result = 1.0;
  if ((*((_BYTE *)layer + 55) & 8) != 0)
  {
    v4 = 0.0;
    CA::Layer::getter(layer, 0x190u, (const CGAffineTransform *)0x11, (id *)&v4);
    return v4;
  }
  return result;
}

- (CGColorRef)backgroundColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x34u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (CGFloat)contentsScale
{
  void *layer;
  unsigned int v3;
  uint64_t v4;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  layer = self->_attr.layer;
  v3 = (*((_DWORD *)layer + 11) >> 26) & 3;
  v6[0] = 0.0;
  if (v3)
    return (double)v3;
  if ((*((_BYTE *)layer + 56) & 1) != 0)
  {
    v4 = *((_QWORD *)layer + 9);
    if (!v4 || (CA::AttrList::get(v4, 134, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v6) & 1) == 0)
      CA::Layer::default_value((id *)layer, 0x86u, (const CGAffineTransform *)0x12, (uint64_t)v6);
  }
  else
  {
    v6[0] = 1.0;
  }
  return v6[0];
}

- (CALayerContentsFilter)minificationFilter
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x17Cu, (const CGAffineTransform *)3, v3);
  return (CALayerContentsFilter)v3[0];
}

- (NSString)contentsSwizzle
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x88u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (CGFloat)cornerRadius
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x92u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (NSString)name
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x184u, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (CGFloat)rasterizationScale
{
  void *layer;
  unsigned int v3;
  uint64_t v4;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  layer = self->_attr.layer;
  v3 = (*((_DWORD *)layer + 11) >> 28) & 3;
  v6[0] = 0.0;
  if (v3)
    return (double)v3;
  v4 = *((_QWORD *)layer + 9);
  if (!v4 || (CA::AttrList::get(v4, 447, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)v6) & 1) == 0)
    CA::Layer::default_value((id *)layer, 0x1BFu, (const CGAffineTransform *)0x12, (uint64_t)v6);
  return v6[0];
}

- (CGFloat)borderWidth
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x43u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGColor)contentsMultiplyColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x83u, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (CGColorRef)borderColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x40u, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (BOOL)shouldRasterize
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 4) & 1;
}

- (BOOL)allowsDisplayCompositing
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 3) & 1;
}

- (double)contentsMaximumDesiredEDR
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x82u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)inheritsTiming
{
  return (*((unsigned __int8 *)self->_attr.layer + 54) >> 1) & 1;
}

- (BOOL)allowsHitTesting
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 2) & 1;
}

- (CALayerContentsFilter)magnificationFilter
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x16Cu, (const CGAffineTransform *)3, v3);
  return (CALayerContentsFilter)v3[0];
}

- (BOOL)allowsGroupBlending
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 6) & 1;
}

- (BOOL)allowsGroupOpacity
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 1) & 1;
}

- (float)minificationFilterBias
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x17Du, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (double)contentsEDRStrength
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x7Bu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)toneMapToStandardDynamicRange
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 5) & 1;
}

- (float)gain
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xF1u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (BOOL)treatRec709AsSRGB
{
  return (*((unsigned __int8 *)self->_attr.layer + 54) >> 3) & 1;
}

- (BOOL)allowsEdgeAntialiasing
{
  return *((_DWORD *)self->_attr.layer + 13) & 1;
}

- (BOOL)preloadsCache
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 1) & 1;
}

- (BOOL)literalContentsCenter
{
  return *((_BYTE *)self->_attr.layer + 54) & 1;
}

- (BOOL)hitTestsContentsAlphaChannel
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 6) & 1;
}

- (BOOL)definesDisplayRegionOfInterest
{
  return (*((unsigned __int8 *)self->_attr.layer + 54) >> 2) & 1;
}

- (BOOL)createsCompositingGroup
{
  return *((_DWORD *)self->_attr.layer + 12) >> 31;
}

- (BOOL)wantsExtendedDynamicRangeContent
{
  return (*((unsigned __int8 *)self->_attr.layer + 52) >> 4) & 1;
}

- (BOOL)shouldReflatten
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 6) & 1;
}

- (BOOL)shouldFlatten
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 5) & 1;
}

- (BOOL)rasterizationPrefersWindowServerAwareBackdrops
{
  return *((_BYTE *)self->_attr.layer + 51) & 1;
}

- (BOOL)rasterizationPrefersDisplayCompositing
{
  return *((unsigned __int8 *)self->_attr.layer + 50) >> 7;
}

- (BOOL)isDoubleSided
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 4) & 1;
}

- (BOOL)cornerContentsMasksEdges
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 5) & 1;
}

- (BOOL)contentsContainsSubtitles
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 1) & 1;
}

- (CGSize)backgroundColorPhase
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x35u, (const CGAffineTransform *)0x14, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hitTestsAsOpaque
{
  return *((unsigned __int8 *)self->_attr.layer + 53) >> 7;
}

- (id)cornerContents
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x8Du, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (CGPathRef)shadowPath
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1EDu, (const CGAffineTransform *)2, v3);
  return (CGPathRef)v3[0];
}

- (CGColor)rimColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1D2u, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (CGColorRef)shadowColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1EAu, (const CGAffineTransform *)2, v3);
  return (CGColorRef)v3[0];
}

- (double)rimWidth
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1D5u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (CGFloat)shadowRadius
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1EFu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (float)rimOpacity
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1D3u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CGSize)shadowOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1EBu, (const CGAffineTransform *)0x14, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)softRim
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 2) & 1;
}

- (BOOL)rimPathIsBounds
{
  return *((_BYTE *)self->_attr.layer + 50) & 1;
}

- (BOOL)punchoutShadow
{
  return *((unsigned __int8 *)self->_attr.layer + 49) >> 7;
}

- (BOOL)invertsShadow
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 5) & 1;
}

- (BOOL)borderPathIsBounds
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 1) & 1;
}

- (BOOL)shadowPathIsBounds
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 6) & 1;
}

- (CGRect)contentsCenter
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  double v7[3];
  uint64_t v8;
  CGRect result;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  *(_OWORD *)v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x77u, (const CGAffineTransform *)0x15, (id *)&v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = v7[1];
  v4 = v7[0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSArray)backgroundFilters
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x36u, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (CGRect)contentsDirtyRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  double v7[3];
  uint64_t v8;
  CGRect result;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  *(_OWORD *)v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x79u, (const CGAffineTransform *)0x15, (id *)&v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = v7[1];
  v4 = v7[0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentsTransform:(CGAffineTransform *)a3
{
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x89, (const CGAffineTransform *)0x17, &a3->a);
}

- (void)setMaskedCorners:(CACornerMask)maskedCorners
{
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x170u, 0xBu, 0xA8u, 15, maskedCorners);
}

- (void)insertSublayer:(CALayer *)layer atIndex:(unsigned int)idx
{
  CALayer *v6;
  _QWORD *v7;
  _QWORD *v8;
  CA::Transaction *v9;
  int v10;

  if (layer)
  {
    v6 = self;
    v7 = self->_attr.layer;
    if ((*((_DWORD *)v7 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v7[2]);
    v8 = layer->_attr.layer;
    if ((*((_DWORD *)v8 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v8[2]);
    v9 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    v10 = *((_DWORD *)v9 + 25);
    *((_DWORD *)v9 + 25) = v10 + 1;
    if (!v10)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    CA::Layer::insert_sublayer((CA::Layer *)v6->_attr.layer, v9, layer, idx);
    CA::Transaction::unlock(v9);
  }
}

- (void)dealloc
{
  unsigned int *layer;
  unsigned int v4;
  unsigned int v5;
  malloc_zone_t *malloc_zone;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CAMediaTimingInvalidate((uint64_t)self);
  layer = (unsigned int *)self->_attr.layer;
  if (layer)
  {
LABEL_2:
    v4 = *layer;
    if (*layer)
    {
      do
      {
        v5 = __ldaxr(layer);
        if (v5 != v4)
        {
          __clrex();
          goto LABEL_2;
        }
      }
      while (__stlxr(v4 - 1, layer));
      if (v4 == 1)
      {
        CA::Layer::destroy((CA::Layer *)layer);
        CA::Layer::~Layer((CA::AttrList **)layer);
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        malloc_zone_free(malloc_zone, layer);
      }
    }
  }
  self->_attr.magic = 1279351128;
  v7.receiver = self;
  v7.super_class = (Class)CALayer;
  -[CALayer dealloc](&v7, sel_dealloc);
}

- (CGColorSpace)_retainColorSpace
{
  int *v2;
  CA::Context *v3;
  CGColorSpace *v4;
  CGColorSpace *v6;

  v2 = CA::Layer::retain_context((CA::Layer *)self->_attr.layer);
  if (v2)
  {
    v3 = (CA::Context *)v2;
    v4 = CGColorSpaceRetain(*((CGColorSpaceRef *)v2 + 14));
    CA::Context::unref(v3, 0);
    return v4;
  }
  else
  {
    v6 = (CGColorSpace *)CAGetColorSpace(0x1Du);
    return CGColorSpaceRetain(v6);
  }
}

- (id)context
{
  id result;
  CA::Context *v3;
  id *v4;
  id Weak;
  id v6;

  result = CA::Layer::retain_context((CA::Layer *)self->_attr.layer);
  if (result)
  {
    v3 = (CA::Context *)result;
    v4 = (id *)((char *)result + 80);
    if (*((_BYTE *)v3 + 88))
      Weak = objc_loadWeak(v4);
    else
      Weak = *v4;
    v6 = Weak;
    CA::Context::unref(v3, 0);
    return v6;
  }
  return result;
}

- (void)addSublayer:(CALayer *)layer
{
  CALayer *v4;
  _QWORD *v5;
  _QWORD *v6;
  CA::Transaction *v7;
  int v8;

  if (layer)
  {
    v4 = self;
    v5 = self->_attr.layer;
    if ((*((_DWORD *)v5 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v5[2]);
    v6 = layer->_attr.layer;
    if ((*((_DWORD *)v6 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v6[2]);
    v7 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    v8 = *((_DWORD *)v7 + 25);
    *((_DWORD *)v7 + 25) = v8 + 1;
    if (!v8)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    CA::Layer::insert_sublayer((CA::Layer *)v4->_attr.layer, v7, layer, 0xFFFFFFFFFFFFFFFFLL);
    CA::Transaction::unlock(v7);
  }
}

- (void)setObservationInfo:(void *)a3
{
  self->_attr._objc_observation_info = a3;
}

- (BOOL)allowsWeakReference
{
  return self->_attr.refcount != 0;
}

- (BOOL)retainWeakReference
{
  return CALayerRetain((uint64_t)self) != 0;
}

- (void)setContentsGravity:(CALayerContentsGravity)contentsGravity
{
  int v4;

  v4 = CA::Render::Layer::gravity_from_string((const __CFString *)contentsGravity, (const __CFString *)a2);
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x81u, 3u, 0x77u, 15, v4);
}

- (void)setContentsFormat:(CALayerContentsFormat)contentsFormat
{
  int v4;

  v4 = CA::Render::Layer::contents_format_from_string((const __CFString *)contentsFormat, (const __CFString *)a2);
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x7Cu, 0, 0x76u, 7, v4);
}

+ (id)defaultValueForKey:(NSString *)key
{
  int v3;
  int v4;
  CGColorRef v5;
  CGColorSpace *v6;
  const char *v7;
  const __CFString *v8;
  const __CFString *v9;
  char *v10;
  int v11;
  id *v12;
  void *v13;
  uint64_t v14;
  int *v15;
  int v16;
  CGColorSpace *v17;

  v3 = CAInternAtom((const __CFString *)key, 0);
  v4 = v3;
  if (v3 <= 186)
  {
    if (v3 > 52)
    {
      v5 = (CGColorRef)CFSTR("RGBA8");
      switch(v3)
      {
        case 119:
        case 133:
          v5 = (CGColorRef)+[CALayer defaultValueForKey:]::unitRect;
          if (!+[CALayer defaultValueForKey:]::unitRect)
          {
            v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.0, 0.0, 1.0, 1.0);
            +[CALayer defaultValueForKey:]::unitRect = (uint64_t)v5;
          }
          return v5;
        case 120:
        case 122:
        case 125:
        case 126:
        case 127:
        case 128:
        case 132:
        case 137:
        case 138:
        case 139:
        case 140:
        case 141:
        case 143:
          goto LABEL_58;
        case 121:
          v5 = (CGColorRef)+[CALayer defaultValueForKey:]::nullRect;
          if (!+[CALayer defaultValueForKey:]::nullRect)
          {
            v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
            +[CALayer defaultValueForKey:]::nullRect = (uint64_t)v5;
          }
          return v5;
        case 123:
        case 134:
          goto LABEL_40;
        case 124:
          return v5;
        case 129:
          return CFSTR("resize");
        case 130:
          v5 = (CGColorRef)+[CALayer defaultValueForKey:]::zero;
          if (!+[CALayer defaultValueForKey:]::zero)
          {
            v5 = (CGColorRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
            +[CALayer defaultValueForKey:]::zero = (uint64_t)v5;
          }
          return v5;
        case 131:
          v5 = (CGColorRef)white;
          if (!white)
          {
            v17 = (CGColorSpace *)CAGetColorSpace(0x1Du);
            v5 = CGColorCreate(v17, +[CALayer defaultValueForKey:]::values);
            white = (uint64_t)v5;
          }
          return v5;
        case 135:
          return CFSTR("stretch");
        case 136:
          return CFSTR("RGBA");
        case 142:
          v5 = (CGColorRef)+[CALayer defaultValueForKey:]::fullRect;
          if (!+[CALayer defaultValueForKey:]::fullRect)
          {
            v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", 0.5, 0.5, 0.0, 0.0);
            +[CALayer defaultValueForKey:]::fullRect = (uint64_t)v5;
          }
          return v5;
        case 144:
          if (LINKED_DEFAULT_CONTINUOUS_CORNERS)
            return CFSTR("continuous");
          else
            return CFSTR("circular");
        default:
          if (v3 == 53)
          {
            v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defPhase;
            if (!+[CALayer defaultValueForKey:]::defPhase)
            {
              v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 0.0, 0.0);
              +[CALayer defaultValueForKey:]::defPhase = (uint64_t)v5;
            }
            return v5;
          }
          if (v3 != 64)
            goto LABEL_58;
          break;
      }
      goto LABEL_44;
    }
    switch(v3)
    {
      case 12:
        v7 = "CALAYER_ALLOWS_EDGE_ANTIALIASING";
        v8 = CFSTR("CALayerAllowsEdgeAntialiasing");
        v9 = CFSTR("UIViewEdgeAntialiasing");
        break;
      case 15:
        v7 = "CALAYER_ALLOWS_GROUP_OPACITY";
        v8 = CFSTR("CALayerAllowsGroupOpacity");
        v9 = CFSTR("UIViewGroupOpacity");
        break;
      case 25:
        v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defAnchor;
        if (!+[CALayer defaultValueForKey:]::defAnchor)
        {
          v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", 0.5, 0.5);
          +[CALayer defaultValueForKey:]::defAnchor = (uint64_t)v5;
        }
        return v5;
      default:
        goto LABEL_58;
    }
    v10 = getenv(v7);
    if (v10)
    {
      v11 = atoi(v10);
      v12 = (id *)MEMORY[0x1E0C9AE50];
      if (!v11)
        v12 = (id *)MEMORY[0x1E0C9AE40];
      return *v12;
    }
    v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "infoDictionary");
    v5 = (CGColorRef)objc_msgSend(v13, "objectForKey:", v8);
    if (v5 || (v5 = (CGColorRef)objc_msgSend(v13, "objectForKey:", v9)) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v5;
    }
    if (v4 == 15 && dyld_program_sdk_at_least())
    {
      v12 = (id *)MEMORY[0x1E0C9AE50];
      return *v12;
    }
    goto LABEL_58;
  }
  if (v3 <= 399)
  {
    if (v3 > 240)
    {
      if (v3 > 367)
      {
        if (v3 == 368)
        {
          v5 = (CGColorRef)+[CALayer defaultValueForKey:]::corners;
          if (!+[CALayer defaultValueForKey:]::corners)
          {
            v5 = (CGColorRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 15);
            +[CALayer defaultValueForKey:]::corners = (uint64_t)v5;
          }
          return v5;
        }
        if (v3 != 380)
          goto LABEL_58;
      }
      else
      {
        if (v3 == 241)
          goto LABEL_40;
        if (v3 != 364)
          goto LABEL_58;
      }
      return CFSTR("linear");
    }
    switch(v3)
    {
      case 187:
        v5 = (CGColorRef)+[CALayer defaultValueForKey:]::inf;
        if (!+[CALayer defaultValueForKey:]::inf)
        {
          v5 = (CGColorRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", INFINITY);
          +[CALayer defaultValueForKey:]::inf = (uint64_t)v5;
        }
        break;
      case 190:
        v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defEdges;
        if (!+[CALayer defaultValueForKey:]::defEdges)
        {
          v5 = (CGColorRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 15);
          +[CALayer defaultValueForKey:]::defEdges = (uint64_t)v5;
        }
        break;
      case 219:
        return CFSTR("removed");
      default:
        goto LABEL_58;
    }
  }
  else
  {
    if (v3 <= 490)
    {
      if (v3 > 465)
      {
        if (v3 == 466 || v3 == 490)
        {
LABEL_44:
          v5 = (CGColorRef)black;
          if (!black)
          {
            v6 = (CGColorSpace *)CAGetColorSpace(0x1Du);
            v5 = CGColorCreate(v6, (const CGFloat *)&xmmword_18475EFA0);
            black = (uint64_t)v5;
          }
          return v5;
        }
        goto LABEL_58;
      }
      if (v3 != 400 && v3 != 447)
      {
LABEL_58:
        v14 = 0;
        v15 = &dword_1E15A8410;
        while (1)
        {
          v16 = *v15;
          v15 += 8;
          if (v16 == v4)
            break;
          v5 = 0;
          if (++v14 == 46)
            return v5;
        }
        if (((0x37EF7BDFE757uLL >> v14) & 1) != 0)
          v12 = (id *)MEMORY[0x1E0C9AE40];
        else
          v12 = (id *)MEMORY[0x1E0C9AE50];
        return *v12;
      }
LABEL_40:
      v5 = (CGColorRef)+[CALayer defaultValueForKey:]::one;
      if (!+[CALayer defaultValueForKey:]::one)
      {
        v5 = (CGColorRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
        +[CALayer defaultValueForKey:]::one = (uint64_t)v5;
      }
      return v5;
    }
    if (v3 > 514)
    {
      if (v3 != 515)
      {
        if (v3 == 551)
          return CFSTR("automatic");
        goto LABEL_58;
      }
      goto LABEL_40;
    }
    if (v3 == 491)
    {
      v5 = (CGColorRef)+[CALayer defaultValueForKey:]::defOffset;
      if (!+[CALayer defaultValueForKey:]::defOffset)
      {
        v5 = (CGColorRef)(id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 0.0, -3.0);
        +[CALayer defaultValueForKey:]::defOffset = (uint64_t)v5;
      }
    }
    else
    {
      if (v3 != 495)
        goto LABEL_58;
      v5 = (CGColorRef)+[CALayer defaultValueForKey:]::three;
      if (!+[CALayer defaultValueForKey:]::three)
      {
        v5 = (CGColorRef)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 3);
        +[CALayer defaultValueForKey:]::three = (uint64_t)v5;
      }
    }
  }
  return v5;
}

- (void)setContentsScaling:(id)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x87u, 74, 160, objc_msgSend(a3, "isEqualToString:", CFSTR("repeat")), 0, 0);
}

- (void)setFrame:(CGRect)frame
{
  double height;
  double width;
  double y;
  double x;
  _BYTE *layer;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  float64x2_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  CGRect v28;

  height = frame.size.height;
  width = frame.size.width;
  y = frame.origin.y;
  x = frame.origin.x;
  v27 = *MEMORY[0x1E0C80C00];
  if (frame.size.width < 0.0 || frame.size.height < 0.0)
  {
    v28 = CGRectStandardize(frame);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
  }
  layer = self->_attr.layer;
  v9 = 0.5;
  v10 = 0.5;
  if ((layer[56] & 8) != 0)
  {
    -[CALayer anchorPoint](self, "anchorPoint");
    v10 = v11;
    v9 = v12;
  }
  if ((layer[55] & 0x14) != 0 || (layer[51] & 0x10) != 0)
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
    -[CALayer affineTransform](self, "affineTransform");
    v13 = 0;
    v14 = 0;
    if ((layer[55] & 4) != 0)
      -[CALayer bounds](self, "bounds", 0.0, 0.0);
    v19 = v14;
    v21 = v13;
    if ((layer[51] & 0x10) != 0)
      v24 = vnegq_f64(v24);
    v15 = x + v10 * width - 0.0;
    v16 = y + v9 * height - 0.0;
    *(float64x2_t *)&v22.a = v24;
    *(_OWORD *)&v22.c = v25;
    *(_OWORD *)&v22.tx = v26;
    CGAffineTransformInvert(&v23, &v22);
    v24 = *(float64x2_t *)&v23.a;
    v25 = *(_OWORD *)&v23.c;
    v17 = v23.b * width + v23.d * height;
    width = fabs(v23.a * width + v23.c * height);
    height = fabs(v17);
    -[CALayer setPosition:](self, "setPosition:", v15, v16, v19, v21);
  }
  else
  {
    -[CALayer setPosition:](self, "setPosition:", x + v10 * width, y + v9 * height, 0, 0);
  }
  -[CALayer setBounds:](self, "setBounds:", v18, v20, width, height);
}

- (void)setBounds:(CGRect)bounds
{
  CA::Layer *layer;
  CGRect v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (bounds.size.width < 0.0 || bounds.size.height < 0.0)
    bounds = CGRectStandardize(bounds);
  layer = (CA::Layer *)self->_attr.layer;
  v5 = bounds;
  if (bounds.size.width < 0.0)
  {
    v5.origin.x = bounds.size.width + bounds.origin.x;
    v5.size.width = -bounds.size.width;
  }
  if (bounds.size.height < 0.0)
  {
    v5.origin.y = bounds.size.height + bounds.origin.y;
    v5.size.height = -bounds.size.height;
  }
  CA::Layer::set_bounds(layer, (const CA::Rect *)&v5);
}

- (void)setOpacity:(float)opacity
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = opacity;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x190, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setOpaque:(BOOL)opaque
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x192u, 38, 123, opaque, 0, 0);
}

- (void)setHidden:(BOOL)hidden
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xFBu, 37, 122, hidden, 0, 0);
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = cornerRadius;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x92, (const CGAffineTransform *)0x12, v3);
}

- (CGAffineTransform)affineTransform
{
  const double *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)(*(_QWORD *)&self->c + 55) & 0x10) == 0)
    goto LABEL_4;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  memset(v9, 0, sizeof(v9));
  -[CGAffineTransform transform](self, "transform");
  self = (CGAffineTransform *)CA::Mat4Impl::mat4_is_affine((CA::Mat4Impl *)v9, v4);
  if ((_DWORD)self)
  {
    v5 = v10;
    *(_OWORD *)&retstr->a = v9[0];
    *(_OWORD *)&retstr->c = v5;
    v6 = v14;
  }
  else
  {
LABEL_4:
    v7 = MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v8;
    v6 = *(_OWORD *)(v7 + 32);
  }
  *(_OWORD *)&retstr->tx = v6;
  return self;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)allowsEdgeAntialiasing
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xCu, 64, 155, allowsEdgeAntialiasing, 0, 0);
}

- (void)setMasksToBounds:(BOOL)masksToBounds
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x171u, 41, 126, masksToBounds, 0, 0);
}

- (void)setBackgroundColor:(CGColorRef)backgroundColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = backgroundColor;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x34, (const CGAffineTransform *)2, v3);
}

- (void)setAllowsGroupOpacity:(BOOL)allowsGroupOpacity
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xFu, 65, 156, allowsGroupOpacity, 0, 0);
}

- (void)setAllowsGroupBlending:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xEu, 70, 154, a3, 0, 0);
}

- (double)timeOffset
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x223u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (float)speed
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x203u, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (double)beginTime
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x37u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (double)duration
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xBBu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (NSString)fillMode
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xDBu, (const CGAffineTransform *)3, v3);
  return (NSString *)v3[0];
}

- (BOOL)autoreverses
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x2Fu, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (float)repeatCount
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1CAu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (double)repeatDuration
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1CBu, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)CA_validateValue:(id)a3 forKey:(id)a4
{
  int v7;
  CFTypeID v8;
  uint64_t TypeID;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_9;
  v7 = CAInternAtom((const __CFString *)a4, 0);
  if (v7 > 434)
  {
    if (v7 == 435 || v7 == 536)
    {
      objc_opt_class();
      return CAObject_validateArrayOfClass(a3);
    }
LABEL_9:
    v16.receiver = self;
    v16.super_class = (Class)CALayer;
    return -[NSObject CA_validateValue:forKey:](&v16, sel_CA_validateValue_forKey_, a3, a4);
  }
  if (v7 != 117)
  {
    if (v7 == 141)
    {
      v8 = CFGetTypeID(a3);
      TypeID = CGImageGetTypeID();
      return v8 == TypeID;
    }
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = CFGetTypeID(a3);
    if (v8 != CGImageGetTypeID())
    {
      v11 = CABackingStoreGetTypeID::type;
      if (!CABackingStoreGetTypeID::type)
      {
        v11 = _CFRuntimeRegisterClass();
        CABackingStoreGetTypeID::type = v11;
      }
      if (v8 != v11 && v8 != IOSurfaceGetTypeID())
      {
        v12 = CAMachPortGetTypeID::type;
        if (!CAMachPortGetTypeID::type)
        {
          v12 = _CFRuntimeRegisterClass();
          CAMachPortGetTypeID::type = v12;
        }
        if (v8 != v12 && v8 != CVPixelBufferGetTypeID())
        {
          v13 = CAIOSurfaceGetTypeID::type;
          if (!CAIOSurfaceGetTypeID::type)
          {
            v13 = _CFRuntimeRegisterClass();
            CAIOSurfaceGetTypeID::type = v13;
          }
          if (v8 != v13)
          {
            v14 = CAImageQueueGetTypeID::type;
            if (!CAImageQueueGetTypeID::type)
            {
              v14 = _CFRuntimeRegisterClass();
              CAImageQueueGetTypeID::type = v14;
            }
            if (v8 != v14)
            {
              v15 = CAImageProviderGetTypeID::type;
              if (!CAImageProviderGetTypeID::type)
              {
                v15 = _CFRuntimeRegisterClass();
                CAImageProviderGetTypeID::type = v15;
              }
              if (v8 != v15)
              {
                TypeID = CARenderObjectGetTypeID::type;
                if (!CARenderObjectGetTypeID::type)
                {
                  TypeID = _CFRuntimeRegisterClass();
                  CARenderObjectGetTypeID::type = TypeID;
                }
                return v8 == TypeID;
              }
            }
          }
        }
      }
    }
  }
  return 1;
}

- (void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key
{
  CA::Transaction *v7;
  uint64_t *v8;
  CALayer *v9;
  unsigned __int16 ***v10;
  double v11;
  double v12;
  uint64_t v13;
  char v14;
  CAAnimation *v15;
  uint64_t v16;
  objc_object *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    key = (NSString *)CFSTR("transition");
  }
  else if (!-[NSString length](key, "length"))
  {
    key = 0;
  }
  v7 = (CA::Transaction *)-[CAAnimation copy](anim, "copy");
  if (v7)
  {
    v15 = (CAAnimation *)v7;
    v8 = (uint64_t *)CA::Transaction::ensure_compat(v7);
    v9 = -[CALayer modelLayer](self, "modelLayer");
    if (v9)
    {
      v10 = (unsigned __int16 ***)v9;
      v18[0] = 0;
      v16 = 0;
      v17 = -[CAAnimation delegate](v15, "delegate");
      if (!v17
        && CA::Transaction::get_value(v8[11], 28, (const CGAffineTransform *)2, (CA::Mat4Impl *)&v17)
        && v17)
      {
        -[CAAnimation setDelegate:](v15, "setDelegate:");
      }
      if (CA::Transaction::get_value(v8[11], 29, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v16))
      {
        v11 = *(double *)&v16;
      }
      else
      {
        v16 = 0x3FD0000000000000;
        v11 = 0.25;
      }
      -[CAAnimation setDefaultDuration:](v15, "setDefaultDuration:", v11);
      -[CAAnimation duration](v15, "duration");
      if (v12 <= 0.000001)
      {
        v14 = lookup_delegate_methods((CA::Transaction *)v8, v17);
        if ((v14 & 0x40) != 0)
          -[objc_object animationDidStart:](v17, "animationDidStart:", v15);
        if (v14 < 0)
          -[objc_object animationDidStop:finished:](v17, "animationDidStop:finished:", v15, 1);

        if (key)
          objc_msgSend(v10, "removeAnimationForKey:", key);
      }
      else
      {
        if (CA::Transaction::get_value(v8[11], 30, (const CGAffineTransform *)2, (CA::Mat4Impl *)v18)
          && v18[0])
        {
          -[CAAnimation setTimingFunction:](v15, "setTimingFunction:");
        }
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = -[CAAnimation keyPath](v15, "keyPath");
          if (key)
          {
            if (!v13)
              -[CAAnimation setKeyPath:](v15, "setKeyPath:", key);
          }
        }
        CA::Layer::add_animation(v10[2], v15, (__CFString *)key);

      }
    }
    else
    {

    }
  }
}

- (NSArray)animationKeys
{
  CA::Transaction *v3;
  CALayer *v4;
  CALayer *v5;
  int v6;
  uint64_t *v7;
  uint64_t **v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = -[CALayer modelLayer](self, "modelLayer");
  v5 = v4;
  if (v4)
  {
    v6 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v6 + 1;
    if (!v6)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v7 = (uint64_t *)*((_QWORD *)v5->_attr.layer + 35);
    if (v7)
    {
      v5 = 0;
      v8 = (uint64_t **)v7;
      do
      {
        if (v8[2] && ((_WORD)v8[7] & 0x24) == 0)
          v5 = (CALayer *)((char *)v5 + 1);
        v8 = (uint64_t **)*v8;
      }
      while (v8);
      if (!v5)
        goto LABEL_22;
      v9 = 8 * (_QWORD)v5;
      if ((unint64_t)(8 * (_QWORD)v5) <= 0x1000)
      {
        MEMORY[0x1E0C80A78](v4);
        v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v10, 8 * (_QWORD)v5);
        goto LABEL_14;
      }
      v10 = (char *)malloc_type_malloc(8 * (_QWORD)v5, 0x80040B8603338uLL);
      if (v10)
      {
LABEL_14:
        v11 = 0;
        do
        {
          v12 = v7[2];
          if (v12 && (v7[7] & 0x24) == 0)
            *(_QWORD *)&v10[8 * v11++] = v12;
          v7 = (uint64_t *)*v7;
        }
        while (v7);
        v5 = (CALayer *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, v5);
        if (v9 > 0x1000)
          free(v10);
        goto LABEL_22;
      }
    }
    v5 = 0;
LABEL_22:
    CA::Transaction::unlock(v3);
  }
  return (NSArray *)v5;
}

- (void)removeAnimationForKey:(NSString *)key
{
  CA::Transaction *v5;
  CALayer *v6;
  CALayer *v7;
  NSUInteger v8;
  int v9;
  CA::Layer *layer;
  uint64_t v11;
  uint64_t *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v6 = -[CALayer modelLayer](self, "modelLayer");
  if (v6)
  {
    v7 = v6;
    if (*((_QWORD *)v6->_attr.layer + 35))
    {
      if (-[NSString length](key, "length"))
      {
        v8 = -[NSString hash](key, "hash");
        v9 = *((_DWORD *)v5 + 25);
        *((_DWORD *)v5 + 25) = v9 + 1;
        if (!v9)
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        layer = (CA::Layer *)v7->_attr.layer;
        v11 = *((_QWORD *)layer + 35);
        v15 = v11;
        if (v11)
        {
          v12 = &v15;
          while (1)
          {
            if ((*(_WORD *)(v11 + 56) & 4) == 0
              && *(_QWORD *)(v11 + 24) == v8
              && objc_msgSend(*(id *)(v11 + 16), "isEqualToString:", key))
            {
              v13 = *(_WORD *)(v11 + 56);
              if ((v13 & 0x42) == 0)
              {
                *v12 = *(_QWORD *)v11;
                schedule_stop_callback(v11, (uint64_t *)&animation_state);
                free_non_deferred_animation((_WORD *)v11, 1);
                goto LABEL_14;
              }
              *(_WORD *)(v11 + 56) = v13 | 4;
            }
            v12 = (uint64_t *)v11;
LABEL_14:
            v11 = *v12;
            if (!*v12)
            {
              layer = (CA::Layer *)v7->_attr.layer;
              v14 = v15;
              goto LABEL_19;
            }
          }
        }
        v14 = 0;
LABEL_19:
        CA::Layer::set_animations(layer, v14);
        CA::Layer::mark_animations((CA::Layer *)v7->_attr.layer, v5, 0);
        CA::Transaction::unlock(v5);
      }
    }
  }
}

- (CAAnimation)animationForKey:(NSString *)key
{
  CA::Transaction *v5;
  CALayer *v6;
  CALayer *v7;
  int v8;
  uint64_t **v9;
  NSUInteger v10;
  CAAnimation *v11;

  v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v6 = -[CALayer modelLayer](self, "modelLayer");
  if (!v6)
    return 0;
  v7 = v6;
  if (!*((_QWORD *)v6->_attr.layer + 35) || !-[NSString length](key, "length"))
    return 0;
  v8 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v8 + 1;
  if (!v8)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v9 = (uint64_t **)*((_QWORD *)v7->_attr.layer + 35);
  if (v9)
  {
    v10 = -[NSString hash](key, "hash");
    while (((_WORD)v9[7] & 0x24) != 0
         || v9[3] != (uint64_t *)v10
         || !objc_msgSend(v9[2], "isEqualToString:", key))
    {
      v9 = (uint64_t **)*v9;
      if (!v9)
        goto LABEL_12;
    }
    v11 = v9[1];
  }
  else
  {
LABEL_12:
    v11 = 0;
  }
  CA::Transaction::unlock(v5);
  return v11;
}

- (CALayer)modelLayer
{
  CA::Layer *layer;
  CA::Transaction *v3;
  CALayer *result;

  layer = (CA::Layer *)self->_attr.layer;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  result = (CALayer *)CA::Layer::model_layer(layer, v3);
  if (result)
    return (CALayer *)result->_attr.layer;
  return result;
}

- (void)setSublayers:(NSArray *)sublayers
{
  CA::Layer::set_sublayers((CALayerArray **)self->_attr.layer, (CALayerArray *)sublayers);
}

- (void)setName:(NSString *)name
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = name;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x184, (const CGAffineTransform *)3, v3);
}

- (void)setShadowOpacity:(float)shadowOpacity
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = shadowOpacity;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1EC, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setShadowOffset:(CGSize)shadowOffset
{
  CGSize v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = shadowOffset;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1EB, (const CGAffineTransform *)0x14, &v3.width);
}

- (void)setShadowRadius:(CGFloat)shadowRadius
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = shadowRadius;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1EF, (const CGAffineTransform *)0x12, v3);
}

- (void)setInheritsTiming:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x109u, 81, 167, a3, 0, 0);
}

- (void)setSublayerTransform:(CATransform3D *)sublayerTransform
{
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x217, (const CGAffineTransform *)0x16, &sublayerTransform->m11);
}

- (void)setShadowPathIsBounds:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1EEu, 46, 133, a3, 0, 0);
}

- (void)setDuration:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xBB, (const CGAffineTransform *)0x12, v3);
}

- (void)setFillMode:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xDB, (const CGAffineTransform *)3, v3);
}

- (void)setBeginTime:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x37, (const CGAffineTransform *)0x12, v3);
}

- (void)setInvertsShadow:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x146u, 45, 132, a3, 0, 0);
}

- (void)setContentsMultiplyColor:(CGColor *)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x83, (const CGAffineTransform *)2, v3);
}

- (void)setAffineTransform:(CGAffineTransform *)m
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(CGFloat *)&v3 = m->a;
  if ((*((_BYTE *)self->_attr.layer + 55) & 0x10) != 0
    || *(double *)&v3 != 1.0
    || m->b != 0.0
    || m->c != 0.0
    || m->d != 1.0
    || m->tx != 0.0
    || m->ty != 0.0)
  {
    *((_QWORD *)&v3 + 1) = *(_QWORD *)&m->b;
    v4 = *(_OWORD *)&m->c;
    v5 = *(_OWORD *)&m->tx;
    v6 = v3;
    v7 = 0;
    v8 = 0;
    v9 = v4;
    v10 = 0u;
    v11 = 0u;
    v12 = xmmword_18474DF40;
    v13 = v5;
    v14 = xmmword_18474DF50;
    -[CALayer setTransform:](self, "setTransform:", &v6);
  }
}

- (void)setTransform:(CATransform3D *)transform
{
  CA::Transaction *layer;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;

  layer = (CA::Transaction *)self->_attr.layer;
  if ((*((_BYTE *)layer + 55) & 0x10) == 0 && transform->m11 == 1.0)
  {
    v4 = 1;
    while (v4 != 16)
    {
      v5 = v4;
      v6 = *(&transform->m11 + v4);
      v7 = *(&CATransform3DIdentity.m11 + v4++);
      if (v6 != v7)
      {
        if ((unint64_t)(v5 - 1) <= 0xE)
          goto LABEL_3;
        return;
      }
    }
  }
  else
  {
LABEL_3:
    CA::Layer::setter(layer, (const void *)0x22D, (const CGAffineTransform *)0x16, &transform->m11);
  }
}

- (void)layoutSublayers
{
  CA::Transaction *v3;
  int v4;
  char *layer;
  int v6;
  char **v7;
  const char *v8;
  id *v9;
  id Weak;
  char *v11;
  id v12;

  if ((*((_BYTE *)self->_attr.layer + 58) & 3) != 0)
  {
    v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v3)
      v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    v4 = *((_DWORD *)v3 + 25);
    *((_DWORD *)v3 + 25) = v4 + 1;
    if (!v4)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    layer = (char *)self->_attr.layer;
    v6 = *((_DWORD *)layer + 14);
    if ((v6 & 0x10000) != 0)
    {
      v7 = &selRef_layoutSublayersOfLayer_;
    }
    else
    {
      if ((v6 & 0x20000) == 0)
      {
LABEL_13:
        CA::Transaction::unlock(v3);
        goto LABEL_14;
      }
      v7 = &selRef__layoutSublayersOfLayer_;
    }
    v8 = *v7;
    if (*v7)
    {
      v9 = (id *)(layer + 128);
      if (layer[136])
        Weak = objc_loadWeak(v9);
      else
        Weak = *v9;
      CA::Transaction::unlock(v3);
      objc_msgSend(Weak, v8, self);
      return;
    }
    goto LABEL_13;
  }
LABEL_14:
  v11 = (char *)CA::Transaction::ensure_compat((CA::Transaction *)self) + 88;
  while (1)
  {
    v11 = *(char **)v11;
    if (!v11)
      break;
    if ((v11[28] & 1) != 0)
    {
      if ((v11[24] & 1) != 0)
        return;
      break;
    }
  }
  v12 = -[CALayer actionForKey:](self, "actionForKey:", CFSTR("onLayout"));
  if (v12)
    objc_msgSend(v12, "runActionForKey:object:arguments:", CFSTR("onLayout"), self, 0);
}

- (unsigned)_renderImageCopyFlags
{
  __CFString *v3;
  const __CFString *v4;
  unsigned int v5;
  int v6;
  __CFString *v7;
  __CFString *v8;

  v3 = -[CALayer minificationFilter](self, "minificationFilter");
  if (v3 == CFSTR("linear"))
  {
    v5 = 0;
  }
  else
  {
    v4 = v3;
    v5 = CAInternAtom(v3, 0) == 332;
    v6 = CAInternAtom(v4, 0);
    if (v6 == 332 || v6 == 563)
      goto LABEL_8;
  }
  v7 = -[CALayer contentsScaling](self, "contentsScaling");
  if (v7 == CFSTR("stretch")
    || v7 != CFSTR("repeat") && !-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("repeat")))
  {
    v5 |= 0x100u;
  }
LABEL_8:
  v8 = -[CALayer contentsSwizzle](self, "contentsSwizzle");
  if (v8 != CFSTR("RGBA")
    && (v8 == CFSTR("AAAA") || -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("AAAA"))))
  {
    v5 |= 8u;
  }
  return v5;
}

- (NSString)contentsScaling
{
  if ((*((_BYTE *)self->_attr.layer + 53) & 4) != 0)
    return (NSString *)CFSTR("repeat");
  else
    return (NSString *)CFSTR("stretch");
}

- (void)display
{
  char *layer;
  CA::Transaction *v3;
  int v4;
  id Weak;
  id *v6;

  layer = (char *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    if ((layer[57] & 0x20) != 0)
    {
      v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
      if (!v3)
        v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
      v4 = *((_DWORD *)v3 + 25);
      *((_DWORD *)v3 + 25) = v4 + 1;
      if (!v4)
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      if ((layer[57] & 0x20) != 0)
      {
        v6 = (id *)(layer + 128);
        if (layer[136])
          Weak = objc_loadWeak(v6);
        else
          Weak = *v6;
      }
      else
      {
        Weak = 0;
      }
      CA::Transaction::unlock(v3);
      objc_msgSend(Weak, "displayLayer:", *((_QWORD *)layer + 2));
    }
    else
    {
      objc_msgSend(*((id *)layer + 2), "_display");
    }
  }
}

- (void)_display
{
  unint64_t Weak;
  size_t v3;
  char *layer;
  unsigned int *v5;
  void *v6;
  int v7;
  CA::Transaction *v8;
  int v9;
  id *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  BOOL v15;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  BOOL v21;
  int v22;
  int v23;
  unsigned int v24;
  unint64_t v25;
  const __CFString *v26;
  unint64_t v27;
  unint64_t v28;
  size_t v29;
  unint64_t v30;
  CGColorSpace *v31;
  CFTypeRef v32;
  int v33;
  unsigned int v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  CA::Transaction *v39;
  int v40;
  const void *v41;
  const void *v42;
  CFTypeID v43;
  uint64_t v44;
  uint64_t v45;
  CGColorSpace *v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  int v50;
  int v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  objc_object **v55;
  CGColorSpace *v56;
  CGColorSpaceRef Extended;
  _BYTE *v58;
  void *v59;
  CGContext *v60;
  int v61;
  uint64_t v62;
  char *v63;
  int v64;
  int *v65;
  Class isa;
  CGDataProvider *v67;
  CGImageRef v68;
  size_t v69;
  size_t v70;
  CGBitmapInfo v71;
  CGImage *v72;
  unsigned int v73;
  int v74;
  CFTypeRef v75;
  _BOOL4 v76;
  unsigned int v77;
  CGColorRef color;
  objc_object v79;
  CGFloat decode[2];
  __int128 v81;
  CFTypeRef cf[2];
  CGContext *v83[2];
  __int128 v84;
  unint64_t v85;
  int v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  layer = (char *)self->_attr.layer;
  v5 = (unsigned int *)(layer + 4);
  if ((*((_DWORD *)layer + 1) & 0x60000) != 0)
    return;
  v6 = (void *)*((_QWORD *)layer + 2);
  if (*((double *)layer + 14) == 0.0 || *((double *)layer + 15) == 0.0)
  {
LABEL_24:
    objc_msgSend(v6, "setContents:", 0);
    return;
  }
  v7 = *((_DWORD *)layer + 14);
  if ((v7 & 0x8000) != 0)
  {
    v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v8)
      v8 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    v9 = *((_DWORD *)v8 + 25);
    *((_DWORD *)v8 + 25) = v9 + 1;
    if (!v9)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    if (layer[57] < 0)
    {
      v10 = (id *)(layer + 128);
      if (layer[136])
        Weak = (unint64_t)objc_loadWeak(v10);
      else
        Weak = (unint64_t)*v10;
    }
    else
    {
      Weak = 0;
    }
    CA::Transaction::unlock(v8);
    objc_msgSend((id)Weak, "layerWillDraw:", v6);
    v7 = *((_DWORD *)layer + 14);
  }
  v11 = 1.0;
  if ((v7 & 1) != 0)
  {
    objc_msgSend(v6, "contentsScale");
    v11 = v12;
  }
  v13 = *((double *)layer + 14);
  v14 = *((double *)layer + 15);
  if (v13 < 0.0 || (v14 >= 0.0 ? (v15 = v11 * v11 * v13 * v14 <= 268435456.0) : (v15 = 0), !v15))
  {
    NSLog(CFSTR("-[%@ display]: Ignoring bogus layer size (%f, %f), contentsScale %f, backing store size (%f, %f)"), a2, *((_QWORD *)layer + 2), *(_QWORD *)&v13, *(_QWORD *)&v14, *(_QWORD *)&v11, v13 * v11, v14 * v11);
    goto LABEL_24;
  }
  LODWORD(v3) = vcvtmd_s64_f64(v13 * v11 + 0.5);
  LODWORD(Weak) = vcvtmd_s64_f64(v14 * v11 + 0.5);
  if ((int)v3 < 1 || (int)Weak <= 0)
    goto LABEL_24;
  v17 = *((_DWORD *)layer + 11);
  v18 = *((_DWORD *)layer + 14);
  v19 = objc_msgSend(v6, "isOpaque");
  switch(v17 & 7)
  {
    case 0:
      if (v19)
        v20 = 3;
      else
        v20 = 1;
      break;
    case 1:
      v21 = v19 == 0;
      v22 = 13;
      v23 = 17;
      goto LABEL_38;
    case 2:
      v21 = v19 == 0;
      v22 = 35;
      v23 = 33;
      goto LABEL_38;
    case 3:
      v20 = 9;
      break;
    case 4:
      v21 = v19 == 0;
      v22 = 18;
      v23 = 10;
LABEL_38:
      if (v21)
        v20 = v22;
      else
        v20 = v23;
      break;
    case 5:
      v20 = 36;
      break;
    default:
      v20 = 1;
      break;
  }
  v24 = objc_msgSend(v6, "_overrideImageFormat");
  if (v24 == -1)
    v25 = v20;
  else
    v25 = v24;
  v26 = (const __CFString *)objc_msgSend(v6, "minificationFilter");
  v76 = v26 != CFSTR("linear") && CAInternAtom(v26, 0) == 332;
  v27 = CA::Render::format_rowbytes((CA::Render *)v25, v3);
  if (is_mul_ok(v27, Weak))
    v28 = v27 * Weak;
  else
    v28 = 0;
  v77 = v25;
  if (v28 < *MEMORY[0x1E0C85AD8])
  {
    v29 = v27;
    v79.isa = 0;
    LODWORD(v30) = v25;
    if ((v18 & 0x400000) == 0)
      LODWORD(v30) = default_contents_image_format((id *)layer);
    v31 = (CGColorSpace *)objc_msgSend(*((id *)layer + 2), "_retainColorSpace");
    v32 = 0;
    color = 0;
    if ((_DWORD)v30 == 36)
    {
      v85 = 0;
      *(_OWORD *)v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      *(_OWORD *)cf = 0u;
      *(_OWORD *)decode = 0u;
      CACGContextEvaluator::CACGContextEvaluator((CACGContextEvaluator *)decode, v3, Weak, v31);
      backing_callback(v83[1], (CA::Layer *)layer);
      v33 = CACGContextEvaluator::suggested_format((CACGContextEvaluator *)decode, objc_msgSend(v6, "isOpaque"), &color, objc_msgSend(v6, "wantsExtendedDynamicRangeContent"));
      if (v33 == -1)
      {
        objc_msgSend(v6, "setContents:", 0);
        CGColorSpaceRelease(v31);
        CACGContextEvaluator::~CACGContextEvaluator((CGColorSpaceRef *)decode);
        return;
      }
      LODWORD(v30) = v33;
      v32 = CFRetain(cf[0]);
      CACGContextEvaluator::~CACGContextEvaluator((CGColorSpaceRef *)decode);
    }
    v75 = v32;
    if (((0xC99B4EB03uLL >> v30) & 1) != 0)
      v34 = 13;
    else
      v34 = 17;
    if ((v30 > 0x23) | (0x1FFFFFF2FuLL >> v30) & 1)
      v30 = v30;
    else
      v30 = v34;
    if ((_DWORD)v30 != v77)
    {
      v35 = CA::Render::format_rowbytes((CA::Render *)v30, v3);
      v29 = v35;
      if (is_mul_ok(v35, Weak))
        v28 = v35 * Weak;
      else
        v28 = 0;
    }
    v36 = CA::Render::aligned_malloc((CA::Render *)v28, (unint64_t *)&v79, 0);
    if (!v36)
    {
      CGColorRelease(color);
      CGColorSpaceRelease(v31);
      return;
    }
    v37 = v36;
    if ((v30 - 8) > 0x16)
      v38 = 3;
    else
      v38 = dword_1847505A8[(v30 - 8)];
    if (CGColorSpaceGetNumberOfComponents(v31) != v38)
    {
      CGColorSpaceRelease(v31);
      v56 = (CGColorSpace *)CA::Render::format_default_colorspace((CA::Render *)v30);
      v31 = CGColorSpaceRetain(v56);
    }
    if (objc_msgSend(v6, "wantsExtendedDynamicRangeContent")
      && v30 <= 0x1C
      && ((0x17826000u >> v30) & 1) != 0)
    {
      Extended = CAColorSpaceCreateExtended(v31);
      CGColorSpaceRelease(v31);
      v31 = Extended;
    }
    v58 = CAGetCachedCGBitmapContext_(v37, v3, Weak, v30, v29, v31);
    if (!v58 || (v60 = (CGContext *)*((_QWORD *)v58 + 2)) == 0)
    {
      CA::Render::aligned_free((CA::Render *)v37, (size_t)v79.isa, v59);
      CGColorRelease(color);
      CGColorSpaceRelease(v31);
      return;
    }
    if (v75)
      CGDisplayListDrawInContext();
    else
      backing_callback(v60, (CA::Layer *)layer);
    CGDisplayListRelease();
    CAReleaseCachedCGContext(v60);
    isa = v79.isa;
    MEMORY[0x186DBEA7C](*MEMORY[0x1E0C83DA0], v37, v79.isa, 1, 1);
    v67 = CGDataProviderCreateWithData(isa, v37, (size_t)isa, (CGDataProviderReleaseDataCallback)CA::Render::aligned_release);
    if ((_DWORD)v30 == 9)
    {
      *(_OWORD *)decode = xmmword_18474DF40;
      v68 = CGImageMaskCreate(v3, Weak, 8uLL, 8uLL, v29, v67, decode, 1);
    }
    else
    {
      if (v30 > 0x23)
      {
        v70 = 0;
        v69 = 0;
        v71 = 0;
      }
      else
      {
        v69 = dword_184750518[v30];
        v70 = dword_1847503F0[v30];
        v71 = dword_184750360[v30];
      }
      v68 = CGImageCreate(v3, Weak, v69, v70, v29, v31, v71, v67, 0, 1, kCGRenderingIntentDefault);
    }
    v72 = v68;
    CGDataProviderRelease(v67);
    objc_msgSend(v6, "setContents:", +[CATintedImage tintedImageWithCGImage:tint:copyFlags:](CATintedImage, "tintedImageWithCGImage:tint:copyFlags:", v72, color, v76));
    CGImageRelease(v72);
    CGColorRelease(color);
    CGColorSpaceRelease(v31);
    goto LABEL_133;
  }
  v79.isa = 0;
  v39 = CA::Transaction::ensure_compat((CA::Transaction *)v27);
  v40 = *((_DWORD *)v39 + 25);
  *((_DWORD *)v39 + 25) = v40 + 1;
  if (!v40)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v41 = (const void *)objc_msgSend(v6, "contents");
  v42 = v41;
  if (!v41)
    goto LABEL_77;
  v43 = CFGetTypeID(v41);
  v44 = CABackingStoreGetTypeID::type;
  if (!CABackingStoreGetTypeID::type)
  {
    v44 = _CFRuntimeRegisterClass();
    CABackingStoreGetTypeID::type = v44;
  }
  if (v43 == v44)
  {
    v45 = (uint64_t)CFRetain(v42);
  }
  else
  {
LABEL_77:
    if ((v18 & 0x400000) == 0)
      v77 = default_contents_image_format((id *)layer);
    v45 = CABackingStoreCreate();
    if (v45)
    {
      v46 = (CGColorSpace *)objc_msgSend(*((id *)layer + 2), "_retainColorSpace");
      CABackingStoreSetColorSpace(v45, v46);
      CGColorSpaceRelease(v46);
      pthread_mutex_lock((pthread_mutex_t *)(v45 + 16));
      *(_WORD *)(v45 + 492) = *(_WORD *)(v45 + 492) & 0xF9FF | 0x400;
      pthread_mutex_unlock((pthread_mutex_t *)(v45 + 16));
    }
  }
  if ((objc_msgSend(v6, "drawsAsynchronously") & 1) != 0 || (v47 = objc_msgSend(v6, "acceleratesDrawing"), (_DWORD)v47))
    v47 = 256;
  v48 = CABackingStoreSetDefaultAccelFlags(v47);
  if (v48 >= 0x100)
  {
    v49 = (int)(*((_DWORD *)layer + 13) << 11) >> 31;
    CA::Layer::mark((CA::Layer *)layer, v39, 2, 4);
  }
  else
  {
    v49 = 0;
  }
  CA::Transaction::unlock(v39);
  if (v45)
  {
    if (objc_msgSend(v6, "isOpaque"))
    {
      v48 |= 1u;
    }
    else if (objc_msgSend(v6, "clearsContext"))
    {
      v48 |= 2u;
    }
    if (v76)
    {
      if (objc_msgSend(v6, "drawsMipmapLevels"))
        v50 = 4;
      else
        v50 = 12;
      v48 |= v50;
    }
    v51 = v48 | 0x400;
    if (v11 <= 1.9)
      v51 = v48;
    v52 = *((_QWORD *)v39 + 5);
    v53 = ~(*((_DWORD *)layer + 1) >> 15) & 0x80 | v51;
    v54 = v52 + 216;
    *(_QWORD *)&decode[0] = MEMORY[0x1E0C809B0];
    if (!v52)
      v54 = 0;
    *(_QWORD *)&decode[1] = 3221225472;
    *(_QWORD *)&v81 = ___ZN2CA5Layer8display_Ev_block_invoke;
    *((_QWORD *)&v81 + 1) = &unk_1E15A89F0;
    *((_QWORD *)&v84 + 1) = __PAIR64__(Weak, v3);
    v85 = __PAIR64__(v53, v77);
    v86 = v49;
    v83[0] = (CGContext *)v45;
    v83[1] = 0;
    *(_QWORD *)&v84 = v54;
    cf[0] = v6;
    cf[1] = layer;
    x_blame_allocations((uint64_t)(layer + 40), (uint64_t)decode);
    if ((const void *)v45 == v42)
    {
      v61 = *((_DWORD *)v39 + 25);
      *((_DWORD *)v39 + 25) = v61 + 1;
      if (!v61)
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      CA::Layer::begin_change((CA::Layer *)layer, v39, CFSTR("contents"), &v79, v55);
      v62 = *((unsigned int *)v39 + 24);
      if ((v62 & 0x80000000) != 0 || (v63 = &layer[4 * v62], (v64 = *((_DWORD *)v63 + 68)) == 0))
      {
        v65 = CA::Layer::thread_flags_((CA::Layer *)layer, v39);
        v64 = *v65;
      }
      else
      {
        v65 = (int *)(v63 + 272);
      }
      *v65 = v64 & 0xFFFFFEFF;
      CA::Layer::end_change((id *)layer, v39, 117, (objc_object *)CFSTR("contents"), (objc_object *)v79.isa);
      CA::Transaction::unlock(v39);
    }
    else
    {
      objc_msgSend(v6, "setContents:", v45);
    }
    CFRelease((CFTypeRef)v45);
    do
LABEL_133:
      v73 = __ldaxr(v5);
    while (__stlxr(v73 | 0x4000000, v5));
    if (v76)
      v74 = 0x200000;
    else
      v74 = 0;
    *((_DWORD *)layer + 13) = *((_DWORD *)layer + 13) & 0xFF5FFFFF | v74;
  }
}

- (void)setContents:(id)contents
{
  objc_object **v5;
  unsigned int *v6;
  unsigned int v7;
  char *layer;
  char *v9;
  const void *v10;
  unsigned int *v11;
  CFTypeID v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  char *v16;
  int v17;
  int *v18;
  objc_object *v19[2];

  v19[1] = *(objc_object **)MEMORY[0x1E0C80C00];
  v6 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = v6[25];
  v6[25] = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = (char *)self->_attr.layer;
  if (*((id *)layer + 18) == contents)
  {
    v9 = layer + 40;
  }
  else
  {
    v19[0] = 0;
    CA::Layer::begin_change((CA::Layer *)layer, (CA::Transaction *)v6, CFSTR("contents"), (objc_object *)v19, v5);
    v9 = CA::Layer::writable_state((CA::Layer *)layer, (CA::Transaction *)v6);
    v10 = (const void *)*((_QWORD *)v9 + 13);
    if (v10)
      CA::Transaction::release_object((CA::Transaction *)v6, v10);
    *((_QWORD *)v9 + 13) = contents;
    if (contents)
    {
      CFRetain(contents);
      v11 = (unsigned int *)(layer + 4);
      if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
      {
        v12 = CFGetTypeID(contents);
        v13 = CABackingStoreGetTypeID::type;
        if (!CABackingStoreGetTypeID::type)
        {
          v13 = _CFRuntimeRegisterClass();
          CABackingStoreGetTypeID::type = v13;
        }
        if (v12 != v13)
          CA::Layer::mark((CA::Layer *)layer, (CA::Transaction *)v6, 2, 4);
      }
    }
    else
    {
      v11 = (unsigned int *)(layer + 4);
    }
    do
      v14 = __ldaxr(v11);
    while (__stlxr(v14 & 0xFBFFFFFF, v11));
    CA::Layer::end_change((id *)layer, (CA::Transaction *)v6, 117, (objc_object *)CFSTR("contents"), v19[0]);
  }
  if ((v9[18] & 0x20) == 0)
  {
    v9 = CA::Layer::writable_state((CA::Layer *)layer, (CA::Transaction *)v6);
    *((_DWORD *)v9 + 4) |= 0x200000u;
  }
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    v15 = v6[24];
    if ((v15 & 0x80000000) != 0 || (v16 = &layer[4 * v15], (v17 = *((_DWORD *)v16 + 68)) == 0))
    {
      v18 = CA::Layer::thread_flags_((CA::Layer *)layer, (CA::Transaction *)v6);
      v17 = *v18;
    }
    else
    {
      v18 = (int *)(v16 + 272);
    }
    *v18 = v17 & 0xFFFFFEFF;
    *((_DWORD *)v9 + 3) &= ~0x800000u;
  }
  CA::Transaction::unlock((CA::Transaction *)v6);
}

- (BOOL)isOpaque
{
  return (*((unsigned __int8 *)self->_attr.layer + 48) >> 6) & 1;
}

- (BOOL)clearsContext
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 2) & 1;
}

- (int)_overrideImageFormat
{
  return -1;
}

- (BOOL)acceleratesDrawing
{
  return *((unsigned __int8 *)self->_attr.layer + 52) >> 7;
}

- (BOOL)drawsAsynchronously
{
  return *((unsigned __int8 *)self->_attr.layer + 52) >> 7;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return CAObject_resolveInstanceMethod((objc_class *)a1, a3);
}

- (void)setContentsMaximumDesiredEDR:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x82, (const CGAffineTransform *)0x12, v3);
}

- (void)setCornerCurve:(CALayerCornerCurve)cornerCurve
{
  int v5;

  if (cornerCurve == (CALayerCornerCurve)CFSTR("continuous"))
  {
LABEL_5:
    v5 = 1;
    goto LABEL_9;
  }
  if (cornerCurve == (CALayerCornerCurve)CFSTR("id0"))
    goto LABEL_8;
  if (cornerCurve == (CALayerCornerCurve)CFSTR("id1"))
  {
    v5 = 3;
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](cornerCurve, "isEqualToString:", CFSTR("continuous")))
    goto LABEL_5;
  if (-[NSString isEqualToString:](cornerCurve, "isEqualToString:", CFSTR("id0")))
  {
LABEL_8:
    v5 = 2;
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](cornerCurve, "isEqualToString:", CFSTR("id1")))
    v5 = 3;
  else
    v5 = 0;
LABEL_9:
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x90u, 0x21u, 0xABu, 3, v5);
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  CA::Transaction *v11;
  int v12;
  int v13;
  CA::Transaction *v14;
  CA::Transaction *v15;
  CA::Transaction *v16;
  char v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  char *v22;
  int v23;
  CA::Layer *layer;
  int v25;
  char v26;

  v7 = objc_msgSend(a4, "rangeOfString:", CFSTR("."));
  if (!v8)
  {
    -[CALayer setValue:forKey:](self, "setValue:forKey:", a3, a4);
    return;
  }
  v9 = v7;
  v10 = (const __CFString *)objc_msgSend(a4, "substringToIndex:", v7);
  v11 = (CA::Transaction *)CAInternAtom(v10, 0);
  v12 = (int)v11;
  v13 = *((_DWORD *)self->_attr.layer + 1) & 0x60000;
  if (v13 == 0x40000)
  {
    v14 = (CA::Transaction *)-[CALayer _renderLayerDefinesProperty:](self, "_renderLayerDefinesProperty:", v11);
    if ((v14 & 1) != 0)
      return;
    v15 = CA::Transaction::ensure_compat(v14);
    goto LABEL_7;
  }
  v16 = CA::Transaction::ensure_compat(v11);
  v15 = v16;
  if (v13)
  {
LABEL_7:
    v17 = 0;
    v18 = 0;
    goto LABEL_8;
  }
  v18 = 0;
  v17 = 1;
  if (v12 != 367 && v12 != 536)
  {
    v22 = (char *)v16 + 88;
    do
    {
      v22 = *(char **)v22;
      if (!v22)
        goto LABEL_24;
    }
    while ((v22[28] & 1) == 0);
    if ((v22[24] & 1) == 0)
    {
LABEL_24:
      v18 = -[CALayer actionForKey:](self, "actionForKey:", a4);
      goto LABEL_43;
    }
    v18 = 0;
LABEL_43:
    v17 = 1;
  }
LABEL_8:
  v19 = (void *)objc_msgSend(a4, "substringFromIndex:", v9 + 1);
  if (v12 <= 120)
  {
    switch(v12)
    {
      case '6':
        v20 = 1024;
        break;
      case 'o':
        v20 = 2048;
        break;
      case 'u':
        goto LABEL_17;
      default:
LABEL_37:
        CAObject_setValueForKeyPath_(self, a3, (uint64_t)v10, v19, 0);
        if (v18)
          v26 = v17;
        else
          v26 = 0;
        if ((v26 & 1) == 0)
          return;
LABEL_36:
        objc_msgSend(v18, "runActionForKey:object:arguments:", a4, self, 0);
        return;
    }
LABEL_27:
    v21 = 1;
    goto LABEL_29;
  }
  if (v12 != 121)
  {
    if (v12 == 141)
    {
      v21 = 0;
      v20 = 0x80000;
      goto LABEL_29;
    }
    if (v12 != 222)
      goto LABEL_37;
    v20 = 512;
    goto LABEL_27;
  }
LABEL_17:
  v21 = 0;
  v20 = 1;
LABEL_29:
  CAObject_setValueForKeyPath_(self, a3, (uint64_t)v10, v19, v21);
  if ((v17 & 1) != 0)
  {
    v23 = *((_DWORD *)v15 + 25);
    *((_DWORD *)v15 + 25) = v23 + 1;
    if (!v23)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    layer = (CA::Layer *)self->_attr.layer;
    v25 = (v20 & 1) != 0 ? 1032 : 8;
    *((_DWORD *)layer + 10) |= v20 & 0x80E00;
    CA::Layer::mark(layer, v15, v25, 16);
    CA::Transaction::unlock(v15);
    if (v18)
      goto LABEL_36;
  }
}

- (CGRect)bounds
{
  double *layer;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  layer = (double *)self->_attr.layer;
  v3 = layer[12];
  v4 = layer[13];
  v5 = layer[14];
  v6 = layer[15];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)position
{
  double *layer;
  double v3;
  double v4;
  CGPoint result;

  layer = (double *)self->_attr.layer;
  v3 = layer[10];
  v4 = layer[11];
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSArray)filters
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0xDEu, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (void)setFilters:(NSArray *)filters
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = filters;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xDE, (const CGAffineTransform *)3, v3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x60000) != 0x40000
    || !-[CALayer _renderLayerDefinesProperty:](self, "_renderLayerDefinesProperty:", CAInternAtom((const __CFString *)a4, 0)))
  {
    CAObject_setValueForKey(self, (objc_class *)+[CALayer superclass](CALayer, "superclass"), a3, (const __CFString *)a4);
  }
}

- (id)valueForKey:(id)a3
{
  return CAObject_valueForKey(self, (objc_class *)+[CALayer superclass](CALayer, "superclass"), (const __CFString *)a3);
}

- (void)setAnchorPoint:(CGPoint)anchorPoint
{
  double y;
  double x;
  objc_object **v6;
  CA::Transaction *v7;
  int v8;
  uint64_t *layer;
  char *v10;
  CA::AttrList *v11;
  uint64_t v12;
  BOOL v13;
  char *v14;
  char *v15;
  int v17;
  CA::AttrList *v18;
  malloc_zone_t *malloc_zone;
  objc_object *v20;
  objc_object v21;
  double v22;
  CGPoint v23;
  uint64_t v24;

  y = anchorPoint.y;
  x = anchorPoint.x;
  v24 = *MEMORY[0x1E0C80C00];
  v23 = anchorPoint;
  v7 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v8 = *((_DWORD *)v7 + 25);
  *((_DWORD *)v7 + 25) = v8 + 1;
  if (!v8)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = (uint64_t *)self->_attr.layer;
  if (x == 0.0 && y == 0.0)
  {
    if ((layer[7] & 0x10) == 0)
    {
      *(double *)&v21.isa = 0.0;
      CA::Layer::begin_change((CA::Layer *)layer, v7, CFSTR("anchorPoint"), &v21, v6);
      v10 = CA::Layer::writable_state((CA::Layer *)layer, v7);
      *((_DWORD *)v10 + 4) |= 0x18u;
      v11 = (CA::AttrList *)*((_QWORD *)v10 + 4);
      if (v11)
        v11 = CA::AttrList::remove(v11, (const void *)0x19);
      *((_QWORD *)v10 + 4) = v11;
      CA::Layer::end_change((id *)layer, v7, 25, (objc_object *)CFSTR("anchorPoint"), (objc_object *)v21.isa);
    }
  }
  else
  {
    *(double *)&v21.isa = 0.0;
    v22 = 0.0;
    if ((layer[7] & 0x10) != 0
      || (v12 = layer[9]) == 0
      || !CA::AttrList::get(v12, 25, (const CGAffineTransform *)0x13, (CA::Mat4Impl *)&v21)
      || (*(double *)&v21.isa == x ? (v13 = v22 == y) : (v13 = 0), !v13))
    {
      v20 = 0;
      CA::Layer::begin_change((CA::Layer *)layer, v7, CFSTR("anchorPoint"), (objc_object *)&v20, v6);
      v14 = CA::Layer::writable_state((CA::Layer *)layer, v7);
      v15 = v14;
      if (y == 0.5 && x == 0.5)
        v17 = 0;
      else
        v17 = 8;
      *((_DWORD *)v14 + 4) = *((_DWORD *)v14 + 4) & 0xFFFFFFE7 | v17;
      v18 = (CA::AttrList *)*((_QWORD *)v14 + 4);
      if (!v18)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        v18 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
      }
      *((_QWORD *)v15 + 4) = CA::AttrList::set(v18, (const void *)0x19, 19, (unsigned __int8 *)&v23);
      CA::Layer::end_change((id *)layer, v7, 25, (objc_object *)CFSTR("anchorPoint"), v20);
    }
  }
  CA::Transaction::unlock(v7);
}

- (void)setCompositingFilter:(id)compositingFilter
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = compositingFilter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x6F, (const CGAffineTransform *)2, v3);
}

- (void)setBorderColor:(CGColorRef)borderColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = borderColor;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x40, (const CGAffineTransform *)2, v3);
}

- (CAMeshTransform)meshTransform
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x179u, (const CGAffineTransform *)3, v3);
  return (CAMeshTransform *)v3[0];
}

- (void)setMask:(CALayer *)mask
{
  CA::Layer::set_mask((CA::Layer ***)self->_attr.layer, mask);
}

- (BOOL)CAMLTypeSupportedForKey:(id)a3
{
  void *v5;
  BOOL v6;

  os_unfair_lock_lock((os_unfair_lock_t)&-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::lock);
  v5 = (void *)-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys;
  if (!-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", CFSTR("animations"), 0);
    -[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys = (uint64_t)v5;
  }
  if ((objc_msgSend(v5, "containsObject:", a3) & 1) == 0)
  {
    if (!CAObject_CAMLTypeSupportedForKey((uint64_t)self, (const __CFString *)a3))
    {
      v6 = 0;
      goto LABEL_8;
    }
    objc_msgSend((id)-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::keys, "addObject:", a3);
  }
  v6 = 1;
LABEL_8:
  os_unfair_lock_unlock((os_unfair_lock_t)&-[CALayer(CALayerPrivate) CAMLTypeSupportedForKey:]::lock);
  return v6;
}

- (void)CAMLParser:(id)a3 setValue:(id)a4 forKey:(id)a5
{
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("animations")))
    CFDictionaryApplyFunction((CFDictionaryRef)a4, (CFDictionaryApplierFunction)add_animation, self);
  else
    -[CALayer setValue:forKey:](self, "setValue:forKey:", a4, a5);
}

- (CACornerMask)maskedCorners
{
  return ((unint64_t)*((unsigned int *)self->_attr.layer + 11) >> 11) & 0xF;
}

- (void)setContentsRect:(CGRect)contentsRect
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = contentsRect;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x85, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (CGRect)contentsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  double v7[3];
  uint64_t v8;
  CGRect result;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  *(_OWORD *)v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x85u, (const CGAffineTransform *)0x15, (id *)&v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = v7[1];
  v4 = v7[0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CATransform3D)sublayerTransform
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
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x217u, (const CGAffineTransform *)0x16, (id *)retstr);
  return result;
}

- (void)setContinuousCorners:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("continuous");
  else
    v3 = CFSTR("circular");
  -[CALayer setCornerCurve:](self, "setCornerCurve:", v3);
}

- (void)setNeedsLayoutOnGeometryChange:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x187u, 40, 125, a3, 0, 0);
}

- (BOOL)hasBeenCommitted
{
  return (*((_DWORD *)self->_attr.layer + 1) >> 14) & 1;
}

- (BOOL)contentsAreFlipped
{
  return (*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0;
}

- (CGSize)size
{
  double *layer;
  double v3;
  double v4;
  CGSize result;

  layer = (double *)self->_attr.layer;
  v3 = layer[14];
  v4 = layer[15];
  result.height = v4;
  result.width = v3;
  return result;
}

- (CALayer)superlayer
{
  CA::Layer *layer;
  CA::Transaction *v3;

  layer = (CA::Layer *)self->_attr.layer;
  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  return CA::Layer::superlayer(layer, v3);
}

- (void)setSizeRequisition:(CGSize)a3
{
  CGSize v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1F7, (const CGAffineTransform *)0x14, &v3.width);
}

- (void)clearHasBeenCommitted
{
  unsigned int *v2;
  unsigned int v3;

  v2 = (unsigned int *)((char *)self->_attr.layer + 4);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 & 0xFFFFBFFF, v2));
}

- (void)setContentsSwizzle:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x88, (const CGAffineTransform *)3, v3);
}

- (id)delegate
{
  char *layer;
  id *v3;

  layer = (char *)self->_attr.layer;
  v3 = (id *)(layer + 128);
  if (layer[136])
    return objc_loadWeak(v3);
  else
    return *v3;
}

- (void)setHitTestsAsOpaque:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xFEu, 79, 165, a3, 0, 0);
}

- (void)setContentsCenter:(CGRect)contentsCenter
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = contentsCenter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x77, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (void)renderInContext:(CGContextRef)ctx
{
  CA::Transaction *v5;
  float v6;
  float v7;
  CA::Transaction *v8;
  float v9;
  float v10;
  _BOOL4 v11;
  int v12;
  CALayer *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  BOOL v23;
  __CFString *v24;
  int v25;
  CGBlendMode v26;
  int v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  CGColor *v34;
  CGColor *v35;
  size_t NumberOfComponents;
  unint64_t v37;
  size_t v38;
  char *v39;
  CGColor *v40;
  const CGFloat *Components;
  CGColorSpace *ColorSpace;
  float v43;
  CGFloat v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49[2];
  CGAffineTransform v50;
  __int128 v51;
  uint64_t v52;
  CGSize v53;
  CGRect v54;

  v52 = *MEMORY[0x1E0C80C00];
  if (-[CALayer isHidden](self, "isHidden"))
    return;
  v5 = (CA::Transaction *)-[CALayer opacity](self, "opacity");
  if (v6 <= 0.0)
    return;
  v7 = v6;
  if ((*((_DWORD *)self->_attr.layer + 1) & 0x60000) == 0)
  {
    -[CALayer layoutIfNeeded](self, "layoutIfNeeded");
    v5 = (CA::Transaction *)-[CALayer displayIfNeeded](self, "displayIfNeeded");
  }
  v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v8)
    v8 = (CA::Transaction *)CA::Transaction::create(v5);
  -[CALayer shadowOpacity](self, "shadowOpacity");
  v10 = v9;
  v11 = -[CALayer masksToBounds](self, "masksToBounds");
  v12 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v12 + 1;
  if (!v12)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v13 = -[CALayer mask](self, "mask");
  CA::Transaction::unlock(v8);
  if (v11)
  {
    -[CALayer bounds](self, "bounds");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    CGContextSaveGState(ctx);
    if (-[CALayer _usesCornerRadii](self, "_usesCornerRadii"))
    {
      v51 = 0u;
      memset(&v50, 0, sizeof(v50));
      -[CALayer cornerRadii](self, "cornerRadii");
      CA_CGContextAddUnevenRoundRect(ctx, (uint64_t)&v50, v15, v17, v19, v21);
      CGContextClip(ctx);
    }
    else
    {
      -[CALayer cornerRadius](self, "cornerRadius");
      if (v22 <= 0.0)
      {
        v54.origin.x = v15;
        v54.origin.y = v17;
        v54.size.width = v19;
        v54.size.height = v21;
        CGContextClipToRect(ctx, v54);
      }
      else
      {
        CA_CGContextAddRoundRect(ctx, -[CALayer _continuousCorners](self, "_continuousCorners"), v15, v17, v19, v21, v22);
        CGContextClip(ctx);
      }
    }
  }
  if (v13)
    CGContextBeginTransparencyLayer(ctx, 0);
  CGContextSaveGState(ctx);
  v23 = v7 < 1.0;
  if (v7 < 1.0)
    CGContextSetAlpha(ctx, v7);
  v24 = -[CALayer compositingFilter](self, "compositingFilter");
  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = CAInternAtom(v24, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_49;
      v25 = CAInternAtom((const __CFString *)-[__CFString type](v24, "type"), 0);
    }
    if (v25 <= 248)
    {
      if (v25 > 139)
      {
        switch(v25)
        {
          case 160:
            v26 = kCGBlendModeDarken;
            goto LABEL_68;
          case 161:
          case 162:
          case 163:
          case 164:
          case 168:
            goto LABEL_49;
          case 165:
            v26 = kCGBlendModeDestinationAtop;
            goto LABEL_68;
          case 166:
            v26 = kCGBlendModeDestinationIn;
            goto LABEL_68;
          case 167:
            v26 = kCGBlendModeDestinationOut;
            goto LABEL_68;
          case 169:
            v26 = kCGBlendModeDestinationOver;
            goto LABEL_68;
          case 170:
            v26 = kCGBlendModeDifference;
            goto LABEL_68;
          default:
            if (v25 == 140)
            {
              v26 = kCGBlendModeCopy;
            }
            else
            {
              if (v25 != 214)
                goto LABEL_49;
              v26 = kCGBlendModeExclusion;
            }
            break;
        }
        goto LABEL_68;
      }
      switch(v25)
      {
        case 'X':
          v26 = kCGBlendModeClear;
          goto LABEL_68;
        case '^':
          v26 = kCGBlendModeColorBurn;
          goto LABEL_68;
          v26 = kCGBlendModeColorDodge;
          goto LABEL_68;
      }
    }
    else
    {
      if (v25 > 478)
      {
        switch(v25)
        {
          case 504:
            v26 = kCGBlendModeSoftLight;
            goto LABEL_68;
          case 505:
          case 506:
          case 508:
          case 510:
          case 511:
            goto LABEL_49;
          case 507:
            v26 = kCGBlendModeSourceAtop;
            goto LABEL_68;
          case 509:
            v26 = kCGBlendModeSourceIn;
            goto LABEL_68;
          case 512:
            v26 = kCGBlendModeSourceOut;
            goto LABEL_68;
          default:
            if (v25 == 598)
            {
              v26 = kCGBlendModeXOR;
            }
            else
            {
              if (v25 != 479)
                goto LABEL_49;
              v26 = kCGBlendModeScreen;
            }
            break;
        }
        goto LABEL_68;
      }
      if (v25 > 408)
      {
        switch(v25)
        {
          case 409:
            v26 = kCGBlendModeOverlay;
            goto LABEL_68;
          case 422:
            v26 = kCGBlendModePlusDarker;
            goto LABEL_68;
          case 424:
            v26 = kCGBlendModePlusLighter;
            goto LABEL_68;
        }
      }
      else
      {
        switch(v25)
        {
          case 249:
            v26 = kCGBlendModeHardLight;
            goto LABEL_68;
          case 341:
            v26 = kCGBlendModeLighten;
            goto LABEL_68;
          case 386:
            v26 = kCGBlendModeMultiply;
LABEL_68:
            CGContextSetBlendMode(ctx, v26);
            if (v10 <= 0.0)
              goto LABEL_86;
            v23 = 1;
            goto LABEL_70;
        }
      }
    }
  }
LABEL_49:
  if (v10 <= 0.0)
  {
    if (v7 >= 1.0)
      goto LABEL_78;
LABEL_86:
    CGContextBeginTransparencyLayer(ctx, 0);
    -[CALayer _renderBackgroundInContext:](self, "_renderBackgroundInContext:", ctx);
    -[CALayer _renderForegroundInContext:](self, "_renderForegroundInContext:", ctx);
    -[CALayer _renderSublayersInContext:](self, "_renderSublayersInContext:", ctx);
    -[CALayer _renderBorderInContext:](self, "_renderBorderInContext:", ctx);
    CGContextEndTransparencyLayer(ctx);
    goto LABEL_87;
  }
LABEL_70:
  v27 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v27 + 1;
  if (!v27)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  -[CALayer shadowOffset](self, "shadowOffset");
  v29 = v28;
  v31 = v30;
  -[CALayer shadowRadius](self, "shadowRadius");
  v33 = v32;
  v34 = -[CALayer shadowColor](self, "shadowColor");
  v35 = v34;
  if (v34 && CGColorGetAlpha(v34) > 0.0)
  {
    if (v10 == 1.0)
    {
      v40 = v35;
    }
    else
    {
      NumberOfComponents = CGColorGetNumberOfComponents(v35);
      v37 = NumberOfComponents << 32;
      v38 = 8 * (int)NumberOfComponents;
      if (NumberOfComponents << 32 > 0x2001FFFFFFFLL)
      {
        v39 = (char *)malloc_type_malloc(8 * (int)NumberOfComponents, 0x100004000313F17uLL);
      }
      else
      {
        MEMORY[0x1E0C80A78](NumberOfComponents);
        v39 = (char *)&v45 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v39, v38);
      }
      Components = CGColorGetComponents(v35);
      memcpy(v39, Components, v38);
      *(double *)&v39[(uint64_t)(v37 - 0x100000000) >> 29] = *(double *)&v39[(uint64_t)(v37 - 0x100000000) >> 29]
                                                            * v10;
      ColorSpace = CGColorGetColorSpace(v35);
      v40 = CGColorCreate(ColorSpace, (const CGFloat *)v39);
      if (v37 >= 0x20000000001)
        free(v39);
    }
    v43 = v33 + v33;
    v44 = v43;
    v53.width = v29;
    v53.height = v31;
    CGContextSetShadowWithColor(ctx, v53, v44, v40);
    if (v40 != v35)
      CGColorRelease(v40);
    CA::Transaction::unlock(v8);
    goto LABEL_86;
  }
  CA::Transaction::unlock(v8);
  if (v23)
    goto LABEL_86;
LABEL_78:
  -[CALayer _renderBackgroundInContext:](self, "_renderBackgroundInContext:", ctx);
  -[CALayer _renderForegroundInContext:](self, "_renderForegroundInContext:", ctx);
  -[CALayer _renderSublayersInContext:](self, "_renderSublayersInContext:", ctx);
  -[CALayer _renderBorderInContext:](self, "_renderBorderInContext:", ctx);
LABEL_87:
  CGContextRestoreGState(ctx);
  if (v13)
  {
    memset(&v50, 0, sizeof(v50));
    CA::Layer::get_frame_transform((CA::Layer *)v13->_attr.layer, &v50, 0);
    if (CA_CGAffineTransformIsValid())
    {
      CGContextSaveGState(ctx);
      memset(&v49[1], 0, sizeof(CGAffineTransform));
      CGContextGetBaseCTM();
      v49[0] = v50;
      CGContextConcatCTM(ctx, v49);
      v47 = v50;
      v46 = v49[1];
      CGAffineTransformConcat(&v48, &v47, &v46);
      CGContextSetBaseCTM();
      CGContextSetBlendMode(ctx, kCGBlendModeDestinationIn);
      CGContextBeginTransparencyLayer(ctx, 0);
      -[CALayer renderInContext:](v13, "renderInContext:", ctx);
      CGContextEndTransparencyLayer(ctx);
      v45 = v49[1];
      CGContextSetBaseCTM();
      CGContextRestoreGState(ctx);
    }
    CGContextEndTransparencyLayer(ctx);
  }
  if (v11)
    CGContextRestoreGState(ctx);

}

- (BOOL)isHidden
{
  return (*((unsigned __int8 *)self->_attr.layer + 48) >> 5) & 1;
}

- (BOOL)masksToBounds
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 1) & 1;
}

- (float)shadowOpacity
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1ECu, (const CGAffineTransform *)0x11, (id *)&v3);
  return v3;
}

- (CALayer)mask
{
  return CA::Layer::mask((CA::Layer *)self->_attr.layer);
}

- (id)compositingFilter
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x6Fu, (const CGAffineTransform *)2, v3);
  return v3[0];
}

- (void)layoutIfNeeded
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int *layer;
  unsigned int v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  malloc_zone_t *v14;
  unsigned int v15;
  unsigned int v16;
  malloc_zone_t *malloc_zone;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  malloc_zone_t *v23;
  unsigned int *v24;

  if ((*((_DWORD *)self->_attr.layer + 1) & 0x60000) == 0)
  {
    v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
    v4 = v3[25];
    v3[25] = v4 + 1;
    if (!v4)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    layer = (unsigned int *)self->_attr.layer;
    while (1)
    {
      v6 = *layer;
      if (!*layer)
        break;
      while (1)
      {
        v7 = __ldaxr(layer);
        if (v7 != v6)
          break;
        if (!__stlxr(v6 + 1, layer))
          goto LABEL_11;
      }
      __clrex();
    }
    layer = 0;
LABEL_11:
    v24 = layer;
    while (1)
    {
      v8 = CA::Layer::retain_parent((CA::Layer *)layer, (CA::Transaction *)v3);
      if (!v8)
        break;
      v9 = v8;
      v10 = v3[24];
      if ((v10 & 0x80000000) != 0 || (v11 = v8[v10 + 68]) == 0)
        v11 = *CA::Layer::thread_flags_((CA::Layer *)v8, (CA::Transaction *)v3);
      if ((v11 & 0x40) == 0)
      {
LABEL_30:
        v16 = *v9;
        if (*v9)
        {
          do
          {
            v15 = __ldaxr(v9);
            if (v15 != v16)
            {
              __clrex();
              goto LABEL_30;
            }
          }
          while (__stlxr(v16 - 1, v9));
          if (v16 == 1)
          {
            CA::Layer::destroy((CA::Layer *)v9);
            CA::Layer::~Layer((CA::AttrList **)v9);
            malloc_zone = (malloc_zone_t *)get_malloc_zone();
            malloc_zone_free(malloc_zone, v9);
          }
        }
        break;
      }
      v24 = v9;
      if (layer)
      {
LABEL_18:
        v12 = *layer;
        if (*layer)
        {
          do
          {
            v13 = __ldaxr(layer);
            if (v13 != v12)
            {
              __clrex();
              goto LABEL_18;
            }
          }
          while (__stlxr(v12 - 1, layer));
          if (v12 == 1)
          {
            CA::Layer::destroy((CA::Layer *)layer);
            CA::Layer::~Layer((CA::AttrList **)layer);
            v14 = (malloc_zone_t *)get_malloc_zone();
            malloc_zone_free(v14, layer);
          }
        }
      }
      layer = v9;
    }
    v18 = *((_QWORD *)v24 + 2);
    if (v18)
      v19 = CALayerRetain(v18);
    else
      v19 = 0;
    CA::Transaction::unlock((CA::Transaction *)v3);
    if (v19)
    {
      CA::Layer::layout_if_needed((CA::Layer *)v24, (CA::Transaction *)v3);
      v20 = *((_QWORD *)v24 + 2);
      if (v20)
        CALayerRelease(v20);
    }
LABEL_40:
    v21 = *v24;
    if (*v24)
    {
      do
      {
        v22 = __ldaxr(v24);
        if (v22 != v21)
        {
          __clrex();
          goto LABEL_40;
        }
      }
      while (__stlxr(v21 - 1, v24));
      if (v21 == 1)
      {
        CA::Layer::destroy((CA::Layer *)v24);
        CA::Layer::~Layer((CA::AttrList **)v24);
        v23 = (malloc_zone_t *)get_malloc_zone();
        malloc_zone_free(v23, v24);
      }
    }
  }
}

- (void)displayIfNeeded
{
  if (-[CALayer needsDisplay](self, "needsDisplay"))
    -[CALayer display](self, "display");
}

- (BOOL)needsDisplay
{
  CA::Layer *layer;
  unsigned int *v3;
  uint64_t v4;
  unsigned int v5;

  layer = (CA::Layer *)self->_attr.layer;
  v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = v3[24];
  if ((v4 & 0x80000000) != 0 || (v5 = *((_DWORD *)layer + v4 + 68)) == 0)
    v5 = *CA::Layer::thread_flags_(layer, (CA::Transaction *)v3);
  return (v5 >> 8) & 1;
}

- (void)_renderSublayersInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  CA::Layer **v11;
  CGAffineTransform v12;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v15;
  CGAffineTransform transform;
  CGAffineTransform v17;
  CGAffineTransform v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v7 = (void *)-[NSArray copy](-[CALayer sublayers](self, "sublayers"), "copy");
  CA::Transaction::unlock(v5);
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      v11 = (CA::Layer **)objc_msgSend(v7, "objectAtIndex:", i, *(_OWORD *)&v12.a, *(_OWORD *)&v12.c, *(_OWORD *)&v12.tx);
      memset(&v18, 0, sizeof(v18));
      CA::Layer::get_frame_transform(v11[2], &v18, 0);
      if (CA_CGAffineTransformIsValid())
      {
        CGContextSaveGState(a3);
        memset(&v17, 0, sizeof(v17));
        CGContextGetBaseCTM();
        transform = v18;
        CGContextConcatCTM(a3, &transform);
        t1 = v18;
        t2 = v17;
        CGAffineTransformConcat(&v15, &t1, &t2);
        CGContextSetBaseCTM();
        objc_msgSend(v11, "renderInContext:", a3);
        v12 = v17;
        CGContextSetBaseCTM();
        CGContextRestoreGState(a3);
      }
    }
  }

}

- (NSArray)sublayers
{
  return (NSArray *)CA::Layer::sublayers((CA::Layer *)self->_attr.layer);
}

- (void)_renderBorderInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  int v6;
  double v7;
  CGFloat v8;
  CGColor *v9;
  CGColor *v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  int v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  -[CALayer borderWidth](self, "borderWidth");
  v8 = v7;
  v9 = -[CALayer borderColor](self, "borderColor");
  if (v8 > 0.0)
  {
    v10 = v9;
    if (v9)
    {
      if (CGColorGetAlpha(v9) > 0.0)
      {
        CGContextSaveGState(a3);
        if (!-[CALayer edgeAntialiasingMask](self, "edgeAntialiasingMask"))
          CGContextSetShouldAntialias(a3, 0);
        CGContextSetStrokeColorWithColor(a3, v10);
        CGContextSetLineWidth(a3, v8);
        -[CALayer bounds](self, "bounds");
        v11 = v8 * 0.5;
        v24 = CGRectInset(v23, v8 * 0.5, v8 * 0.5);
        x = v24.origin.x;
        y = v24.origin.y;
        width = v24.size.width;
        height = v24.size.height;
        -[CALayer cornerRadius](self, "cornerRadius");
        v17 = v16;
        -[CALayer borderOffset](self, "borderOffset");
        v19 = v18;
        v20 = v17 - v11;
        if (v18 != 0.0)
        {
          v21 = -v18;
          v25.origin.x = x;
          v25.origin.y = y;
          v25.size.width = width;
          v25.size.height = height;
          v26 = CGRectInset(v25, v21, -v19);
          x = v26.origin.x;
          y = v26.origin.y;
          width = v26.size.width;
          height = v26.size.height;
          if (v19 + v20 >= 0.0)
            v20 = v19 + v20;
          else
            v20 = 0.0;
        }
        CA_CGContextAddRoundRect(a3, -[CALayer _continuousCorners](self, "_continuousCorners"), x, y, width, height, v20);
        CA::Transaction::unlock(v5);
        CGContextStrokePath(a3);
        v22 = *((_DWORD *)v5 + 25);
        *((_DWORD *)v5 + 25) = v22 + 1;
        if (!v22)
          os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        CGContextRestoreGState(a3);
      }
    }
  }
  CA::Transaction::unlock(v5);
}

- (void)_renderBackgroundInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  int v6;
  CGColor *v7;
  CGColor *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPatternRef Pattern;
  long double v20;
  int v21;
  CGAffineTransform v22;
  __int128 v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v29;
  CGAffineTransform v30;
  uint64_t v31;
  CGSize v32;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v7 = -[CALayer backgroundColor](self, "backgroundColor");
  v8 = v7;
  if (v7 && CGColorGetAlpha(v7) > 0.0)
  {
    -[CALayer bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CALayer cornerRadius](self, "cornerRadius");
    v18 = v17;
    memset(&v30, 0, sizeof(v30));
    memset(&v29, 0, sizeof(v29));
    Pattern = CGColorGetPattern(v8);
    if (Pattern)
    {
      CGContextGetBaseCTM();
      v30 = v22;
      CGContextGetCTM(&v22, a3);
      v29 = v22;
      if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
      {
        t1.b = 0.0;
        t1.c = 0.0;
        t1.a = 1.0;
        *(_OWORD *)&t1.d = xmmword_18474DFF0;
        t1.ty = v16;
        t2 = v29;
        CGAffineTransformConcat(&v29, &t1, &t2);
        CGPatternGetStep();
        v32.height = fmod(v16, v20);
        v32.width = 0.0;
        CGContextSetPatternPhase(a3, v32);
      }
      if (CGPatternGetShading())
      {
        CGAffineTransformMakeScale(&v26, v14, v16);
        v25 = v29;
        CGAffineTransformConcat(&v22, &v26, &v25);
        v29 = v22;
      }
      v24 = v29;
      CGContextSetBaseCTM();
    }
    CGContextSaveGState(a3);
    if (!-[CALayer edgeAntialiasingMask](self, "edgeAntialiasingMask"))
      CGContextSetShouldAntialias(a3, 0);
    CGContextSetFillColorWithColor(a3, v8);
    if (-[CALayer _usesCornerRadii](self, "_usesCornerRadii"))
    {
      v23 = 0u;
      memset(&v22, 0, sizeof(v22));
      if (self)
        -[CALayer cornerRadii](self, "cornerRadii");
      CA_CGContextAddUnevenRoundRect(a3, (uint64_t)&v22, v10, v12, v14, v16);
    }
    else
    {
      CA_CGContextAddRoundRect(a3, -[CALayer _continuousCorners](self, "_continuousCorners"), v10, v12, v14, v16, v18);
    }
    CA::Transaction::unlock(v5);
    CGContextFillPath(a3);
    v21 = *((_DWORD *)v5 + 25);
    *((_DWORD *)v5 + 25) = v21 + 1;
    if (!v21)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    CGContextRestoreGState(a3);
    if (Pattern)
      CGContextSetBaseCTM();
  }
  CA::Transaction::unlock(v5);
}

- (void)_renderForegroundInContext:(CGContext *)a3
{
  CA::Transaction *v5;
  int v6;
  mach_port_t *tinted_contents;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CFTypeID v16;
  char v17;
  uint64_t v18;
  CGImage *v19;
  CGColor *v20;
  CGColor *v21;
  CGColor *v22;
  uint64_t v23;
  __IOSurface *v24;
  CA::Render *PixelFormat;
  malloc_zone_t *malloc_zone;
  uint64_t *v27;
  int v28;
  __IOSurface *v29;
  unsigned int v30;
  uint64_t v31;
  CA::Render::Image *v32;
  int v33;
  __IOSurface *v34;
  unsigned int *v35;
  unsigned int v36;
  BOOL v37;
  __IOSurface *v38;
  unsigned int v39;
  uint64_t v40;
  unsigned int *v41;
  unsigned int v42;
  _BYTE *layer;
  double Width;
  double Height;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  unsigned int v51;
  int v52;
  CGColor *v53;
  __CFString *v54;
  CGColor *v55;
  CGImageRef v56;
  CGImage *v57;
  double v58;
  double v59;
  int v60;
  CGImage *v61;
  int v62;
  CGImage *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  _BOOL4 v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  double v79;
  double v80;
  uint64_t v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double i;
  int v93;
  double v94;
  double v95;
  double v96;
  double sy;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double ty;
  double rect;
  CGAffineTransform v109;
  CGAffineTransform transform;
  CGAffineTransform t2;
  CGAffineTransform t1;
  double v113;
  double v114;
  __int128 v115;
  CGAffineTransform v116;
  uint64_t v117;
  double v118;
  double v119;
  double v120;
  uint64_t v121;
  double v122;
  double v123;
  double v124;
  float64x2_t v125;
  double v126;
  double v127;
  uint64_t v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v128 = *MEMORY[0x1E0C80C00];
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v5)
    v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  v6 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v6 + 1;
  if (!v6)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  tinted_contents = -[CALayer contents](self, "contents");
  if (tinted_contents)
  {
    -[CALayer bounds](self, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = CFGetTypeID(tinted_contents);
    if (v16 == CGImageGetTypeID())
    {
LABEL_7:
      v17 = 0;
      goto LABEL_49;
    }
    v18 = CABackingStoreGetTypeID::type;
    if (!CABackingStoreGetTypeID::type)
    {
      v18 = _CFRuntimeRegisterClass();
      CABackingStoreGetTypeID::type = v18;
    }
    if (v16 == v18)
    {
      v19 = CABackingStoreCopyCGImage((uint64_t)tinted_contents);
      v20 = CABackingStoreCopyTintColor((uint64_t)tinted_contents);
      if (v20)
      {
        v21 = v20;
        tinted_contents = (mach_port_t *)create_tinted_contents(v19, v20, 0);
        CGImageRelease(v19);
        CGColorRelease(v21);
LABEL_17:
        v17 = 1;
        goto LABEL_49;
      }
      v17 = 1;
LABEL_33:
      tinted_contents = (mach_port_t *)v19;
      goto LABEL_49;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (CGImage *)-[mach_port_t image](tinted_contents, "image");
      if (v19)
      {
        v22 = (CGColor *)-[mach_port_t tint](tinted_contents, "tint");
        if (v22)
        {
          tinted_contents = (mach_port_t *)create_tinted_contents(v19, v22, 0);
          goto LABEL_17;
        }
        v17 = 0;
        goto LABEL_33;
      }
LABEL_31:
      v17 = 0;
      tinted_contents = 0;
      goto LABEL_49;
    }
    v23 = CAMachPortGetTypeID::type;
    if (!CAMachPortGetTypeID::type)
    {
      v23 = _CFRuntimeRegisterClass();
      CAMachPortGetTypeID::type = v23;
    }
    if (v16 == v23)
    {
      v24 = IOSurfaceLookupFromMachPort(tinted_contents[4]);
      tinted_contents = (mach_port_t *)v24;
      if (!v24)
        goto LABEL_7;
      PixelFormat = (CA::Render *)IOSurfaceGetPixelFormat(v24);
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v27 = (uint64_t *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x158uLL, 0x743898A5uLL);
      if (v27)
      {
        v28 = CA::Render::fourcc_to_format(PixelFormat);
        CA::Render::Surface::Surface((uint64_t)v27, (IOSurfaceRef)tinted_contents, v28, 2, 0, 0, 0);
      }
      v29 = (__IOSurface *)v27[14];
      v30 = (*(uint64_t (**)(uint64_t *))(*v27 + 104))(v27);
      if (v30 > 0x23)
        v31 = 0;
      else
        v31 = dword_184750360[v30];
      tinted_contents = (mach_port_t *)CACreateIOSurfaceBackedCGImage(v29, v31, v27[6]);
      v35 = (unsigned int *)(v27 + 1);
      do
        v36 = __ldaxr(v35);
      while (__stlxr(v36 - 1, v35));
      v17 = 1;
      v37 = v36 == 1;
      goto LABEL_46;
    }
    v32 = (CA::Render::Image *)-[mach_port_t CA_copyRenderValue](tinted_contents, "CA_copyRenderValue");
    v27 = (uint64_t *)v32;
    if (!v32)
      goto LABEL_31;
    v33 = *((unsigned __int8 *)v32 + 12);
    if (v33 == 51)
    {
      v38 = (__IOSurface *)*((_QWORD *)v32 + 14);
      v39 = (*(uint64_t (**)(CA::Render::Image *))(*(_QWORD *)v32 + 104))(v32);
      if (v39 > 0x23)
        v40 = 0;
      else
        v40 = dword_184750360[v39];
      v34 = CACreateIOSurfaceBackedCGImage(v38, v40, v27[6]);
    }
    else
    {
      if (v33 != 23)
      {
        v17 = 0;
        tinted_contents = 0;
        goto LABEL_44;
      }
      v34 = CA::Render::Image::copy_cgimage(v32);
    }
    tinted_contents = (mach_port_t *)v34;
    v17 = 1;
LABEL_44:
    v41 = (unsigned int *)(v27 + 1);
    do
    {
      v42 = __ldaxr(v41);
      v37 = --v42 == 0;
    }
    while (__stlxr(v42, v41));
LABEL_46:
    if (v37)
      (*(void (**)(uint64_t *))(*v27 + 16))(v27);
LABEL_49:
    CGContextSaveGState(a3);
    if (!tinted_contents)
    {
      CA::Transaction::unlock(v5);
      -[CALayer _prepareContext:](self, "_prepareContext:", a3);
      v132.origin.x = v9;
      v132.origin.y = v11;
      v132.size.width = v13;
      v132.size.height = v15;
      CGContextClipToRect(a3, v132);
      CGContextBeginTransparencyLayer(a3, 0);
      objc_msgSend(CA::Layer::layer_being_drawn((CA::Layer *)self->_attr.layer, v5, 0x800000), "drawInContext:", a3);
      CGContextEndTransparencyLayer(a3);
      v60 = *((_DWORD *)v5 + 25);
      *((_DWORD *)v5 + 25) = v60 + 1;
      if (!v60)
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
      goto LABEL_147;
    }
    layer = self->_attr.layer;
    Width = (double)CGImageGetWidth((CGImageRef)tinted_contents);
    Height = (double)CGImageGetHeight((CGImageRef)tinted_contents);
    if ((layer[56] & 1) != 0)
    {
      -[CALayer contentsScale](self, "contentsScale");
      Width = Width / v46;
      Height = Height / v46;
    }
    v104 = 0.0;
    v105 = Width;
    v106 = Height;
    v103 = 0.0;
    if ((*((_DWORD *)layer + 13) & 0x80000000) != 0)
    {
      -[CALayer contentsRect](self, "contentsRect");
      if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
        v48 = 1.0 - (v48 + v50);
      Width = v49 * Width;
      Height = v50 * Height;
      v103 = -(v106 * v48);
      v104 = -(v105 * v47);
    }
    v115 = 0uLL;
    v113 = 0.0;
    v114 = 0.0;
    v51 = (*((_DWORD *)layer + 11) >> 3) & 0xF;
    v116.a = v9;
    v116.b = v11;
    v116.c = v13;
    v116.d = v15;
    if (v13 < 0.0)
    {
      v116.a = v13 + v9;
      v116.c = -v13;
    }
    if (v15 < 0.0)
    {
      v116.b = v15 + v11;
      v116.d = -v15;
    }
    v125.f64[0] = Width;
    v125.f64[1] = Height;
    CA::Render::compute_gravity_transform(v51, &v116.a, &v125, (uint64_t)&v115, (uint64_t)&v113);
    t1.a = v113;
    t1.b = 0.0;
    t1.c = 0.0;
    t1.d = v114;
    *(_OWORD *)&t1.tx = v115;
    -[CALayer contentsTransform](self, "contentsTransform");
    CGAffineTransformConcat(&v116, &t1, &t2);
    transform = v116;
    CGContextConcatCTM(a3, &transform);
    if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
    {
      v109.b = 0.0;
      v109.c = 0.0;
      v109.a = 1.0;
      *(_OWORD *)&v109.d = xmmword_18474DFF0;
      v109.ty = Height;
      CGContextConcatCTM(a3, &v109);
    }
    if (!-[CALayer edgeAntialiasingMask](self, "edgeAntialiasingMask"))
      CGContextSetShouldAntialias(a3, 0);
    v129.origin.x = 0.0;
    v129.origin.y = 0.0;
    v129.size.width = Width;
    v129.size.height = Height;
    CGContextClipToRect(a3, v129);
    if ((v17 & 1) == 0)
      CGImageRetain((CGImageRef)tinted_contents);
    v52 = *((_DWORD *)layer + 13);
    v53 = -[CALayer contentsMultiplyColor](self, "contentsMultiplyColor");
    v54 = -[CALayer contentsSwizzle](self, "contentsSwizzle");
    if (v54 == CFSTR("RGBA") || !-[__CFString isEqualToString:](v54, "isEqualToString:", CFSTR("AAAA")))
    {
      v57 = 0;
      if (!v53 || v53 == (CGColor *)white)
      {
LABEL_76:
        if (!(*((_DWORD *)layer + 13) & 0x40000000 | v52 & 0x400)
          || (v59 = v113, v58 = v114, v113 == 1.0) && v114 == 1.0)
        {
          CA::Transaction::unlock(v5);
          if (CGImageIsMask((CGImageRef)tinted_contents))
          {
            v130.origin.y = v103;
            v130.origin.x = v104;
            v130.size.width = v105;
            v130.size.height = v106;
            CGContextClipToMask(a3, v130, (CGImageRef)tinted_contents);
            CGContextSetFillColorWithColor(a3, v53);
            v131.origin.y = v103;
            v131.origin.x = v104;
            v131.size.width = v105;
            v131.size.height = v106;
            CGContextFillRect(a3, v131);
          }
          else
          {
            if (v57)
              v61 = v57;
            else
              v61 = (CGImage *)tinted_contents;
            v133.origin.y = v103;
            v133.origin.x = v104;
            v133.size.width = v105;
            v133.size.height = v106;
            CGContextDrawImage(a3, v133, v61);
          }
          v62 = *((_DWORD *)v5 + 25);
          *((_DWORD *)v5 + 25) = v62 + 1;
          if (v62)
            goto LABEL_88;
        }
        else
        {
          if (v57)
            v63 = v57;
          else
            v63 = (CGImage *)tinted_contents;
          -[CALayer contentsCenter](self, "contentsCenter");
          v65 = v64;
          v67 = v66;
          v69 = v68;
          v71 = v70;
          CGContextBeginTransparencyLayer(a3, 0);
          CGContextSetBlendMode(a3, kCGBlendModeCopy);
          if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
            v67 = 1.0 - (v67 + v71);
          v72 = -[CALayer literalContentsCenter](self, "literalContentsCenter");
          if (v69 == 0.0)
          {
            if (v72)
              v69 = 0.01;
            else
              v69 = 1.0 / Width;
            v65 = v65 + v69 * -0.5;
          }
          if (v71 == 0.0)
          {
            if (v72)
              v71 = 0.01;
            else
              v71 = 1.0 / Height;
            v67 = v67 + v71 * -0.5;
          }
          v116.a = 0.0;
          v116.b = v65 * Width;
          v116.c = (v65 + v69) * Width;
          v116.d = Width;
          v121 = 0;
          v73 = Width + (v116.c - Width) / v59;
          if (Width >= v65 * Width / v59)
            v74 = v65 * Width / v59;
          else
            v74 = Width;
          v75 = 0.0;
          if (v74 < 0.0)
            v74 = 0.0;
          if (Width < v73)
            v73 = Width;
          if (v73 < 0.0)
            v73 = 0.0;
          v122 = v74;
          v123 = v73;
          v124 = Width;
          if (v74 > v73)
          {
            v122 = (v73 + v74) * 0.5;
            v123 = v122;
          }
          v125.f64[0] = 0.0;
          v125.f64[1] = v67 * Height;
          v126 = (v67 + v71) * Height;
          v127 = Height;
          v117 = 0;
          v76 = v67 * Height / v58;
          v77 = Height + (v126 - Height) / v58;
          if (Height < v76)
            v76 = Height;
          if (v76 < 0.0)
            v76 = 0.0;
          if (Height < v77)
            v77 = Height;
          if (v77 >= 0.0)
            v75 = v77;
          v118 = v76;
          v119 = v75;
          v120 = Height;
          if (v76 > v75)
          {
            v118 = (v75 + v76) * 0.5;
            v119 = v118;
          }
          CGContextSetShouldAntialias(a3, 0);
          CA::Transaction::unlock(v5);
          v78 = 0;
          v79 = 0.0;
          v80 = 0.0;
          do
          {
            v96 = v125.f64[++v78];
            v99 = v79;
            v94 = *((double *)&v117 + v78);
            v98 = v94 - v79;
            if (v94 - v79 > 0.0)
            {
              v81 = 0;
              ty = -v80;
              rect = v96 - v80;
              v95 = -(v96 - v80);
              v82 = 0.0;
              v101 = 0.0;
              sy = v98 / (v96 - v80);
              do
              {
                v83 = v101;
                ++v81;
                v100 = *((double *)&v121 + v81);
                v101 = *(&v116.a + v81);
                v84 = v100 - v82;
                if (v100 - v82 > 0.0)
                {
                  v85 = v101 - v83;
                  if ((v52 & 0x400) != 0)
                  {
                    v86 = v113 * v82;
                    v87 = v114 * v99;
                    v88 = v113 * v84;
                    v89 = v114 * v98;
                    v90 = v114 * v99;
                    v102 = rect;
                    if ((*((_DWORD *)self->_attr.layer + 1) & 0x400000) == 0)
                    {
                      v134.origin.x = v86;
                      v134.origin.y = v114 * v99;
                      v134.size.width = v88;
                      v134.size.height = v114 * v98;
                      v90 = CGRectGetMaxY(v134) - rect;
                      v102 = v95;
                    }
                    v91 = -v83;
                    i = v86;
                    while (1)
                    {
                      v135.origin.x = v86;
                      v135.origin.y = v87;
                      v135.size.width = v88;
                      v135.size.height = v89;
                      if (v90 >= CGRectGetMaxY(v135))
                        break;
                      v136.origin.x = i;
                      v136.origin.y = v90;
                      v136.size.width = v85;
                      v136.size.height = rect;
                      if (CGRectGetMaxY(v136) <= v87)
                        break;
                      for (i = v86; ; i = i + v85)
                      {
                        v137.origin.x = v86;
                        v137.origin.y = v87;
                        v137.size.width = v88;
                        v137.size.height = v89;
                        if (i >= CGRectGetMaxX(v137))
                          break;
                        CGContextSaveGState(a3);
                        CGContextScaleCTM(a3, 1.0 / v113, 1.0 / v114);
                        v138.origin.x = i;
                        v138.origin.y = v90;
                        v138.size.width = v85;
                        v138.size.height = rect;
                        CGContextClipToRect(a3, v138);
                        CGContextTranslateCTM(a3, i, v90);
                        CGContextTranslateCTM(a3, v91, ty);
                        v139.origin.y = v103;
                        v139.origin.x = v104;
                        v139.size.width = v105;
                        v139.size.height = v106;
                        CGContextDrawImage(a3, v139, v63);
                        CGContextRestoreGState(a3);
                      }
                      v90 = v90 + v102;
                    }
                  }
                  else
                  {
                    CGContextSaveGState(a3);
                    v140.origin.x = v82;
                    v140.size.height = v98;
                    v140.origin.y = v99;
                    v140.size.width = v100 - v82;
                    CGContextClipToRect(a3, v140);
                    CGContextTranslateCTM(a3, v82, v99);
                    CGContextScaleCTM(a3, v84 / v85, sy);
                    CGContextTranslateCTM(a3, -v83, ty);
                    v141.origin.y = v103;
                    v141.origin.x = v104;
                    v141.size.width = v105;
                    v141.size.height = v106;
                    CGContextDrawImage(a3, v141, v63);
                    CGContextRestoreGState(a3);
                  }
                }
                v82 = v100;
              }
              while (v81 != 3);
            }
            v79 = v94;
            v80 = v96;
          }
          while (v78 != 3);
          CGContextEndTransparencyLayer(a3);
          v93 = *((_DWORD *)v5 + 25);
          *((_DWORD *)v5 + 25) = v93 + 1;
          if (v93)
          {
LABEL_88:
            if (!v57)
              goto LABEL_146;
            goto LABEL_145;
          }
        }
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        if (!v57)
        {
LABEL_146:
          CGImageRelease((CGImageRef)tinted_contents);
LABEL_147:
          CGContextRestoreGState(a3);
          goto LABEL_148;
        }
LABEL_145:
        CGImageRelease(v57);
        goto LABEL_146;
      }
      v56 = create_tinted_contents((CGImage *)tinted_contents, v53, 0);
    }
    else
    {
      if (v53)
        v55 = v53;
      else
        v55 = (CGColor *)white;
      v56 = create_tinted_contents((CGImage *)tinted_contents, v55, 1);
    }
    v57 = v56;
    goto LABEL_76;
  }
LABEL_148:
  CA::Transaction::unlock(v5);
}

- (CGAffineTransform)contentsTransform
{
  CGAffineTransform *result;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x89u, (const CGAffineTransform *)0x17, (id *)retstr);
  return result;
}

- (CAEdgeAntialiasingMask)edgeAntialiasingMask
{
  return (*((_DWORD *)self->_attr.layer + 11) >> 7) & 0xF;
}

- (id)valueForKeyPath:(id)a3
{
  return CAObject_valueForKeyPath(self, a3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  return CAAtomIndexInArray(74, (uint64_t)&-[CALayer(CALayerPrivate) _renderLayerDefinesProperty:]::atoms, a3) != -1;
}

- (unsigned)_renderLayerPropertyAnimationFlags:(unsigned int)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v10;

  v4 = CAAtomIndexInArray(49, (uint64_t)&-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::geom_atoms, a3);
  v5 = 0;
  while (-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::non_image_atoms[v5] != a3)
  {
    if (++v5 == 7)
    {
      v5 = -1;
      break;
    }
  }
  v6 = 0;
  while (-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::velocity_atoms[v6] != a3)
  {
    if (++v6 == 8)
    {
      v6 = -1;
      break;
    }
  }
  v7 = 0;
  do
    v8 = (unsigned __int16)-[CALayer(CALayerPrivate) _renderLayerPropertyAnimationFlags:]::color_atoms[v7];
  while (v8 != a3 && v7++ != 7);
  if (v5 == -1)
    v10 = (16 * (v4 != -1)) | 0x20;
  else
    v10 = 16 * (v4 != -1);
  if (a3 == 400 || a3 == 251)
    v10 |= 0x100u;
  if (a3 == 377)
    v10 |= 0x40u;
  if (v6 != -1)
    v10 |= 0x800u;
  if (v8 == a3)
    return v10;
  else
    return v10 | 0x1000;
}

+ (CALayer)layer
{
  return (CALayer *)objc_alloc_init((Class)a1);
}

- (CALayer)init
{
  CALayer *v2;
  CA::Layer *v3;
  objc_class *v4;
  CA::Transaction *v5;
  uint64_t v6;
  int v7;
  CA::Transaction *v8;
  malloc_zone_t *malloc_zone;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  self->_attr.magic = 1279351122;
  v15.receiver = self;
  v15.super_class = (Class)CALayer;
  v2 = -[CALayer init](&v15, sel_init);
  if (v2)
  {
    v3 = (CA::Layer *)objc_opt_class();
    v5 = (CA::Transaction *)CA::Layer::class_state(v3, v4);
    v6 = (uint64_t)v5;
    v7 = *(_DWORD *)v5;
    v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v8)
      v8 = (CA::Transaction *)CA::Transaction::create(v5);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v10 = malloc_type_zone_malloc(malloc_zone, 0x128uLL, 0x8BB15036uLL);
    if (v10)
    {
      v11 = v10;
      *v10 = 0;
      v10[1] = 0;
      v12 = (uint64_t)(v10 + 5);
      if ((v7 & 1) != 0)
        v13 = 33554434;
      else
        v13 = 0x2000000;
      v11[3] = 0;
      v11[4] = 0;
      v11[2] = v2;
      CA::Layer::State::State(v12, v6, v8);
      v11[19] = 0;
      v11[20] = 0;
      *((_DWORD *)v11 + 44) = 0;
      v11[21] = 0;
      *(_OWORD *)(v11 + 23) = 0u;
      *(_OWORD *)(v11 + 25) = 0u;
      *(_OWORD *)(v11 + 27) = 0u;
      *(_OWORD *)(v11 + 29) = 0u;
      *((_BYTE *)v11 + 248) = 0;
      v11[32] = 0;
      v11[33] = 0;
      v11[35] = 0;
      v11[36] = 0;
      *(_DWORD *)v11 = 1;
      *((_DWORD *)v11 + 1) = v13;
      v11[34] = 0;
      v2->_attr.layer = v11;
    }
  }
  return v2;
}

+ (BOOL)_hasRenderLayerSubclass
{
  return 0;
}

- (void)setAllowsHitTesting:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x10u, 66, 150, a3, 0, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)implicitAnimationForKeyPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  CALayer *v11;
  id v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;

  v5 = objc_msgSend(a3, "rangeOfString:", CFSTR("."));
  if (v6)
  {
    v7 = CAInternAtom((const __CFString *)objc_msgSend(a3, "substringToIndex:", v5), 0);
    v8 = 0;
    while (v7 != (unsigned __int16)-[CALayer(CALayerPrivate) implicitAnimationForKeyPath:]::atoms[v8])
    {
      if (++v8 == 5)
        return 0;
    }
    v11 = self;
    v12 = a3;
    v13 = 0;
    return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)v11, v12, v13);
  }
  v9 = CAInternAtom((const __CFString *)a3, 0);
  if (v9 == 117)
  {
    if ((*((_BYTE *)self->_attr.layer + 54) & 0x80) != 0)
    {
      return 0;
    }
    else
    {
      if (default_anim_once != -1)
        dispatch_once_f(&default_anim_once, 0, (dispatch_function_t)default_anim_init);
      return (id)basicAnim;
    }
  }
  else
  {
    v14 = v9;
    if (CAAtomIndexInArray(26, (uint64_t)&-[CALayer(CALayerPrivate) implicitAnimationForKeyPath:]::basic_atoms, v9) != -1)
    {
      v11 = self;
      v12 = a3;
      v13 = v14;
      return CALayerCreateImplicitAnimation((CAMediaTimingFunction *)v11, v12, v13);
    }
    v15 = 0;
    while (v14 != (unsigned __int16)-[CALayer(CALayerPrivate) implicitAnimationForKeyPath:]::trans_atoms[v15])
    {
      if (++v15 == 9)
        return 0;
    }
    if (default_anim_once != -1)
      dispatch_once_f(&default_anim_once, 0, (dispatch_function_t)default_anim_init);
    return (id)transition;
  }
}

- (id)stateWithName:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)-[CALayer states](self, "states");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_4:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "name"), "isEqualToString:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      v9 = 0;
      if (v6)
        goto LABEL_4;
      return v9;
    }
  }
}

- (CFTimeInterval)convertTime:(CFTimeInterval)t fromLayer:(CALayer *)l
{
  CA::Transaction *v6;
  CALayer *v7;
  int v8;
  CFTimeInterval result;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(CFTimeInterval *)v10 = t;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v8 = CA::Layer::convert_time(v6, (CA::Transaction *)v10, l, self, v7);
  result = *(double *)v10;
  if (!v8)
    return 0.0;
  return result;
}

+ (CALayer)allocWithZone:(_NSZone *)a3
{
  CALayer *result;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CALayer;
  result = objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
  if (result)
    result->_attr.refcount = 1;
  return result;
}

- (CALayer)presentationLayer
{
  CA::Layer *layer;
  CA::Transaction::Shared **v3;

  layer = (CA::Layer *)self->_attr.layer;
  v3 = (CA::Transaction::Shared **)CA::Transaction::ensure_compat((CA::Transaction *)self);
  return CA::Layer::presentation_layer(layer, v3);
}

- (CALayer)initWithLayer:(id)layer
{
  CALayer *v3;
  CALayer *v4;
  CA::Layer *v5;
  objc_class *v6;
  CA::Transaction *v7;
  uint64_t v8;
  int v9;
  CA::Transaction *v10;
  malloc_zone_t *malloc_zone;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  int v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_attr.magic = 1279351122;
  v17.receiver = self;
  v17.super_class = (Class)CALayer;
  v3 = -[CALayer init](&v17, sel_init, layer);
  v4 = v3;
  if (v3 && !v3->_attr.layer)
  {
    v5 = (CA::Layer *)objc_opt_class();
    v7 = (CA::Transaction *)CA::Layer::class_state(v5, v6);
    v8 = (uint64_t)v7;
    v9 = *(_DWORD *)v7;
    v10 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v10)
      v10 = (CA::Transaction *)CA::Transaction::create(v7);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v12 = malloc_type_zone_malloc(malloc_zone, 0x128uLL, 0x8BB15036uLL);
    if (v12)
    {
      v13 = v12;
      *v12 = 0;
      v12[1] = 0;
      v14 = (uint64_t)(v12 + 5);
      if ((v9 & 1) != 0)
        v15 = 33554434;
      else
        v15 = 0x2000000;
      v13[3] = 0;
      v13[4] = 0;
      v13[2] = v4;
      CA::Layer::State::State(v14, v8, v10);
      v13[19] = 0;
      v13[20] = 0;
      *((_DWORD *)v13 + 44) = 0;
      v13[21] = 0;
      *(_OWORD *)(v13 + 23) = 0u;
      *(_OWORD *)(v13 + 25) = 0u;
      *(_OWORD *)(v13 + 27) = 0u;
      *(_OWORD *)(v13 + 29) = 0u;
      *((_BYTE *)v13 + 248) = 0;
      v13[32] = 0;
      v13[33] = 0;
      v13[35] = 0;
      v13[36] = 0;
      *(_DWORD *)v13 = 1;
      *((_DWORD *)v13 + 1) = v15;
      v13[34] = 0;
      v4->_attr.layer = v13;
    }
  }
  return v4;
}

- (BOOL)isFrozen
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 6) & 1;
}

- (void)removePresentationModifier:(id)a3
{
  id *layer;
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  objc_object *v8[2];

  v8[1] = *(objc_object **)MEMORY[0x1E0C80C00];
  layer = (id *)self->_attr.layer;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v8[0] = 0;
  CA::Layer::begin_change((CA::Layer *)layer, v6, CFSTR("presentationModifiers"), (objc_object *)v8, v5);
  objc_msgSend(layer[36], "removeObject:", a3);
  CA::Layer::end_change(layer, v6, 435, (objc_object *)CFSTR("presentationModifiers"), v8[0]);
  CA::Transaction::unlock(v6);
}

- (void)setCornerContentsMasksEdges:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x8Fu, 77, 163, a3, 0, 0);
}

- (void)setDelegate:(id)delegate
{
  CA::Layer::set_delegate((CA::Layer *)self->_attr.layer, (objc_object *)delegate, 1);
}

- (void)setMinificationFilter:(CALayerContentsFilter)minificationFilter
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = minificationFilter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x17C, (const CGAffineTransform *)3, v3);
}

- (void)setWantsExtendedDynamicRangeContent:(BOOL)wantsExtendedDynamicRangeContent
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x24Fu, 68, 152, wantsExtendedDynamicRangeContent, 0, 0);
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = borderWidth;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x43, (const CGAffineTransform *)0x12, v3);
}

- (void)setFlipsHorizontalAxis:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xE0u, 60, 146, a3, 0, 0);
}

- (void)setContentsScale:(CGFloat)contentsScale
{
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  void *layer;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  CA::AttrList *v13;
  malloc_zone_t *malloc_zone;
  CA::AttrList *v15;
  objc_object *v16;
  double v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v18 = contentsScale;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = self->_attr.layer;
  v9 = (*((_DWORD *)layer + 11) >> 26) & 3;
  v17 = 0.0;
  if (v9)
  {
    v17 = (double)v9;
  }
  else
  {
    v10 = *((_QWORD *)layer + 9);
    if (!v10 || (CA::AttrList::get(v10, 134, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v17) & 1) == 0)
      CA::Layer::default_value((id *)layer, 0x86u, (const CGAffineTransform *)0x12, (uint64_t)&v17);
  }
  if (v17 != contentsScale)
  {
    v16 = 0;
    CA::Layer::begin_change((CA::Layer *)layer, v6, CFSTR("contentsScale"), (objc_object *)&v16, v5);
    v11 = CA::Layer::writable_state((CA::Layer *)layer, v6);
    v12 = v11;
    *((_DWORD *)v11 + 4) = *((_DWORD *)v11 + 4) & 0xFFFFFFFE | (contentsScale != 1.0);
    if (contentsScale == 3.0 || contentsScale == 1.0 || contentsScale == 2.0)
    {
      *((_DWORD *)v11 + 1) = *((_DWORD *)v11 + 1) & 0xF3FFFFFF | ((contentsScale & 3) << 26);
      v15 = (CA::AttrList *)*((_QWORD *)v11 + 4);
      if (v15)
        v15 = CA::AttrList::remove(v15, (const void *)0x86);
    }
    else
    {
      *((_DWORD *)v11 + 1) &= 0xF3FFFFFF;
      v13 = (CA::AttrList *)*((_QWORD *)v11 + 4);
      if (!v13)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        v13 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
      }
      v15 = CA::AttrList::set(v13, (const void *)0x86, 18, (unsigned __int8 *)v18);
    }
    *((_QWORD *)v12 + 4) = v15;
    CA::Layer::end_change((id *)layer, v6, 134, (objc_object *)CFSTR("contentsScale"), v16);
  }
  CA::Transaction::unlock(v6);
}

- (void)setRasterizationScale:(CGFloat)rasterizationScale
{
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  void *layer;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  char *v12;
  CA::AttrList *v13;
  malloc_zone_t *malloc_zone;
  CA::AttrList *v15;
  objc_object *v16;
  double v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  *(CGFloat *)v18 = rasterizationScale;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = self->_attr.layer;
  v9 = (*((_DWORD *)layer + 11) >> 28) & 3;
  v17 = 0.0;
  if (v9)
  {
    v17 = (double)v9;
  }
  else
  {
    v10 = *((_QWORD *)layer + 9);
    if (!v10 || (CA::AttrList::get(v10, 447, (const CGAffineTransform *)0x12, (CA::Mat4Impl *)&v17) & 1) == 0)
      CA::Layer::default_value((id *)layer, 0x1BFu, (const CGAffineTransform *)0x12, (uint64_t)&v17);
  }
  if (v17 != rasterizationScale)
  {
    v16 = 0;
    CA::Layer::begin_change((CA::Layer *)layer, v6, CFSTR("rasterizationScale"), (objc_object *)&v16, v5);
    v11 = CA::Layer::writable_state((CA::Layer *)layer, v6);
    v12 = v11;
    if (rasterizationScale == 3.0 || rasterizationScale == 1.0 || rasterizationScale == 2.0)
    {
      *((_DWORD *)v11 + 1) = *((_DWORD *)v11 + 1) & 0xCFFFFFFF | ((rasterizationScale & 3) << 28);
      v15 = (CA::AttrList *)*((_QWORD *)v11 + 4);
      if (v15)
        v15 = CA::AttrList::remove(v15, (const void *)0x1BF);
    }
    else
    {
      *((_DWORD *)v11 + 1) &= 0xCFFFFFFF;
      v13 = (CA::AttrList *)*((_QWORD *)v11 + 4);
      if (!v13)
      {
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        v13 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
      }
      v15 = CA::AttrList::set(v13, (const void *)0x1BF, 18, (unsigned __int8 *)v18);
    }
    *((_QWORD *)v12 + 4) = v15;
    CA::Layer::end_change((id *)layer, v6, 447, (objc_object *)CFSTR("rasterizationScale"), v16);
  }
  CA::Transaction::unlock(v6);
}

- (void)setEdgeAntialiasingMask:(CAEdgeAntialiasingMask)edgeAntialiasingMask
{
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0xBEu, 7u, 0x79u, 15, edgeAntialiasingMask);
}

- (NSArray)presentationModifiers
{
  id *layer;
  CA::Transaction *v3;
  int v4;
  void *v5;

  layer = (id *)self->_attr.layer;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v5 = (void *)objc_msgSend(layer[36], "copy");
  CA::Transaction::unlock(v3);
  return (NSArray *)v5;
}

- (void)setContentsOpaque:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x84u, 76, 162, a3, 0, 0);
}

- (void)setCornerContents:(id)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x8D, (const CGAffineTransform *)2, v3);
}

- (void)setCornerContentsCenter:(CGRect)a3
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x8E, (const CGAffineTransform *)0x15, &v3.origin.x);
}

+ (BOOL)needsDisplayForKey:(NSString *)key
{
  return 0;
}

- (void)setShadowColor:(CGColorRef)shadowColor
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = shadowColor;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1EA, (const CGAffineTransform *)2, v3);
}

- (void)removeAllAnimations
{
  CA::Transaction *v3;
  CALayer *v4;
  CALayer *v5;
  _WORD *v6;
  int v7;
  CA::Layer *layer;
  _QWORD *v9;
  __int16 v10;
  uint64_t v11;
  _WORD *v12;

  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = -[CALayer modelLayer](self, "modelLayer");
  if (v4)
  {
    v5 = v4;
    v6 = (_WORD *)*((_QWORD *)v4->_attr.layer + 35);
    if (v6)
    {
      v7 = *((_DWORD *)v3 + 25);
      *((_DWORD *)v3 + 25) = v7 + 1;
      if (v7)
      {
        v12 = v6;
      }
      else
      {
        os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
        layer = (CA::Layer *)v5->_attr.layer;
        v6 = (_WORD *)*((_QWORD *)layer + 35);
        v12 = v6;
        if (!v6)
        {
          v11 = 0;
LABEL_13:
          CA::Layer::set_animations(layer, v11);
          CA::Layer::mark_animations((CA::Layer *)v5->_attr.layer, v3, 0);
          CA::Transaction::unlock(v3);
          return;
        }
      }
      v9 = &v12;
      do
      {
        v10 = v6[28];
        if ((v10 & 0x42) != 0)
        {
          v6[28] = v10 | 4;
          v9 = v6;
        }
        else
        {
          *v9 = *(_QWORD *)v6;
          schedule_stop_callback((uint64_t)v6, (uint64_t *)&animation_state);
          free_non_deferred_animation(v6, 1);
        }
        v6 = (_WORD *)*v9;
      }
      while (*v9);
      layer = (CA::Layer *)v5->_attr.layer;
      v11 = (uint64_t)v12;
      goto LABEL_13;
    }
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    kContentsStringHash = objc_msgSend(CFSTR("contents"), "hash");
    kCATransitionClass = objc_opt_class();
    kCAPropertyAnimationClass = objc_opt_class();
    LINKED_DEFAULT_CONTINUOUS_CORNERS = dyld_program_sdk_at_least();
    CAIsAppSuspended();
  }
}

- (void)setSecurityMode:(id)a3
{
  int v5;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("unrestricted")) & 1) != 0)
    v5 = 2;
  else
    v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("insecure"));
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x1E2u, 0x1Eu, 0xAAu, 3, v5);
}

- (void)drawInContext:(CGContextRef)ctx
{
  char *v5;
  id v6;
  void *v7;
  CA::Transaction *v8;
  int v9;
  char *layer;
  id Weak;
  id *v12;
  id v13;

  if ((*((_BYTE *)self->_attr.layer + 57) & 0x40) != 0)
  {
    v8 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v8)
      v8 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
    v9 = *((_DWORD *)v8 + 25);
    *((_DWORD *)v8 + 25) = v9 + 1;
    if (!v9)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    layer = (char *)self->_attr.layer;
    if ((layer[57] & 0x40) != 0)
    {
      v12 = (id *)(layer + 128);
      if (layer[136])
        Weak = objc_loadWeak(v12);
      else
        Weak = *v12;
    }
    else
    {
      Weak = 0;
    }
    CA::Transaction::unlock(v8);
    objc_msgSend(Weak, "drawLayer:inContext:", self, ctx);
  }
  else
  {
    v5 = (char *)CA::Transaction::ensure_compat((CA::Transaction *)self) + 88;
    while (1)
    {
      v5 = *(char **)v5;
      if (!v5)
        break;
      if ((v5[28] & 1) != 0)
      {
        if ((v5[24] & 1) != 0)
          return;
        break;
      }
    }
    v6 = -[CALayer actionForKey:](self, "actionForKey:", CFSTR("onDraw"));
    if (v6)
    {
      v7 = v6;
      v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", ctx, CFSTR("context"), 0);
      objc_msgSend(v7, "runActionForKey:object:arguments:", CFSTR("onDraw"), self, v13);

    }
  }
}

- (void)setZPosition:(CGFloat)zPosition
{
  double v3;
  double v5;
  double v6[2];

  v3 = zPosition;
  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  if (zPosition > 3.40282347e38 || zPosition < -3.40282347e38)
  {
    NSLog(CFSTR("CoreAnimation: zPosition should be within (-FLT_MAX, FLT_MAX) range."), a2);
    v5 = -3.40282347e38;
    if (v3 >= -3.40282347e38)
      v5 = v3;
    v3 = fmin(v5, 3.40282347e38);
  }
  v6[0] = v3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x25C, (const CGAffineTransform *)0x12, v6);
}

- (void)setShouldRasterize:(BOOL)shouldRasterize
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1F1u, 52, 138, shouldRasterize, 0, 0);
}

- (BOOL)_usesCornerRadii
{
  return *((_BYTE *)self->_attr.layer + 59) & 1;
}

- (void)setShadowPath:(CGPathRef)shadowPath
{
  CFTypeID v5;
  CGPathRef v6;
  const CGPath *v7;
  double v8[2];

  v8[1] = *(double *)MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
  {
    if (shadowPath)
    {
      v5 = CFGetTypeID(shadowPath);
      if (v5 == CGPathGetTypeID())
        v6 = shadowPath;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    v7 = (const CGPath *)MEMORY[0x186DBC640](v6);
    *(_QWORD *)&v8[0] = v7;
    CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1ED, (const CGAffineTransform *)2, v8);
    CGPathRelease(v7);
  }
  else
  {
    *(_QWORD *)&v8[0] = shadowPath;
    CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1ED, (const CGAffineTransform *)2, v8);
  }
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  return CAObject_automaticallyNotifiesObserversForKey(v4, (const __CFString *)a3);
}

- (id)valueForUndefinedKey:(id)a3
{
  CA::Transaction *v5;
  unsigned int v6;
  int v7;
  CA::Layer *layer;
  uint64_t v9;
  objc_object *v10;
  objc_object *v12[2];

  v12[1] = *(objc_object **)MEMORY[0x1E0C80C00];
  v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v6 = CAInternAtom((const __CFString *)a3, 1);
  v7 = *((_DWORD *)v5 + 25);
  *((_DWORD *)v5 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = (CA::Layer *)self->_attr.layer;
  v12[0] = 0;
  v9 = *((_QWORD *)layer + 9);
  if ((!v9 || (CA::AttrList::get(v9, v6, (const CGAffineTransform *)1, (CA::Mat4Impl *)v12) & 1) == 0)
    && (CA::Layer::style_value(layer, v6, v12) & 1) == 0)
  {
    v12[0] = 0;
  }
  v10 = v12[0];
  CA::Transaction::unlock(v5);
  return v10;
}

- (void)addPresentationModifier:(id)a3
{
  CA::Layer *layer;
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  id v8;
  objc_object *v9[2];

  v9[1] = *(objc_object **)MEMORY[0x1E0C80C00];
  layer = (CA::Layer *)self->_attr.layer;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v9[0] = 0;
  CA::Layer::begin_change(layer, v6, CFSTR("presentationModifiers"), (objc_object *)v9, v5);
  v8 = (id)*((_QWORD *)layer + 36);
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)layer + 36) = v8;
  }
  objc_msgSend(v8, "addObject:", a3);
  CA::Layer::end_change((id *)layer, v6, 435, (objc_object *)CFSTR("presentationModifiers"), v9[0]);
  CA::Transaction::unlock(v6);
}

+ (void)CAMLParserStartElement:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "CA_initialize_for_decoding");
  objc_msgSend(a3, "setElementValue:", v4);

}

- (id)CAMLTypeForKey:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("animations")) & 1) != 0)
    return CFSTR("NSDictionary");
  else
    return (id)CAObject_CAMLTypeForKey((uint64_t)self, (const __CFString *)a3);
}

- (void)setDisableUpdateMask:(unsigned int)a3
{
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0xB1u, 0xFu, 0xA9u, 2047, a3);
}

- (void)insertSublayer:(CALayer *)layer below:(CALayer *)sibling
{
  CALayer *v6;
  _QWORD *v7;
  _QWORD *v8;
  CA::Transaction *v9;
  int v10;
  CA::Layer *v11;
  CA::Layer *v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;

  if (layer)
  {
    v6 = self;
    v7 = self->_attr.layer;
    if ((*((_DWORD *)v7 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v7[2]);
    v8 = layer->_attr.layer;
    if ((*((_DWORD *)v8 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v8[2]);
    v9 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    v10 = *((_DWORD *)v9 + 25);
    *((_DWORD *)v9 + 25) = v10 + 1;
    if (!v10)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v11 = (CA::Layer *)v6->_attr.layer;
    if (!sibling)
    {
      CA::Layer::insert_sublayer(v11, v9, layer, 0);
LABEL_25:
      CA::Transaction::unlock(v9);
      return;
    }
    v12 = CA::Layer::sublayers(v11);
    if (v12)
    {
      v13 = (_QWORD *)((char *)v12 + 8);
      v14 = *((_QWORD *)v12 + 2);
      if (v14 == 1)
      {
        if (!*((_QWORD *)v12 + 3))
        {
LABEL_18:
          v15 = 0;
          while ((CALayer *)v13[v15] != sibling)
          {
            if (v14 == ++v15)
              goto LABEL_24;
          }
          if (v15 != -1)
            v14 = v15;
          goto LABEL_24;
        }
LABEL_17:
        v13 = (_QWORD *)*v13;
        goto LABEL_18;
      }
      if (v14)
        goto LABEL_17;
    }
    else
    {
      v14 = 0;
    }
LABEL_24:
    CA::Layer::insert_sublayer((CA::Layer *)v6->_attr.layer, v9, layer, v14);
    goto LABEL_25;
  }
}

- (CALayer)initWithCoder:(id)a3
{
  unsigned __int16 ***v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  CAAnimation *v12;
  __CFString *v13;
  CFTypeID v14;

  v4 = (unsigned __int16 ***)CAObject_initWithCoder(self, a3);
  if (v4)
  {
    if (CALayerDecodeAnimations(CALayer *,NSCoder *)::once != -1)
      dispatch_once(&CALayerDecodeAnimations(CALayer *,NSCoder *)::once, &__block_literal_global_10625);
    v5 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(MEMORY[0x1E0CB3510], "CA_supportedClasses"), CFSTR("CALayerAnimations"));
    v6 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", CALayerDecodeAnimations(CALayer *,NSCoder *)::keys_classes, CFSTR("CALayerAnimationKeys"));
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      v8 = (void *)v6;
      v9 = objc_msgSend(v5, "count");
      v10 = objc_msgSend(v8, "count");
      if (v9)
      {
        if (v10 == v9)
        {
          for (i = 0; i != v9; ++i)
          {
            v12 = (CAAnimation *)objc_msgSend(v5, "objectAtIndex:", i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = (__CFString *)objc_msgSend(v8, "objectAtIndex:", i);
              v14 = CFGetTypeID(v13);
              if (v14 == CFStringGetTypeID())
                CA::Layer::add_animation(v4[2], v12, v13);
            }
          }
        }
      }
    }
  }
  return (CALayer *)v4;
}

- (void)setPreloadsCache:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1B1u, 57, 143, a3, 0, 0);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  CA::Transaction *v7;
  const void *v8;
  int v9;
  CA::Layer *layer;
  uint64_t v11;
  objc_object *String;
  objc_object **v13;
  char *v14;
  CA::AttrList *v15;
  malloc_zone_t *malloc_zone;
  objc_object *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v19[0] = a3;
  v7 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v8 = (const void *)CAInternAtom((const __CFString *)a4, 1);
  v9 = *((_DWORD *)v7 + 25);
  *((_DWORD *)v7 + 25) = v9 + 1;
  if (!v9)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  layer = (CA::Layer *)self->_attr.layer;
  v18 = 0;
  v11 = *((_QWORD *)layer + 9);
  if (!v11
    || !CA::AttrList::get(v11, (int)v8, (const CGAffineTransform *)1, (CA::Mat4Impl *)&v18)
    || (objc_msgSend(v18, "isEqual:", a3) & 1) == 0)
  {
    v17 = 0;
    String = (objc_object *)CAAtomGetString(v8);
    CA::Layer::begin_change(layer, v7, String, (objc_object *)&v17, v13);
    v14 = CA::Layer::writable_state(layer, v7);
    v15 = (CA::AttrList *)*((_QWORD *)v14 + 4);
    if (!v15)
    {
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v15 = (CA::AttrList *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x10uLL, 0x743898A5uLL);
    }
    *((_QWORD *)v14 + 4) = CA::AttrList::set(v15, v8, 2, (unsigned __int8 *)v19);
    CA::Layer::end_change((id *)layer, v7, (int)v8, String, v17);
  }
  CA::Transaction::unlock(v7);
}

+ (void)CAMLParserEndElement:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(a3, "elementValue");
  if (objc_msgSend(v3, "needsDisplayOnBoundsChange"))
  {
    v4 = objc_msgSend(v3, "contents");
    if (v4)
      objc_msgSend(v3, "setContents:", v4);
    else
      objc_msgSend(v3, "setNeedsDisplay");
  }
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  return objc_opt_class() != (_QWORD)a3;
}

- (void)setAllowsDisplayCompositing:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xAu, 67, 151, a3, 0, 0);
}

- (void)setSortsSublayers:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1FAu, 58, 144, a3, 0, 0);
}

- (void)setUsesWebKitBehavior:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x23Bu, 59, 145, a3, 0, 0);
}

+ (void)CA_setterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 0);
}

+ (void)CA_getterForProperty:(const _CAPropertyInfo *)a3
{
  return (void *)block_ctors[*((unsigned __int16 *)a3 + 2)](a3->var0, 1);
}

- (void)setTimeOffset:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x223, (const CGAffineTransform *)0x12, v3);
}

- (void)setActions:(NSDictionary *)actions
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = actions;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)1, (const CGAffineTransform *)3, v3);
}

- (void)insertSublayer:(CALayer *)layer above:(CALayer *)sibling
{
  CALayer *v6;
  _QWORD *v7;
  _QWORD *v8;
  CA::Transaction *v9;
  int v10;
  CA::Layer *v11;
  CA::Layer *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;

  if (layer)
  {
    v6 = self;
    v7 = self->_attr.layer;
    if ((*((_DWORD *)v7 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v7[2]);
    v8 = layer->_attr.layer;
    if ((*((_DWORD *)v8 + 1) & 0x60000) != 0)
      self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v8[2]);
    v9 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    v10 = *((_DWORD *)v9 + 25);
    *((_DWORD *)v9 + 25) = v10 + 1;
    if (!v10)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v11 = (CA::Layer *)v6->_attr.layer;
    if (!sibling)
    {
      CA::Layer::insert_sublayer(v11, v9, layer, 0xFFFFFFFFFFFFFFFFLL);
LABEL_25:
      CA::Transaction::unlock(v9);
      return;
    }
    v12 = CA::Layer::sublayers(v11);
    if (v12)
    {
      v13 = (_QWORD *)((char *)v12 + 8);
      v14 = *((_QWORD *)v12 + 2);
      if (v14 == 1)
      {
        if (!*((_QWORD *)v12 + 3))
        {
LABEL_18:
          v15 = 0;
          while ((CALayer *)v13[v15] != sibling)
          {
            if (v14 == ++v15)
              goto LABEL_24;
          }
          if (v15 != -1)
            v14 = v15 + 1;
          goto LABEL_24;
        }
LABEL_17:
        v13 = (_QWORD *)*v13;
        goto LABEL_18;
      }
      if (v14)
        goto LABEL_17;
    }
    else
    {
      v14 = 0;
    }
LABEL_24:
    CA::Layer::insert_sublayer((CA::Layer *)v6->_attr.layer, v9, layer, v14);
    goto LABEL_25;
  }
}

- (void)setMagnificationFilter:(CALayerContentsFilter)magnificationFilter
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = magnificationFilter;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x16C, (const CGAffineTransform *)3, v3);
}

- (void)setGeometryFlipped:(BOOL)geometryFlipped
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xF3u, 43, 129, geometryFlipped, (unint64_t)CA::Layer::toggle_flipped, 0);
}

- (unsigned)disableUpdateMask
{
  return (*((_DWORD *)self->_attr.layer + 11) >> 15) & 0x7FF;
}

- (BOOL)isGeometryFlipped
{
  return (*((unsigned __int8 *)self->_attr.layer + 49) >> 3) & 1;
}

- (void)setClearsContext:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x59u, 42, 128, a3, 0, 0);
}

- (BOOL)_continuousCorners
{
  return -[CALayer cornerCurve](self, "cornerCurve") == (CALayerCornerCurve)CFSTR("continuous");
}

- (BOOL)continuousCorners
{
  return -[CALayer cornerCurve](self, "cornerCurve") == (CALayerCornerCurve)CFSTR("continuous");
}

- (CALayerCornerCurve)cornerCurve
{
  unsigned int v2;

  v2 = ((*((_DWORD *)self->_attr.layer + 12) >> 1) & 3) - 1;
  if (v2 > 2)
    return (CALayerCornerCurve)CFSTR("circular");
  else
    return &off_1E15A8B48[v2]->isa;
}

- (void)setContentsDirtyRect:(CGRect)a3
{
  CGRect v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x79, (const CGAffineTransform *)0x15, &v3.origin.x);
}

- (void)setAnchorPointZ:(CGFloat)anchorPointZ
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = anchorPointZ;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1A, (const CGAffineTransform *)0x12, v3);
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x228u, 69, 153, a3, 0, 0);
}

- (NSDictionary)actions
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 1u, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (void)setDrawsAsynchronously:(BOOL)drawsAsynchronously
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xBAu, 71, 157, drawsAsynchronously, 0, 0);
}

- (CALayerContentsGravity)contentsGravity
{
  unint64_t v2;

  v2 = ((unint64_t)*((unsigned int *)self->_attr.layer + 11) >> 3) & 0xF;
  if (v2 > 0xB)
    return 0;
  else
    return (CALayerContentsGravity)CAAtomGetString(CA::Render::gravity_atoms[v2]);
}

- (void)setSpeed:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x203, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setMeshTransform:(id)a3
{
  double v4[2];

  v4[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4[0] = objc_msgSend(a3, "meshTransformForLayer:", self);
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x179, (const CGAffineTransform *)3, v4);
}

- (CALayerContentsFormat)contentsFormat
{
  CALayerContentsFormat *v2;

  if ((*((_BYTE *)self->_attr.layer + 44) & 7u) - 1 > 4)
    v2 = (CALayerContentsFormat *)&kCAContentsFormatRGBA8Uint;
  else
    v2 = (CALayerContentsFormat *)off_1E159D198[((*((_BYTE *)self->_attr.layer + 44) & 7) - 1)];
  return *v2;
}

- (void)setInvertsMask:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x145u, 51, 127, a3, 0, 0);
}

+ (CGFloat)cornerCurveExpansionFactor:(CALayerCornerCurve)curve
{
  _BOOL4 v3;
  CGFloat result;

  v3 = -[NSString isEqualToString:](curve, "isEqualToString:", CFSTR("continuous"));
  result = 1.528665;
  if (!v3)
    return 1.0;
  return result;
}

- (void)setRepeatCount:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1CA, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)replaceSublayer:(CALayer *)oldLayer with:(CALayer *)newLayer
{
  CALayer *v6;
  _QWORD *layer;
  _QWORD *v8;
  unsigned int *v9;
  uint64_t v10;
  objc_object **v11;
  unsigned int *v12;
  CA::Layer *v13;
  unsigned int v14;
  _QWORD *v15;
  unsigned int *v16;
  uint64_t v17;
  objc_object **v18;
  unsigned int *v19;
  objc_object **v20;
  unsigned int v21;
  unsigned int v22;
  malloc_zone_t *malloc_zone;
  int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CA::Layer *v29;
  uint64_t v30;
  int v31;
  unsigned int v32;
  unsigned int v33;
  malloc_zone_t *v34;
  objc_object v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (oldLayer == newLayer)
    return;
  v6 = self;
  layer = self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) != 0)
    self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), layer[2]);
  v8 = oldLayer->_attr.layer;
  if ((*((_DWORD *)v8 + 1) & 0x60000) != 0)
    self = (CALayer *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v8[2]);
  v9 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
  v12 = CA::Layer::retain_parent((CA::Layer *)oldLayer->_attr.layer, (CA::Transaction *)v9);
  v13 = (CA::Layer *)v12;
  if (v12 != v6->_attr.layer)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalid"), CFSTR("replaced layer %@ is not a sublayer of %@"), oldLayer, v6);
    v13 = (CA::Layer *)v6->_attr.layer;
  }
  v14 = v9[25];
  v9[25] = v14 + 1;
  if (v14)
  {
    if (newLayer)
      goto LABEL_10;
LABEL_20:
    CA::Layer::remove_sublayer(v13, (CA::Transaction *)v9, oldLayer, v10, v11);
    CA::Transaction::release_object((CA::Transaction *)v9, oldLayer);
    goto LABEL_46;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if (!newLayer)
    goto LABEL_20;
LABEL_10:
  v15 = newLayer->_attr.layer;
  if ((*((_DWORD *)v15 + 1) & 0x60000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalidTree"), CFSTR("expecting model layer not copy: %@"), v15[2]);
    v15 = newLayer->_attr.layer;
  }
  v16 = CA::Layer::retain_parent((CA::Layer *)v15, (CA::Transaction *)v9);
  if (v16)
  {
    v19 = v16;
    CA::Layer::remove_sublayer((CA::Layer *)v16, (CA::Transaction *)v9, newLayer, v17, v18);
LABEL_14:
    v21 = *v19;
    if (*v19)
    {
      do
      {
        v22 = __ldaxr(v19);
        if (v22 != v21)
        {
          __clrex();
          goto LABEL_14;
        }
      }
      while (__stlxr(v21 - 1, v19));
      if (v21 == 1)
      {
        CA::Layer::destroy((CA::Layer *)v19);
        CA::Layer::~Layer((CA::AttrList **)v19);
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        malloc_zone_free(malloc_zone, v19);
      }
    }
  }
  else
  {
    CFRetain(newLayer);
    CA::Layer::remove_from_context((CA::Layer *)newLayer->_attr.layer);
  }
  if (*((CALayer **)v13 + 4) == oldLayer)
  {
    CA::Layer::set_mask((CA::Layer ***)v13, newLayer);
    CA::Transaction::release_object((CA::Transaction *)v9, newLayer);
    goto LABEL_46;
  }
  v35.isa = 0;
  CA::Layer::begin_change(v13, (CA::Transaction *)v9, CFSTR("sublayers"), &v35, v20);
  v24 = CA::Layer::ancestor_context_id(v13, (CA::Transaction *)v9);
  CA::Layer::update_removed_sublayer((CA::Layer *)oldLayer->_attr.layer, (CA::Transaction *)v9, v24);
  CA::Transaction::release_object((CA::Transaction *)v9, oldLayer);
  v25 = (uint64_t *)(*((_QWORD *)v13 + 3) + 8);
  v26 = *(_QWORD *)(*((_QWORD *)v13 + 3) + 16);
  if (v26 == 1)
  {
    v27 = *((_QWORD *)v13 + 3) + 8;
    if (!*(_QWORD *)(*((_QWORD *)v13 + 3) + 24))
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v26)
  {
LABEL_30:
    v27 = *v25;
LABEL_31:
    v28 = 0;
    while (*(CALayer **)(v27 + 8 * v28) != oldLayer)
    {
      if (v26 == ++v28)
      {
        v28 = -1;
        break;
      }
    }
    if (!*(_BYTE *)(*((_QWORD *)v13 + 3) + 40))
    {
      if (v26 == 1 && !*(_QWORD *)(*((_QWORD *)v13 + 3) + 24))
        goto LABEL_42;
      goto LABEL_41;
    }
LABEL_55:
    abort();
  }
  if (*(_BYTE *)(*((_QWORD *)v13 + 3) + 40))
    goto LABEL_55;
  v28 = -1;
LABEL_41:
  v25 = (uint64_t *)*v25;
LABEL_42:
  v25[v28] = (uint64_t)newLayer;
  CA::Layer::update_added_sublayer((CA::Layer *)newLayer->_attr.layer, (CA::Transaction *)v9, v13, v24);
  v29 = (CA::Layer *)newLayer->_attr.layer;
  v30 = v9[24];
  if ((v30 & 0x80000000) != 0 || (v31 = *((_DWORD *)v29 + v30 + 68)) == 0)
    v31 = *CA::Layer::thread_flags_(v29, (CA::Transaction *)v9);
  CA::Layer::update_for_changed_sublayers(v13, (CA::Transaction *)v9, v31);
  CA::Layer::end_change((id *)v13, (CA::Transaction *)v9, 536, (objc_object *)CFSTR("sublayers"), (objc_object *)v35.isa);
LABEL_46:
  CA::Transaction::unlock((CA::Transaction *)v9);
  if (v12)
  {
LABEL_47:
    v32 = *v12;
    if (*v12)
    {
      do
      {
        v33 = __ldaxr(v12);
        if (v33 != v32)
        {
          __clrex();
          goto LABEL_47;
        }
      }
      while (__stlxr(v32 - 1, v12));
      if (v32 == 1)
      {
        CA::Layer::destroy((CA::Layer *)v12);
        CA::Layer::~Layer((CA::AttrList **)v12);
        v34 = (malloc_zone_t *)get_malloc_zone();
        malloc_zone_free(v34, v12);
      }
    }
  }
}

- (BOOL)contentsAlignsToPixels
{
  return *((_BYTE *)self->_attr.layer + 53) & 1;
}

- (void)addState:(id)a3
{
  -[CALayer insertState:atIndex:](self, "insertState:atIndex:", a3, 0xFFFFFFFFLL);
}

- (void)insertState:(id)a3 atIndex:(unsigned int)a4
{
  id v7;
  uint64_t v8;
  id v9;

  v7 = (id)objc_msgSend((id)-[CALayer states](self, "states"), "mutableCopy");
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = v7;
  if (objc_msgSend(v7, "count") >= (unint64_t)a4)
    v8 = a4;
  else
    v8 = objc_msgSend(v9, "count");
  objc_msgSend(v9, "insertObject:atIndex:", a3, v8);
  -[CALayer setStates:](self, "setStates:", v9);

}

- (void)removeState:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v5 = (void *)-[CALayer states](self, "states");
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", a3);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      v9 = (id)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v9, "removeObjectAtIndex:", v8);
      -[CALayer setStates:](self, "setStates:", v9);

    }
  }
}

- (id)dependentStatesOfState:(id)a3
{
  __CFSet *Mutable;

  Mutable = CFSetCreateMutable(0, 0, 0);
  addDependentStates((CAState *)a3, Mutable, (NSArray *)-[CALayer states](self, "states"));
  return Mutable;
}

- (id)stateTransitionFrom:(id)a3 to:(id)a4
{
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = (const __CFString *)a3;
  else
    v4 = &stru_1E15B0530;
  v14 = 0u;
  v15 = 0u;
  if (a4)
    v5 = (const __CFString *)a4;
  else
    v5 = &stru_1E15B0530;
  v16 = 0uLL;
  v17 = 0uLL;
  v6 = (void *)-[CALayer stateTransitions](self, "stateTransitions");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v15;
LABEL_9:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    if (objc_msgSend((id)objc_msgSend(v11, "fromState"), "isEqualToString:", v4))
    {
      if ((objc_msgSend((id)objc_msgSend(v11, "toState"), "isEqualToString:", v5) & 1) != 0)
        return v11;
    }
    if (v8 == ++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v8)
        goto LABEL_9;
      return 0;
    }
  }
}

- (void)_scrollPoint:(CGPoint)a3 fromLayer:(id)a4
{
  -[CALayer _scrollPoint:fromLayer:](-[CALayer superlayer](self, "superlayer"), "_scrollPoint:fromLayer:", a4, a3.x, a3.y);
}

- (void)scrollPoint:(CGPoint)p
{
  -[CALayer _scrollPoint:fromLayer:](self, "_scrollPoint:fromLayer:", self, p.x, p.y);
}

- (void)_scrollRect:(CGRect)a3 fromLayer:(id)a4
{
  -[CALayer _scrollRect:fromLayer:](-[CALayer superlayer](self, "superlayer"), "_scrollRect:fromLayer:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)scrollRectToVisible:(CGRect)r
{
  -[CALayer _scrollRect:fromLayer:](self, "_scrollRect:fromLayer:", self, r.origin.x, r.origin.y, r.size.width, r.size.height);
}

- (CGRect)_visibleRectOfLayer:(id)a3
{
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = -[CALayer superlayer](self, "superlayer");
  if (v4)
    -[CALayer _visibleRectOfLayer:](v4, "_visibleRectOfLayer:", a3);
  else
    objc_msgSend(a3, "bounds");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)visibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CALayer _visibleRectOfLayer:](self, "_visibleRectOfLayer:", self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)retainCount
{
  int refcount;

  refcount = self->_attr.refcount;
  if (refcount <= 1)
    return 1;
  else
    return refcount;
}

- (id)_initWithReference:(id)a3
{
  CALayer *v5;
  CALayer *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  int v10;
  CA::Transaction *v11;
  malloc_zone_t *malloc_zone;
  _QWORD *v13;
  _QWORD *layer;
  uint64_t v15;
  int v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __assert_rtn("-[CALayer _initWithReference:]", "CALayer.mm", 2052, "[layer isKindOfClass:[self class]]");
  self->_attr.magic = 1279351122;
  v18.receiver = self;
  v18.super_class = (Class)CALayer;
  v5 = -[CALayer init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = *((_QWORD *)a3 + 2);
    v10 = *(_DWORD *)(v7 + 40);
    v8 = v7 + 40;
    v9 = v10;
    v11 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
    if (!v11)
      v11 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)v5);
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v13 = malloc_type_zone_malloc(malloc_zone, 0x128uLL, 0x8BB15036uLL);
    if (v13)
    {
      layer = v13;
      *v13 = 0;
      v13[1] = 0;
      v15 = (uint64_t)(v13 + 5);
      if ((v9 & 1) != 0)
        v16 = 33980418;
      else
        v16 = 33980416;
      layer[3] = 0;
      layer[4] = 0;
      layer[2] = v6;
      CA::Layer::State::State(v15, v8, v11);
      layer[19] = 0;
      layer[20] = 0;
      *((_DWORD *)layer + 44) = 0;
      layer[21] = 0;
      *(_OWORD *)(layer + 23) = 0u;
      *(_OWORD *)(layer + 25) = 0u;
      *(_OWORD *)(layer + 27) = 0u;
      *(_OWORD *)(layer + 29) = 0u;
      *((_BYTE *)layer + 248) = 0;
      layer[32] = 0;
      layer[33] = 0;
      layer[35] = 0;
      layer[36] = 0;
      *(_DWORD *)layer = 1;
      *((_DWORD *)layer + 1) = v16;
      layer[34] = 0;
      v6->_attr.layer = layer;
    }
    else
    {
      layer = v6->_attr.layer;
    }
    CA::Layer::set_model_layer((CA::Layer *)layer, v11, *((CA::Layer **)a3 + 2));
  }
  return v6;
}

- (id)debugDescription
{
  CA::Transaction *v3;
  char *layer;
  __CFString *v5;
  objc_class *v6;
  NSString *v7;
  id *v8;
  id Weak;
  uint64_t v10;
  uint64_t i;
  const char *v12;
  CA::Layer *v13;
  _QWORD *v14;
  uint64_t v15;
  char **v16;
  unint64_t v17;
  const char *v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  CA::AttrList **v22;
  uint64_t **v23;
  char v24;
  uint64_t v26;

  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  layer = (char *)self->_attr.layer;
  v5 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (objc_class *)objc_opt_class();
  -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("<%@:%p; "), NSStringFromClass(v6), self);
  v7 = -[CALayer name](self, "name");
  if (v7)
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("name = \"%@\"; "), v7);
  -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("position = CGPoint (%g %g); "),
    *((_QWORD *)layer + 10),
    *((_QWORD *)layer + 11));
  -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("bounds = CGRect (%g %g; %g %g); "),
    *((_QWORD *)layer + 12),
    *((_QWORD *)layer + 13),
    *((_QWORD *)layer + 14),
    *((_QWORD *)layer + 15));
  v8 = (id *)(layer + 128);
  if (layer[136])
  {
    Weak = objc_loadWeak(v8);
    if (!Weak)
      goto LABEL_6;
    goto LABEL_5;
  }
  Weak = *v8;
  if (Weak)
LABEL_5:
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("delegate = %@; "), Weak);
LABEL_6:
  if (*((_QWORD *)layer + 18))
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("contents = %@; "), *((_QWORD *)layer + 18));
  if (CA::Layer::sublayers((CA::Layer *)layer))
  {
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("sublayers = ("));
    v10 = *((_QWORD *)CA::Layer::sublayers((CA::Layer *)layer) + 2);
    if (v10)
    {
      for (i = 0; i != v10; ++i)
      {
        if (i)
          v12 = ", ";
        else
          v12 = "";
        v13 = CA::Layer::sublayers((CA::Layer *)layer);
        v14 = (_QWORD *)((char *)v13 + 8);
        if (*((_QWORD *)v13 + 2) != 1 || *((_QWORD *)v13 + 3))
          v14 = (_QWORD *)*v14;
        -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%s%@"), v12, v14[i]);
      }
    }
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("); "));
  }
  if (CA::Layer::mask((CA::Layer *)layer))
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("mask = %@; "), CA::Layer::mask((CA::Layer *)layer));
  v15 = 0;
  v16 = &off_1E15A8408;
  do
  {
    v17 = (0x810842018A8uLL >> v15) & 1;
    if (((*(_DWORD *)&layer[4 * (*((int *)v16 - 2) >> 5) + 44] >> *((_DWORD *)v16 - 2)) & 1) != (_DWORD)v17)
    {
      if (v17)
        v18 = "NO";
      else
        v18 = "YES";
      -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%s = %s; "), *v16, v18);
    }
    ++v15;
    v16 += 4;
  }
  while (v15 != 46);
  v19 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v19 + 1;
  if (!v19)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if ((layer[56] & 0x10) != 0)
    -[__CFString appendString:](v5, "appendString:", CFSTR("anchorPoint = CGPoint (0 0); "));
  v20 = *((_DWORD *)layer + 11);
  if (((v20 >> 26) & 3) != 0)
  {
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("contentsScale = %u; "), (v20 >> 26) & 3);
    v20 = *((_DWORD *)layer + 11);
  }
  v21 = (v20 >> 28) & 3;
  if ((_DWORD)v21)
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("rasterizationScale = %u; "), v21);
  v22 = (CA::AttrList **)*((_QWORD *)layer + 9);
  if (v22)
    CA::AttrList::append_description(*v22, v5);
  if (*((_QWORD *)layer + 35))
  {
    -[__CFString appendString:](v5, "appendString:", CFSTR("; animations = ["));
    v23 = (uint64_t **)*((_QWORD *)layer + 35);
    if (v23)
    {
      v24 = 1;
      do
      {
        if (((_WORD)v23[7] & 0x24) == 0)
        {
          if ((v24 & 1) == 0)
            -[__CFString appendString:](v5, "appendString:", CFSTR(" "));
          if (v23[2])
            -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%@=%@"), v23[2], v23[1]);
          else
            -[__CFString appendFormat:](v5, "appendFormat:", CFSTR("%@"), v23[1], v26);
          v24 = 0;
        }
        v23 = (uint64_t **)*v23;
      }
      while (v23);
    }
    -[__CFString appendString:](v5, "appendString:", CFSTR("]"));
  }
  CA::Transaction::unlock(v3);
  -[__CFString appendString:](v5, "appendString:", CFSTR(">"));
  return v5;
}

- (id)CA_archivingValueForKey:(id)a3
{
  CALayer *v4;

  v4 = self;
  if ((~*((_DWORD *)self->_attr.layer + 1) & 0x68000) == 0)
    v4 = -[CALayer modelLayer](self, "modelLayer");
  return CAObject_valueForKey(v4, (objc_class *)+[CALayer superclass](CALayer, "superclass"), (const __CFString *)a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  CA::Transaction *v6;
  int v7;
  uint64_t **i;
  CA::Transaction *v9;

  CAObject_encodeWithCoder(self, a3);
  if (*((_QWORD *)self->_attr.layer + 35))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = (CA::Transaction *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = CA::Transaction::ensure_compat(v9);
    v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    for (i = (uint64_t **)*((_QWORD *)self->_attr.layer + 35); i; i = (uint64_t **)*i)
    {
      if (i[2]
        && ((_WORD)i[7] & 0x24) == 0
        && (CALayerEncodeAllAnimations || (objc_msgSend(i[1], "isRemovedOnCompletion") & 1) == 0))
      {
        objc_msgSend(v5, "addObject:", i[1]);
        -[CA::Transaction addObject:](v9, "addObject:", i[2]);
      }
    }
    CA::Transaction::unlock(v6);
    objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("CALayerAnimations"));
    objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("CALayerAnimationKeys"));

  }
}

- (BOOL)shouldArchiveValueForKey:(NSString *)key
{
  int v5;
  int v6;
  uint64_t v7;
  _BYTE *layer;
  CA::Transaction *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  int *v17;
  int v18;
  CA::Transaction *v19;
  int v20;
  uint64_t **v21;
  const void *v23;
  CFTypeID v24;
  uint64_t v25;
  CALayer *v26;

  v5 = CAInternAtom((const __CFString *)key, 1);
  v6 = v5;
  v7 = 0;
  layer = self->_attr.layer;
  do
  {
    if (v5 == (unsigned __int16)-[CALayer shouldArchiveValueForKey:]::always_archived[v7])
      goto LABEL_66;
    ++v7;
  }
  while (v7 != 4);
  v9 = (CA::Transaction *)CAAtomIndexInArray(21, (uint64_t)&-[CALayer shouldArchiveValueForKey:]::atoms, v5);
  if (v9 == (CA::Transaction *)-1)
    goto LABEL_46;
  if (v6 <= 176)
  {
    if (v6 <= 133)
    {
      if (v6 <= 116)
      {
        if (v6 == 25)
        {
          v11 = layer[56];
        }
        else
        {
          if (v6 != 72)
            goto LABEL_46;
          v11 = layer[58];
        }
        return (v11 >> 3) & 1;
      }
      if (v6 != 117)
      {
        if (v6 == 129)
          return layer[58] >> 7;
        goto LABEL_46;
      }
      if ((layer[58] & 0x20) == 0)
        goto LABEL_61;
      if (!CAEncodeBackingStores)
      {
        v23 = (const void *)*((_QWORD *)layer + 18);
        if (v23)
        {
          v24 = CFGetTypeID(v23);
          v25 = CABackingStoreGetTypeID::type;
          if (!CABackingStoreGetTypeID::type)
          {
            v25 = _CFRuntimeRegisterClass();
            CABackingStoreGetTypeID::type = v25;
          }
          if (v24 == v25)
            goto LABEL_61;
        }
      }
      goto LABEL_66;
    }
    if (v6 > 144)
    {
      if (v6 != 145)
      {
        if (v6 == 163)
          return (layer[58] >> 4) & 1;
        goto LABEL_46;
      }
      LOBYTE(v13) = layer[59];
    }
    else
    {
      if (v6 == 134)
      {
        if ((layer[47] & 0xC) == 0)
          goto LABEL_46;
        goto LABEL_66;
      }
      if (v6 != 135)
        goto LABEL_46;
      LOBYTE(v13) = layer[64];
    }
LABEL_56:
    LOBYTE(v14) = v13 & 1;
    return v14;
  }
  if (v6 > 428)
  {
    if (v6 > 481)
    {
      if (v6 != 482)
      {
        if (v6 != 503)
        {
          if (v6 == 536)
          {
            v10 = CA::Layer::sublayers((CA::Layer *)layer);
LABEL_41:
            LOBYTE(v14) = v10 != 0;
            return v14;
          }
          goto LABEL_46;
        }
LABEL_61:
        LOBYTE(v14) = 0;
        return v14;
      }
      v15 = layer[65];
      return (v15 >> 2) & 1;
    }
    if (v6 == 429)
    {
      v15 = layer[58];
      return (v15 >> 2) & 1;
    }
    if (v6 != 447 || (layer[47] & 0x30) == 0)
      goto LABEL_46;
LABEL_66:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (v6 <= 366)
  {
    if (v6 == 177)
    {
      v12 = layer[65];
    }
    else
    {
      if (v6 != 190)
        goto LABEL_46;
      v12 = layer[59];
    }
    return (v12 >> 1) & 1;
  }
  if (v6 == 367)
  {
    v10 = CA::Layer::mask((CA::Layer *)layer);
    goto LABEL_41;
  }
  if (v6 == 368)
  {
    LOBYTE(v13) = layer[65];
    goto LABEL_56;
  }
LABEL_46:
  v16 = 0;
  v17 = &dword_1E15A8410;
  do
  {
    v18 = *v17;
    v17 += 8;
    if (v6 == v18)
    {
      v13 = *(_DWORD *)&layer[4 * (BOOL_bits[8 * v16 + 1] >> 5) + 44] >> BOOL_bits[8 * v16 + 1];
      goto LABEL_56;
    }
    ++v16;
  }
  while (v16 != 46);
  v19 = CA::Transaction::ensure_compat(v9);
  v20 = *((_DWORD *)v19 + 25);
  *((_DWORD *)v19 + 25) = v20 + 1;
  if (!v20)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v21 = (uint64_t **)*((_QWORD *)layer + 9);
  if (v21)
  {
    while (1)
    {
      v21 = (uint64_t **)*v21;
      if (!v21)
        break;
      if (((_DWORD)v21[1] & 0xFFFFFF) == v6)
      {
        LOBYTE(v14) = 1;
        goto LABEL_59;
      }
    }
  }
  if ((~*((_DWORD *)layer + 1) & 0x68000) != 0 || (v26 = -[CALayer modelLayer](self, "modelLayer"), v26 == self))
    LOBYTE(v14) = 0;
  else
    v14 = objc_msgSend(-[CALayer valueForKey:](v26, "valueForKey:", key), "isEqual:", -[CALayer valueForKey:](self, "valueForKey:", key)) ^ 1;
LABEL_59:
  CA::Transaction::unlock(v19);
  return v14;
}

- (CFTimeInterval)convertTime:(CFTimeInterval)t toLayer:(CALayer *)l
{
  CA::Transaction *v6;
  CALayer *v7;
  int v8;
  CFTimeInterval result;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  *(CFTimeInterval *)v10 = t;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v8 = CA::Layer::convert_time(v6, (CA::Transaction *)v10, self, l, v7);
  result = *(double *)v10;
  if (!v8)
    return 0.0;
  return result;
}

- (CALayer)hitTest:(CGPoint)p
{
  CGFloat y;
  CGFloat x;
  _DWORD *layer;
  CA::Transaction *v7;
  CA::Transaction *v8;
  double v9;
  double v10;
  int v11;
  const double *v12;
  CALayer *i;
  double v14;
  double v15;
  uint64_t v16;
  const double *v17;
  CALayer *v18;
  double *v19;
  CALayer *v20;
  CALayer **v21;
  CALayer **v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CALayer **v27;
  CALayer **v29;
  float64x2_t v30;
  float64x2_t v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  y = p.y;
  x = p.x;
  v35 = *MEMORY[0x1E0C80C00];
  layer = self->_attr.layer;
  if ((layer[1] & 0x10000) != 0)
  {
    NSLog(CFSTR("%@ - calling -hitTest: on transform-only layer"), a2, self);
    layer = self->_attr.layer;
  }
  if ((layer[1] & 0x40000) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CALayerInvalid"), CFSTR("may only -hitTest: a layer or its presentation layer"));
  if (-[CALayer ignoresHitTesting](self, "ignoresHitTesting"))
    return 0;
  v7 = (CA::Transaction *)-[CALayer allowsHitTesting](self, "allowsHitTesting");
  if (!(_DWORD)v7)
    return 0;
  v8 = CA::Transaction::ensure_compat(v7);
  v11 = *((_DWORD *)v8 + 25);
  *((_DWORD *)v8 + 25) = v11 + 1;
  if (!v11)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v33 = 0u;
  v34 = 0u;
  v32 = 0u;
  memset(v31, 0, sizeof(v31));
  CA::Layer::get_frame_transform((uint64_t)self->_attr.layer, v31, 0, 0, 0.0, v9, v10);
  for (i = CA::Layer::superlayer((CA::Layer *)self->_attr.layer, v8);
        i;
        i = CA::Layer::superlayer((CA::Layer *)i->_attr.layer, v8))
  {
    v16 = (uint64_t)i->_attr.layer;
    if ((*(_DWORD *)(v16 + 4) & 0x10000) == 0)
      break;
    memset(&v30, 0, 128);
    CA::Layer::get_frame_transform(v16, &v30, 0, 0, 0.0, v14, v15);
    CA::Mat4Impl::mat4_concat(v31, v31[0].f64, v30.f64, v17);
  }
  if (CA::Mat4Impl::mat4_invert((CA::Mat4Impl *)v31, (CA::Mat4Impl *)v31, v12)
    && (*(double *)&v32 >= 0.0 || -[CALayer isDoubleSided](self, "isDoubleSided", *(double *)&v32))
    && ((v30.f64[0] = x,
         v30.f64[1] = y,
         !-[CALayer masksToBounds](self, "masksToBounds", CA::Mat4Impl::mat4_unapply_inverse_to_point2(v31, v30.f64, v19).f64[0]))|| -[CALayer containsPoint:](self, "containsPoint:", v30.f64[0], v30.f64[1]))&& ((v20 = -[CALayer mask](self, "mask")) == 0 || -[CALayer hitTest:](v20, "hitTest:", v30.f64[0], v30.f64[1])))
  {
    v21 = (CALayer **)hitTestSublayers(0, v30.f64, (uint64_t *)-[CALayer sublayers](self, "sublayers"));
    v22 = v21;
    if (v21)
    {
      if (v21[1] && -[CALayer sortsSublayers](self, "sortsSublayers"))
      {
        v18 = 0;
        v26 = -INFINITY;
        v27 = v22;
        do
        {
          v23 = computeZ(self, *v27, v8, (__int128 *)&v30, v23, v24, v25);
          v24 = v26 + 0.00001;
          if (v23 > v26 + 0.00001)
          {
            v18 = *v27;
            v26 = v23;
          }
          v27 = (CALayer **)v27[1];
        }
        while (v27);
      }
      else
      {
        v18 = *v22;
      }
      do
      {
        v29 = (CALayer **)v22[1];
        free(v22);
        v22 = v29;
      }
      while (v29);
    }
    else if (-[CALayer containsPoint:](self, "containsPoint:", v30.f64[0], v30.f64[1]))
    {
      v18 = self;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }
  CA::Transaction::unlock(v8);
  return v18;
}

- (BOOL)containsPoint:(CGPoint)p
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = p.y;
  x = p.x;
  -[CALayer bounds](self, "bounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
}

- (NSString)securityMode
{
  int v2;
  const __CFString *v3;

  v2 = *((_DWORD *)self->_attr.layer + 11) >> 30;
  v3 = CFSTR("secure");
  if (v2 == 2)
    v3 = CFSTR("unrestricted");
  if (v2 == 1)
    return (NSString *)CFSTR("insecure");
  else
    return &v3->isa;
}

- (NSString)toneMapMode
{
  int v2;
  const __CFString *v3;

  v2 = (*((_DWORD *)self->_attr.layer + 12) >> 3) & 3;
  v3 = CFSTR("automatic");
  if (v2 == 1)
    v3 = CFSTR("never");
  if (v2 == 2)
    return (NSString *)CFSTR("ifSupported");
  else
    return &v3->isa;
}

- (void)setToneMapMode:(id)a3
{
  int v4;
  int v5;

  if (a3 == CFSTR("automatic"))
  {
    v5 = 0;
  }
  else
  {
    v4 = CAInternAtom((const __CFString *)a3, 0);
    if (v4 == 262)
      v5 = 2;
    else
      v5 = v4 == 392;
  }
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x227u, 0x23u, 0x83u, 3, v5);
}

- (void)_colorSpaceDidChange
{
  id *layer;
  CA::Transaction *v3;
  id v4;
  int v5;
  const void *v6;
  uint64_t v7;
  CFTypeID v8;
  uint64_t v9;
  CGColorSpace *v10;
  int v11;

  layer = (id *)self->_attr.layer;
  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = layer[2];
  v5 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v5 + 1;
  if (!v5)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v6 = (const void *)objc_msgSend(v4, "contents");
  v7 = (uint64_t)v6;
  if (v6)
  {
    v8 = CFGetTypeID(v6);
    v9 = CABackingStoreGetTypeID::type;
    if (!CABackingStoreGetTypeID::type)
    {
      v9 = _CFRuntimeRegisterClass();
      CABackingStoreGetTypeID::type = v9;
    }
    if (v8 == v9)
    {
      v10 = (CGColorSpace *)objc_msgSend(layer[2], "_retainColorSpace");
      if (CABackingStoreSetColorSpace(v7, v10))
        objc_msgSend(v4, "setNeedsDisplay");
      CGColorSpaceRelease(v10);
      LODWORD(v7) = 0;
    }
    else
    {
      LODWORD(v7) = 1;
    }
  }
  if (objc_msgSend(v4, "backgroundColor")
    || objc_msgSend(v4, "borderColor")
    || objc_msgSend(v4, "contentsMultiplyColor"))
  {
    LODWORD(v7) = v7 | 0x8000;
  }
  if (objc_msgSend(v4, "shadowColor"))
    v11 = v7 | 0x2000;
  else
    v11 = v7;
  if (v11)
    CA::Layer::set_commit_needed((CA::Layer *)layer, v3, v11);
  CA::Transaction::unlock(v3);
}

- (void)_contentsFormatDidChange:(id)a3
{
  _QWORD *layer;
  CA::Transaction *v4;
  char v5;
  CA::Transaction *v6;
  void *v7;
  int v8;

  layer = self->_attr.layer;
  v4 = (CA::Transaction *)objc_msgSend(a3, "integerValue");
  v5 = (char)v4;
  v6 = CA::Transaction::ensure_compat(v4);
  v7 = (void *)layer[2];
  v8 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v8 + 1;
  if (!v8)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if (objc_msgSend(v7, "contents") && (*((_DWORD *)layer + 1) & 0x4000000) != 0 && (*((_BYTE *)layer + 58) & 0x40) == 0)
  {
    *((_DWORD *)layer + 11) = *((_DWORD *)layer + 11) & 0xFFFFFFF8 | v5 & 7;
    objc_msgSend(v7, "setNeedsDisplay");
    CA::Layer::set_commit_needed((CA::Layer *)layer, v6, 1);
  }
  CA::Transaction::unlock(v6);
}

- (id)_layoutHash
{
  unsigned int v2;
  unsigned int v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t (*v12)();
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3812000000;
  v11 = __Block_byref_object_copy__261;
  v12 = __Block_byref_object_dispose__262;
  v13 = "";
  v14 = 190295070;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3052000000;
  v7[3] = __Block_byref_object_copy__263;
  v7[4] = __Block_byref_object_dispose__264;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __22__CALayer__layoutHash__block_invoke;
  v6[3] = &unk_1E15A8A18;
  v6[4] = &v8;
  v6[5] = v7;
  v7[5] = v6;
  __22__CALayer__layoutHash__block_invoke((uint64_t)v6, self, 1);
  v2 = *((_DWORD *)v9 + 13) ^ *((_DWORD *)v9 + 12);
  v3 = -1028477387 * ((-2048144789 * (v2 ^ HIWORD(v2))) ^ ((-2048144789 * (v2 ^ HIWORD(v2))) >> 13));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3 ^ HIWORD(v3));
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)_previousLayoutHash
{
  return objc_getAssociatedObject(self, sel__previousLayoutHash);
}

- (void)_setPreviousLayoutHash:(id)a3
{
  objc_setAssociatedObject(self, sel__previousLayoutHash, a3, (void *)1);
}

- (void)_saveCurrentLayoutHash
{
  CA::Transaction *v3;
  int v4;

  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  if (-[CALayer _previousLayoutHash](self, "_previousLayoutHash"))
    -[CALayer _setPreviousLayoutHash:](self, "_setPreviousLayoutHash:", -[CALayer _layoutHash](self, "_layoutHash"));
  CA::Transaction::unlock(v3);
}

- (void)_validateLayoutHashHasChangedWithLayoutTime:(double)a3
{
  id v5;
  CABasicAnimation *v6;
  double Alpha;
  CGColor *SRGB;
  NSObject *v9;
  uint64_t v10;
  double v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = -[CALayer _previousLayoutHash](self, "_previousLayoutHash");
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToNumber:", -[CALayer _layoutHash](self, "_layoutHash")))
    {
      kdebug_trace();
      if (BYTE4(xmmword_1ECDC6AB0))
      {
        v6 = +[CAPropertyAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("backgroundColor"));
        Alpha = CGColorGetAlpha(-[CALayer backgroundColor](self, "backgroundColor"));
        SRGB = CGColorCreateSRGB(1.0, 0.0, 0.0, fmax(Alpha, 0.05));
        -[CABasicAnimation setToValue:](v6, "setToValue:", SRGB);
        -[CAAnimation setAutoreverses:](v6, "setAutoreverses:", 1);
        -[CAAnimation setDuration:](v6, "setDuration:", 0.5);
        -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v6, CFSTR("CADebug_RedundantLayoutFlash"));
        CGColorRelease(SRGB);
      }
      if (BYTE3(xmmword_1ECDC6AB0))
      {
        if (x_log_hook_p())
        {
          v11 = a3;
          v10 = objc_msgSend(-[CALayer debugDescription](self, "debugDescription"), "UTF8String");
          x_log_();
        }
        else
        {
          v9 = x_log_category_api;
          if (os_log_type_enabled((os_log_t)x_log_category_api, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v13 = objc_msgSend(-[CALayer debugDescription](self, "debugDescription"), "UTF8String");
            v14 = 2048;
            v15 = a3;
            _os_log_impl(&dword_184457000, v9, OS_LOG_TYPE_DEFAULT, "Redundant layout on %s which took %f ms", buf, 0x16u);
          }
        }
      }
    }
    -[CALayer _setPreviousLayoutHash:](self, "_setPreviousLayoutHash:", 0, v10, *(_QWORD *)&v11);
  }
  else
  {
    -[CALayer _setPreviousLayoutHash:](self, "_setPreviousLayoutHash:", &unk_1E15DACC8);
  }
}

- (CGSize)preferredFrameSize
{
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  float64x2_t v8;
  double v9;
  double v10;
  double v11;
  CGAffineTransform v12;
  uint64_t v13;
  CGSize result;

  v13 = *MEMORY[0x1E0C80C00];
  -[CALayer sizeRequisition](self, "sizeRequisition");
  v10 = v3;
  v11 = v5;
  if (v3 == 0.0 && v5 == 0.0)
  {
    -[CALayer _preferredSize](self, "_preferredSize", *(_QWORD *)&v3, v4);
    v10 = v6;
    v11 = v7;
    -[CALayer setSizeRequisition:](self, "setSizeRequisition:");
  }
  memset(&v12, 0, sizeof(v12));
  CA::Layer::get_frame_transform((CA::Layer *)self->_attr.layer, &v12, 1);
  v8 = vrndpq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v12.a, v10), *(float64x2_t *)&v12.c, v11));
  v9 = v8.f64[1];
  result.width = v8.f64[0];
  result.height = v9;
  return result;
}

- (void)setRepeatDuration:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1CB, (const CGAffineTransform *)0x12, v3);
}

- (void)setAutoreverses:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x2F, (const CGAffineTransform *)7, (double *)&v3);
}

- (CGFloat)anchorPointZ
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1Au, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setDoubleSided:(BOOL)doubleSided
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xB6u, 44, 130, doubleSided, 0, 0);
}

- (CGRect)cornerContentsCenter
{
  double v2;
  double v3;
  double v4;
  double v5;
  __int128 v6;
  double v7[3];
  uint64_t v8;
  CGRect result;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  *(_OWORD *)v7 = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x8Eu, (const CGAffineTransform *)0x15, (id *)&v6);
  v3 = *((double *)&v6 + 1);
  v2 = *(double *)&v6;
  v5 = v7[1];
  v4 = v7[0];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setContentsContainsSubtitles:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x78u, 73, 159, a3, 0, 0);
}

- (void)setMinificationFilterBias:(float)minificationFilterBias
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = minificationFilterBias;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x17D, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setGain:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0xF1, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setContentsEDRStrength:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x7B, (const CGAffineTransform *)0x12, v3);
}

- (BOOL)invertsMask
{
  return (*((unsigned __int8 *)self->_attr.layer + 50) >> 3) & 1;
}

- (void)setBackgroundFilters:(NSArray *)backgroundFilters
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = backgroundFilters;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x36, (const CGAffineTransform *)3, v3);
}

- (NSDictionary)style
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x216u, (const CGAffineTransform *)3, v3);
  return (NSDictionary *)v3[0];
}

- (void)setStyle:(NSDictionary *)style
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = style;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x216, (const CGAffineTransform *)3, v3);
}

- (double)borderOffset
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x41u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setBorderOffset:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x41, (const CGAffineTransform *)0x12, v3);
}

- (CACornerRadii)cornerRadii
{
  CACornerRadii *result;

  retstr->maxXMinY = 0u;
  retstr->minXMinY = 0u;
  retstr->minXMaxY = 0u;
  retstr->maxXMaxY = 0u;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x91u, (const CGAffineTransform *)0x19, (id *)retstr);
  return result;
}

- (void)setCornerRadii:(CACornerRadii *)a3
{
  CGSize maxXMaxY;
  CGSize minXMinY;
  _OWORD v5[4];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  maxXMaxY = a3->maxXMaxY;
  v5[0] = a3->minXMaxY;
  v5[1] = maxXMaxY;
  minXMinY = a3->minXMinY;
  v5[2] = a3->maxXMinY;
  v5[3] = minXMinY;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x91, (const CGAffineTransform *)0x19, (double *)v5);
}

- (void)setRimColor:(CGColor *)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1D2, (const CGAffineTransform *)2, v3);
}

- (void)setRimOpacity:(float)a3
{
  float v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1D3, (const CGAffineTransform *)0x11, (double *)&v3);
}

- (void)setRimWidth:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x1D5, (const CGAffineTransform *)0x12, v3);
}

- (void)setShouldFlatten:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1F2u, 53, 139, a3, 0, 0);
}

- (void)setShouldReflatten:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1F3u, 54, 140, a3, 0, 0);
}

- (void)setRasterizationPrefersDisplayCompositing:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1BDu, 55, 141, a3, 0, 0);
}

- (void)setRasterizationPrefersWindowServerAwareBackdrops:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1BEu, 56, 142, a3, 0, 0);
}

uint64_t __22__CALayer__layoutHash__block_invoke(uint64_t a1, void *a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t i;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  unsigned int v29;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "frame");
  v10 = objc_msgSend((id)objc_msgSend(a2, "sublayers", v6, v7, v8, v9), "count");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(_DWORD *)(v11 + 48);
  v12 = *(_DWORD *)(v11 + 52);
  for (i = 16; i != 32; i += 4)
  {
    HIDWORD(v15) = (461845907
                  * ((380141568 * *(_DWORD *)(v32 + i + 16)) | ((-862048943 * *(_DWORD *)(v32 + i + 16)) >> 17))) ^ v13;
    LODWORD(v15) = HIDWORD(v15);
    v13 = 5 * (v15 >> 19) - 430675100;
  }
  *(_DWORD *)(v11 + 48) = v13;
  *(_DWORD *)(v11 + 52) = v12 + 16;
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  HIDWORD(v17) = *(_DWORD *)(v16 + 48) ^ (461845907 * ((380141568 * v10) | ((-862048943 * v10) >> 17)));
  LODWORD(v17) = HIDWORD(v17);
  v18 = *(_DWORD *)(v16 + 52) + 4;
  *(_DWORD *)(v16 + 48) = 5 * (v17 >> 19) - 430675100;
  *(_DWORD *)(v16 + 52) = v18;
  if ((a3 & 1) == 0)
  {
    v19 = 0;
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v22 = *(_DWORD *)(v20 + 48);
    v21 = *(_DWORD *)(v20 + 52);
    do
    {
      HIDWORD(v23) = (461845907
                    * ((380141568 * *(_DWORD *)(v32 + v19 + 16)) | ((-862048943
                                                                                 * *(_DWORD *)(v32 + v19 + 16)) >> 17))) ^ v22;
      LODWORD(v23) = HIDWORD(v23);
      v22 = 5 * (v23 >> 19) - 430675100;
      v19 += 4;
    }
    while (v19 != 16);
    *(_DWORD *)(v20 + 48) = v22;
    *(_DWORD *)(v20 + 52) = v21 + 16;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v24 = (void *)objc_msgSend(a2, "sublayers");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(v24);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 16))();
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v26);
  }
  v29 = -2048144789
      * (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52) ^ *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                 + 48) ^ ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52) ^ *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48)) >> 16));
  return (-1028477387 * (v29 ^ (v29 >> 13))) ^ ((-1028477387 * (v29 ^ (v29 >> 13))) >> 16);
}

- (void)reloadValueForKeyPath:(id)a3
{
  CA::Transaction *AtomInKeyPath;
  int v5;
  CA::Transaction *v6;
  int v7;

  AtomInKeyPath = (CA::Transaction *)CAInternFirstAtomInKeyPath((const __CFString *)a3);
  v5 = (int)AtomInKeyPath;
  v6 = CA::Transaction::ensure_compat(AtomInKeyPath);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  CA::Layer::property_did_change((id *)self->_attr.layer, v6, v5);
  CA::Transaction::unlock(v6);
}

- (BOOL)drawsMipmapLevels
{
  return 0;
}

- (void)invalidateContents
{
  id *layer;
  unsigned int *v3;
  unsigned int v4;
  const void *v5;
  uint64_t v6;
  CFTypeID v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  int *v12;

  layer = (id *)self->_attr.layer;
  if ((*((_DWORD *)layer + 1) & 0x60000) == 0)
  {
    v3 = (unsigned int *)CA::Transaction::ensure_compat((CA::Transaction *)self);
    v4 = v3[25];
    v3[25] = v4 + 1;
    if (!v4)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    v5 = (const void *)objc_msgSend(layer[2], "contents");
    v6 = (uint64_t)v5;
    if (!v5)
      goto LABEL_9;
    v7 = CFGetTypeID(v5);
    v8 = CABackingStoreGetTypeID::type;
    if (!CABackingStoreGetTypeID::type)
    {
      v8 = _CFRuntimeRegisterClass();
      CABackingStoreGetTypeID::type = v8;
    }
    if (v7 == v8)
    {
      CABackingStoreSetVolatile(v6, 1);
      CA::Layer::mark((CA::Layer *)layer, (CA::Transaction *)v3, 1032, 16);
    }
    else
    {
LABEL_9:
      objc_msgSend(layer[2], "setContents:", 0);
    }
    *((_DWORD *)layer + 13) &= ~0x800000u;
    v9 = v3[24];
    if ((v9 & 0x80000000) != 0 || (v10 = (char *)layer + 4 * v9, (v11 = *((_DWORD *)v10 + 68)) == 0))
    {
      v12 = CA::Layer::thread_flags_((CA::Layer *)layer, (CA::Transaction *)v3);
      v11 = *v12;
    }
    else
    {
      v12 = (int *)(v10 + 272);
    }
    *v12 = v11 & 0xFFFFFEFF;
    CA::Transaction::unlock((CA::Transaction *)v3);
  }
}

- (void)prepareContents
{
  CA::Transaction *v2;
  CALayer *v4;

  v4 = *(CALayer **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v4)
    v4 = (CALayer *)CA::Transaction::create((CA::Transaction *)self);
  CA::Layer::prepare_contents((CA::Layer *)self, v4, v2);
}

- (void)regionBeingDrawn
{
  void *result;
  void *v3;
  CFTypeID v4;
  uint64_t v5;

  result = -[CALayer contents](self, "contents");
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    v5 = CABackingStoreGetTypeID::type;
    if (!CABackingStoreGetTypeID::type)
    {
      v5 = _CFRuntimeRegisterClass();
      CABackingStoreGetTypeID::type = v5;
    }
    if (v4 == v5)
      return (void *)*((_QWORD *)v3 + 56);
    else
      return 0;
  }
  return result;
}

- (BOOL)layoutIsActive
{
  CA::Transaction *v3;
  int v4;
  char is_active;

  v3 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v4 = *((_DWORD *)v3 + 25);
  *((_DWORD *)v3 + 25) = v4 + 1;
  if (!v4)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  is_active = CA::Layer::layout_is_active((CA::Layer *)self->_attr.layer, v3, 0);
  CA::Transaction::unlock(v3);
  return is_active;
}

- (BOOL)ignoresHitTesting
{
  float v4;

  if (-[CALayer isHidden](self, "isHidden"))
    return 1;
  -[CALayer opacity](self, "opacity");
  return v4 <= 0.0;
}

- (BOOL)isDescendantOf:(id)a3
{
  CA::Transaction *v5;
  CALayer *v6;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
    return (char)v6;
  }
  v5 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (v5)
  {
    if (self)
      goto LABEL_4;
LABEL_8:
    LOBYTE(v6) = 0;
    return (char)v6;
  }
  v5 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  if (!self)
    goto LABEL_8;
LABEL_4:
  v6 = CA::Layer::superlayer((CA::Layer *)self->_attr.layer, v5);
  if (v6)
    LOBYTE(v6) = -[CALayer isDescendantOf:](v6, "isDescendantOf:", a3);
  return (char)v6;
}

- (id)layerBeingDrawn
{
  CA::Transaction *v3;

  v3 = *(CA::Transaction **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 576);
  if (!v3)
    v3 = (CA::Transaction *)CA::Transaction::create((CA::Transaction *)self);
  return CA::Layer::layer_being_drawn((CA::Layer *)self->_attr.layer, v3, 0x800000);
}

- (id)layerAtTime:(double)a3
{
  CA::Transaction *v5;

  v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  return CA::Layer::layer_at_time((CA::Layer *)self->_attr.layer, v5, a3, 0, 0);
}

- (void)setPresentationModifiers:(id)a3
{
  CA::Layer *layer;
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  const void *v8;
  objc_object *v9[2];

  v9[1] = *(objc_object **)MEMORY[0x1E0C80C00];
  layer = (CA::Layer *)self->_attr.layer;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v8 = (const void *)*((_QWORD *)layer + 36);
  v9[0] = 0;
  CA::Layer::begin_change(layer, v6, CFSTR("presentationModifiers"), (objc_object *)v9, v5);
  *((_QWORD *)layer + 36) = objc_msgSend(a3, "mutableCopy");
  CA::Layer::end_change((id *)layer, v6, 435, (objc_object *)CFSTR("presentationModifiers"), v9[0]);
  if (v8)
    CA::Transaction::release_object(v6, v8);
  CA::Transaction::unlock(v6);
}

- (void)addIdentifier:(id)a3
{
  CA::Layer *layer;
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  __CFSet *v8;
  CFAllocatorRef allocator;
  objc_object v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  layer = (CA::Layer *)self->_attr.layer;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v10.isa = 0;
  CA::Layer::begin_change(layer, v6, CFSTR("identifiers"), &v10, v5);
  allocator = 0;
  CA::Layer::getter(layer, 0x104u, (const CGAffineTransform *)2, (id *)&allocator);
  v8 = allocator;
  if (!allocator)
  {
    allocator = CFSetCreateMutable(0, 2, MEMORY[0x1E0C9B3B0]);
    CA::Layer::setter(layer, (const void *)0x104, (const CGAffineTransform *)2, (double *)&allocator);
    CFRelease(allocator);
    v8 = allocator;
  }
  CFSetAddValue(v8, a3);
  CA::Layer::end_change((id *)layer, v6, 260, (objc_object *)CFSTR("identifiers"), (objc_object *)v10.isa);
  CA::Transaction::unlock(v6);
}

- (void)removeIdentifier:(id)a3
{
  CA::Layer *layer;
  objc_object **v5;
  CA::Transaction *v6;
  int v7;
  CFMutableSetRef theSet;
  objc_object v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  layer = (CA::Layer *)self->_attr.layer;
  v6 = CA::Transaction::ensure_compat((CA::Transaction *)self);
  v7 = *((_DWORD *)v6 + 25);
  *((_DWORD *)v6 + 25) = v7 + 1;
  if (!v7)
    os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
  v9.isa = 0;
  CA::Layer::begin_change(layer, v6, CFSTR("identifiers"), &v9, v5);
  theSet = 0;
  CA::Layer::getter(layer, 0x104u, (const CGAffineTransform *)2, (id *)&theSet);
  if (theSet)
    CFSetRemoveValue(theSet, a3);
  CA::Layer::end_change((id *)layer, v6, 260, (objc_object *)CFSTR("identifiers"), (objc_object *)v9.isa);
  CA::Transaction::unlock(v6);
}

- (NSSet)identifiers
{
  return (NSSet *)CA::Layer::identifiers((CA::Layer *)self->_attr.layer);
}

- (id)recursiveDescription
{
  NSMutableString *v3;

  v3 = (NSMutableString *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  appendLayerDescription(self, v3, 0);
  return v3;
}

- (void)CA_initialize_for_decoding
{
  CA::Layer::set_bit_int((CA::Layer *)self->_attr.layer, 0x90u, 0x21u, 0xABu, 3, 0);
}

- (void)encodeWithCAMLWriter:(id)a3
{
  CA::Transaction *v5;
  CA::Transaction *v6;
  int v7;
  uint64_t **i;

  v5 = (CA::Transaction *)CAObject_encodeWithCAMLWriter(self, a3);
  if (*((_QWORD *)self->_attr.layer + 35))
  {
    v6 = CA::Transaction::ensure_compat(v5);
    v7 = *((_DWORD *)v6 + 25);
    *((_DWORD *)v6 + 25) = v7 + 1;
    if (!v7)
      os_unfair_lock_lock((os_unfair_lock_t)&CA::Transaction::transaction_lock);
    objc_msgSend(a3, "beginPropertyElement:", CFSTR("animations"));
    objc_msgSend(a3, "beginElement:", 1);
    for (i = (uint64_t **)*((_QWORD *)self->_attr.layer + 35); i; i = (uint64_t **)*i)
    {
      if (i[2]
        && ((_WORD)i[7] & 0x24) == 0
        && (!objc_msgSend(i[1], "isRemovedOnCompletion")
         || (objc_msgSend(a3, "encodingForReverseSerializationTest") & 1) != 0))
      {
        objc_msgSend(a3, "beginPropertyElement:", i[2]);
        objc_msgSend(a3, "encodeObject:", i[1]);
        objc_msgSend(a3, "endElement");
      }
    }
    objc_msgSend(a3, "endElement");
    objc_msgSend(a3, "endElement");
    CA::Transaction::unlock(v6);
  }
}

- (void)setHitTestsContentsAlphaChannel:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xFFu, 78, 164, a3, 0, 0);
}

- (void)setLiteralContentsCenter:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x163u, 80, 166, a3, 0, 0);
}

- (BOOL)canDrawConcurrently
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 5) & 1;
}

- (void)setCanDrawConcurrently:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x4Fu, 61, 147, a3, 0, 0);
}

- (void)setFrozen:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xEFu, 62, 148, a3, 0, 0);
}

- (BOOL)sortsSublayers
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 2) & 1;
}

- (BOOL)usesWebKitBehavior
{
  return (*((unsigned __int8 *)self->_attr.layer + 51) >> 3) & 1;
}

- (void)setPunchoutShadow:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1B8u, 47, 134, a3, 0, 0);
}

- (void)setRimPathIsBounds:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1D4u, 48, 135, a3, 0, 0);
}

- (void)setBorderPathIsBounds:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x42u, 49, 136, a3, 0, 0);
}

- (void)setSoftRim:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x1F9u, 50, 137, a3, 0, 0);
}

- (BOOL)contentsDither
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 3) & 1;
}

- (void)setContentsDither:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x7Au, 75, 161, a3, 0, 0);
}

- (BOOL)contentsOpaque
{
  return (*((unsigned __int8 *)self->_attr.layer + 53) >> 4) & 1;
}

- (void)setCreatesCompositingGroup:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x93u, 63, 149, a3, 0, 0);
}

- (CGSize)sizeRequisition
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  CGSize result;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  v5 = 0.0;
  CA::Layer::getter((CA::Transaction *)self->_attr.layer, 0x1F7u, (const CGAffineTransform *)0x14, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBackgroundColorPhase:(CGSize)a3
{
  CGSize v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->_attr.layer, (const void *)0x35, (const CGAffineTransform *)0x14, &v3.width);
}

- (void)setAcceleratesDrawing:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xBAu, 71, 157, a3, 0, 0);
}

- (void)setDefinesDisplayRegionOfInterest:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0xA2u, 82, 172, a3, 0, 0);
}

- (void)setTreatRec709AsSRGB:(BOOL)a3
{
  CA::Layer::set_bit((CA::Transaction *)self->_attr.layer, 0x232u, 83, 173, a3, 0, 0);
}

- (double)motionBlurAmount
{
  return 0.0;
}

- (BOOL)getRendererInfo:(_CARenderRendererInfo *)a3 size:(unint64_t)a4
{
  CA::Layer *layer;
  int *v7;
  int *v8;
  CA::Render::Object *v9;
  int layer_renderer_info;
  int v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  int v17;
  mach_port_t reply_port;
  mach_msg_return_t v19;
  int v20;
  BOOL v21;
  unsigned int v22;
  unsigned int v23[2];
  int msg;
  _BYTE msg_4[48];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  layer = (CA::Layer *)self->_attr.layer;
  v7 = CA::Layer::retain_context(layer);
  if (v7)
  {
    v8 = v7;
    if (CA::Render::Encoder::initialize_render_id_slide(void)::once[0] != -1)
      dispatch_once(CA::Render::Encoder::initialize_render_id_slide(void)::once, &__block_literal_global_11026);
    if (layer)
      v9 = (CA::Layer *)((char *)layer + CA::Render::_render_id_slide);
    else
      v9 = 0;
    if (a4 < 0xC)
      goto LABEL_8;
    v11 = *((_DWORD *)layer + 66);
    *(_QWORD *)v23 = 0;
    v22 = 0;
    v12 = *((_QWORD *)v8 + 13);
    if (v12)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v12 + 72));
      layer_renderer_info = CA::Render::Context::get_layer_renderer_info((CA::Render::Context *)v12, v9, v11, (int *)&v23[1], v23, &v22);
      pthread_mutex_unlock((pthread_mutex_t *)(v12 + 72));
      if (!layer_renderer_info)
        goto LABEL_14;
      v14 = v23[0];
      v13 = v23[1];
      v15 = v22;
LABEL_13:
      a3->var0 = v13;
      a3->var1 = v14;
      LOBYTE(layer_renderer_info) = 1;
      a3->var2 = v15;
      goto LABEL_14;
    }
    if ((*((_BYTE *)v8 + 241) & 2) != 0)
    {
LABEL_8:
      LOBYTE(layer_renderer_info) = 0;
LABEL_14:
      CA::Context::unref((CA::Context *)v8, 0);
      return layer_renderer_info;
    }
    v17 = v8[40];
    memset(&msg_4[16], 0, 32);
    *(_OWORD *)msg_4 = 0u;
    *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
    *(_QWORD *)&msg_4[28] = v9;
    v26 = 0;
    *(_DWORD *)&msg_4[36] = v11;
    reply_port = mig_get_reply_port();
    *(_DWORD *)&msg_4[4] = v17;
    *(_DWORD *)&msg_4[8] = reply_port;
    msg = 5395;
    *(_QWORD *)&msg_4[12] = 0x9D5400000000;
    if (MEMORY[0x1E0C85B60])
    {
      voucher_mach_msg_set((mach_msg_header_t *)&msg);
      reply_port = *(_DWORD *)&msg_4[8];
    }
    v19 = mach_msg((mach_msg_header_t *)&msg, 3, 0x2Cu, 0x38u, reply_port, 0, 0);
    v20 = v19;
    if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
      goto LABEL_40;
    }
    if (v19)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
LABEL_42:
      v15 = 0;
      v14 = 0;
      v13 = 0;
      if (!v20)
        goto LABEL_13;
      if (v20 == -81182719)
      {
        x_log_crash("Unentitled call to server!");
        abort();
      }
      goto LABEL_8;
    }
    if (*(_DWORD *)&msg_4[16] == 71)
    {
      v20 = -308;
    }
    else if (*(_DWORD *)&msg_4[16] == 40376)
    {
      if ((msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)msg_4 == 48)
        {
          if (!*(_DWORD *)&msg_4[4])
          {
            v20 = *(_DWORD *)&msg_4[28];
            if (!*(_DWORD *)&msg_4[28])
            {
              v13 = *(_DWORD *)&msg_4[32];
              v14 = *(_DWORD *)&msg_4[36];
              v15 = *(_DWORD *)&msg_4[40];
              goto LABEL_13;
            }
            goto LABEL_39;
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          if (*(_DWORD *)&msg_4[4])
            v21 = 1;
          else
            v21 = *(_DWORD *)&msg_4[28] == 0;
          if (v21)
            v20 = -300;
          else
            v20 = *(_DWORD *)&msg_4[28];
          goto LABEL_39;
        }
      }
      v20 = -300;
    }
    else
    {
      v20 = -301;
    }
LABEL_39:
    mach_msg_destroy((mach_msg_header_t *)&msg);
LABEL_40:
    if (v20 == 268435459)
    {
      LOBYTE(layer_renderer_info) = 0;
      *((_BYTE *)v8 + 241) |= 2u;
      goto LABEL_14;
    }
    goto LABEL_42;
  }
  LOBYTE(layer_renderer_info) = 0;
  return layer_renderer_info;
}

+ (CALayer)layerWithRenderLayer:(void *)a3
{
  return +[CALayer layerWithRenderLayer:options:](CALayer, "layerWithRenderLayer:options:", a3, 0);
}

+ (CALayer)layerWithRenderLayer:(void *)a3 options:(id)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v5 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("contextColorspace"), 0, v8);
  if (v5)
    v7 = v5;
  return calayer_from_render_layer((uint64_t)&v7, (uint64_t)a3);
}

+ (BOOL)needsLayoutForKey:(id)a3
{
  return 0;
}

- (id)optimizationOpportunities:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  CGDataProviderDirectCallbacks *v6;
  CGDataProviderGetBytePointerCallback getBytePointer;
  uint64_t (**v8)(CALayer *);
  uint64_t (*v9)(CALayer *);

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (CGDataProviderDirectCallbacks *)&-[CALayer(Optimizations) optimizationOpportunities:]::entries;
  do
  {
    getBytePointer = v6->getBytePointer;
    if ((*(unsigned int (**)(CALayer *))&v6->version)(self))
      objc_msgSend(v5, "addObject:", getBytePointer);
    v6 = (CGDataProviderDirectCallbacks *)((char *)v6 + 16);
  }
  while (v6 != &CA::CG::AccelDataProvider::callbacks(void)::vtable);
  if (v3)
  {
    v8 = &-[CALayer(Optimizations) optimizationOpportunities:]::internal_entries;
    do
    {
      v9 = v8[1];
      if ((*v8)(self))
        objc_msgSend(v5, "addObject:", v9);
      v8 += 2;
    }
    while (v8 != &-[CALayer(Optimizations) optimizationOpportunities:]::entries);
  }
  return v5;
}

@end
