@implementation CAMetalLayer

- (void)didChangeValueForKey:(id)a3
{
  _BOOL4 v5;
  _WORD *priv;
  __int16 v7;
  __int16 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  _BOOL4 v17;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_priv)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("opaque")))
    {
      v5 = -[CALayer isOpaque](self, "isOpaque");
      priv = self->_priv;
      if (v5)
        v7 = 4;
      else
        v7 = 0;
      v8 = priv[144] & 0xFFFB;
      goto LABEL_17;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("presentsWithTransaction")))
    {
      v9 = -[CAMetalLayer presentsWithTransaction](self, "presentsWithTransaction");
      priv = self->_priv;
      if (v9)
        v7 = 32;
      else
        v7 = 0;
      v8 = priv[144] & 0xFFDF;
      goto LABEL_17;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("allowsNextDrawableTimeout")))
    {
      v10 = -[CAMetalLayer allowsNextDrawableTimeout](self, "allowsNextDrawableTimeout");
      priv = self->_priv;
      if (v10)
        v7 = 128;
      else
        v7 = 0;
      v8 = priv[144] & 0xFF7F;
      goto LABEL_17;
    }
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("fenceEnabled")))
    {
      if (objc_msgSend(a3, "isEqualToString:", CFSTR("serverSyncEnabled")))
      {
        v14 = -[CAMetalLayer serverSyncEnabled](self, "serverSyncEnabled");
        priv = self->_priv;
        if (v14)
          v7 = 1024;
        else
          v7 = 0;
        v8 = priv[144] & 0xFBFF;
      }
      else
      {
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("lowLatency")))
        {
          v15 = -[CAMetalLayer lowLatency](self, "lowLatency");
          priv = self->_priv;
          v11 = priv[144] & 0xFFFE | v15;
          goto LABEL_18;
        }
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("lowWorkload")))
        {
          v16 = -[CAMetalLayer lowWorkload](self, "lowWorkload");
          priv = self->_priv;
          if (v16)
            v7 = 2;
          else
            v7 = 0;
          v8 = priv[144] & 0xFFFD;
        }
        else
        {
          if (!objc_msgSend(a3, "isEqualToString:", CFSTR("allowsDisplayCompositingWithCopy")))
            goto LABEL_19;
          v17 = -[CAMetalLayer allowsDisplayCompositingWithCopy](self, "allowsDisplayCompositingWithCopy");
          priv = self->_priv;
          if (v17)
            v7 = 0x2000;
          else
            v7 = 0;
          v8 = priv[144] & 0xDFFF;
        }
      }
LABEL_17:
      v11 = v8 | v7;
LABEL_18:
      priv[144] = v11;
      goto LABEL_19;
    }
    if (-[CAMetalLayer fenceEnabled](self, "fenceEnabled"))
      v12 = 256;
    else
      v12 = 0;
    *((_WORD *)self->_priv + 144) = *((_WORD *)self->_priv + 144) & 0xFEFF | v12;
    if (-[CAMetalLayer fenceEnabled](self, "fenceEnabled"))
      v13 = 512;
    else
      v13 = 0;
    *((_WORD *)self->_priv + 144) = *((_WORD *)self->_priv + 144) & 0xFDFF | v13;
    CAImageQueueSetFlagsInternal(*((int **)self->_priv + 2), 0x4000000000000000, (unint64_t)(*((_WORD *)self->_priv + 144) & 0x100) << 54);
  }
LABEL_19:
  v18.receiver = self;
  v18.super_class = (Class)CAMetalLayer;
  -[CAMetalLayer didChangeValueForKey:](&v18, sel_didChangeValueForKey_, a3);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  void *priv;
  __int16 v4;

  priv = self->_priv;
  if (priv)
  {
    if (a3)
      v4 = 8;
    else
      v4 = 0;
    *((_WORD *)priv + 144) = *((_WORD *)priv + 144) & 0xFFF7 | v4;
    if (a3)
      CAImageQueueConsumeUnconsumed_(*((_QWORD *)priv + 2), 0);
    else
      layer_private_cleanup_callbacks((_CAMetalLayerPrivate *)priv);
  }
}

+ (id)defaultValueForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("opaque")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("allowsDisplayCompositing")) & 1) != 0)
  {
    return (id)MEMORY[0x1E0C9AAB0];
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("presentsWithTransaction")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("fenceEnabled")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("serverSyncEnabled")) & 1) != 0)
  {
    return (id)MEMORY[0x1E0C9AAA0];
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("displaySyncEnabled")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("allowsNextDrawableTimeout")) & 1) != 0)
  {
    return (id)MEMORY[0x1E0C9AAB0];
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("lowLatency")) & 1) != 0)
    return (id)MEMORY[0x1E0C9AAA0];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("allowsDisplayCompositingWithCopy")) & 1) != 0)
    return (id)MEMORY[0x1E0C9AAB0];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("lowWorkload")) & 1) == 0)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___CAMetalLayer;
    return objc_msgSendSuper2(&v6, sel_defaultValueForKey_, a3);
  }
  return (id)MEMORY[0x1E0C9AAA0];
}

