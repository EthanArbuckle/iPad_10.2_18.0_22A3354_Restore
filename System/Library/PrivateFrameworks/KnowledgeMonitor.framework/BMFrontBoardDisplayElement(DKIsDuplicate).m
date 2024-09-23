@implementation BMFrontBoardDisplayElement(DKIsDuplicate)

- (uint64_t)dk_isDuplicateOf:()DKIsDuplicate
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(a1, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(a1, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v7)
      {

        if (!v10)
          goto LABEL_20;
      }
      else
      {

        if ((v10 & 1) == 0)
          goto LABEL_20;
      }
    }
    objc_msgSend(a1, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(v6, "bundleIdentifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
        goto LABEL_15;
    }
    objc_msgSend(a1, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (v12)
    {

      if (!v15)
        goto LABEL_20;
LABEL_15:
      v16 = objc_msgSend(a1, "elementType");
      if (v16 != objc_msgSend(v6, "elementType"))
        goto LABEL_20;
      v17 = objc_msgSend(a1, "layoutRole");
      if (v17 != objc_msgSend(v6, "layoutRole"))
        goto LABEL_20;
      v18 = objc_msgSend(a1, "level");
      if (v18 != objc_msgSend(v6, "level"))
        goto LABEL_20;
      v19 = objc_msgSend(a1, "hasKeyboardFocus");
      if (v19 != objc_msgSend(v6, "hasKeyboardFocus"))
        goto LABEL_20;
      v20 = objc_msgSend(a1, "isUIApplicationElement");
      if (v20 != objc_msgSend(v6, "isUIApplicationElement"))
        goto LABEL_20;
      objc_msgSend(a1, "display");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 || (objc_msgSend(v6, "display"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(a1, "display");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "display");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24) ^ 1;

        if (v22)
        {
LABEL_29:

          v11 = v25 ^ 1u;
          goto LABEL_21;
        }
      }
      else
      {
        v25 = 0;
      }

      goto LABEL_29;
    }

    if ((v15 & 1) != 0)
      goto LABEL_15;
LABEL_20:
    v11 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v11 = 0;
LABEL_22:

  return v11;
}

@end
