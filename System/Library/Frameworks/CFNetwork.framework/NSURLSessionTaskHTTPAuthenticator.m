@implementation NSURLSessionTaskHTTPAuthenticator

- (NSSet)statusCodes
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

+ (NSURLSessionTaskHTTPAuthenticator)sessionTaskHTTPAuthenticatorWithContext:(id)a3 statusCodes:(id)a4
{
  NSURLSessionTaskLocalHTTPAuthenticator *v4;

  if (a3)
  {
    v4 = -[NSURLSessionTaskLocalHTTPAuthenticator initWithSessionAuthenticator:statusCodes:]([NSURLSessionTaskLocalHTTPAuthenticator alloc], "initWithSessionAuthenticator:statusCodes:", a3, a4);
  }
  else if (a4)
  {
    v4 = -[NSURLSessionTaskBackgroundHTTPAuthenticator initWithStatusCodes:]([NSURLSessionTaskBackgroundHTTPAuthenticator alloc], "initWithStatusCodes:", a4);
  }
  else
  {
    v4 = 0;
  }
  return (NSURLSessionTaskHTTPAuthenticator *)v4;
}

- (NSURLSessionTaskHTTPAuthenticator)initWithStatusCodes:(id)a3
{
  NSURLSessionTaskHTTPAuthenticator *v4;
  NSURLSessionTaskHTTPAuthenticator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSURLSessionTaskHTTPAuthenticator;
  v4 = -[NSURLSessionTaskHTTPAuthenticator init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[NSURLSessionTaskHTTPAuthenticator setStatusCodes:](v4, "setStatusCodes:", a3);
  return v5;
}

- (void)setStatusCodes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSessionTaskHTTPAuthenticator setStatusCodes:](self, "setStatusCodes:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionTaskHTTPAuthenticator;
  -[NSURLSessionTaskHTTPAuthenticator dealloc](&v3, sel_dealloc);
}

- (void)getAuthenticationHeadersForTask:(id)a3 task:(id)a4 response:(id)a5 completionHandler:(id)a6
{
  uint8_t v6[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "NSURLSessionTaskHTTPAuthenticator requires a sub class.", v6, 2u);
  }
}

@end
