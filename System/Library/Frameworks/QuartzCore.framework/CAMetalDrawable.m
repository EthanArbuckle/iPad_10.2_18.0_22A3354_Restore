@implementation CAMetalDrawable

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layer);
}

- (_CAMetalDrawablePrivate)priv
{
  return self->_priv;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)setPresentScheduledInsertSeedValid:(BOOL)a3
{
  self->_presentScheduledInsertSeedValid = a3;
}

- (void)setInsertSeed:(unsigned int)a3
{
  self->_insertSeed = a3;
}

- (CATimingFramePacingLatency)preferredLatency
{
  double latency;
  double frame_duration;
  CATimingFramePacingLatency result;

  latency = self->_preferredLatency.latency;
  frame_duration = self->_preferredLatency.frame_duration;
  result.frame_duration = frame_duration;
  result.latency = latency;
  return result;
}

- (BOOL)needsLowLatency
{
  return self->_needsLowLatency;
}

- (CGRect)dirtyRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_dirtyRect.origin.x;
  y = self->_dirtyRect.origin.y;
  width = self->_dirtyRect.size.width;
  height = self->_dirtyRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentScheduledInsertSeed:(unsigned int)a3
{
  self->_presentScheduledInsertSeed = a3;
}

- (void)didScheduledPresent
{
  NSMutableArray *presentScheduledHandlers;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void (**v8)(_QWORD, _QWORD);
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  presentScheduledHandlers = self->_presentScheduledHandlers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](presentScheduledHandlers, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(presentScheduledHandlers);
        v8 = *(void (***)(_QWORD, _QWORD))(*((_QWORD *)&v10 + 1) + 8 * i);
        ((void (**)(_QWORD, CAMetalDrawable *))v8)[2](v8, self);
        _Block_release(v8);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](presentScheduledHandlers, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_presentScheduledHandlers, "removeAllObjects");
}

- (unsigned)presentScheduledInsertSeed
{
  return self->_presentScheduledInsertSeed;
}

- (id)cachedTexture
{
  return self->_cachedTexture;
}

- (BOOL)presentScheduledInsertSeedValid
{
  return self->_presentScheduledInsertSeedValid;
}

- (unsigned)updateSeed
{
  return self->_updateSeed;
}

- (double)timePresentCalled
{
  return self->_timePresentCalled;
}

- (double)targetTimestamp
{
  return self->_targetTimestamp;
}

- (BOOL)didComposite
{
  return self->_didComposite;
}

- (double)targetSamplingTimestamp
{
  return self->_targetSamplingTimestamp;
}

- (IOSurfaceSharedEvent)sharedEvent
{
  return self->_sharedEvent;
}

