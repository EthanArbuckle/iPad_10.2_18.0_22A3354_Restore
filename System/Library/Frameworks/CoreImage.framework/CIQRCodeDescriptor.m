@implementation CIQRCodeDescriptor

- (BOOL)isValid
{
  NSObject *v2;
  _BOOL4 v3;
  unint64_t v4;
  NSObject *v5;

  if ((unint64_t)(self->symbolVersion - 41) > 0xFFFFFFFFFFFFFFD7)
  {
    v4 = self->errorCorrectionLevel - 72;
    if (v4 < 0xA && ((0x231u >> v4) & 1) != 0)
    {
      LOBYTE(v3) = 1;
      return v3;
    }
    v5 = ci_logger_api();
    v3 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIQRCodeDescriptor isValid].cold.2();
      goto LABEL_8;
    }
  }
  else
  {
    v2 = ci_logger_api();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
    if (v3)
    {
      -[CIQRCodeDescriptor isValid].cold.1();
LABEL_8:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (CIQRCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload symbolVersion:(NSInteger)symbolVersion maskPattern:(uint8_t)maskPattern errorCorrectionLevel:(CIQRCodeErrorCorrectionLevel)errorCorrectionLevel
{
  CIQRCodeDescriptor *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CIQRCodeDescriptor;
  v10 = -[CIBarcodeDescriptor init](&v12, sel_init);
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->symbolVersion = symbolVersion;
    v10->maskPattern = maskPattern;
    v10->errorCorrectionLevel = errorCorrectionLevel;
  }
  if (!-[CIQRCodeDescriptor isValid](v10, "isValid"))
  {

    return 0;
  }
  return v10;
}

+ (CIQRCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload symbolVersion:(NSInteger)symbolVersion maskPattern:(uint8_t)maskPattern errorCorrectionLevel:(CIQRCodeErrorCorrectionLevel)errorCorrectionLevel
{
  return -[CIQRCodeDescriptor initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:]([CIQRCodeDescriptor alloc], "initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", errorCorrectedPayload, symbolVersion, maskPattern, errorCorrectionLevel);
}

- (void)dealloc
{
  NSData *errorCorrectedPayload;
  objc_super v4;

  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload)

  v4.receiver = self;
  v4.super_class = (Class)CIQRCodeDescriptor;
  -[CIQRCodeDescriptor dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIQRCodeDescriptor)initWithCoder:(id)a3
{
  CIQRCodeDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIQRCodeDescriptor;
  v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCorrectedPayload"));
    v4->symbolVersion = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("symbolVersion"));
    v4->maskPattern = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("maskPattern"));
    v4->errorCorrectionLevel = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("errorCorrectionLevel"));
  }
  if (!-[CIQRCodeDescriptor isValid](v4, "isValid"))
  {

    return 0;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIQRCodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->errorCorrectedPayload, CFSTR("errorCorrectedPayload"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->symbolVersion, CFSTR("symbolVersion"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->maskPattern, CFSTR("maskPattern"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->errorCorrectionLevel, CFSTR("errorCorrectionLevel"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CIQRCodeDescriptor *v5;
  void *v6;
  CIQRCodeDescriptor *v7;

  v5 = +[CIQRCodeDescriptor allocWithZone:](CIQRCodeDescriptor, "allocWithZone:");
  v6 = (void *)-[NSData copyWithZone:](self->errorCorrectedPayload, "copyWithZone:", a3);
  v7 = -[CIQRCodeDescriptor initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:](v5, "initWithPayload:symbolVersion:maskPattern:errorCorrectionLevel:", v6, self->symbolVersion, self->maskPattern, self->errorCorrectionLevel);

  return v7;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (NSInteger)symbolVersion
{
  return self->symbolVersion;
}

- (uint8_t)maskPattern
{
  return self->maskPattern;
}

- (CIQRCodeErrorCorrectionLevel)errorCorrectionLevel
{
  return self->errorCorrectionLevel;
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
  OUTLINED_FUNCTION_1(&dword_1921E4000, v0, v1, "%{public}s %{public}@: invalid errorCorrectionLevel", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
