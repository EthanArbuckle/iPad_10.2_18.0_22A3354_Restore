@implementation GEOAddress(MNExtras)

- (__CFString)singleLineAddress
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  id v26;

  objc_msgSend(a1, "formattedAddressLines");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_msgSend(a1, "formattedAddressLines");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _MNLocalizedStringFromThisBundle(CFSTR("Address Components Separator"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_35:

    return v6;
  }
  objc_msgSend(a1, "structuredAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "structuredAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "fullThoroughfare");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v5, "addObject:", v8);
    if (v8)
      goto LABEL_16;
    objc_msgSend(v4, "subThoroughfare");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    objc_msgSend(v4, "thoroughfare");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", v10 + v12 + 1);
    if (v10)
    {
      objc_msgSend(v4, "subThoroughfare");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appendString:", v14);

      if (v12)
      {
        objc_msgSend(v13, "appendFormat:", CFSTR(" "));
LABEL_12:
        objc_msgSend(v4, "thoroughfare");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendString:", v15);

      }
    }
    else if (v12)
    {
      goto LABEL_12;
    }
    if (v10 + v12)
      objc_msgSend(v5, "addObject:", v13);

LABEL_16:
    objc_msgSend(v4, "locality");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length"))
      objc_msgSend(v5, "addObject:", v16);
    objc_msgSend(v4, "subAdministrativeArea");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(v4, "locality");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v19 & 1) == 0)
        objc_msgSend(v5, "addObject:", v17);
    }
    objc_msgSend(v4, "administrativeArea");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length"))
      objc_msgSend(v5, "addObject:", v20);
    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v4, "administrativeAreaCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "length"))
        objc_msgSend(v5, "addObject:", v21);
      objc_msgSend(v4, "country");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "length"))
        objc_msgSend(v5, "addObject:", v20);
    }
    if (objc_msgSend(v5, "count"))
    {
      _MNLocalizedStringFromThisBundle(CFSTR("Address Components Separator"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "_navigation_isCJK");

      if ((v24 & 1) != 0)
      {
        objc_msgSend(v5, "reverseObjectEnumerator");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allObjects");
        v26 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v26 = v5;
      }
      objc_msgSend(v26, "componentsJoinedByString:", v22);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = &stru_1E61D9090;
    }

    goto LABEL_35;
  }
  v6 = 0;
  return v6;
}

@end
