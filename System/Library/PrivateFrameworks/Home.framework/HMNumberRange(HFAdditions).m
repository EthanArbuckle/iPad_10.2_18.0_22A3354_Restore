@implementation HMNumberRange(HFAdditions)

- (BOOL)hf_isEqual:()HFAdditions
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;

  v7 = a3;
  if (a1 != v7)
  {
    objc_opt_class();
    v8 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (!v10)
    {
      v15 = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(a1, "minValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || (objc_msgSend(v10, "minValue"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "minValue");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_13:
        v15 = 0;
LABEL_14:
        if (!v11)

        goto LABEL_19;
      }
      v3 = (void *)v12;
      objc_msgSend(v10, "minValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(a1, "minValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "compare:", v14))
      {

        goto LABEL_12;
      }
      v27 = v14;
      v28 = v13;
      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(a1, "maxValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 || (objc_msgSend(v10, "maxValue"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "maxValue");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        v29 = v17;
        objc_msgSend(v10, "maxValue");
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          objc_msgSend(a1, "maxValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "maxValue");
          v25 = v5;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v24, "compare:", v23) == 0;

          v5 = v25;
        }
        else
        {

          v15 = 0;
        }
        v17 = v29;
        if (v18)
        {
LABEL_32:

          if ((v17 & 1) == 0)
            goto LABEL_14;
LABEL_36:

          goto LABEL_14;
        }
      }
      else
      {
        v15 = 0;
        if (v18)
          goto LABEL_32;
      }
    }
    else
    {
      v26 = 0;
      v15 = 1;
    }

    if ((v17 & 1) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
  v15 = 1;
LABEL_20:

  return v15;
}

@end
