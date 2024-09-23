@implementation CNTracedLog

+ (id)logWithDomain:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDomain:message:", v4, &stru_1E29BCC70);

  return v5;
}

- (CNTracedLog)initWithDomain:(id)a3 message:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNTracedLog;
  return -[CNTracedLog init](&v5, sel_init, a3, a4);
}

- (CNTracedLog)init
{

  return 0;
}

- (id)resultString
{
  return 0;
}

+ (id)formatIntegerByRoundingForPrivacy:(int64_t)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "roundNumber:usingSignificantDigits:", a3, 1);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v3);
}

+ (id)formatTimeIntervalByRoundingForPrivacy:(double)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a1, "roundNumber:usingSignificantDigits:", (uint64_t)(a3 * 1000.0), 2);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v3);
}

+ (int64_t)roundNumber:(int64_t)a3 usingSignificantDigits:(unint64_t)a4
{
  int64_t v6;
  double v7;
  double v8;

  if (!a3)
    return 0;
  if (a3 >= 0)
    v6 = a3;
  else
    v6 = -a3;
  v7 = log10((double)v6);
  v8 = __exp10((double)(uint64_t)(a4 - vcvtpd_u64_f64(v7)));
  return llround((double)(uint64_t)round(v8 * (double)a3) / v8);
}

+ (BOOL)shouldLogGivenSamplePercentage:(float)a3
{
  return (float)((float)arc4random_uniform(0x2710u) / 100.0) <= a3;
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)domain
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)domainVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDomainVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)domainScope
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDomainScope:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)signature
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSignature:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)signature2
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSignature2:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)signature3
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSignature3:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)value
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSString)value2
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setValue2:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)value3
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setValue3:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)uuid
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (BOOL)summarize
{
  return self->_summarize;
}

- (void)setSummarize:(BOOL)a3
{
  self->_summarize = a3;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSDictionary)customProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCustomProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customProperties, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_value3, 0);
  objc_storeStrong((id *)&self->_value2, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_signature3, 0);
  objc_storeStrong((id *)&self->_signature2, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_domainScope, 0);
  objc_storeStrong((id *)&self->_domainVersion, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
