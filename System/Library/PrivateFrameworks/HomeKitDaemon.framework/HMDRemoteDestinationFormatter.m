@implementation HMDRemoteDestinationFormatter

+ (id)defaultFormatter
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    v7 = v6;
    if (self)
    {
      +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "deviceForDevice:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isCurrentAccount"))
      {
        objc_msgSend(v9, "localHandles");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v11, "hmf_isEmpty"))
        {
          objc_msgSend(v11, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "destination");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_23;
        }

      }
      objc_msgSend(v9, "remoteDestinationString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

      goto LABEL_35;
    }
LABEL_34:
    v12 = 0;
    goto LABEL_35;
  }
  v13 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v13;
  else
    v14 = 0;
  v7 = v14;

  if (v7)
  {
    objc_msgSend(v7, "device");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
    v7 = v19;

    if (v7)
    {
      objc_msgSend(v7, "primaryHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      __destinationForAccountHandle((uint64_t)self, v16);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v21 = v18;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;
    v7 = v22;

    if (v7)
    {
      __destinationForAccountHandle((uint64_t)self, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    }
    v23 = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
    v7 = v24;

    if (!v7)
      goto LABEL_34;
    objc_msgSend(v7, "handle");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  -[HMDRemoteDestinationFormatter stringForObjectValue:](self, "stringForObjectValue:", v15);
  v17 = objc_claimAutoreleasedReturnValue();
LABEL_21:
  v12 = (void *)v17;

LABEL_35:
  return v12;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  __CFString *v5;

  if (a5)
  {
    v5 = CFSTR("String does not appear to be valid remote destination");
    if (!a4)
      v5 = CFSTR("Invalid parameter 'string'");
    *a5 = v5;
  }
  return 0;
}

@end
