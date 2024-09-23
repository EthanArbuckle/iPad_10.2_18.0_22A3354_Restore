@implementation NDDownloadLimits

+ (NDDownloadLimits)defaultLimits
{
  if (defaultLimits_onceToken != -1)
    dispatch_once(&defaultLimits_onceToken, &__block_literal_global_2);
  return (NDDownloadLimits *)(id)defaultLimits_s_defaults;
}

void __33__NDDownloadLimits_defaultLimits__block_invoke()
{
  NDDownloadLimits *v0;
  void *v1;

  v0 = -[NDDownloadLimits initWithMinDeviceStorage:maxDownloadStorage:]([NDDownloadLimits alloc], "initWithMinDeviceStorage:maxDownloadStorage:", 2000000000, 5000000000);
  v1 = (void *)defaultLimits_s_defaults;
  defaultLimits_s_defaults = (uint64_t)v0;

}

- (NDDownloadLimits)initWithMinDeviceStorage:(int64_t)a3 maxDownloadStorage:(int64_t)a4
{
  NDDownloadLimits *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NDDownloadLimits;
  result = -[NDDownloadLimits init](&v7, sel_init);
  if (result)
  {
    result->_minDeviceStorage = a3;
    result->_maxDownloadStorage = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  FCDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (v6 = -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"), v6 == objc_msgSend(v5, "minDeviceStorage")))
  {
    v7 = -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage");
    v8 = v7 == objc_msgSend(v5, "maxDownloadStorage");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D58AB0]), "initWithObject:", self);
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("minDeviceStorage"), v4);

  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:object:", CFSTR("maxDownloadStorage"), v5);

  objc_msgSend(v3, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NDDownloadLimits)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NDDownloadLimits *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("minDeviceStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxDownloadStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NDDownloadLimits initWithMinDeviceStorage:maxDownloadStorage:](self, "initWithMinDeviceStorage:maxDownloadStorage:", objc_msgSend(v5, "unsignedLongLongValue"), objc_msgSend(v6, "unsignedLongLongValue"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithLongLong:", -[NDDownloadLimits minDeviceStorage](self, "minDeviceStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("minDeviceStorage"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[NDDownloadLimits maxDownloadStorage](self, "maxDownloadStorage"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("maxDownloadStorage"));

}

- (int64_t)minDeviceStorage
{
  return self->_minDeviceStorage;
}

- (int64_t)maxDownloadStorage
{
  return self->_maxDownloadStorage;
}

@end
