@implementation MTTimer(CoordinationCore)

- (id)co_preferredTimer:()CoordinationCore
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v5 = a1;
  if (v4)
  {
    objc_msgSend(v4, "lastModifiedDate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v4, "lastModifiedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastModifiedDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "compare:", v9) == 1)
      {

LABEL_6:
        v11 = v4;

        v5 = v11;
        goto LABEL_7;
      }
      objc_msgSend(v5, "lastModifiedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_6;
    }
  }
LABEL_7:

  return v5;
}

@end
