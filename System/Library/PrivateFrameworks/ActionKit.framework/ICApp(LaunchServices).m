@implementation ICApp(LaunchServices)

- (void)initWithApplicationProxy:()LaunchServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForInfoDictionaryKey:ofClass:", CFSTR("CFBundleURLTypes"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_25036);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "claimedDocumentContentTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CFBundleURLSchemes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_new();
    objc_msgSend(v4, "localizedName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "localizedName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("Name"));

    }
    if (v12)
    {
      v21 = *MEMORY[0x24BEC39D8];
      v22 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("URLSchemes"));

    }
    if (v9)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("DocumentTypes"));
    objc_msgSend(v4, "applicationIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (void *)objc_msgSend(a1, "initWithIdentifier:definition:", v18, v13);

    if (a1)
    {
      objc_setAssociatedObject(a1, sel_applicationProxy, v4, (void *)1);
      v19 = a1;
    }

    v5 = a1;
  }

  return v5;
}

- (id)applicationProxy
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_getAssociatedObject(a1, sel_applicationProxy);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (void *)MEMORY[0x24BDC1538];
    objc_msgSend(a1, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationProxyForIdentifier:", v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v2, "appState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInstalled"))
    v6 = v2;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)appWithIdentifier:()LaunchServices name:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appWithIdentifier:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "definition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v10 = v10;
      v12 = v10;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isInstalled");

    if (v16)
      v12 = (void *)objc_msgSend([a1 alloc], "initWithApplicationProxy:", v13);
    else
      v12 = 0;
LABEL_10:

    goto LABEL_11;
  }
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "apps");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filteredArrayForKey:value:", CFSTR("localizedShortName"), v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

@end