- (void)releasePrivateReferences:(void *)a3
{
  os_unfair_lock_s *v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;

  self->_priv = 0;
  if (!a3)
    __assert_rtn("-[CAMetalDrawable releasePrivateReferences:]", "CAMetalLayer.mm", 2542, "priv");
  v5 = (os_unfair_lock_s *)((char *)a3 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 52);
  if (!-[CAMetalDrawable status](self, "status") && -[NSMutableArray count](self->_presentedHandlers, "count"))
  {
    -[CAMetalDrawable setStatus:](self, "setStatus:", 3);
    -[CAMetalDrawable didPresentAtTime:](self, "didPresentAtTime:", 0.0);
  }
  os_unfair_lock_unlock(v5);
  v7 = (unsigned int *)((char *)a3 + 140);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  layer_private_release((_CAMetalLayerPrivate *)a3, v6);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)didPresentAtTime:(double)a3
{
  NSMutableArray *presentedHandlers;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void (**v9)(_QWORD, _QWORD);
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  presentedHandlers = self->_presentedHandlers;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](presentedHandlers, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(presentedHandlers);
        v9 = *(void (***)(_QWORD, _QWORD))(*((_QWORD *)&v11 + 1) + 8 * i);
        ((void (**)(_QWORD, CAMetalDrawable *))v9)[2](v9, self);
        _Block_release(v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](presentedHandlers, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  -[NSMutableArray removeAllObjects](self->_presentedHandlers, "removeAllObjects");
}

- (void)setUpdateSeed:(unsigned int)a3
{
  self->_updateSeed = a3;
}

- (void)setDidComposite:(BOOL)a3
{
  self->_didComposite = a3;
}

- (unint64_t)drawableID
{
  return self->_drawableID;
}

- (double)timeAcquired
{
  return self->_timeAcquired;
}

- (double)targetPresentationTimestamp
{
  return self->_targetPresentationTimestamp;
}

- (unsigned)surfaceID
{
  return self->_surfaceID;
}

- (void)setPresentedTime:(double)a3
{
  self->_presentedTime = a3;
}

- (float)clientPreferredLatency
{
  return self->_clientPreferredLatency;
}

- (MTLTexture)texture
{
  if (!self->_priv && -[CAMetalDrawable texture]::warn_once != -1)
    dispatch_once(&-[CAMetalDrawable texture]::warn_once, &__block_literal_global_8630);
  return self->_cachedTexture;
}

- (void)addPresentedHandler:(id)a3
{
  _CAMetalDrawablePrivate *priv;
  _CAMetalLayerPrivate *var9;
  void *v6;
  os_unfair_lock_s *v7;

  priv = self->_priv;
  if (priv && (var9 = priv->var9) != 0)
  {
    v6 = _Block_copy(a3);
    v7 = (os_unfair_lock_s *)((char *)var9 + 208);
    os_unfair_lock_lock(v7);
    -[NSMutableArray addObject:](self->_presentedHandlers, "addObject:", v6);
    os_unfair_lock_unlock(v7);
  }
  else
  {
    NSLog(CFSTR("addPresentedHandler cannot be called after drawable has been presented"), a2, a3);
  }
}

- (void)dealloc
{
  _CAMetalDrawablePrivate *priv;
  unsigned int *v4;
  unsigned int v5;
  _CAMetalDrawablePrivate *v6;
  _CAMetalLayerPrivate *var9;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  malloc_zone_t *malloc_zone;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {
    v4 = (unsigned int *)((char *)priv->var9 + 140);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    v6 = self->_priv;
    var9 = v6->var9;
    os_unfair_lock_lock((os_unfair_lock_t)var9 + 2);
    do
    {
      v8 = __ldaxr((unsigned int *)v6);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, (unsigned int *)v6));
    if (v9)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)var9 + 2);
    }
    else
    {
      v10 = *((_QWORD *)var9 + 7);
      malloc_zone = (malloc_zone_t *)get_malloc_zone();
      v12 = malloc_type_zone_malloc(malloc_zone, 0x10uLL, 0x8BB15036uLL);
      *v12 = v6;
      v12[1] = v10;
      *((_QWORD *)var9 + 7) = v12;
      os_unfair_lock_unlock((os_unfair_lock_t)var9 + 2);
      layer_collectable_signal(0, var9);
    }
    layer_private_release(var9, v13);
  }
  if (!-[CAMetalDrawable didFinish](self, "didFinish") && MEMORY[0x1E0D227C8])
  {
    -[CAMetalDrawable layer](self, "layer");
    -[CAMetalDrawable drawableID](self, "drawableID");
    v14 = mach_absolute_time();
    CATimeWithHostTime(v14);
    -[CAMetalDrawable hasExplicitDeadlines](self, "hasExplicitDeadlines");
    FPDrawableLifetimeMarkFinished();
  }

  if (-[NSMutableArray count](self->_presentedHandlers, "count"))
  {
    -[CAMetalDrawable setStatus:](self, "setStatus:", 3);
    -[CAMetalDrawable didPresentAtTime:](self, "didPresentAtTime:", 0.0);
  }

  self->_presentedHandlers = 0;
  if (-[NSMutableArray count](self->_presentScheduledHandlers, "count"))
    -[CAMetalDrawable didScheduledPresent](self, "didScheduledPresent");

  self->_presentScheduledHandlers = 0;
  objc_storeWeak((id *)&self->_layer, 0);

  self->_priv = (_CAMetalDrawablePrivate *)0x5555555555555555;
  self->_cachedTexture = 0;
  v15.receiver = self;
  v15.super_class = (Class)CAMetalDrawable;
  -[CAMetalDrawable dealloc](&v15, sel_dealloc);
}

