@implementation CAMetalDisplayLink

- (id)_initWithMetalLinkItem:(void *)a3
{
  CAMetalDisplayLink *v4;
  CAMetalDisplayLink *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CAMetalDisplayLink;
  v4 = -[CAMetalDisplayLink init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
    *((_QWORD *)a3 + 32) = v4;
  }
  else if (a3)
  {
    (*(void (**)(void *))(*(_QWORD *)a3 + 8))(a3);
  }
  return v5;
}

- (CAMetalDisplayLink)initWithMetalLayer:(CAMetalLayer *)layer
{
  uint64_t v5;
  int v6;
  id **v7;
  id **v8;
  uint64_t v9;
  CFTypeRef v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v5 = *(_QWORD *)(*((_QWORD *)layer->_priv + 2) + 48);
  if (v5)
    v6 = *(_DWORD *)(*(_QWORD *)(v5 + 24) + 24);
  else
    v6 = 0;
  v7 = (id **)CADisplayLookupFromDisplayId(v6);
  if (v7)
  {
    v8 = v7;
    v9 = operator new();
    *(_QWORD *)CA::Display::DisplayLinkItem::DisplayLinkItem((CA::Display::DisplayLinkItem *)v9, v8[1], 0, 0) = &off_1E15998F8;
    v10 = CFRetain(layer);
    *(_QWORD *)(v9 + 320) = v10;
    *(_DWORD *)(v9 + 328) = 0x40000000;
    CAMetalLayerSetMetalLinkToken((uint64_t)v10, v9);
    os_unfair_lock_lock(&CA::Display::MetalLinkItem::_list_lock);
    v12 = CA::Display::MetalLinkItem::_list;
    v11 = (uint64_t *)qword_1EDD0FCD8;
    v13 = (qword_1EDD0FCD8 - (uint64_t)CA::Display::MetalLinkItem::_list) >> 3;
    if (qword_1EDD0FCE8 < (unint64_t)(v13 + 1))
    {
      v14 = qword_1EDD0FCE0;
      v15 = (qword_1EDD0FCE8 + 1) | ((unint64_t)(qword_1EDD0FCE8 + 1) >> 1) | (((qword_1EDD0FCE8 + 1) | ((unint64_t)(qword_1EDD0FCE8 + 1) >> 1)) >> 2);
      v16 = v15 | (v15 >> 4) | ((v15 | (v15 >> 4)) >> 8);
      v17 = v16 | (v16 >> 16) | ((v16 | (v16 >> 16)) >> 32);
      if (v17 + 1 > v13 + 1)
        v18 = v17 + 1;
      else
        v18 = v13 + 1;
      v19 = (char *)malloc_type_malloc(8 * v18, 0x2004093837F09uLL);
      v20 = v19;
      v21 = (uint64_t *)CA::Display::MetalLinkItem::_list;
      v22 = qword_1EDD0FCD8;
      if (CA::Display::MetalLinkItem::_list != (_UNKNOWN *)qword_1EDD0FCD8)
      {
        v23 = v19;
        do
        {
          v24 = *v21++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
        }
        while (v21 != (uint64_t *)v22);
      }
      if (v12 != (void *)v14)
        free(CA::Display::MetalLinkItem::_list);
      v11 = (uint64_t *)&v20[8 * v13];
      CA::Display::MetalLinkItem::_list = v20;
      qword_1EDD0FCD8 = (uint64_t)v11;
      qword_1EDD0FCE8 = v18;
    }
    *v11 = v9;
    qword_1EDD0FCD8 += 8;
    os_unfair_lock_unlock(&CA::Display::MetalLinkItem::_list_lock);
    return (CAMetalDisplayLink *)-[CAMetalDisplayLink _initWithMetalLinkItem:](self, "_initWithMetalLinkItem:", v9);
  }
  else
  {

    return 0;
  }
}

- (void)dealloc
{
  void *impl;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  impl = self->_impl;
  if (impl)
    (*(void (**)(void *, SEL))(*(_QWORD *)impl + 8))(impl, a2);
  v4.receiver = self;
  v4.super_class = (Class)CAMetalDisplayLink;
  -[CAMetalDisplayLink dealloc](&v4, sel_dealloc);
}

- (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode
{
  CA::Display::DisplayLinkItem::schedule((CA::Display::DisplayLinkItem *)self->_impl, -[NSRunLoop getCFRunLoop](runloop, "getCFRunLoop"), (const __CFString *)mode);
}

- (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode
{
  CA::Display::DisplayLinkItem::unschedule((CA::Display::DisplayLinkItem *)self->_impl, -[NSRunLoop getCFRunLoop](runloop, "getCFRunLoop"), (const __CFString *)mode);
}

- (void)invalidate
{
  (*(void (**)(void *))(*(_QWORD *)self->_impl + 16))(self->_impl);
}

- (void)setPreferredFrameLatency:(float)preferredFrameLatency
{
  if (preferredFrameLatency == 1.0 || preferredFrameLatency == 2.0)
    *((float *)self->_impl + 82) = preferredFrameLatency;
}

- (float)preferredFrameLatency
{
  return *((float *)self->_impl + 82);
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)preferredFrameRateRange
{
  float preferred;
  float maximum;
  float minimum;
  uint64_t v7;
  CAFrameRateRange v8;

  preferred = preferredFrameRateRange.preferred;
  maximum = preferredFrameRateRange.maximum;
  minimum = preferredFrameRateRange.minimum;
  if (!CAFrameRateRangeIsValid(preferredFrameRateRange.minimum, preferredFrameRateRange.maximum, preferredFrameRateRange.preferred))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid range (minimum: %.2f maximum: %.2f preferred: %.2f)"), minimum, maximum, preferred);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  v8.minimum = minimum;
  v8.maximum = maximum;
  v8.preferred = preferred;
  CA::Display::DisplayLinkItem::set_preferred_fps_range((CA::Display::DisplayLink **)self->_impl, v8, 1, 1);
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float *impl;
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  impl = (float *)self->_impl;
  v3 = impl[19];
  v4 = impl[20];
  v5 = impl[21];
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

- (void)setPaused:(BOOL)paused
{
  CA::Display::DisplayLinkItem::set_paused((CA::Display::DisplayLinkItem *)self->_impl, paused);
}

- (BOOL)isPaused
{
  return *((_BYTE *)self->_impl + 316) & 1;
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
