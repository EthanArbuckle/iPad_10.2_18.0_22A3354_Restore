@implementation IMAccountController(CKAdditions)

- (id)__ck_defaultAccountForService:()CKAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (CKIsRunningUITests())
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "simulatedChats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    IMPreferredAccountForService();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)__ck_bestAccountForAddresses:()CKAdditions
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "fallbackServiceForAddresses:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "__ck_bestAccountForAddresses:withFallbackService:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)fallbackServiceForAddresses:()CKAdditions
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count") != 1)
    goto LABEL_6;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "__im_isChatBot");

  if (!v6)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D35918], "rcsService");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (id)__ck_bestAccountForAddresses:()CKAdditions withFallbackService:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (CKIsRunningUITests())
  {
    v28 = v7;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "simulatedChats");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v31 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v31)
    {
      v30 = *(_QWORD *)v37;
LABEL_4:
      v10 = 0;
      while (1)
      {
        v11 = v6;
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v10);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v12, "participants");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v33;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v33 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v18), "ID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              IMStripFormattingFromAddress();
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v20);

              ++v18;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v16);
        }

        v6 = v11;
        if ((objc_msgSend(v13, "isEqualToArray:", v11) & 1) != 0)
          break;

        if (++v10 == v31)
        {
          v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v31)
            goto LABEL_4;
          goto LABEL_17;
        }
      }
      objc_msgSend(v12, "account");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v28;
      if (v21)
        goto LABEL_24;
    }
    else
    {
LABEL_17:

      v7 = v28;
    }
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "simulatedChats");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "account");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  IMPreferredSendingAccountForAddressesWantsGroupWithFallbackService();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v21, "_isUsableForSending") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D35918], "smsService");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(a1, "accountsForService:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "__imFirstObject");
      v26 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v26;
    }
LABEL_23:

  }
LABEL_24:

  return v21;
}

- (id)__ck_bestAccountForAddress:()CKAdditions
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11[0] = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", v11, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99D20];
    v5 = 0;
    objc_msgSend(v7, "array");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  objc_msgSend(a1, "__ck_bestAccountForAddresses:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
