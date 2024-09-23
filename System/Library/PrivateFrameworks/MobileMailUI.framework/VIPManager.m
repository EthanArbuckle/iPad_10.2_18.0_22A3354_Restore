@implementation VIPManager

+ (void)setBackingManager:(id)a3
{
  os_unfair_lock_s *v4;
  VIPManager *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (os_unfair_lock_s *)objc_msgSend(a1, "defaultInstanceLock");
  os_unfair_lock_lock(v4);
  v5 = -[VIPManager initWithBackingManager:]([VIPManager alloc], "initWithBackingManager:", v7);
  v6 = (void *)sDefaultInstance;
  sDefaultInstance = (uint64_t)v5;

  os_unfair_lock_unlock(v4);
}

+ (VIPManager)defaultInstance
{
  os_unfair_lock_s *v4;
  id v5;
  void *v7;

  v4 = (os_unfair_lock_s *)objc_msgSend(a1, "defaultInstanceLock");
  os_unfair_lock_lock(v4);
  v5 = (id)sDefaultInstance;
  os_unfair_lock_unlock(v4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VIPManager.m"), 55, CFSTR("+setBackingManager: must be called before attempting to get the default instance"));

  }
  return (VIPManager *)v5;
}

+ (os_unfair_lock_s)defaultInstanceLock
{
  return (os_unfair_lock_s *)&defaultInstanceLock_lock;
}

- (VIPManager)initWithBackingManager:(id)a3
{
  id v5;
  VIPManager *v6;
  VIPManager *v7;
  NSLock *v8;
  NSLock *abPersonByVIPIdentifierLock;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VIPManager;
  v6 = -[VIPManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingManager, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    abPersonByVIPIdentifierLock = v7->_abPersonByVIPIdentifierLock;
    v7->_abPersonByVIPIdentifierLock = v8;

    v7->_abPersonByVIPIdentifier = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__vipsDidChange_, *MEMORY[0x1E0D1E0A8], v7->_backingManager);

  }
  return v7;
}

- (BOOL)hasVIPs
{
  void *v2;
  char v3;

  -[VIPManager backingManager](self, "backingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasVIPs");

  return v3;
}

- (NSSet)allVIPs
{
  void *v2;
  void *v3;

  -[VIPManager backingManager](self, "backingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allVIPs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (EAEmailAddressSet)allVIPEmailAddresses
{
  void *v2;
  void *v3;

  -[VIPManager backingManager](self, "backingManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allVIPEmailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EAEmailAddressSet *)v3;
}

- (id)vipWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VIPManager backingManager](self, "backingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vipWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isVIPAddress:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[VIPManager backingManager](self, "backingManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isVIPAddress:", v4);

  return v6;
}

- (void)saveVIPs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VIPManager backingManager](self, "backingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "saveVIPs:", v5);

}

- (void)removeVIPsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VIPManager backingManager](self, "backingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeVIPsWithIdentifiers:", v5);

}

- (void)removeVIPsWithEmailAddresses:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VIPManager backingManager](self, "backingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeVIPsWithEmailAddresses:", v5);

}

- (void)getAllVIPsWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VIPManager backingManager](self, "backingManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAllVIPsWithCompletion:", v5);

}

- (void)_vipsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  VIPManager *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1E0B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __29__VIPManager__vipsDidChange___block_invoke;
    block[3] = &unk_1E9A02DD8;
    block[4] = self;
    v16 = v6;
    dispatch_async(v9, block);

  }
  v13 = self;
  v10 = v4;
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v8, 3221225472, __29__VIPManager__vipsDidChange___block_invoke_2, &unk_1E9A02DD8, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performBlock:", &v12);

}

uint64_t __29__VIPManager__vipsDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __CFDictionary *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 16);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "identifier", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CFDictionaryRemoveValue(v6, v7);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unlock");
}

void __29__VIPManager__vipsDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", *MEMORY[0x1E0D1E0A8], v2, v3);

}

- (void)saveVIP:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_INFO, "#MailServices saveVIP: %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, 0);
  -[VIPManager saveVIPs:](self, "saveVIPs:", v6);

}

- (void)deleteVIPWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D56AF000, v5, OS_LOG_TYPE_INFO, "#MailServices deleteVIPWithIdentifier: %@", buf, 0xCu);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v4, 0);
  -[VIPManager removeVIPsWithIdentifiers:](self, "removeVIPsWithIdentifiers:", v6);

}

