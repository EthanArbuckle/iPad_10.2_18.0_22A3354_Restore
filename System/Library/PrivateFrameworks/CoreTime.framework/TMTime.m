@implementation TMTime

- (TMTime)init
{
  return -[TMTime initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:](self, "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", 0, 0, 0, 0.0, 0.0, 0.0);
}

- (TMTime)initWithUtc_ns:(int64_t)a3 utcUnc_s:(double)a4 rtc_ns:(int64_t)a5 sf:(double)a6 sfUnc:(double)a7 source:(id)a8
{
  TMTime *v14;
  TMTime *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TMTime;
  v14 = -[TMTime init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_rtc_ns = a5;
    v14->_utc_ns = a3;
    v14->_utcUnc_s = a4;
    v14->_sf = a6;
    v14->_sfUnc = a7;
    v14->_source = (NSString *)objc_msgSend(a8, "copy");
    v15->_reliability = 1;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TMTime;
  -[TMTime dealloc](&v3, sel_dealloc);
}

+ (id)timeWithUtc_s:(double)a3 utcUnc_s:(double)a4 rtc_s:(double)a5 sf:(double)a6 source:(id)a7
{
  double v12;
  double v13;
  long double v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double __y;

  if (a3 >= 9223372040.0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  __y = 0.0;
  v12 = modf(a3, &__y);
  v13 = __y;
  if (a5 >= 9223372040.0)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a5);
  }
  if (a5 <= -9223372040.0)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a5);
  }
  __y = 0.0;
  v14 = modf(a5, &__y);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", llround(v12 * 1000000000.0) + 1000000000 * (uint64_t)v13, llround(v14 * 1000000000.0) + 1000000000 * (uint64_t)__y, a7, a4, a6, 0.00002);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUtc_ns:utcUnc_s:rtc_ns:sf:sfUnc:source:", self->_utc_ns, self->_rtc_ns, self->_source, self->_utcUnc_s, self->_sf, self->_sfUnc);
  *((_BYTE *)result + 8) = self->_synthesized;
  *((_BYTE *)result + 9) = self->_reliability;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_rtc_ns, CFSTR("rtc_ns"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_utc_ns, CFSTR("utc_ns"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("utcUnc_s"), self->_utcUnc_s);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sf"), self->_sf);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("sfUnc"), self->_sfUnc);
  objc_msgSend(a3, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_synthesized, CFSTR("synthesized"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_reliability, CFSTR("reliability"));
}

- (TMTime)initWithCoder:(id)a3
{
  TMTime *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TMTime;
  v4 = -[TMTime init](&v9, sel_init);
  if (v4)
  {
    v4->_rtc_ns = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("rtc_ns"));
    v4->_utc_ns = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("utc_ns"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("utcUnc_s"));
    v4->_utcUnc_s = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sf"));
    v4->_sf = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("sfUnc"));
    v4->_sfUnc = v7;
    v4->_source = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v4->_synthesized = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("synthesized"));
    v4->_reliability = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("reliability"));
  }
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TMTime utc_s](self, "utc_s");
  v5 = v4;
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v7 = v6;
  -[TMTime rtc_s](self, "rtc_s");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%f±%f at %f from '%@'"), v5, v7, v8, -[TMTime source](self, "source"));
}

- (BOOL)isEquivalent:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v14;
  double v15;
  double v16;
  double v17;

  -[TMTime utc_s](self, "utc_s");
  v6 = v5;
  objc_msgSend(a3, "utc_s");
  if (v6 >= v7)
    v8 = v6;
  else
    v8 = v7;
  if (v6 < v7)
    v7 = v6;
  if (v8 - v7 > 0.000001)
    return 0;
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v10 = v9;
  objc_msgSend(a3, "utcUnc_s");
  if (v10 >= v11)
    v12 = v10;
  else
    v12 = v11;
  if (v10 < v11)
    v11 = v10;
  if (v12 - v11 > 0.000001)
    return 0;
  -[TMTime rtc_s](self, "rtc_s");
  v15 = v14;
  objc_msgSend(a3, "rtc_s");
  if (v15 >= v16)
    v17 = v15;
  else
    v17 = v16;
  if (v15 < v16)
    v16 = v15;
  return v17 - v16 <= 0.000001;
}

- (double)propagatedTimeAtRTC:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[TMTime rtc_s](self, "rtc_s");
  v6 = (a3 - v5) * self->_sf;
  -[TMTime utc_s](self, "utc_s");
  return v7 + v6;
}

