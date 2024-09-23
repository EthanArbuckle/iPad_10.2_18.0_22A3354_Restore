@implementation DMFFetchOSUpdateStatusResultObject

- (DMFFetchOSUpdateStatusResultObject)initWithProductKey:(id)a3 status:(unint64_t)a4 downloadPercentComplete:(double)a5
{
  id v8;
  DMFFetchOSUpdateStatusResultObject *v9;
  uint64_t v10;
  NSString *productKey;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchOSUpdateStatusResultObject;
  v9 = -[CATTaskResultObject init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    productKey = v9->_productKey;
    v9->_productKey = (NSString *)v10;

    v9->_status = a4;
    v9->_downloadPercentComplete = a5;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchOSUpdateStatusResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchOSUpdateStatusResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *productKey;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchOSUpdateStatusResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("productKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    productKey = v5->_productKey;
    v5->_productKey = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_status = objc_msgSend(v9, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("downloadPercentComplete"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_downloadPercentComplete = v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFFetchOSUpdateStatusResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[DMFFetchOSUpdateStatusResultObject productKey](self, "productKey", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("productKey"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchOSUpdateStatusResultObject status](self, "status"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("status"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[DMFFetchOSUpdateStatusResultObject downloadPercentComplete](self, "downloadPercentComplete");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("downloadPercentComplete"));

}

+ (id)descriptionForStatus:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("idle");
  if (a3 == 1)
    v3 = CFSTR("downloading");
  if (a3 == 2)
    return CFSTR("installing");
  else
    return (id)v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  double v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@:%p {\n"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFFetchOSUpdateStatusResultObject productKey](self, "productKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("None");
  if (v4)
    v6 = (const __CFString *)v4;
  objc_msgSend(v3, "appendFormat:", CFSTR("\tProduct Key               : “%@”\n"), v6);

  objc_msgSend((id)objc_opt_class(), "descriptionForStatus:", -[DMFFetchOSUpdateStatusResultObject status](self, "status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\tStatus                    : %@\n"), v7);

  -[DMFFetchOSUpdateStatusResultObject downloadPercentComplete](self, "downloadPercentComplete");
  objc_msgSend(v3, "appendFormat:", CFSTR("\tDownload Percent Complete : %.0f%%\n"), v8 * 100.0);
  objc_msgSend(v3, "appendString:", CFSTR("}>"));
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (NSString)productKey
{
  return self->_productKey;
}

- (void)setProductKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (double)downloadPercentComplete
{
  return self->_downloadPercentComplete;
}

- (void)setDownloadPercentComplete:(double)a3
{
  self->_downloadPercentComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productKey, 0);
}

@end