- (CGSize)drawableSize
{
  unint64_t v2;
  unint64_t v3;
  _DWORD *priv;
  double v5;
  double v6;
  CGSize result;

  priv = self->_priv;
  LODWORD(v2) = priv[30];
  LODWORD(v3) = priv[31];
  v5 = (double)v2;
  v6 = (double)v3;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)nextDrawable
{
  os_unfair_lock_s *v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = (os_unfair_lock_s *)((char *)self->_priv + 8);
  os_unfair_lock_lock(v3);
  if (*((_QWORD *)self->_priv + 4))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalLayerInvalidOperation"), CFSTR("-nextDrawable should not be called when using CAMetalDisplayLink."));
  v6[0] = 0;
  CAMetalLayerPrivateNextDrawableLocked(self, (CAMetalDrawable **)v6, 0);
  objc_msgSend(v6[0], "estimateTargets");
  v4 = -[CAMetalLayer shimDrawable:](self, "shimDrawable:", v6[0]);
  os_unfair_lock_unlock(v3);
  return v4;
}

- (id)shimDrawable:(id)a3
{
  return a3;
}

+ (BOOL)CA_automaticallyNotifiesObservers:(Class)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((Class)objc_opt_class() == a3)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___CAMetalLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (CAMetalLayer)init
{
  CAMetalLayer *v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_CAImageQueue *, void *, unsigned int, uint64_t);
  uint64_t v15;
  malloc_zone_t *malloc_zone;
  _QWORD *v17;
  void (*v18)(_CAImageQueue *, unsigned int, double, double, double, char *);
  uint64_t v19;
  malloc_zone_t *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  malloc_zone_t *v25;
  _QWORD *v26;
  __int16 v27;
  __int16 v28;
  __int16 v29;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  id v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  objc_super v42;
  uint64_t aBlock;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  _QWORD *v47;
  objc_super v48;
  pthread_key_t v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)CAMetalLayer;
  v2 = -[CALayer init](&v48, sel_init);
  if (v2)
  {
    if (!collect_slot)
    {
      v49[0] = 0;
      pthread_key_create(v49, 0);
      collect_slot = v49[0];
    }
    v3 = malloc_type_calloc(1uLL, 0x130uLL, 0x10A0040EC70FFF3uLL);
    *(_DWORD *)v3 = 1;
    v4 = CAImageQueueCreate_(0, 5u);
    if (v4)
      *(_QWORD *)(v4 + 32) = 0;
    v3[2] = v4;
    if (byte_1ECDC6AC8)
      v5 = 2;
    else
      v5 = 3;
    *((_DWORD *)v3 + 33) = v5;
    *((_DWORD *)v3 + 34) = 3;
    v3[18] = dispatch_semaphore_create(0);
    *((_DWORD *)v3 + 38) = 0;
    v3[24] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3[27] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v3[2])
    {
      CA::Render::add_observer(0x31u, 0, (uint64_t)layer_private_memory_warning, (uint64_t)v3, 0);
      CA::Render::add_observer(9u, 0, (uint64_t)drawable_purgeable_callback, (uint64_t)v3, 0);
      v6 = *((_DWORD *)v3 + 33);
      if (v6 == 2)
        v7 = 0x2440000000008001;
      else
        v7 = 0x2400000000008001;
      if (v6 == 2)
        v8 = 0x2440000000008000;
      else
        v8 = 0x2400000000008000;
      if (wants_compositing_dependencies(void)::once != -1)
        dispatch_once(&wants_compositing_dependencies(void)::once, &__block_literal_global_468);
      if (wants_compositing_dependencies(void)::wants_compositing_dependencies)
        v9 = v7 | 0x4000000000000;
      else
        v9 = v7;
      if (wants_compositing_dependencies(void)::wants_compositing_dependencies)
        v10 = v8 | 0x4000000000000;
      else
        v10 = v8;
      CAImageQueueSetFlagsInternal((int *)v3[2], v9, v10);
      v11 = v3[2];
      v12 = *(_QWORD *)(v11 + 48);
      if (v12)
        *(_BYTE *)(*(_QWORD *)(v12 + 24) + 95) = 2;
      CAImageQueueSetCollectableCallback(v11, 0, (uint64_t)layer_collectable_signal, (uint64_t)v3);
      v13 = v3[2];
      if (!*(_QWORD *)(v13 + 48))
        goto LABEL_53;
      pthread_mutex_lock(&composited_mutex);
      v14 = *(void (**)(_CAImageQueue *, void *, unsigned int, uint64_t))(v13 + 144);
      if (v14 != layer_composited || *(_QWORD **)(v13 + 152) != v3)
      {
        if (*(_BYTE *)(v13 + 160))
        {
          do
            pthread_cond_wait(&composited_cond, &composited_mutex);
          while (*(_BYTE *)(v13 + 160));
          v14 = *(void (**)(_CAImageQueue *, void *, unsigned int, uint64_t))(v13 + 144);
        }
        if (!v14)
        {
          v15 = composited_list;
          malloc_zone = (malloc_zone_t *)get_malloc_zone();
          v17 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
          *v17 = v13;
          v17[1] = v15;
          composited_list = (uint64_t)v17;
        }
        *(_QWORD *)(v13 + 144) = layer_composited;
        *(_QWORD *)(v13 + 152) = v3;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 48) + 24) + 52) = *(_DWORD *)(v13 + 28);
      }
      pthread_mutex_unlock(&composited_mutex);
      v13 = v3[2];
      if (*(_QWORD *)(v13 + 48))
      {
        pthread_mutex_lock(&presented_mutex);
        v18 = *(void (**)(_CAImageQueue *, unsigned int, double, double, double, char *))(v13 + 120);
        if (v18 != layer_presented || *(_QWORD **)(v13 + 128) != v3)
        {
          if (*(_BYTE *)(v13 + 136))
          {
            do
              pthread_cond_wait(&presented_cond, &presented_mutex);
            while (*(_BYTE *)(v13 + 136));
            v18 = *(void (**)(_CAImageQueue *, unsigned int, double, double, double, char *))(v13 + 120);
          }
          if (!v18)
          {
            v19 = presented_list;
            v20 = (malloc_zone_t *)get_malloc_zone();
            v21 = malloc_type_zone_malloc(v20, 0x10uLL, 0x8BB15036uLL);
            *v21 = v13;
            v21[1] = v19;
            presented_list = (uint64_t)v21;
          }
          *(_QWORD *)(v13 + 120) = layer_presented;
          *(_QWORD *)(v13 + 128) = v3;
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 48) + 24) + 48) = *(_DWORD *)(v13 + 28);
        }
        pthread_mutex_unlock(&presented_mutex);
        v13 = v3[2];
        v22 = *(_QWORD *)(v13 + 48);
        aBlock = MEMORY[0x1E0C809B0];
        v44 = 3221225472;
        v45 = __20__CAMetalLayer_init__block_invoke;
        v46 = &__block_descriptor_40_e24_v16__0___CAImageQueue__8l;
        v47 = v3;
        if (v22)
        {
          pthread_mutex_lock(&display_change_mutex);
          v23 = *(uint64_t **)(v13 + 168);
          if (v23 != &aBlock)
          {
            if (*(_BYTE *)(v13 + 176))
            {
              do
                pthread_cond_wait(&display_change_cond, &display_change_mutex);
              while (*(_BYTE *)(v13 + 176));
              v23 = *(uint64_t **)(v13 + 168);
            }
            if (!v23)
            {
              v24 = display_change_list;
              v25 = (malloc_zone_t *)get_malloc_zone();
              v26 = malloc_type_zone_malloc(v25, 0x10uLL, 0x8BB15036uLL);
              *v26 = v13;
              v26[1] = v24;
              display_change_list = (uint64_t)v26;
              v23 = *(uint64_t **)(v13 + 168);
            }
            _Block_release(v23);
            *(_QWORD *)(v13 + 168) = _Block_copy(&aBlock);
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v13 + 48) + 24) + 56) = *(_DWORD *)(v13 + 28);
          }
          pthread_mutex_unlock(&display_change_mutex);
          v13 = v3[2];
        }
      }
      else
      {
LABEL_53:
        aBlock = MEMORY[0x1E0C809B0];
        v44 = 3221225472;
        v45 = __20__CAMetalLayer_init__block_invoke;
        v46 = &__block_descriptor_40_e24_v16__0___CAImageQueue__8l;
        v47 = v3;
      }
      v3[3] = v2;
      v42.receiver = v2;
      v42.super_class = (Class)CAMetalLayer;
      -[CALayer setContents:](&v42, sel_setContents_, v13);
      if (-[CALayer isOpaque](v2, "isOpaque"))
        v27 = 4;
      else
        v27 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFFFB | v27;
      if (-[CAMetalLayer presentsWithTransaction](v2, "presentsWithTransaction"))
        v28 = 32;
      else
        v28 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFFDF | v28;
      if (-[CAMetalLayer allowsNextDrawableTimeout](v2, "allowsNextDrawableTimeout"))
        v29 = 128;
      else
        v29 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFF7F | v29;
      if (-[CAMetalLayer fenceEnabled](v2, "fenceEnabled"))
        v30 = 256;
      else
        v30 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFEFF | v30;
      if (-[CAMetalLayer fenceEnabled](v2, "fenceEnabled"))
        v31 = 512;
      else
        v31 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFDFF | v31;
      if (-[CAMetalLayer serverSyncEnabled](v2, "serverSyncEnabled"))
        v32 = 1024;
      else
        v32 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFBFF | v32;
      *((_WORD *)v3 + 144) = v3[36] & 0xFFFE | -[CAMetalLayer lowLatency](v2, "lowLatency");
      if (-[CAMetalLayer lowWorkload](v2, "lowWorkload"))
        v33 = 2;
      else
        v33 = 0;
      *((_WORD *)v3 + 144) = v3[36] & 0xFFFD | v33;
      if (-[CAMetalLayer allowsDisplayCompositingWithCopy](v2, "allowsDisplayCompositingWithCopy"))
        v34 = 0x2000;
      else
        v34 = 0;
      v35 = v3[36] & 0xDFFF | v34;
      *((_WORD *)v3 + 144) = v35;
      *((_WORD *)v3 + 144) = v35 & 0xFFE7 | (*((_DWORD *)v2->super._attr.layer + 13) >> 17) & 8;
      v36 = MTLCreateSystemDefaultDevice();
      v3[9] = v36;
      v37 = v36;
      v3[10] = v37;
      v3[11] = objc_msgSend(v37, "registryID");
      v3[12] = 80;
      *((_DWORD *)v3 + 16) = 1111970369;
      *((_WORD *)v3 + 144) |= 0x40u;
      *((_DWORD *)v3 + 32) = 0;
      *((_BYTE *)v3 + 232) = -1;
      v3[30] = 0;
      v3[31] = 0;
      v3[34] = 0;
      v3[35] = 0;
      v3[32] = 0;
      v3[33] = -1;
      v3[6] = 0x3FF0000000000000;
      v3[37] = 0;
      v38 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      v3[21] = dispatch_queue_create("com.apple.coreanimation.CAMetalLayerEventListenerQueue", v38);
      v3[20] = objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEC0]), "initWithDispatchQueue:", v3[21]);
      v39 = mach_absolute_time();
      v3[28] = CAHostTimeWithTime(1.0) + v39;
      v40 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
      v3[22] = dispatch_queue_create("com.apple.coreanimation.CAMetalLayerTimeoutQueue", v40);
      v2->_priv = v3;
      if (MEMORY[0x1E0D22798])
        FPCAMetalLayerAllocated();
    }
    else
    {
      free(v3);

      return 0;
    }
  }
  return v2;
}

