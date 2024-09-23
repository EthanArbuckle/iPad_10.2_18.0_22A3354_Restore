@implementation _SFDownloadCurrentPageActivity

- (_SFDownloadCurrentPageActivity)initWithWebView:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  _SFDownloadCurrentPageActivity *v11;
  _SFDownloadCurrentPageActivity *v12;
  NSObject *v13;
  objc_super v15;
  id v16;

  v5 = a3;
  v6 = *MEMORY[0x1E0CEB230];
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v6, &v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v16;
  if (!v7)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_SFDownloadCurrentPageActivity initWithWebView:].cold.1(v13, v8);
    goto LABEL_6;
  }
  objc_msgSend(v7, "_plugIn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userElection");

  if (v10 == 2)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)_SFDownloadCurrentPageActivity;
  v11 = -[UIApplicationExtensionActivity initWithApplicationExtension:](&v15, sel_initWithApplicationExtension_, v7);
  objc_storeStrong((id *)&v11->_webView, a3);
  self = v11;
  v12 = self;
LABEL_7:

  return v12;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return -[WKWebView _isDisplayingStandaloneMediaDocument](self->_webView, "_isDisplayingStandaloneMediaDocument", a3);
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  return 0;
}

- (void)performActivity
{
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webView, 0);
}

- (void)initWithWebView:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to find 'Save to Files' extension: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
