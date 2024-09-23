@implementation DDScannerResult(DDUIIOS)

- (BOOL)ddui_canBeCombinedToOthers
{
  return objc_msgSend(a1, "category") == 4;
}

- (uint64_t)ddui_isEquivalentToResult:()DDUIIOS
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  double v25;
  id v26;
  double v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (!v7)
    {
      v13 = 0;
      goto LABEL_21;
    }
    objc_msgSend(a1, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if ((v12 & 1) != 0)
    {
      v13 = 1;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(a1, "coreResult");
    if (DDResultHasType())
    {
      v26 = 0;
      v27 = 0.0;
      if (DDResultCurrencyExtraction())
      {
        v24 = 0;
        v25 = 0.0;
        objc_msgSend(v4, "coreResult");
        if (DDResultCurrencyExtraction())
        {
          if (v27 == v25)
          {
            v14 = objc_msgSend(v26, "isEqualToString:", v24, v27);
LABEL_17:
            v13 = v14;
LABEL_19:
            v15 = 0;
LABEL_20:

            goto LABEL_21;
          }
        }
      }
    }
    else
    {
      if (!DDResultHasType())
      {
        v23 = 0;
        v13 = objc_msgSend(a1, "getPhoneValue:label:", &v23, 0);
        v15 = v23;
        if ((_DWORD)v13)
        {
          v22 = 0;
          v17 = objc_msgSend(v4, "getPhoneValue:label:", &v22, 0);
          v18 = v22;
          v19 = v18;
          v13 = 0;
          if (v17 && v18)
          {
            if (v15 == v18)
            {
              v13 = 1;
            }
            else if (objc_msgSend(v15, "containsString:", CFSTR("@")))
            {
              objc_msgSend(v15, "lowercaseString");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "lowercaseString");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v20, "isEqualToString:", v21);

            }
            else
            {
              v13 = +[DDContactUtils phoneNumber:isEqualToPhoneNumber:](DDContactUtils, "phoneNumber:isEqualToPhoneNumber:", v15, v19);
            }
          }

        }
        goto LABEL_20;
      }
      v26 = 0;
      v27 = 0.0;
      if (DDResultPhysicalUnitsExtraction())
      {
        v24 = 0;
        v25 = 0.0;
        objc_msgSend(v4, "coreResult");
        if (DDResultPhysicalUnitsExtraction())
        {
          if (v27 == v25)
          {
            v14 = objc_msgSend(v26, "isEqualToArray:", v24, v27);
            goto LABEL_17;
          }
        }
      }
    }
    v13 = 0;
    goto LABEL_19;
  }
  v13 = 0;
LABEL_22:

  return v13;
}

@end
