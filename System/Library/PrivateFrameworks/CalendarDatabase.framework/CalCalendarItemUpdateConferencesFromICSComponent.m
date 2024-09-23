@implementation CalCalendarItemUpdateConferencesFromICSComponent

uint64_t __CalCalendarItemUpdateConferencesFromICSComponent_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;

  v4 = a2;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CalConferenceCopyURL((uint64_t)v4);
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v11))
    {
      v10 = 0;
LABEL_46:

      goto LABEL_47;
    }
    v13 = (void *)CalConferenceCopyInfo((uint64_t)v4);
    v14 = (void *)CalConferenceCopyFeature((uint64_t)v4);
    v35 = (void *)CalConferenceCopyRegion((uint64_t)v4);
    v15 = (void *)CalConferenceCopyLanguage((uint64_t)v4);
    if (v13 || (objc_msgSend(v5, "info"), (v33 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "info");
      v2 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqual:", v2) & 1) == 0)
      {
        v16 = (void *)v2;
        v17 = v15;

        v10 = 0;
        goto LABEL_43;
      }
      v34 = 1;
    }
    else
    {
      v33 = 0;
      v34 = 0;
    }
    v32 = (void *)v2;
    if (v14 || (objc_msgSend(v5, "feature"), (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "feature");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "isEqual:", v18) & 1) == 0)
      {
        v17 = v15;

        v10 = 0;
        goto LABEL_40;
      }
      v29 = v18;
      v19 = 1;
    }
    else
    {
      v30 = 0;
      v19 = 0;
    }
    if (v35 || (objc_msgSend(v5, "region"), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "region");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v35, "isEqual:"))
      {
        v17 = v15;
        v10 = 0;
LABEL_36:

        goto LABEL_37;
      }
      v28 = 1;
      if (v15)
        goto LABEL_29;
    }
    else
    {
      v26 = 0;
      v28 = 0;
      if (v15)
        goto LABEL_29;
    }
    objc_msgSend(v5, "language");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v17 = v15;
      v22 = 0;
      v10 = 1;
      goto LABEL_35;
    }
LABEL_29:
    v27 = v19;
    objc_msgSend(v5, "language", v24, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v15;
    v10 = objc_msgSend(v15, "isEqual:", v20);

    v17 = v21;
    if (v21)
    {
      if (v28)
      {
        v19 = v27;
        goto LABEL_36;
      }
      v19 = v27;
LABEL_37:
      if (!v35)
      {

        if ((v19 & 1) == 0)
          goto LABEL_40;
        goto LABEL_39;
      }
      if (v19)
LABEL_39:

LABEL_40:
      if (!v14)
      {

        if ((v34 & 1) == 0)
          goto LABEL_43;
        goto LABEL_42;
      }
      if (v34)
LABEL_42:

LABEL_43:
      if (!v13)

      goto LABEL_46;
    }
    v19 = v27;
    v22 = v25;
LABEL_35:

    if ((v28 & 1) != 0)
      goto LABEL_36;
    goto LABEL_37;
  }
  v10 = 0;
LABEL_47:

  return v10;
}

@end
