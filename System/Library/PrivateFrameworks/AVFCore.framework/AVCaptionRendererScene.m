@implementation AVCaptionRendererScene

- (AVCaptionRendererScene)init
{
  void *v4;
  uint64_t v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  v6 = NSStringFromSelector(sel_initWithText_timeRange_);
  v12 = (void *)objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Use %@ instead."), v7, v8, v9, v10, v11, (uint64_t)v6), 0);
  objc_exception_throw(v12);
}

- (AVCaptionRendererScene)initWithTimeRange:(id *)a3 hasActiveCaptions:(BOOL)a4 needsPeriodicRefresh:(BOOL)a5
{
  AVCaptionRendererScene *v9;
  AVCaptionRendererSceneInternal *v10;
  __int128 v11;
  __int128 v12;
  AVCaptionRendererScene *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  objc_super v22;

  if ((a3->var0.var2 & 0x1D) != 1 || (a3->var1.var2 & 0x1D) != 1)
  {
    v15 = self;
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v16, v17, v18, v19, v20, (uint64_t)"CMTIME_IS_NUMERIC(timeRange.start) && CMTIME_IS_NUMERIC(timeRange.duration)"), 0);
    objc_exception_throw(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)AVCaptionRendererScene;
  v9 = -[AVCaptionRendererScene init](&v22, sel_init);
  if (v9)
  {
    v10 = objc_alloc_init(AVCaptionRendererSceneInternal);
    v9->_internal = v10;
    if (v10)
    {
      v11 = *(_OWORD *)&a3->var0.var0;
      v12 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v10->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      *(_OWORD *)&v10->_timeRange.start.epoch = v12;
      *(_OWORD *)&v10->_timeRange.start.value = v11;
      v9->_internal->_hasActiveCaptions = a4;
      v9->_internal->_needsPeriodicRefresh = a5;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptionRendererScene;
  -[AVCaptionRendererScene dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  CMTimeRange v8;
  CMTimeRange range1;
  uint64_t v10;
  uint64_t v11;

  if (self == a3)
    return 1;
  v10 = v3;
  v11 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (!self)
  {
    memset(&range1, 0, sizeof(range1));
    if (a3)
      goto LABEL_5;
LABEL_9:
    memset(&v8, 0, sizeof(v8));
    return CMTimeRangeEqual(&range1, &v8) != 0;
  }
  -[AVCaptionRendererScene timeRange](self, "timeRange");
  if (!a3)
    goto LABEL_9;
LABEL_5:
  objc_msgSend(a3, "timeRange");
  return CMTimeRangeEqual(&range1, &v8) != 0;
}

- (unint64_t)hash
{
  CMTimeEpoch v2;
  CMTime v4;
  __int128 v5;
  _OWORD v6[2];

  memset(v6, 0, sizeof(v6));
  v5 = 0u;
  if (self)
    -[AVCaptionRendererScene timeRange](self, "timeRange");
  *(_OWORD *)&v4.value = v5;
  v4.epoch = *(_QWORD *)&v6[0];
  v2 = CMTimeHash(&v4);
  v4 = *(CMTime *)((char *)v6 + 8);
  return CMTimeHash(&v4) ^ v2;
}

- (CMTimeRange)timeRange
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)&self->start.timescale;
  v4 = *(_OWORD *)(v3 + 24);
  *(_OWORD *)&retstr->start.value = *(_OWORD *)(v3 + 8);
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v3 + 40);
  return self;
}

- (BOOL)hasActiveCaptions
{
  return self->_internal->_hasActiveCaptions;
}

- (BOOL)needsPeriodicRefresh
{
  return self->_internal->_needsPeriodicRefresh;
}

- (id)description
{
  const __CFAllocator *v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  const __CFString *v8;
  _BOOL4 v9;
  const __CFString *v10;
  CMTimeRange range;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
    -[AVCaptionRendererScene timeRange](self, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  v4 = (id)CMTimeRangeCopyDescription(v3, &range);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  if (-[AVCaptionRendererScene hasActiveCaptions](self, "hasActiveCaptions"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = -[AVCaptionRendererScene needsPeriodicRefresh](self, "needsPeriodicRefresh");
  v10 = &stru_1E303A378;
  if (v9)
    v10 = CFSTR(", periodic-refresh");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, timeRange = %@ anyCaptions = %@%@>"), v7, self, v4, v8, v10);
}

@end
