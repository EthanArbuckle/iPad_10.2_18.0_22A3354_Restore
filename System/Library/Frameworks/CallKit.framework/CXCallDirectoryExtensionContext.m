@implementation CXCallDirectoryExtensionContext

- (CXCallDirectoryExtensionContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  CXCallDirectoryExtensionContext *v5;
  uint64_t v6;
  id remoteObjectProxyGenerator;
  _QWORD v9[4];
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CXCallDirectoryExtensionContext;
  v5 = -[CXCallDirectoryExtensionContext initWithInputItems:listenerEndpoint:contextUUID:](&v12, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
  {
    objc_initWeak(&location, v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke;
    v9[3] = &unk_1E4B89700;
    objc_copyWeak(&v10, &location);
    v6 = MEMORY[0x1A859A7A4](v9);
    remoteObjectProxyGenerator = v5->_remoteObjectProxyGenerator;
    v5->_remoteObjectProxyGenerator = (id)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v5;
}

id __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      if (!v5)
        v5 = &__block_literal_global_11;
      objc_msgSend(WeakRetained, "_auxiliaryConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(WeakRetained, "_auxiliaryConnection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      if (v5)
        objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v5);
      else
        objc_msgSend(v11, "remoteObjectProxy");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  CXDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 synchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CXCallDirectoryExtensionContext remoteObjectProxyGenerator](self, "remoteObjectProxyGenerator");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _BOOL8))v7)[2](v7, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CXCallDirectoryMutablePhoneNumberEntryData)pendingBlockingEntryData
{
  CXCallDirectoryMutablePhoneNumberEntryData *pendingBlockingEntryData;
  CXCallDirectoryMutablePhoneNumberEntryData *v4;
  CXCallDirectoryMutablePhoneNumberEntryData *v5;

  pendingBlockingEntryData = self->_pendingBlockingEntryData;
  if (!pendingBlockingEntryData)
  {
    v4 = -[CXCallDirectoryMutablePhoneNumberEntryData initWithCapacity:]([CXCallDirectoryMutablePhoneNumberEntryData alloc], "initWithCapacity:", 10000);
    v5 = self->_pendingBlockingEntryData;
    self->_pendingBlockingEntryData = v4;

    pendingBlockingEntryData = self->_pendingBlockingEntryData;
  }
  return pendingBlockingEntryData;
}

- (CXCallDirectoryMutableLabeledPhoneNumberEntryData)pendingIdentificationEntryDataForAddition
{
  CXCallDirectoryMutableLabeledPhoneNumberEntryData *pendingIdentificationEntryDataForAddition;
  CXCallDirectoryMutableLabeledPhoneNumberEntryData *v4;
  CXCallDirectoryMutableLabeledPhoneNumberEntryData *v5;

  pendingIdentificationEntryDataForAddition = self->_pendingIdentificationEntryDataForAddition;
  if (!pendingIdentificationEntryDataForAddition)
  {
    v4 = -[CXCallDirectoryMutableLabeledPhoneNumberEntryData initWithCapacity:]([CXCallDirectoryMutableLabeledPhoneNumberEntryData alloc], "initWithCapacity:", 10000);
    v5 = self->_pendingIdentificationEntryDataForAddition;
    self->_pendingIdentificationEntryDataForAddition = v4;

    pendingIdentificationEntryDataForAddition = self->_pendingIdentificationEntryDataForAddition;
  }
  return pendingIdentificationEntryDataForAddition;
}

- (CXCallDirectoryMutablePhoneNumberEntryData)pendingIdentificationEntryDataForRemoval
{
  CXCallDirectoryMutablePhoneNumberEntryData *pendingIdentificationEntryDataForRemoval;
  CXCallDirectoryMutablePhoneNumberEntryData *v4;
  CXCallDirectoryMutablePhoneNumberEntryData *v5;

  pendingIdentificationEntryDataForRemoval = self->_pendingIdentificationEntryDataForRemoval;
  if (!pendingIdentificationEntryDataForRemoval)
  {
    v4 = -[CXCallDirectoryMutablePhoneNumberEntryData initWithCapacity:]([CXCallDirectoryMutablePhoneNumberEntryData alloc], "initWithCapacity:", 10000);
    v5 = self->_pendingIdentificationEntryDataForRemoval;
    self->_pendingIdentificationEntryDataForRemoval = v4;

    pendingIdentificationEntryDataForRemoval = self->_pendingIdentificationEntryDataForRemoval;
  }
  return pendingIdentificationEntryDataForRemoval;
}

