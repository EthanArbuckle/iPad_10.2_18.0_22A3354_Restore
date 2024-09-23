@implementation CIAztecCodeDescriptor

- (BOOL)isValid
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;

  if ((unint64_t)(self->layerCount - 33) > 0xFFFFFFFFFFFFFFDFLL)
  {
    if ((unint64_t)(self->dataCodewordCount - 2049) > 0xFFFFFFFFFFFFF7FFLL)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    v4 = ci_logger_api();
    v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIAztecCodeDescriptor isValid].cold.2();
      goto LABEL_7;
    }
  }
  else
  {
    v2 = ci_logger_api();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIAztecCodeDescriptor isValid].cold.1();
LABEL_7:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (CIAztecCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact layerCount:(NSInteger)layerCount dataCodewordCount:(NSInteger)dataCodewordCount
{
  CIAztecCodeDescriptor *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CIAztecCodeDescriptor;
  v10 = -[CIBarcodeDescriptor init](&v12, sel_init);
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->isCompact = isCompact;
    v10->layerCount = layerCount;
    v10->dataCodewordCount = dataCodewordCount;
  }
  if (!-[CIAztecCodeDescriptor isValid](v10, "isValid"))
  {

    return 0;
  }
  return v10;
}

+ (CIAztecCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact layerCount:(NSInteger)layerCount dataCodewordCount:(NSInteger)dataCodewordCount
{
  return -[CIAztecCodeDescriptor initWithPayload:isCompact:layerCount:dataCodewordCount:]([CIAztecCodeDescriptor alloc], "initWithPayload:isCompact:layerCount:dataCodewordCount:", errorCorrectedPayload, isCompact, layerCount, dataCodewordCount);
}

- (void)dealloc
{
  NSData *errorCorrectedPayload;
  objc_super v4;

  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload)

  v4.receiver = self;
  v4.super_class = (Class)CIAztecCodeDescriptor;
  -[CIAztecCodeDescriptor dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIAztecCodeDescriptor)initWithCoder:(id)a3
{
  CIAztecCodeDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIAztecCodeDescriptor;
  v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCorrectedPayload"));
    v4->isCompact = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isCompact"));
    v4->layerCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("layerCount"));
    v4->dataCodewordCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("dataCodewordCount"));
  }
  if (!-[CIAztecCodeDescriptor isValid](v4, "isValid"))
  {

    return 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIAztecCodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->errorCorrectedPayload, CFSTR("errorCorrectedPayload"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isCompact, CFSTR("isCompact"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->layerCount, CFSTR("layerCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->dataCodewordCount, CFSTR("dataCodewordCount"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CIAztecCodeDescriptor *v5;
  void *v6;
  CIAztecCodeDescriptor *v7;

  v5 = +[CIAztecCodeDescriptor allocWithZone:](CIAztecCodeDescriptor, "allocWithZone:");
  v6 = (void *)-[NSData copyWithZone:](self->errorCorrectedPayload, "copyWithZone:", a3);
  v7 = -[CIAztecCodeDescriptor initWithPayload:isCompact:layerCount:dataCodewordCount:](v5, "initWithPayload:isCompact:layerCount:dataCodewordCount:", v6, self->isCompact, self->layerCount, self->dataCodewordCount);

  return v7;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (BOOL)isCompact
{
  return self->isCompact;
}

- (NSInteger)layerCount
{
  return self->layerCount;
}

- (NSInteger)dataCodewordCount
{
  return self->dataCodewordCount;
}

- (void)isValid
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}s %{public}@: dataCodewordCount must be in the range of [1,2048]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
