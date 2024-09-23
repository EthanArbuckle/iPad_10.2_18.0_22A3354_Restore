@implementation AVCaptionRenderer

- (AVCaptionRenderer)init
{
  AVCaptionRenderer *v2;
  AVCaptionRendererInternal *v3;
  AVCaptionRendererInternal *internal;
  CGSize v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVCaptionRenderer;
  v2 = -[AVCaptionRenderer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AVCaptionRendererInternal);
    v2->_internal = v3;
    if (!v3)
      goto LABEL_5;
    v2->_internal->_captions = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    internal = v2->_internal;
    v5 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    internal->_bounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    internal->_bounds.size = v5;
    v2->_internal->_sortedCaptions = 0;
    v2->_internal->_defaultStyles = 0;
    v2->_internal->_useFigCaptionClientByDefault = 1;
    v2->_internal->_useFigCaptionClientByDefault = 1;
    if (!v2->_internal->_useFigCaptionClientByDefault)
    {
      if (-[AVCaptionRenderer setupFigCDS](v2, "setupFigCDS"))
        return v2;
      goto LABEL_5;
    }
    if (!-[AVCaptionRenderer setupFigCaptionClient](v2, "setupFigCaptionClient"))
    {
LABEL_5:

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  AVCaptionRendererInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {
    if (internal->_useFigCaptionClientByDefault)
      -[AVCaptionRenderer teardownFigCaptionClient](self, "teardownFigCaptionClient");
    else
      -[AVCaptionRenderer teardownFigCDS](self, "teardownFigCDS");

    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptionRenderer;
  -[AVCaptionRenderer dealloc](&v4, sel_dealloc);
}

- (NSArray)captions
{
  return self->_internal->_captions;
}

- (void)setCaptions:(NSArray *)captions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *v9;
  AVCaptionRendererInternal *internal;
  NSArray *sortedCaptions;
  void *v12;

  if (!captions)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"captions != nil"), 0);
    objc_exception_throw(v12);
  }
  if (self->_internal->_captions != captions)
  {
    v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", captions, 1);

    self->_internal->_captions = v9;
    internal = self->_internal;
    sortedCaptions = internal->_sortedCaptions;
    if (sortedCaptions)
    {

      self->_internal->_sortedCaptions = 0;
      internal = self->_internal;
    }
    if (internal->_useFigCaptionClientByDefault)
    {
      -[AVCaptionRenderer teardownFigCaptionClient](self, "teardownFigCaptionClient");
      -[AVCaptionRenderer setupFigCaptionClient](self, "setupFigCaptionClient");
    }
    else
    {
      -[AVCaptionRenderer teardownFigCDS](self, "teardownFigCDS");
      -[AVCaptionRenderer setupFigCDS](self, "setupFigCDS");
    }
  }
}

- (CGRect)bounds
{
  AVCaptionRendererInternal *internal;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  internal = self->_internal;
  x = internal->_bounds.origin.x;
  y = internal->_bounds.origin.y;
  width = internal->_bounds.size.width;
  height = internal->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)bounds
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AVCaptionRendererInternal *internal;
  BOOL v9;
  BOOL v10;
  AVCaptionRendererInternal *v11;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  internal = self->_internal;
  v9 = bounds.origin.x == internal->_bounds.origin.x && bounds.origin.y == internal->_bounds.origin.y;
  if (!v9
    || (bounds.size.width == internal->_bounds.size.width
      ? (v10 = bounds.size.height == internal->_bounds.size.height)
      : (v10 = 0),
        !v10))
  {
    if (internal->_useFigCaptionClientByDefault)
    {
      if (FigCaptionClientSetBounds())
        return;
    }
    else if (MEMORY[0x194032C44](internal->_cdsSession, a2, bounds.origin.x, bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height))
    {
      return;
    }
    v11 = self->_internal;
    v11->_bounds.origin.x = x;
    v11->_bounds.origin.y = y;
    v11->_bounds.size.width = width;
    v11->_bounds.size.height = height;
  }
}