- (void)present
{
  _CAMetalDrawablePrivate *priv;
  _CAMetalLayerPrivate *var9;
  __int16 v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  double var8;
  double v11;
  unint64_t v12;
  uint64_t *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  os_signpost_id_t v19;
  IOSurfaceID ID;
  const char *v21;
  IOSurfaceID v22;
  unsigned int v23;
  BOOL v24;
  unsigned int v25;
  double v26;
  double timePresentCalled;
  _CAMetalLayerPrivate *v28;
  CAMetalDrawable *v29;
  uint64_t v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {
    var9 = priv->var9;
    v5 = *((_WORD *)var9 + 144);
    if ((v5 & 1) != 0)
    {
      LOWORD(v6) = 0;
    }
    else if ((v5 & 0x20) == 0 || (v6 = *((_QWORD *)var9 + 4)) != 0)
    {
      LOWORD(v6) = ~(2 * v5) & 0x1000;
    }
    *((_WORD *)var9 + 144) = v6 | v5 & 0xEFFF;
    IOSurfaceGetID(priv->var10);
    kdebug_trace();
    if (CADeviceSupportsAPT::once != -1)
      dispatch_once(&CADeviceSupportsAPT::once, &__block_literal_global_37);
    v7 = dbl_18474E450[CADeviceSupportsAPT::supports_apt == 0];
    v8 = mach_absolute_time();
    v9 = CATimeWithHostTime(v8);
    self->_timePresentCalled = v9;
    var8 = priv->var8;
    v11 = v9 - var8;
    v30 = 0;
    v31[0] = 0;
    mach_get_times();
    v12 = CAHostTimeWithTime(var8);
    if (CAMetalLayerLog(void)::onceToken != -1)
      dispatch_once(&CAMetalLayerLog(void)::onceToken, &__block_literal_global_456);
    if (v11 >= v7)
    {
      if (CAMetalLayerStallLog(void)::onceToken[0] != -1)
        dispatch_once(CAMetalLayerStallLog(void)::onceToken, &__block_literal_global_459);
      v13 = &CAMetalLayerStallLog(void)::log;
    }
    else
    {
      v13 = &CAMetalLayerLog(void)::log;
    }
    v14 = *v13;
    v15 = *((_QWORD *)var9 + 2);
    if (v15)
    {
      v16 = *(_QWORD *)(v15 + 48);
      if (v16)
        v16 = *(_QWORD *)(v16 + 24);
    }
    else
    {
      v16 = 0;
    }
    v17 = v12;
    if ((*((_WORD *)var9 + 144) & 8) != 0
      && (v18 = *(_QWORD *)(v15 + 48)) != 0
      && *(_DWORD *)(*(_QWORD *)(v18 + 24) + 32))
    {
      v19 = *(unsigned int *)(v16 + 88);
      if (!(_DWORD)v19 || !os_signpost_enabled(v14))
        goto LABEL_32;
      ID = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240448;
      HIDWORD(v30) = ID;
      LOWORD(v31[0]) = 2050;
      *(_QWORD *)((char *)v31 + 2) = v17;
      v21 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x visible=1 beginTime=%{public, signpost.description:begin_time}llu";
    }
    else
    {
      v19 = *(unsigned int *)(v16 + 88);
      if (!(_DWORD)v19 || !os_signpost_enabled(v14))
        goto LABEL_32;
      v22 = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240448;
      HIDWORD(v30) = v22;
      LOWORD(v31[0]) = 2050;
      *(_QWORD *)((char *)v31 + 2) = v17;
      v21 = "ID is queue ID. visible=0 surfaceID=%{public, name=surfaceID}#x beginTime=%{public, signpost.description:begin_time}llu";
    }
    _os_signpost_emit_with_name_impl(&dword_184457000, v14, OS_SIGNPOST_EVENT, v19, "ClientDrawable", v21, (uint8_t *)&v30, 0x12u);
LABEL_32:
    if (CADeviceIsAppleBundle::once[0] != -1)
      dispatch_once(CADeviceIsAppleBundle::once, &__block_literal_global_254_9854);
    if (CADeviceIsAppleBundle::apple_bundle || (*((_WORD *)var9 + 144) & 0x20) != 0)
      goto LABEL_46;
    if (CADeviceSupportsAPT::once != -1)
      dispatch_once(&CADeviceSupportsAPT::once, &__block_literal_global_37);
    if (CADeviceSupportsAPT::supports_apt && !CADeviceDisableMinimumFrameDuration())
      goto LABEL_61;
    if (CAHighFrameRateRestrictionEnabled(void)::once != -1)
      dispatch_once(&CAHighFrameRateRestrictionEnabled(void)::once, &__block_literal_global_4_14859);
    if (!CAHighFrameRateRestrictionEnabled(void)::enabled)
      goto LABEL_46;
    if (CADeviceDisableMinimumFrameDurationOnPhone::once != -1)
      dispatch_once(&CADeviceDisableMinimumFrameDurationOnPhone::once, &__block_literal_global_103);
    if (CADeviceDisableMinimumFrameDurationOnPhone::disabled)
    {
LABEL_46:
      v23 = *((unsigned __int16 *)var9 + 144);
      v24 = (v23 & 0x1000) != 0 && BYTE6(xmmword_1ECDC6AD0) == 0;
      if (v24)
        v25 = v23 & 1 | (16 * ((v23 >> 1) & 1)) | (v23 >> 9) & 4 | 2;
      else
        v25 = v23 & 1 | (16 * ((v23 >> 1) & 1)) | (v23 >> 9) & 4;
      v26 = 0.004;
      if (!v24)
        v26 = 0.0;
      timePresentCalled = self->_timePresentCalled;
      v28 = var9;
      v29 = self;
    }
    else
    {
LABEL_61:
      timePresentCalled = self->_timePresentCalled;
      v26 = 0.014;
      v28 = var9;
      v29 = self;
      v25 = 2;
    }
    layer_private_present(v28, v29, v26, timePresentCalled, v25);
    if (self->_priv
      && self->_timePresentCalled > self->_targetTimestamp + -0.001
      && *((_QWORD *)var9 + 4)
      && CAMetalLayerShouldDispatchLink(*((CAMetalLayer **)var9 + 3)))
    {
      +[CADisplayLink dispatchDeferredDisplayLink:](CADisplayLink, "dispatchDeferredDisplayLink:", *((_QWORD *)var9 + 4));
    }
    return;
  }
  if (warn_multiple_present(void)::once[0] != -1)
    dispatch_once(warn_multiple_present(void)::once, &__block_literal_global_453);
}

