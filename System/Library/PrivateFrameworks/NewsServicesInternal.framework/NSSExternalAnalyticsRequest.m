@implementation NSSExternalAnalyticsRequest

- (NSSExternalAnalyticsRequest)initWithURL:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  NSSExternalAnalyticsRequest *v8;
  uint64_t v9;
  NSURL *URL;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSSExternalAnalyticsRequest;
  v8 = -[NSSExternalAnalyticsRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    URL = v8->_URL;
    v8->_URL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
  }

  return v8;
}

- (NSSExternalAnalyticsRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSSExternalAnalyticsRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("URL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", CFSTR("metadata"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[NSSExternalAnalyticsRequest initWithURL:metadata:](self, "initWithURL:metadata:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NSSExternalAnalyticsRequest URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URL"));

  -[NSSExternalAnalyticsRequest metadata](self, "metadata");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("metadata"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSSExternalAnalyticsRequestMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
