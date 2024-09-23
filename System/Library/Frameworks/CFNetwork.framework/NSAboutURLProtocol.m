@implementation NSAboutURLProtocol

+ (BOOL)canInitWithRequest:(id)a3
{
  uint8_t v5[16];

  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }
  return objc_msgSend(a3, "_URLHasScheme:", CFSTR("about"));
}

+ (id)canonicalRequestForRequest:(id)a3
{
  uint8_t v5[16];

  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", v5, 2u);
  }
  return a3;
}

- (void)startLoading
{
  id v3;
  NSURLResponse *v4;

  v3 = -[NSURLProtocol client](self, "client");
  v4 = -[NSURLResponse initWithURL:MIMEType:expectedContentLength:textEncodingName:]([NSURLResponse alloc], "initWithURL:MIMEType:expectedContentLength:textEncodingName:", -[NSURLRequest URL](-[NSURLProtocol request](self, "request"), "URL"), CFSTR("text/html"), 0, 0);
  objc_msgSend(v3, "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v4, 2);

  objc_msgSend(v3, "URLProtocolDidFinishLoading:", self);
}

@end
