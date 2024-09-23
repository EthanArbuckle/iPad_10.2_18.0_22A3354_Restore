@implementation WFWKWebViewCapturer

- (WFWKWebViewCapturer)initWithSize:(CGSize)a3 configuration:(id)a4 coercionOptions:(id)a5
{
  double height;
  double width;
  id v10;
  id v11;
  WFWKWebViewCapturer *v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  uint64_t v17;
  WKWebView *webView;
  WFWKWebViewCapturer *v19;
  void *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  height = a3.height;
  width = a3.width;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFWKWebViewCapturer.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("coercionOptions"));

  }
  v22.receiver = self;
  v22.super_class = (Class)WFWKWebViewCapturer;
  v12 = -[WFWKWebViewCapturer init](&v22, sel_init);
  if (v12)
  {
    if (!v10)
    {
      v28 = 0;
      v29 = &v28;
      v30 = 0x2050000000;
      v13 = (void *)getWKWebViewConfigurationClass_softClass_12401;
      v31 = getWKWebViewConfigurationClass_softClass_12401;
      if (!getWKWebViewConfigurationClass_softClass_12401)
      {
        v23 = MEMORY[0x24BDAC760];
        v24 = 3221225472;
        v25 = __getWKWebViewConfigurationClass_block_invoke_12402;
        v26 = &unk_24C4E3118;
        v27 = &v28;
        __getWKWebViewConfigurationClass_block_invoke_12402((uint64_t)&v23);
        v13 = (void *)v29[3];
      }
      v14 = objc_retainAutorelease(v13);
      _Block_object_dispose(&v28, 8);
      v10 = (id)objc_opt_new();
    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v15 = (void *)getWKWebViewClass_softClass_12403;
    v31 = getWKWebViewClass_softClass_12403;
    if (!getWKWebViewClass_softClass_12403)
    {
      v23 = MEMORY[0x24BDAC760];
      v24 = 3221225472;
      v25 = __getWKWebViewClass_block_invoke_12404;
      v26 = &unk_24C4E3118;
      v27 = &v28;
      __getWKWebViewClass_block_invoke_12404((uint64_t)&v23);
      v15 = (void *)v29[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v28, 8);
    v17 = objc_msgSend([v16 alloc], "initWithFrame:configuration:", v10, 0.0, 0.0, width, height);
    webView = v12->_webView;
    v12->_webView = (WKWebView *)v17;

    -[WKWebView setNavigationDelegate:](v12->_webView, "setNavigationDelegate:", v12);
    objc_storeStrong((id *)&v12->_coercionOptions, a5);
    *(_WORD *)&v12->_didAttemptToLoadRemoteResources = 0;
    v12->_didPresentSmartPrompt = 0;
    v19 = v12;
  }

  return v12;
}

- (void)loadWebResource:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  WFWKWebViewCapturer *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]";
    v34 = 2112;
    v35 = v6;
    _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_DEFAULT, "%s WFWKWebViewCapturer is loading resource: %@", buf, 0x16u);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "file");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "fileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDBCF48];
      NSHomeDirectory();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fileURLWithPath:isDirectory:", v14, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "wf_isContainedByDirectoryAtURL:", v15);

      if ((v16 & 1) != 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      v10 = (void *)objc_msgSend(v9, "copy");
      +[WFWebResource webResourceWithFile:](WFWebResource, "webResourceWithFile:", v10);
      v11 = v6;
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_8;
  }
LABEL_9:
  -[WFWKWebViewCapturer setCompletionHandler:](self, "setCompletionHandler:", v7);
  -[WFWKWebViewCapturer setWebResource:](self, "setWebResource:", v6);
  v17 = -[WFWKWebViewCapturer userDidAllowLoadingExternalResources](self, "userDidAllowLoadingExternalResources");
  getWFSecurityLogObject();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
  if (v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]";
      _os_log_impl(&dword_20BBAD000, v18, OS_LOG_TYPE_DEBUG, "%s User allowed loading external resources, removing content block list.", buf, 0xCu);
    }

    -[WFWKWebViewCapturer webView](self, "webView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userContentController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAllContentRuleLists");

    -[WFWKWebViewCapturer webView](self, "webView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadInWKWebView:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWKWebViewCapturer setPageNavigation:](self, "setPageNavigation:", v24);

  }
  else
  {
    if (v19)
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]";
      _os_log_impl(&dword_20BBAD000, v18, OS_LOG_TYPE_DEBUG, "%s User didn't yet allow loading external resources, preventing it.", buf, 0xCu);
    }

    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __57__WFWKWebViewCapturer_loadWebResource_completionHandler___block_invoke;
    v29 = &unk_24C4DFCF8;
    v30 = self;
    v31 = v6;
    -[WFWKWebViewCapturer generateBlockingContentRuleListWithCompletionHandler:](self, "generateBlockingContentRuleListWithCompletionHandler:", &v26);

  }
  -[WFWKWebViewCapturer webView](self, "webView", v26, v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v25, &loadWebResource_completionHandler__WFWKWebViewCapturer, self, (void *)1);

}

- (void)generateBlockingContentRuleListWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(id, _QWORD, id);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE buf[24];
  void *v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, id))a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", &unk_24C512458, 0, &v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (v6)
  {
    getWFSecurityLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFWKWebViewCapturer generateBlockingContentRuleListWithCompletionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_FAULT, "%s Failed to serialize JSON content rule list: %@", buf, 0x16u);
    }

    v4[2](v4, 0, v6);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFTemporaryFileManager createTemporaryDirectoryWithFilename:](WFTemporaryFileManager, "createTemporaryDirectoryWithFilename:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2050000000;
      v12 = (void *)getWKContentRuleListStoreClass_softClass;
      v22 = getWKContentRuleListStoreClass_softClass;
      v13 = MEMORY[0x24BDAC760];
      if (!getWKContentRuleListStoreClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x24BDAC760];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getWKContentRuleListStoreClass_block_invoke;
        v24 = &unk_24C4E3118;
        v25 = &v19;
        __getWKContentRuleListStoreClass_block_invoke((uint64_t)buf);
        v12 = (void *)v20[3];
      }
      v14 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v19, 8);
      objc_msgSend(v14, "storeWithURL:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v13;
      v16[1] = 3221225472;
      v16[2] = __76__WFWKWebViewCapturer_generateBlockingContentRuleListWithCompletionHandler___block_invoke;
      v16[3] = &unk_24C4DFD20;
      v17 = v4;
      objc_msgSend(v15, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", CFSTR("com.apple.ContentKit.WFWKWebViewCapturerContentRuleList"), v8, v16);

    }
    else
    {
      -[WFWKWebViewCapturer errorWithErrorCode:](self, "errorWithErrorCode:", 1000);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v15);
    }

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v7 = a4;
  -[WFWKWebViewCapturer pageNavigation](self, "pageNavigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    v10 = dispatch_time(0, 200000000);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__WFWKWebViewCapturer_webView_didFinishNavigation___block_invoke;
    v11[3] = &unk_24C4E05E0;
    v11[4] = self;
    v12 = v6;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], v11);

  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a5;
  v7 = a4;
  -[WFWKWebViewCapturer pageNavigation](self, "pageNavigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  v10 = v13;
  if (v9)
  {
    -[WFWKWebViewCapturer completionHandler](self, "completionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFWKWebViewCapturer completionHandler](self, "completionHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v13);

    }
    -[WFWKWebViewCapturer setCompletionHandler:](self, "setCompletionHandler:", 0);
    -[WFWKWebViewCapturer setWebView:](self, "setWebView:", 0);
    v10 = v13;
  }

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a5;
  v7 = a4;
  -[WFWKWebViewCapturer pageNavigation](self, "pageNavigation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  v10 = v13;
  if (v9)
  {
    -[WFWKWebViewCapturer completionHandler](self, "completionHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[WFWKWebViewCapturer completionHandler](self, "completionHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v12)[2](v12, 0, v13);

    }
    -[WFWKWebViewCapturer setCompletionHandler:](self, "setCompletionHandler:", 0);
    -[WFWKWebViewCapturer setWebView:](self, "setWebView:", 0);
    v10 = v13;
  }

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
}

