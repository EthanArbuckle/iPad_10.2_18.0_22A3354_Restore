@implementation CUIKiCloudKVStore

+ (id)sharediCloudKVStore
{
  if (sharediCloudKVStore_onceToken != -1)
    dispatch_once(&sharediCloudKVStore_onceToken, &__block_literal_global_21);
  return (id)sharediCloudKVStore_iCloudKVStore;
}

void __40__CUIKiCloudKVStore_sharediCloudKVStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharediCloudKVStore_iCloudKVStore;
  sharediCloudKVStore_iCloudKVStore = v0;

}

+ (BOOL)_haveiCloudKVStoreEntitlement
{
  return 1;
}

- (BOOL)_canAccessiCloudKVStore
{
  return objc_msgSend((id)objc_opt_class(), "_haveiCloudKVStoreEntitlement");
}

- (CUIKiCloudKVStore)init
{
  CUIKiCloudKVStore *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CUIKiCloudKVStore;
  -[CUIKiCloudKVStore self](&v11, sel_self);
  v3 = (CUIKiCloudKVStore *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3->_hasConnectedToCarBluetooth = 0;
    if (objc_msgSend((id)objc_opt_class(), "_haveiCloudKVStoreEntitlement"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", v3, sel__storeDidChange_, *MEMORY[0x1E0CB3368], v4);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel__identityChanged_, *MEMORY[0x1E0CB3370], 0);

      objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "synchronize");

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ubiquityIdentityToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKiCloudKVStore setUbiquityIdentityToken:](v3, "setUbiquityIdentityToken:", v9);

      -[CUIKiCloudKVStore _storeDidChange:](v3, "_storeDidChange:", 0);
    }
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (objc_msgSend((id)objc_opt_class(), "_haveiCloudKVStoreEntitlement"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)CUIKiCloudKVStore;
  -[CUIKiCloudKVStore dealloc](&v4, sel_dealloc);
}

- (void)setHasConnectedToCarBluetooth:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[CUIKiCloudKVStore _canAccessiCloudKVStore](self, "_canAccessiCloudKVStore"))
  {
    self->_hasConnectedToCarBluetooth = v3;
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", v3, CFSTR("HasConnectedToCarBluetoothKey"));
    objc_msgSend(v5, "synchronize");

  }
}

- (void)setLastCarConnectionDate:(id)a3
{
  id v5;
  NSDate *lastCarConnectionDate;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  lastCarConnectionDate = self->_lastCarConnectionDate;
  v10 = v5;
  if (lastCarConnectionDate)
    v7 = -[NSDate isEqualToDate:](lastCarConnectionDate, "isEqualToDate:", v5);
  else
    v7 = v5 == 0;
  if (-[CUIKiCloudKVStore _canAccessiCloudKVStore](self, "_canAccessiCloudKVStore") && !v7)
  {
    objc_storeStrong((id *)&self->_lastCarConnectionDate, a3);
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v10)
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("LastCarConnectionDate"));
    else
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("LastCarConnectionDate"));
    objc_msgSend(v9, "synchronize");

  }
}

- (void)_identityChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSDate *lastCarConnectionDate;
  void *v11;

  -[CUIKiCloudKVStore ubiquityIdentityToken](self, "ubiquityIdentityToken", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ubiquityIdentityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ubiquityIdentityToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKiCloudKVStore setUbiquityIdentityToken:](self, "setUbiquityIdentityToken:", v9);

    self->_hasConnectedToCarBluetooth = 0;
    lastCarConnectionDate = self->_lastCarConnectionDate;
    self->_lastCarConnectionDate = 0;

    -[CUIKiCloudKVStore ubiquityIdentityToken](self, "ubiquityIdentityToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[CUIKiCloudKVStore _storeDidChange:](self, "_storeDidChange:", 0);
  }
}

- (void)_storeDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  NSDate *v22;
  NSObject *v23;
  NSDate *lastCarConnectionDate;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[4];
  uint64_t v32;
  _BYTE v33[128];
  _QWORD v34[2];
  uint64_t v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v26 = 0;
    v10 = *MEMORY[0x1E0CB3360];
    v34[0] = CFSTR("HasConnectedToCarBluetoothKey");
    v34[1] = CFSTR("LastCarConnectionDate");
    v35 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB3358]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, "integerValue");

    if (v9 <= 1)
    {
      v26 = v5;
      v10 = *MEMORY[0x1E0CB3360];
LABEL_6:
      v25 = v6;
      objc_msgSend(v6, "objectForKey:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (!v13)
        goto LABEL_25;
      v14 = v13;
      v15 = *(_QWORD *)v28;
      v16 = 0x1E0CB3000uLL;
      while (1)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v18, "isEqualToString:", CFSTR("HasConnectedToCarBluetoothKey")))
          {
            objc_msgSend(*(id *)(v16 + 2616), "defaultStore");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            self->_hasConnectedToCarBluetooth = objc_msgSend(v19, "BOOLForKey:", CFSTR("HasConnectedToCarBluetoothKey"));
          }
          else
          {
            if (!objc_msgSend(v18, "isEqualToString:", CFSTR("LastCarConnectionDate")))
              continue;
            v20 = v16;
            objc_msgSend(*(id *)(v16 + 2616), "defaultStore");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKey:", CFSTR("LastCarConnectionDate"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = v21;
            }
            else
            {
              if (v21)
              {
                +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  -[CUIKiCloudKVStore _storeDidChange:].cold.1(v31, (uint64_t)v21, &v32, v23);

              }
              v22 = 0;
            }
            lastCarConnectionDate = self->_lastCarConnectionDate;
            self->_lastCarConnectionDate = v22;

            v16 = v20;
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (!v14)
        {
LABEL_25:

          v6 = v25;
          v5 = v26;
          break;
        }
      }
    }
  }

}

- (BOOL)hasConnectedToCarBluetooth
{
  return self->_hasConnectedToCarBluetooth;
}

- (NSDate)lastCarConnectionDate
{
  return self->_lastCarConnectionDate;
}

- (NSObject)ubiquityIdentityToken
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setUbiquityIdentityToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityIdentityToken, 0);
  objc_storeStrong((id *)&self->_lastCarConnectionDate, 0);
}

- (void)_storeDidChange:(_QWORD *)a3 .cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  id v8;

  v7 = (void *)objc_opt_class();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  v8 = v7;
  _os_log_error_impl(&dword_1B8A6A000, a4, OS_LOG_TYPE_ERROR, "Got unexpected object for last car connection date. Expected NSDate, got %@", a1, 0xCu);

}

@end
