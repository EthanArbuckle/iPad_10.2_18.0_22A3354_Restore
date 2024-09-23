@implementation HFPinCodeDataStore

- (HFPinCodeDataStore)init
{
  HFPinCodeDataStore *v2;
  uint64_t v3;
  NSMutableDictionary *userPINCodes;
  uint64_t v5;
  NSMutableDictionary *removedUserPINCodes;
  uint64_t v7;
  NSMutableDictionary *guestPINCodes;
  uint64_t v9;
  NSMutableDictionary *otherEcosystemGuestPINCodes;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HFPinCodeDataStore;
  v2 = -[HFPinCodeDataStore init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    userPINCodes = v2->_userPINCodes;
    v2->_userPINCodes = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    removedUserPINCodes = v2->_removedUserPINCodes;
    v2->_removedUserPINCodes = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    guestPINCodes = v2->_guestPINCodes;
    v2->_guestPINCodes = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    otherEcosystemGuestPINCodes = v2->_otherEcosystemGuestPINCodes;
    v2->_otherEcosystemGuestPINCodes = (NSMutableDictionary *)v9;

  }
  return v2;
}

- (void)mergeData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[HFPinCodeDataStore userPINCodes](self, "userPINCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userPINCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  -[HFPinCodeDataStore removedUserPINCodes](self, "removedUserPINCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removedUserPINCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  -[HFPinCodeDataStore guestPINCodes](self, "guestPINCodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "guestPINCodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v9);

  objc_msgSend(v12, "currentUserPinCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v12, "currentUserPinCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeDataStore setCurrentUserPinCode:](self, "setCurrentUserPinCode:", v11);

  }
}

- (id)pinCodeFromItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isUnknownGuestFromMatter"))
  {
    -[HFPinCodeDataStore otherEcosystemGuestPINCodes](self, "otherEcosystemGuestPINCodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unknownMatterGuestUniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "pinCodeValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPinCodeDataStore pinCodeForCodeValue:](self, "pinCodeForCodeValue:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)pinCodeForCodeValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFPinCodeDataStore guestPINCodes](self, "guestPINCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[HFPinCodeDataStore userPINCodes](self, "userPINCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)guestPinCodeFromItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFPinCodeDataStore guestPINCodes](self, "guestPINCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pinCodeValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!objc_msgSend(v4, "isUnknownGuestFromMatter"))
      goto LABEL_4;
    -[HFPinCodeDataStore otherEcosystemGuestPINCodes](self, "otherEcosystemGuestPINCodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unknownMatterGuestUniqueID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
LABEL_4:
      -[HFPinCodeDataStore userPINCodes](self, "userPINCodes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "pinCodeValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        HFLogForCategory(0x32uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v15 = 136315138;
          v16 = "-[HFPinCodeDataStore guestPinCodeFromItem:]";
          _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "(%s) Expected a guest PIN Code, but found a user code instead.", (uint8_t *)&v15, 0xCu);
        }

      }
      v7 = 0;
    }
  }

  return v7;
}

- (void)updateWithPinCode:(id)a3 forOldCodeValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void *, uint64_t);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(v6, "pinCodeValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__HFPinCodeDataStore_updateWithPinCode_forOldCodeValue___block_invoke;
    aBlock[3] = &unk_1EA736940;
    v9 = v7;
    v19 = v9;
    v20 = v8;
    v21 = v6;
    v10 = v8;
    v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    -[HFPinCodeDataStore guestPINCodes](self, "guestPINCodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[HFPinCodeDataStore guestPINCodes](self, "guestPINCodes");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFPinCodeDataStore userPINCodes](self, "userPINCodes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKey:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        NSLog(CFSTR("Could not find Pin Code to update"));
        goto LABEL_8;
      }
      -[HFPinCodeDataStore userPINCodes](self, "userPINCodes");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v14;
    v11[2](v11, v14);

LABEL_8:
    goto LABEL_9;
  }
  NSLog(CFSTR("Trying to update Pin Code but provided nil for the old value."));
LABEL_9:

}

void __56__HFPinCodeDataStore_updateWithPinCode_forOldCodeValue___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setValue:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)userPINCodes
{
  return self->_userPINCodes;
}

- (void)setUserPINCodes:(id)a3
{
  objc_storeStrong((id *)&self->_userPINCodes, a3);
}

- (NSMutableDictionary)removedUserPINCodes
{
  return self->_removedUserPINCodes;
}

- (void)setRemovedUserPINCodes:(id)a3
{
  objc_storeStrong((id *)&self->_removedUserPINCodes, a3);
}

- (NSMutableDictionary)guestPINCodes
{
  return self->_guestPINCodes;
}

- (void)setGuestPINCodes:(id)a3
{
  objc_storeStrong((id *)&self->_guestPINCodes, a3);
}

- (NSMutableDictionary)otherEcosystemGuestPINCodes
{
  return self->_otherEcosystemGuestPINCodes;
}

- (void)setOtherEcosystemGuestPINCodes:(id)a3
{
  objc_storeStrong((id *)&self->_otherEcosystemGuestPINCodes, a3);
}

- (HFPinCode)currentUserPinCode
{
  return self->_currentUserPinCode;
}

- (void)setCurrentUserPinCode:(id)a3
{
  objc_storeStrong((id *)&self->_currentUserPinCode, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserPinCode, 0);
  objc_storeStrong((id *)&self->_otherEcosystemGuestPINCodes, 0);
  objc_storeStrong((id *)&self->_guestPINCodes, 0);
  objc_storeStrong((id *)&self->_removedUserPINCodes, 0);
  objc_storeStrong((id *)&self->_userPINCodes, 0);
}

@end
