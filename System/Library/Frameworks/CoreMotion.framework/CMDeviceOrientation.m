@implementation CMDeviceOrientation

- (CMDeviceOrientation)initWithOrientation:(int)a3 andTimestamp:(double)a4
{
  CMDeviceOrientation *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CMDeviceOrientation;
  result = -[CMLogItem initWithTimestamp:](&v6, sel_initWithTimestamp_, a4);
  if (result)
    result->fOrientation = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMDeviceOrientation)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CMDeviceOrientation *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMDeviceOrientation;
  v7 = -[CMLogItem initWithCoder:](&v9, sel_initWithCoder_);
  if (v7)
    v7->fOrientation = objc_msgSend_decodeIntForKey_(a3, v4, (uint64_t)CFSTR("kCMDeviceOrientationCodingKeyOrientation"), v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMDeviceOrientation;
  -[CMLogItem encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend_encodeInt_forKey_(a3, v5, self->fOrientation, (uint64_t)CFSTR("kCMDeviceOrientationCodingKeyOrientation"), v6);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMDeviceOrientation;
  -[CMLogItem dealloc](&v2, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CMDeviceOrientation;
  result = -[CMLogItem copyWithZone:](&v5, sel_copyWithZone_, a3);
  if (result)
    *((_DWORD *)result + 4) = self->fOrientation;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  uint64_t fOrientation;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v4);
  fOrientation = self->fOrientation;
  if (fOrientation > 6)
    v10 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)"Unexpected", v6, v7);
  else
    v10 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v5, (uint64_t)off_1E29588F0[fOrientation], v6, v7);
  v11 = v10;
  v17.receiver = self;
  v17.super_class = (Class)CMDeviceOrientation;
  -[CMLogItem timestamp](&v17, sel_timestamp);
  return (id)objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("%@ orientation %d name %@ @ %f"), v13, v14, v8, fOrientation, v11, v15);
}

- (int)orientation
{
  return self->fOrientation;
}

@end
