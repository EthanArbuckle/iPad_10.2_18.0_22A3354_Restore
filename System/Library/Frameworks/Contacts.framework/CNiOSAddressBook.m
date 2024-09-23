@implementation CNiOSAddressBook

uint64_t __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushAddressBook:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (id)performSynchronousWorkWithInvalidatedAddressBook:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__CNiOSAddressBook_performSynchronousWorkWithInvalidatedAddressBook___block_invoke;
  v8[3] = &unk_1E29FCC88;
  v9 = v4;
  v5 = v4;
  -[CNiOSAddressBook performAsynchronousWorkWithInvalidatedAddressBook:](self, "performAsynchronousWorkWithInvalidatedAddressBook:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __69__CNiOSAddressBook_performSynchronousWorkWithInvalidatedAddressBook___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  void (**v6)(void);

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 16);
  v6 = a3;
  v5(v4, a2);
  v6[2]();

}

void __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  __int128 v4;

  objc_msgSend(*(id *)(a1 + 32), "accessQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_3;
  v3[3] = &unk_1E29FCCB0;
  v4 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v2, v3);

}

- (id)performAsynchronousWorkWithInvalidatedAddressBook:(id)a3
{
  void (**v4)(id, void *, _QWORD *);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (void (**)(id, void *, _QWORD *))a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[CNiOSAddressBook accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke;
  block[3] = &unk_1E29F7EA0;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(v5, block);

  v7 = -[CNiOSAddressBook preparedAddressBook:](self, "preparedAddressBook:", v15[3]);
  v15[3] = (uint64_t)v7;
  if (v7)
  {
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke_2;
    v12[3] = &unk_1E29FCCB0;
    v12[4] = self;
    v12[5] = &v14;
    v4[2](v4, v7, v12);
    objc_msgSend(MEMORY[0x1E0D13B60], "successWithValue:", MEMORY[0x1E0C9AAB0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D13B60];
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 100);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "failureWithError:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)preparedAddressBook:(void *)a3
{
  uint64_t (**v4)(void);
  void *v5;

  if (a3)
    return a3;
  -[CNiOSAddressBook addressBookProvider](self, "addressBookProvider");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4[2]();

  return v5;
}

CFTypeRef __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_3(uint64_t a1)
{
  CFTypeRef result;

  result = (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "newAddressBookWithURL:", *(_QWORD *)(a1 + 32));
  if (result)
    return CFAutorelease(result);
  return result;
}

- (id)addressBookProvider
{
  return self->_addressBookProvider;
}

void __29__CNiOSAddressBook_flushPool__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "addressBookPool");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "addressBookPool");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

}

uint64_t __70__CNiOSAddressBook_performAsynchronousWorkWithInvalidatedAddressBook___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "popAddressBook");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)popAddressBook
{
  void *v3;
  const void *v4;
  CFTypeRef v5;
  CFTypeRef v6;

  -[CNiOSAddressBook addressBookPool](self, "addressBookPool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (const void *)objc_msgSend(v3, "anyObject");
  if (!v4 || (v5 = CFRetain(v4)) == 0)
  {
    v6 = 0;
    goto LABEL_6;
  }
  v6 = CFAutorelease(v5);

  if (v6)
  {
    -[CNiOSAddressBook addressBookPool](self, "addressBookPool");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v6);
LABEL_6:

  }
  return (void *)v6;
}