- (double)propagatedUncertaintyAtRTC:(double)a3
{
  double v5;

  -[TMTime rtc_s](self, "rtc_s");
  return TMPropagateError(self->_utcUnc_s, a3 - v5);
}

- (int64_t)rtc_ns
{
  return self->_rtc_ns;
}

- (void)setRtc_ns:(int64_t)a3
{
  self->_rtc_ns = a3;
}

- (int64_t)utc_ns
{
  return self->_utc_ns;
}

- (void)setUtc_ns:(int64_t)a3
{
  self->_utc_ns = a3;
}

- (double)utcUnc_s
{
  return self->_utcUnc_s;
}

- (void)setUtcUnc_s:(double)a3
{
  self->_utcUnc_s = a3;
}

- (double)sf
{
  return self->_sf;
}

- (void)setSf:(double)a3
{
  self->_sf = a3;
}

- (double)sfUnc
{
  return self->_sfUnc;
}

- (void)setSfUnc:(double)a3
{
  self->_sfUnc = a3;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isSynthesized
{
  return self->_synthesized;
}

- (void)setSynthesized:(BOOL)a3
{
  self->_synthesized = a3;
}

- (BOOL)reliability
{
  return self->_reliability;
}

- (void)setReliability:(BOOL)a3
{
  self->_reliability = a3;
}

+ (id)timeWithDictionary:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMScaleFactor"));
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMCurrentTime")), "doubleValue");
  v7 = v6;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMTimeError")), "doubleValue");
  v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMRtcTime")), "doubleValue");
  v11 = v10;
  if (v4)
  {
    objc_msgSend(v4, "doubleValue");
    v13 = v12;
  }
  else
  {
    v13 = 1.0;
  }
  return (id)objc_msgSend(v5, "timeWithUtc_s:utcUnc_s:rtc_s:sf:source:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("TMSource")), v7, v9, v11, v13);
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("TMCurrentTime");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[TMTime utc_s](self, "utc_s");
  v10[0] = objc_msgSend(v3, "numberWithDouble:");
  v9[1] = CFSTR("TMTimeError");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[TMTime utcUnc_s](self, "utcUnc_s");
  v10[1] = objc_msgSend(v4, "numberWithDouble:");
  v9[2] = CFSTR("TMRtcTime");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[TMTime rtc_s](self, "rtc_s");
  v10[2] = objc_msgSend(v5, "numberWithDouble:");
  v9[3] = CFSTR("TMSource");
  v10[3] = -[TMTime source](self, "source");
  v9[4] = CFSTR("TMScaleFactor");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[TMTime sf](self, "sf");
  v10[4] = objc_msgSend(v6, "numberWithDouble:");
  v9[5] = CFSTR("TMScaleFactorError");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[TMTime sfUnc](self, "sfUnc");
  v10[5] = objc_msgSend(v7, "numberWithDouble:");
  v9[6] = CFSTR("TMReliability");
  v10[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TMTime reliability](self, "reliability"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
}

- (double)rtc_s
{
  int64_t v2;

  v2 = -[TMTime rtc_ns](self, "rtc_ns");
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (void)setRtc_s:(double)a3
{
  long double v5;
  void *v6;
  void *v7;
  double __y;

  if (a3 >= 9223372040.0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  __y = 0.0;
  v5 = modf(a3, &__y);
  -[TMTime setRtc_ns:](self, "setRtc_ns:", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y);
}

- (double)utc_s
{
  int64_t v2;

  v2 = -[TMTime utc_ns](self, "utc_ns");
  return (double)(v2 % 1000000000) / 1000000000.0 + (double)(v2 / 1000000000);
}

- (void)setUtc_s:(double)a3
{
  long double v5;
  void *v6;
  void *v7;
  double __y;

  if (a3 >= 9223372040.0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 56, CFSTR("CFTimeInterval too large for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  if (a3 <= -9223372040.0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "TMNanoTimeInterval TMNanoTimeIntervalFromCF(CFTimeInterval)"), CFSTR("TMUtilities_Private.h"), 57, CFSTR("CFTimeInterval too small for TMNanoTimeInterval: %lf"), *(_QWORD *)&a3);
  }
  __y = 0.0;
  v5 = modf(a3, &__y);
  -[TMTime setUtc_ns:](self, "setUtc_ns:", llround(v5 * 1000000000.0) + 1000000000 * (uint64_t)__y);
}

@end