- (BOOL)fenceEnabled
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = fenceEnabled_atom;
  if (!fenceEnabled_atom)
  {
    v3 = CAInternAtomWithCString("fenceEnabled");
    fenceEnabled_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)presentsWithTransaction
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = presentsWithTransaction_atom;
  if (!presentsWithTransaction_atom)
  {
    v3 = CAInternAtomWithCString("presentsWithTransaction");
    presentsWithTransaction_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)allowsNextDrawableTimeout
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = allowsNextDrawableTimeout_atom;
  if (!allowsNextDrawableTimeout_atom)
  {
    v3 = CAInternAtomWithCString("allowsNextDrawableTimeout");
    allowsNextDrawableTimeout_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)serverSyncEnabled
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = serverSyncEnabled_atom;
  if (!serverSyncEnabled_atom)
  {
    v3 = CAInternAtomWithCString("serverSyncEnabled");
    serverSyncEnabled_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)lowLatency
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = lowLatency_atom;
  if (!lowLatency_atom)
  {
    v3 = CAInternAtomWithCString("lowLatency");
    lowLatency_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (BOOL)allowsDisplayCompositingWithCopy
{
  unsigned __int16 *priv;
  _BOOL4 v3;

  priv = (unsigned __int16 *)self->_priv;
  if (priv)
    return (priv[144] >> 13) & 1;
  else
    LOBYTE(v3) = 1;
  return v3;
}

- (void)setColorspace:(CGColorSpaceRef)colorspace
{
  -[CAMetalLayer setColorspace:nonDefault:](self, "setColorspace:nonDefault:", colorspace, 1);
}

- (MTLPixelFormat)pixelFormat
{
  return *((_QWORD *)self->_priv + 12);
}

- (void)setPresentsWithTransaction:(BOOL)presentsWithTransaction
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = presentsWithTransaction_atom;
  if (!presentsWithTransaction_atom)
  {
    v5 = CAInternAtomWithCString("presentsWithTransaction");
    presentsWithTransaction_atom = v5;
  }
  v6 = presentsWithTransaction;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setFramebufferOnly:(BOOL)framebufferOnly
{
  os_unfair_lock_s *priv;
  _BOOL4 v4;
  __int16 os_unfair_lock_opaque;
  __int16 v6;

  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    v4 = framebufferOnly;
    os_unfair_lock_lock(priv + 2);
    os_unfair_lock_opaque = priv[72]._os_unfair_lock_opaque;
    if (((((os_unfair_lock_opaque & 0x40) == 0) ^ v4) & 1) == 0)
    {
      if (v4)
        v6 = 64;
      else
        v6 = 0;
      LOWORD(priv[72]._os_unfair_lock_opaque) = os_unfair_lock_opaque & 0xFFBF | v6;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock(priv + 2);
  }
}

- (void)setPixelFormat:(MTLPixelFormat)pixelFormat
{
  uint64_t v5;
  int v6;
  unsigned __int16 v7;
  int v8;
  unsigned int v9;
  void *priv;

  if ((int)pixelFormat <= (uint64_t)(MTLPixelFormatBGRA8Unorm_sRGB|0x8))
  {
    if ((int)pixelFormat <= (uint64_t)MTLPixelFormatRG16Sint)
    {
      if ((pixelFormat - 10) < 2)
      {
        v5 = 1093677112;
        goto LABEL_29;
      }
      if ((pixelFormat - 30) < 2)
      {
        v5 = 1279340600;
        goto LABEL_29;
      }
LABEL_28:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalLayerInvalid"), CFSTR("invalid pixel format %lu"), pixelFormat);
      v5 = 0;
      goto LABEL_29;
    }
    if ((pixelFormat - 70) >= 2)
    {
      if ((pixelFormat - 80) < 2)
      {
        v5 = 1111970369;
LABEL_29:
        v8 = 29;
        goto LABEL_30;
      }
      if ((_DWORD)pixelFormat == MTLPixelFormatRG16Float)
      {
        v5 = 843264104;
        goto LABEL_29;
      }
      goto LABEL_28;
    }
    v7 = 16961;
LABEL_19:
    v5 = v7 | 0x52470000u;
    goto LABEL_29;
  }
  if ((int)pixelFormat <= 549)
  {
    if ((_DWORD)pixelFormat == MTLPixelFormatRGB10A2Unorm)
    {
      v5 = 1378955371;
      goto LABEL_29;
    }
    if ((_DWORD)pixelFormat == MTLPixelFormatBGR10A2Unorm)
    {
      v5 = 1815162994;
      goto LABEL_29;
    }
    if ((_DWORD)pixelFormat != MTLPixelFormatRGBA16Float)
      goto LABEL_28;
    v7 = 26689;
    goto LABEL_19;
  }
  if ((pixelFormat - 550) > 5)
    goto LABEL_28;
  v6 = 1 << (pixelFormat - 38);
  if ((v6 & 3) != 0)
  {
    v5 = 1647534392;
  }
  else if ((v6 & 0xC) != 0)
  {
    v5 = 1999908961;
  }
  else
  {
    v5 = 1999843442;
  }
  v8 = 28;
LABEL_30:
  if (!-[CAMetalLayer colorspace](self, "colorspace")
    || !-[CAMetalLayer nonDefaultColorspace](self, "nonDefaultColorspace"))
  {
    if (pixelFormat == MTLPixelFormatRGBA16Float)
      v9 = 26;
    else
      v9 = v8;
    -[CAMetalLayer setColorspace:nonDefault:](self, "setColorspace:nonDefault:", CAGetColorSpace(v9), 0);
  }
  priv = self->_priv;
  if (priv)
  {
    layer_private_check_pixel_format(*((_CAMetalLayerPrivate **)priv + 9), (CA::Render *)v5);
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    if (*((_QWORD *)priv + 12) != pixelFormat)
    {
      *((_DWORD *)priv + 16) = v5;
      *((_QWORD *)priv + 12) = pixelFormat;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)priv + 2);
    if (MEMORY[0x1E0D227E8])
      FPMetalLayerMarkSetPixelFormat();
  }
}

