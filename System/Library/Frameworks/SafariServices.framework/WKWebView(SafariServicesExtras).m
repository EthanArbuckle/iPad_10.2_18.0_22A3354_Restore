@implementation WKWebView(SafariServicesExtras)

- (id)_sf_effectiveViewToLayOut
{
  id v2;

  if (objc_msgSend(a1, "_isInFullscreen"))
  {
    objc_msgSend(a1, "_fullScreenPlaceholderView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)_sf_securityInfo
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "backForwardList");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sf_securityInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_sf_setSecurityInfo:()SafariServicesExtras
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "backForwardList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sf_setSecurityInfo:", v4);

}

- (id)webui_preventNavigationDuringAutoFillPrompt
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[5];
  id v7;

  objc_msgSend(a1, "_retainActiveFocusedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__WKWebView_SafariServicesExtras__webui_preventNavigationDuringAutoFillPrompt__block_invoke;
  v6[3] = &unk_1E4AC13D8;
  v6[4] = a1;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x1A8598C40](v6);

  return v4;
}

- (uint64_t)webui_privateBrowsingEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "websiteDataStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPersistent") ^ 1;

  return v3;
}

- (id)webui_presentingViewController
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "UIDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_presentingViewControllerForWebView:", a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)webui_formMetadataForLastPasswordGenerationOrSubmitEventInFrame:()SafariServicesExtras
{
  const void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v4 = (const void *)lastPasswordGenerationOrSubmitEventFrameKey;
  v5 = a3;
  objc_getAssociatedObject(a1, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v6);

  if (v8)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (void)webui_setFormMetadata:()SafariServicesExtras forLastPasswordGenerationOrSubmitEventInFrame:
{
  const void *v6;
  id value;

  v6 = (const void *)lastPasswordGenerationOrSubmitEventFrameKey;
  value = a3;
  objc_setAssociatedObject(a1, v6, a4, (void *)1);
  objc_setAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey, value, (void *)1);

}

- (void)webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:()SafariServicesExtras
{
  objc_setAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFrameKey, 0, (void *)1);
  objc_setAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey, 0, (void *)1);
}

- (id)webui_lastGeneratedPasswordForCurrentBackForwardItem
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "backForwardList");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "currentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_getAssociatedObject(v2, (const void *)lastGeneratedPasswordKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)webui_setLastGeneratedPasswordForCurrentBackForwardItem:()SafariServicesExtras
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(a1, "backForwardList");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v5, (const void *)lastGeneratedPasswordKey, v4, (void *)3);

}

- (void)_sf_applicationDidEnterBackgroundOrWillTerminate:()SafariServicesExtras
{
  void *v2;
  void *v3;
  id v4;

  objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFrameKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveUnsubmittedGeneratedPasswordInFrame:form:context:closingWebView:", v2, v4, 0, 0);

  }
}

- (void)_sf_saveUnsubmittedGeneratedPasswordAndRemoveFormMetadata
{
  void *v2;
  void *v3;
  id v4;

  objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFrameKey);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_getAssociatedObject(a1, (const void *)lastPasswordGenerationOrSubmitEventFormKey);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "saveUnsubmittedGeneratedPasswordInFrame:form:context:closingWebView:", v4, v2, 0, 1);

  }
  objc_msgSend(a1, "webui_removeFormMetadataForLastPasswordGenerationOrSubmitEventInFrame:", 0);

}

- (id)_sf_suggestedFilename
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "backForwardList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sf_explicitSuggestedFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else if (!objc_msgSend(a1, "_isDisplayingPDF")
         || (objc_msgSend(a1, "_suggestedFilenameForDisplayedPDF"), (v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = objc_alloc(MEMORY[0x1E0C92C18]);
    objc_msgSend(a1, "_committedURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_MIMEType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v7, v8, 0, 0);
    objc_msgSend(v9, "suggestedFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_filenameByFixingIllegalCharacters");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
