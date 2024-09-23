@implementation NSURL(NewsUI)

- (id)nu_deepLinkURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLOverrideForURL:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationsAvailableForOpeningURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
      a1 = v3;

  }
  v9 = a1;

  return v9;
}

+ (id)nu_sanitizedURLForWebView:()NewsUI navigationAction:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  objc_msgSend(v5, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  objc_msgSend(v5, "targetFrame");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isMainFrame") & 1) != 0)
  {

  }
  else
  {
    v10 = objc_msgSend(v5, "navigationType");

    v11 = v8;
    if (v10)
      goto LABEL_5;
  }
  objc_msgSend(v8, "nu_deepLinkURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  if (objc_msgSend(v11, "isEqual:", v8))
  {
    if ((objc_msgSend(a1, "nu_canHandleNavigationAction:", v5) & 1) == 0
      && objc_msgSend(v8, "isSpringboardHandledURL")
      && ((objc_msgSend(v8, "hasTelephonyScheme") & 1) != 0
       || (objc_msgSend(v8, "isFaceTimeURL") & 1) != 0
       || objc_msgSend(v8, "isFaceTimeAudioURL")))
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB49D0]), "initWithURL:", v8);
      objc_msgSend(v12, "setShowUIPrompt:", 1);
      objc_msgSend(v12, "URL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v13;
    }
    else
    {
      v13 = v8;
    }
  }
  else
  {
    v13 = v11;
  }
  v14 = v13;

  return v14;
}

- (uint64_t)nu_handleExternalURLWithPrompt
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "fc_isStoreURL"))
    goto LABEL_2;
  if ((objc_msgSend(a1, "fc_isHTTPScheme") & 1) != 0)
  {
    v4 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("about:blank"));

  v4 = 0;
  if ((v6 & 1) == 0 && v2)
  {
    if (objc_msgSend(a1, "nss_isNewsURL"))
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x24BDF7578];
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "application:openURL:options:", v7, a1, v11);

    }
    else
    {
      if ((objc_msgSend(a1, "hasTelephonyScheme") & 1) != 0
        || (objc_msgSend(a1, "isFaceTimeAudioURL") & 1) != 0
        || objc_msgSend(a1, "isFaceTimeURL"))
      {
LABEL_2:
        objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "openURL:options:completionHandler:", a1, MEMORY[0x24BDBD1B8], 0);

        v4 = 1;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationsAvailableForOpeningURL:", a1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v7, "count"))
      {
        v4 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v7, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");
      v4 = v15 != 0;

      if (v15)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __47__NSURL_NewsUI__nu_handleExternalURLWithPrompt__block_invoke;
        block[3] = &unk_24D5A1D30;
        v17 = v8;
        v18 = a1;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }

LABEL_10:
  }
LABEL_11:

  return v4;
}

@end
