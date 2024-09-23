@implementation MADSceneClassificationVideoEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADSceneClassificationVideoEntry)initWithTimeRange:(id *)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  MADSceneClassificationVideoEntry *result;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)MADSceneClassificationVideoEntry;
  result = -[MADSceneClassificationVideoEntry init](&v14, sel_init);
  if (result)
  {
    v12 = *(_OWORD *)&a3->var0.var0;
    v13 = *(_OWORD *)&a3->var1.var1;
    *(_OWORD *)&result->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&result->_timeRange.duration.timescale = v13;
    *(_OWORD *)&result->_timeRange.start.value = v12;
    result->_confidence = a4;
    result->_boundingBox.origin.x = x;
    result->_boundingBox.origin.y = y;
    result->_boundingBox.size.width = width;
    result->_boundingBox.size.height = height;
  }
  return result;
}

+ (id)entryWithTimeRange:(id *)a3 confidence:(double)a4 boundingBox:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  __int128 v12;
  _OWORD v14[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = objc_alloc((Class)a1);
  v12 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v11, "initWithTimeRange:confidence:boundingBox:", v14, a4, x, y, width, height);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = a3;
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6[0] = *(_OWORD *)&self->_timeRange.start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(v4, "encodeCMTimeRange:forKey:", v6, CFSTR("TimeRange"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("Confidence"), self->_confidence);
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("BoundingBox"), self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);

}

- (MADSceneClassificationVideoEntry)initWithCoder:(id)a3
{
  id v4;
  MADSceneClassificationVideoEntry *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MADSceneClassificationVideoEntry;
  v5 = -[MADSceneClassificationVideoEntry init](&v15, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "decodeCMTimeRangeForKey:", CFSTR("TimeRange"));
    }
    else
    {
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
    }
    *(_OWORD *)&v5->_timeRange.start.value = v12;
    *(_OWORD *)&v5->_timeRange.start.epoch = v13;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("Confidence"), v12, v13, v14);
    v5->_confidence = v6;
    objc_msgSend(v4, "decodeRectForKey:", CFSTR("BoundingBox"));
    v5->_boundingBox.origin.x = v7;
    v5->_boundingBox.origin.y = v8;
    v5->_boundingBox.size.width = v9;
    v5->_boundingBox.size.height = v10;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  Float64 Seconds;
  __int128 v7;
  double v8;
  void *v9;
  uint64_t v10;
  CMTimeRange range;
  CMTime v13;
  CMTime time;
  NSRect v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  time = (CMTime)self->_timeRange.start;
  Seconds = CMTimeGetSeconds(&time);
  v7 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  CMTimeRangeGetEnd(&v13, &range);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %-.4fs-%-.4fs, "), CFSTR("TimeRange"), *(_QWORD *)&Seconds, CMTimeGetSeconds(&v13));
  -[MADSceneClassificationVideoEntry boundingBox](self, "boundingBox");
  if (v8 != 0.0)
  {
    -[MADSceneClassificationVideoEntry boundingBox](self, "boundingBox");
    NSStringFromRect(v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%@: %@, "), CFSTR("BoundingBox"), v9);

  }
  -[MADSceneClassificationVideoEntry confidence](self, "confidence");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %.2f>"), CFSTR("Confidence"), v10);
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

- (double)confidence
{
  return self->_confidence;
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_boundingBox.origin.x;
  y = self->_boundingBox.origin.y;
  width = self->_boundingBox.size.width;
  height = self->_boundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
