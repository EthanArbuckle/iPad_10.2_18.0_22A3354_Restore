@implementation CIDataMatrixCodeDescriptor

- (CIDataMatrixCodeDescriptor)initWithPayload:(NSData *)errorCorrectedPayload rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount eccVersion:(CIDataMatrixCodeECCVersion)eccVersion
{
  CIDataMatrixCodeDescriptor *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CIDataMatrixCodeDescriptor;
  v10 = -[CIBarcodeDescriptor init](&v12, sel_init);
  if (v10)
  {
    v10->errorCorrectedPayload = errorCorrectedPayload;
    v10->rowCount = rowCount;
    v10->columnCount = columnCount;
    v10->eccVersion = eccVersion;
  }
  return v10;
}

+ (CIDataMatrixCodeDescriptor)descriptorWithPayload:(NSData *)errorCorrectedPayload rowCount:(NSInteger)rowCount columnCount:(NSInteger)columnCount eccVersion:(CIDataMatrixCodeECCVersion)eccVersion
{
  return -[CIDataMatrixCodeDescriptor initWithPayload:rowCount:columnCount:eccVersion:]([CIDataMatrixCodeDescriptor alloc], "initWithPayload:rowCount:columnCount:eccVersion:", errorCorrectedPayload, rowCount, columnCount, eccVersion);
}

- (void)dealloc
{
  NSData *errorCorrectedPayload;
  objc_super v4;

  errorCorrectedPayload = self->errorCorrectedPayload;
  if (errorCorrectedPayload)

  v4.receiver = self;
  v4.super_class = (Class)CIDataMatrixCodeDescriptor;
  -[CIDataMatrixCodeDescriptor dealloc](&v4, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CIDataMatrixCodeDescriptor)initWithCoder:(id)a3
{
  CIDataMatrixCodeDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CIDataMatrixCodeDescriptor;
  v4 = -[CIBarcodeDescriptor initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->errorCorrectedPayload = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorCorrectedPayload"));
    v4->rowCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("rowCount"));
    v4->columnCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("columnCount"));
    v4->eccVersion = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("eccVersion"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CIDataMatrixCodeDescriptor;
  -[CIBarcodeDescriptor encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->errorCorrectedPayload, CFSTR("errorCorrectedPayload"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->rowCount, CFSTR("rowCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->columnCount, CFSTR("columnCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->eccVersion, CFSTR("eccVersion"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  CIDataMatrixCodeDescriptor *v4;
  void *v5;
  CIDataMatrixCodeDescriptor *v6;

  v4 = +[CIDataMatrixCodeDescriptor allocWithZone:](CIDataMatrixCodeDescriptor, "allocWithZone:", a3);
  v5 = (void *)-[NSData copy](self->errorCorrectedPayload, "copy");
  v6 = -[CIDataMatrixCodeDescriptor initWithPayload:rowCount:columnCount:eccVersion:](v4, "initWithPayload:rowCount:columnCount:eccVersion:", v5, self->rowCount, self->columnCount, self->eccVersion);

  return v6;
}

- (NSData)errorCorrectedPayload
{
  return self->errorCorrectedPayload;
}

- (NSInteger)rowCount
{
  return self->rowCount;
}

- (NSInteger)columnCount
{
  return self->columnCount;
}

- (CIDataMatrixCodeECCVersion)eccVersion
{
  return self->eccVersion;
}

@end
