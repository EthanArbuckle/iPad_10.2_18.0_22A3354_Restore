@implementation AVVideoPerformanceMetrics

- (AVVideoPerformanceMetrics)init
{
  return -[AVVideoPerformanceMetrics initWithDictionary:](self, "initWithDictionary:", 0);
}

- (AVVideoPerformanceMetrics)initWithDictionary:(id)a3
{
  AVVideoPerformanceMetrics *v4;
  AVVideoPerformanceMetricsInternal *v5;
  objc_super v7;

  if (!a3)
  {

    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)AVVideoPerformanceMetrics;
  v4 = -[AVVideoPerformanceMetrics init](&v7, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(AVVideoPerformanceMetricsInternal);
    v4->_performanceMetricsInternal = v5;
    if (v5)
    {
      CFRetain(v5);
      v4->_performanceMetricsInternal->_metricsDictionary = (NSDictionary *)a3;
      return v4;
    }

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  AVVideoPerformanceMetricsInternal *performanceMetricsInternal;
  objc_super v4;

  performanceMetricsInternal = self->_performanceMetricsInternal;
  if (performanceMetricsInternal)
  {

    CFRelease(self->_performanceMetricsInternal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoPerformanceMetrics;
  -[AVVideoPerformanceMetrics dealloc](&v4, sel_dealloc);
}

- (int64_t)totalNumberOfFrames
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v9;
  int64_t v10;

  v3 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC63B0]);
  v4 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC6380]);
  v5 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC6388]);
  v6 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC6398]);
  v7 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC63A8]);
  if (v3)
    return objc_msgSend(v3, "unsignedLongValue");
  v9 = v7;
  if (!v4)
  {
    v10 = 0;
    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = objc_msgSend(v4, "unsignedLongValue");
  if (v5)
LABEL_5:
    v10 += objc_msgSend(v5, "unsignedLongValue");
LABEL_6:
  if (v6)
    v10 += objc_msgSend(v6, "unsignedLongValue");
  if (v9)
    v10 += objc_msgSend(v9, "unsignedLongValue");
  return v10;
}

- (int64_t)numberOfDroppedFrames
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC63A0]);
  v4 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC63B8]);
  v5 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC6398]);
  if (v3)
    v6 = 0;
  else
    v6 = v4 == 0;
  if (v6 && v5 == 0)
    return 0;
  v8 = v5;
  v9 = objc_msgSend(v3, "unsignedLongValue");
  v10 = objc_msgSend(v4, "unsignedLongValue") + v9;
  return v10 + objc_msgSend(v8, "unsignedLongValue");
}

- (int64_t)numberOfCorruptedFrames
{
  int64_t result;

  result = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC6370]);
  if (result)
    return objc_msgSend((id)result, "unsignedLongValue");
  return result;
}

- (double)totalAccumulatedFrameDelay
{
  double v2;

  -[AVVideoPerformanceMetrics totalFrameDelay](self, "totalFrameDelay");
  return v2 / 1000000.0;
}

- (unint64_t)numberOfDisplayCompositedVideoFrames
{
  unint64_t result;

  result = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC6378]);
  if (result)
    return objc_msgSend((id)result, "unsignedLongValue");
  return result;
}

- (unint64_t)numberOfNonDisplayCompositedVideoFrames
{
  unint64_t result;

  result = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC63C0]);
  if (result)
    return objc_msgSend((id)result, "unsignedLongValue");
  return result;
}

- (double)totalFrameDelay
{
  id v2;
  double result;

  v2 = -[NSDictionary objectForKey:](self->_performanceMetricsInternal->_metricsDictionary, "objectForKey:", *MEMORY[0x1E0CC63C8]);
  if (!v2)
    return 0.0;
  objc_msgSend(v2, "doubleValue");
  return result;
}

@end