- (void)presentWithOptions:(id)a3
{
  int v5;
  _CAMetalDrawablePrivate *priv;
  _CAMetalDrawablePrivate *v7;

  if (!a3)
  {
LABEL_5:
    -[CAMetalDrawable present](self, "present");
    return;
  }
  v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("presentationMode")), "intValue");
  if (v5 == 2)
  {
    priv = self->_priv;
    if (priv && *((_QWORD *)priv->var9 + 4) && self->_hasExplicitDeadlines)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalDrawableInvalidOperation"), CFSTR("-presentAfterMinimumDuration should not be called when using CAMetalDisplayLink."));
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("presentTimeInterval")), "doubleValue");
    -[CAMetalDrawable presentAfterMinimumDuration:](self, "presentAfterMinimumDuration:");
  }
  else
  {
    if (v5 != 1)
    {
      if (v5)
        return;
      goto LABEL_5;
    }
    v7 = self->_priv;
    if (v7 && *((_QWORD *)v7->var9 + 4) && self->_hasExplicitDeadlines)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalDrawableInvalidOperation"), CFSTR("-presentAtTime should not be called when using CAMetalDisplayLink."));
    objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("presentTimeInterval")), "doubleValue");
    -[CAMetalDrawable presentAtTime:](self, "presentAtTime:");
  }
}

- (double)presentedTime
{
  return self->_presentedTime;
}

