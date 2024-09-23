@implementation AVCaptionGroup

- (AVCaptionGroup)initWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  AVCaptionGroup *v15;
  AVCaptionGroupInternal *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  AVCaptionGroupInternal *internal;
  __int128 v23;
  __int128 v24;
  AVCaptionGroup *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  AVCaptionGroup *v36;
  AVCaptionGroup *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  CMTimeRange range2;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!captions)
  {
    v37 = self;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "captions != nil";
LABEL_30:
    v35 = (void *)objc_msgSend(v32, "exceptionWithName:reason:userInfo:", v33, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v27, v28, v29, v30, v31, (uint64_t)v34), 0);
    objc_exception_throw(v35);
  }
  if ((timeRange->start.flags & 1) == 0
    || (timeRange->duration.flags & 1) == 0
    || timeRange->duration.epoch
    || timeRange->duration.value < 0)
  {
    v36 = self;
    v32 = (void *)MEMORY[0x1E0C99DA0];
    v33 = *MEMORY[0x1E0C99778];
    v34 = "CMTIMERANGE_IS_VALID(timeRange)";
    goto LABEL_30;
  }
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](captions, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (!v8)
    goto LABEL_17;
  v9 = v8;
  v10 = *(_QWORD *)v48;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(captions);
      v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      memset(&v46, 0, sizeof(v46));
      if (v12)
        objc_msgSend(v12, "timeRange");
      else
        memset(&range, 0, sizeof(range));
      v13 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&otherRange.start.epoch = v13;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      CMTimeRangeGetIntersection(&v46, &range, &otherRange);
      v14 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&otherRange.start.epoch = v14;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      range2 = v46;
      if (!CMTimeRangeEqual(&otherRange, &range2))
      {
        v26 = self;
        v32 = (void *)MEMORY[0x1E0C99DA0];
        v33 = *MEMORY[0x1E0C99778];
        v34 = "CMTimeRangeEqual( timeRange, intersection)";
        goto LABEL_30;
      }
    }
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](captions, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  }
  while (v9);
LABEL_17:
  v42.receiver = self;
  v42.super_class = (Class)AVCaptionGroup;
  v15 = -[AVCaptionGroup init](&v42, sel_init);
  if (v15)
  {
    v16 = objc_alloc_init(AVCaptionGroupInternal);
    v15->_internal = v16;
    if (v16)
    {
      CFRetain(v16);
      v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](captions, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v39 != v20)
              objc_enumerationMutation(captions);
            -[NSArray addObject:](v17, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "copy"));
          }
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](captions, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
        }
        while (v19);
      }
      v15->_internal->captions = v17;
      internal = v15->_internal;
      v23 = *(_OWORD *)&timeRange->start.value;
      v24 = *(_OWORD *)&timeRange->duration.timescale;
      *(_OWORD *)&internal->timeRange.start.epoch = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&internal->timeRange.duration.timescale = v24;
      *(_OWORD *)&internal->timeRange.start.value = v23;
    }
    else
    {

      return 0;
    }
  }
  return v15;
}

- (AVCaptionGroup)initWithTimeRange:(CMTimeRange *)timeRange
{
  __int128 v3;
  AVCaptionGroup *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _OWORD v14[3];

  if ((timeRange->start.flags & 1) == 0
    || (timeRange->duration.flags & 1) == 0
    || timeRange->duration.epoch
    || timeRange->duration.value < 0)
  {
    v7 = self;
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v8, v9, v10, v11, v12, (uint64_t)"CMTIMERANGE_IS_VALID(timeRange)"), 0);
    objc_exception_throw(v13);
  }
  v3 = *(_OWORD *)&timeRange->start.epoch;
  v14[0] = *(_OWORD *)&timeRange->start.value;
  v14[1] = v3;
  v14[2] = *(_OWORD *)&timeRange->duration.timescale;
  return -[AVCaptionGroup initWithCaptions:timeRange:](self, "initWithCaptions:timeRange:", MEMORY[0x1E0C9AA60], v14);
}

- (void)dealloc
{
  AVCaptionGroupInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptionGroup;
  -[AVCaptionGroup dealloc](&v4, sel_dealloc);
}