- (void)appendBlockingEntryPhoneNumber:(int64_t)a3 changeType:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  if (-[CXCallDirectoryExtensionContext pendingBlockingEntryChangeType](self, "pendingBlockingEntryChangeType") != a4)
  {
    -[CXCallDirectoryExtensionContext pendingBlockingEntryData](self, "pendingBlockingEntryData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      -[CXCallDirectoryExtensionContext _flushPendingBlockingEntryData](self, "_flushPendingBlockingEntryData");
    -[CXCallDirectoryExtensionContext setPendingBlockingEntryChangeType:](self, "setPendingBlockingEntryChangeType:", a4);
  }
  -[CXCallDirectoryExtensionContext pendingBlockingEntryData](self, "pendingBlockingEntryData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPhoneNumber:", a3);

  -[CXCallDirectoryExtensionContext pendingBlockingEntryData](self, "pendingBlockingEntryData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >> 4 >= 0x271)
    -[CXCallDirectoryExtensionContext _flushPendingBlockingEntryData](self, "_flushPendingBlockingEntryData");
}

- (void)appendIdentificationEntryForAdditionWithPhoneNumber:(int64_t)a3 label:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = a4;
  if (-[CXCallDirectoryExtensionContext pendingIdentificationEntryChangeType](self, "pendingIdentificationEntryChangeType"))
  {
    -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForAddition](self, "pendingIdentificationEntryDataForAddition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForRemoval](self, "pendingIdentificationEntryDataForRemoval");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 + v10)
      -[CXCallDirectoryExtensionContext _flushPendingIdentificationEntryData](self, "_flushPendingIdentificationEntryData");
    -[CXCallDirectoryExtensionContext setPendingIdentificationEntryChangeType:](self, "setPendingIdentificationEntryChangeType:", 0);
  }
  -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForAddition](self, "pendingIdentificationEntryDataForAddition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendPhoneNumber:label:", a3, v6);

  -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForAddition](self, "pendingIdentificationEntryDataForAddition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >> 4 >= 0x271)
    -[CXCallDirectoryExtensionContext _flushPendingIdentificationEntryData](self, "_flushPendingIdentificationEntryData");
}

- (void)appendIdentificationEntryForRemovalWithPhoneNumber:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  if (-[CXCallDirectoryExtensionContext pendingIdentificationEntryChangeType](self, "pendingIdentificationEntryChangeType") != 1)
  {
    -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForAddition](self, "pendingIdentificationEntryDataForAddition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForRemoval](self, "pendingIdentificationEntryDataForRemoval");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 + v8)
      -[CXCallDirectoryExtensionContext _flushPendingIdentificationEntryData](self, "_flushPendingIdentificationEntryData");
    -[CXCallDirectoryExtensionContext setPendingIdentificationEntryChangeType:](self, "setPendingIdentificationEntryChangeType:", 1);
  }
  -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForRemoval](self, "pendingIdentificationEntryDataForRemoval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendPhoneNumber:", a3);

  -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForRemoval](self, "pendingIdentificationEntryDataForRemoval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 >> 4 >= 0x271)
    -[CXCallDirectoryExtensionContext _flushPendingIdentificationEntryData](self, "_flushPendingIdentificationEntryData");
}

- (void)_flushPendingBlockingEntryData
{
  void *v3;
  void *v4;
  int64_t v5;
  id v6;

  -[CXCallDirectoryExtensionContext pendingBlockingEntryData](self, "pendingBlockingEntryData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "copy");

  -[CXCallDirectoryExtensionContext setPendingBlockingEntryData:](self, "setPendingBlockingEntryData:", 0);
  -[CXCallDirectoryExtensionContext _remoteObjectProxyWithErrorHandler:synchronous:](self, "_remoteObjectProxyWithErrorHandler:synchronous:", 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CXCallDirectoryExtensionContext pendingBlockingEntryChangeType](self, "pendingBlockingEntryChangeType");
  if (v5 == 1)
  {
    objc_msgSend(v4, "removeBlockingEntriesWithData:reply:", v6, &__block_literal_global_5_1);
  }
  else if (!v5)
  {
    objc_msgSend(v4, "addBlockingEntriesWithData:reply:", v6, &__block_literal_global_4);
  }

}

- (void)_flushPendingIdentificationEntryData
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CXCallDirectoryExtensionContext _remoteObjectProxyWithErrorHandler:synchronous:](self, "_remoteObjectProxyWithErrorHandler:synchronous:", 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CXCallDirectoryExtensionContext pendingIdentificationEntryChangeType](self, "pendingIdentificationEntryChangeType");
  if (v3 == 1)
  {
    -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForRemoval](self, "pendingIdentificationEntryDataForRemoval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copy");

    -[CXCallDirectoryExtensionContext setPendingIdentificationEntryDataForRemoval:](self, "setPendingIdentificationEntryDataForRemoval:", 0);
    objc_msgSend(v7, "removeIdentificationEntriesWithData:reply:", v5, &__block_literal_global_7);
    goto LABEL_5;
  }
  if (!v3)
  {
    -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForAddition](self, "pendingIdentificationEntryDataForAddition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    -[CXCallDirectoryExtensionContext setPendingIdentificationEntryDataForAddition:](self, "setPendingIdentificationEntryDataForAddition:", 0);
    objc_msgSend(v7, "addIdentificationEntriesWithData:reply:", v5, &__block_literal_global_6);
LABEL_5:

  }
}

