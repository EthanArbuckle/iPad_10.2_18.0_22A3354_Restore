@implementation AuthCodeHttpRequest

- (AuthCodeHttpRequest)initWithBaseURL:(id)a3 clientID:(id)a4 redirectURI:(id)a5
{
  AuthCodeHttpRequest *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AuthCodeHttpRequest;
  result = -[AuthCodeHttpRequest init](&v9, "init");
  if (result)
  {
    result->_baseURL = (NSURL *)a3;
    result->_clientID = (NSString *)a4;
    result->_redirectURI = (NSString *)a5;
    result->_iccid = 0;
  }
  return result;
}

- (AuthCodeHttpRequest)initWithBaseURL:(id)a3 clientID:(id)a4
{
  return -[AuthCodeHttpRequest initWithBaseURL:clientID:redirectURI:](self, "initWithBaseURL:clientID:redirectURI:", a3, a4, CFSTR("carrierspaceauth://"));
}

- (NSURL)url
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[0] = CFSTR("response_type=code");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("client_id=%@"), self->_clientID));
  v17[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("redirect_uri=%@"), self->_redirectURI));
  v17[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v5));
  if (self->_iccid)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iccid=%@"), self->_iccid));
    objc_msgSend(v6, "addObject:", v7);

  }
  if (self->_scope)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("scope=%@"), self->_scope));
    objc_msgSend(v6, "addObject:", v8);

  }
  if (self->_state)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("state=%@"), self->_state));
    objc_msgSend(v6, "addObject:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR("&")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet URLQueryAllowedCharacterSet](NSCharacterSet, "URLQueryAllowedCharacterSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAddingPercentEncodingWithAllowedCharacters:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_baseURL, "absoluteString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@?%@"), v13, v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v14));
  return (NSURL *)v15;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  self->_baseURL = (NSURL *)a3;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  self->_clientID = (NSString *)a3;
}

- (NSString)redirectURI
{
  return self->_redirectURI;
}

- (void)setRedirectURI:(id)a3
{
  self->_redirectURI = (NSString *)a3;
}

- (NSString)iccid
{
  return self->_iccid;
}

- (void)setIccid:(id)a3
{
  self->_iccid = (NSString *)a3;
}

- (NSString)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  self->_scope = (NSString *)a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  self->_state = (NSString *)a3;
}

@end