- (void)presentAfterMinimumDuration:(double)a3
{
  _CAMetalDrawablePrivate *priv;
  _CAMetalLayerPrivate *var9;
  __int16 v7;
  int v8;
  unsigned int v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  IOSurfaceID ID;
  const char *v23;
  IOSurfaceID v24;
  uint64_t v25;
  _BYTE v26[10];
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {
    var9 = priv->var9;
    if (*((_QWORD *)var9 + 4) && self->_hasExplicitDeadlines)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalDrawableInvalidOperation"), CFSTR("-presentAfterMinimumDuration should not be called when using CAMetalDisplayLink."));
      priv = self->_priv;
      var9 = priv->var9;
    }
    v7 = *((_WORD *)var9 + 144);
    if ((v7 & 1) != 0)
    {
      v8 = 0;
    }
    else if ((v7 & 0x20) != 0)
    {
      v8 = (*((_QWORD *)var9 + 4) != 0) << 12;
    }
    else
    {
      v8 = 4096;
    }
    *((_WORD *)var9 + 144) = v8 | v7 & 0xEFFF;
    if (a3 <= 0.0 && (!v8 || BYTE6(xmmword_1ECDC6AD0)))
    {
      v9 = v7 & 1;
      a3 = 0.0;
    }
    else
    {
      v9 = 2;
      if (v8 && !BYTE6(xmmword_1ECDC6AD0))
        a3 = fmax(a3, 0.004);
    }
    IOSurfaceGetID(priv->var10);
    kdebug_trace();
    if (CADeviceSupportsAPT::once != -1)
      dispatch_once(&CADeviceSupportsAPT::once, &__block_literal_global_37);
    v10 = dbl_18474E450[CADeviceSupportsAPT::supports_apt == 0];
    v11 = mach_absolute_time();
    v12 = CATimeWithHostTime(v11);
    self->_timePresentCalled = v12;
    v13 = v12 - priv->var8;
    -[CAMetalDrawable setMinimumPresentationDuration:](self, "setMinimumPresentationDuration:", a3);
    v25 = 0;
    *(_QWORD *)v26 = 0;
    mach_get_times();
    v14 = CAHostTimeWithTime(priv->var8);
    if (CAMetalLayerLog(void)::onceToken != -1)
      dispatch_once(&CAMetalLayerLog(void)::onceToken, &__block_literal_global_456);
    if (v13 >= v10)
    {
      if (CAMetalLayerStallLog(void)::onceToken[0] != -1)
        dispatch_once(CAMetalLayerStallLog(void)::onceToken, &__block_literal_global_459);
      v15 = &CAMetalLayerStallLog(void)::log;
    }
    else
    {
      v15 = &CAMetalLayerLog(void)::log;
    }
    v16 = *v15;
    v17 = *((_QWORD *)var9 + 2);
    if (v17)
    {
      v18 = *(_QWORD *)(v17 + 48);
      if (v18)
        v18 = *(_QWORD *)(v18 + 24);
    }
    else
    {
      v18 = 0;
    }
    v19 = v14;
    if ((*((_WORD *)var9 + 144) & 8) != 0
      && (v20 = *(_QWORD *)(v17 + 48)) != 0
      && *(_DWORD *)(*(_QWORD *)(v20 + 24) + 32))
    {
      v21 = *(unsigned int *)(v18 + 88);
      if (!(_DWORD)v21 || !os_signpost_enabled(v16))
        goto LABEL_42;
      ID = IOSurfaceGetID(priv->var10);
      LODWORD(v25) = 67240960;
      HIDWORD(v25) = ID;
      *(_WORD *)v26 = 2050;
      *(double *)&v26[2] = a3;
      v27 = 1026;
      v28 = v9;
      v29 = 2050;
      v30 = v19;
      v23 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x delay=%{public, name=delay}f flags=%{public, name=flag"
            "s}#x visible=1 beginTime=%{public, signpost.description:begin_time}llu";
    }
    else
    {
      v21 = *(unsigned int *)(v18 + 88);
      if (!(_DWORD)v21 || !os_signpost_enabled(v16))
        goto LABEL_42;
      v24 = IOSurfaceGetID(priv->var10);
      LODWORD(v25) = 67240960;
      HIDWORD(v25) = v24;
      *(_WORD *)v26 = 2050;
      *(double *)&v26[2] = a3;
      v27 = 1026;
      v28 = v9;
      v29 = 2050;
      v30 = v19;
      v23 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x delay=%{public, name=delay}f  flags=%{public, name=fla"
            "gs}#x visible=0 beginTime=%{public, signpost.description:begin_time}llu";
    }
    _os_signpost_emit_with_name_impl(&dword_184457000, v16, OS_SIGNPOST_EVENT, v21, "ClientDrawable", v23, (uint8_t *)&v25, 0x22u);
LABEL_42:
    layer_private_present(var9, self, a3, self->_timePresentCalled, v9);
    return;
  }
  if (warn_multiple_present(void)::once[0] != -1)
    dispatch_once(warn_multiple_present(void)::once, &__block_literal_global_453);
}

- (BOOL)hasPresentedHandlers
{
  CAMetalDrawable *v2;
  os_unfair_lock_s *v3;

  v2 = self;
  v3 = (os_unfair_lock_s *)((char *)self->_priv->var9 + 208);
  os_unfair_lock_lock(v3);
  LOBYTE(v2) = -[NSMutableArray count](v2->_presentedHandlers, "count") != 0;
  os_unfair_lock_unlock(v3);
  return (char)v2;
}

- (void)addPresentScheduledHandler:(id)a3
{
  _CAMetalDrawablePrivate *priv;
  _CAMetalLayerPrivate *var9;
  dispatch_time_t v7;
  unsigned int v8;
  NSObject *v9;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv && (var9 = priv->var9) != 0 && (*((_WORD *)var9 + 144) & 0x400) != 0)
  {
    os_unfair_lock_lock((os_unfair_lock_t)var9 + 2);
    if (*((_QWORD *)var9 + 9))
    {
      os_unfair_lock_lock((os_unfair_lock_t)var9 + 46);
      -[NSMutableArray addObject:](self->_presentScheduledHandlers, "addObject:", _Block_copy(a3));
      if ((objc_msgSend(*((id *)var9 + 24), "containsObject:", self) & 1) == 0)
      {
        objc_msgSend(*((id *)var9 + 24), "addObject:", self);
        v7 = dispatch_time(0, 1100000000);
        do
          v8 = __ldaxr((unsigned int *)var9);
        while (__stlxr(v8 + 1, (unsigned int *)var9));
        v9 = *((_QWORD *)var9 + 22);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __46__CAMetalDrawable_addPresentScheduledHandler___block_invoke;
        v10[3] = &__block_descriptor_40_e5_v8__0l;
        v10[4] = var9;
        dispatch_after(v7, v9, v10);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)var9 + 46);
    }
    else
    {
      (*((void (**)(id, CAMetalDrawable *))a3 + 2))(a3, self);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)var9 + 2);
  }
  else
  {
    (*((void (**)(id, CAMetalDrawable *))a3 + 2))(a3, self);
  }
}