- (BOOL)synchronizeWithCurrentAccessibilityPreferencesWithCompletionHandler:(id)a3
{
  AVCaptionRendererInternal *internal;
  int v5;
  uint64_t v6;
  BOOL v7;

  internal = self->_internal;
  if (internal->_useFigCaptionClientByDefault)
  {
    if (!internal->_captionClient)
      goto LABEL_9;
    v5 = FigCaptionClientSynchronizeDefaults();
    if (!v5)
      goto LABEL_9;
LABEL_7:
    v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v5, 0);
    v7 = 0;
    if (!a3)
      return v7;
    goto LABEL_10;
  }
  if (internal->_cdsSession)
  {
    v5 = FigCDSSessionSynchronizeDefaults();
    if (v5)
      goto LABEL_7;
  }
LABEL_9:
  v6 = 0;
  v7 = 1;
  if (a3)
LABEL_10:
    (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
  return v7;
}

- (id)defaultStyles
{
  return self->_internal->_defaultStyles;
}

- (void)setDefaultStyles:(id)a3
{
  AVCaptionRendererInternal **p_internal;
  AVCaptionRendererInternal *internal;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return;
    internal = self->_internal;
    p_internal = &self->_internal;
    internal->_defaultStyles = (AVTextStyleRule *)a3;
    objc_msgSend(a3, "textMarkupAttributes");
  }
  else
  {
    p_internal = &self->_internal;
    self->_internal->_defaultStyles = 0;
  }
  if ((*p_internal)->_useFigCaptionClientByDefault)
    FigCaptionClientSetDefaultTextStyle();
  else
    FigCDSSessionSetDefaultTextStyle();
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, captions = %@>"), NSStringFromClass(v4), self, self->_internal->_captions);
}

- (NSArray)captionSceneChangesInRange:(CMTimeRange *)consideredTimeRange
{
  NSArray *captions;
  NSArray *v6;
  AVCaptionGrouper *v7;
  NSArray *sortedCaptions;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[5];
  __int128 v13;
  uint64_t v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  captions = self->_internal->_captions;
  v6 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  if (-[NSArray count](captions, "count"))
  {
    v7 = objc_alloc_init(AVCaptionGrouper);
    sortedCaptions = self->_internal->_sortedCaptions;
    if (!sortedCaptions)
    {
      sortedCaptions = -[NSArray sortedArrayUsingComparator:](captions, "sortedArrayUsingComparator:", &__block_literal_global_32);
      self->_internal->_sortedCaptions = sortedCaptions;
    }
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v10 = *(_OWORD *)&consideredTimeRange->start.epoch;
    v16 = *(_OWORD *)&consideredTimeRange->start.value;
    v17 = v10;
    v15[1] = 3221225472;
    v15[2] = __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_2;
    v15[3] = &unk_1E3034838;
    v18 = *(_OWORD *)&consideredTimeRange->duration.timescale;
    v15[4] = v7;
    -[NSArray enumerateObjectsUsingBlock:](sortedCaptions, "enumerateObjectsUsingBlock:", v15);
    v13 = *MEMORY[0x1E0CA2E30];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_3;
    v12[3] = &unk_1E3034950;
    v12[4] = v6;
    -[NSArray enumerateObjectsUsingBlock:](-[AVCaptionGrouper flushAddedCaptionsIntoGroupsUpToTime:](v7, "flushAddedCaptionsIntoGroupsUpToTime:", &v13), "enumerateObjectsUsingBlock:", v12);

  }
  return v6;
}

