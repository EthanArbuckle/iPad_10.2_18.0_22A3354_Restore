@implementation IRAnalyticsUtilities

+ (int64_t)getRedactedBundleID:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqual:", CFSTR("com.apple.Music")) & 1) != 0)
    {
      v5 = 1;
    }
    else if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.tv")) & 1) != 0)
    {
      v5 = 2;
    }
    else if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.music.classical")) & 1) != 0)
    {
      v5 = 3;
    }
    else if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.mobilesafari")) & 1) != 0)
    {
      v5 = 4;
    }
    else if ((objc_msgSend(v4, "isEqual:", CFSTR("com.apple.podcasts")) & 1) != 0)
    {
      v5 = 5;
    }
    else if (objc_msgSend(v4, "hasPrefix:", CFSTR("com.apple.")))
    {
      v5 = 6;
    }
    else
    {
      v5 = 7;
    }
  }
  else
  {
    v5 = 8;
  }

  return v5;
}

+ (id)candidateTypeForCandidate:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
  {
    objc_msgSend(v3, "nodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avOutputDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "nodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "avOutputDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IRAVOutputDeviceTypeToString(objc_msgSend(v14, "deviceType"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = CFSTR("Invalid");
    }
  }
  else
  {
    v6 = CFSTR("Group");
  }

  return v6;
}

+ (id)candidateModelTypeForCandidate:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "nodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 <= 1)
  {
    objc_msgSend(v3, "nodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avOutputDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "nodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "avOutputDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      IRAVOutputDeviceSubTypeToString(objc_msgSend(v14, "deviceSubType"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = CFSTR("Invalid");
    }
  }
  else
  {
    v6 = CFSTR("Cluster");
  }

  return v6;
}

@end
