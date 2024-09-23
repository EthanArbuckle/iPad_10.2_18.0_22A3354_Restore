@implementation EMMessageRepositoryRemoteContentURLInfo

- (EMMessageRepositoryRemoteContentURLInfo)initWithURL:(id)a3 requestCount:(unint64_t)a4 lastSeen:(id)a5 lastRequested:(id)a6
{
  id v10;
  id v11;
  id v12;
  EMMessageRepositoryRemoteContentURLInfo *v13;
  EMMessageRepositoryRemoteContentURLInfo *v14;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)EMMessageRepositoryRemoteContentURLInfo;
  v13 = -[EMMessageRepositoryRemoteContentURLInfo init](&v16, sel_init);
  v14 = v13;
  if (v13)
    -[EMMessageRepositoryRemoteContentURLInfo _commonInitWithURL:requestCount:lastSeen:lastRequested:](v13, "_commonInitWithURL:requestCount:lastSeen:lastRequested:", v10, a4, v11, v12);

  return v14;
}

- (void)_commonInitWithURL:(id)a3 requestCount:(unint64_t)a4 lastSeen:(id)a5 lastRequested:(id)a6
{
  NSURL *v10;
  NSDate *v11;
  NSDate *v12;
  NSURL *url;
  NSDate *lastSeen;
  NSDate *v15;
  NSDate *lastRequested;
  NSURL *v17;

  v10 = (NSURL *)a3;
  v11 = (NSDate *)a5;
  v12 = (NSDate *)a6;
  url = self->_url;
  self->_url = v10;
  v17 = v10;

  lastSeen = self->_lastSeen;
  self->_requestCount = a4;
  self->_lastSeen = v11;
  v15 = v11;

  lastRequested = self->_lastRequested;
  self->_lastRequested = v12;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageRepositoryRemoteContentURLInfo)initWithCoder:(id)a3
{
  id v4;
  EMMessageRepositoryRemoteContentURLInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageRepositoryRemoteContentURLInfo;
  v5 = -[EMMessageRepositoryRemoteContentURLInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_requestCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_lastSeen"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_lastRequested"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMMessageRepositoryRemoteContentURLInfo _commonInitWithURL:requestCount:lastSeen:lastRequested:](v5, "_commonInitWithURL:requestCount:lastSeen:lastRequested:", v6, v7, v8, v9);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EMMessageRepositoryRemoteContentURLInfo url](self, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_url"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[EMMessageRepositoryRemoteContentURLInfo requestCount](self, "requestCount"), CFSTR("EFPropertyKey_requestCount"));
  -[EMMessageRepositoryRemoteContentURLInfo lastSeen](self, "lastSeen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_lastSeen"));

  -[EMMessageRepositoryRemoteContentURLInfo lastRequested](self, "lastRequested");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_lastRequested"));

}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (NSDate)lastSeen
{
  return self->_lastSeen;
}

- (NSDate)lastRequested
{
  return self->_lastRequested;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRequested, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
