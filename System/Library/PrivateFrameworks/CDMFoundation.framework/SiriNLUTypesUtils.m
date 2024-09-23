@implementation SiriNLUTypesUtils

+ (id)createResponse:(id)a3 statusCode:(int)a4
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v5 = (objc_class *)MEMORY[0x24BE9E0F8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setCode:", v4);
  v8 = objc_alloc_init(MEMORY[0x24BE9E088]);
  objc_msgSend(v8, "setRequestId:", v6);

  objc_msgSend(v8, "setResponseStatus:", v7);
  return v8;
}

+ (BOOL)isTopSdaAskRepeat:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "turnContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nlContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemDialogActs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "isSdaAskRepeat:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isSdaAskRepeat:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "prompted", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("SystemPrompted_SystemAskedUserToRepeat"));

        if ((v11 & 1) != 0)
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

@end
