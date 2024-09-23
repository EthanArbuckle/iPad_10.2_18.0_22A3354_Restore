@implementation DESUploadTransport

- (DESUploadTransport)initWithPolicy:(id)a3 recipe:(id)a4
{
  DESUploadTransport *v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = 0;
  if (a3 && a4)
  {
    v7 = a3;
    if (objc_msgSend(a4, "transportIsDedisco"))
    {
      v8 = objc_msgSend(v7, "dediscoReturnRouteEnabled");
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v9 = objc_msgSend(v7, "originReturnRouteEnabled");
      v10 = objc_msgSend(v7, "parsecReturnRouteEnabled");
      v8 = 0;
    }
    objc_msgSend(v7, "postbackBaseURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[DESUploadTransport initWithDediscoRoute:originRoute:parsecRoute:postBackBaseURL:](self, "initWithDediscoRoute:originRoute:parsecRoute:postBackBaseURL:", v8, v9, v10, v11);
    v5 = self;
  }

  return v5;
}

- (DESUploadTransport)initWithDediscoRoute:(BOOL)a3 originRoute:(BOOL)a4 parsecRoute:(BOOL)a5 postBackBaseURL:(id)a6
{
  _BOOL4 v9;
  id v11;
  DESUploadTransport *v12;
  DESUploadTransport *v13;
  DESUploadTransport *v14;
  objc_super v16;

  v9 = a3;
  v11 = a6;
  if (a4 || a5 || v9)
  {
    v16.receiver = self;
    v16.super_class = (Class)DESUploadTransport;
    v13 = -[DESUploadTransport init](&v16, sel_init);
    v14 = v13;
    if (v13)
    {
      v13->_dediscoRoute = v9;
      v13->_originRoute = a4;
      v13->_parsecRoute = a5;
      objc_storeStrong((id *)&v13->_postBackBaseURL, a6);
    }
    self = v14;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[DESUploadTransport originRoute](self, "originRoute");
  v7 = -[DESUploadTransport parsecRoute](self, "parsecRoute");
  v8 = -[DESUploadTransport dediscoRoute](self, "dediscoRoute");
  -[DESUploadTransport postBackBaseURL](self, "postBackBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(origin=%d, parsec=%d, dedisco=%d, %@)"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *postBackBaseURL;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", self->_dediscoRoute, CFSTR("dediscoRoute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_originRoute, CFSTR("originRoute"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_parsecRoute, CFSTR("parsecRoute"));
  postBackBaseURL = self->_postBackBaseURL;
  if (postBackBaseURL)
    objc_msgSend(v5, "encodeObject:forKey:", postBackBaseURL, CFSTR("postBackBaseURL"));

}

- (DESUploadTransport)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  DESUploadTransport *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dediscoRoute"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("originRoute"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("parsecRoute"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("postBackBaseURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[DESUploadTransport initWithDediscoRoute:originRoute:parsecRoute:postBackBaseURL:](self, "initWithDediscoRoute:originRoute:parsecRoute:postBackBaseURL:", v5, v6, v7, v8);
  return v9;
}

- (BOOL)originRoute
{
  return self->_originRoute;
}

- (BOOL)parsecRoute
{
  return self->_parsecRoute;
}

- (BOOL)dediscoRoute
{
  return self->_dediscoRoute;
}

- (NSURL)postBackBaseURL
{
  return self->_postBackBaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postBackBaseURL, 0);
}

@end
