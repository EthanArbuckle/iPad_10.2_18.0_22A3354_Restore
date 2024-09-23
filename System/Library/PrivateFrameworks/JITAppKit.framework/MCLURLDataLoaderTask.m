@implementation MCLURLDataLoaderTask

- (MCLURLDataLoaderTask)initWithURLRequest:(id)a3 targetPath:(id)a4 category:(id)a5 completionHandler:(id)a6 receiveData:(id)a7
{
  MCLURLDataLoaderTask *v7;
  uint64_t v8;
  NSURLRequest *originalRequest;
  void *v10;
  id completion;
  void *v12;
  id receiveDataHandler;
  MCLURLDataLoaderTask *v15;
  objc_super v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id location[2];
  MCLURLDataLoaderTask *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v23 = 0;
  objc_storeStrong(&v23, a5);
  v22 = 0;
  objc_storeStrong(&v22, a6);
  v21 = 0;
  objc_storeStrong(&v21, a7);
  v7 = v26;
  v26 = 0;
  v20.receiver = v7;
  v20.super_class = (Class)MCLURLDataLoaderTask;
  v26 = -[MCLURLDataLoaderTask init](&v20, sel_init);
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    v8 = objc_msgSend(location[0], "copy");
    originalRequest = v26->_originalRequest;
    v26->_originalRequest = (NSURLRequest *)v8;

    objc_storeStrong((id *)&v26->_request, v26->_originalRequest);
    objc_storeStrong((id *)&v26->_category, v23);
    objc_storeStrong((id *)&v26->_targetPath, v24);
    v10 = _Block_copy(v22);
    completion = v26->_completion;
    v26->_completion = v10;

    v12 = _Block_copy(v21);
    receiveDataHandler = v26->_receiveDataHandler;
    v26->_receiveDataHandler = v12;

  }
  v15 = v26;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v15;
}

- (NSURL)URL
{
  return -[NSURLRequest URL](self->_request, "URL", a2, self);
}

- (BOOL)download
{
  return self->_targetPath != 0;
}

- (BOOL)responseOk
{
  BOOL v3;
  NSInteger v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return -[NSHTTPURLResponse expectedContentLength](self->_response, "expectedContentLength") != 0;
  v4 = -[NSHTTPURLResponse statusCode](self->_response, "statusCode") / 100;
  v3 = 1;
  if (v4 != 2)
    return v4 == 3;
  return v3;
}

- (BOOL)responseClientError
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSHTTPURLResponse statusCode](self->_response, "statusCode") / 100 == 4;
  else
    return -[NSHTTPURLResponse expectedContentLength](self->_response, "expectedContentLength") == 0;
}

- (BOOL)responseTimeout
{
  NSString *v3;
  BOOL v4;

  v3 = -[NSError domain](self->_error, "domain");
  v4 = 0;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", *MEMORY[0x24BDD1308]))
    v4 = -[NSError code](self->_error, "code") == -1001;

  return v4;
}

- (id)description
{
  void *v3;
  NSString *v4;
  NSURL *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v5 = -[NSURLRequest URL](self->_request, "URL");
  v4 = -[NSURL absoluteString](v5, "absoluteString");
  v6 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, self->_category);

  return v6;
}

- (id)completion
{
  return _Block_copy(self->_completion);
}

- (void)setRequest:(id)a3
{
  uint64_t v3;
  NSURLRequest *request;
  id location[2];
  MCLURLDataLoaderTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  request = v6->_request;
  v6->_request = (NSURLRequest *)v3;

  objc_storeStrong(location, 0);
}

- (void)setResponse:(id)a3
{
  uint64_t v3;
  NSHTTPURLResponse *response;
  id location[2];
  MCLURLDataLoaderTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  response = v6->_response;
  v6->_response = (NSHTTPURLResponse *)v3;

  objc_storeStrong(location, 0);
}

- (void)setResponseData:(id)a3
{
  id location[2];
  MCLURLDataLoaderTask *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_responseData, location[0]);
  objc_storeStrong(location, 0);
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void)setCachedResponse:(BOOL)a3
{
  self->_cachedResponse = a3;
}

- (void)setCategory:(id)a3
{
  uint64_t v3;
  NSString *category;
  id location[2];
  MCLURLDataLoaderTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  category = v6->_category;
  v6->_category = (NSString *)v3;

  objc_storeStrong(location, 0);
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (void)dispatchCompletion:(id)a3
{
  double v3;
  id completion;
  id location[2];
  MCLURLDataLoaderTask *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_error, location[0]);
  if (v6->_completion)
  {
    (*((void (**)(void))v6->_completion + 2))();
    completion = v6->_completion;
    v6->_completion = 0;

  }
  if (!location[0])
  {
    LODWORD(v3) = 1.0;
    -[MCLURLDataLoaderTask setProgress:](v6, "setProgress:", v3);
  }
  objc_storeStrong(location, 0);
}

