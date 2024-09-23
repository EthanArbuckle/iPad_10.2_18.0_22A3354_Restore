@implementation ASDPurgeableAppResponse

- (ASDPurgeableAppResponse)init
{
  return -[ASDPurgeableAppResponse initWithPurgeableSize:purgeableApps:](self, "initWithPurgeableSize:purgeableApps:", 0, MEMORY[0x1E0C9AA60]);
}

- (ASDPurgeableAppResponse)initWithPurgeableSize:(int64_t)a3 purgeableApps:(id)a4
{
  id v7;
  ASDPurgeableAppResponse *v8;
  ASDPurgeableAppResponse *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurgeableAppResponse;
  v8 = -[ASDPurgeableAppResponse init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_purgeableApps, a4);
    v9->_purgeableSize = a3;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSArray copyWithZone:](self->_purgeableApps, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v5[3] = self->_purgeableSize;
  objc_msgSend(v5, "setSuccess:", -[ASDRequestResponse success](self, "success"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeableAppResponse)initWithCoder:(id)a3
{
  id v4;
  ASDPurgeableAppResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *purgeableApps;

  v4 = a3;
  v5 = -[ASDPurgeableAppResponse init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("purgeableApps"));
    v9 = objc_claimAutoreleasedReturnValue();
    purgeableApps = v5->_purgeableApps;
    v5->_purgeableApps = (NSArray *)v9;

    v5->_purgeableSize = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("purgeableSize"));
    -[ASDRequestResponse setSuccess:](v5, "setSuccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[ASDPurgeableAppResponse purgeableApps](self, "purgeableApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("purgeableApps"));

  objc_msgSend(v5, "encodeInt64:forKey:", -[ASDPurgeableAppResponse purgeableSize](self, "purgeableSize"), CFSTR("purgeableSize"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ASDRequestResponse success](self, "success"), CFSTR("success"));

}

- (int64_t)purgeableSize
{
  return self->_purgeableSize;
}

- (NSArray)purgeableApps
{
  return self->_purgeableApps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeableApps, 0);
}

@end