- (void)pushAddressBook:(void *)a3
{
  void *v5;
  unint64_t v6;
  id v7;

  if (a3)
  {
    -[CNiOSAddressBook addressBookPool](self, "addressBookPool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 <= 1)
    {
      MEMORY[0x194005874](a3);
      -[CNiOSAddressBook addressBookPool](self, "addressBookPool");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", a3);

    }
  }
}

- (NSMutableSet)addressBookPool
{
  return self->_addressBookPool;
}

- (CNiOSAddressBook)initWithContactsEnvironment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  CNiOSAddressBook *v13;
  _QWORD v15[4];
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  void *v19;
  uint64_t v20;
  _QWORD aBlock[5];

  v4 = a3;
  v5 = objc_opt_class();
  if (objc_msgSend(v4, "useInMemoryStores"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke;
    aBlock[3] = &__block_descriptor_40_e6__v8__0lu32l8;
    aBlock[4] = v5;
    v6 = _Block_copy(aBlock);
  }
  else
  {
    objc_msgSend(v4, "delegateInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "delegateInfos");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_2;
      v18[3] = &unk_1E29FCC10;
      v19 = v9;
      v20 = v5;
      v10 = v9;
      v6 = _Block_copy(v18);
      v11 = v19;
    }
    else
    {
      objc_msgSend(v4, "baseURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_3;
      v15[3] = &unk_1E29FCC10;
      v16 = v12;
      v17 = v5;
      v10 = v12;
      v6 = _Block_copy(v15);
      v11 = v16;
    }

  }
  v13 = -[CNiOSAddressBook initWithAddressBookProvider:](self, "initWithAddressBookProvider:", v6);

  return v13;
}

- (CNiOSAddressBook)initWithAddressBookProvider:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNiOSAddressBook;
  v5 = -[CNiOSAddressBook init](&v22, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v6;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.contacts.CNiOSAddressBook", v8);
    v10 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v9;

    v11 = objc_msgSend(v4, "copy");
    v12 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v11;

    dispatch_get_global_queue(25, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, v13);
    v15 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v14;

    objc_initWeak(&location, v5);
    v16 = *((_QWORD *)v5 + 5);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__CNiOSAddressBook_initWithAddressBookProvider___block_invoke;
    v19[3] = &unk_1E29FCC38;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v16, v19);
    dispatch_resume(*((dispatch_object_t *)v5 + 5));
    v17 = v5;
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  return (CNiOSAddressBook *)v5;
}

+ (void)newAddressBookWithURL:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CFErrorRef error;

  error = 0;
  objc_msgSend(a3, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = ABAddressBookCreateWithDatabaseDirectory();
  else
    v5 = (uint64_t)ABAddressBookCreateWithOptions(0, &error);
  v6 = (void *)v5;
  if (!v5)
    NSLog(CFSTR("Failed to create addressbook with error: %@"), error);
  ABAddressBookSetUsedByContacts();

  return v6;
}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNiOSAddressBook;
  objc_msgSendSuper2(&v2, sel_initialize);
  ABInitialize();
}

void __48__CNiOSAddressBook_initWithAddressBookProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "flushPool");

}

- (void)flushPool
{
  NSObject *v3;
  _QWORD v4[6];
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__26;
  v5[4] = __Block_byref_object_dispose__26;
  v6 = 0;
  -[CNiOSAddressBook accessQueue](self, "accessQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__CNiOSAddressBook_flushPool__block_invoke;
  v4[3] = &unk_1E29F7EA0;
  v4[4] = self;
  v4[5] = v5;
  dispatch_sync(v3, v4);

  _Block_object_dispose(v5, 8);
}

+ (void)newInMemoryAddressBook
{
  void *v2;

  v2 = (void *)ABAddressBookCreateWithDatabaseDirectory();
  if (!v2)
    NSLog(CFSTR("Failed to create in memory addressbook"));
  ABAddressBookSetUsedByContacts();
  return v2;
}

+ (void)newAddressBookWithDelegateInfo:(id)a3
{
  uint64_t v3;
  void *v4;
  const __CFDictionary *v5;
  ABAddressBookRef v6;
  CFErrorRef error;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "altDSID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9 = *MEMORY[0x1E0CF5DA0];
    v10[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (const __CFDictionary *)MEMORY[0x1E0C9AA70];
  }
  error = 0;
  v6 = ABAddressBookCreateWithOptions(v5, &error);
  if (!v6)
    NSLog(CFSTR("Failed to create addressbook with error: %@"), error);
  ABAddressBookSetUsedByContacts();

  return (void *)v6;
}

- (CNiOSAddressBook)init
{
  void *v3;
  CNiOSAddressBook *v4;

  +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNiOSAddressBook initWithContactsEnvironment:](self, "initWithContactsEnvironment:", v3);

  return v4;
}

CFTypeRef __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = (CFTypeRef)objc_msgSend(*(id *)(a1 + 32), "newInMemoryAddressBook");
  if (result)
    return CFAutorelease(result);
  return result;
}

CFTypeRef __48__CNiOSAddressBook_initWithContactsEnvironment___block_invoke_2(uint64_t a1)
{
  CFTypeRef result;

  result = (CFTypeRef)objc_msgSend(*(id *)(a1 + 40), "newAddressBookWithDelegateInfo:", *(_QWORD *)(a1 + 32));
  if (result)
    return CFAutorelease(result);
  return result;
}

- (id)resultWithInvalidatedAddressBook:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__26;
  v22 = __Block_byref_object_dispose__26;
  v23 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __53__CNiOSAddressBook_resultWithInvalidatedAddressBook___block_invoke;
  v15 = &unk_1E29FCC60;
  v17 = &v18;
  v5 = v4;
  v16 = v5;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](self, "performSynchronousWorkWithInvalidatedAddressBook:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D13B60];
  v8 = v19[5];
  objc_msgSend(v6, "error", v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resultWithValue:orError:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __53__CNiOSAddressBook_resultWithInvalidatedAddressBook___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (OS_dispatch_source)memoryMonitoringSource
{
  return self->_memoryMonitoringSource;
}

- (BOOL)addressBookIsShared
{
  return self->_addressBookIsShared;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryMonitoringSource, 0);
  objc_storeStrong(&self->_addressBookProvider, 0);
  objc_storeStrong((id *)&self->_addressBookPool, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
