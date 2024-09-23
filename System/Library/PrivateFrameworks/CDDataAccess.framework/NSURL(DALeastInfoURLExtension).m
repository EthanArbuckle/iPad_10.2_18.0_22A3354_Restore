@implementation NSURL(DALeastInfoURLExtension)

- (id)da_leastInfoStringRepresentationRelativeToParentURL:()DALeastInfoURLExtension
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v22;
  int v23;

  v4 = a3;
  objc_msgSend(a1, "scheme");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheme");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "host");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "user");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "port");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "port");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v12, "intValue");

  }
  else
  {
    v23 = objc_msgSend(MEMORY[0x1E0C99E98], "da_classicPortForScheme:", v5);
  }

  objc_msgSend(v4, "port");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v4, "port");
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "intValue");

    v5 = v14;
  }
  else
  {
    v22 = objc_msgSend(MEMORY[0x1E0C99E98], "da_classicPortForScheme:", v6);
  }

  v16 = (void *)v7;
  if (v5 | v6 && (!v6 || !objc_msgSend((id)v5, "isEqualToString:", v6))
    || v7 | v8 && (!v8 || !objc_msgSend((id)v7, "isEqualToString:", v8)))
  {
    goto LABEL_20;
  }
  if (!(v9 | v10))
  {
    if (v23 == v22)
      goto LABEL_19;
LABEL_20:
    if (!(v9 | v10))
    {
LABEL_23:
      objc_msgSend(a1, "da_urlByRemovingUsername");
      v17 = v5;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "absoluteString");
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (!v10)
    {
LABEL_25:
      objc_msgSend(a1, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
LABEL_22:
    if (objc_msgSend((id)v9, "isEqualToString:", v10))
      goto LABEL_23;
    goto LABEL_25;
  }
  if (!v10)
    goto LABEL_20;
  if (!objc_msgSend((id)v9, "isEqualToString:", v10) || v23 != v22)
    goto LABEL_22;
LABEL_19:
  objc_msgSend(a1, "absoluteURL");
  v17 = v5;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "CDVRawPath");
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  v20 = (void *)v19;

  v5 = v17;
LABEL_26:

  return v20;
}

@end
