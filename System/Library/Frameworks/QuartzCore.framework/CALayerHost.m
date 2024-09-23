@implementation CALayerHost

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  CA::Transaction *v6;
  CA::Transaction *v7;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = (CA::Transaction *)CAAtomIndexInArray(12, (uint64_t)-[CALayerHost didChangeValueForKey:]::atoms, v5);
  if (v6 != (CA::Transaction *)-1)
  {
    v7 = CA::Transaction::ensure_compat(v6);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v7, 0x10000);
  }
  v8.receiver = self;
  v8.super_class = (Class)CALayerHost;
  -[CALayerHost didChangeValueForKey:](&v8, sel_didChangeValueForKey_, a3);
}

- (void)dealloc
{
  CALayerHost **v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_all_hosts_lock);
  v3 = (CALayerHost **)_all_hosts;
  if (_all_hosts != (_UNKNOWN *)qword_1ECDC48E0)
  {
    while (*v3 != self)
    {
      if (++v3 == (CALayerHost **)qword_1ECDC48E0)
      {
        v3 = (CALayerHost **)qword_1ECDC48E0;
        break;
      }
    }
  }
  if (v3 != (CALayerHost **)qword_1ECDC48E0)
  {
    *v3 = *(CALayerHost **)(qword_1ECDC48E0 - 8);
    if (qword_1ECDC48E0 <= (unint64_t)_all_hosts)
      __assert_rtn("pop_back", "x-small-vector.h", 410, "_end > _begin && \"pop_back on empty container\");
    qword_1ECDC48E0 -= 8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_hosts_lock);
  v4.receiver = self;
  v4.super_class = (Class)CALayerHost;
  -[CALayer dealloc](&v4, sel_dealloc);
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  _BOOL8 v3;
  CA::Transaction *v5;
  objc_super v6;
  uint64_t v7;

  v3 = a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v5 = CA::Transaction::ensure_compat((CA::Transaction *)self);
    CA::Layer::set_commit_needed((CA::Layer *)self->super._attr.layer, v5, 0);
  }
  v6.receiver = self;
  v6.super_class = (Class)CALayerHost;
  -[CALayer layerDidBecomeVisible:](&v6, sel_layerDidBecomeVisible_, v3);
}

- (void)setAsynchronousRenderMaxAPL:(float)a3
{
  self->_asynchronousRenderMaxAPL = a3;
}

- (void)setAsynchronousRenderPeriod:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x29, (const CGAffineTransform *)0x12, v3);
}

- (void)setAsynchronousOpaque:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x28, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setStopsHitTestTransformAccumulation:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x210, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setResizesHostedContext:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1CF, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setInheritsSecurity:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x108, (const CGAffineTransform *)6, (double *)&v3);
}

- (void)setAsynchronousRenderTimes:(id)a3
{
  double v5[2];

  v5[1] = *(double *)MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend(a3, "count") >= 0x401)
  {
    NSLog(CFSTR("CoreAnimation: Async render times array exceed maximum size."));
  }
  else
  {
    *(_QWORD *)&v5[0] = a3;
    CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x2A, (const CGAffineTransform *)3, v5);
  }
}

