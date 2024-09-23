@implementation WKHTTPCookieStore(SafariServicesExtras)

- (void)sf_applySafariCookieStoragePolicy
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webui_applySafariCookieAcceptPolicy");
  objc_msgSend(a1, "_setCookieAcceptPolicy:completionHandler:", objc_msgSend(v2, "cookieAcceptPolicy"), &__block_literal_global_29);

}

@end
