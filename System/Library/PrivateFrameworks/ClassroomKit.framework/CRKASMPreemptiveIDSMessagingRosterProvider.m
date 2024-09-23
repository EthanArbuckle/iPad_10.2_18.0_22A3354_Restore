@implementation CRKASMPreemptiveIDSMessagingRosterProvider

- (void)dealloc
{
  objc_super v3;

  -[CRKASMPreemptiveIDSMessagingRosterProvider endObservingRoster](self, "endObservingRoster");
  v3.receiver = self;
  v3.super_class = (Class)CRKASMPreemptiveIDSMessagingRosterProvider;
  -[CRKASMPreemptiveIDSMessagingRosterProvider dealloc](&v3, sel_dealloc);
}

- (CRKASMPreemptiveIDSMessagingRosterProvider)initWithRosterProvider:(id)a3 IDSPrimitives:(id)a4 IDSAddressTranslator:(id)a5 dataStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  CRKASMPreemptiveIDSMessagingRosterProvider *v14;
  CRKASMPreemptiveIDSMessagingRosterProvider *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CRKASMPreemptiveIDSMessagingRosterProvider;
  v14 = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v17, sel_initWithRosterProvider_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_IDSPrimitives, a4);
    objc_storeStrong((id *)&v15->_IDSAddressTranslator, a5);
    objc_storeStrong((id *)&v15->_dataStore, a6);
    -[CRKASMPreemptiveIDSMessagingRosterProvider beginObservingRoster](v15, "beginObservingRoster");
    -[CRKASMPreemptiveIDSMessagingRosterProvider rosterDidChange](v15, "rosterDidChange");
  }

  return v15;
}

- (void)rosterDidChange
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Failed to persist new set of messaged Apple Accounts. Error: %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (id)fetchMessagedAppleIDsWitherror:(id *)a3
{
  void *v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  -[CRKASMPreemptiveIDSMessagingRosterProvider messagedAppleIDs](self, "messagedAppleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CRKASMPreemptiveIDSMessagingRosterProvider messagedAppleIDs](self, "messagedAppleIDs");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CRKASMPreemptiveIDSMessagingRosterProvider dataStore](self, "dataStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v7, "dataForKey:error:", CFSTR("PreemptiveMessageHistory"), &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v9)
    {
      v10 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v9);
    }
    else if (v8)
    {
      v15 = 0;
      objc_msgSend((id)objc_opt_class(), "appleIDsFromData:error:", v8, &v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v15;
      v13 = v12;
      if (v12)
      {
        v10 = 0;
        if (a3)
          *a3 = objc_retainAutorelease(v12);
      }
      else
      {
        -[CRKASMPreemptiveIDSMessagingRosterProvider setMessagedAppleIDs:](self, "setMessagedAppleIDs:", v11);
        -[CRKASMPreemptiveIDSMessagingRosterProvider messagedAppleIDs](self, "messagedAppleIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v14 = (void *)objc_opt_new();
      -[CRKASMPreemptiveIDSMessagingRosterProvider setMessagedAppleIDs:](self, "setMessagedAppleIDs:", v14);

      -[CRKASMPreemptiveIDSMessagingRosterProvider messagedAppleIDs](self, "messagedAppleIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v10;
  }
}

- (BOOL)persistAppleIDs:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v20 = 0;
    objc_msgSend((id)objc_opt_class(), "dataForAppleIDs:error:", v6, &v20);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v20;
    v9 = v8;
    if (v6)
    {
      -[CRKASMPreemptiveIDSMessagingRosterProvider dataStore](self, "dataStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v11 = objc_msgSend(v10, "removeDataForKey:error:", CFSTR("PreemptiveMessageHistory"), &v19);
      v12 = v19;

      if ((v11 & 1) != 0)
      {
        -[CRKASMPreemptiveIDSMessagingRosterProvider dataStore](self, "dataStore");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        v14 = objc_msgSend(v13, "setData:forKey:error:", v7, CFSTR("PreemptiveMessageHistory"), &v18);
        v15 = v18;

        if ((v14 & 1) != 0)
        {
          -[CRKASMPreemptiveIDSMessagingRosterProvider setMessagedAppleIDs:](self, "setMessagedAppleIDs:", v6);
        }
        else if (a4)
        {
          *a4 = objc_retainAutorelease(v15);
        }

      }
      else
      {
        v14 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v12);
      }

    }
    else
    {
      v14 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v8);
    }

  }
  else
  {
    -[CRKASMPreemptiveIDSMessagingRosterProvider setMessagedAppleIDs:](self, "setMessagedAppleIDs:", v6);
    -[CRKASMPreemptiveIDSMessagingRosterProvider dataStore](self, "dataStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v16, "removeAllDataWithError:", a4);

  }
  return v14;
}

- (void)messageAppleID:(id)a3
{
  id v4;
  NSObject *v5;
  CRKYoIDSMessage *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _CRKLogASM_16();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v4;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Preemptively messaging %{public}@", buf, 0xCu);
  }

  v6 = -[CRKYoIDSMessage initWithMessage:]([CRKYoIDSMessage alloc], "initWithMessage:", CFSTR("new-trusted-user-checkin"));
  -[CRKASMPreemptiveIDSMessagingRosterProvider IDSAddressTranslator](self, "IDSAddressTranslator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "destinationAddressForAppleID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "roster");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_new();
  -[CRKASMPreemptiveIDSMessagingRosterProvider IDSPrimitives](self, "IDSPrimitives");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKYoIDSMessage dictionaryValue](v6, "dictionaryValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke;
  v17[3] = &unk_24D9C6E18;
  v18 = v4;
  v16 = v4;
  objc_msgSend(v14, "sendMessage:destinationAddress:sourceAppleID:options:completion:", v15, v8, v12, v13, v17);

}

