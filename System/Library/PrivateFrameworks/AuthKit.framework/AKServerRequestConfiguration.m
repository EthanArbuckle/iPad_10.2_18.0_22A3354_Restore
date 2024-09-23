@implementation AKServerRequestConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKServerRequestConfiguration)initWithCoder:(id)a3
{
  id v4;
  AKServerRequestConfiguration *v5;
  uint64_t v6;
  NSURLRequest *request;
  uint64_t v8;
  AKAppleIDServerResourceLoadDelegate *resourceLoadDelegate;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *whitelistedPathURLs;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AKServerRequestConfiguration;
  v5 = -[AKServerRequestConfiguration init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_request"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (NSURLRequest *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resourceLoadDelegate"));
    v8 = objc_claimAutoreleasedReturnValue();
    resourceLoadDelegate = v5->_resourceLoadDelegate;
    v5->_resourceLoadDelegate = (AKAppleIDServerResourceLoadDelegate *)v8;

    v5->_requestType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_requestType"));
    v5->_presentationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_presentationType"));
    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_whitelistedRedirectURLs"));
    v13 = objc_claimAutoreleasedReturnValue();
    whitelistedPathURLs = v5->_whitelistedPathURLs;
    v5->_whitelistedPathURLs = (NSArray *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURLRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", request, CFSTR("_request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceLoadDelegate, CFSTR("_resourceLoadDelegate"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestType, CFSTR("_requestType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_presentationType, CFSTR("_presentationType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_whitelistedPathURLs, CFSTR("_whitelistedRedirectURLs"));

}

- (AKServerRequestConfiguration)initWithRequest:(id)a3 requestType:(unint64_t)a4
{
  id v7;
  AKServerRequestConfiguration *v8;
  AKServerRequestConfiguration *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKServerRequestConfiguration;
  v8 = -[AKServerRequestConfiguration init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_requestType = a4;
    objc_storeStrong((id *)&v8->_request, a3);
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p \n{\n request: %@\n delegate: %@\n requestType: %lu\n presentationType: %lu \n}>"), v5, self, self->_request, self->_resourceLoadDelegate, self->_requestType, self->_presentationType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (AKAppleIDServerResourceLoadDelegate)resourceLoadDelegate
{
  return self->_resourceLoadDelegate;
}

- (void)setResourceLoadDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_resourceLoadDelegate, a3);
}

- (unint64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(unint64_t)a3
{
  self->_requestType = a3;
}

- (unint64_t)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(unint64_t)a3
{
  self->_presentationType = a3;
}

- (NSArray)whitelistedPathURLs
{
  return self->_whitelistedPathURLs;
}

- (void)setWhitelistedPathURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedPathURLs, 0);
  objc_storeStrong((id *)&self->_resourceLoadDelegate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