uint64_t __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int32_t v4;
  CMTime v6;
  CMTime time2;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CMTime time1;

  if (a2)
  {
    objc_msgSend(a2, "timeRange");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  *(_OWORD *)&time1.value = v8;
  time1.epoch = v9;
  if (a3)
    objc_msgSend(a3, "timeRange");
  else
    memset(&v6, 0, sizeof(v6));
  time2 = v6;
  v4 = CMTimeCompare(&time1, &time2);
  if (v4 < 0)
    return -1;
  else
    return v4 != 0;
}

uint64_t __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  __int128 v5;
  CMTimeRange v6;
  CMTime v7;
  CMTime time2;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a2)
    objc_msgSend(a2, "timeRange");
  *(_OWORD *)&v6.start.value = *(_OWORD *)(a1 + 40);
  v6.start.epoch = *(_QWORD *)(a1 + 56);
  *(_OWORD *)&time2.value = v9;
  time2.epoch = v10;
  result = CMTimeCompare(&v6.start, &time2);
  if ((int)result <= 0)
  {
    v5 = *(_OWORD *)(a1 + 56);
    *(_OWORD *)&v6.start.value = *(_OWORD *)(a1 + 40);
    *(_OWORD *)&v6.start.epoch = v5;
    *(_OWORD *)&v6.duration.timescale = *(_OWORD *)(a1 + 72);
    CMTimeRangeGetEnd(&v7, &v6);
    *(_OWORD *)&v6.start.value = v9;
    v6.start.epoch = v10;
    result = CMTimeCompare(&v6.start, &v7);
    if ((result & 0x80000000) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "addCaption:", a2);
  }
  return result;
}

void __48__AVCaptionRenderer_captionSceneChangesInRange___block_invoke_3(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  AVCaptionRendererScene *v14;
  AVCaptionRendererScene *v15;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "captions") && objc_msgSend((id)objc_msgSend(a2, "captions"), "count"))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (void *)objc_msgSend(a2, "captions");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v11 = (void *)objc_msgSend(v10, "region");
          if (objc_msgSend(v10, "animation"))
            v7 = 1;
          if ((v7 & 1) == 0 && v11 && objc_msgSend(v11, "scroll"))
            v7 = 1;
          if ((v7 & 1) != 0)
          {
            v12 = 1;
            v13 = 1;
            goto LABEL_22;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }
    v13 = v7 & 1;
    v12 = 1;
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
LABEL_22:
  v14 = [AVCaptionRendererScene alloc];
  if (a2)
    objc_msgSend(a2, "timeRange");
  else
    memset(v16, 0, sizeof(v16));
  v15 = -[AVCaptionRendererScene initWithTimeRange:hasActiveCaptions:needsPeriodicRefresh:](v14, "initWithTimeRange:hasActiveCaptions:needsPeriodicRefresh:", v16, v12, v13);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

}

- (int)buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession
{
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v4;
  NSArray *captions;
  int v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
    return 0;
  v4 = Mutable;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  captions = self->_internal->_captions;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__AVCaptionRenderer_buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession__block_invoke;
  v8[3] = &unk_1E3034978;
  v8[4] = &v9;
  v8[5] = v4;
  -[NSArray enumerateObjectsUsingBlock:](captions, "enumerateObjectsUsingBlock:", v8);
  v6 = *((_DWORD *)v10 + 6);
  if (!v6)
  {
    if (self->_internal->_useFigCaptionClientByDefault)
      v6 = FigCaptionClientSetCaptionArray();
    else
      v6 = 0;
  }
  _Block_object_dispose(&v9, 8);
  CFRelease(v4);
  return v6;
}

void __83__AVCaptionRenderer_buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v7;

  objc_msgSend(a2, "_figCaptionData");
  if (a2)
    objc_msgSend(a2, "timeRange");
  v7 = FigCaptionCreate();
  if (v7)
  {
    *a4 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  }
  else
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), 0);
  }
}

