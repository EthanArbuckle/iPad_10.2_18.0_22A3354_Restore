@implementation CLMiLoServiceQualityInfo

- (CLMiLoServiceQualityInfo)initWithQuality:(unint64_t)a3 andReasons:(id)a4
{
  CLMiLoServiceQualityInfo *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CLMiLoServiceQualityInfo *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CLMiLoServiceQualityInfo;
  v6 = -[CLMiLoServiceQualityInfo init](&v12, sel_init);
  v10 = v6;
  if (v6)
  {
    v6->_serviceQuality = a3;
    v6->_serviceQualityReasons = (NSArray *)objc_msgSend_copy(a4, v7, v8, v9);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMiLoServiceQualityInfo;
  -[CLMiLoServiceQualityInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (void *)objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_initWithQuality_andReasons_, self->_serviceQuality, self->_serviceQualityReasons);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoServiceQualityInfo)initWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v6 = objc_msgSend_decodeIntegerForKey_(a3, a2, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQuality"), v3);
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v12 = objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
  v14 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v13, v12, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQualityReasons"));
  return (CLMiLoServiceQualityInfo *)MEMORY[0x1E0DE7D20](self, sel_initWithQuality_andReasons_, v6, v14);
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;

  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_serviceQuality, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQuality"));
  objc_msgSend_encodeObject_forKey_(a3, v5, (uint64_t)self->_serviceQualityReasons, (uint64_t)CFSTR("kCLMiLoConnectionCodingKeyServiceQualityReasons"));
}

- (unint64_t)serviceQuality
{
  return self->_serviceQuality;
}

- (NSArray)serviceQualityReasons
{
  return self->_serviceQualityReasons;
}

@end