- (void)setNonDefaultColorspace:(BOOL)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = nonDefaultColorspace_atom;
  if (!nonDefaultColorspace_atom)
  {
    v5 = CAInternAtomWithCString("nonDefaultColorspace");
    nonDefaultColorspace_atom = v5;
  }
  v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setColorspace:(CGColorSpace *)a3 nonDefault:(BOOL)a4
{
  _BOOL8 v4;
  CGColorSpace **priv;
  void *v8;
  CGColorSpace *v9;

  v4 = a4;
  priv = (CGColorSpace **)self->_priv;
  if (priv && priv[31] != a3)
  {
    CGColorSpaceRetain(a3);
    v8 = self->_priv;
    v9 = (CGColorSpace *)*((_QWORD *)v8 + 31);
    if (v9)
    {
      CGColorSpaceRelease(v9);
      v8 = self->_priv;
    }
    *((_QWORD *)v8 + 31) = a3;
  }
  -[CAMetalLayer setNonDefaultColorspace:](self, "setNonDefaultColorspace:", v4);
}

- (CGColorSpaceRef)colorspace
{
  return (CGColorSpaceRef)*((_QWORD *)self->_priv + 31);
}

- (BOOL)nonDefaultColorspace
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = nonDefaultColorspace_atom;
  if (!nonDefaultColorspace_atom)
  {
    v3 = CAInternAtomWithCString("nonDefaultColorspace");
    nonDefaultColorspace_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setDrawableSize:(CGSize)drawableSize
{
  os_unfair_lock_s *priv;
  int width;
  int height;

  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    if (drawableSize.width > 16384.0
      || drawableSize.width < 1.0
      || drawableSize.height < 1.0
      || drawableSize.height > 16384.0)
    {
      NSLog(CFSTR("CAMetalLayer ignoring invalid setDrawableSize width=%f height=%f"), a2, *(_QWORD *)&drawableSize.width, *(_QWORD *)&drawableSize.height);
    }
    else
    {
      width = drawableSize.width;
      height = drawableSize.height;
      os_unfair_lock_lock(priv + 2);
      if (priv[30]._os_unfair_lock_opaque != width || priv[31]._os_unfair_lock_opaque != height)
      {
        layer_private_set_drawable_size_internal((_CAMetalLayerPrivate *)priv, width, height);
        layer_private_flush_async((_CAMetalLayerPrivate *)priv);
      }
      os_unfair_lock_unlock(priv + 2);
    }
  }
}