- (void)_copyRenderLayer:(void *)a3 layerFlags:(unsigned int)a4 commitFlags:(unsigned int *)a5
{
  unsigned int *v7;
  malloc_zone_t *malloc_zone;
  char *v9;
  unsigned int v10;
  NSArray *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  unsigned int *v20;
  unsigned int v21;
  unsigned int v22;
  objc_super v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)CALayerHost;
  v7 = -[CALayer _copyRenderLayer:layerFlags:commitFlags:](&v24, sel__copyRenderLayer_layerFlags_commitFlags_, a3, *(_QWORD *)&a4);
  if (v7 && (*((_BYTE *)a5 + 2) & 1) != 0)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v9 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0x58uLL, 0x743898A5uLL);
    if (v9)
    {
      v10 = -[CALayerHost contextId](self, "contextId");
      *((_DWORD *)v9 + 2) = 1;
      *((_DWORD *)v9 + 3) = 30;
      ++dword_1ECDC7CA0;
      *(_QWORD *)v9 = off_1E1599698;
      *((_DWORD *)v9 + 4) = v10;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 40) = 0u;
      *(_OWORD *)(v9 + 56) = 0u;
      *(_OWORD *)(v9 + 72) = 0u;
    }
    if (-[CALayerHost inheritsSecurity](self, "inheritsSecurity"))
      *((_DWORD *)v9 + 3) |= 0x200u;
    if (-[CALayerHost rendersAsynchronously](self, "rendersAsynchronously"))
      *((_DWORD *)v9 + 3) |= 0x400u;
    if (-[CALayerHost asynchronousOpaque](self, "asynchronousOpaque"))
      *((_DWORD *)v9 + 3) |= 0x800u;
    v11 = -[CALayerHost asynchronousRenderTimes](self, "asynchronousRenderTimes");
    if (-[NSArray count](v11, "count"))
    {
      v12 = -[NSArray indexOfObject:inSortedRange:options:usingComparator:](v11, "indexOfObject:inSortedRange:options:usingComparator:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_continuous_time()), 0, -[NSArray count](v11, "count"), 1024, &__block_literal_global_14782);
      v13 = -[NSArray count](v11, "count") - v12;
      v14 = v13;
      std::vector<unsigned long long>::resize((char **)v9 + 5, v13);
      if (v13 >= 1)
      {
        v15 = 0;
        v16 = (_QWORD *)*((_QWORD *)v9 + 5);
        v17 = -v14;
        do
          *v16++ = objc_msgSend(-[NSArray objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", -[NSArray count](v11, "count") + v15-- - 1), "unsignedLongLongValue");
        while (v17 != v15);
      }
    }
    -[CALayerHost asynchronousRenderPeriod](self, "asynchronousRenderPeriod");
    if (v18 >= 0.0)
    {
      -[CALayerHost asynchronousRenderPeriod](self, "asynchronousRenderPeriod");
      *((_QWORD *)v9 + 8) = v19;
    }
    if (-[CALayerHost preservesFlip](self, "preservesFlip"))
      *((_DWORD *)v9 + 3) |= 0x100u;
    if (-[CALayerHost resizesHostedContext](self, "resizesHostedContext"))
      *((_DWORD *)v9 + 3) |= 0x1000u;
    if (-[CALayerHost transformsToScreenSpace](self, "transformsToScreenSpace"))
      *((_DWORD *)v9 + 3) |= 0x4000u;
    if (-[CALayerHost sequestered](self, "sequestered"))
      *((_DWORD *)v9 + 3) |= 0x8000u;
    if (-[CALayerHost stopsHitTestTransformAccumulation](self, "stopsHitTestTransformAccumulation"))
      *((_DWORD *)v9 + 3) |= 0x2000u;
    if (-[CALayerHost stopsSecureSuperlayersValidation](self, "stopsSecureSuperlayersValidation"))
    {
      *((_DWORD *)v9 + 3) |= 0x10000u;
      CA::Render::Layer::set_subclass(v7, (CA::Render::LayerSubclass *)v9);
    }
    else
    {
      CA::Render::Layer::set_subclass(v7, (CA::Render::LayerSubclass *)v9);
      if (!v9)
        return v7;
    }
    v20 = (unsigned int *)(v9 + 8);
    do
    {
      v21 = __ldaxr(v20);
      v22 = v21 - 1;
    }
    while (__stlxr(v22, v20));
    if (!v22)
      (*(void (**)(char *))(*(_QWORD *)v9 + 16))(v9);
  }
  return v7;
}

- (BOOL)rendersAsynchronously
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1C8u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (double)asynchronousRenderPeriod
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x29u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (BOOL)preservesFlip
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1B5u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)resizesHostedContext
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1CFu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (unsigned)contextId
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x8Au, (const CGAffineTransform *)0xC, (id *)&v3);
  return v3;
}

- (BOOL)asynchronousOpaque
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x28u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)stopsHitTestTransformAccumulation
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x210u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (BOOL)inheritsSecurity
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x108u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (NSArray)asynchronousRenderTimes
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x2Au, (const CGAffineTransform *)3, v3);
  return (NSArray *)v3[0];
}

