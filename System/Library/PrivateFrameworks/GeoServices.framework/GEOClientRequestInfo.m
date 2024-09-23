@implementation GEOClientRequestInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOClientRequestInfo)init
{
  GEOClientRequestInfo *v2;
  uint64_t v3;
  NSMutableDictionary *requests;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOClientRequestInfo;
  v2 = -[GEOClientRequestInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GEOClientRequestInfo *v4;
  uint64_t v5;
  NSMutableDictionary *requests;

  v4 = objc_alloc_init(GEOClientRequestInfo);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:copyItems:", self->_requests, 1);
  requests = v4->_requests;
  v4->_requests = (NSMutableDictionary *)v5;

  return v4;
}

- (GEOClientRequestInfo)initWithCoder:(id)a3
{
  id v4;
  GEOClientRequestInfo *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *requests;
  uint64_t v10;
  NSMutableDictionary *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOClientRequestInfo;
  v5 = -[GEOClientRequestInfo init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("requests"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    requests = v5->_requests;
    v5->_requests = (NSMutableDictionary *)v8;

    if (!v5->_requests)
    {
      v10 = objc_opt_new();
      v11 = v5->_requests;
      v5->_requests = (NSMutableDictionary *)v10;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_requests, CFSTR("requests"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
