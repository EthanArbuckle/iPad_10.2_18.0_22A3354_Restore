@implementation GTCaptureArchiveOverrideKey

- (void)encodeWithCoder:(id)a3
{
  NSString *platform;
  id v5;

  platform = self->_platform;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", platform, CFSTR("platform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_riaGeneration, CFSTR("riaGeneration"));

}

- (GTCaptureArchiveOverrideKey)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  GTCaptureArchiveOverrideKey *v6;
  id v7;
  uint64_t v8;
  NSString *platform;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSNumber *riaGeneration;
  GTCaptureArchiveOverrideKey *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTCaptureArchiveOverrideKey;
  v6 = -[GTCaptureArchiveOverrideKey init](&v16, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("platform"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    platform = v6->_platform;
    v6->_platform = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v10), CFSTR("riaGeneration"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    riaGeneration = v6->_riaGeneration;
    v6->_riaGeneration = (NSNumber *)v12;

    v14 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GTCaptureArchiveOverrideKey *v4;

  v4 = objc_alloc_init(GTCaptureArchiveOverrideKey);
  -[GTCaptureArchiveOverrideKey setPlatform:](v4, "setPlatform:", self->_platform);
  -[GTCaptureArchiveOverrideKey setRiaGeneration:](v4, "setRiaGeneration:", self->_riaGeneration);
  return v4;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_platform, "hash");
  return (unint64_t)-[NSNumber hash](self->_riaGeneration, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString *v9;
  NSString *platform;
  unsigned __int8 v11;
  NSNumber *v12;
  void *v13;

  v5 = a3;
  v7 = objc_opt_class(GTCaptureArchiveOverrideKey, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platform"));
    platform = self->_platform;
    if (v9 == platform
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "platform")),
          objc_msgSend(v3, "isEqualToString:", self->_platform)))
    {
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "riaGeneration"));
      if (v12 == self->_riaGeneration)
      {
        v11 = 1;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "riaGeneration"));
        v11 = objc_msgSend(v13, "isEqualToNumber:", self->_riaGeneration);

      }
      if (v9 == platform)
        goto LABEL_11;
    }
    else
    {
      v11 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)riaGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRiaGeneration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_riaGeneration, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