- (void)_webView:(id)a3 contentRuleListWithIdentifier:(id)a4 performedAction:(id)a5 forURL:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  WFWKWebViewCapturer *v25;
  id v26;
  _QWORD aBlock[5];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a6;
  if (!-[WFWKWebViewCapturer didPresentSmartPrompt](self, "didPresentSmartPrompt"))
  {
    if (-[WFWKWebViewCapturer userDidAllowLoadingExternalResources](self, "userDidAllowLoadingExternalResources"))
    {
      getWFSecurityLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]";
        _os_log_impl(&dword_20BBAD000, v10, OS_LOG_TYPE_DEBUG, "%s Ignoring WebKit content blocker delegate call because the user has already provided authorization to load external resources.", buf, 0xCu);
      }
LABEL_16:

      goto LABEL_17;
    }
    if (objc_msgSend(v8, "blockedLoad"))
    {
      -[WFWKWebViewCapturer coercionOptions](self, "coercionOptions");
      v10 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject shouldContinueLoadingWebContentIfExternalResourcesAreDenied](v10, "shouldContinueLoadingWebContentIfExternalResourcesAreDenied"))
      {
        getWFSecurityLogObject();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]";
          _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_DEBUG, "%s Ignoring WebKit content blocker delegate call because the coercion options specify that we should load web content anyway (may result in lossy output).", buf, 0xCu);
        }

      }
      else
      {
        -[WFWKWebViewCapturer setDidAttemptToLoadRemoteResources:](self, "setDidAttemptToLoadRemoteResources:", 1);
        v12 = MEMORY[0x24BDAC760];
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 3221225472;
        aBlock[2] = __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke;
        aBlock[3] = &unk_24C4E2198;
        aBlock[4] = self;
        v13 = _Block_copy(aBlock);
        objc_msgSend(v9, "host");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        getWFSecurityLogObject();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v29 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]";
          v30 = 2112;
          v31 = v14;
          _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_DEBUG, "%s WFWKWebViewCapturer prevented loading of external resource at %@, using coercion options to request permission to load.", buf, 0x16u);
        }

        -[WFWKWebViewCapturer setDidPresentSmartPrompt:](self, "setDidPresentSmartPrompt:", 1);
        -[WFWKWebViewCapturer setPageNavigation:](self, "setPageNavigation:", 0);
        -[NSObject permissionRequestor](v10, "permissionRequestor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWKWebViewCapturer webView](self, "webView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "URL");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        v23[0] = v12;
        v23[1] = 3221225472;
        if (v18)
          v20 = (id)v18;
        else
          v20 = v9;
        v23[2] = __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_86;
        v23[3] = &unk_24C4DFD48;
        v24 = v14;
        v25 = self;
        v26 = v13;
        v21 = v13;
        v22 = v14;
        objc_msgSend(v16, "requestUserConsentToLoadWebContentAtURL:completionHandler:", v20, v23);

      }
      goto LABEL_16;
    }
  }
LABEL_17:

}

- (id)errorWithErrorCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("The web content could not be loaded because an internal error occurred."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("WFWKWebViewCapturerErrorDomain"), a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (void)setWebView:(id)a3
{
  objc_storeStrong((id *)&self->_webView, a3);
}

- (WKNavigation)pageNavigation
{
  return self->_pageNavigation;
}

- (void)setPageNavigation:(id)a3
{
  objc_storeStrong((id *)&self->_pageNavigation, a3);
}

- (WFWebResource)webResource
{
  return self->_webResource;
}

- (void)setWebResource:(id)a3
{
  objc_storeStrong((id *)&self->_webResource, a3);
}

- (WFCoercionOptions)coercionOptions
{
  return self->_coercionOptions;
}

- (void)setCoercionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_coercionOptions, a3);
}

- (BOOL)didAttemptToLoadRemoteResources
{
  return self->_didAttemptToLoadRemoteResources;
}

- (void)setDidAttemptToLoadRemoteResources:(BOOL)a3
{
  self->_didAttemptToLoadRemoteResources = a3;
}

- (BOOL)userDidAllowLoadingExternalResources
{
  return self->_userDidAllowLoadingExternalResources;
}

- (void)setUserDidAllowLoadingExternalResources:(BOOL)a3
{
  self->_userDidAllowLoadingExternalResources = a3;
}

- (BOOL)didPresentSmartPrompt
{
  return self->_didPresentSmartPrompt;
}

- (void)setDidPresentSmartPrompt:(BOOL)a3
{
  self->_didPresentSmartPrompt = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_coercionOptions, 0);
  objc_storeStrong((id *)&self->_webResource, 0);
  objc_storeStrong((id *)&self->_pageNavigation, 0);
  objc_storeStrong((id *)&self->_webView, 0);
}

