@implementation AVAssetWriterInputPassDescription

- (AVAssetWriterInputPassDescription)init
{
  return -[AVAssetWriterInputPassDescription initWithTimeRanges:](self, "initWithTimeRanges:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
}

- (AVAssetWriterInputPassDescription)initWithTimeRanges:(id)a3
{
  AVAssetWriterInputPassDescription *v4;
  AVAssetWriterInputPassDescriptionInternal *v5;
  AVAssetWriterInputPassDescription *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  if (!a3)
  {
    v9 = self;
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)"timeRanges != nil"), 0);
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)AVAssetWriterInputPassDescription;
  v4 = -[AVAssetWriterInputPassDescription init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVAssetWriterInputPassDescriptionInternal);
    v4->_internal = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_internal->timeRanges = (NSArray *)objc_msgSend(a3, "copy");
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVAssetWriterInputPassDescriptionInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputPassDescription;
  -[AVAssetWriterInputPassDescription dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSArray *timeRanges;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFAllocator *v8;
  uint64_t i;
  void *v10;
  void *v11;
  objc_class *v12;
  CMTimeRange range;
  CMTimeRange v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  timeRanges = self->_internal->timeRanges;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(timeRanges);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        memset(&v15, 0, sizeof(v15));
        if (v10)
          objc_msgSend(v10, "CMTimeRangeValue");
        range = v15;
        objc_msgSend(v3, "addObject:", (id)CMTimeRangeCopyDescription(v8, &range));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](timeRanges, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v11, "stringWithFormat:", CFSTR("<%@: %p, sourceTimeRanges=%@>"), NSStringFromClass(v12), self, objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", ")));
}

- (NSArray)sourceTimeRanges
{
  return self->_internal->timeRanges;
}

@end
