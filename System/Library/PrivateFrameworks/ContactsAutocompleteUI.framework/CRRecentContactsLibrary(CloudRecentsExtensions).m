@implementation CRRecentContactsLibrary(CloudRecentsExtensions)

- (void)recordContactEventsForHeaders:()CloudRecentsExtensions recentsDomain:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *context;
  id v27;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = a4;
  context = (void *)MEMORY[0x1B5E16678]();
  v6 = (void *)MEMORY[0x1E0C99E20];
  v7 = (void *)objc_msgSend(v5, "copyAddressListForTo");
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "copyAddressListForCc");
  objc_msgSend(v8, "addObjectsFromArray:", v9);

  v10 = (void *)objc_msgSend(v5, "copyAddressListForBcc");
  objc_msgSend(v8, "addObjectsFromArray:", v10);

  v11 = (void *)objc_msgSend(v5, "copyAddressListForReplyTo");
  objc_msgSend(v8, "addObjectsFromArray:", v11);

  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v8;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    v16 = *MEMORY[0x1E0D18208];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v18, "ea_uncommentedAddress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "cnaui_copyDisplayableAddressComment");
        objc_msgSend(MEMORY[0x1E0D18290], "recentEventForAddress:displayName:kind:date:weight:metadata:options:", v19, v20, v16, v12, 0, 0, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v29, "addObject:", v21);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v14);
  }

  v22 = (void *)objc_msgSend(v5, "copyAddressListForSender");
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "ea_uncommentedAddress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "recordContactEvents:recentsDomain:sendingAddress:completion:", v29, v27, v24, 0);
  objc_autoreleasePoolPop(context);

}

@end
