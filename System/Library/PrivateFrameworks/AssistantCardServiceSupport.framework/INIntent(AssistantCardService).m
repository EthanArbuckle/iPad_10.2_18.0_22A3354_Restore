@implementation INIntent(AssistantCardService)

- (id)acs_utteranceForCardService
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a1, "launchId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(a1, "_title");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "launchId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INExtractAppInfoFromSiriLaunchId();
  v4 = 0;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");

  if ((v7 & 1) != 0)
  {
    v8 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForSystemPlaceholder:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "appState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isValid");

    if ((v11 & 1) == 0)
    {
      objc_msgSend(a1, "_title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v5 = v8;
  }
  objc_msgSend(v5, "localizedName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "_title");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ using %@"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v15;
}

@end
