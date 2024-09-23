@implementation WKNavigationAction(SafariServicesExtras)

- (uint64_t)_wk_shouldAskAboutInsecureFormSubmission
{
  void *v2;
  void *v3;
  char v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (objc_msgSend(a1, "navigationType") != 1)
    return 0;
  objc_msgSend(a1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "HTTPMethod");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("GET"));

  if ((v4 & 1) != 0)
    return 0;
  objc_msgSend(a1, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("http"));

  return v9;
}

@end
