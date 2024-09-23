@implementation NSError(MediaSetup)

- (id)translateCKErrorToMSError
{
  void *v2;
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return a1;
  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  if ((v3 & 1) == 0)
    return a1;
  v4 = objc_msgSend(a1, "code");
  if (v4 <= 20)
  {
    switch(v4)
    {
      case 1:
        v5 = (void *)MEMORY[0x24BDD1540];
        v29 = CFSTR("MSUserInfoErrorStringKey");
        v30 = CFSTR("Cannot recover from CKInternalError, Please file a radar");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v5;
        v8 = 8;
        goto LABEL_22;
      case 2:
        objc_msgSend(a1, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", *MEMORY[0x24BDB8EE8]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CloudKit Partial Failure Error for %lu records"), objc_msgSend(v13, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x24BDD1540];
        v41 = CFSTR("MSUserInfoErrorStringKey");
        v42 = v19;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.cloudkit.errorDomain"), 2, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_16;
      case 6:
      case 7:
        goto LABEL_13;
      case 11:
        v22 = (void *)MEMORY[0x24BDD1540];
        v43 = CFSTR("MSUserInfoErrorStringKey");
        v44[0] = CFSTR("CloudKit Unknown Item");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v22;
        v8 = 1;
        goto LABEL_22;
      case 14:
        v23 = (void *)MEMORY[0x24BDD1540];
        v39 = CFSTR("MSUserInfoErrorStringKey");
        v40 = CFSTR("CloudKit Server Record Changed");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v23;
        v8 = 3;
        goto LABEL_22;
      default:
        return a1;
    }
  }
  if (v4 <= 109)
  {
    if (v4 == 21)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      v31 = CFSTR("MSUserInfoErrorStringKey");
      v32 = CFSTR("CloudKit Change Token Expired");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v26;
      v8 = 7;
      goto LABEL_22;
    }
    if (v4 == 23)
    {
LABEL_13:
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a1, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BDB8EB8]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("CloudKit Throttled Error: Retry after - %@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)MEMORY[0x24BDD1540];
      v33 = CFSTR("MSUserInfoErrorStringKey");
      v34 = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.cloudkit.errorDomain"), 6, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
      return v16;
    }
    return a1;
  }
  if (v4 == 110)
  {
    v24 = (void *)MEMORY[0x24BDD1540];
    v37 = CFSTR("MSUserInfoErrorStringKey");
    v38 = CFSTR("CloudKit Manatee Unavailable");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v24;
    v8 = 4;
    goto LABEL_22;
  }
  if (v4 == 111)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v27 = CFSTR("MSUserInfoErrorStringKey");
    v28 = CFSTR("CloudKit Unsynched Keychain error, Please try again after a while");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v25;
    v8 = 9;
    goto LABEL_22;
  }
  if (v4 != 112)
    return a1;
  v9 = (void *)MEMORY[0x24BDD1540];
  v35 = CFSTR("MSUserInfoErrorStringKey");
  v36 = CFSTR("CloudKit Manatee Missing Identity");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  v8 = 5;
LABEL_22:
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.mediasetup.cloudkit.errorDomain"), v8, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (uint64_t)CKErrorHasErrorCode:()MediaSetup
{
  void *v6;
  uint64_t v7;

  if (CKErrorIsCode())
    return objc_msgSend(a1, "CKErrorHasUnderlyingErrorCode:", a3);
  objc_msgSend(a1, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB8EA8]))
  {
    v7 = objc_msgSend(a1, "code");

    if (v7 == a3)
      return 1;
  }
  else
  {

  }
  return 0;
}

- (uint64_t)CKErrorHasUnderlyingErrorCode:()MediaSetup
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !CKErrorIsCode())
    return 0;
  objc_msgSend(a1, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDB8EE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = *MEMORY[0x24BDB8EA8];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v11))
        {
          v15 = objc_msgSend(v13, "code");

          if (v15 == a3)
          {
            v16 = 1;
            goto LABEL_16;
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  v16 = 0;
LABEL_16:

  return v16;
}

- (uint64_t)isErrorFatal
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  unint64_t v6;
  uint64_t result;
  void *v8;
  int v9;
  unint64_t v10;

  objc_msgSend(a1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mediasetup.cloudkit.errorDomain"));

  if (v3 && objc_msgSend(a1, "code") == 10)
    return 1;
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDD0B88]);

  if (v5)
  {
    v6 = objc_msgSend(a1, "code") - 4097;
    if (v6 <= 4 && ((1 << v6) & 0x15) != 0)
      return 1;
  }
  objc_msgSend(a1, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB8EA8]);

  if (!v9)
    return 0;
  v10 = objc_msgSend(a1, "code");
  result = 1;
  if ((v10 > 0x17 || ((1 << v10) & 0x80C0C0) == 0) && v10 - 110 >= 3)
    return 0;
  return result;
}

@end