- (id)receiveDataHandler
{
  return _Block_copy(self->_receiveDataHandler);
}

- (id)contentType
{
  NSDictionary *v3;
  id v4;
  id v5[2];
  MCLURLDataLoaderTask *v6;
  id v7;

  v6 = self;
  v5[1] = (id)a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[NSHTTPURLResponse allHeaderFields](v6->_response, "allHeaderFields");
    v5[0] = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("Content-Type"));

    v4 = (id)objc_msgSend(v5[0], "componentsSeparatedByString:", CFSTR(";"));
    v7 = (id)objc_msgSend(v4, "firstObject");

    objc_storeStrong(v5, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)applyMimeType
{
  id v2;
  id v3[2];
  MCLURLDataLoaderTask *v4;

  v4 = self;
  v3[1] = (id)a2;
  if (-[NSString hasSuffix:](self->_targetPath, "hasSuffix:", CFSTR("[content_type]")))
  {
    v2 = -[MCLURLDataLoaderTask contentType](v4, "contentType");
    v3[0] = +[MCLURLDataLoader fileExtensionForMimeType:](MCLURLDataLoader, "fileExtensionForMimeType:");

    -[MCLURLDataLoaderTask applyFileExtension:](v4, "applyFileExtension:", v3[0]);
    objc_storeStrong(v3, 0);
  }
}

- (void)applyFileExtension:(id)a3
{
  NSString *v3;
  NSString *targetPath;
  NSString *v5;
  id location[2];
  MCLURLDataLoaderTask *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[NSString stringByDeletingPathExtension](v7->_targetPath, "stringByDeletingPathExtension");
  v3 = -[NSString stringByAppendingPathExtension:](v5, "stringByAppendingPathExtension:", location[0]);
  targetPath = v7->_targetPath;
  v7->_targetPath = v3;

  objc_storeStrong(location, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id location[2];
  MCLURLDataLoaderTask *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "encodeObject:forKey:", v4->_category, CFSTR("category"));
  objc_msgSend(location[0], "encodeObject:forKey:", v4->_originalRequest, CFSTR("request"));
  objc_msgSend(location[0], "encodeObject:forKey:", v4->_targetPath, CFSTR("targetPath"));
  objc_msgSend(location[0], "encodeObject:forKey:", v4->_userInfo, CFSTR("userInfo"));
  objc_storeStrong(location, 0);
}

- (MCLURLDataLoaderTask)initWithCoder:(id)a3
{
  MCLURLDataLoaderTask *v3;
  MCLURLDataLoaderTask *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id location[2];
  MCLURLDataLoaderTask *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = (id)objc_msgSend(location[0], "decodeObjectForKey:", CFSTR("category"));
  v8 = (id)objc_msgSend(location[0], "decodeObjectForKey:", CFSTR("request"));
  v7 = (id)objc_msgSend(location[0], "decodeObjectForKey:", CFSTR("targetPath"));
  v3 = v11;
  v11 = 0;
  v11 = -[MCLURLDataLoaderTask initWithURLRequest:targetPath:category:completionHandler:receiveData:](v3, "initWithURLRequest:targetPath:category:completionHandler:receiveData:", v8, v7, v9, 0);
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    v6 = (id)objc_msgSend(location[0], "decodeObjectForKey:", CFSTR("userInfo"));
    -[MCLURLDataLoaderTask setUserInfo:](v11, "setUserInfo:");

  }
  v5 = v11;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v5;
}

- (NSString)category
{
  return self->_category;
}

- (NSURLRequest)originalRequest
{
  return self->_originalRequest;
}

- (NSURLRequest)request
{
  return self->_request;
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (NSString)targetPath
{
  return self->_targetPath;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (NSData)responseData
{
  return &self->_responseData->super;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (BOOL)cachedResponse
{
  return self->_cachedResponse;
}

- (BOOL)background
{
  return self->_background;
}

- (float)progress
{
  return self->_progress;
}

- (NSError)error
{
  return self->_error;
}

- (id)redirectHandler
{
  return self->_redirectHandler;
}

- (void)setRedirectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_redirectHandler, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_targetPath, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong(&self->_receiveDataHandler, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
