@implementation ATXTimeEventSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXTimeEventSource)initWithType:(int64_t)a3
{
  return -[ATXTimeEventSource initWithType:bundleId:url:](self, "initWithType:bundleId:url:", a3, 0, 0);
}

- (ATXTimeEventSource)initWithType:(int64_t)a3 bundleId:(id)a4 url:(id)a5
{
  id v8;
  id v9;
  ATXTimeEventSource *v10;
  ATXTimeEventSource *v11;
  uint64_t v12;
  NSString *bundleId;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXTimeEventSource;
  v10 = -[ATXTimeEventSource init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    bundleId = v11->_bundleId;
    v11->_bundleId = (NSString *)v12;

    objc_storeStrong((id *)&v11->_url, a5);
  }

  return v11;
}

- (ATXTimeEventSource)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  ATXTimeEventSource *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sourceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ATXTimeEventSource initWithType:bundleId:url:](self, "initWithType:bundleId:url:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXTimeEventSource type](self, "type"), CFSTR("sourceType"));
  -[ATXTimeEventSource bundleId](self, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleId"));

  -[ATXTimeEventSource url](self, "url");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("url"));

}

- (int64_t)type
{
  return self->_type;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