- (id)description
{
  const __CFAllocator *v3;
  AVCaptionGroupInternal *internal;
  __int128 v5;
  const __CFString *v6;
  void *v7;
  objc_class *v8;
  CMTimeRange range;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  internal = self->_internal;
  v5 = *(_OWORD *)&internal->timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&internal->timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&internal->timeRange.duration.timescale;
  v6 = (id)CMTimeRangeCopyDescription(v3, &range);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p, timeRange = %@ captions=%@>"), NSStringFromClass(v8), self, v6, self->_internal->captions);
}

- (CMTimeRange)timeRange
{
  _OWORD *v3;
  __int128 v4;

  v3 = *(_OWORD **)&self->start.timescale;
  v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (NSArray)captions
{
  return self->_internal->captions;
}

- (opaqueCMSampleBuffer)copySampleBufferWithError:(id *)a3
{
  unint64_t v4;
  __CFArray *Mutable;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  char *v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  CFTypeRef v15;
  opaqueCMSampleBuffer *v16;
  CMTimeRange v18;
  CMTime v19;
  CMTimeRange range;
  CMTime v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CMTime rhs;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime lhs;
  CMTime v30;
  CFTypeRef v31;
  opaqueCMSampleBuffer *v32;
  CFTypeRef v33;

  v4 = -[NSArray count](-[AVCaptionGroup captions](self, "captions", a3), "count");
  v32 = 0;
  v33 = 0;
  v31 = 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, MEMORY[0x1E0C9B378]);
  v6 = 0;
  v7 = 0;
  if (v4 > 0xAAAAAAAAAAAAAAALL
    || (v7 = (char *)malloc_type_malloc((24 * v4) | 1, 0x5CC9CBA6uLL),
        v6 = (char *)malloc_type_malloc((24 * v4) | 1, 0x5CC9CBA6uLL),
        v4))
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = -[NSArray objectAtIndexedSubscript:](-[AVCaptionGroup captions](self, "captions"), "objectAtIndexedSubscript:", v9);
      objc_msgSend(v10, "_figCaptionData");
      if (FigCaptionDataCreateMutableCopy())
        break;
      if (self)
      {
        -[AVCaptionGroup timeRange](self, "timeRange");
      }
      else
      {
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
      }
      *(_OWORD *)&lhs.value = v26;
      lhs.epoch = v27;
      if (v10)
      {
        objc_msgSend(v10, "timeRange");
      }
      else
      {
        v23 = 0u;
        v24 = 0u;
        v22 = 0u;
      }
      v11 = &v7[v8];
      *(_OWORD *)&rhs.value = v22;
      rhs.epoch = v23;
      CMTimeSubtract(&v30, &lhs, &rhs);
      v12 = *(_OWORD *)&v30.value;
      *((_QWORD *)v11 + 2) = v30.epoch;
      *(_OWORD *)v11 = v12;
      if (v10)
        objc_msgSend(v10, "timeRange");
      else
        memset(&range, 0, sizeof(range));
      CMTimeRangeGetEnd(&v21, &range);
      if (self)
        -[AVCaptionGroup timeRange](self, "timeRange");
      else
        memset(&v18, 0, sizeof(v18));
      v13 = &v6[v8];
      CMTimeRangeGetEnd(&v19, &v18);
      CMTimeSubtract(&v30, &v21, &v19);
      v14 = *(_OWORD *)&v30.value;
      v15 = v31;
      *((_QWORD *)v13 + 2) = v30.epoch;
      *(_OWORD *)v13 = v14;
      CFArrayAppendValue(Mutable, v15);
      if (v31)
      {
        CFRelease(v31);
        v31 = 0;
      }
      ++v9;
      v8 += 24;
      if (v4 == v9)
        goto LABEL_20;
    }
  }
  else
  {
LABEL_20:
    if (!FigCaptionGroupCreate())
    {
      if (self)
      {
        -[AVCaptionGroup timeRange](self, "timeRange");
        -[AVCaptionGroup timeRange](self, "timeRange");
      }
      if (!FigSampleBufferCreateForCaptionGroup())
      {
        v16 = v32;
        v32 = 0;
        goto LABEL_25;
      }
    }
  }
  v16 = 0;
LABEL_25:
  free(v7);
  free(v6);
  if (Mutable)
    CFRelease(Mutable);
  if (v31)
    CFRelease(v31);
  if (v33)
    CFRelease(v33);
  if (v32)
    CFRelease(v32);
  return v16;
}

@end