- (void)setDevice:(id)device
{
  void *priv;
  id v5;

  priv = self->_priv;
  if (priv)
  {
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    if (*((id *)priv + 9) != device)
    {
      v5 = device;

      *((_QWORD *)priv + 9) = device;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)priv + 2);
  }
}

- (BOOL)isDrawableAvailable
{
  uint64_t v3;
  double v4;
  char *priv;
  os_unfair_lock_s *v6;
  __int16 v7;
  _BOOL4 v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;

  v3 = mach_absolute_time();
  v4 = CATimeWithHostTime(v3);
  while (1)
  {
    priv = (char *)self->_priv;
    v6 = (os_unfair_lock_s *)(priv + 8);
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    v7 = *((_WORD *)priv + 144);
    if ((v7 & 0x100) != 0)
    {
      v9 = *((_QWORD *)priv + 4) == 0;
LABEL_7:
      if ((v7 & 0x10) == 0 && v9)
        v10 = 132;
      else
        v10 = 136;
      v8 = *(_DWORD *)&priv[v10] > 2u;
      goto LABEL_11;
    }
    if ((v7 & 0x20) != 0 && !*((_QWORD *)priv + 4))
    {
      v9 = 1;
      goto LABEL_7;
    }
    v8 = 0;
LABEL_11:
    pthread_setspecific(collect_slot, priv);
    v11 = CAImageQueueCollect_(*((_QWORD *)priv + 2), 0, v8);
    pthread_setspecific(collect_slot, 0);
    if (v11)
    {
      v12 = *((_QWORD *)priv + 4) || (*((_WORD *)priv + 144) & 0x10) != 0
          ? *((unsigned int *)priv + 34)
          : *((unsigned int *)priv + 33);
      if (v12 < 5)
      {
        v13 = 5 - v12;
        v14 = v11;
        if (v13 < v11)
          v14 = v13;
        v11 -= v14;
      }
    }
    v15 = *((unsigned int *)priv + 35);
    os_unfair_lock_unlock(v6);
    v16 = mach_absolute_time();
    v17 = CATimeWithHostTime(v16);
    if (v11 > v15 || v17 - v4 > 0.001)
      break;
    usleep(0x64u);
  }
  if (v11 <= v15)
  {
    v18 = self->_priv;
    os_unfair_lock_lock((os_unfair_lock_t)v18 + 2);
    CAImageQueuePing_(*((_QWORD *)v18 + 2), 0, 0, 0.0, 0.0);
    os_unfair_lock_unlock((os_unfair_lock_t)v18 + 2);
  }
  return v11 > v15;
}

