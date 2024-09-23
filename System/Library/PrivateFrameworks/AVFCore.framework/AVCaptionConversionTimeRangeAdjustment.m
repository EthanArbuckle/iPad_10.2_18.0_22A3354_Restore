@implementation AVCaptionConversionTimeRangeAdjustment

+ (AVCaptionConversionTimeRangeAdjustment)captionConversionTimeRangeAdjustmentWithFigDictionary:(__CFDictionary *)a3
{
  return (AVCaptionConversionTimeRangeAdjustment *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigDictionary:", a3);
}

- (AVCaptionConversionTimeRangeAdjustment)initWithFigDictionary:(__CFDictionary *)a3
{
  self->_timeRangeAdjustmentInternal = (void *)-[__CFDictionary copy](a3, "copy");
  return self;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptionConversionTimeRangeAdjustment;
  -[AVCaptionConversionTimeRangeAdjustment dealloc](&v3, sel_dealloc);
}

- (id)adjustmentType
{
  return CFSTR("AVCaptionConversionAdjustmentTypeTimeRange");
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startAdjustment
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary((CMTime *)retstr, (CFDictionaryRef)objc_msgSend(self->_timeRangeAdjustmentInternal, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3FA8]));
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAdjustment
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary((CMTime *)retstr, (CFDictionaryRef)objc_msgSend(self->_timeRangeAdjustmentInternal, "objectForKeyedSubscript:", *MEMORY[0x1E0CC3FA0]));
}

- (CMTime)startTimeOffset
{
  if (self)
    return (CMTime *)-[CMTime startAdjustment](self, "startAdjustment");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return self;
}

- (CMTime)durationOffset
{
  if (self)
    return (CMTime *)-[CMTime durationAdjustment](self, "durationAdjustment");
  retstr->value = 0;
  *(_QWORD *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return self;
}

- (id)description
{
  const __CFAllocator *v3;
  CFStringRef v4;
  CFStringRef v5;
  void *v6;
  objc_class *v7;
  void *v8;
  CMTime v10;
  CMTime time;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (self)
  {
    -[AVCaptionConversionTimeRangeAdjustment startAdjustment](self, "startAdjustment");
    v4 = CMTimeCopyDescription(v3, &time);
    -[AVCaptionConversionTimeRangeAdjustment durationAdjustment](self, "durationAdjustment");
  }
  else
  {
    memset(&time, 0, sizeof(time));
    v4 = CMTimeCopyDescription(v3, &time);
    memset(&v10, 0, sizeof(v10));
  }
  v5 = CMTimeCopyDescription(v3, &v10);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = (objc_class *)objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p, start time adjusted by %@, duration adjusted by %@"), NSStringFromClass(v7), self, v4, v5);
  if (v4)
    CFRelease(v4);
  if (v5)
    CFRelease(v5);
  return v8;
}

@end