- (CAMetalDrawable)initWithDrawablePrivate:(_CAMetalDrawablePrivate *)a3 layer:(id)a4 waitStart:(double)a5
{
  CAMetalDrawable *v7;
  CAMetalDrawable *v8;
  _CAMetalLayerPrivate *var9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  CGSize v13;
  unsigned int *v14;
  unsigned int v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CAMetalDrawable;
  v7 = -[CAMetalDrawable init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_layer, a4);

    v8->_priv = a3;
    v8->_cachedTexture = 0;
    var9 = a3->var9;
    do
      v10 = __ldaxr((unsigned int *)var9);
    while (__stlxr(v10 + 1, (unsigned int *)var9));
    v8->_cachedTexture = (MTLTexture *)a3->var11;
    v11 = (unsigned int *)((char *)var9 + 140);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
    v13 = *(CGSize *)(MEMORY[0x1E0C9D5E0] + 16);
    v8->_dirtyRect.origin = (CGPoint)*MEMORY[0x1E0C9D5E0];
    v8->_dirtyRect.size = v13;
    v14 = (unsigned int *)((char *)a3->var9 + 156);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 + 1, v14));
    v8->_drawableID = v15;
    if (present_on_finish_enabled(*(_CAImageQueue **)(*((_QWORD *)var9 + 2) + 48)))
      v8->_sharedEvent = (IOSurfaceSharedEvent *)objc_alloc_init(MEMORY[0x1E0CBBEB8]);
    v8->_status = 0;
    v8->_presentedHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_updateSeed = 0;
    v8->_didComposite = 0;
    v8->_presentScheduledHandlers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8->_surfaceID = IOSurfaceGetID(a3->var10);
    v8->_timeAcquired = a3->var8;
    if (MEMORY[0x1E0D227D0])
    {
      -[CAMetalDrawable layer](v8, "layer");
      -[CAMetalDrawable surfaceID](v8, "surfaceID");
      -[CAMetalDrawable drawableID](v8, "drawableID");
      -[CAMetalDrawable timeAcquired](v8, "timeAcquired");
      FPDrawableLifetimeMarkStarted();
    }
  }
  return v8;
}