- (void)_didCommitLayer:(void *)a3
{
  char *priv;
  unsigned int *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  int v10;
  CA::Render::Encoder *os_unfair_lock_opaque;
  __CFString *v12;
  void *v13;
  unsigned int v14;
  objc_super v15;
  int valuePtr;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  priv = (char *)self->_priv;
  if (priv)
  {
    v6 = (unsigned int *)(priv + 4);
    if ((*((_DWORD *)priv + 1) & 2) != 0)
    {
      v7 = *((_QWORD *)a3 + 5);
      if (v7)
      {
        v8 = (os_unfair_lock_s *)*((_QWORD *)priv + 2);
        if (v8)
        {
          v9 = v8 + 4;
          os_unfair_lock_lock(v8 + 4);
          v10 = v8[6]._os_unfair_lock_opaque + 1;
          v8[6]._os_unfair_lock_opaque = v10;
          os_unfair_lock_unlock(v8 + 4);
          os_unfair_lock_lock(v8 + 4);
          os_unfair_lock_opaque = (CA::Render::Encoder *)v8[7]._os_unfair_lock_opaque;
          os_unfair_lock_unlock(v9);
          valuePtr = v10;
          v12 = (__CFString *)CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          CA::Context::commit_command((CA::Context *)0xE, os_unfair_lock_opaque, v12, *(const void **)(v7 + 208), v13);
          CFRelease(v12);
        }
        do
          v14 = __ldaxr(v6);
        while (__stlxr(v14 & 0xFFFFFFFD, v6));
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)CAMetalLayer;
  -[CALayer _didCommitLayer:](&v15, sel__didCommitLayer_, a3);
}

- (id)device
{
  return (id)*((_QWORD *)self->_priv + 9);
}

- (void)setFenceEnabled:(BOOL)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = fenceEnabled_atom;
  if (!fenceEnabled_atom)
  {
    v5 = CAInternAtomWithCString("fenceEnabled");
    fenceEnabled_atom = v5;
  }
  v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setLowLatency:(BOOL)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = lowLatency_atom;
  if (!lowLatency_atom)
  {
    v5 = CAInternAtomWithCString("lowLatency");
    lowLatency_atom = v5;
  }
  v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (NSUInteger)maximumDrawableCount
{
  unsigned int *priv;

  priv = (unsigned int *)self->_priv;
  if (priv)
    return priv[33];
  else
    return 0;
}

- (void)setAllowsNextDrawableTimeout:(BOOL)allowsNextDrawableTimeout
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = allowsNextDrawableTimeout_atom;
  if (!allowsNextDrawableTimeout_atom)
  {
    v5 = CAInternAtomWithCString("allowsNextDrawableTimeout");
    allowsNextDrawableTimeout_atom = v5;
  }
  v6 = allowsNextDrawableTimeout;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (void)setMaximumDrawableCount:(NSUInteger)maximumDrawableCount
{
  void *priv;
  int *v6;
  uint64_t v7;

  priv = self->_priv;
  if (*((_QWORD *)priv + 4))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalLayerInvalidOperation"), CFSTR("-setMaximumDrawableCount should not be called when using CAMetalDisplayLink."));
    priv = self->_priv;
  }
  if ((maximumDrawableCount & 0xFFFFFFFFFFFFFFFELL) != 2 || !priv)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalLayerInvalidMaximumDrawableCount"), CFSTR("failed trying to set maximumDrawableCount to %lu outside of the valid range of [2, 3]"), maximumDrawableCount);
    return;
  }
  if (byte_1ECDC6AC8)
  {
    *((_DWORD *)priv + 33) = 2;
    v6 = (int *)*((_QWORD *)priv + 2);
  }
  else
  {
    *((_DWORD *)priv + 33) = maximumDrawableCount;
    v6 = (int *)*((_QWORD *)priv + 2);
    if (maximumDrawableCount != 2)
    {
      v7 = 0;
      goto LABEL_10;
    }
  }
  v7 = 0x40000000000000;
LABEL_10:
  CAImageQueueSetFlagsInternal(v6, 0x40000000000000, v7);
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("device")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("pixelFormat")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("framebufferOnly")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("drawableSize")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("maximumDrawableCount")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("presentsWithTransaction")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("colorspace")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("EDRMetadata")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("protectionOptions")) & 1) != 0
    || (objc_msgSend(a3, "isEqualToString:", CFSTR("textureUsage")) & 1) != 0)
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)CAMetalLayer;
  return -[CALayer shouldArchiveValueForKey:](&v6, sel_shouldArchiveValueForKey_, a3);
}

