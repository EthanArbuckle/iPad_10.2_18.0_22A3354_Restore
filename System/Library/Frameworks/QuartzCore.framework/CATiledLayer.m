@implementation CATiledLayer

+ (CFTimeInterval)fadeDuration
{
  return 0.25;
}

+ (id)defaultValueForKey:(id)a3
{
  int v5;
  id result;
  id *v7;
  int v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  if (v5 <= 335)
  {
    if (v5 == 79)
    {
      v8 = objc_msgSend(a1, "shouldDrawOnMainThread");
      v7 = (id *)MEMORY[0x1E0C9AE40];
      if (!v8)
        v7 = (id *)MEMORY[0x1E0C9AE50];
    }
    else
    {
      if (v5 != 185)
        goto LABEL_17;
      v7 = (id *)MEMORY[0x1E0C9AE50];
    }
    return *v7;
  }
  switch(v5)
  {
    case 546:
      result = (id)+[CATiledLayer defaultValueForKey:]::ts;
      if (!+[CATiledLayer defaultValueForKey:]::ts)
      {
        result = (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithSize:", 256.0, 256.0);
        +[CATiledLayer defaultValueForKey:]::ts = (uint64_t)result;
      }
      break;
    case 337:
      result = (id)+[CATiledLayer defaultValueForKey:]::zero;
      if (!+[CATiledLayer defaultValueForKey:]::zero)
      {
        result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
        +[CATiledLayer defaultValueForKey:]::zero = (uint64_t)result;
      }
      break;
    case 336:
      result = (id)+[CATiledLayer defaultValueForKey:]::one;
      if (!+[CATiledLayer defaultValueForKey:]::one)
      {
        result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 1);
        +[CATiledLayer defaultValueForKey:]::one = (uint64_t)result;
      }
      return result;
    default:
LABEL_17:
      v9.receiver = a1;
      v9.super_class = (Class)&OBJC_METACLASS___CATiledLayer;
      return objc_msgSendSuper2(&v9, sel_defaultValueForKey_, a3);
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
  v6.super_class = (Class)&OBJC_METACLASS___CATiledLayer;
  return objc_msgSendSuper2(&v6, sel_CA_automaticallyNotifiesObservers_, a3);
}

- (void)didChangeValueForKey:(id)a3
{
  int v5;
  int v6;
  int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = CAInternAtom((const __CFString *)a3, 0);
  v6 = v5;
  if (v5 > 375)
  {
    if (v5 != 546 && v5 != 534)
    {
      if (v5 != 376)
        goto LABEL_5;
LABEL_12:
      v8 = *MEMORY[0x1E0C9D628];
      v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
      v13.receiver = self;
      v13.super_class = (Class)CATiledLayer;
      -[CALayer setNeedsDisplayInRect:](&v13, sel_setNeedsDisplayInRect_, v8, v9, v10, v11);
      -[CALayer setContentsChanged](self, "setContentsChanged");
      goto LABEL_14;
    }
LABEL_13:
    -[CALayer setNeedsDisplay](self, "setNeedsDisplay");
    goto LABEL_14;
  }
  if ((v5 - 336) < 2)
    goto LABEL_13;
  if (v5 == 185 || v5 == 218)
    goto LABEL_12;
LABEL_5:
  v7 = -[CATiledLayer didChangeValueForKey:]::contentsAreFlipped;
  if (!-[CATiledLayer didChangeValueForKey:]::contentsAreFlipped)
  {
    v7 = CAInternAtom(CFSTR("contentsAreFlipped"), 1);
    -[CATiledLayer didChangeValueForKey:]::contentsAreFlipped = v7;
  }
  if (v6 == v7)
    goto LABEL_13;
LABEL_14:
  v12.receiver = self;
  v12.super_class = (Class)CATiledLayer;
  -[CATiledLayer didChangeValueForKey:](&v12, sel_didChangeValueForKey_, a3);
}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("contents")) & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)CATiledLayer;
  return -[CALayer shouldArchiveValueForKey:](&v6, sel_shouldArchiveValueForKey_, a3);
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  CFTypeID v10;
  uint64_t v11;
  objc_super v12;
  uint64_t v13;
  uint64_t v14;
  CGRect v15;
  uint64_t v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v8 = -[CALayer contents](self, "contents");
  if (v8)
  {
    v9 = (uint64_t)v8;
    v10 = CFGetTypeID(v8);
    v11 = CAImageProviderGetTypeID::type;
    if (!CAImageProviderGetTypeID::type)
    {
      v11 = _CFRuntimeRegisterClass();
      CAImageProviderGetTypeID::type = v11;
    }
    if (v10 == v11)
    {
      v13 = 0;
      v14 = 0;
      if (convertRectToImageCoordinates(self, *(_DWORD *)(v9 + 220), *(_DWORD *)(v9 + 224), (uint64_t)&v15, (uint64_t)&v13))
      {
        CAImageProviderInvalidateLOD(v9, v13, HIDWORD(v13), v14, HIDWORD(v14), 0xFFFFFFFFLL, 0);
        -[CALayer setContentsChanged](self, "setContentsChanged");
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)CATiledLayer;
  -[CALayer setNeedsDisplayInRect:](&v12, sel_setNeedsDisplayInRect_, x, y, width, height);
}

- (void)setContents:(id)a3
{
  id v5;
  id v6;
  CFTypeID v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  CFTypeID v11;
  uint64_t v12;
  uint64_t v13;
  malloc_zone_t *malloc_zone;
  _QWORD *v15;
  void (*v16)(_DWORD *, uint64_t, unsigned int, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  CATiledLayer *v18;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = -[CALayer contents](self, "contents");
  v6 = v5;
  if (v5 && v5 != a3)
  {
    v7 = CFGetTypeID(v5);
    v8 = CAImageProviderGetTypeID::type;
    if (!CAImageProviderGetTypeID::type)
    {
      v8 = _CFRuntimeRegisterClass();
      CAImageProviderGetTypeID::type = v8;
    }
    if (v7 == v8)
    {
      CAImageProviderSetCallback((uint64_t)v6, 0, 0);
      CAImageProviderRemoveLayer((uint64_t)v6, (uint64_t)self);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)CATiledLayer;
  -[CALayer setContents:](&v19, sel_setContents_, a3);
  v9 = -[CALayer contents](self, "contents");
  if (v9)
  {
    v10 = v9;
    v11 = CFGetTypeID(v9);
    v12 = CAImageProviderGetTypeID::type;
    if (!CAImageProviderGetTypeID::type)
    {
      v12 = _CFRuntimeRegisterClass();
      CAImageProviderGetTypeID::type = v12;
    }
    if (v11 == v12)
    {
      if (v6 != a3)
      {
        os_unfair_lock_lock(v10 + 4);
        v13 = *(_QWORD *)&v10[8]._os_unfair_lock_opaque;
        malloc_zone = (malloc_zone_t *)get_malloc_zone();
        v15 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
        *v15 = self;
        v15[1] = v13;
        *(_QWORD *)&v10[8]._os_unfair_lock_opaque = v15;
        os_unfair_lock_unlock(v10 + 4);
      }
      if (-[CATiledLayer isDrawingEnabled](self, "isDrawingEnabled"))
      {
        v16 = tiled_layer_render;
        v17 = (uint64_t)v10;
        v18 = self;
      }
      else
      {
        v17 = (uint64_t)v10;
        v16 = 0;
        v18 = 0;
      }
      CAImageProviderSetCallback(v17, (uint64_t)v16, (uint64_t)v18);
    }
  }
}

- (void)invalidateContents
{
  -[CATiledLayer setContents:](self, "setContents:", 0);
}

- (void)_dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CATiledLayerDestroy(self);
  v3.receiver = self;
  v3.super_class = (Class)CATiledLayer;
  -[CALayer _dealloc](&v3, sel__dealloc);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CATiledLayerDestroy(self);
  v3.receiver = self;
  v3.super_class = (Class)CATiledLayer;
  -[CALayer dealloc](&v3, sel_dealloc);
}

- (void)_display
{
  int v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;
  BOOL v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  CFTypeID v31;
  uint64_t v32;
  BOOL v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  CFArrayRef cfarray;
  const void *v40;

  v3 = -[CATiledLayer levelsOfDetail](self, "levelsOfDetail");
  v4 = -[CATiledLayer levelsOfDetailBias](self, "levelsOfDetailBias");
  -[CALayer bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  -[CALayer contentsScale](self, "contentsScale");
  v10 = v6 * v9;
  v11 = v8 * v9;
  -[CATiledLayer tileSize](self, "tileSize");
  v14 = v10;
  v15 = v11;
  if (v12 > 3072.0)
    v12 = 3072.0;
  if (v12 >= 16.0)
    v16 = v12;
  else
    v16 = 16.0;
  if (v13 <= 3072.0)
    v17 = v13;
  else
    v17 = 3072.0;
  if (v17 >= 16.0)
    v18 = v17;
  else
    v18 = 16.0;
  if (-[CALayer isOpaque](self, "isOpaque"))
    v19 = 5;
  else
    v19 = 4;
  if (-[CALayer canDrawConcurrently](self, "canDrawConcurrently"))
    v20 = v19;
  else
    v20 = v19 | 2;
  if (v14 >= v15)
    v21 = v15;
  else
    v21 = v14;
  v22 = 1;
  if (v21 >= 2)
  {
    do
    {
      ++v22;
      v23 = v21 > 3;
      v21 >>= 1;
    }
    while (v23);
  }
  if (v3 - v4 <= v22)
    v24 = v3;
  else
    v24 = v22 + v4;
  +[CATransaction lock](CATransaction, "lock");
  v25 = -[CALayer contents](self, "contents");
  if (!v25)
    goto LABEL_37;
  v26 = (uint64_t)v25;
  v27 = v15;
  v28 = v14;
  v29 = v4;
  v30 = v24;
  v31 = CFGetTypeID(v25);
  v32 = CAImageProviderGetTypeID::type;
  if (!CAImageProviderGetTypeID::type)
  {
    v32 = _CFRuntimeRegisterClass();
    CAImageProviderGetTypeID::type = v32;
  }
  v33 = v31 == v32;
  v24 = v30;
  v4 = v29;
  v14 = v28;
  v15 = v27;
  if (v33)
  {
    CFRetain((CFTypeRef)v26);
    +[CATransaction unlock](CATransaction, "unlock");
    if (*(_DWORD *)(v26 + 236) == v24
      && *(_DWORD *)(v26 + 240) == v4
      && *(_DWORD *)(v26 + 228) == v16
      && *(_DWORD *)(v26 + 232) == v18
      && *(_DWORD *)(v26 + 216) == v20)
    {
      goto LABEL_40;
    }
    CFRelease((CFTypeRef)v26);
  }
  else
  {
LABEL_37:
    +[CATransaction unlock](CATransaction, "unlock");
  }
  objc_msgSend((id)objc_opt_class(), "fadeDuration");
  v35 = CAImageProviderCreate(v14, v15, v16, v18, v24, v4, v20, v34);
  if (!v35)
  {
    -[CATiledLayer setContents:](self, "setContents:", 0);
    return;
  }
  v26 = v35;
  *(_DWORD *)(v35 + 248) = objc_msgSend((id)objc_opt_class(), "prefetchedTiles");
LABEL_40:
  CAImageProviderSetImageSize(v26, v14, v15);
  CAImageProviderSetFillColor(v26, -[CATiledLayer fillColor](self, "fillColor"));
  -[CATiledLayer maximumTileScale](self, "maximumTileScale");
  v38 = trunc(v37) + 0.5;
  if (*(_DWORD *)(v26 + 264) != (int)v38)
  {
    *(_DWORD *)(v26 + 264) = (int)v38;
    if (*(_DWORD *)(v26 + 24))
    {
      cfarray = create_cfarray(2, v36, (int)v38, 0);
      CA::Transaction::add_command((CA::Transaction *)0x12, *(_DWORD *)(v26 + 24), *(_QWORD *)(v26 + 56), cfarray, v40);
      CFRelease(cfarray);
    }
  }
  -[CATiledLayer setContents:](self, "setContents:", v26);
  CFRelease((CFTypeRef)v26);
}

- (BOOL)_canDisplayConcurrently
{
  return 0;
}

- (void)_colorSpaceDidChange
{
  id v3;
  uint64_t v4;
  CFTypeID v5;
  uint64_t v6;

  +[CATransaction lock](CATransaction, "lock");
  v3 = -[CALayer contents](self, "contents");
  if (v3)
  {
    v4 = (uint64_t)v3;
    v5 = CFGetTypeID(v3);
    v6 = CAImageProviderGetTypeID::type;
    if (!CAImageProviderGetTypeID::type)
    {
      v6 = _CFRuntimeRegisterClass();
      CAImageProviderGetTypeID::type = v6;
    }
    if (v5 == v6)
      CAImageProviderInvalidateLOD(v4, 0, 0, *(unsigned int *)(v4 + 220), *(unsigned int *)(v4 + 224), 0xFFFFFFFFLL, 0);
  }
  +[CATransaction unlock](CATransaction, "unlock");
}

- (size_t)levelsOfDetail
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x150u, (const CGAffineTransform *)0xE, v3);
  return (size_t)v3[0];
}

- (void)setLevelsOfDetail:(size_t)levelsOfDetail
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = levelsOfDetail;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x150, (const CGAffineTransform *)0xE, v3);
}