void __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  getWFSecurityLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]_block_invoke";
    _os_log_impl(&dword_20BBAD000, v2, OS_LOG_TYPE_DEBUG, "%s User authorized loading external resources, reloading with no content list", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopLoading");

  objc_msgSend(*(id *)(a1 + 32), "setUserDidAllowLoadingExternalResources:", 1);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_85;
  block[3] = &unk_24C4E2198;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_86(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    getWFSecurityLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v12 = 136315651;
      v13 = "-[WFWKWebViewCapturer _webView:contentRuleListWithIdentifier:performedAction:forURL:]_block_invoke";
      v14 = 2113;
      v15 = v7;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_INFO, "%s User denied loading external resource at %{private}@ with error %@, bailing out.", (uint8_t *)&v12, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setUserDidAllowLoadingExternalResources:", 0);
    objc_msgSend(*(id *)(a1 + 40), "webView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopLoading");

    objc_msgSend(*(id *)(a1 + 40), "completionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "completionHandler");
      v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "deniedExternalResourcesLoadError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v11);

    }
  }

}

void __85__WFWKWebViewCapturer__webView_contentRuleListWithIdentifier_performedAction_forURL___block_invoke_85(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "webResource");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadWebResource:completionHandler:", v4, v3);

}

void __51__WFWKWebViewCapturer_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    if (objc_msgSend(*(id *)(a1 + 32), "didAttemptToLoadRemoteResources"))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "userDidAllowLoadingExternalResources");

      if ((v4 & 1) == 0)
        return;
    }
    else
    {

    }
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(_QWORD *)(a1 + 40), 0);

    objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
  }
}

void __76__WFWKWebViewCapturer_generateBlockingContentRuleListWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void (*v6)(void);
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    getWFSecurityLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v7 = 136315394;
      v8 = "-[WFWKWebViewCapturer generateBlockingContentRuleListWithCompletionHandler:]_block_invoke";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_20BBAD000, v5, OS_LOG_TYPE_FAULT, "%s Failed to create content rule list: %@", (uint8_t *)&v7, 0x16u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v6();

}

void __57__WFWKWebViewCapturer_loadWebResource_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "webView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userContentController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addContentRuleList:", v5);

    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "webView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loadInWKWebView:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPageNavigation:", v12);

  }
  else
  {
    getWFWorkflowExecutionLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315394;
      v17 = "-[WFWKWebViewCapturer loadWebResource:completionHandler:]_block_invoke";
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create content rule list: %@", (uint8_t *)&v16, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "errorWithErrorCode:", 1001);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v14)[2](v14, 0, v15);

  }
}

+ (void)loadWebResource:(id)a3 withSize:(CGSize)a4 configuration:(id)a5 coercionOptions:(id)a6 completionHandler:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void (**v22)(_QWORD);
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  CGFloat v31;
  CGFloat v32;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __96__WFWKWebViewCapturer_loadWebResource_withSize_configuration_coercionOptions_completionHandler___block_invoke;
  v26 = &unk_24C4DFCD0;
  v31 = width;
  v32 = height;
  v16 = v13;
  v27 = v16;
  v17 = v14;
  v28 = v17;
  v18 = v12;
  v29 = v18;
  v19 = v15;
  v30 = v19;
  v20 = _Block_copy(&v23);
  v21 = (void *)MEMORY[0x24BDD17F0];
  v22 = v20;
  if (objc_msgSend(v21, "isMainThread", v23, v24, v25, v26))
    v22[2](v22);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v22);

}

+ (id)deniedExternalResourcesLoadError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("The web content could not be loaded because your privacy settings do not allow this shortcut to load external web content. You can change this in the Privacy tab of the shortcut's settings."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFWKWebViewCapturerErrorDomain"), 1002, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __96__WFWKWebViewCapturer_loadWebResource_withSize_configuration_coercionOptions_completionHandler___block_invoke(uint64_t a1)
{
  WFWKWebViewCapturer *v2;

  v2 = -[WFWKWebViewCapturer initWithSize:configuration:coercionOptions:]([WFWKWebViewCapturer alloc], "initWithSize:configuration:coercionOptions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  -[WFWKWebViewCapturer loadWebResource:completionHandler:](v2, "loadWebResource:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

@end
