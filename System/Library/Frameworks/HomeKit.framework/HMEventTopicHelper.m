@implementation HMEventTopicHelper

+ (id)decodeTopic:(id)a3
{
  id v3;
  void *v4;
  HMParsedEventTopic *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  id v16;
  int v17;
  id v18;
  char v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  void *v28;
  int v30;
  id v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  id v37;
  int v38;
  id v39;
  char v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = -[HMParsedEventTopic initWithTopic:]([HMParsedEventTopic alloc], "initWithTopic:", v3);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v3);
  v7 = objc_msgSend(v6, "scanLocation");
  v52 = 0;
  v8 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v52);
  v9 = v52;
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("index")))
    {
      -[HMParsedEventTopic setIsIndexTopic:](v5, "setIsIndexTopic:", 1);
      if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
        goto LABEL_43;
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      v51 = 0;
      objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v51);
      v10 = v51;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("home")))
    {
      if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
        goto LABEL_42;
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      v50 = 0;
      objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v50);
      v10 = v50;
      if (!v10)
        goto LABEL_42;
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);

      v12 = (void *)v13;
    }
    if (!v12)
      goto LABEL_41;
    v14 = (void *)objc_msgSend(v12, "copy");
    -[HMParsedEventTopic setHomeUUID:](v5, "setHomeUUID:", v14);

    if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
      goto LABEL_42;
    objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);
    v7 = objc_msgSend(v6, "scanLocation");

    v49 = 0;
    v15 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v49);
    v16 = v49;
    v10 = v16;
    if (!v15 || !v16)
      goto LABEL_41;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("accessory")) & 1) == 0 && !v12)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("user")) & 1) == 0)
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("mediagroup")))
        {
          v12 = 0;
LABEL_41:
          objc_msgSend(v6, "setScanLocation:", v7);
          goto LABEL_42;
        }
        objc_msgSend(v6, "scanLocation");
        objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

        v45 = 0;
        v17 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v45);
        v18 = v45;
        v10 = v18;
        v12 = 0;
        if (!v17 || !v18)
          goto LABEL_42;
        if ((objc_msgSend(v18, "isEqualToString:", CFSTR("stereo")) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", CFSTR("psg")))
        {
          v19 = objc_msgSend(v10, "isEqualToString:", CFSTR("psg"));
          if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
          {
            objc_msgSend(v6, "scanLocation");
            objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

            v44 = 0;
            v20 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v44);
            v21 = v44;
            v10 = v21;
            v12 = 0;
            if (!v20 || !v21)
              goto LABEL_42;
            if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
            {
              v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
              v12 = v22;
              if (v22)
              {
                v23 = (void *)objc_msgSend(v22, "copy");
                v40 = v19;
                if ((v19 & 1) != 0)
                  -[HMParsedEventTopic setMediaGroupUUID:](v5, "setMediaGroupUUID:", v23);
                else
                  -[HMParsedEventTopic setMediaSystemUUID:](v5, "setMediaSystemUUID:", v23);

                v7 = objc_msgSend(v6, "scanLocation");
                objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

                v43 = 0;
                v36 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v43);
                v37 = v43;
                v10 = v37;
                if (!v36 || !objc_msgSend(v37, "isEqualToString:", CFSTR("settings")))
                  goto LABEL_41;
                if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
                  goto LABEL_42;
                objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

                v42 = 0;
                v38 = objc_msgSend(v6, "scanUpToString:intoString:", &stru_1E3AB7688, &v42);
                v39 = v42;
                v10 = v39;
                if (!v38 || !objc_msgSend(v39, "hasSuffix:", CFSTR(".updated")))
                  goto LABEL_41;
                -[NSString stringByTrimmingDots](v10);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "stringByDeletingPathExtension");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v40 & 1) != 0)
                  -[HMParsedEventTopic setMediaGroupSettingKeyPath:](v5, "setMediaGroupSettingKeyPath:", v35);
                else
                  -[HMParsedEventTopic setMediaSystemSettingKeyPath:](v5, "setMediaSystemSettingKeyPath:", v35);
                goto LABEL_55;
              }
              goto LABEL_42;
            }
          }
        }
      }
LABEL_39:
      v12 = 0;
      goto LABEL_42;
    }
    if (!v12)
    {
      if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
        goto LABEL_39;
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      v48 = 0;
      objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v48);
      v10 = v48;
      if (!v10)
        goto LABEL_39;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
      if (!v12)
        goto LABEL_42;
    }
    v24 = (void *)objc_msgSend(v12, "copy");
    -[HMParsedEventTopic setAccessoryUUID:](v5, "setAccessoryUUID:", v24);

    if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
    {
      v7 = objc_msgSend(v6, "scanLocation");
      objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

      if (!-[HMParsedEventTopic isIndexTopic](v5, "isIndexTopic"))
      {
        v47 = 0;
        v30 = objc_msgSend(v6, "scanUpToString:intoString:", CFSTR("."), &v47);
        v31 = v47;
        v10 = v31;
        if (!v30 || !v31)
          goto LABEL_42;
        if (!objc_msgSend(v31, "isEqualToString:", CFSTR("settings")))
          goto LABEL_41;
        if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
          goto LABEL_42;
        objc_msgSend(v6, "setScanLocation:", objc_msgSend(v6, "scanLocation") + 1);

        v46 = 0;
        v32 = objc_msgSend(v6, "scanUpToString:intoString:", &stru_1E3AB7688, &v46);
        v33 = v46;
        v10 = v33;
        if (!v32 || !objc_msgSend(v33, "hasSuffix:", CFSTR(".updated")))
          goto LABEL_41;
        -[NSString stringByTrimmingDots](v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringByDeletingPathExtension");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMParsedEventTopic setAccessorySettingKeyPath:](v5, "setAccessorySettingKeyPath:", v35);
LABEL_55:

        goto LABEL_41;
      }
      v10 = 0;
    }
LABEL_42:

  }
LABEL_43:
  if ((objc_msgSend(v6, "isAtEnd") & 1) != 0)
  {
    v25 = 0;
  }
  else
  {
    v41 = 0;
    v26 = objc_msgSend(v6, "scanUpToString:intoString:", &stru_1E3AB7688, &v41);
    v27 = v41;
    v25 = v27;
    if (v26)
    {
      -[NSString stringByTrimmingDots](v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMParsedEventTopic setTopicSuffix:](v5, "setTopicSuffix:", v28);

    }
  }

  objc_autoreleasePoolPop(v4);
  return v5;
}

@end