- (void)dealloc
{
  _CAMetalLayerPrivate *priv;
  void *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  priv = (_CAMetalLayerPrivate *)self->_priv;
  if (priv)
  {
    +[CATransaction lock](CATransaction, "lock");
    *((_QWORD *)priv + 3) = 0;
    +[CATransaction unlock](CATransaction, "unlock");
    layer_private_release(priv, v4);
  }
  self->_priv = (void *)0x3333333333333333;
  if (MEMORY[0x1E0D227D8])
    FPMetalLayerMarkDealloc();
  v5.receiver = self;
  v5.super_class = (Class)CAMetalLayer;
  -[CALayer dealloc](&v5, sel_dealloc);
}

- (void)setName:(id)a3
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)CAMetalLayer;
  -[CALayer setName:](&v3, sel_setName_);
  if (MEMORY[0x1E0D227E0])
    FPMetalLayerMarkSetName();
}

- (id)preferredDevice
{
  return (id)*((_QWORD *)self->_priv + 10);
}

- (BOOL)framebufferOnly
{
  return (*((unsigned __int16 *)self->_priv + 144) >> 6) & 1;
}

- (CAEDRMetadata)EDRMetadata
{
  return (CAEDRMetadata *)*((_QWORD *)self->_priv + 32);
}

- (void)setEDRMetadata:(CAEDRMetadata *)EDRMetadata
{
  CAEDRMetadata *v5;

  if (*((CAEDRMetadata **)self->_priv + 32) != EDRMetadata)
  {
    v5 = EDRMetadata;

    *((_QWORD *)self->_priv + 32) = EDRMetadata;
  }
}

- (id)newDrawable
{
  if (-[CAMetalLayer newDrawable]::warn_once != -1)
    dispatch_once(&-[CAMetalLayer newDrawable]::warn_once, &__block_literal_global_318_8702);
  return -[CAMetalLayer nextDrawable](self, "nextDrawable");
}

- (void)_display
{
  objc_super v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.receiver = self;
  v2.super_class = (Class)CAMetalLayer;
  -[CALayer setContents:](&v2, sel_setContents_, -[CALayer contents](self, "contents"));
}

- (void)setContents:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[CALayer contents](self, "contents") != a3)
  v5.receiver = self;
  v5.super_class = (Class)CAMetalLayer;
  -[CALayer setContents:](&v5, sel_setContents_, a3);
}

- (BOOL)displaySyncEnabled
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = displaySyncEnabled_atom;
  if (!displaySyncEnabled_atom)
  {
    v3 = CAInternAtomWithCString("displaySyncEnabled");
    displaySyncEnabled_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setDisplaySyncEnabled:(BOOL)displaySyncEnabled
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = displaySyncEnabled_atom;
  if (!displaySyncEnabled_atom)
  {
    v5 = CAInternAtomWithCString("displaySyncEnabled");
    displaySyncEnabled_atom = v5;
  }
  v6 = displaySyncEnabled;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (NSDictionary)developerHUDProperties
{
  unsigned int v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = developerHUDProperties_atom;
  if (!developerHUDProperties_atom)
  {
    v3 = CAInternAtomWithCString("developerHUDProperties");
    developerHUDProperties_atom = v3;
  }
  v5[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)3, v5);
  return (NSDictionary *)v5[0];
}

- (void)setDeveloperHUDProperties:(NSDictionary *)developerHUDProperties
{
  uint64_t v5;
  double v6[2];

  v6[1] = *(double *)MEMORY[0x1E0C80C00];
  v5 = developerHUDProperties_atom;
  if (!developerHUDProperties_atom)
  {
    v5 = CAInternAtomWithCString("developerHUDProperties");
    developerHUDProperties_atom = v5;
  }
  *(_QWORD *)&v6[0] = developerHUDProperties;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)3, v6);
}

- (CADisplay)cachedDisplay
{
  return self->_cachedDisplay;
}

- (void)setCachedDisplay:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

void __27__CAMetalLayer_newDrawable__block_invoke()
{
  NSLog(CFSTR("[CAMetalLayer newDrawable] is deprecated. Please use [CAMetalLayer nextDrawable] instead."));
}

