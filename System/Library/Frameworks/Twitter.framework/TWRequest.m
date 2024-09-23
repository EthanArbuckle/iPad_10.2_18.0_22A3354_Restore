@implementation TWRequest

- (id)initWithURL:(NSURL *)url parameters:(NSDictionary *)parameters requestMethod:(TWRequestMethod)requestMethod
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TWRequest;
  return -[TWRequest init](&v6, sel_init, url, parameters, requestMethod);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TWRequest;
  -[TWRequest dealloc](&v2, sel_dealloc);
}

- (TWRequestMethod)requestMethod
{
  return 1;
}

- (NSURL)URL
{
  return 0;
}

- (NSDictionary)parameters
{
  return 0;
}

- (ACAccount)account
{
  return 0;
}

- (NSURLRequest)signedURLRequest
{
  return 0;
}

@end
