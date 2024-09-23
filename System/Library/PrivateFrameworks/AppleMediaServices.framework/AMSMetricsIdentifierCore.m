@implementation AMSMetricsIdentifierCore

+ (BOOL)_shouldUpdateDatabaseFor:(id)a3 consumerIDResetInterval:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "serverProvidedAt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "expires");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      v10 = v9;

      objc_msgSend(v6, "serverProvidedAt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateByAddingTimeInterval:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v13 = v12;

      LOBYTE(v7) = v10 != v13;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

+ (BOOL)_shouldReplaceInfo:(id)a3 withInfo:(id)a4 isServerRecord:(BOOL)a5
{
  void *v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;

  LODWORD(v5) = a5;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "serverProvidedAt");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    objc_msgSend(v8, "serverProvidedAt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v7, "modified");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "timeIntervalSinceReferenceDate");
      v30 = v29;
      objc_msgSend(v8, "modified");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "timeIntervalSinceReferenceDate");
      v33 = v32;

      if (v30 > v33)
      {
        if (!(_DWORD)v5)
          goto LABEL_16;
        if ((objc_msgSend(v7, "deleted") & 1) != 0)
        {
          LOBYTE(v5) = 0;
          goto LABEL_16;
        }
      }
      goto LABEL_15;
    }
  }
  objc_msgSend(v7, "serverProvidedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_15;
  objc_msgSend(v8, "serverProvidedAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "value");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_10;
    v13 = (void *)v12;
    objc_msgSend(v7, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if (!v16)
    {
LABEL_10:
      objc_msgSend(v7, "serverProvidedAt");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceReferenceDate");
      v25 = v24;
      objc_msgSend(v8, "serverProvidedAt");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceReferenceDate");
      LOBYTE(v5) = v25 <= v27;

      goto LABEL_16;
    }
    objc_msgSend(v7, "serverProvidedAt");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v19 = v18;
    objc_msgSend(v8, "serverProvidedAt");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeIntervalSinceReferenceDate");
    v22 = v21;

    if (v19 <= v22)
    {
      LOBYTE(v5) = objc_msgSend(v7, "isEqualIgnoringLastSync:", v8);
      goto LABEL_16;
    }
LABEL_15:
    LOBYTE(v5) = 1;
  }
LABEL_16:

  return (char)v5;
}

@end
