@implementation AKAttestationRequestData

- (AKAttestationRequestData)initWithRequest:(id)a3 requiredHeaders:(id)a4
{
  id v6;
  id v7;
  AKAttestationRequestData *v8;
  uint64_t v9;
  NSURL *requestURL;
  void *v11;
  uint64_t v12;
  NSData *bodyDataHash;
  void *v14;
  uint64_t v15;
  NSDictionary *headers;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AKAttestationRequestData;
  v8 = -[AKAttestationRequestData init](&v18, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "URL");
    v9 = objc_claimAutoreleasedReturnValue();
    requestURL = v8->_requestURL;
    v8->_requestURL = (NSURL *)v9;

    objc_msgSend(v6, "HTTPBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ak_SHA256Data");
    v12 = objc_claimAutoreleasedReturnValue();
    bodyDataHash = v8->_bodyDataHash;
    v8->_bodyDataHash = (NSData *)v12;

    objc_msgSend(v6, "allHTTPHeaderFields");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ak_dictionaryWithKeysFromArray:", v7);
    v15 = objc_claimAutoreleasedReturnValue();
    headers = v8->_headers;
    v8->_headers = (NSDictionary *)v15;

  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSData copy](self->_bodyDataHash, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSDictionary copy](self->_headers, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAttestationRequestData)initWithCoder:(id)a3
{
  id v4;
  AKAttestationRequestData *v5;
  uint64_t v6;
  NSURL *requestURL;
  uint64_t v8;
  NSData *bodyDataHash;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *headers;

  v4 = a3;
  v5 = -[AKAttestationRequestData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestURL = v5->_requestURL;
    v5->_requestURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bodyDataHash"));
    v8 = objc_claimAutoreleasedReturnValue();
    bodyDataHash = v5->_bodyDataHash;
    v5->_bodyDataHash = (NSData *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_headers"));
    v13 = objc_claimAutoreleasedReturnValue();
    headers = v5->_headers;
    v5->_headers = (NSDictionary *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *requestURL;
  id v5;

  requestURL = self->_requestURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", requestURL, CFSTR("_requestURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bodyDataHash, CFSTR("_bodyDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headers, CFSTR("_headers"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AKAttestationRequestData: bodyHash: %@, headers: %@"), self->_bodyDataHash, self->_headers);
}

- (NSURL)requestURL
{
  return self->_requestURL;
}

- (NSData)bodyDataHash
{
  return self->_bodyDataHash;
}

- (NSDictionary)headers
{
  return self->_headers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_bodyDataHash, 0);
  objc_storeStrong((id *)&self->_requestURL, 0);
}

@end
