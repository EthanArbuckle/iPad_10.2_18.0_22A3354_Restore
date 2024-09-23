@implementation NSURL(GSExtensions)

- (id)gs_issueExtension:()GSExtensions error:
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gs_issueExtension:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)gs_issueReadExtensionIfNeededForAuditToken:()GSExtensions
{
  void *v4;
  __int128 v5;
  void *v6;
  _OWORD v8[2];

  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a3[1];
  v8[0] = *a3;
  v8[1] = v5;
  objc_msgSend(v4, "gs_issueReadExtensionIfNeededForAuditToken:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)gs_URLByUpdatingPathExtensionWithPathOrURL:()GSExtensions
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(a1, "pathExtension");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1E9772CD0;
  v8 = v7;

  objc_msgSend(v4, "pathExtension");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E9772CD0;
  v11 = v10;

  if (-[__CFString caseInsensitiveCompare:](v11, "caseInsensitiveCompare:", v8))
  {
    objc_msgSend(a1, "URLByDeletingPathExtension");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v11, "length"))
    {
      objc_msgSend(v12, "URLByAppendingPathExtension:", v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v13;
    }
  }
  else
  {
    v12 = a1;
  }

  return v12;
}

@end
