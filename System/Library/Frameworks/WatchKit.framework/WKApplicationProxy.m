@implementation WKApplicationProxy

- (WKApplicationProxy)initWithBundleURL:(id)a3
{
  NSURL *v4;
  WKApplicationProxy *v5;
  NSURL *bundleURL;
  objc_super v8;

  v4 = (NSURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WKApplicationProxy;
  v5 = -[WKApplicationProxy init](&v8, sel_init);
  bundleURL = v5->_bundleURL;
  v5->_bundleURL = v4;

  return v5;
}

+ (id)applicationsForContainerProxy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WKApplicationProxy *v24;
  void *v25;
  void *v26;
  WKApplicationProxy *v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  unsigned __int8 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v34 = 0;
  objc_msgSend(v4, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Watch"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v34);
  v9 = v34;

  if ((_DWORD)v6)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "plugInKitPlugins");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = v11;
      v29 = a1;
      v13 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v31 != v13)
            objc_enumerationMutation(v23);
          v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v15, "protocol");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.watchkit"));

          if (v17)
          {
            objc_msgSend(v15, "bundleURL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "gizmoAppBundleUrlWithPluginUrl:", v26);
            v24 = (WKApplicationProxy *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v27 = -[WKApplicationProxy initWithBundleURL:]([WKApplicationProxy alloc], "initWithBundleURL:", v24);
              objc_msgSend(MEMORY[0x24BDBCEB8], "array");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v27);

            }
            else
            {
              v25 = 0;
            }
            goto LABEL_21;
          }
        }
        v12 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v12)
          continue;
        break;
      }
    }
    goto LABEL_17;
  }
  v18 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v4, "bundleURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingPathComponent:", CFSTR("Watch"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fileURLWithPath:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "watchAppBundleUrlWithContainerUrl:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_17:
    v25 = 0;
    goto LABEL_22;
  }
  v24 = -[WKApplicationProxy initWithBundleURL:]([WKApplicationProxy alloc], "initWithBundleURL:", v23);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addObject:", v24);
LABEL_21:

LABEL_22:
  return v25;
}

+ (id)watchAppBundleUrlWithContainerUrl:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)MEMORY[0x2199E89C8]();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.app'"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filteredArrayUsingPredicate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v3, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v14;
}

+ (id)gizmoAppBundleUrlWithPluginUrl:(id)a3
{
  id v3;
  void *v4;
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

  v3 = a3;
  v4 = (void *)MEMORY[0x2199E89C8]();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("self ENDSWITH '.app'"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filteredArrayUsingPredicate:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v3, "pathComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    objc_msgSend(v11, "componentsJoinedByString:", CFSTR("/"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v14;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
