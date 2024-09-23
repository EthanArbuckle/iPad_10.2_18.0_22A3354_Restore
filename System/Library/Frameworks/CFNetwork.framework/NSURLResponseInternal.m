@implementation NSURLResponseInternal

- (URLResponse)_inner
{
  return &self->_response;
}

- (NSURLResponseInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLResponseInternal;
  return -[NSURLResponseInternal init](&v3, sel_init);
}

- (id).cxx_construct
{
  self->_response._vptr$CoreLoggable = (void **)&off_1E14E56A8;
  self->_response.fMIMEType = 0;
  self->_response.fPeerAddress = 0;
  self->_response.fHTTP = 0;
  self->_response.fExpectedContentLength = -1;
  self->_response.fCreationTime = CFAbsoluteTimeGetCurrent();
  self->_response.fExpiration = 1.79769313e308;
  self->_response.fRecommendedPolicy = 0;
  *(_WORD *)&self->_response.fConnectionDidFallback = 0;
  return self;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NSURLResponseInternal;
  -[NSURLResponseInternal dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  URLResponse::~URLResponse(&self->_response);
}

@end