- (BOOL)isIncremental
{
  void *v3;
  _QWORD v5[5];

  if (!-[CXCallDirectoryExtensionContext hasQueriedIsIncremental](self, "hasQueriedIsIncremental"))
  {
    -[CXCallDirectoryExtensionContext _remoteObjectProxyWithErrorHandler:synchronous:](self, "_remoteObjectProxyWithErrorHandler:synchronous:", 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke;
    v5[3] = &unk_1E4B89728;
    v5[4] = self;
    objc_msgSend(v3, "isIncrementalLoadingAllowed:", v5);

  }
  return self->_incremental;
}

void __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if (v5)
  {
    CXDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke_cold_1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasQueriedIsIncremental:", 1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = a2;
  }

}

- (void)addBlockingEntryWithNextSequentialPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber
{
  -[CXCallDirectoryExtensionContext appendBlockingEntryPhoneNumber:changeType:](self, "appendBlockingEntryPhoneNumber:changeType:", phoneNumber, 0);
}

- (void)_performBlockIfIncremental:(id)a3 usingSelectorForExceptionMessage:(SEL)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void (**v9)(void);

  v9 = (void (**)(void))a3;
  if (-[CXCallDirectoryExtensionContext isIncremental](self, "isIncremental"))
  {
    v9[2]();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99768];
    NSStringFromSelector(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "raise:format:", v7, CFSTR("Calling %@ when isIncremental is false is unsupported"), v8);

  }
}

- (void)removeBlockingEntryWithPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CXCallDirectoryExtensionContext_removeBlockingEntryWithPhoneNumber___block_invoke;
  v3[3] = &unk_1E4B89750;
  v3[4] = self;
  v3[5] = phoneNumber;
  -[CXCallDirectoryExtensionContext _performBlockIfIncremental:usingSelectorForExceptionMessage:](self, "_performBlockIfIncremental:usingSelectorForExceptionMessage:", v3, a2);
}

uint64_t __70__CXCallDirectoryExtensionContext_removeBlockingEntryWithPhoneNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendBlockingEntryPhoneNumber:changeType:", *(_QWORD *)(a1 + 40), 1);
}

- (void)removeAllBlockingEntries
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__CXCallDirectoryExtensionContext_removeAllBlockingEntries__block_invoke;
  v2[3] = &unk_1E4B88AE8;
  v2[4] = self;
  -[CXCallDirectoryExtensionContext _performBlockIfIncremental:usingSelectorForExceptionMessage:](self, "_performBlockIfIncremental:usingSelectorForExceptionMessage:", v2, a2);
}

void __59__CXCallDirectoryExtensionContext_removeAllBlockingEntries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingBlockingEntryData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_flushPendingBlockingEntryData");
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithErrorHandler:synchronous:", 0, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllBlockingEntriesWithReply:", &__block_literal_global_11);

}

- (void)removeIdentificationEntryWithPhoneNumber:(CXCallDirectoryPhoneNumber)phoneNumber
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__CXCallDirectoryExtensionContext_removeIdentificationEntryWithPhoneNumber___block_invoke;
  v3[3] = &unk_1E4B89750;
  v3[4] = self;
  v3[5] = phoneNumber;
  -[CXCallDirectoryExtensionContext _performBlockIfIncremental:usingSelectorForExceptionMessage:](self, "_performBlockIfIncremental:usingSelectorForExceptionMessage:", v3, a2);
}

uint64_t __76__CXCallDirectoryExtensionContext_removeIdentificationEntryWithPhoneNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendIdentificationEntryForRemovalWithPhoneNumber:", *(_QWORD *)(a1 + 40));
}

- (void)removeAllIdentificationEntries
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__CXCallDirectoryExtensionContext_removeAllIdentificationEntries__block_invoke;
  v2[3] = &unk_1E4B88AE8;
  v2[4] = self;
  -[CXCallDirectoryExtensionContext _performBlockIfIncremental:usingSelectorForExceptionMessage:](self, "_performBlockIfIncremental:usingSelectorForExceptionMessage:", v2, a2);
}