- (id)sortedVIPs
{
  void *v2;
  void *v3;
  void *v4;

  -[VIPManager allVIPs](self, "allVIPs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_12);
  return v4;
}

uint64_t __24__VIPManager_sortedVIPs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);

  return v7;
}

- (id)vipForEmailAddresses:(id)a3 andDisplayNames:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  id v20;
  id v22;
  id obj;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v22 = a4;
  -[VIPManager allVIPs](self, "allVIPs");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = 0;
    v27 = 0;
    v24 = *(_QWORD *)v33;
    while (1)
    {
      v26 = v6;
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v10 = (void *)objc_msgSend(v25, "mutableCopy");
        objc_msgSend(v9, "emailAddresses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "intersectSet:", v11);

        v12 = objc_msgSend(v10, "count");
        v13 = v12;
        if (v7 < v12)
        {
          v14 = v27;
          v27 = v9;
LABEL_20:

          v7 = v13;
          goto LABEL_21;
        }
        if (v7 == v12 && v12)
        {
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v14 = v22;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v15)
          {
            v16 = *(_QWORD *)v29;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v29 != v16)
                  objc_enumerationMutation(v14);
                v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                objc_msgSend(v9, "name");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v18) = objc_msgSend(v18, "isEqualToString:", v19);

                if ((_DWORD)v18)
                {
                  v20 = v9;

                  v13 = v7;
                  v27 = v20;
                  goto LABEL_20;
                }
              }
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
              if (v15)
                continue;
              break;
            }
          }
          v13 = v7;
          goto LABEL_20;
        }
LABEL_21:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (!v6)
        goto LABEL_25;
    }
  }
  v27 = 0;
LABEL_25:

  return v27;
}

- (void)existingPersonForVIP:(id)a3 usingAddressBook:(void *)a4
{
  id v6;
  void *v7;
  void *Value;
  void *v9;
  void *v10;
  void *v11;
  const void *v12;
  __CFDictionary *abPersonByVIPIdentifier;
  void *v14;

  v6 = a3;
  -[NSLock lock](self->_abPersonByVIPIdentifierLock, "lock");
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Value = (void *)CFDictionaryGetValue(self->_abPersonByVIPIdentifier, v7);
  v9 = Value;
  if (a4 && !Value)
  {
    objc_msgSend(v6, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (const void *)MFCopyClosestMatchingExistingPersonUsingAddressesAndDisplayName();

    if (v12)
    {
      abPersonByVIPIdentifier = self->_abPersonByVIPIdentifier;
      objc_msgSend(v6, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionarySetValue(abPersonByVIPIdentifier, v14, v12);

      v9 = (void *)v12;
    }
    else
    {
      v9 = 0;
    }
  }

  -[NSLock unlock](self->_abPersonByVIPIdentifierLock, "unlock");
  return v9;
}

- (id)criterionForEmailAddresses:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v3 = objc_msgSend(v19, "count");
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v3);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v19;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v21 != v7)
            objc_enumerationMutation(v5);
          v9 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v9, "emailAddressValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "simpleAddress");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
          }
          else
          {
            objc_msgSend(v9, "stringValue");
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          v14 = v13;

          v15 = (void *)objc_msgSend(v14, "mf_copyIDNADecodedEmailAddress");
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D598]), "initWithType:qualifier:expression:", 35, 8, v15);
          objc_msgSend(v4, "addObject:", v16);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0D4D598], "orCompoundCriterionWithCriteria:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)vipCriteria
{
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[VIPManager sortedVIPs](self, "sortedVIPs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v6 = 138412290;
    v15 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "name", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "emailAddresses");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[VIPManager criterionForEmailAddresses:](self, "criterionForEmailAddresses:", v11);
          v12 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setName:](v12, "setName:", v13);

          objc_msgSend(v3, "addObject:", v12);
        }
        else
        {
          MFLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v21 = v9;
            _os_log_impl(&dword_1D56AF000, v12, OS_LOG_TYPE_INFO, "#MailServices vip Sender name is nil: %@", buf, 0xCu);
          }
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)allVIPEmailAddressesCriterion
{
  void *v3;
  void *v4;

  -[VIPManager allVIPEmailAddresses](self, "allVIPEmailAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VIPManager criterionForEmailAddresses:](self, "criterionForEmailAddresses:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EMVIPManager)backingManager
{
  return self->_backingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_abPersonByVIPIdentifierLock, 0);
}

@end