- (size_t)levelsOfDetailBias
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x151u, (const CGAffineTransform *)0xE, v3);
  return (size_t)v3[0];
}

- (void)setLevelsOfDetailBias:(size_t)levelsOfDetailBias
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = levelsOfDetailBias;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x151, (const CGAffineTransform *)0xE, v3);
}

- (CGSize)tileSize
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
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x222u, (const CGAffineTransform *)0x14, (id *)&v4);
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTileSize:(CGSize)tileSize
{
  CGSize v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = tileSize;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x222, (const CGAffineTransform *)0x14, &v3.width);
}

- (void)setNeedsDisplayInRect:(CGRect)a3 levelOfDetail:(int)a4 options:(id)a5
{
  uint64_t v6;
  double height;
  double width;
  double y;
  double x;
  id v12;
  uint64_t v13;
  CFTypeID v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  CGRect v21;
  uint64_t v22;

  v6 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v12 = -[CALayer contents](self, "contents");
  if (v12)
  {
    v13 = (uint64_t)v12;
    v14 = CFGetTypeID(v12);
    v15 = CAImageProviderGetTypeID::type;
    if (!CAImageProviderGetTypeID::type)
    {
      v15 = _CFRuntimeRegisterClass();
      CAImageProviderGetTypeID::type = v15;
    }
    if (v14 == v15)
    {
      v19 = 0;
      v20 = 0;
      if (convertRectToImageCoordinates(self, *(_DWORD *)(v13 + 220), *(_DWORD *)(v13 + 224), (uint64_t)&v21, (uint64_t)&v19))
      {
        v16 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("onlyIfNull")), "BOOLValue");
        if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("removeImmediately")), "BOOLValue"))
          v17 = v16 | 2;
        else
          v17 = v16;
        CAImageProviderInvalidateLOD(v13, v19, HIDWORD(v19), v20, HIDWORD(v20), v6, v17);
        -[CALayer setContentsChanged](self, "setContentsChanged");
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CATiledLayer;
  -[CALayer setNeedsDisplayInRect:](&v18, sel_setNeedsDisplayInRect_, x, y, width, height);
}