void __65__CXCallDirectoryExtensionContext_removeAllIdentificationEntries__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "pendingIdentificationEntryDataForAddition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  objc_msgSend(*(id *)(a1 + 32), "pendingIdentificationEntryDataForRemoval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 + v5)
    objc_msgSend(*(id *)(a1 + 32), "_flushPendingIdentificationEntryData");
  objc_msgSend(*(id *)(a1 + 32), "_remoteObjectProxyWithErrorHandler:synchronous:", 0, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllIdentificationEntriesWithReply:", &__block_literal_global_12);

}

- (void)completeRequestWithCompletionHandler:(void *)completion
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[16];

  v4 = completion;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  -[CXCallDirectoryExtensionContext pendingBlockingEntryData](self, "pendingBlockingEntryData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    -[CXCallDirectoryExtensionContext _flushPendingBlockingEntryData](self, "_flushPendingBlockingEntryData");
  -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForAddition](self, "pendingIdentificationEntryDataForAddition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[CXCallDirectoryExtensionContext pendingIdentificationEntryDataForRemoval](self, "pendingIdentificationEntryDataForRemoval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 + v11)
    -[CXCallDirectoryExtensionContext _flushPendingIdentificationEntryData](self, "_flushPendingIdentificationEntryData");
  -[CXCallDirectoryExtensionContext _remoteObjectProxyWithErrorHandler:synchronous:](self, "_remoteObjectProxyWithErrorHandler:synchronous:", 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__CXCallDirectoryExtensionContext_completeRequestWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E4B89360;
  v14[4] = self;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "completeRequestWithReply:", v14);

}

id __72__CXCallDirectoryExtensionContext_completeRequestWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)CXCallDirectoryExtensionContext;
  return objc_msgSendSuper2(&v3, sel_completeRequestReturningItems_completionHandler_, 0, v1);
}

- (void)requestFailedWithError:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "request failed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  -[CXCallDirectoryExtensionContext delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestFailedForExtensionContext:withError:", self, v6);

  v7[2](v7);
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1, &__block_literal_global_15);
  return (id)_extensionAuxiliaryVendorProtocol_interface_1;
}

void __68__CXCallDirectoryExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callDirectoryProviderVendorInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_interface_1;
  _extensionAuxiliaryVendorProtocol_interface_1 = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1, &__block_literal_global_17);
  return (id)_extensionAuxiliaryHostProtocol_interface_1;
}

void __66__CXCallDirectoryExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "cx_callDirectoryProviderHostInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_interface_1;
  _extensionAuxiliaryHostProtocol_interface_1 = v0;

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (void)setPendingBlockingEntryData:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBlockingEntryData, a3);
}

- (int64_t)pendingBlockingEntryChangeType
{
  return self->_pendingBlockingEntryChangeType;
}

- (void)setPendingBlockingEntryChangeType:(int64_t)a3
{
  self->_pendingBlockingEntryChangeType = a3;
}

- (void)setPendingIdentificationEntryDataForAddition:(id)a3
{
  objc_storeStrong((id *)&self->_pendingIdentificationEntryDataForAddition, a3);
}

- (void)setPendingIdentificationEntryDataForRemoval:(id)a3
{
  objc_storeStrong((id *)&self->_pendingIdentificationEntryDataForRemoval, a3);
}

- (int64_t)pendingIdentificationEntryChangeType
{
  return self->_pendingIdentificationEntryChangeType;
}

- (void)setPendingIdentificationEntryChangeType:(int64_t)a3
{
  self->_pendingIdentificationEntryChangeType = a3;
}

- (BOOL)hasQueriedIsIncremental
{
  return self->_hasQueriedIsIncremental;
}

- (void)setHasQueriedIsIncremental:(BOOL)a3
{
  self->_hasQueriedIsIncremental = a3;
}

- (id)remoteObjectProxyGenerator
{
  return self->_remoteObjectProxyGenerator;
}

- (void)setRemoteObjectProxyGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxyGenerator, 0);
  objc_storeStrong((id *)&self->_pendingIdentificationEntryDataForRemoval, 0);
  objc_storeStrong((id *)&self->_pendingIdentificationEntryDataForAddition, 0);
  objc_storeStrong((id *)&self->_pendingBlockingEntryData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __83__CXCallDirectoryExtensionContext_initWithInputItems_listenerEndpoint_contextUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "error: %@", a5, a6, a7, a8, 2u);
}

void __48__CXCallDirectoryExtensionContext_isIncremental__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A402D000, a2, a3, "Error querying is incremental loading allowed: %@", a5, a6, a7, a8, 2u);
}

@end