- (void)setContextId:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x8A, (const CGAffineTransform *)0xC, (double *)&v3);
}

- (CALayerHost)init
{
  CALayerHost *v2;
  CALayerHost **v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  objc_super v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CALayerHost;
  v2 = -[CALayer init](&v18, sel_init);
  if (v2)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_all_hosts_lock);
    v4 = _all_hosts;
    v3 = (CALayerHost **)qword_1ECDC48E0;
    v5 = (qword_1ECDC48E0 - (uint64_t)_all_hosts) >> 3;
    if (qword_1ECDC48F0 < (unint64_t)(v5 + 1))
    {
      v6 = qword_1ECDC48E8;
      v7 = (qword_1ECDC48F0 + 1) | ((unint64_t)(qword_1ECDC48F0 + 1) >> 1) | (((qword_1ECDC48F0 + 1) | ((unint64_t)(qword_1ECDC48F0 + 1) >> 1)) >> 2);
      v8 = v7 | (v7 >> 4) | ((v7 | (v7 >> 4)) >> 8);
      v9 = v8 | (v8 >> 16) | ((v8 | (v8 >> 16)) >> 32);
      if (v9 + 1 > v5 + 1)
        v10 = v9 + 1;
      else
        v10 = v5 + 1;
      v11 = (char *)malloc_type_malloc(8 * v10, 0x80040B8603338uLL);
      v12 = v11;
      v13 = (uint64_t *)_all_hosts;
      v14 = qword_1ECDC48E0;
      if (_all_hosts != (_UNKNOWN *)qword_1ECDC48E0)
      {
        v15 = v11;
        do
        {
          v16 = *v13++;
          *(_QWORD *)v15 = v16;
          v15 += 8;
        }
        while (v13 != (uint64_t *)v14);
      }
      if (v4 != (void *)v6)
        free(_all_hosts);
      v3 = (CALayerHost **)&v12[8 * v5];
      _all_hosts = v12;
      qword_1ECDC48E0 = (uint64_t)v3;
      qword_1ECDC48F0 = v10;
    }
    *v3 = v2;
    qword_1ECDC48E0 += 8;
    os_unfair_lock_unlock((os_unfair_lock_t)&_all_hosts_lock);
  }
  return v2;
}

- (void)setRendersAsynchronously:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1C8, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)_renderLayerDefinesProperty:(unsigned int)a3
{
  uint64_t v3;
  objc_super v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v7 = *MEMORY[0x1E0C80C00];
  if (CAAtomIndexInArray(12, (uint64_t)-[CALayerHost _renderLayerDefinesProperty:]::atoms, a3) != -1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CALayerHost;
  return -[CALayer _renderLayerDefinesProperty:](&v6, sel__renderLayerDefinesProperty_, v3);
}

- (void)setPreservesFlip:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1B5, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)transformsToScreenSpace
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x22Eu, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setTransformsToScreenSpace:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x22E, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)sequestered
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x1E9u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setSequestered:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x1E9, (const CGAffineTransform *)6, (double *)&v3);
}

- (BOOL)stopsSecureSuperlayersValidation
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x211u, (const CGAffineTransform *)6, (id *)&v3);
  return v3;
}

- (void)setStopsSecureSuperlayersValidation:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x211, (const CGAffineTransform *)6, (double *)&v3);
}

- (float)asynchronousRenderMaxAPL
{
  return self->_asynchronousRenderMaxAPL;
}

- (float)asynchronousRenderMaxAPLStrength
{
  return self->_asynchronousRenderMaxAPLStrength;
}

- (void)setAsynchronousRenderMaxAPLStrength:(float)a3
{
  self->_asynchronousRenderMaxAPLStrength = a3;
}

uint64_t __55__CALayerHost__copyRenderLayer_layerFlags_commitFlags___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)allLayerHosts
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&_all_hosts_lock);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_hosts_lock);
  return v2;
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
  v6.super_class = (Class)&OBJC_METACLASS___CALayerHost;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

@end