- (void)presentAtTime:(double)a3
{
  _CAMetalDrawablePrivate *priv;
  _CAMetalLayerPrivate *var9;
  double v7;
  BOOL v8;
  double v9;
  __int16 v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  double v14;
  uint64_t v15;
  double v16;
  double var8;
  double v18;
  unint64_t v19;
  uint64_t *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  os_signpost_id_t v26;
  IOSurfaceID ID;
  const char *v28;
  IOSurfaceID v29;
  uint64_t v30;
  _BYTE v31[10];
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  priv = self->_priv;
  if (priv)
  {
    var9 = priv->var9;
    if (*((_QWORD *)var9 + 4) && self->_hasExplicitDeadlines)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("CAMetalDrawableInvalidOperation"), CFSTR("-presentAtTime should not be called when using CAMetalDisplayLink."));
      priv = self->_priv;
      var9 = priv->var9;
    }
    -[CAMetalDrawable targetPresentationTimestamp](self, "targetPresentationTimestamp");
    v8 = v7 < a3;
    v9 = a3;
    if (!v8)
      -[CAMetalDrawable targetPresentationTimestamp](self, "targetPresentationTimestamp", a3);
    -[CAMetalDrawable setTargetPresentationTimestamp:](self, "setTargetPresentationTimestamp:", v9);
    v10 = *((_WORD *)var9 + 144);
    if ((v10 & 1) != 0)
    {
      v11 = 0;
    }
    else if ((v10 & 0x20) != 0)
    {
      v11 = (*((_QWORD *)var9 + 4) != 0) << 12;
    }
    else
    {
      v11 = 4096;
    }
    *((_WORD *)var9 + 144) = v11 | v10 & 0xEFFF;
    if (BYTE6(xmmword_1ECDC6AD0))
      v12 = 1;
    else
      v12 = v11 == 0;
    if (v12)
      v13 = 0;
    else
      v13 = 10;
    IOSurfaceGetID(priv->var10);
    kdebug_trace();
    if (CADeviceSupportsAPT::once != -1)
      dispatch_once(&CADeviceSupportsAPT::once, &__block_literal_global_37);
    v14 = dbl_18474E450[CADeviceSupportsAPT::supports_apt == 0];
    v15 = mach_absolute_time();
    v16 = CATimeWithHostTime(v15);
    self->_timePresentCalled = v16;
    var8 = priv->var8;
    v18 = v16 - var8;
    v30 = 0;
    *(_QWORD *)v31 = 0;
    mach_get_times();
    v19 = CAHostTimeWithTime(var8);
    if (CAMetalLayerLog(void)::onceToken != -1)
      dispatch_once(&CAMetalLayerLog(void)::onceToken, &__block_literal_global_456);
    if (v18 >= v14)
    {
      if (CAMetalLayerStallLog(void)::onceToken[0] != -1)
        dispatch_once(CAMetalLayerStallLog(void)::onceToken, &__block_literal_global_459);
      v20 = &CAMetalLayerStallLog(void)::log;
    }
    else
    {
      v20 = &CAMetalLayerLog(void)::log;
    }
    v21 = *v20;
    v22 = *((_QWORD *)var9 + 2);
    if (v22)
    {
      v23 = *(_QWORD *)(v22 + 48);
      if (v23)
        v23 = *(_QWORD *)(v23 + 24);
    }
    else
    {
      v23 = 0;
    }
    v24 = v19;
    if ((*((_WORD *)var9 + 144) & 8) != 0
      && (v25 = *(_QWORD *)(v22 + 48)) != 0
      && *(_DWORD *)(*(_QWORD *)(v25 + 24) + 32))
    {
      v26 = *(unsigned int *)(v23 + 88);
      if (!(_DWORD)v26 || !os_signpost_enabled(v21))
        goto LABEL_43;
      ID = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240960;
      HIDWORD(v30) = ID;
      *(_WORD *)v31 = 2050;
      *(double *)&v31[2] = a3;
      v32 = 1026;
      v33 = v13;
      v34 = 2050;
      v35 = v24;
      v28 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x desiredTime=%{public, name=desiredTime}f flags=%{publi"
            "c, name=flags}#x visible=1 beginTime=%{public, signpost.description:begin_time}llu";
    }
    else
    {
      v26 = *(unsigned int *)(v23 + 88);
      if (!(_DWORD)v26 || !os_signpost_enabled(v21))
        goto LABEL_43;
      v29 = IOSurfaceGetID(priv->var10);
      LODWORD(v30) = 67240960;
      HIDWORD(v30) = v29;
      *(_WORD *)v31 = 2050;
      *(double *)&v31[2] = a3;
      v32 = 1026;
      v33 = v13;
      v34 = 2050;
      v35 = v24;
      v28 = "ID is queue ID. surfaceID=%{public, name=surfaceID}#x desiredTime=%{public, name=desiredTime}f flags=%{publi"
            "c, name=flags}#x visible=0 beginTime=%{public, signpost.description:begin_time}llu";
    }
    _os_signpost_emit_with_name_impl(&dword_184457000, v21, OS_SIGNPOST_EVENT, v26, "ClientDrawable", v28, (uint8_t *)&v30, 0x22u);
LABEL_43:
    layer_private_present(var9, self, a3, self->_timePresentCalled, v13);
    return;
  }
  if (warn_multiple_present(void)::once[0] != -1)
    dispatch_once(warn_multiple_present(void)::once, &__block_literal_global_453);
}

- (CAMetalLayer)layer
{
  return (CAMetalLayer *)objc_loadWeak((id *)&self->_layer);
}

- (id)newTextureWithResourceIndex:(unint64_t)a3
{
  _CAMetalDrawablePrivate *priv;

  priv = self->_priv;
  if (priv)
    return allocate_drawable_texture(priv->var12, priv->var10, priv->var1, priv->var2, priv->var4, a3, priv->var16, *((_BYTE *)priv + 113) & 1, (uint64_t)CFSTR("CAMetalLayer Replay Drawable"), priv->var7);
  NSLog(CFSTR("[CAMetalLayerDrawable newTextureWithResourceIndex:] should not be called after already presenting this drawable. Get a nextDrawable instead."), a2, a3);
  return 0;
}

