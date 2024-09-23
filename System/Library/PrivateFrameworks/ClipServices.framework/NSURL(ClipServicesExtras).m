@implementation NSURL(ClipServicesExtras)

+ (id)cps_resolvedURLWithStoreIconURLString:()ClipServicesExtras iconSize:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v18[0] = CFSTR("{w}");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v6;
    v18[1] = CFSTR("{h}");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v7;
    v18[2] = CFSTR("{f}");
    v18[3] = CFSTR("{c}");
    v19[2] = CFSTR("png");
    v19[3] = CFSTR("bb");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = (id)objc_msgSend(v5, "copy");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __76__NSURL_ClipServicesExtras__cps_resolvedURLWithStoreIconURLString_iconSize___block_invoke;
    v11[3] = &unk_24C3B9900;
    v11[4] = &v12;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v13[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)cps_preIngestedURLWithBundleIdentifier:()ClipServicesExtras
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("https://pre-ingested.apple.com/"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)cps_isHTTPFamilyURL
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("https")))
  {
    objc_msgSend(a1, "scheme");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "caseInsensitiveCompare:", CFSTR("http")) == 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)cps_isFileURL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "scheme");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "caseInsensitiveCompare:", CFSTR("file")) == 0;

  return v2;
}

- (id)cps_domain
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "rangeOfString:options:", CFSTR("www."), 9) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(v3, "substringFromIndex:", 4);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v4;
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v6, "lowercaseString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cps_fallbackBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("appclip.apple.com"));

  if (v5
    && (objc_msgSend(a1, "lastPathComponent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("id")),
        v6,
        !v7))
  {
    objc_msgSend(v2, "queryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "caseInsensitiveCompare:", CFSTR("p"));

      v8 = 0;
      if (!v14)
      {
        objc_msgSend(v12, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByRemovingPercentEncoding");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("."));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v17, "count") >= 3)
        {
          objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "rangeOfCharacterFromSet:", v18) == 0x7FFFFFFFFFFFFFFFLL)
            v8 = v16;
          else
            v8 = 0;

        }
        else
        {
          v8 = 0;
        }

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
