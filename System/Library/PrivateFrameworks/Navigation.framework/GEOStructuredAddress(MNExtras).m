@implementation GEOStructuredAddress(MNExtras)

- (__CFString)singleLineAddress
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  __CFString *v17;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "subThoroughfare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v2, "addObject:", v3);
  objc_msgSend(a1, "thoroughfare");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    objc_msgSend(v2, "addObject:", v4);
  objc_msgSend(a1, "subLocality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v2, "addObject:", v5);
  objc_msgSend(a1, "locality");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
    objc_msgSend(v2, "addObject:", v6);
  objc_msgSend(a1, "subAdministrativeArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(a1, "locality");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
      objc_msgSend(v2, "addObject:", v7);
  }
  objc_msgSend(a1, "administrativeArea");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v2, "addObject:", v10);
  if (!v2)
  {
    objc_msgSend(a1, "administrativeAreaCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
      objc_msgSend(0, "addObject:", v11);
    objc_msgSend(a1, "country");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
      objc_msgSend(0, "addObject:", v10);
  }
  if (objc_msgSend(v2, "count"))
  {
    _MNLocalizedStringFromThisBundle(CFSTR("Address Components Separator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectAtIndex:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "_navigation_isCJK");

    if ((v14 & 1) != 0)
    {
      objc_msgSend(v2, "reverseObjectEnumerator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = v2;
    }
    objc_msgSend(v16, "componentsJoinedByString:", v12);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = &stru_1E61D9090;
  }

  return v17;
}

@end
