@implementation WKFrameInfo(SafariServicesExtras)

- (id)_sf_titleForJavaScriptDialog
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "securityOrigin");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v1, "protocol");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_webkit_decodeHostName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@"), v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v1, "port"))
      objc_msgSend(v7, "appendFormat:", CFSTR(":%ld"), objc_msgSend(v1, "port"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
