@implementation CRRecentContactsLibrary(CloudRecentsExtensions)

- (void)recordContactEventsForHeaders:()CloudRecentsExtensions recentsDomain:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *context;
  id v32;
  void *v33;
  void *v34;
  id obj;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = a4;
  context = (void *)MEMORY[0x1AF432E70]();
  v7 = (void *)MEMORY[0x1E0C99E20];
  v33 = v6;
  v8 = (void *)objc_msgSend(v6, "copyAddressListForTo");
  objc_msgSend(v7, "setWithArray:", v8);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "copyAddressListForCc");
  objc_msgSend(v34, "addObjectsFromArray:", v9);

  v10 = (void *)objc_msgSend(v6, "copyAddressListForBcc");
  objc_msgSend(v34, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v6, "copyAddressListForReplyTo");
  objc_msgSend(v34, "addObjectsFromArray:", v11);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v34, "count"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v34;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v39;
    v14 = *MEMORY[0x1E0D18208];
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v39 != v13)
          objc_enumerationMutation(obj);
        v16 = *(id *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v16, "emailAddressValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "simpleAddress");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(v16, "stringValue");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v20;

        v22 = (void *)objc_msgSend(v16, "mf_copyDisplayableAddressComment");
        objc_msgSend(MEMORY[0x1E0D18290], "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v21, v22, v14, v37, 0, 0, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v36, "addObject:", v23);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v12);
  }

  v24 = (void *)objc_msgSend(v33, "copyAddressListForSender");
  objc_msgSend(v24, "firstObject");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "emailAddressValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "simpleAddress");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    v29 = v27;
  }
  else
  {
    objc_msgSend(v25, "stringValue");
    v29 = (id)objc_claimAutoreleasedReturnValue();
  }
  v30 = v29;

  objc_msgSend(a1, "recordContactEvents:recentsDomain:sendingAddress:completion:", v36, v32, v30, 0);
  objc_autoreleasePoolPop(context);

}

@end