- (void)setNeedsDisplayInRect:(CGRect)a3 levelOfDetail:(int)a4
{
  -[CATiledLayer setNeedsDisplayInRect:levelOfDetail:options:](self, "setNeedsDisplayInRect:levelOfDetail:options:", *(_QWORD *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)canDrawRect:(CGRect)a3 levelOfDetail:(int)a4
{
  uint64_t v4;
  double height;
  double width;
  double y;
  double x;
  id v10;
  char v11;

  v4 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[CATransaction lock](CATransaction, "lock");
  v10 = -[CALayer delegate](self, "delegate");
  +[CATransaction unlock](CATransaction, "unlock");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = objc_msgSend(v10, "tiledLayer:canDrawRect:levelOfDetail:", self, v4, x, y, width, height);
  else
    v11 = 1;

  return v11;
}

- (void)displayInRect:(CGRect)a3 levelOfDetail:(int)a4 options:(id)a5
{
  unsigned int *v8;
  CFTypeID v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  CGRect v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  +[CATransaction begin](CATransaction, "begin");
  -[CATiledLayer _display](self, "_display");
  +[CATransaction lock](CATransaction, "lock");
  v8 = (unsigned int *)-[CALayer contents](self, "contents");
  +[CATransaction unlock](CATransaction, "unlock");
  if (v8)
  {
    v9 = CFGetTypeID(v8);
    v10 = CAImageProviderGetTypeID::type;
    if (!CAImageProviderGetTypeID::type)
    {
      v10 = _CFRuntimeRegisterClass();
      CAImageProviderGetTypeID::type = v10;
    }
    if (v9 == v10)
    {
      v13 = 0;
      v14 = 0;
      if (convertRectToImageCoordinates(self, v8[55], v8[56], (uint64_t)&v15, (uint64_t)&v13))
      {
        if (a5)
        {
          v11 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("uncollectable")), "BOOLValue");
          if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("disableFade")), "BOOLValue"))
            v12 = v11 | 4;
          else
            v12 = v11;
          if (v12)
            +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"), CFSTR("CATiledLayerFlags"));
        }
        CAImageProviderDraw((uint64_t)v8, v13, SHIDWORD(v13), v14, SHIDWORD(v14), a4);
      }
    }
  }

  +[CATransaction commit](CATransaction, "commit");
}

- (CGColor)fillColor
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xDAu, (const CGAffineTransform *)2, v3);
  return (CGColor *)v3[0];
}

- (void)setFillColor:(CGColor *)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xDA, (const CGAffineTransform *)2, v3);
}

- (double)maximumTileScale
{
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0x178u, (const CGAffineTransform *)0x12, v3);
  return *(double *)v3;
}

- (void)setMaximumTileScale:(double)a3
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0x178, (const CGAffineTransform *)0x12, v3);
}

- (BOOL)isDrawingEnabled
{
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  CA::Layer::getter((CA::Transaction *)self->super._attr.layer, 0xB9u, (const CGAffineTransform *)7, (id *)&v3);
  return v3 != 0;
}

- (void)setDrawingEnabled:(BOOL)a3
{
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CA::Layer::setter((CA::Transaction *)self->super._attr.layer, (const void *)0xB9, (const CGAffineTransform *)7, (double *)&v3);
}

+ (BOOL)shouldDrawOnMainThread
{
  return 0;
}

+ (unsigned)prefetchedTiles
{
  return 0;
}

@end