void __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _CRKLogASM_16();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke_cold_1(a1, v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_218C99000, v5, OS_LOG_TYPE_INFO, "Successfully preemptively messaged %{public}@.", (uint8_t *)&v7, 0xCu);
  }

}

+ (id)dataForAppleIDs:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
}

+ (id)appleIDsFromData:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v9, v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)trustedUserAppleIDsFromRoster:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF20];
  if (a3)
  {
    objc_msgSend(a3, "courses");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "crk_flatMapUsingBlock:", &__block_literal_global_84);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)objc_opt_new();
  }
  return v6;
}

id __76__CRKASMPreemptiveIDSMessagingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "trustedUsers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crk_mapUsingBlock:", &__block_literal_global_18_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __76__CRKASMPreemptiveIDSMessagingRosterProvider_trustedUserAppleIDsFromRoster___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "appleID");
}

+ (id)observedKeyPaths
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("roster");
  v3[1] = CFSTR("populated");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)beginObservingRoster
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!-[CRKASMPreemptiveIDSMessagingRosterProvider isObservingRoster](self, "isObservingRoster"))
  {
    -[CRKASMPreemptiveIDSMessagingRosterProvider setObservingRoster:](self, "setObservingRoster:", 1);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend((id)objc_opt_class(), "observedKeyPaths", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 0, CFSTR("KVOContext"));

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)endObservingRoster
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (-[CRKASMPreemptiveIDSMessagingRosterProvider isObservingRoster](self, "isObservingRoster"))
  {
    -[CRKASMPreemptiveIDSMessagingRosterProvider setObservingRoster:](self, "setObservingRoster:", 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend((id)objc_opt_class(), "observedKeyPaths", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v8, CFSTR("KVOContext"));

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("KVOContext"))
  {
    -[CRKASMPreemptiveIDSMessagingRosterProvider rosterDidChange](self, "rosterDidChange", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKASMPreemptiveIDSMessagingRosterProvider;
    -[CRKASMPreemptiveIDSMessagingRosterProvider observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (CRKIDSPrimitives)IDSPrimitives
{
  return self->_IDSPrimitives;
}

- (CRKIDSAddressTranslator)IDSAddressTranslator
{
  return self->_IDSAddressTranslator;
}

- (CRKKeyedDataStoreProtocol)dataStore
{
  return self->_dataStore;
}

- (NSURL)messagedAppleIDsURL
{
  return self->_messagedAppleIDsURL;
}

- (NSSet)messagedAppleIDs
{
  return self->_messagedAppleIDs;
}

- (void)setMessagedAppleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_messagedAppleIDs, a3);
}

- (BOOL)isObservingRoster
{
  return self->_observingRoster;
}

- (void)setObservingRoster:(BOOL)a3
{
  self->_observingRoster = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagedAppleIDs, 0);
  objc_storeStrong((id *)&self->_messagedAppleIDsURL, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_IDSAddressTranslator, 0);
  objc_storeStrong((id *)&self->_IDSPrimitives, 0);
}

void __61__CRKASMPreemptiveIDSMessagingRosterProvider_messageAppleID___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_218C99000, a3, OS_LOG_TYPE_ERROR, "Failed to preemptively message %{public}@. Error: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
