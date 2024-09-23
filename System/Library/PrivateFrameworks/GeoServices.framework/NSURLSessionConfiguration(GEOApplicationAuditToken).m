@implementation NSURLSessionConfiguration(GEOApplicationAuditToken)

- (uint64_t)geo_hasApplicationAttribution:()GEOApplicationAuditToken
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "backingTokenData");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proxiedBundleId");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6 && objc_msgSend(v4, "isProxiedExternalBundleId"))
  {
    v7 = (id)*MEMORY[0x1E0C92BC0];
  }
  else
  {
    objc_msgSend(v4, "_secondaryIdentifier");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(a1, "_sourceApplicationAuditTokenData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v5)
    {
      objc_msgSend(a1, "_sourceApplicationAuditTokenData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend((id)v5, "isEqualToData:", v10);
      goto LABEL_11;
    }
LABEL_15:
    v16 = 0;
    goto LABEL_18;
  }
  objc_msgSend(a1, "_sourceApplicationBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (!(v6 | v5))
      goto LABEL_12;
    goto LABEL_15;
  }
  if (!v6)
    goto LABEL_15;
  objc_msgSend(a1, "_sourceApplicationBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)v6, "isEqualToString:", v10);
LABEL_11:
  v13 = v11;

  if ((v13 & 1) == 0)
    goto LABEL_15;
LABEL_12:
  objc_msgSend(a1, "_sourceApplicationSecondaryIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 == v14)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(a1, "_sourceApplicationSecondaryIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "isEqualToString:", v15);

  }
LABEL_18:

  return v16;
}

- (void)geo_setApplicationAttribution:()GEOApplicationAuditToken
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "proxiedBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "proxiedBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:", v5);

    if (objc_msgSend(v10, "isProxiedExternalBundleId"))
      objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:", *MEMORY[0x1E0C92BC0]);
  }
  else
  {
    objc_msgSend(v10, "backingTokenData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "set_sourceApplicationAuditTokenData:", v6);

  }
  objc_msgSend(a1, "_sourceApplicationSecondaryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_8;
  objc_msgSend(v10, "_secondaryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8)
  {
    objc_msgSend(v10, "_secondaryIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "set_sourceApplicationSecondaryIdentifier:", v7);
LABEL_8:

    v9 = v10;
  }

}

@end
