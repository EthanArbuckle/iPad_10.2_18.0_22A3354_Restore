@implementation NoteStoreObject(ICLegacyFolder)

- (__CFString)localizedTitle
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;

  objc_msgSend(a1, "titleForTableViewCell");
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = &stru_1E76DB108;
  v3 = v1;

  return v3;
}

- (uint64_t)depth
{
  void *v2;
  char v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a1, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExchangeAccount");

  if ((v3 & 1) != 0)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "externalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count") - 3;

  return v9 & ~(v9 >> 63);
}

- (void)newNoteInContext:()ICLegacyFolder
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "newlyAddedNote");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setStore:", a1);
  return v6;
}

- (void)addNotesObject:()ICLegacyFolder
{
  id v4;
  id v5;

  v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setStore:", a1);
}

- (uint64_t)isDefaultFolder
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "isEqual:", v3);

  return v4;
}

- (uint64_t)isTrashFolder
{
  return 0;
}

- (uint64_t)isCustomFolder
{
  if ((objc_msgSend(a1, "isDefaultFolder") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "isTrashFolder") ^ 1;
}

- (uint64_t)compare:()ICLegacyFolder
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v30;

  v4 = a3;
  ICProtocolCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    ICProtocolCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((objc_msgSend(a1, "isDefaultFolder") & 1) != 0)
      {
        v6 = -1;
      }
      else if ((objc_msgSend(v7, "isDefaultFolder") & 1) != 0)
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(a1, "parentFolder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "parentFolder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v10)
        {
          objc_msgSend(a1, "localizedTitle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedTitle");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v19, "localizedStandardCompare:", v20);

        }
        else
        {
          v11 = a1;
          v12 = v7;
          v13 = objc_msgSend(v11, "depth");
          v14 = objc_msgSend(v12, "depth");
          v15 = v14;
          v16 = v11;
          if (v13 <= v14)
          {
            v18 = v12;
            if (v14 > v13)
            {
              v18 = v12;
              do
              {
                v21 = v18;
                objc_msgSend(v18, "parentFolder");
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                --v15;
              }
              while (v15 > v13);
              v16 = v11;
            }
          }
          else
          {
            do
            {
              v17 = v16;
              objc_msgSend(v16, "parentFolder");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              --v13;
            }
            while (v13 > v15);
            v18 = v12;
          }
          v30 = v11;
          objc_msgSend(v16, "parentFolder");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "parentFolder");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 == v23)
          {
            v25 = v18;
            v24 = v16;
          }
          else
          {
            do
            {
              objc_msgSend(v16, "parentFolder");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v18, "parentFolder");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "parentFolder");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "parentFolder");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = v24;
              v18 = v25;
            }
            while (v26 != v27);
          }
          if (objc_msgSend(v24, "isEqual:", v25))
          {
            v28 = objc_msgSend(v30, "depth");
            if (v28 < objc_msgSend(v12, "depth"))
              v6 = -1;
            else
              v6 = 1;
          }
          else
          {
            v6 = objc_msgSend(v24, "compare:", v25);
          }

        }
      }
    }
    else
    {
      v8 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[NoteAccountObject(ICLegacyAccount) compare:].cold.1((uint64_t)a1, (uint64_t)v4, v8);

      v6 = 0;
    }

  }
  return v6;
}

@end
