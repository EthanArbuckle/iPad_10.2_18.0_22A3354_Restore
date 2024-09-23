@implementation MADVideoRemoveBackgroundPreviewResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADVideoRemoveBackgroundPreviewResult)initWithTimeRange:(id *)a3 frames:(id)a4 normalizedCropRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  MADVideoRemoveBackgroundPreviewResult *v13;
  MADVideoRemoveBackgroundPreviewResult *v14;
  __int128 v15;
  __int128 v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MADVideoRemoveBackgroundPreviewResult;
  v13 = -[MADVideoRemoveBackgroundPreviewResult init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v16 = *(_OWORD *)&a3->var0.var3;
    v15 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&v13->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&v13->_timeRange.start.epoch = v16;
    *(_OWORD *)&v13->_timeRange.duration.timescale = v15;
    objc_storeStrong((id *)&v13->_frames, a4);
    v14->_normalizedCropRect.origin.x = x;
    v14->_normalizedCropRect.origin.y = y;
    v14->_normalizedCropRect.size.width = width;
    v14->_normalizedCropRect.size.height = height;
  }

  return v14;
}

- (MADVideoRemoveBackgroundPreviewResult)initWithCoder:(id)a3
{
  id v4;
  MADVideoRemoveBackgroundPreviewResult *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *frames;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MADVideoRemoveBackgroundPreviewResult;
  v5 = -[MADVideoResult initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_timeRange.start.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeStartValue"));
    v5->_timeRange.start.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeStartScale"));
    v5->_timeRange.start.flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeStartFlags"));
    v5->_timeRange.start.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeStartEpoch"));
    v5->_timeRange.duration.value = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeDurationValue"));
    v5->_timeRange.duration.timescale = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeDurationScale"));
    v5->_timeRange.duration.flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("TimeRangeDurationFlags"));
    v5->_timeRange.duration.epoch = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("TimeRangeDurationEpoch"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("Frames"));
    v9 = objc_claimAutoreleasedReturnValue();
    frames = v5->_frames;
    v5->_frames = (NSArray *)v9;

    objc_msgSend(v4, "decodeRectForKey:", CFSTR("NormalizedCropRect"));
    v5->_normalizedCropRect.origin.x = v11;
    v5->_normalizedCropRect.origin.y = v12;
    v5->_normalizedCropRect.size.width = v13;
    v5->_normalizedCropRect.size.height = v14;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADVideoRemoveBackgroundPreviewResult;
  -[MADVideoResult encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_timeRange.start.value, CFSTR("TimeRangeStartValue"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_timeRange.start.timescale, CFSTR("TimeRangeStartScale"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_timeRange.start.flags, CFSTR("TimeRangeStartFlags"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_timeRange.start.epoch, CFSTR("TimeRangeStartEpoch"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_timeRange.duration.value, CFSTR("TimeRangeDurationValue"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_timeRange.duration.timescale, CFSTR("TimeRangeDurationScale"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_timeRange.duration.flags, CFSTR("TimeRangeDurationFlags"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_timeRange.duration.epoch, CFSTR("TimeRangeDurationEpoch"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_frames, CFSTR("Frames"));
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("NormalizedCropRect"), self->_normalizedCropRect.origin.x, self->_normalizedCropRect.origin.y, self->_normalizedCropRect.size.width, self->_normalizedCropRect.size.height);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t timescale;
  uint64_t v7;
  CMTime duration;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  timescale = self->_timeRange.start.timescale;
  time = (CMTime)self->_timeRange.start;
  objc_msgSend(v3, "appendFormat:", CFSTR("start: %lld/%d (%0.3fs), "), time.value, timescale, CMTimeGetSeconds(&time));
  v7 = self->_timeRange.duration.timescale;
  duration = (CMTime)self->_timeRange.duration;
  objc_msgSend(v3, "appendFormat:", CFSTR("duration: %lld/%d (%0.3fs), "), duration.value, v7, CMTimeGetSeconds(&duration));
  objc_msgSend(v3, "appendFormat:", CFSTR("frames: %@,"), self->_frames);
  objc_msgSend(v3, "appendFormat:", CFSTR("normalizedCropRect: (%0.3f, %0.3f) to (%0.3f, %0.3f)>"), *(_QWORD *)&self->_normalizedCropRect.origin.x, *(_QWORD *)&self->_normalizedCropRect.origin.y, self->_normalizedCropRect.origin.x + self->_normalizedCropRect.size.width, self->_normalizedCropRect.origin.y + self->_normalizedCropRect.size.height);
  return v3;
}

- ($7159EBE1BBBCDCA1B95AF1FC27B9DE98)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var1;
  return self;
}

- (NSArray)frames
{
  return self->_frames;
}

- (CGRect)normalizedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedCropRect.origin.x;
  y = self->_normalizedCropRect.origin.y;
  width = self->_normalizedCropRect.size.width;
  height = self->_normalizedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
}

@end
