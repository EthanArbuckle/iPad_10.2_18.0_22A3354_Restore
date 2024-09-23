@implementation FCModifyTagSettingsCommand

- (FCModifyTagSettingsCommand)initWithTagSettingsEntries:(id)a3 merge:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  FCModifyTagSettingsCommand *v7;

  v4 = a4;
  objc_msgSend(a3, "fc_arrayByTransformingWithBlock:", &__block_literal_global_32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCModifyRecordsCommand initWithLocalRecords:merge:](self, "initWithLocalRecords:merge:", v6, v4);

  return v7;
}

uint64_t __63__FCModifyTagSettingsCommand_initWithTagSettingsEntries_merge___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (BOOL)mergeLocalRecord:(id)a3 withRemoteRecord:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tagID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("tagID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fontMultiplier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fontMultiplier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "intValue");
    v37 = v10;
    v12 = objc_msgSend(v10, "intValue");
    v13 = v11 != v12;
    if (v11 != v12)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("fontMultiplier"));
    v38 = v9;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fontMultiplierMacOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("fontMultiplierMacOS"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "intValue");
    v35 = v15;
    if (v16 != objc_msgSend(v15, "intValue"))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("fontMultiplierMacOS"));
      v13 = 1;
    }
    v36 = v14;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentScale"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentScale"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "intValue");
    if (v19 != objc_msgSend(v18, "intValue"))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("contentScale"));
      v13 = 1;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("contentScaleMacOS"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("contentScaleMacOS"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "intValue");
    if (v22 != objc_msgSend(v21, "intValue"))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("contentScaleMacOS"));
      v13 = 1;
    }

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("accessToken"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessToken"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v25 = v7;
    if (v23)
      v26 = 1;
    else
      v26 = v24 == 0;
    if (v26)
    {
      if (!v23 || (objc_msgSend(v23, "isEqualToString:", v24) & 1) != 0)
      {
LABEL_22:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("webAccessOptIn"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("webAccessOptIn"));
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v29)
        {
          v32 = v6;
          v33 = v29;
        }
        else
        {
          if (!v30)
          {
LABEL_27:

            v7 = v25;
            goto LABEL_28;
          }
          v32 = v6;
          v33 = 0;
        }
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("webAccessOptIn"));
        v13 = 1;
        goto LABEL_27;
      }
      v27 = v6;
      v28 = v23;
    }
    else
    {
      v27 = v6;
      v28 = 0;
    }
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("accessToken"));
    v13 = 1;
    goto LABEL_22;
  }
LABEL_28:

  return v13;
}

@end
