@implementation NSHTTPCookie2StorageFilter

- (NSHTTPCookie2StorageFilter)init
{
  NSHTTPCookie2StorageFilter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSHTTPCookie2StorageFilter;
  result = -[NSHTTPCookie2StorageFilter init](&v3, sel_init);
  if (result)
    result->_isTrusted = 1;
  return result;
}

- (BOOL)isTrusted
{
  NSString *urlScheme;
  BOOL v4;

  urlScheme = self->_urlScheme;
  if (urlScheme && !self->_isTrustedCached)
  {
    v4 = 1;
    self->_isTrustedCached = 1;
    if (-[NSString caseInsensitiveCompare:](urlScheme, "caseInsensitiveCompare:", CFSTR("https")))
      v4 = -[NSString caseInsensitiveCompare:](self->_urlScheme, "caseInsensitiveCompare:", CFSTR("wss")) == NSOrderedSame;
    self->_isTrusted = v4;
  }
  return self->_isTrusted;
}

- (void)setUrl:(id)a3
{
  id v5;
  NSString *v6;
  NSString *urlScheme;
  id v8;

  v5 = a3;
  if (v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_url, a3);
    objc_msgSend(v8, "scheme");
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    urlScheme = self->_urlScheme;
    self->_urlScheme = v6;

    v5 = v8;
  }

}

- (NSURL)url
{
  return self->_url;
}

- (NSURL)mainDocumentURL
{
  return self->_mainDocumentURL;
}

- (void)setMainDocumentURL:(id)a3
{
  objc_storeStrong((id *)&self->_mainDocumentURL, a3);
}

- (NSURL)siteForCookies
{
  return self->_siteForCookies;
}

- (void)setSiteForCookies:(id)a3
{
  objc_storeStrong((id *)&self->_siteForCookies, a3);
}

- (NSString)partition
{
  return self->_partition;
}

- (void)setPartition:(id)a3
{
  objc_storeStrong((id *)&self->_partition, a3);
}

- (BOOL)isTopLevelNavigation
{
  return self->_isTopLevelNavigation;
}

- (void)setIsTopLevelNavigation:(BOOL)a3
{
  self->_isTopLevelNavigation = a3;
}

- (BOOL)isSafe
{
  return self->_isSafe;
}

- (void)setIsSafe:(BOOL)a3
{
  self->_isSafe = a3;
}

- (BOOL)overwriteHTTPOnlyCookies
{
  return self->_overwriteHTTPOnlyCookies;
}

- (void)setOverwriteHTTPOnlyCookies:(BOOL)a3
{
  self->_overwriteHTTPOnlyCookies = a3;
}

- (unint64_t)acceptPolicy
{
  return self->_acceptPolicy;
}

- (void)setAcceptPolicy:(unint64_t)a3
{
  self->_acceptPolicy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_partition, 0);
  objc_storeStrong((id *)&self->_siteForCookies, 0);
  objc_storeStrong((id *)&self->_mainDocumentURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_urlScheme, 0);
}

@end