- (BOOL)setupFigCaptionClient
{
  OpaqueFigCaptionClient *captionClient;

  if (FigCaptionClientCreate()
    || FigCaptionClientSetCGContextDevice()
    || (CMClockGetHostTimeClock(), FigCaptionClientSetMasterClock())
    || (-[AVCaptionRenderer buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession](self, "buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession"), FigCaptionClientSetBounds())|| FigCaptionClientSetCaptionCacheRange()|| FigCaptionClientStart())
  {
    captionClient = self->_internal->_captionClient;
    if (captionClient)
    {
      CFRelease(captionClient);
      LOBYTE(captionClient) = 0;
      self->_internal->_captionClient = 0;
    }
  }
  else
  {
    LOBYTE(captionClient) = 1;
  }
  return (char)captionClient;
}

- (BOOL)setupFigCDS
{
  OpaqueFigCDSSession *cdsSession;

  if (FigCDSSessionCreate()
    || FigCDSSessionSetCGContextDevice()
    || (CMClockGetHostTimeClock(), FigCDSSessionSetMasterClock())
    || (-[AVCaptionRenderer buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession](self, "buildFigCaptionArrayFromAVCaptionArrayAndSubmitToRenderSession"), MEMORY[0x194032C44](self->_internal->_cdsSession, self->_internal->_bounds.origin.x, self->_internal->_bounds.origin.y, self->_internal->_bounds.size.width, self->_internal->_bounds.size.height))|| FigCDSSessionSetCaptionCacheRange()|| FigCDSSessionStart())
  {
    cdsSession = self->_internal->_cdsSession;
    if (cdsSession)
    {
      CFRelease(cdsSession);
      LOBYTE(cdsSession) = 0;
      self->_internal->_cdsSession = 0;
    }
  }
  else
  {
    LOBYTE(cdsSession) = 1;
  }
  return (char)cdsSession;
}

- (void)teardownFigCaptionClient
{
  OpaqueFigCaptionClient *captionClient;

  if (self->_internal->_captionClient)
  {
    FigCaptionClientStop();
    captionClient = self->_internal->_captionClient;
    if (captionClient)
    {
      CFRelease(captionClient);
      self->_internal->_captionClient = 0;
    }
  }
}

- (void)teardownFigCDS
{
  OpaqueFigCDSSession *cdsSession;

  if (self->_internal->_cdsSession)
  {
    FigCDSSessionStop();
    cdsSession = self->_internal->_cdsSession;
    if (cdsSession)
    {
      CFRelease(cdsSession);
      self->_internal->_cdsSession = 0;
    }
  }
}

- (void)renderInContext:(CGContext *)a3 atTime:(id *)a4
{
  AVCaptionRendererInternal *internal;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGColor *GenericGray;
  CGColor *v12;
  CGRect v13;
  CGRect v14;

  internal = self->_internal;
  x = internal->_bounds.origin.x;
  y = internal->_bounds.origin.y;
  width = internal->_bounds.size.width;
  height = internal->_bounds.size.height;
  if (internal->_useFigCaptionClientByDefault)
  {
    if (FigCaptionClientSetTime())
      return;
  }
  else if (FigCDSSessionSetTime())
  {
    return;
  }
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectIsNull(v13))
  {
    CGContextSaveGState(a3);
    GenericGray = CGColorCreateGenericGray(0.0, 0.0);
    if (GenericGray)
    {
      v12 = GenericGray;
      CGContextSetFillColorWithColor(a3, GenericGray);
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      CGContextFillRect(a3, v14);
      CGColorRelease(v12);
    }
    CGContextRestoreGState(a3);
    if (self->_internal->_useFigCaptionClientByDefault)
      FigCaptionClientUpdateCGContext();
    else
      FigCDSSessionUpdateCGContext();
  }
}

- (void)renderInContext:(CGContextRef)ctx forTime:(CMTime *)time
{
  CMTime v4;

  v4 = *time;
  -[AVCaptionRenderer renderInContext:atTime:](self, "renderInContext:atTime:", ctx, &v4);
}

@end
