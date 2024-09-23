@implementation CIPDF417CodeDescriptor

- (BOOL)isValid
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;

  if ((unint64_t)(self->rowCount - 91) > 0xFFFFFFFFFFFFFFA7)
  {
    if ((unint64_t)(self->columnCount - 31) > 0xFFFFFFFFFFFFFFE1)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    v4 = ci_logger_api();
    v3 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIPDF417CodeDescriptor isValid].cold.2();
      goto LABEL_7;
    }
  }
  else
  {
    v2 = ci_logger_api();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIPDF417CodeDescriptor isValid].cold.1();
LABEL_7:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (CIPDF417CodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount
{
  CIPDF417CodeDescriptor *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CIPDF417CodeDescriptor;
  v10 = -[CIBarcodeDescriptor init](&v12, sel_init);
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->isCompact = isCompact;
    v10->rowCount = rowCount;
    v10->columnCount = columnCount;
  }
  if (!-[CIPDF417CodeDescriptor isValid](v10, "isValid"))
  {

    return 0;
  }
  return v10;
}

+ (CIPDF417CodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload isCompact:(BOOL)isCompact rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount
{
  return -[CIPDF417CodeDescriptor initWithPayload:isCompact:rowCount:columnCount:]([CIPDF417CodeDescriptor alloc], "initWithPayload:isCompact:rowCount:columnCount:", errorCorrectedPayload, isCompact, rowCount, columnCount);
}

- (void)dealloc
{
  NSData *errorCorrectedPayload;
  objc_super v4;

  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload)

  v4.receiver = self;
  v4.super_class = (Class)CIPDF417CodeDescriptor;
  -[CIPDF417CodeDescriptor dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIPDF417CodeDescriptor)initWithCoder:(id)a3
{
  CIPDF417CodeDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIPDF417CodeDescriptor;
  v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCorrectedPayload"));
    v4->isCompact = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isCompact"));
    v4->rowCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("rowCount"));
    v4->columnCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("columnCount"));
  }
  if (!-[CIPDF417CodeDescriptor isValid](v4, "isValid"))
  {

    return 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIPDF417CodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->errorCorrectedPayload, CFSTR("errorCorrectedPayload"));
  objc_msgSend(a3, "encodeBool:forKey:", self->isCompact, CFSTR("isCompact"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->rowCount, CFSTR("rowCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->columnCount, CFSTR("columnCount"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CIPDF417CodeDescriptor *v4;
  void *v5;
  CIPDF417CodeDescriptor *v6;

  v4 = +[CIPDF417CodeDescriptor allocWithZone:](CIPDF417CodeDescriptor, "allocWithZone:", a3);
  v5 = (void *)-[NSData copy](self->errorCorrectedPayload, "copy");
  v6 = -[CIPDF417CodeDescriptor initWithPayload:isCompact:rowCount:columnCount:](v4, "initWithPayload:isCompact:rowCount:columnCount:", v5, self->isCompact, self->rowCount, self->columnCount);

  return v6;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (BOOL)isCompact
{
  return self->isCompact;
}

- (NSInteger)rowCount
{
  return self->rowCount;
}

- (NSInteger)columnCount
{
  return self->columnCount;
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
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}s %{public}@: columnCount must be in the range of [1,30]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
