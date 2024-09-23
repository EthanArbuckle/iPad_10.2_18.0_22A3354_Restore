@implementation _SFWebViewUsageMonitor

- (_SFWebViewUsageMonitor)initWithHostAppIdentifier:(id)a3
{
  id v4;
  _SFWebViewUsageMonitor *v5;
  uint64_t v6;
  NSString *hostAppIdentifier;
  _SFWebViewUsageMonitor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFWebViewUsageMonitor;
  v5 = -[_SFWebViewUsageMonitor init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hostAppIdentifier = v5->_hostAppIdentifier;
    v5->_hostAppIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)shouldAudit
{
  return !-[_SFWebViewUsageMonitor userInteracted](self, "userInteracted")
      && -[_SFWebViewUsageMonitor urlHasQueryString](self, "urlHasQueryString")
      || -[_SFWebViewUsageMonitor urlHasIDFA](self, "urlHasIDFA");
}

- (NSString)stringAsAuditKey
{
  unsigned __int16 v3;
  _BOOL4 v4;
  unsigned __int16 v5;

  v3 = -[_SFWebViewUsageMonitor urlHasIDFA](self, "urlHasIDFA");
  if (-[_SFWebViewUsageMonitor urlHasQueryString](self, "urlHasQueryString"))
    v3 |= 2u;
  if (!-[_SFWebViewUsageMonitor userInteracted](self, "userInteracted"))
    v3 |= 4u;
  v4 = -[_SFWebViewUsageMonitor viewControllerViewIsHidden](self, "viewControllerViewIsHidden");
  v5 = v3 | 8;
  if (!v4)
    v5 = v3;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariViewService.WebViewUsage.%X.%@"), v5, self->_hostAppIdentifier);
}

- (void)auditUsageIfNeeded
{
  NSObject *v3;
  NSString *hostAppIdentifier;
  NSObject *v5;
  void *v6;
  int v7;
  NSString *v8;
  __int16 v9;
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[_SFWebViewUsageMonitor shouldAudit](self, "shouldAudit"))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXUserTrackingDetection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      hostAppIdentifier = self->_hostAppIdentifier;
      v5 = v3;
      v7 = 138544386;
      v8 = hostAppIdentifier;
      v9 = 1024;
      v10 = -[_SFWebViewUsageMonitor urlHasIDFA](self, "urlHasIDFA");
      v11 = 1024;
      v12 = -[_SFWebViewUsageMonitor urlHasQueryString](self, "urlHasQueryString");
      v13 = 1024;
      v14 = -[_SFWebViewUsageMonitor userInteracted](self, "userInteracted");
      v15 = 1024;
      v16 = -[_SFWebViewUsageMonitor viewControllerViewIsHidden](self, "viewControllerViewIsHidden");
      _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_DEFAULT, "Found possible user tracking in app (%{public}@). Details: [hasIDFA: %d, hasQueryString: %d, userInteracted: %d, viewIsHidden: %d]", (uint8_t *)&v7, 0x24u);

    }
    objc_msgSend(MEMORY[0x1E0D8A758], "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didDetectPossibleUserTrackingInHostApp:urlHasIDFA:urlHasQueryString:userInteracted:viewControllerIsHidden:", self->_hostAppIdentifier, -[_SFWebViewUsageMonitor urlHasIDFA](self, "urlHasIDFA"), -[_SFWebViewUsageMonitor urlHasQueryString](self, "urlHasQueryString"), -[_SFWebViewUsageMonitor userInteracted](self, "userInteracted"), -[_SFWebViewUsageMonitor viewControllerViewIsHidden](self, "viewControllerViewIsHidden"));

  }
}

- (void)checkURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(MEMORY[0x1E0CA5878], "instancesRespondToSelector:", sel_urlContainsDeviceIdentifierForAdvertising_))
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_originalDataAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFWebViewUsageMonitor setUrlHasIDFA:](self, "setUrlHasIDFA:", objc_msgSend(v4, "urlContainsDeviceIdentifierForAdvertising:", v5));

  }
  objc_msgSend(v7, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "length") >= 5)
    -[_SFWebViewUsageMonitor setUrlHasQueryString:](self, "setUrlHasQueryString:", 1);

}

- (BOOL)userInteracted
{
  return self->_userInteracted;
}

- (void)setUserInteracted:(BOOL)a3
{
  self->_userInteracted = a3;
}

- (BOOL)urlHasQueryString
{
  return self->_urlHasQueryString;
}

- (void)setUrlHasQueryString:(BOOL)a3
{
  self->_urlHasQueryString = a3;
}

- (BOOL)urlHasIDFA
{
  return self->_urlHasIDFA;
}

- (void)setUrlHasIDFA:(BOOL)a3
{
  self->_urlHasIDFA = a3;
}

- (BOOL)viewControllerViewIsHidden
{
  return self->_viewControllerViewIsHidden;
}

- (void)setViewControllerViewIsHidden:(BOOL)a3
{
  self->_viewControllerViewIsHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostAppIdentifier, 0);
}

@end
