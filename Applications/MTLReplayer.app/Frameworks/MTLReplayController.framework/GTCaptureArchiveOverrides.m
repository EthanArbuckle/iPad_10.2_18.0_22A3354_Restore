@implementation GTCaptureArchiveOverrides

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_filenameOverrides, CFSTR("filenameOverrides"));
}

- (GTCaptureArchiveOverrides)init
{
  GTCaptureArchiveOverrides *v2;
  NSDictionary *v3;
  NSDictionary *filenameOverrides;
  GTCaptureArchiveOverrides *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTCaptureArchiveOverrides;
  v2 = -[GTCaptureArchiveOverrides init](&v7, "init");
  if (v2)
  {
    v3 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    filenameOverrides = v2->_filenameOverrides;
    v2->_filenameOverrides = v3;

    v5 = v2;
  }

  return v2;
}

- (GTCaptureArchiveOverrides)initWithCoder:(id)a3
{
  id v4;
  GTCaptureArchiveOverrides *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *filenameOverrides;
  GTCaptureArchiveOverrides *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GTCaptureArchiveOverrides;
  v5 = -[GTCaptureArchiveOverrides init](&v11, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allowedClasses"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("filenameOverrides")));
    filenameOverrides = v5->_filenameOverrides;
    v5->_filenameOverrides = (NSDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (NSDictionary)filenameOverrides
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFilenameOverrides:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filenameOverrides, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedClasses
{
  if (allowedClasses_onceToken != -1)
    dispatch_once(&allowedClasses_onceToken, &__block_literal_global_8502);
  return (id)allowedClasses_allowedClasses;
}

void __43__GTCaptureArchiveOverrides_allowedClasses__block_invoke(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSSet *v6;
  uint64_t v7;
  void *v8;

  v1 = objc_opt_class(GTCaptureArchiveOverrides);
  v2 = objc_opt_class(GTCaptureArchiveOverrideKey);
  v3 = objc_opt_class(GTCaptureArchiveFilenameOverride);
  v4 = objc_opt_class(NSDictionary);
  v5 = objc_opt_class(NSString);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(NSNumber), 0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)allowedClasses_allowedClasses;
  allowedClasses_allowedClasses = v7;

}

@end
