@implementation HMCameraClipAssetContext

- (HMCameraClipAssetContext)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMCameraClipAssetContext)initWithURL:(id)a3 expirationDate:(id)a4 requiredHTTPHeaders:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMCameraClipAssetContext *v12;
  HMCameraClipAssetContext *v13;
  uint64_t v14;
  NSDictionary *requiredHTTPHeaders;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMCameraClipAssetContext;
  v12 = -[HMCameraClipAssetContext init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_expirationDate, a4);
    v14 = objc_msgSend(v11, "copy");
    requiredHTTPHeaders = v13->_requiredHTTPHeaders;
    v13->_requiredHTTPHeaders = (NSDictionary *)v14;

  }
  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[HMCameraClipAssetContext url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipAssetContext expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraClipAssetContext requiredHTTPHeaders](self, "requiredHTTPHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ url: %@ expirationDate: %@ requiredHTTPHeaders: %@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMCameraClipAssetContext *v4;
  HMCameraClipAssetContext *v5;
  HMCameraClipAssetContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (HMCameraClipAssetContext *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMCameraClipAssetContext url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMCameraClipAssetContext url](v6, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[HMCameraClipAssetContext expirationDate](self, "expirationDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMCameraClipAssetContext expirationDate](v6, "expirationDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToDate:", v10))
        {
          -[HMCameraClipAssetContext requiredHTTPHeaders](self, "requiredHTTPHeaders");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMCameraClipAssetContext requiredHTTPHeaders](v6, "requiredHTTPHeaders");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToDictionary:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[HMCameraClipAssetContext url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMCameraClipAssetContext expirationDate](self, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMCameraClipAssetContext requiredHTTPHeaders](self, "requiredHTTPHeaders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (HMCameraClipAssetContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMCameraClipAssetContext *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCCV.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMCCV.ed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("HMCCV.rhh"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v5 && v6 && v10)
  {
    self = -[HMCameraClipAssetContext initWithURL:expirationDate:requiredHTTPHeaders:](self, "initWithURL:expirationDate:requiredHTTPHeaders:", v5, v6, v10);
    v11 = self;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMCameraClipAssetContext url](self, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMCCV.u"));

  -[HMCameraClipAssetContext expirationDate](self, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMCCV.ed"));

  -[HMCameraClipAssetContext requiredHTTPHeaders](self, "requiredHTTPHeaders");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMCCV.rhh"));

}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)requiredHTTPHeaders
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredHTTPHeaders, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