uint64_t __20__CAMetalLayer_init__block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 32))
    return +[CADisplayLink notifyDisplayChange:](CADisplayLink, "notifyDisplayChange:");
  return result;
}

- (unint64_t)displayCompositingInternalStatus
{
  _QWORD *priv;

  priv = self->_priv;
  if (priv)
    return priv[33];
  else
    return -1;
}

- (void)discardContents
{
  void *priv;

  priv = self->_priv;
  if (priv)
  {
    os_unfair_lock_lock((os_unfair_lock_t)priv + 2);
    pthread_setspecific(collect_slot, priv);
    CAImageQueueConsumeUnconsumed_(*((_QWORD *)priv + 2), 1);
    CAImageQueueFlush(*((_QWORD *)priv + 2));
    pthread_setspecific(collect_slot, 0);
    os_unfair_lock_unlock((os_unfair_lock_t)priv + 2);
  }
}

- (void)removeBackBuffers
{
  os_unfair_lock_s *priv;

  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
    layer_private_flush_backbuffers(priv);
}

- (void)setServerSyncEnabled:(BOOL)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = serverSyncEnabled_atom;
  if (!serverSyncEnabled_atom)
  {
    v5 = CAInternAtomWithCString("serverSyncEnabled");
    serverSyncEnabled_atom = v5;
  }
  v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (BOOL)lowWorkload
{
  unsigned int v3;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = lowWorkload_atom;
  if (!lowWorkload_atom)
  {
    v3 = CAInternAtomWithCString("lowWorkload");
    lowWorkload_atom = v3;
  }
  v5 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, v3, (const CGAffineTransform *)7, (id *)&v5);
  return v5 != 0;
}

- (void)setLowWorkload:(BOOL)a3
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = lowWorkload_atom;
  if (!lowWorkload_atom)
  {
    v5 = CAInternAtomWithCString("lowWorkload");
    lowWorkload_atom = v5;
  }
  v6 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)v5, (const CGAffineTransform *)7, (double *)&v6);
}

- (BOOL)exclusiveMode
{
  return 0;
}

- (void)setInputTime:(double)a3
{
  double *priv;

  priv = (double *)self->_priv;
  if (priv)
  {
    if (priv[5] != 0.0)
      NSLog(CFSTR("[CAMetalLayer setInputTime:] - non-zero time already exists!"), a2);
    priv[5] = a3;
  }
}

- (double)inputTime
{
  double *priv;

  priv = (double *)self->_priv;
  if (priv)
    return priv[5];
  else
    return 0.0;
}

- (void)setDrawableTimeoutSeconds:(double)a3
{
  double *priv;

  priv = (double *)self->_priv;
  if (priv)
    priv[6] = a3;
}

- (double)drawableTimeoutSeconds
{
  double *priv;

  priv = (double *)self->_priv;
  if (priv)
    return priv[6];
  else
    return 0.0;
}

- (void)setProtectionOptions:(unint64_t)a3
{
  os_unfair_lock_s *priv;

  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    os_unfair_lock_lock(priv + 2);
    if (*(_QWORD *)&priv[68]._os_unfair_lock_opaque != a3)
    {
      *(_QWORD *)&priv[68]._os_unfair_lock_opaque = a3;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock(priv + 2);
  }
}

- (unint64_t)protectionOptions
{
  return *((_QWORD *)self->_priv + 34);
}

- (void)setTextureUsage:(unint64_t)a3
{
  os_unfair_lock_s *priv;

  priv = (os_unfair_lock_s *)self->_priv;
  if (priv)
  {
    os_unfair_lock_lock(priv + 2);
    if (*(_QWORD *)&priv[70]._os_unfair_lock_opaque != a3)
    {
      *(_QWORD *)&priv[70]._os_unfair_lock_opaque = a3;
      layer_private_flush_async((_CAMetalLayerPrivate *)priv);
    }
    os_unfair_lock_unlock(priv + 2);
  }
}

- (unint64_t)textureUsage
{
  return *((_QWORD *)self->_priv + 35);
}

- (void)setAllowsDisplayCompositingWithCopy:(BOOL)a3
{
  _WORD *priv;
  __int16 v4;

  priv = self->_priv;
  if (priv)
  {
    if (a3)
      v4 = 0x2000;
    else
      v4 = 0;
    priv[144] = priv[144] & 0xDFFF | v4;
  }
}

- (id)currentDisplay
{
  uint64_t v3;
  int v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*((_QWORD *)self->_priv + 2) + 48);
  if (v3)
    v4 = *(_DWORD *)(*(_QWORD *)(v3 + 24) + 24);
  else
    v4 = 0;
  if (-[CAMetalLayer cachedDisplay](self, "cachedDisplay")
    && -[CADisplay displayId](-[CAMetalLayer cachedDisplay](self, "cachedDisplay"), "displayId") == v4)
  {
    return -[CAMetalLayer cachedDisplay](self, "cachedDisplay");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = +[CADisplay displays](CADisplay, "displays");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "displayId") == v4)
        {
          -[CAMetalLayer setCachedDisplay:](self, "setCachedDisplay:", v11);
          return v11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v8)
        continue;
      break;
    }
  }
  -[CAMetalLayer setCachedDisplay:](self, "setCachedDisplay:", 0);
  return 0;
}

@end
