@implementation AMSEngagementSyncRequest

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AMSEngagementSyncRequest apps](self, "apps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("kCodingKeyApps"));

  -[AMSEngagementSyncRequest context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("kCodingKeyContext"));

  -[AMSEngagementSyncRequest logKey](self, "logKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("kCodingKeyLogKey"));

  -[AMSEngagementSyncRequest origin](self, "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("kCodingKeyOrigin"));

  -[AMSEngagementSyncRequest timeout](self, "timeout");
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("kCodingKeyTimeout"));

}

- (AMSEngagementSyncRequest)initWithCoder:(id)a3
{
  id v4;
  AMSEngagementSyncRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *apps;
  void *v11;
  uint64_t v12;
  NSDictionary *context;
  uint64_t v14;
  NSString *logKey;
  uint64_t v16;
  NSString *origin;
  double v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSEngagementSyncRequest;
  v5 = -[AMSEngagementSyncRequest init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCodingKeyApps"));
    v9 = objc_claimAutoreleasedReturnValue();
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E60], "ams_PLISTClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kCodingKeyContext"));
    v12 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (NSDictionary *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyLogKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    logKey = v5->_logKey;
    v5->_logKey = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyOrigin"));
    v16 = objc_claimAutoreleasedReturnValue();
    origin = v5->_origin;
    v5->_origin = (NSString *)v16;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCodingKeyTimeout"));
    v5->_timeout = v18;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)archiveClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_storeStrong((id *)&self->_apps, a3);
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (NSString)logKey
{
  return self->_logKey;
}

- (void)setLogKey:(id)a3
{
  objc_storeStrong((id *)&self->_logKey, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
