@implementation CAMAnalyticsEvent

- (CAMAnalyticsEvent)init
{
  CAMAnalyticsEvent *v2;
  void *v3;
  uint64_t v4;
  NSString *uuid;
  NSMutableDictionary *v6;
  NSMutableDictionary *eventMap;
  CAMAnalyticsEvent *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CAMAnalyticsEvent;
  v2 = -[CAMAnalyticsEvent init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    eventMap = v2->__eventMap;
    v2->__eventMap = v6;

    v8 = v2;
  }

  return v2;
}

- (CAMAnalyticsEvent)initWithEvent:(id)a3
{
  id v4;
  CAMAnalyticsEvent *v5;
  void *v6;
  uint64_t v7;
  NSString *uuid;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *eventMap;
  CAMAnalyticsEvent *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CAMAnalyticsEvent;
  v5 = -[CAMAnalyticsEvent init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v7;

    objc_msgSend(v4, "_eventMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    eventMap = v5->__eventMap;
    v5->__eventMap = (NSMutableDictionary *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)publish
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CAMAnalyticsEvent eventName](self, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("com.apple.cameraui.%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AnalyticsSendEventLazy();
}

uint64_t __28__CAMAnalyticsEvent_publish__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventMap");
}

- (NSString)eventName
{
  return (NSString *)&stru_1EA3325A0;
}

+ (id)durationRangeStringForDuration:(double)a3
{
  uint64_t v3;

  objc_msgSend(a1, "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", 1, a3, 0.125, 65536.0);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g"), v3);
}

+ (id)bucketedGigabytesStringForBytes:(int64_t)a3
{
  return (id)objc_msgSend(a1, "bucketedGigabytesStringForBytes:allowZero:minPositiveValue:maxValue:", a3, 1, 0.125, 4096.0);
}

+ (double)gigabytesForBytes:(int64_t)a3
{
  return (double)(a3 / 0x100000) * 0.0009765625;
}

+ (id)bucketedGigabytesStringForBytes:(int64_t)a3 allowZero:(BOOL)a4 minPositiveValue:(double)a5 maxValue:(double)a6
{
  _BOOL8 v6;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a1, "gigabytesForBytes:", a3);
  objc_msgSend(a1, "bucketedPowerOf2ForValue:allowZero:minPositiveValue:maxValue:", v6);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g"), v8);
}

+ (double)bucketedPowerOf2ForValue:(double)a3 allowZero:(BOOL)a4 minPositiveValue:(double)a5 maxValue:(double)a6
{
  double v7;

  if (a3 <= 0.0 && a4)
    return 0.0;
  if (a3 < a5)
    a3 = a5;
  if (a3 > a6)
    a3 = a6;
  v7 = log2(a3);
  return exp2(ceil(v7));
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSMutableDictionary)_eventMap
{
  return self->__eventMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__eventMap, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