- (void)estimateTargets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t phase;
  unint64_t v11;
  double v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_layer), "currentDisplay");
  if (v3)
  {
    v4 = objc_msgSend(v3, "timingsControl");
    if (v4)
    {
      v5 = v4;
      v15 = 0uLL;
      v16 = 0;
      CA::Display::DisplayTimingsControl::timing_reference((CA::Display::DisplayTimingsControl *)&v15, v4, 0);
      if ((*(_BYTE *)(v5 + 233) & 1) != 0)
        LODWORD(v6) = 2;
      else
        LODWORD(v6) = 1;
      if (v6 <= *(_DWORD *)(v5 + 56))
        LODWORD(v6) = *(_DWORD *)(v5 + 56);
      v7 = *(_DWORD *)(v5 + 88);
      if (v6 <= v7)
        v6 = v7;
      else
        v6 = v6;
      v8 = v16 * v6;
      v13 = v15;
      v14 = v16;
      v9 = mach_absolute_time();
      v17[0] = v8;
      phase = get_phase((unint64_t *)&v13, v9, v17);
      if (phase)
        v9 = v9 - phase + v17[0];
      v11 = (v8 << CA::Display::DisplayTimingsControl::server_triple_buffered((os_unfair_lock_s *)v5)) + v9;
      v12 = CATimeWithHostTime(v9);
      -[CAMetalDrawable setTargetTimestamp:](self, "setTargetTimestamp:", v12, v13, v14);
      -[CAMetalDrawable setTargetPresentationTimestamp:](self, "setTargetPresentationTimestamp:", CATimeWithHostTime(v11));
      -[CAMetalDrawable setHasExplicitDeadlines:](self, "setHasExplicitDeadlines:", 0);
    }
  }
}

- (void)setDirtyRect:(CGRect)a3
{
  self->_dirtyRect = a3;
}

- (void)setDrawableID:(unint64_t)a3
{
  self->_drawableID = a3;
}

- (void)setSharedEvent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (unsigned)insertSeed
{
  return self->_insertSeed;
}

- (void)setSurfaceID:(unsigned int)a3
{
  self->_surfaceID = a3;
}

- (void)setTimeAcquired:(double)a3
{
  self->_timeAcquired = a3;
}

- (void)setTimePresentCalled:(double)a3
{
  self->_timePresentCalled = a3;
}

- (void)setTargetTimestamp:(double)a3
{
  self->_targetTimestamp = a3;
}

- (void)setTargetSamplingTimestamp:(double)a3
{
  self->_targetSamplingTimestamp = a3;
}

- (void)setTargetPresentationTimestamp:(double)a3
{
  self->_targetPresentationTimestamp = a3;
}

- (double)presentDeadline
{
  return self->_presentDeadline;
}

- (void)setPresentDeadline:(double)a3
{
  self->_presentDeadline = a3;
}

- (BOOL)hasExplicitDeadlines
{
  return self->_hasExplicitDeadlines;
}

- (void)setHasExplicitDeadlines:(BOOL)a3
{
  self->_hasExplicitDeadlines = a3;
}

- (double)minimumPresentationDuration
{
  return self->_minimumPresentationDuration;
}

- (void)setMinimumPresentationDuration:(double)a3
{
  self->_minimumPresentationDuration = a3;
}

- (void)setPreferredLatency:(CATimingFramePacingLatency)a3
{
  self->_preferredLatency = a3;
}

- (void)setNeedsLowLatency:(BOOL)a3
{
  self->_needsLowLatency = a3;
}

- (void)setClientPreferredLatency:(float)a3
{
  self->_clientPreferredLatency = a3;
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

void __26__CAMetalDrawable_texture__block_invoke()
{
  NSLog(CFSTR("[CAMetalLayerDrawable texture] should not be called after already presenting this drawable. Get a nextDrawable instead."));
}

void __46__CAMetalDrawable_addPresentScheduledHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
  v3 = CAHostTimeWithTime(0.2) + v2;
  if (mach_absolute_time() > v3)
    layer_private_cleanup_callbacks(*(_CAMetalLayerPrivate **)(a1 + 32));
  layer_private_release(*(_CAMetalLayerPrivate **)(a1 + 32), v4);
}

@end
