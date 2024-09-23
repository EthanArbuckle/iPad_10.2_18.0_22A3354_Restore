@implementation WKPreferences(SafariServicesExtras)

- (void)sf_applySafariStorageBlockingPolicy
{
  unint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "cookieAcceptPolicy") - 1;
  if (v2 > 2)
    v3 = 0;
  else
    v3 = qword_1A3CB11B8[v2];
  objc_msgSend(a1, "_setStorageBlockingPolicy:", v3);

}

@end
