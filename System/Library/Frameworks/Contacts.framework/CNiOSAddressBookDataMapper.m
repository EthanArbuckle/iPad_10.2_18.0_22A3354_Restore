@implementation CNiOSAddressBookDataMapper

id __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0D13AF8];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairWithFirst:second:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactObservableForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  CNiOSAddressBookDataMapper *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13AE8];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke;
  v9[3] = &unk_1E29F8940;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "observableWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)shouldLogContactsAccess
{
  return 1;
}

- (BOOL)requestAccessForEntityType:(int64_t)a3 error:(id *)a4
{
  CNAuthorization *authorization;
  CNAuthorization *v6;
  BOOL v7;
  id v8;
  id v10;

  if (self)
    authorization = self->_authorization;
  else
    authorization = 0;
  v10 = 0;
  v6 = authorization;
  v7 = -[CNAuthorization requestAccessForEntityType:error:](v6, "requestAccessForEntityType:error:", 0, &v10);
  v8 = v10;

  if (a4 && !v7)
    *a4 = objc_retainAutorelease(v8);

  return v7;
}

- (BOOL)shouldCaptureMetricsForQueries
{
  return 1;
}

- (CNiOSAddressBookDataMapper)initWithConfiguration:(id)a3 addressBook:(id)a4
{
  id v6;
  id v7;
  CNiOSAddressBookDataMapper *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  CNiOSAddressBook *v13;
  CNiOSAddressBook *addressBook;
  uint64_t v15;
  CNManagedConfiguration *managedConfiguration;
  void *v17;
  uint64_t v18;
  CNContactsLogger *logger;
  uint64_t v20;
  CNManagedAccountsCache *managedAccountsCache;
  CNAuthorization *v22;
  void *v23;
  uint64_t v24;
  CNAuthorization *authorization;
  void *v26;
  void *v27;
  CNAuthorizationContext *v28;
  CNAuthorization *authorizationContext;
  uint64_t v30;
  CNAuthorizationContext *v31;
  CNiOSAddressBookDataMapper *v32;
  objc_super v34;

  v6 = a3;
  v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)CNiOSAddressBookDataMapper;
  v8 = -[CNiOSAddressBookDataMapper init](&v34, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "environment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      +[CNContactsEnvironment currentEnvironment](CNContactsEnvironment, "currentEnvironment");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    if (v7)
    {
      v13 = (CNiOSAddressBook *)v7;
    }
    else
    {
      objc_msgSend(v12, "addressBook");
      v13 = (CNiOSAddressBook *)objc_claimAutoreleasedReturnValue();
    }
    addressBook = v8->_addressBook;
    v8->_addressBook = v13;

    objc_storeStrong((id *)&v8->_environment, v12);
    objc_msgSend(v6, "managedConfiguration");
    v15 = objc_claimAutoreleasedReturnValue();
    managedConfiguration = v8->_managedConfiguration;
    v8->_managedConfiguration = (CNManagedConfiguration *)v15;

    objc_msgSend(v12, "loggerProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contactsLogger");
    v18 = objc_claimAutoreleasedReturnValue();
    logger = v8->_logger;
    v8->_logger = (CNContactsLogger *)v18;

    objc_msgSend(MEMORY[0x1E0D13AA0], "sharedCache");
    v20 = objc_claimAutoreleasedReturnValue();
    managedAccountsCache = v8->_managedAccountsCache;
    v8->_managedAccountsCache = (CNManagedAccountsCache *)v20;

    v22 = [CNAuthorization alloc];
    objc_msgSend(v6, "assumedIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[CNAuthorization initWithAssumedIdentity:](v22, "initWithAssumedIdentity:", v23);
    authorization = v8->_authorization;
    v8->_authorization = (CNAuthorization *)v24;

    v8->_contactIdentifierAuditMode = objc_msgSend(v6, "identifierAuditMode");
    objc_msgSend(v6, "authorizationContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      v28 = v26;
      authorizationContext = (CNAuthorization *)v8->_authorizationContext;
      v8->_authorizationContext = v28;
    }
    else
    {
      authorizationContext = v8->_authorization;
      -[CNAuthorization authorizationContext](authorizationContext, "authorizationContext");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v8->_authorizationContext;
      v8->_authorizationContext = (CNAuthorizationContext *)v30;

    }
    v32 = v8;

  }
  return v8;
}

id __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[4];
  id v21;

  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0D139B8]);
  objc_msgSend(*(id *)(a1 + 32), "effectivePredicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_2;
  aBlock[3] = &unk_1E29F8918;
  v6 = v3;
  v21 = v6;
  v7 = _Block_copy(aBlock);
  if ((objc_msgSend(*(id *)(a1 + 32), "disallowsEncodedFetch") & 1) == 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v5, "cn_supportsEncodedFetching"))
  {
    v9 = *(void **)(a1 + 32);
    v8 = *(id **)(a1 + 40);
    v19 = 0;
    v10 = (id *)&v19;
    v11 = -[CNiOSAddressBookDataMapper fetchAndDecodeEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:](v8, v9, &v19, v4, v7);
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v18 = 0;
    v10 = (id *)&v18;
    v11 = objc_msgSend(v12, "fetchContactsForFetchRequest:error:batchHandler:", v13, &v18, v7);
  }
  v14 = v11;
  v15 = *v10;
  v16 = v15;
  if ((v14 & 1) != 0 || !v15)
    objc_msgSend(v6, "observerDidComplete");
  else
    objc_msgSend(v6, "observerDidFailWithError:", v15);

  return v4;
}

- (id)fetchAndDecodeEncodedContactsForFetchRequest:(_QWORD *)a3 error:(void *)a4 cancelationToken:(void *)a5 batchHandler:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, int);
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    objc_msgSend((id)objc_opt_class(), "contactBuffersDecoderForFetchRequest:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[4];
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__16;
    v38 = __Block_byref_object_dispose__16;
    v39 = 0;
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v29 = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
    v23 = &unk_1E29F9EF8;
    v27 = &v30;
    v14 = v12;
    v24 = v14;
    v26 = v11;
    v15 = v13;
    v25 = v15;
    v28 = &v34;
    a1 = (id *)objc_msgSend(a1, "fetchEncodedContactsForFetchRequest:error:cancelationToken:batchHandler:", v9, &v29, v10, &v20);
    v16 = v29;
    if (!*((_BYTE *)v31 + 24))
      objc_msgSend(v15, "didFetchContacts:error:", 0, v16, v20, v21, v22, v23, v24);
    v17 = v16;
    if (!v16)
      v17 = (void *)v35[5];
    if (a3)
      v18 = (char)a1;
    else
      v18 = 1;
    if ((v18 & 1) == 0)
      *a3 = objc_retainAutorelease(v17);

    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);

  }
  return a1;
}

- (BOOL)fetchEncodedContactsForFetchRequest:(id)a3 error:(id *)a4 cancelationToken:(id)a5 batchHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  CNContactsLogger *logger;
  CNContactsLogger *v15;
  uint64_t v16;
  void *v17;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  BOOL v26;
  CNContactsLogger *v27;
  CNContactsLogger *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  CNiOSAddressBookDataMapper *v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__16;
  v44 = __Block_byref_object_dispose__16;
  v45 = 0;
  objc_msgSend(v10, "effectivePredicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v15 = logger;
  v16 = objc_msgSend(v10, "unifyResults");
  objc_msgSend(v10, "keysToFetch");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsLogger fetchEncodedContactsMatchingPredicate:unifyResults:keysToFetch:](v15, "fetchEncodedContactsMatchingPredicate:unifyResults:keysToFetch:", v13, v16, v17);

  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v19 = addressBook;
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke;
  v33 = &unk_1E29F9F48;
  v34 = self;
  v20 = v10;
  v35 = v20;
  v38 = &v46;
  v39 = &v40;
  v21 = v11;
  v36 = v21;
  v22 = v12;
  v37 = v22;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v19, "performSynchronousWorkWithInvalidatedAddressBook:", &v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "isFailure", v30, v31, v32, v33, v34))
  {
    objc_msgSend(v23, "error");
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)v41[5];
    v41[5] = v24;

  }
  if (*((_BYTE *)v47 + 24))
  {
    v26 = 1;
    if (!a4)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (self)
    v27 = self->_logger;
  else
    v27 = 0;
  v28 = v27;
  -[CNContactsLogger didFetchEncodedContacts:error:](v28, "didFetchEncodedContacts:error:", 0, v41[5]);

  v26 = *((_BYTE *)v47 + 24) != 0;
  if (a4)
  {
LABEL_13:
    if (!v26)
      *a4 = objc_retainAutorelease((id)v41[5]);
  }
LABEL_15:

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v26;
}

void __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  id obj;

  v4 = (void *)objc_opt_class();
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    v6 = *(void **)(v5 + 40);
  else
    v6 = 0;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  if (v7)
    v7 = (_QWORD *)v7[3];
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v11 = *(_QWORD *)(v9 + 64);
    v10 = *(_QWORD *)(v9 + 72);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }
  v12 = v7;
  v13 = v6;
  objc_msgSend(v4, "encodedPeopleFetcherForForFetchRequest:addressBook:managedConfiguration:addressBookCompletionHandler:cursorCompletionHandler:environment:identifierAuditMode:authorizationContext:", v8, a2, v13, 0, 0, v12, v10, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v15 + 40);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
  v17[3] = &unk_1E29F9F20;
  v17[4] = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 48);
  v18 = *(id *)(a1 + 56);
  LOBYTE(v16) = objc_msgSend(v14, "fetchEncodedPeopleWithError:cancelationToken:batchHandler:", &obj, v16, v17);
  objc_storeStrong((id *)(v15 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v16;

}

+ (id)contactBuffersDecoderForFetchRequest:(id)a3
{
  id v3;
  CNiOSABContactBuffersDecoder *v4;

  v3 = a3;
  v4 = -[CNiOSABContactBuffersDecoder initWithFetchRequest:]([CNiOSABContactBuffersDecoder alloc], "initWithFetchRequest:", v3);

  return v4;
}

void __51__CNiOSAddressBookDataMapper_meContactIdentifiers___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  CFTypeRef v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (const void *)ABAddressBookCopyMe();
  if (v2)
  {
    v3 = v2;
    v4 = ABRecordCopyValue(v2, *MEMORY[0x1E0CF6090]);
    if (v4)
    {
      CFAutorelease(v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    CFRelease(v3);
  }
}

void __92__CNiOSAddressBookDataMapper_encodedContactsCursorForFetchRequest_cursorCleanupBlock_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  -[CNiOSAddressBookDataMapper encodedPeopleFetcherWithAddressBook:addressBookCleanupBlock:cursorCleanupBlock:fetchRequest:](*(_QWORD *)(a1 + 32), a2, a3, *(void **)(a1 + 48), *(void **)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)encodedPeopleFetcherWithAddressBook:(void *)a3 addressBookCleanupBlock:(void *)a4 cursorCleanupBlock:(void *)a5 fetchRequest:
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  _QWORD aBlock[4];
  id v23;

  v9 = a3;
  v10 = v9;
  if (a1)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __122__CNiOSAddressBookDataMapper_encodedPeopleFetcherWithAddressBook_addressBookCleanupBlock_cursorCleanupBlock_fetchRequest___block_invoke;
    aBlock[3] = &unk_1E29F9F70;
    v23 = v9;
    v11 = a5;
    v12 = a4;
    v13 = _Block_copy(aBlock);
    v14 = (void *)objc_opt_class();
    v15 = *(void **)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 72);
    v18 = *(id *)(a1 + 24);
    v19 = v15;
    objc_msgSend(v14, "encodedPeopleFetcherForForFetchRequest:addressBook:managedConfiguration:addressBookCompletionHandler:cursorCompletionHandler:environment:identifierAuditMode:authorizationContext:", v11, a2, v19, v13, v12, v18, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __61__CNiOSAddressBookDataMapper_userActivityUserInfoForContact___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (ABAddressBookGetPersonWithRecordID(a2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier")))
  {
    objc_msgSend(*(id *)(a1 + 32), "isUnified");
    ABPersonGetUserActivityUserInfo();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

void __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke()
{
  ABCopyArrayOfSectionListOffsetsForManagedConfiguration();
}

void __59__CNiOSAddressBookDataMapper_unifiedContactCountWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration());
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __122__CNiOSAddressBookDataMapper_encodedPeopleFetcherWithAddressBook_addressBookCleanupBlock_cursorCleanupBlock_fetchRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__CNiOSAddressBookDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke(uint64_t a1)
{
  uint64_t PersonMatchingUserActivityUserInfo;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  PersonMatchingUserActivityUserInfo = ABAddressBookFindPersonMatchingUserActivityUserInfo();
  +[CNiOSABConversions contactFromABPerson:keysToConvert:mutable:]((uint64_t)CNiOSABConversions, PersonMatchingUserActivityUserInfo, *(void **)(a1 + 40), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

CFIndex __39__CNiOSAddressBookDataMapper_hasGroups__block_invoke(uint64_t a1, ABAddressBookRef addressBook)
{
  CFIndex result;

  result = ABAddressBookGetGroupCount(addressBook);
  if (result >= 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

void __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "matchInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactMatchInfosFromABMatchInfos:contacts:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "didFetchContacts:error:", v6, 0);
  }

}

void __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CNiOSAddressBookDataMapper_contactObservableForFetchRequest___block_invoke_3;
  v8[3] = &unk_1E29F88F0;
  v9 = v5;
  v7 = v5;
  objc_msgSend(a2, "_cn_map:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "observerDidReceiveResult:", v6);

}

void __102__CNiOSAddressBookDataMapper_fetchEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[4];
  v5 = v4;
  v7 = a2;
  objc_msgSend(v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didFetchEncodedContacts:error:", v6, 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id obj;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

    if (v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v5, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __111__CNiOSAddressBookDataMapper_fetchAndDecodeEncodedContactsForFetchRequest_error_cancelationToken_batchHandler___block_invoke_2;
      v13[3] = &unk_1E29F8990;
      v14 = *(id *)(a1 + 32);
      v15 = v5;
      v17 = *(id *)(a1 + 48);
      v16 = *(id *)(a1 + 40);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v10 + 40);
      v11 = objc_msgSend(v8, "decodeContactsFromData:moreComing:replyHandler:error:", v9, a3 ^ 1u, v13, &obj);
      objc_storeStrong((id *)(v10 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v11;

    }
  }
  else
  {

  }
}

- (id)unifiedContactCountWithError:(id *)a3
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__CNiOSAddressBookDataMapper_unifiedContactCountWithError___block_invoke;
  v13[3] = &unk_1E29F9E08;
  v13[4] = self;
  v13[5] = &v14;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v15[5];
  objc_msgSend(v7, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v10;
  if (a3 && !v10)
    *a3 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v14, 8);
  return v11;
}

- (id)meContactIdentifiers:(id *)a3
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v5 = addressBook;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__CNiOSAddressBookDataMapper_meContactIdentifiers___block_invoke;
  v14[3] = &unk_1E29F9DE0;
  v14[4] = &v15;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v5, "performSynchronousWorkWithInvalidatedAddressBook:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isSuccess") & 1) != 0)
  {
    if (v16[5])
    {
      v21[0] = v16[5];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 200);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v9 = v12;
    if (a3 && !v12)
      *a3 = objc_retainAutorelease(v11);

    v10 = v9;
  }
  else
  {
    objc_msgSend(v6, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (CNiOSAddressBookDataMapper)initWithConfiguration:(id)a3
{
  return -[CNiOSAddressBookDataMapper initWithConfiguration:addressBook:](self, "initWithConfiguration:addressBook:", a3, 0);
}

- (id)currentHistoryToken
{
  void *v2;
  void *v3;
  void *v4;

  -[CNiOSAddressBookDataMapper currentHistoryAnchor](self, "currentHistoryAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "historyToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentHistoryAnchor
{
  CNiOSAddressBookDataMapper *v2;
  void *v3;
  void *v4;
  void *v5;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v2 = self;
  if (self)
    self = (CNiOSAddressBookDataMapper *)self->_authorizationContext;
  if (-[CNiOSAddressBookDataMapper isLimitedAccessGranted](self, "isLimitedAccessGranted"))
  {
    v3 = (void *)MEMORY[0x1E0D13B60];
    +[CNChangeHistoryAnchor limitedAccessHistoryAnchor](CNChangeHistoryAnchor, "limitedAccessHistoryAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resultWithValue:orError:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__16;
    v18 = __Block_byref_object_dispose__16;
    v19 = 0;
    if (v2)
      addressBook = v2->_addressBook;
    else
      addressBook = 0;
    v7 = addressBook;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__CNiOSAddressBookDataMapper_currentHistoryAnchor__block_invoke;
    v13[3] = &unk_1E29F9DE0;
    v13[4] = &v14;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v7, "performSynchronousWorkWithInvalidatedAddressBook:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0D13B60];
    v10 = v15[5];
    objc_msgSend(v8, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resultWithValue:orError:", v10, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v14, 8);
  }
  return v5;
}

void __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke(uint64_t a1, const void *a2)
{
  int v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[6];
  _QWORD v16[4];
  id v17;
  const void *v18;
  id v19;

  v4 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EE18E738);
  v5 = *(void **)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v7 = objc_msgSend(v5, "includesDisabledContainers");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(id *)(v8 + 40);
    v16[0] = v6;
    v16[1] = 3221225472;
    v16[2] = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_2;
    v16[3] = &unk_1E29FA440;
    v17 = *(id *)(a1 + 32);
    v18 = a2;
    CNBridgeABCFResultAndErrorFromBlock(&v19, (uint64_t)v16);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), v19);

  }
  else
  {
    if (v5)
    {
      v9 = 0;
    }
    else
    {
      v10 = ABAddressBookCopyArrayOfAllSources(a2);
      if (v10)
        v10 = (void *)CFAutorelease(v10);
      v9 = v10;
    }
    v7 = 0;
  }
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_3;
  v15[3] = &unk_1E29FA230;
  v15[4] = *(_QWORD *)(a1 + 40);
  v15[5] = a2;
  objc_msgSend(v9, "_cn_filter:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[CNiOSABConversions containersFromABSources:remote:includeDisabledSources:]((uint64_t)CNiOSABConversions, (uint64_t)v11, *(_BYTE *)(a1 + 64), v7);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
}

void __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const __CFArray *v5;
  uint64_t Policy;
  CNiOSABPolicy *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(id *)(v4 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_2;
  v10[3] = &unk_1E29FA440;
  v11 = *(id *)(a1 + 32);
  v12 = a2;
  CNBridgeABCFResultAndErrorFromBlock(&v13, (uint64_t)v10);
  v5 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), v13);
  if (-[__CFArray count](v5, "count"))
  {
    CFArrayGetValueAtIndex(v5, 0);
    if (objc_msgSend(*(id *)(a1 + 40), "ignoresGuardianRestrictions"))
      ABSourceSetShouldIgnoreCapabilitiesRestrictions();
    Policy = ABSourceGetPolicy();
    v7 = -[CNiOSABPolicy initWithAddressBookPolicy:readOnly:]([CNiOSABPolicy alloc], "initWithAddressBookPolicy:readOnly:", Policy, ABSourceIsContentReadonly());
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

uint64_t __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyContainersInAddressBook:error:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyContainersInAddressBook:error:", *(_QWORD *)(a1 + 40), a2);
}

void __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke_2(uint64_t a1, void *a2, CFIndex a3)
{
  void *v5;
  const __CFArray *v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(const __CFArray **)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "numberWithInteger:", CFArrayGetValueAtIndex(v6, a3));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v7, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
}

void __50__CNiOSAddressBookDataMapper_currentHistoryAnchor__block_invoke(uint64_t a1)
{
  CNChangeHistoryAnchor *v2;
  uint64_t v3;
  void *v4;

  v2 = -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", (int)ABAddressBookGetSequenceNumber());
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNiOSAddressBookDataMapper;
  objc_msgSendSuper2(&v2, sel_initialize);
  ABInitialize();
}

uint64_t __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_3(uint64_t a1)
{
  return -[CNiOSAddressBookDataMapper _hasManagedAccessToReadFromAccountCorrespondingToSource:fromAddressBook:](*(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_managedAccountsCache, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_addressBook, 0);
}

- (BOOL)hasGroups
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v3 = addressBook;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__CNiOSAddressBookDataMapper_hasGroups__block_invoke;
  v6[3] = &unk_1E29F9DE0;
  v6[4] = &v7;
  v4 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v3, "performSynchronousWorkWithInvalidatedAddressBook:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

- (uint64_t)_hasManagedAccessToReadFromAccountCorrespondingToSource:(uint64_t)result fromAddressBook:
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](result))
      return -[CNiOSAddressBookDataMapper _canReadUnderManagementRestrictionsFromSource:inAddressBook:](v1);
    else
      return 1;
  }
  return result;
}

- (uint64_t)_hasManagementRestrictionsEnabled
{
  if (a1 && *(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 40), "deviceHasManagementRestrictions");
  else
    return 0;
}

- (id)userActivityUserInfoForContact:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__CNiOSAddressBookDataMapper_userActivityUserInfoForContact___block_invoke;
  v11[3] = &unk_1E29F9E08;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  v8 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)contactWithUserActivityUserInfo:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  v24 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v9 = addressBook;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__CNiOSAddressBookDataMapper_contactWithUserActivityUserInfo_keysToFetch___block_invoke;
  v15[3] = &unk_1E29FA5F0;
  v10 = v6;
  v16 = v10;
  v18 = &v19;
  v11 = v7;
  v17 = v11;
  v12 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v9, "performSynchronousWorkWithInvalidatedAddressBook:", v15);

  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (id)sectionListOffsetsForSortOrder:(int64_t)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  _QWORD v17[2];
  id (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[6];
  _BOOL4 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = 0;
  v6 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__16;
  v27 = __Block_byref_object_dispose__16;
  v28 = 0;
  v7 = MEMORY[0x1E0C809B0];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v11 = addressBook;
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke;
    v21[3] = &unk_1E29F9E80;
    v22 = a3 == 3;
    v21[4] = self;
    v21[5] = &v23;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v11, "performSynchronousWorkWithInvalidatedAddressBook:", v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)v24[5];
  }
  v17[0] = v7;
  v17[1] = 3221225472;
  v18 = __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke_3;
  v19 = &unk_1E29F9EA8;
  v12 = v6;
  v20 = v12;
  v13 = v5;
  v14 = v17;
  v15 = v14;
  if (a4 && !v13)
  {
    v18((uint64_t)v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (id)policyWithDescription:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  id (*v22)(uint64_t);
  void *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__16;
  v36 = __Block_byref_object_dispose__16;
  v37 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__16;
  v30[4] = __Block_byref_object_dispose__16;
  v31 = 0;
  objc_msgSend(v6, "containerIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  if (!v7)
  {
    -[CNiOSAddressBookDataMapper defaultContainerIdentifier](self, "defaultContainerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_9:
      v15 = (void *)v33[5];
      v21[0] = v8;
      v21[1] = 3221225472;
      v22 = __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_3;
      v23 = &unk_1E29FA490;
      v24 = v30;
      v16 = v15;
      v17 = v21;
      v13 = v17;
      if (a4 && !v16)
      {
        v22((uint64_t)v17);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_15;
    }
  }
  v38[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContainer predicateForContainersWithIdentifiers:](CNContainer, "predicateForContainersWithIdentifiers:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EE18E738))
  {
LABEL_8:

    goto LABEL_9;
  }
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v12 = addressBook;
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke;
  v25[3] = &unk_1E29FA4B8;
  v28 = v30;
  v13 = v10;
  v26 = v13;
  v27 = v6;
  v29 = &v32;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v12, "performSynchronousWorkWithInvalidatedAddressBook:", v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "isSuccess") & 1) != 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v14, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  v16 = 0;
LABEL_15:

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

  return v16;
}

- (id)containersMatchingPredicate:(id)a3 error:(id *)a4
{
  return -[CNiOSAddressBookDataMapper _containersMatchingPredicate:remote:error:]((id *)&self->super.isa, a3, 0, a4);
}

- (id)_containersMatchingPredicate:(char)a3 remote:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  id (*v21)(uint64_t);
  void *v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id *v26;
  _QWORD *v27;
  uint64_t *v28;
  char v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v7 = a2;
  v8 = v7;
  if (a1)
  {
    if (!v7 || (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE18E738) & 1) != 0)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__16;
      v36 = __Block_byref_object_dispose__16;
      v37 = 0;
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x3032000000;
      v30[3] = __Block_byref_object_copy__16;
      v30[4] = __Block_byref_object_dispose__16;
      v31 = 0;
      v9 = a1[2];
      v10 = MEMORY[0x1E0C809B0];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke;
      v24[3] = &unk_1E29FA468;
      v25 = v8;
      v26 = a1;
      v27 = v30;
      v28 = &v32;
      v29 = a3;
      objc_msgSend(v9, "performSynchronousWorkWithInvalidatedAddressBook:", v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isSuccess") & 1) != 0)
      {
        v12 = (void *)v33[5];
        v20[0] = v10;
        v20[1] = 3221225472;
        v21 = __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_4;
        v22 = &unk_1E29FA490;
        v23 = v30;
        a1 = v12;
        v13 = v20;
        v14 = v13;
        if (!a4 || a1)
          goto LABEL_15;
        v21((uint64_t)v13);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v11, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v16;
        if (!a4)
        {
          a1 = 0;
          goto LABEL_15;
        }
        v15 = objc_retainAutorelease(v16);
        a1 = 0;
      }
      *a4 = v15;
LABEL_15:

      _Block_object_dispose(v30, 8);
      _Block_object_dispose(&v32, 8);

      goto LABEL_16;
    }
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 400);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);

    a1 = 0;
  }
LABEL_16:

  return a1;
}

- (id)encodedContactsCursorForFetchRequest:(id)a3 cursorCleanupBlock:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CNContactsLogger *logger;
  CNContactsLogger *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, void *);
  void *v28;
  CNiOSAddressBookDataMapper *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__16;
  v37 = __Block_byref_object_dispose__16;
  v38 = 0;
  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v11 = logger;
  objc_msgSend(v8, "effectivePredicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "unifyResults");
  objc_msgSend(v8, "keysToFetch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsLogger fetchEncodedContactsMatchingPredicate:unifyResults:keysToFetch:](v11, "fetchEncodedContactsMatchingPredicate:unifyResults:keysToFetch:", v12, v13, v14);

  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v16 = addressBook;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __92__CNiOSAddressBookDataMapper_encodedContactsCursorForFetchRequest_cursorCleanupBlock_error___block_invoke;
  v28 = &unk_1E29F9F98;
  v32 = &v33;
  v29 = self;
  v17 = v9;
  v31 = v17;
  v18 = v8;
  v30 = v18;
  -[CNiOSAddressBook performAsynchronousWorkWithInvalidatedAddressBook:](v16, "performAsynchronousWorkWithInvalidatedAddressBook:", &v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)v34[5];
  objc_msgSend(v19, "error", v25, v26, v27, v28, v29);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v20;
  v23 = v22;
  if (a5 && !v22)
    *a5 = objc_retainAutorelease(v21);

  _Block_object_dispose(&v33, 8);
  return v23;
}

+ (id)os_log
{
  objc_opt_self();
  if (os_log_cn_once_token_0_8 != -1)
    dispatch_once(&os_log_cn_once_token_0_8, &__block_literal_global_57);
  return (id)os_log_cn_once_object_0_8;
}

void __36__CNiOSAddressBookDataMapper_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNiOSAddressBookDataMapper");
  v1 = (void *)os_log_cn_once_object_0_8;
  os_log_cn_once_object_0_8 = (uint64_t)v0;

}

+ (id)encodedPeopleFetcherForForFetchRequest:(id)a3 addressBook:(void *)a4 managedConfiguration:(id)a5 addressBookCompletionHandler:(id)a6 cursorCompletionHandler:(id)a7 environment:(id)a8 identifierAuditMode:(int64_t)a9 authorizationContext:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CNiOSEncodedPeopleFetcher *v22;

  v16 = a10;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  v22 = -[CNiOSEncodedPeopleFetcher initWithFetchRequest:addressBook:managedConfiguration:addressBookCompletionHandler:cursorCompletionHandler:environment:identifierAuditMode:authorizationContext:]([CNiOSEncodedPeopleFetcher alloc], "initWithFetchRequest:addressBook:managedConfiguration:addressBookCompletionHandler:cursorCompletionHandler:environment:identifierAuditMode:authorizationContext:", v21, a4, v20, v19, v18, v17, a9, v16);

  return v22;
}

- (CNiOSAddressBookDataMapper)init
{
  CNDataMapperConfiguration *v3;
  CNiOSAddressBookDataMapper *v4;

  v3 = objc_alloc_init(CNDataMapperConfiguration);
  v4 = -[CNiOSAddressBookDataMapper initWithConfiguration:addressBook:](self, "initWithConfiguration:addressBook:", v3, 0);

  return v4;
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  if (self)
    self = (CNiOSAddressBookDataMapper *)self->_authorization;
  -[CNiOSAddressBookDataMapper requestAccessForEntityType:completionHandler:](self, "requestAccessForEntityType:completionHandler:", a3, a4);
}

- (id)authorizedKeysForContactKeys:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)identifierWithError:(id *)a3
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v5;
  void *v6;
  const void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v5 = addressBook;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__CNiOSAddressBookDataMapper_identifierWithError___block_invoke;
  v13[3] = &unk_1E29F9DE0;
  v13[4] = &v14;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v5, "performSynchronousWorkWithInvalidatedAddressBook:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (const void *)v15[3];
  if (v7)
  {
    CFAutorelease(v7);
    v8 = (void *)v15[3];
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v6, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v10;
  if (a3 && !v10)
    *a3 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v14, 8);
  return v11;
}

- (uint64_t)addressBook
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t __50__CNiOSAddressBookDataMapper_identifierWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABAddressBookCopyUniqueIdentifier();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (int)saveSequenceCount
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = -1;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v3 = addressBook;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__CNiOSAddressBookDataMapper_saveSequenceCount__block_invoke;
  v6[3] = &unk_1E29F9DE0;
  v6[4] = &v7;
  v4 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v3, "performSynchronousWorkWithInvalidatedAddressBook:", v6);

  LODWORD(v3) = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return (int)v3;
}

uint64_t __47__CNiOSAddressBookDataMapper_saveSequenceCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABAddressBookGetSequenceNumber();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)_legacyContactCountForFetchRequest:(_QWORD *)a3 error:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a2;
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__16;
    v21 = __Block_byref_object_dispose__16;
    v22 = 0;
    v6 = *(id *)(a1 + 16);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __71__CNiOSAddressBookDataMapper__legacyContactCountForFetchRequest_error___block_invoke;
    v13[3] = &unk_1E29F9E30;
    v14 = v5;
    v15 = a1;
    v16 = &v17;
    objc_msgSend(v6, "performSynchronousWorkWithInvalidatedAddressBook:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)v18[5];
    objc_msgSend(v7, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    v11 = v10;
    if (a3 && !v10)
      *a3 = objc_retainAutorelease(v9);

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __71__CNiOSAddressBookDataMapper__legacyContactCountForFetchRequest_error___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t PreferredNamePeopleCountForManagedConfiguration;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "unifyResults"))
    PreferredNamePeopleCountForManagedConfiguration = ABAddressBookGetPreferredNamePeopleCountForManagedConfiguration();
  else
    PreferredNamePeopleCountForManagedConfiguration = ABAddressBookGetPersonCount(a2);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", PreferredNamePeopleCountForManagedConfiguration);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)contactCountForFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CNiOSEncodedPeopleCounter *v8;
  CNiOSAddressBook *v9;
  CNManagedConfiguration *managedConfiguration;
  CNiOSEncodedPeopleCounter *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  objc_msgSend(v6, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [CNiOSEncodedPeopleCounter alloc];
    if (self)
    {
      v9 = self->_addressBook;
      managedConfiguration = self->_managedConfiguration;
    }
    else
    {
      v9 = 0;
      managedConfiguration = 0;
    }
    v11 = -[CNiOSEncodedPeopleCounter initWithFetchRequest:addressBook:managedConfiguration:](v8, "initWithFetchRequest:addressBook:managedConfiguration:", v6, v9, managedConfiguration);

    if (-[CNiOSEncodedPeopleCounter supportsCounting](v11, "supportsCounting"))
    {
      -[CNiOSEncodedPeopleCounter fetchContactCountWithError:](v11, "fetchContactCountWithError:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 104);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a4)
        *a4 = objc_retainAutorelease(v13);

      v12 = 0;
    }

  }
  else
  {
    -[CNiOSAddressBookDataMapper _legacyContactCountForFetchRequest:error:]((uint64_t)self, v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

id __67__CNiOSAddressBookDataMapper_sectionListOffsetsForSortOrder_error___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (BOOL)moveContacts:(id)a3 fromContainer:(id)a4 toContainer:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v15;
  uint64_t v16;
  void *v17;
  int v18;
  BOOL v19;
  id v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  id (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))();
  if (v12 && v11 && !v13)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2020000000;
    v37 = 0;
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v15 = addressBook;
    v16 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke;
    v30[3] = &unk_1E29F9E30;
    v31 = v11;
    v32 = v12;
    v33 = &v34;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v15, "performSynchronousWorkWithInvalidatedAddressBook:", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *((unsigned __int8 *)v35 + 24);
    v19 = *((_BYTE *)v35 + 24) != 0;
    v26[0] = v16;
    v26[1] = 3221225472;
    v27 = __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke_2;
    v28 = &unk_1E29F9EA8;
    v20 = v17;
    v29 = v20;
    v21 = v26;
    v22 = v21;
    if (a6 && !v18)
    {
      v27((uint64_t)v21);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1002);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a6)
      *a6 = objc_retainAutorelease(v23);

    v19 = 0;
  }

  return v19;
}

uint64_t __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke(uint64_t a1, const void *a2)
{
  ABRecordRef SourceWithRecordID;
  uint64_t result;
  BOOL v6;

  SourceWithRecordID = ABAddressBookGetSourceWithRecordID(a2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier"));
  result = (uint64_t)ABAddressBookGetSourceWithRecordID(a2, objc_msgSend(*(id *)(a1 + 40), "iOSLegacyIdentifier"));
  if (SourceWithRecordID)
    v6 = result == 0;
  else
    v6 = 1;
  if (!v6)
  {
    result = ABAddressBookMoveAllRecordsInSourceToSource();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  }
  return result;
}

id __75__CNiOSAddressBookDataMapper_moveContacts_fromContainer_toContainer_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (BOOL)fetchContactsForFetchRequest:(id)a3 error:(id *)a4 batchHandler:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  CNContactsLogger *logger;
  CNContactsLogger *v12;
  uint64_t v13;
  void *v14;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  CNContactsLogger *v22;
  CNContactsLogger *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  CNiOSAddressBookDataMapper *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v8 = a3;
  v9 = (void (**)(id, uint64_t, _QWORD))a5;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__16;
  v48 = __Block_byref_object_dispose__16;
  v49 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__16;
  v42 = __Block_byref_object_dispose__16;
  v43 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__16;
  v36 = __Block_byref_object_dispose__16;
  v37 = 0;
  objc_msgSend(v8, "effectivePredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v12 = logger;
  v13 = objc_msgSend(v8, "unifyResults");
  objc_msgSend(v8, "keysToFetch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsLogger fetchContactsMatchingPredicate:unifyResults:keysToFetch:](v12, "fetchContactsMatchingPredicate:unifyResults:keysToFetch:", v10, v13, v14);

  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v16 = addressBook;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __78__CNiOSAddressBookDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke;
  v26[3] = &unk_1E29F9ED0;
  v29 = &v44;
  v17 = v8;
  v27 = v17;
  v28 = self;
  v30 = &v38;
  v31 = &v32;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v16, "performSynchronousWorkWithInvalidatedAddressBook:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "isFailure"))
  {
    objc_msgSend(v18, "error");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v33[5];
    v33[5] = v19;

  }
  v21 = v45[5];
  if (v21)
    v9[2](v9, v21, v39[5]);
  if (self)
    v22 = self->_logger;
  else
    v22 = 0;
  v23 = v22;
  -[CNContactsLogger didFetchContacts:error:](v23, "didFetchContacts:error:", v45[5], v33[5]);

  v24 = v45[5];
  if (a4 && !v24)
    *a4 = objc_retainAutorelease((id)v33[5]);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v24 != 0;
}

void __78__CNiOSAddressBookDataMapper_fetchContactsForFetchRequest_error_batchHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;

  v4 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  obj = v6;
  v8 = a1[4];
  v7 = a1[5];
  if (v7)
    v9 = *(void **)(v7 + 24);
  else
    v9 = 0;
  v10 = (_QWORD *)a1[5];
  if (v10)
    v10 = (_QWORD *)v10[5];
  v11 = *(_QWORD *)(a1[8] + 8);
  v17 = *(id *)(v11 + 40);
  v12 = v10;
  v13 = v9;
  +[CNiOSContactFetcher contactsForFetchRequest:matchInfos:inAddressBook:environment:managedConfiguration:error:](CNiOSContactFetcher, "contactsForFetchRequest:matchInfos:inAddressBook:environment:managedConfiguration:error:", v8, &obj, a2, v13, v12, &v17);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  objc_storeStrong((id *)(v11 + 40), v17);
  v15 = *(_QWORD *)(a1[6] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

}

- (BOOL)setMeContact:(id)a3 error:(id *)a4
{
  id v6;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v6 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__16;
  v23 = __Block_byref_object_dispose__16;
  v24 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v8 = addressBook;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke;
  v15[3] = &unk_1E29F9FE0;
  v9 = v6;
  v16 = v9;
  v17 = &v25;
  v18 = &v19;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v8, "performSynchronousWorkWithInvalidatedAddressBook:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *((unsigned __int8 *)v26 + 24);
  objc_msgSend(v10, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    v12 = (void *)v20[5];
  if (a4 && !v11)
    *a4 = objc_retainAutorelease(v12);

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11 != 0;
}

void __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v4;
  void *v5;
  char v6;
  _QWORD v7[5];
  id obj;

  ABAddressBookGetPersonWithRecordID(a2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABAddressBookSetMe();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    v7[4] = a2;
    obj = v5;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke_2;
    v7[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
    v6 = CNBridgeBoolResultAndErrorFromBlock(&obj, (uint64_t)v7);
    objc_storeStrong((id *)(v4 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
  }
}

BOOL __49__CNiOSAddressBookDataMapper_setMeContact_error___block_invoke_2(uint64_t a1, CFErrorRef *a2)
{
  return ABAddressBookSave(*(ABAddressBookRef *)(a1 + 32), a2);
}

- (BOOL)setMeContact:(id)a3 forContainer:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, const void *);
  void *v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v8 = a3;
  v9 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__16;
  v31 = __Block_byref_object_dispose__16;
  v32 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v11 = addressBook;
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke;
  v22 = &unk_1E29FA028;
  v12 = v8;
  v23 = v12;
  v13 = v9;
  v24 = v13;
  v25 = &v33;
  v26 = &v27;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v11, "performSynchronousWorkWithInvalidatedAddressBook:", &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *((unsigned __int8 *)v34 + 24);
  objc_msgSend(v14, "error", v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = (void *)v28[5];
  if (a5 && !v15)
    *a5 = objc_retainAutorelease(v16);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v15 != 0;
}

void __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke(uint64_t a1, const void *a2)
{
  ABRecordRef PersonWithRecordID;
  ABRecordRef SourceWithRecordID;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[5];
  id obj;
  _QWORD v14[6];
  id v15;

  PersonWithRecordID = ABAddressBookGetPersonWithRecordID(a2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier"));
  SourceWithRecordID = ABAddressBookGetSourceWithRecordID(a2, objc_msgSend(*(id *)(a1 + 40), "iOSLegacyIdentifier"));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(id *)(v6 + 40);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_2;
  v14[3] = &__block_descriptor_48_e20_B16__0_____CFError_8l;
  v14[4] = SourceWithRecordID;
  v14[5] = PersonWithRecordID;
  LOBYTE(PersonWithRecordID) = CNBridgeBoolResultAndErrorFromBlock(&v15, (uint64_t)v14);
  objc_storeStrong((id *)(v6 + 40), v15);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)PersonWithRecordID;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(_QWORD *)(v8 + 40);
    v9 = (id *)(v8 + 40);
    if (!v10)
    {
      v12[4] = a2;
      obj = 0;
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_3;
      v12[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
      v11 = CNBridgeBoolResultAndErrorFromBlock(&obj, (uint64_t)v12);
      objc_storeStrong(v9, obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v11;
    }
  }
}

uint64_t __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_2()
{
  return ABSourceSetMe();
}

BOOL __62__CNiOSAddressBookDataMapper_setMeContact_forContainer_error___block_invoke_3(uint64_t a1, CFErrorRef *a2)
{
  return ABAddressBookSave(*(ABAddressBookRef *)(a1 + 32), a2);
}

- (BOOL)setBestMeIfNeededForGivenName:(id)a3 familyName:(id)a4 email:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16;
  v33 = __Block_byref_object_dispose__16;
  v34 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v14 = addressBook;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke;
  v23[3] = &unk_1E29FA050;
  v27 = &v35;
  v15 = v10;
  v24 = v15;
  v16 = v11;
  v25 = v16;
  v17 = v12;
  v26 = v17;
  v28 = &v29;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v14, "performSynchronousWorkWithInvalidatedAddressBook:", v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *((unsigned __int8 *)v36 + 24);
  v20 = (void *)v30[5];
  v21 = v20;
  if (!v20)
  {
    objc_msgSend(v18, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a6 && !v19)
    *a6 = objc_retainAutorelease(v21);
  if (!v20)

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

  return v19 != 0;
}

void __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = ABAddressBookSetBestMeIfNeeded();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(id *)(v4 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke_2;
    v7[3] = &__block_descriptor_40_e20_B16__0_____CFError_8l;
    v7[4] = a2;
    v5 = CNBridgeBoolResultAndErrorFromBlock(&v8, (uint64_t)v7);
    objc_storeStrong((id *)(v4 + 40), v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5;
    v6 = *(_QWORD *)(a1 + 64);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) || *(_QWORD *)(*(_QWORD *)(v6 + 8) + 40))
      NSLog(CFSTR("setBestMeIfNeededForGivenName: failed ABAddressBookSave, error = %@"), *(_QWORD *)(*(_QWORD *)(v6 + 8) + 40));
  }
}

BOOL __83__CNiOSAddressBookDataMapper_setBestMeIfNeededForGivenName_familyName_email_error___block_invoke_2(uint64_t a1, CFErrorRef *a2)
{
  return ABAddressBookSave(*(ABAddressBookRef *)(a1 + 32), a2);
}

- (uint64_t)canExecuteSaveRequest:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  const __CFString *v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  void *v67;
  const __CFString *v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a1)
  {
LABEL_42:
    v41 = 0;
    goto LABEL_43;
  }
  if (objc_msgSend(v5, "hasConflictingSaveOperations"))
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 302);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
LABEL_41:

    goto LABEL_42;
  }
  objc_msgSend(v6, "addedAccounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(v6, "addedAccountContainersByParentContainerIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v59;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v59 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v16))
        {
          if (a3)
          {
            objc_msgSend(v6, "addedAccounts");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v57[0] = MEMORY[0x1E0C809B0];
            v57[1] = 3221225472;
            v57[2] = __58__CNiOSAddressBookDataMapper_canExecuteSaveRequest_error___block_invoke;
            v57[3] = &unk_1E29FA078;
            v57[4] = v16;
            objc_msgSend(v18, "_cn_firstObjectPassingTest:", v57);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v67 = v19;
              v68 = CFSTR("CNInvalidRecords");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v69 = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v21 = 0;
            }
            +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v21);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_41;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      if (v13)
        continue;
      break;
    }
  }

  objc_msgSend(v6, "addedMembersByGroupIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {

  }
  else
  {
    objc_msgSend(v6, "addedSubgroupsByGroupIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (!v23)
    {
      v41 = 1;
      goto LABEL_43;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addedMembersByGroupIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allKeys");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v26);

  objc_msgSend(v6, "addedSubgroupsByGroupIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v28);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(v6, "addedGroupsByContainerIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allValues");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  if (v48)
  {
    v31 = *(_QWORD *)v54;
    v47 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v30);
        v33 = v30;
        v34 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
        v49 = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v35 = v34;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v50;
          while (2)
          {
            for (k = 0; k != v37; ++k)
            {
              if (*(_QWORD *)v50 != v38)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "identifier", v47);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "containsObject:", v40))
              {
                v30 = v33;
                if (a3)
                {
                  objc_msgSend(v6, "groupWithAddedSubgroupForGroupIdentifier:", v40);
                  v42 = objc_claimAutoreleasedReturnValue();
                  v43 = (void *)v42;
                  if (v42)
                  {
                    v62 = v42;
                    v63 = CFSTR("CNInvalidRecords");
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = v44;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
                    v45 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v45 = 0;
                  }
                  +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v45);
                  *a3 = (id)objc_claimAutoreleasedReturnValue();

                }
                v41 = 0;
                goto LABEL_49;
              }

            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
            if (v37)
              continue;
            break;
          }
        }

        v30 = v33;
        v31 = v47;
      }
      v41 = 1;
      v48 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v48);
  }
  else
  {
    v41 = 1;
  }
LABEL_49:

LABEL_43:
  return v41;
}

uint64_t __58__CNiOSAddressBookDataMapper_canExecuteSaveRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return -[CNiOSAddressBookDataMapper executeSaveRequest:response:authorizationContext:error:](self, "executeSaveRequest:response:authorizationContext:error:", a3, 0, 0, a4);
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  char v12;
  CNMutableSaveResponse *v13;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v15;
  id v16;
  CNMutableSaveResponse *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  CNContactsLogger *v21;
  CNContactsLogger *v22;
  BOOL v23;
  CNContactsLogger *logger;
  CNContactsLogger *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void *v30;
  id v31;
  CNMutableSaveResponse *v32;
  CNiOSAddressBookDataMapper *v33;
  uint64_t *v34;
  uint64_t *v35;
  id obj;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  v10 = a3;
  v11 = a5;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 1;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__16;
  v41 = __Block_byref_object_dispose__16;
  v42 = 0;
  obj = 0;
  v12 = -[CNiOSAddressBookDataMapper canExecuteSaveRequest:error:]((uint64_t)self, v10, &obj);
  objc_storeStrong(&v42, obj);
  if ((v12 & 1) != 0)
  {
    if (a4)
    {
      v13 = objc_retainAutorelease(objc_alloc_init(CNMutableSaveResponse));
      *a4 = v13;
      if (self)
      {
LABEL_4:
        addressBook = self->_addressBook;
LABEL_5:
        v15 = addressBook;
        v27 = MEMORY[0x1E0C809B0];
        v28 = 3221225472;
        v29 = __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke;
        v30 = &unk_1E29FA0A0;
        v16 = v10;
        v31 = v16;
        v17 = v13;
        v34 = &v43;
        v35 = &v37;
        v32 = v17;
        v33 = self;
        -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v15, "performSynchronousWorkWithInvalidatedAddressBook:", &v27);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v18, "isSuccess", v27, v28, v29, v30) & 1) == 0)
        {
          *((_BYTE *)v44 + 24) = 0;
          objc_msgSend(v18, "error");
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = (void *)v38[5];
          v38[5] = v19;

        }
        if (*((_BYTE *)v44 + 24))
        {
          -[CNiOSAddressBookDataMapper updateLimitedAccessListForSaveRequest:authorizationContext:]((uint64_t)self, v16, v11);
        }
        else
        {
          if (self)
            logger = self->_logger;
          else
            logger = 0;
          v25 = logger;
          -[CNContactsLogger saveRequestFailed:](v25, "saveRequestFailed:", v38[5]);

        }
        v23 = *((_BYTE *)v44 + 24) != 0;
        if (a6 && !*((_BYTE *)v44 + 24))
          *a6 = objc_retainAutorelease((id)v38[5]);

        goto LABEL_23;
      }
    }
    else
    {
      v13 = 0;
      if (self)
        goto LABEL_4;
    }
    addressBook = 0;
    goto LABEL_5;
  }
  if (self)
    v21 = self->_logger;
  else
    v21 = 0;
  v22 = v21;
  -[CNContactsLogger saveRequestInvalid:](v22, "saveRequestInvalid:", v38[5]);

  v23 = 0;
  if (a6)
    *a6 = objc_retainAutorelease((id)v38[5]);
LABEL_23:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  return v23;
}

void __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke(uint64_t a1, uint64_t a2)
{
  CNiOSABSaveContext *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t HasMeCardChanges;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  CFTypeRef cf;
  id v32;
  id v33;
  id v34;
  id v35;
  id obj;

  v3 = -[CNiOSABSaveContext initWithSaveRequest:response:addressBook:]([CNiOSABSaveContext alloc], "initWithSaveRequest:response:addressBook:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
  if (!v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v4 = os_log_create("com.apple.contacts", "data-access-error");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke_cold_1(v4);

    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (objc_msgSend(*(id *)(a1 + 32), "ignoresGuardianRestrictions"))
    ABAddressBookSetIgnoresGuardianRestrictions();
  if (objc_msgSend(*(id *)(a1 + 32), "ignoresContactProviderRestrictions"))
    ABAddressBookSetIgnoresContactProviderRestrictions();
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v9 + 40);
    v10 = -[CNiOSAddressBookDataMapper _fetchAllRecordsInSaveContext:error:](v8, v3, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v35 = *(id *)(v12 + 40);
      v13 = -[CNiOSAddressBookDataMapper _processAccountsFromSaveContext:error:](v11, v3, &v35);
      objc_storeStrong((id *)(v12 + 40), v35);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v13;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v14 = *(_QWORD *)(a1 + 48);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v34 = *(id *)(v15 + 40);
        v16 = -[CNiOSAddressBookDataMapper _processContainersFromSaveContext:error:](v14, v3, &v34);
        objc_storeStrong((id *)(v15 + 40), v34);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v16;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          v17 = *(_QWORD *)(a1 + 48);
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v33 = *(id *)(v18 + 40);
          v19 = -[CNiOSAddressBookDataMapper _processContactsFromSaveContext:error:](v17, v3, &v33);
          objc_storeStrong((id *)(v18 + 40), v33);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v19;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          {
            v20 = *(_QWORD *)(a1 + 48);
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v32 = *(id *)(v21 + 40);
            v22 = -[CNiOSAddressBookDataMapper _processGroupsFromSaveContext:error:](v20, v3, &v32);
            objc_storeStrong((id *)(v21 + 40), v32);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v22;
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
            {
              cf = 0;
              HasMeCardChanges = ABAddressBookHasMeCardChanges();
              objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                -[CNiOSABSaveContext addressBook](v3, "addressBook");
                objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                ABChangeHistorySetAddressBookClientIdentifier();

              }
              objc_msgSend(*(id *)(a1 + 32), "saveRequestIdentifier", cf);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              ABAddressBookSetSaveTransactionIdentifier();

              objc_msgSend(*(id *)(a1 + 32), "suppressChangeNotifications");
              ABAddressBookSetSuppressChangeNotifications();
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = ABAddressBookSave(-[CNiOSABSaveContext addressBook](v3, "addressBook"), (CFErrorRef *)&cf);
              objc_msgSend(*(id *)(a1 + 32), "transactionAuthor");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
                -[CNiOSABSaveContext addressBook](v3, "addressBook");
                ABChangeHistorySetAddressBookClientIdentifier();
              }
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
              {
                -[CNiOSAddressBookDataMapper _purgeMetadataFromDeletedContactsFromSaveContext:error:](*(_QWORD *)(a1 + 48), v3, 0);
                if (objc_msgSend(*(id *)(a1 + 32), "shouldRefetchContacts"))
                  -[CNiOSAddressBookDataMapper _postProcessContactsFromSaveContext:](*(_QWORD *)(a1 + 48), v3);
                -[CNiOSAddressBookDataMapper _postProcessGroupsFromSaveContext:](*(_QWORD *)(a1 + 48), v3);
                -[CNiOSAddressBookDataMapper _postProcessContainersFromSaveContext:](*(_QWORD *)(a1 + 48), v3);
                objc_msgSend(*(id *)(a1 + 40), "setDidAffectMeCard:", HasMeCardChanges);
              }
              else
              {
                +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
                v28 = objc_claimAutoreleasedReturnValue();
                v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
                v30 = *(void **)(v29 + 40);
                *(_QWORD *)(v29 + 40) = v28;

                if (cf)
                  CFRelease(cf);
              }
            }
          }
        }
      }
    }
  }

}

- (BOOL)_fetchAllRecordsInSaveContext:(_QWORD *)a3 error:
{
  id v5;
  _BOOL8 v6;

  v5 = a2;
  v6 = a1
    && -[CNiOSAddressBookDataMapper _fetchAccountsInSaveContext:error:](a1, v5, a3)
    && -[CNiOSAddressBookDataMapper _fetchContainersInSaveContext:error:](a1, v5, a3)
    && -[CNiOSAddressBookDataMapper _fetchContactsInSaveContext:error:](a1, v5, a3)
    && -[CNiOSAddressBookDataMapper _fetchGroupsInSaveContext:error:](a1, v5, a3);

  return v6;
}

- (uint64_t)_processAccountsFromSaveContext:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const void *v35;
  CFTypeRef v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  const void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int IntValue;
  uint64_t v69;
  uint64_t v70;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  id v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[4];
  id v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  CFErrorRef error;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  unsigned __int8 v106;
  uint64_t v107;
  const __CFString *v108;
  void *v109;
  uint64_t v110;
  const __CFString *v111;
  void *v112;
  _BYTE v113[128];
  const void *v114;
  const __CFString *v115;
  void *v116;
  _BYTE v117[128];
  void *v118;
  const __CFString *v119;
  void *v120;
  _BYTE v121[128];
  void *v122;
  const __CFString *v123;
  void *v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (!a1)
    goto LABEL_76;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  objc_msgSend(v4, "saveRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addedAccounts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
  if (v8)
  {
    v9 = v8;
    obj = v7;
    v10 = 0;
    v11 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v103 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v5, "abAccountsByIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v123 = CFSTR("CNInvalidRecords");
          v122 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v25;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 201, v26);
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_70;
        }
        v17 = ABAccountCreate();
        if (v17)
        {
          v18 = (const void *)v17;
          error = 0;
          objc_msgSend(v13, "identifier");
          if (ABAccountSetInternalUUID()
            && (objc_msgSend(v13, "externalIdentifierString"), ABAccountSetIdentifier())
            && ABAddressBookAddRecord((ABAddressBookRef)objc_msgSend(v5, "addressBook"), v18, &error))
          {
            objc_msgSend(v5, "abAccountsByIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKey:", v18, v20);

            v21 = 1;
          }
          else
          {
            +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
            v22 = objc_claimAutoreleasedReturnValue();

            if (error)
              CFRelease(error);
            v21 = 0;
            v10 = (void *)v22;
          }
          CFRelease(v18);
        }
        else
        {
          +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
          v23 = objc_claimAutoreleasedReturnValue();

          v21 = 0;
          v10 = (void *)v23;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
    }
    while (v9);

    if (!v21)
    {
LABEL_21:
      v24 = 0;
      goto LABEL_72;
    }
  }
  else
  {

    v10 = 0;
  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  objc_msgSend(v5, "saveRequest");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removedAccounts");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
  v76 = v5;
  if (!v75)
  {

    goto LABEL_53;
  }
  obj = v29;
  v74 = *(_QWORD *)v98;
  v30 = *MEMORY[0x1E0D137F8];
  v31 = 1;
  v73 = *MEMORY[0x1E0D137F8];
  do
  {
    v32 = 0;
    do
    {
      if (*(_QWORD *)v98 != v74)
        objc_enumerationMutation(obj);
      v33 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v32);
      objc_msgSend(v5, "addressBook");
      objc_msgSend(v33, "externalIdentifierString");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (const void *)ABAddressBookCopyAccountWithIdentifier();
      if (!v35)
      {

LABEL_65:
        v119 = CFSTR("CNInvalidRecordIdentifiers");
        objc_msgSend(v33, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v69 = objc_claimAutoreleasedReturnValue();
        +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v69);
        v27 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v69;
LABEL_70:

        v24 = 0;
        v10 = (void *)v27;
        goto LABEL_71;
      }
      v36 = CFAutorelease(v35);

      if (!v36)
        goto LABEL_65;
      v83 = v10;
      objc_msgSend(v5, "addressBook");
      v37 = (void *)ABAddressBookCopyArrayOfAllSourcesInAccount();
      v38 = MEMORY[0x1E0C809B0];
      v95[0] = MEMORY[0x1E0C809B0];
      v95[1] = 3221225472;
      v95[2] = __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke;
      v95[3] = &unk_1E29FA118;
      v39 = v5;
      v96 = v39;
      objc_msgSend(v37, "_cn_flatMap:", v95);
      v40 = objc_claimAutoreleasedReturnValue();
      v93[0] = v38;
      v93[1] = 3221225472;
      v93[2] = __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke_2;
      v93[3] = &unk_1E29FA118;
      v41 = v39;
      v94 = v41;
      v80 = v37;
      objc_msgSend(v37, "_cn_flatMap:", v93);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = (void *)v40;
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v30 + 16))(v30, v40) & 1) == 0)
        objc_msgSend(v42, "addObjectsFromArray:", v40);
      if (((*(uint64_t (**)(uint64_t, void *))(v30 + 16))(v30, v79) & 1) == 0)
        objc_msgSend(v42, "addObjectsFromArray:", v79);
      if (((*(uint64_t (**)(uint64_t, void *))(v30 + 16))(v30, v37) & 1) == 0)
        objc_msgSend(v42, "addObjectsFromArray:", v37);
      v77 = v32;
      objc_msgSend(v42, "addObject:", v36);
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v82 = v42;
      v43 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v44; ++j)
          {
            if (*(_QWORD *)v90 != v45)
              objc_enumerationMutation(v82);
            v47 = *(const void **)(*((_QWORD *)&v89 + 1) + 8 * j);
            error = 0;
            v31 &= ABAddressBookRemoveRecord((ABAddressBookRef)objc_msgSend(v41, "addressBook"), v47, &error);
            if ((v31 & 1) == 0)
            {
              v115 = CFSTR("CNInvalidRecords");
              v114 = v47;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = v48;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v49, v50);
              v51 = objc_claimAutoreleasedReturnValue();

              if (error)
                CFRelease(error);
              v83 = (void *)v51;
            }
          }
          v44 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v89, v117, 16);
        }
        while (v44);
      }

      v5 = v76;
      v32 = v77 + 1;
      v10 = v83;
      v30 = v73;
    }
    while (v77 + 1 != v75);
    v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v121, 16);
  }
  while (v75);

  if ((v31 & 1) == 0)
    goto LABEL_21;
LABEL_53:
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  objc_msgSend(v5, "saveRequest");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "defaultAccountContainersByAccountIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "allKeys");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v54;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v85, v113, 16);
  if (!v55)
  {
    v24 = 1;
    goto LABEL_71;
  }
  v56 = v55;
  v84 = v10;
  v57 = *(_QWORD *)v86;
  while (2)
  {
    v58 = 0;
    while (2)
    {
      if (*(_QWORD *)v86 != v57)
        objc_enumerationMutation(obj);
      v59 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v58);
      objc_msgSend(v76, "abAccountsByIdentifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v76, "saveRequest");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "defaultAccountContainersByAccountIdentifier");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectForKeyedSubscript:", v59);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v76, "abSourcesByIdentifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "identifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v61 || !v67)
      {
        v110 = v59;
        v111 = CFSTR("CNInvalidRecordIdentifiers");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 200;
LABEL_69:
        +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v70, v10);
        v27 = objc_claimAutoreleasedReturnValue();

        v5 = v76;
        goto LABEL_70;
      }
      IntValue = ABRecordGetIntValue();
      if (IntValue != ABRecordGetRecordID(v61))
      {
        v107 = v59;
        v108 = CFSTR("CNInvalidRecordIdentifiers");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 204;
        goto LABEL_69;
      }
      objc_msgSend(v76, "addressBook");
      ABAddressBookSetDefaultSourceForAccount();

      if (v56 != ++v58)
        continue;
      break;
    }
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v113, 16);
    v24 = 1;
    if (v56)
      continue;
    break;
  }
  v5 = v76;
  v10 = v84;
LABEL_71:

LABEL_72:
  if (a3 && (v24 & 1) == 0)
    *a3 = objc_retainAutorelease(v10);
  v106 = v24;

  a1 = v106;
LABEL_76:

  return a1;
}

- (BOOL)_processContainersFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  _BOOL8 v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x2020000000;
    v39 = 1;
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__16;
    v34 = __Block_byref_object_dispose__16;
    v35 = 0;
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addedAccountContainersByParentContainerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke;
    v25[3] = &unk_1E29FA140;
    v10 = v6;
    v28 = &v36;
    v29 = &v30;
    v26 = v10;
    v27 = a1;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v25);

    if (!*((_BYTE *)v37 + 24))
      goto LABEL_6;
    objc_msgSend(v10, "saveRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deletedContainers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_54;
    v21[3] = &unk_1E29FA168;
    v13 = v10;
    v22 = v13;
    v23 = &v36;
    v24 = &v30;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v21);

    if (*((_BYTE *)v37 + 24))
    {
      objc_msgSend(v13, "saveRequest");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updatedContainers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v9;
      v17[1] = 3221225472;
      v17[2] = __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_2;
      v17[3] = &unk_1E29FA168;
      v18 = v13;
      v19 = &v36;
      v20 = &v30;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v17);

      a1 = *((_BYTE *)v37 + 24) != 0;
      if (!a3)
        goto LABEL_9;
    }
    else
    {
LABEL_6:
      a1 = 0;
      if (!a3)
      {
LABEL_9:
        _Block_object_dispose(&v30, 8);

        _Block_object_dispose(&v36, 8);
        goto LABEL_10;
      }
    }
    if (!a1)
      *a3 = objc_retainAutorelease((id)v31[5]);
    goto LABEL_9;
  }
LABEL_10:

  return a1;
}

- (BOOL)_processContactsFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  id v18;
  id v19;
  id v21;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  id *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 1;
    v34 = 0;
    v35 = (id *)&v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__16;
    v38 = __Block_byref_object_dispose__16;
    v39 = 0;
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addedContactsByContainerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke;
    v30[3] = &unk_1E29FA190;
    v30[4] = a1;
    v10 = v6;
    v31 = v10;
    v32 = &v40;
    v33 = &v34;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v30);

    if (!*((_BYTE *)v41 + 24))
      goto LABEL_9;
    -[CNiOSAddressBookDataMapper _logWillDeleteWithSaveContext:](a1, v10);
    objc_msgSend(v10, "saveRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deletedContacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_2;
    v26[3] = &unk_1E29FA1B8;
    v26[4] = a1;
    v13 = v10;
    v27 = v13;
    v28 = &v40;
    v29 = &v34;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v26);

    if (!*((_BYTE *)v41 + 24))
      goto LABEL_9;
    objc_msgSend(v13, "saveRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updatedContacts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3;
    v22[3] = &unk_1E29FA1E0;
    v22[4] = a1;
    v24 = &v34;
    v25 = &v40;
    v16 = v13;
    v23 = v16;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v22);

    if (*((_BYTE *)v41 + 24))
    {
      v21 = 0;
      v17 = -[CNiOSAddressBookDataMapper _processContactChangeRequestsFromSaveContext:error:](a1, v16, &v21);
      v18 = v21;
      v19 = v21;
      *((_BYTE *)v41 + 24) = v17;
      if (!v17)
        objc_storeStrong(v35 + 5, v18);

      a1 = *((_BYTE *)v41 + 24) != 0;
      if (!a3)
        goto LABEL_12;
    }
    else
    {
LABEL_9:
      a1 = 0;
      if (!a3)
      {
LABEL_12:
        _Block_object_dispose(&v34, 8);

        _Block_object_dispose(&v40, 8);
        goto LABEL_13;
      }
    }
    if (!a1)
      *a3 = objc_retainAutorelease(v35[5]);
    goto LABEL_12;
  }
LABEL_13:

  return a1;
}

- (BOOL)_processGroupsFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id *v17;
  _BOOL4 v18;
  id *v19;
  id v21;
  id obj;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v41 = 0;
    v42 = &v41;
    v43 = 0x2020000000;
    v44 = 1;
    v35 = 0;
    v36 = (id *)&v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__16;
    v39 = __Block_byref_object_dispose__16;
    v40 = 0;
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addedGroupsByContainerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke;
    v31[3] = &unk_1E29FA2C8;
    v10 = v6;
    v32 = v10;
    v33 = &v41;
    v34 = &v35;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v31);

    if (!*((_BYTE *)v42 + 24))
      goto LABEL_8;
    objc_msgSend(v10, "saveRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deletedGroups");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_2;
    v27[3] = &unk_1E29FA168;
    v13 = v10;
    v28 = v13;
    v29 = &v41;
    v30 = &v35;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v27);

    if (!*((_BYTE *)v42 + 24))
      goto LABEL_8;
    objc_msgSend(v13, "saveRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updatedGroups");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_3;
    v23[3] = &unk_1E29FA168;
    v16 = v13;
    v24 = v16;
    v25 = &v41;
    v26 = &v35;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

    if (!*((_BYTE *)v42 + 24))
      goto LABEL_8;
    v17 = v36;
    obj = v36[5];
    v18 = -[CNiOSAddressBookDataMapper _processContactMembershipsFromSaveContext:error:](a1, v16, &obj);
    objc_storeStrong(v17 + 5, obj);
    *((_BYTE *)v42 + 24) = v18;
    if (v18)
    {
      v19 = v36;
      v21 = v36[5];
      a1 = -[CNiOSAddressBookDataMapper _processSubgroupMembershipsFromSaveContext:error:](a1, v16, &v21);
      objc_storeStrong(v19 + 5, v21);
      *((_BYTE *)v42 + 24) = a1;
      if (!a3)
        goto LABEL_11;
    }
    else
    {
LABEL_8:
      a1 = 0;
      if (!a3)
      {
LABEL_11:

        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v41, 8);
        goto LABEL_12;
      }
    }
    if (!a1)
      *a3 = objc_retainAutorelease(v36[5]);
    goto LABEL_11;
  }
LABEL_12:

  return a1;
}

- (uint64_t)_purgeMetadataFromDeletedContactsFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CNContactImageStore *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  CNContactPosterStore *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  char v21;
  _QWORD *v23;
  id v24;
  id v25;

  v5 = a2;
  if (a1)
  {
    v6 = (void *)MEMORY[0x19400675C]();
    objc_msgSend(v5, "contactIdentifiersNeedingMetadataPurge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v23 = a3;
      v9 = objc_alloc_init(CNContactImageStore);
      objc_msgSend(v5, "contactIdentifiersNeedingMetadataPurge");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContactImageSaveRequest saveRequestToDeleteImagesForContactIdentifiers:](CNContactImageSaveRequest, "saveRequestToDeleteImagesForContactIdentifiers:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0;
      v12 = -[CNContactImageStore performSaveRequest:error:](v9, "performSaveRequest:error:", v11, &v25);
      v13 = v25;
      if (!v12)
        objc_msgSend(*(id *)(a1 + 32), "deleteImageRecentsMetadataRequestFailed:", v13);
      v14 = objc_alloc_init(CNContactPosterStore);
      objc_msgSend(v5, "contactIdentifiersNeedingMetadataPurge");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNContactPosterSaveRequest saveRequestToDeletePostersForContactIdentifiers:](CNContactPosterSaveRequest, "saveRequestToDeletePostersForContactIdentifiers:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = v13;
      v17 = -[CNContactPosterStore performSaveRequest:error:](v14, "performSaveRequest:error:", v16, &v24);
      v18 = v24;

      if ((v17 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "deletePosterRecentsMetadataRequestFailed:", v18);

      objc_autoreleasePoolPop(v6);
      v19 = v18;
      v20 = v19;
      if (v23)
        v21 = v17;
      else
        v21 = 1;
      if ((v21 & 1) == 0)
      {
        v20 = objc_retainAutorelease(v19);
        v17 = 0;
        *v23 = v20;
      }
    }
    else
    {
      objc_autoreleasePoolPop(v6);
      v20 = 0;
      v17 = 1;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_postProcessContactsFromSaveContext:(uint64_t)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v10 = a2;
  if (a1)
  {
    objc_msgSend(v10, "saveRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deletedContactsByIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[CN writableContactProperties](CN, "writableContactProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "saveRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allContacts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __66__CNiOSAddressBookDataMapper__postProcessContactsFromSaveContext___block_invoke;
    v11[3] = &unk_1E29FA2A0;
    v12 = v4;
    v13 = v10;
    v14 = v5;
    v8 = v5;
    v9 = v4;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  }
}

- (void)_postProcessGroupsFromSaveContext:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  ABPropertyID v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t RecordID;
  void *v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "saveRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allGroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "saveRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deletedGroups");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v12;
    objc_msgSend(v8, "minusSet:", v12);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v46;
      v16 = *MEMORY[0x1E0CF5E88];
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v46 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v4, "abGroupsByIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          RecordID = ABRecordGetRecordID(v21);
          if ((_DWORD)RecordID != objc_msgSend(v18, "iOSLegacyIdentifier"))
            objc_msgSend(v18, "setIOSLegacyIdentifier:", RecordID);
          v23 = (void *)ABRecordCopyValue(v21, v16);
          if (v23)
            v23 = (void *)CFAutorelease(v23);
          v24 = v23;
          objc_msgSend(v18, "name");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "isEqual:", v24);

          if ((v26 & 1) == 0)
            objc_msgSend(v18, "setName:", v24);
          v27 = (void *)objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v27, "freezeWithSelfAsSnapshot");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setSnapshot:", v28);
          objc_msgSend(v4, "saveResponse");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "indexPathForGroupInstance:", v18);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setGroupSnapshot:forIndexPath:", v28, v30);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v14);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v31 = v39;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v42 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v36, "setSnapshot:", 0);
          objc_msgSend(v4, "saveResponse");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "indexPathForGroupInstance:", v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setGroupSnapshot:forIndexPath:", 0, v38);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      }
      while (v33);
    }

  }
}

- (void)_postProcessContainersFromSaveContext:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  void *v26;
  uint64_t v27;
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
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "saveRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allContainers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v6;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v27)
    {
      v25 = *(_QWORD *)v33;
      v26 = v4;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v4, "abSourcesByIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          +[CN writableContainerProperties](CN, "writableContainerProperties");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v29 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
                v18 = objc_msgSend(v17, "ABValueForABSource:", v11);
                if ((objc_msgSend(v17, "isConvertibleABValue:", v18) & 1) != 0)
                {
                  objc_msgSend(v17, "CNValueFromABValue:", v18);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "setCNValue:onContainer:", v19, v8);
                }
                else
                {
                  objc_msgSend(v17, "key");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  NSLog(CFSTR("We processed a container that has a non convertible value for property %@, this should not be possible. Skipping."), v19);
                }

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v14);
          }

          v20 = (void *)objc_msgSend(v8, "mutableCopy");
          objc_msgSend(v20, "freezeWithSelfAsSnapshot");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setSnapshot:", v21);
          v4 = v26;
          objc_msgSend(v26, "saveResponse");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "indexPathForContainerInstance:", v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setContainerSnapshot:forIndexPath:", v21, v23);

        }
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v27);
    }

  }
}

- (void)updateLimitedAccessListForSaveRequest:(void *)a3 authorizationContext:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v6)
    {
      if (objc_msgSend(v6, "isLimitedAccessGranted"))
      {
        objc_msgSend(v5, "addedContactsByContainerIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = MEMORY[0x1E0C809B0];
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __89__CNiOSAddressBookDataMapper_updateLimitedAccessListForSaveRequest_authorizationContext___block_invoke;
        v17[3] = &unk_1E29FA0F0;
        v17[4] = a1;
        v11 = v7;
        v18 = v11;
        objc_msgSend(v9, "_cn_each:", v17);

        objc_msgSend(v5, "deletedContactsByIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allValues");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __89__CNiOSAddressBookDataMapper_updateLimitedAccessListForSaveRequest_authorizationContext___block_invoke_46;
        v15[3] = &unk_1E29FA0C8;
        v15[4] = a1;
        v16 = v11;
        objc_msgSend(v13, "_cn_each:", v15);

      }
    }
    else
    {
      objc_opt_class();
      +[CNiOSAddressBookDataMapper os_log]();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[CNiOSAddressBookDataMapper updateLimitedAccessListForSaveRequest:authorizationContext:].cold.1(a1, v14);

    }
  }

}

void __89__CNiOSAddressBookDataMapper_updateLimitedAccessListForSaveRequest_authorizationContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__CNiOSAddressBookDataMapper_updateLimitedAccessListForSaveRequest_authorizationContext___block_invoke_2;
  v4[3] = &unk_1E29FA0C8;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(a2, "_cn_each:", v4);

}

void __89__CNiOSAddressBookDataMapper_updateLimitedAccessListForSaveRequest_authorizationContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Added %@ to limited access for %@", (uint8_t *)&v10, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addLimitedAccessForBundle:contactIdentifier:", v8, v9);

}

void __89__CNiOSAddressBookDataMapper_updateLimitedAccessListForSaveRequest_authorizationContext___block_invoke_46(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "clientBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "Removed %@ from limited access (deleted by %@)", (uint8_t *)&v9, 0x16u);

  }
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSAddressBookDataMapper removeContactIdentifierFromLimitedAcessForAllBundles:](v7, v8);

}

- (void)removeContactIdentifierFromLimitedAcessForAllBundles:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a2;
  if (a1)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v4 = *(id *)(a1 + 16);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __83__CNiOSAddressBookDataMapper_removeContactIdentifierFromLimitedAcessForAllBundles___block_invoke;
    v12 = &unk_1E29FA418;
    v14 = &v15;
    v13 = v3;
    objc_msgSend(v4, "performSynchronousWorkWithInvalidatedAddressBook:", &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "value", v9, v10, v11, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
      {
        v7 = *((unsigned __int8 *)v16 + 24);

        if (v7)
        {
LABEL_10:

          _Block_object_dispose(&v15, 8);
          goto LABEL_11;
        }
      }
      else
      {

      }
    }
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNiOSAddressBookDataMapper removeContactIdentifierFromLimitedAcessForAllBundles:].cold.1();

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)_fetchAccountsInSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex v9;
  const void *ValueAtIndex;
  const void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "addressBook");
    v7 = (const __CFArray *)ABAddressBookCopyArrayOfAllAccounts();
    a1 = v7 != 0;
    if (v7)
    {
      v8 = v7;
      if (CFArrayGetCount(v7) >= 1)
      {
        v9 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v9);
          v11 = (const void *)ABAccountCopyInternalUUID();
          objc_msgSend(v6, "abAccountsByIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", ValueAtIndex, v11);

          if (v11)
            CFRelease(v11);
          ++v9;
        }
        while (v9 < CFArrayGetCount(v8));
      }
      CFRelease(v8);
      v13 = 0;
    }
    else
    {
      +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v13 = v14;
      if (a3)
      {
        v13 = objc_retainAutorelease(v14);
        *a3 = v13;
      }
    }

  }
  return a1;
}

- (BOOL)_fetchContainersInSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFArray *v14;
  const __CFArray *v15;
  BOOL v16;
  CFIndex v17;
  ABPropertyID v18;
  const void *ValueAtIndex;
  CFTypeRef v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _BOOL8 v25;
  id v27;
  char v28;
  BOOL v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v28 = 0;
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allContainerIdentifierStrings:", &v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v27 = 0;
      -[CNiOSAddressBookDataMapper defaultContainerIdentifierForAddressBook:error:](a1, (const void *)objc_msgSend(v6, "addressBook"), &v27);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v27;
      v11 = v10;
      if (v9)
      {
        v30[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v8);
        v13 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v13;
      }
      else if (v10)
      {
        NSLog(CFSTR("Error fetching default container: %@"), v10);
      }
      else
      {
        NSLog(CFSTR("We got no identifier for the default source in AddressBook and no error. Something's wrong"));
      }

    }
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "addressBook");
      v14 = (const __CFArray *)ABAddressBookCopySourcesWithUUIDs();
      v15 = v14;
      v16 = v14 != 0;
      if (v14)
      {
        if (CFArrayGetCount(v14) >= 1)
        {
          v17 = 0;
          v18 = *MEMORY[0x1E0CF6300];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v15, v17);
            v20 = ABRecordCopyValue(ValueAtIndex, v18);
            objc_msgSend(v6, "abSourcesByIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", ValueAtIndex, v20);

            if (v20)
              CFRelease(v20);
            ++v17;
          }
          while (v17 < CFArrayGetCount(v15));
        }
        CFRelease(v15);
        v22 = 0;
      }
      else
      {
        +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = v22;
      v23 = v24;
      if (a3 && !v15)
      {
        v23 = objc_retainAutorelease(v24);
        v16 = 0;
        *a3 = v23;
      }
    }
    else
    {
      v23 = 0;
      v16 = 1;
    }

    v29 = v16;
    v25 = v29;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (BOOL)_fetchContactsInSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  _BOOL8 v11;
  CFIndex v12;
  ABPropertyID v13;
  const void *ValueAtIndex;
  CFTypeRef v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allContactIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "addressBook");
      v9 = (const __CFArray *)ABAddressBookCopyPeopleWithUUIDs();
      v10 = v9;
      v11 = v9 != 0;
      if (v9)
      {
        if (CFArrayGetCount(v9) >= 1)
        {
          v12 = 0;
          v13 = *MEMORY[0x1E0CF6090];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
            v15 = ABRecordCopyValue(ValueAtIndex, v13);
            objc_msgSend(v6, "abPersonsByIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", ValueAtIndex, v15);

            if (v15)
              CFRelease(v15);
            ++v12;
          }
          while (v12 < CFArrayGetCount(v10));
        }
        CFRelease(v10);
        v17 = 0;
      }
      else
      {
        +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v17;
      v18 = v19;
      if (a3 && !v10)
      {
        v18 = objc_retainAutorelease(v19);
        v11 = 0;
        *a3 = v18;
      }
    }
    else
    {
      v18 = 0;
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_fetchGroupsInSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  _BOOL8 v11;
  CFIndex v12;
  ABPropertyID v13;
  const void *ValueAtIndex;
  CFTypeRef v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allGroupIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "addressBook");
      v9 = (const __CFArray *)ABAddressBookCopyGroupsWithUUIDs();
      v10 = v9;
      v11 = v9 != 0;
      if (v9)
      {
        if (CFArrayGetCount(v9) >= 1)
        {
          v12 = 0;
          v13 = *MEMORY[0x1E0CF5E80];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
            v15 = ABRecordCopyValue(ValueAtIndex, v13);
            objc_msgSend(v6, "abGroupsByIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", ValueAtIndex, v15);

            if (v15)
              CFRelease(v15);
            ++v12;
          }
          while (v12 < CFArrayGetCount(v10));
        }
        CFRelease(v10);
        v17 = 0;
      }
      else
      {
        +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v19 = v17;
      v18 = v19;
      if (a3 && !v10)
      {
        v18 = objc_retainAutorelease(v19);
        v11 = 0;
        *a3 = v18;
      }
    }
    else
    {
      v18 = 0;
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)defaultContainerIdentifierForAddressBook:(_QWORD *)a3 error:
{
  void *v3;
  void *v4;

  if (a1)
  {
    v3 = -[CNiOSAddressBookDataMapper _defaultSourceInAddressBook:error:](a1, a2, a3);
    if (v3)
    {
      +[CN containerIdentifierDescription](CN, "containerIdentifierDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "CNValueFromABValue:", objc_msgSend(v4, "ABValueForABSource:", v3));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

CFArrayRef __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  CFArrayRef v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = ABAddressBookCopyArrayOfAllPeopleInSource((ABAddressBookRef)objc_msgSend(v2, "addressBook"), v3);

  return v4;
}

CFArrayRef __68__CNiOSAddressBookDataMapper__processAccountsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  CFArrayRef v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = ABAddressBookCopyArrayOfAllGroupsInSource((ABAddressBookRef)objc_msgSend(v2, "addressBook"), v3);

  return v4;
}

void __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v6;
  id v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const void *v15;
  CFTypeRef v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  id obj;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  id v61;
  const __CFString *v62;
  void *v63;
  _BYTE cf[24];
  void *v65;
  const __CFString *v66;
  void *v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = v6;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v7;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
  if (!v48)
    goto LABEL_42;
  v49 = *(_QWORD *)v57;
  v47 = *MEMORY[0x1E0D13838];
  *(_QWORD *)&v9 = 138543362;
  v43 = v9;
  v46 = v8;
  while (2)
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v57 != v49)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v10);
      objc_msgSend(*(id *)(a1 + 32), "abSourcesByIdentifier", v43);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v65 = v11;
        v66 = CFSTR("CNInvalidRecords");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v66, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 201;
LABEL_41:
        +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v39, v38);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v42 = *(void **)(v41 + 40);
        *(_QWORD *)(v41 + 40) = v40;

        *a4 = 1;
        goto LABEL_42;
      }
      v15 = (const void *)ABSourceCreate();
      if (v15)
        v16 = CFAutorelease(v15);
      else
        v16 = 0;
      v50 = v10;
      if ((*(unsigned int (**)(uint64_t, id))(v47 + 16))(v47, v8))
      {
        v55 = 0;
        if ((ABRecordSetIntValue() & 1) == 0)
        {
          objc_opt_class();
          +[CNiOSAddressBookDataMapper os_log]();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)cf = v43;
            *(_QWORD *)&cf[4] = v55;
            _os_log_error_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_ERROR, "_processContainersFromSaveContext add container failed to set null account, error: %{public}@", cf, 0xCu);
          }

        }
        goto LABEL_17;
      }
      objc_msgSend(*(id *)(a1 + 32), "abAccountsByIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        v61 = v8;
        v62 = CFSTR("CNInvalidRecordIdentifiers");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v37;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 200;
        goto LABEL_41;
      }
      *(_QWORD *)cf = 0;
      objc_msgSend(*(id *)(a1 + 32), "addressBook");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABAddressBookSetAccountForSource();
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        goto LABEL_36;
LABEL_17:
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      +[CN allContainerProperties](CN, "allContainerProperties");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v52 != v23)
              objc_enumerationMutation(v20);
            v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            +[CN containerAccountIdentifierDescription](CN, "containerAccountIdentifierDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25 != v26)
            {
              objc_msgSend(v25, "CNValueForContainer:", v11);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v25, "ABValueFromCNValue:", v27);
              *(_QWORD *)cf = 0;
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v25, "setABValue:onABSource:error:", v28, v16, cf);
              if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
              {
                +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", *(_QWORD *)cf);
                v29 = objc_claimAutoreleasedReturnValue();
                v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                v31 = *(void **)(v30 + 40);
                *(_QWORD *)(v30 + 40) = v29;

                if (*(_QWORD *)cf)
                  CFRelease(*(CFTypeRef *)cf);
                *a4 = 1;

                goto LABEL_31;
              }

            }
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_31:

      v8 = v46;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        goto LABEL_42;
      *(_QWORD *)cf = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABAddressBookAddRecord((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook"), v16, (CFErrorRef *)cf);
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
LABEL_36:
        +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", *(_QWORD *)cf);
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v36 = *(void **)(v35 + 40);
        *(_QWORD *)(v35 + 40) = v34;

        if (*(_QWORD *)cf)
          CFRelease(*(CFTypeRef *)cf);
        *a4 = 1;
        goto LABEL_42;
      }
      objc_msgSend(*(id *)(a1 + 32), "abSourcesByIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKey:", v16, v33);

      v10 = v50 + 1;
    }
    while (v50 + 1 != v48);
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v48)
      continue;
    break;
  }
LABEL_42:

}

void __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_54(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CFTypeRef cf;
  id v22;
  const __CFString *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "abSourcesByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    cf = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABAddressBookRemoveRecord((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook"), v9, (CFErrorRef *)&cf);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v22 = v6;
      v23 = CFSTR("CNInvalidRecords");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      if (cf)
        CFRelease(cf);
      *a4 = 1;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v25 = v6;
    v26 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

    *a4 = 1;
  }

}

void __70__CNiOSAddressBookDataMapper__processContainersFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _BYTE *v30;
  CFTypeRef cf;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  id v37;
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "abSourcesByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v29 = a1;
    v30 = a4;
    objc_msgSend(v6, "snapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    +[CN writableContainerProperties](CN, "writableContainerProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v16, "CNValueForContainer:", v10);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "CNValueForContainer:", v6);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v18;
          if (v17 | v18)
          {
            if ((objc_msgSend((id)v18, "isEqual:", v17) & 1) == 0)
            {
              v20 = objc_msgSend(v16, "ABValueFromCNValue:", v19);
              cf = 0;
              if ((objc_msgSend(v16, "setABValue:onABSource:error:", v20, v9, &cf) & 1) == 0)
              {
                +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
                v21 = objc_claimAutoreleasedReturnValue();
                v22 = *(_QWORD *)(*(_QWORD *)(v29 + 48) + 8);
                v23 = *(void **)(v22 + 40);
                *(_QWORD *)(v22 + 40) = v21;

                if (cf)
                  CFRelease(cf);
                *v30 = 1;
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v29 + 40) + 8) + 24) = 0;
              }
            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v13);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v37 = v6;
    v38 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    *a4 = 1;
  }

}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  const void *v30;
  id v31;
  id v32;
  id v33;
  const void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  CFTypeRef v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  _QWORD *v63;
  _QWORD *v64;
  char v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *context;
  ABPropertyID property;
  _BYTE *v76;
  uint64_t v77;
  uint64_t v78;
  id obj;
  id v80;
  id v81;
  CFErrorRef error;
  id v83;
  CFTypeRef cf;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  id v98;
  const __CFString *v99;
  void *v100;
  id v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  context = (void *)MEMORY[0x19400675C]();
  v9 = v8;
  v10 = v7;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 32);
  else
    v12 = 0;
  objc_msgSend(v12, "addingContacts:toContainerWithIdentifier:", v9, v10);
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v86;
    property = *MEMORY[0x1E0CF6090];
    v76 = a4;
    v77 = *(_QWORD *)v86;
    do
    {
      v16 = 0;
      v78 = v14;
      do
      {
        if (*(_QWORD *)v86 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * v16);
        objc_msgSend(*(id *)(a1 + 40), "abPersonsByIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          v104 = v17;
          v105 = CFSTR("CNInvalidRecords");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 201, v22);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v25 = *(void **)(v24 + 40);
          *(_QWORD *)(v24 + 40) = v23;

          *a4 = 1;
          goto LABEL_47;
        }
        cf = 0;
        objc_msgSend(v17, "setSnapshot:", 0);
        objc_msgSend(*(id *)(a1 + 40), "saveResponse");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "indexPathForContactInstance:", v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setContactSnapshot:forIndexPath:", 0, v27);

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = objc_msgSend(v10, "isEqual:", v28);

        if (!(_DWORD)v27)
        {
          objc_msgSend(*(id *)(a1 + 40), "abSourcesByIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "objectForKey:", v10);

          if (!v36)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            v101 = v10;
            v102 = CFSTR("CNInvalidRecordIdentifiers");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 200;
LABEL_22:
            +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v41, v40);
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v44 = *(void **)(v43 + 40);
            *(_QWORD *)(v43 + 40) = v42;

            *a4 = 1;
LABEL_26:
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
            {
              v95 = v17;
              v96 = CFSTR("CNInvalidRecords");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = v46;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v47, v48);
              v49 = objc_claimAutoreleasedReturnValue();
              v50 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v51 = *(void **)(v50 + 40);
              *(_QWORD *)(v50 + 40) = v49;

              v14 = v78;
            }
            if (cf)
              CFRelease(cf);
            v45 = 0;
            goto LABEL_31;
          }
          v37 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 40), "addressBook");
          if ((-[CNiOSAddressBookDataMapper _hasManagedAccessToWriteToAccountCorrespondingToSource:fromAddressBook:](v37) & 1) == 0)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            v98 = v10;
            v99 = CFSTR("CNInvalidRecordIdentifiers");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = 207;
            goto LABEL_22;
          }
          v38 = ABPersonCreateInSourceAndReturnError();
          goto LABEL_18;
        }
        if (!-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](*(_QWORD *)(a1 + 32)))
        {
          v38 = (uint64_t)ABPersonCreate();
LABEL_18:
          v34 = (const void *)v38;
          if (!v38)
            goto LABEL_26;
          goto LABEL_25;
        }
        v29 = *(_QWORD *)(a1 + 32);
        v30 = (const void *)objc_msgSend(*(id *)(a1 + 40), "addressBook");
        v83 = 0;
        v31 = -[CNiOSAddressBookDataMapper _defaultSourceInAddressBook:error:](v29, v30, &v83);
        v32 = v83;
        v33 = v83;
        if (v31)
        {
          v34 = (const void *)ABPersonCreateInSourceAndReturnError();
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v32);
          v34 = 0;
          *a4 = 1;
        }

        if (!v34)
          goto LABEL_26;
LABEL_25:
        v45 = CFAutorelease(v34);
LABEL_31:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          error = 0;
          objc_msgSend(v17, "identifier");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABRecordSetValue(v45, property, v52, &error);

          objc_msgSend(v17, "identifier");
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABAddressBookAddRecord((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 40), "addressBook"), v45, &error);
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
              goto LABEL_37;
          }
          v92 = v17;
          v93 = CFSTR("CNInvalidRecords");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v54, v55);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v58 = *(void **)(v57 + 40);
          *(_QWORD *)(v57 + 40) = v56;

          if (error)
            CFRelease(error);
          a4 = v76;
          *v76 = 1;
          v14 = v78;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          {
LABEL_37:
            v59 = v10;
            +[CNAddressingGrammarHelper addNoisyValueToContact:](CNAddressingGrammarHelper, "addNoisyValueToContact:", v17);
            v81 = 0;
            +[CNContactDiff diffContact:to:error:](CNContactDiff, "diffContact:to:error:", 0, v17, &v81);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = v81;
            v62 = v61;
            if (v60)
            {
              v63 = *(_QWORD **)(a1 + 32);
              if (v63)
                v63 = (_QWORD *)v63[4];
              v80 = v61;
              v64 = v63;
              v65 = objc_msgSend(v60, "applyToABPerson:isUnified:logger:error:", v45, 0, v64, &v80);
              v66 = v80;

              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v65;
              v62 = v66;
              a4 = v76;
              v14 = v78;
            }
            else
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            }
            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              *a4 = 1;
              v89 = v17;
              v90 = CFSTR("CNInvalidRecords");
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v89, 1);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = v67;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v91, &v90, 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v68, v62);
              v69 = objc_claimAutoreleasedReturnValue();
              v70 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v71 = *(void **)(v70 + 40);
              *(_QWORD *)(v70 + 40) = v69;

              v14 = v78;
              a4 = v76;
            }

            v10 = v59;
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              objc_msgSend(*(id *)(a1 + 40), "abPersonsByIdentifier");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "identifier");
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "setObject:forKey:", v45, v73);

              v10 = v59;
            }
          }
        }
        v15 = v77;
LABEL_47:
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
    }
    while (v14);
  }

  objc_autoreleasePoolPop(context);
}

- (id)_defaultSourceInAddressBook:(_QWORD *)a3 error:
{
  ABRecordRef v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  if (!a1)
    return 0;
  v6 = ABAddressBookCopyDefaultSource(addressBook);
  if (v6)
    v7 = (void *)CFAutorelease(v6);
  else
    v7 = 0;
  if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](a1)
    && (-[CNiOSAddressBookDataMapper _canWriteUnderManagementRestrictionsToSource:inAddressBook:](a1) & 1) == 0)
  {
    v7 = -[CNiOSAddressBookDataMapper _alternativeSourceWithAccessibleAccountFromAddressBook:](a1, addressBook);
  }
  if (v7)
  {
    v8 = v7;
    v9 = 0;
  }
  else
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 101);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v10;
    if (a3)
    {
      v9 = objc_retainAutorelease(v10);
      *a3 = v9;
    }
  }

  v11 = v7;
  return v11;
}

- (uint64_t)_hasManagedAccessToWriteToAccountCorrespondingToSource:(uint64_t)result fromAddressBook:
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](result))
      return -[CNiOSAddressBookDataMapper _canWriteUnderManagementRestrictionsToSource:inAddressBook:](v1);
    else
      return 1;
  }
  return result;
}

- (void)_logWillDeleteWithSaveContext:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "saveRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deletedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(a1 + 8) = objc_msgSend(v6, "count") == 1;

    if (*(_BYTE *)(a1 + 8))
    {
      objc_msgSend(v4, "saveRequest");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allContactIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "abPersonsByIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      +[CNiOSAddressBookDataMapper os_log]();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 134218242;
        v15 = objc_msgSend(v8, "count");
        v16 = 2114;
        v17 = v8;
        _os_log_impl(&dword_18F8BD000, v11, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, save context contact identifiers (%ld):%{public}@", (uint8_t *)&v14, 0x16u);
      }

      objc_opt_class();
      +[CNiOSAddressBookDataMapper os_log]();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v10, "count");
        v14 = 134218242;
        v15 = v13;
        v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_18F8BD000, v12, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, fetched contact identifiers (%ld):%{public}@", (uint8_t *)&v14, 0x16u);
      }

    }
  }

}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _BYTE *v41;
  void *context;
  void *v43;
  uint64_t v44;
  CFErrorRef error;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  _BYTE v56[128];
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  context = (void *)MEMORY[0x19400675C]();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 32);
  else
    v7 = 0;
  objc_msgSend(v7, "deletingContact:", v5, a4);
  objc_msgSend(v5, "linkedContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v5, "linkedContacts");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v57[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  v43 = v5;

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v12)
  {
    v13 = v12;
    v44 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isSuggested"))
        {
          -[CNiOSAddressBookDataMapper _logIgnoringSuggestedLinkedSetContactIdentifier:](*(_QWORD *)(a1 + 32), v18);
        }
        else
        {
          v19 = objc_msgSend(v17, "isImplicitAugmentation");
          v20 = *(_QWORD *)(a1 + 32);
          if (v19)
          {
            -[CNiOSAddressBookDataMapper _logIngoringImplicitAugmentationLinkedSetContactIdentifier:](v20, v18);
          }
          else
          {
            -[CNiOSAddressBookDataMapper _logWillDeleteLinkedSetContactIdentifier:](v20, v18);
            objc_msgSend(*(id *)(a1 + 40), "abPersonsByIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (const void *)objc_msgSend(v21, "objectForKey:", v18);

            if (v22)
            {
              -[CNiOSAddressBookDataMapper _logDeleteHasFoundAtLeastOnePersistedContactIdentifier:](*(_QWORD *)(a1 + 32), v18);
              v23 = -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 32), v22, *(void **)(a1 + 40));
              -[CNiOSAddressBookDataMapper _logDeleteHasManagedWriteAccess:contactIdentifier:](*(_QWORD *)(a1 + 32), v23, v18);
              if (v23)
              {
                error = 0;
                *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABAddressBookRemoveRecord((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 40), "addressBook"), v22, &error);
                -[CNiOSAddressBookDataMapper _logDeleteHasRemovedRecordWithResult:err:](*(_QWORD *)(a1 + 32), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), error);
                if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
                {
                  objc_msgSend(*(id *)(a1 + 40), "contactIdentifiersNeedingMetadataPurge");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "identifier");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "addObject:", v25);

                }
                else if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
                {
                  v53 = v17;
                  v54 = CFSTR("CNInvalidRecords");
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = v26;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v27, v28);
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
                  v31 = *(void **)(v30 + 40);
                  *(_QWORD *)(v30 + 40) = v29;

                  if (error)
                    CFRelease(error);
                }
                BYTE4(v44) = (*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) | BYTE4(v44) & 1) != 0;
              }
              v14 = 1;
            }
            else
            {
              if ((objc_msgSend(v17, "hasBeenPersisted") & 1) == 0)
              {
                -[CNiOSAddressBookDataMapper _logDeleteHasNoPersistedContactIdentifier:](*(_QWORD *)(a1 + 32), v18);
                LOBYTE(v44) = 1;
              }
              -[CNiOSAddressBookDataMapper _logDeleteHasNoABRecordForContactIdentifier:](*(_QWORD *)(a1 + 32), v18);
            }
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v13);
  }
  else
  {
    v44 = 0;
    v14 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (BYTE4(v44) | ~v14) & ~(_BYTE)v44 & 1;
  -[CNiOSAddressBookDataMapper _logDeleteSuccess:hasFoundAtLeastOneBackingPerson:hasDeletedAtLeastOneLinkedContact:hasFoundMissingContactWithNoSnapshot:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v14 & 1, BYTE4(v44) & 1, v44 & 1);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v32)
    {
      if ((v44 & 1) != 0)
        v33 = 200;
      else
        v33 = 207;
      v50 = v43;
      v51 = CFSTR("CNInvalidRecords");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v39 = *(void **)(v38 + 40);
      *(_QWORD *)(v38 + 40) = v37;

      v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    -[CNiOSAddressBookDataMapper _logDeleteHasError:](*(_QWORD *)(a1 + 32), v32);
    *v41 = 1;
  }

  objc_autoreleasePoolPop(context);
}

- (void)_logIgnoringSuggestedLinkedSetContactIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, ignoring suggested contact identifier : %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_logIngoringImplicitAugmentationLinkedSetContactIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, ignoring augmented contact identifier : %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_logWillDeleteLinkedSetContactIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, will try to delete contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_logDeleteHasNoPersistedContactIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, no persisted contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_logDeleteHasNoABRecordForContactIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, no ABRecordRef for contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (void)_logDeleteHasFoundAtLeastOnePersistedContactIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_18F8BD000, v4, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, has found at least one persisted contact identifier: %{public}@", (uint8_t *)&v5, 0xCu);
    }

  }
}

- (uint64_t)_hasManagedWriteAccessToAccountContainingPerson:(void *)a3 fromSaveContext:
{
  id v5;
  ABRecordRef v6;

  v5 = a3;
  if (a1)
  {
    v6 = ABPersonCopySource(a2);
    if (v6)
      CFAutorelease(v6);
    objc_msgSend(v5, "addressBook");
    if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](a1))
      a1 = -[CNiOSAddressBookDataMapper _canWriteUnderManagementRestrictionsToSource:inAddressBook:](a1);
    else
      a1 = 1;
  }

  return a1;
}

- (void)_logDeleteHasManagedWriteAccess:(void *)a3 contactIdentifier:
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("has no");
      if (a2)
        v7 = CFSTR("has");
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, %{public}@ managed write access for contact identifier: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
}

- (void)_logDeleteHasRemovedRecordWithResult:(void *)a3 err:
{
  id v4;
  NSObject *v5;

  if (a1 && *(_BYTE *)(a1 + 8))
  {
    v4 = a3;
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CNiOSAddressBookDataMapper _logDeleteHasRemovedRecordWithResult:err:].cold.1(a2, (uint64_t)v4, v5);

  }
}

- (void)_logDeleteSuccess:(int)a3 hasFoundAtLeastOneBackingPerson:(int)a4 hasDeletedAtLeastOneLinkedContact:(int)a5 hasFoundMissingContactWithNoSnapshot:
{
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("failed");
      if (a2)
        v10 = CFSTR("success");
      if (a3)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v14 = 138544130;
      v15 = v10;
      if (a4)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      if (a5)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_DEFAULT, "_processContactsFromSaveContext delete, %{public}@, hasFoundAtLeastOneBackingPerson:%{public}@, hasDeletedAtLeastOneLinkedContact:%{public}@, hasFoundMissingContactWithNoSnapshot:%{public}@", (uint8_t *)&v14, 0x2Au);
    }

  }
}

- (void)_logDeleteHasError:(uint64_t)a1
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (a1 && *(_BYTE *)(a1 + 8))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[CNiOSAddressBookDataMapper _logDeleteHasError:].cold.1();

  }
}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  const void *v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  NSObject *v31;
  id v32;
  void *v33;
  _BYTE *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  char v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[16];
  uint8_t v53;
  _BYTE v54[7];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  void *v61;
  const __CFString *v62;
  NSObject *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  _BYTE v67[128];
  _QWORD v68[3];

  v68[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x19400675C]();
  v8 = v6;
  +[CNAddressingGrammarHelper addNoisyValueToContact:](CNAddressingGrammarHelper, "addNoisyValueToContact:", v8);
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(void **)(v9 + 32);
  else
    v10 = 0;
  objc_msgSend(v10, "updatingContact:", v8);
  v60 = 0;
  objc_msgSend(v8, "diffToSnapshotAndReturnError:", &v60);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v60;
  v13 = v60;
  if (!v11)
  {
    v39 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v41 = *(_QWORD *)(v39 + 40);
    v40 = (id *)(v39 + 40);
    if (v41)
    {
      objc_storeStrong(v40, v12);
      *a4 = 1;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      goto LABEL_43;
    }
  }
  v49 = objc_msgSend(v8, "isUnified");
  if ((v49 & 1) != 0)
  {
    objc_msgSend(v8, "mainStoreLinkedContacts");
  }
  else
  {
    v68[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
  }
  v45 = v8;
  v46 = v7;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (!v51)
  {
    v48 = 0;
    goto LABEL_39;
  }
  v48 = 0;
  v50 = *(_QWORD *)v57;
  v47 = v14;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v57 != v50)
        objc_enumerationMutation(v14);
      v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v15);
      objc_msgSend(*(id *)(a1 + 40), "abPersonsByIdentifier", v45, v46);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (const void *)objc_msgSend(v17, "objectForKey:", v18);

      if (!v19
        || (-[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 32), v19, *(void **)(a1 + 40)) & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        v64 = v16;
        v65 = CFSTR("CNInvalidRecords");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v25);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

        *a4 = 1;
        goto LABEL_31;
      }
      v20 = *(_QWORD **)(a1 + 32);
      if (v20)
        v20 = (_QWORD *)v20[4];
      v55 = 0;
      v21 = v20;
      v22 = objc_msgSend(v11, "applyToABPerson:isUnified:logger:error:", v19, v49, v21, &v55);
      v23 = v55;

      if ((v22 & 1) != 0)
      {
        v48 = 1;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "saveRequest");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "canIgnoreError:", v23);

        v31 = os_log_create("com.apple.contacts", "data-access-error");
        if (CNIsErrorWithCode(v23, 1015))
        {
          v32 = v13;
          v33 = v11;
          v34 = a4;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3_cold_1(&v53, v54, v31);
          +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 2);
          v35 = objc_claimAutoreleasedReturnValue();

          v23 = (id)v35;
          a4 = v34;
          v11 = v33;
          v13 = v32;
          v14 = v47;
        }
        if (v30)
        {
          v48 = 1;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v48 = 1;
            _os_log_impl(&dword_18F8BD000, v31, OS_LOG_TYPE_INFO, "Ignoring data access error and continuing", buf, 2u);
          }
          v36 = 0;
          v37 = 0;
        }
        else
        {
          v23 = v23;

          if (!v23)
          {
            v13 = 0;
            goto LABEL_30;
          }
          v61 = v16;
          v62 = CFSTR("CNInvalidRecords");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
          v31 = objc_claimAutoreleasedReturnValue();
          v63 = v31;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v13, v23);
          v37 = objc_claimAutoreleasedReturnValue();
          v36 = v23;
        }

        v23 = v36;
        v13 = (id)v37;
      }
LABEL_30:

LABEL_31:
      ++v15;
    }
    while (v51 != v15);
    v38 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    v51 = v38;
  }
  while (v38);
LABEL_39:

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v48 & 1;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    *a4 = 1;
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v44 = *(_QWORD *)(v42 + 40);
    v43 = (id *)(v42 + 40);
    if (!v44)
      objc_storeStrong(v43, v13);
  }

  v8 = v45;
  v7 = v46;
LABEL_43:

  objc_autoreleasePoolPop(v7);
}

- (BOOL)_processContactChangeRequestsFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _BOOL8 v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__16;
    v19 = __Block_byref_object_dispose__16;
    v20 = 0;
    objc_msgSend(v5, "saveRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactChangeRequests");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__CNiOSAddressBookDataMapper__processContactChangeRequestsFromSaveContext_error___block_invoke;
    v10[3] = &unk_1E29FA208;
    v11 = v6;
    v12 = a1;
    v13 = &v21;
    v14 = &v15;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    a1 = *((_BYTE *)v22 + 24) != 0;
    if (a3 && !*((_BYTE *)v22 + 24))
      *a3 = objc_retainAutorelease((id)v16[5]);

    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v21, 8);
  }

  return a1;
}

void __81__CNiOSAddressBookDataMapper__processContactChangeRequestsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v6, "contacts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "saveRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "deletedContacts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = objc_msgSend(v14, "containsObject:", v12);

        if ((v12 & 1) != 0)
        {

          goto LABEL_31;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v9)
        continue;
      break;
    }
  }

  switch(objc_msgSend(v6, "kind"))
  {
    case 0:
      objc_msgSend(v6, "contacts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "contacts");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 40), v24, *(void **)(a1 + 32)))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABPersonLinkPerson();
      }

      goto LABEL_28;
    case 1:
      objc_msgSend(v6, "contacts");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 40), v28, *(void **)(a1 + 32)))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = ABPersonUnlink();
      }
      goto LABEL_28;
    case 2:
      objc_msgSend(v6, "contacts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 40), v32, *(void **)(a1 + 32)))
      {
        ABPersonSetPreferredLinkedPersonForName();
      }
      goto LABEL_28;
    case 3:
      objc_msgSend(v6, "contacts");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 40), v36, *(void **)(a1 + 32)))
      {
        ABPersonSetPreferredLinkedPersonForImage();
      }
      goto LABEL_28;
    case 4:
      objc_msgSend(v6, "contacts");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "linkIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40
        && -[CNiOSAddressBookDataMapper _hasManagedWriteAccessToAccountContainingPerson:fromSaveContext:](*(_QWORD *)(a1 + 40), v40, *(void **)(a1 + 32)))
      {
        ABPersonSetLinkUUID();
      }

LABEL_28:
      break;
    default:
      break;
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", 0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v44 = *(void **)(v43 + 40);
    *(_QWORD *)(v43 + 40) = v42;

    *a4 = 1;
  }
LABEL_31:

}

- (void)_alternativeSourceWithAccessibleAccountFromAddressBook:(uint64_t)a1
{
  CFArrayRef v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[6];
  _QWORD v15[6];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = ABAddressBookCopyArrayOfAllSources(addressBook);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke;
  v15[3] = &unk_1E29FA230;
  v15[4] = a1;
  v15[5] = addressBook;
  -[__CFArray _cn_filter:](v4, "_cn_filter:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = v5;
  aBlock[1] = 3221225472;
  aBlock[2] = __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke_2;
  aBlock[3] = &unk_1E29FA258;
  aBlock[4] = a1;
  aBlock[5] = addressBook;
  v7 = _Block_copy(aBlock);
  v8 = _Block_copy(v7);
  v16[0] = v8;
  v16[1] = &__block_literal_global_64_0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CNAggregateComparator();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke(uint64_t a1)
{
  return -[CNiOSAddressBookDataMapper _hasManagedAccessToWriteToAccountCorrespondingToSource:fromAddressBook:](*(_QWORD *)(a1 + 32));
}

uint64_t __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v25[7];

  v25[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)ABAddressBookCopyAccountIdentifierForSource();
  v6 = (void *)ABAddressBookCopyAccountIdentifierForSource();

  v7 = *MEMORY[0x1E0C8F0A8];
  v25[0] = *MEMORY[0x1E0C8F030];
  v25[1] = v7;
  v8 = *MEMORY[0x1E0C8F060];
  v25[2] = *MEMORY[0x1E0C8F160];
  v25[3] = v8;
  v9 = *MEMORY[0x1E0C8F080];
  v25[4] = *MEMORY[0x1E0C8F0B8];
  v25[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 48);
  else
    v12 = 0;
  objc_msgSend(v12, "accountForIdentifier:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accountType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    v17 = *(void **)(v16 + 48);
  else
    v17 = 0;
  objc_msgSend(v17, "accountForIdentifier:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "accountType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "indexOfObject:", v15));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "indexOfObject:", v20));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "compare:", v22);

  return v23;
}

uint64_t __85__CNiOSAddressBookDataMapper__alternativeSourceWithAccessibleAccountFromAddressBook___block_invoke_3(uint64_t a1, const void *a2, void *a3)
{
  id v4;
  uint64_t RecordID;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  RecordID = ABRecordGetRecordID(a2);
  v6 = ABRecordGetRecordID(v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", RecordID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  return v9;
}

- (uint64_t)_canWriteUnderManagementRestrictionsToSource:(uint64_t)a1 inAddressBook:
{
  void *v3;
  uint64_t v4;

  if (!a1
    || ABRecordGetIntValue() == 6
    || (ABSourceIsRemote() & 1) != 0
    || (ABSourceIsReadonly() & 1) != 0
    || !ABRecordGetIntValue() && !objc_msgSend(*(id *)(a1 + 40), "canWriteToLocalAccount"))
  {
    return 0;
  }
  v3 = (void *)ABAddressBookCopyAccountIdentifierForSource();
  v4 = objc_msgSend(*(id *)(a1 + 40), "canWriteToAccountWithIdentifier:", v3);

  return v4;
}

- (uint64_t)_canReadUnderManagementRestrictionsFromSource:(uint64_t)a1 inAddressBook:
{
  void *v2;
  uint64_t v3;

  if (!a1
    || !ABRecordGetIntValue() && !objc_msgSend(*(id *)(a1 + 40), "canReadFromLocalAccount"))
  {
    return 0;
  }
  v2 = (void *)ABAddressBookCopyAccountIdentifierForSource();
  v3 = objc_msgSend(*(id *)(a1 + 40), "canReadFromAccountWithIdentifier:", v2);

  return v3;
}

void __66__CNiOSAddressBookDataMapper__postProcessContactsFromSaveContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "setSnapshot:", 0);
    objc_msgSend(*(id *)(a1 + 40), "saveResponse");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "indexPathForContactInstance:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContactSnapshot:forIndexPath:", 0, v8);

  }
  else
  {
    v45[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v3;
    if (objc_msgSend(v3, "isUnified"))
    {
      objc_msgSend(v3, "mainStoreLinkedContacts");
      v10 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(v3, "copyWithSelfAsSnapshot");
      objc_msgSend(v3, "setSnapshot:", v11);
      objc_msgSend(*(id *)(a1 + 40), "saveResponse");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "indexPathForContactInstance:", v3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setContactSnapshot:forIndexPath:", v11, v13);

      v9 = (void *)v10;
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v9;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v34)
    {
      v32 = a1;
      v33 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v40 != v33)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "abPersonsByIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            v19 = *(id *)(a1 + 48);
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v36;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v36 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                  objc_msgSend(v24, "key");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v15, "isKeyAvailable:", v25);

                  if (v26)
                    objc_msgSend(v24, "copyFromABPerson:toContact:", v18, v15);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v21);
            }

            a1 = v32;
          }
          v27 = (void *)objc_msgSend(v15, "copyWithSelfAsSnapshot");
          objc_msgSend(v15, "setSnapshot:", v27);
          objc_msgSend(*(id *)(a1 + 40), "saveResponse");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "indexPathForContactInstance:", v15);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setContactSnapshot:forIndexPath:", v27, v29);

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v34);
    }

    v3 = v30;
  }

}

void __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  ABRecordRef v26;
  void *v27;
  const void *v28;
  CFTypeRef v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  ABPropertyID v44;
  ABPropertyID property;
  id v46;
  _BYTE *v47;
  id obj;
  CFErrorRef error;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v7;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v51;
    property = *MEMORY[0x1E0CF5E80];
    v44 = *MEMORY[0x1E0CF5E88];
    v46 = v9;
    v47 = a4;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
          v60 = v14;
          v61 = CFSTR("CNInvalidRecords");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 201, v19);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v22 = *(void **)(v21 + 40);
          *(_QWORD *)(v21 + 40) = v20;

          *a4 = 1;
          continue;
        }
        objc_msgSend(v14, "setSnapshot:", 0);
        objc_msgSend(*(id *)(a1 + 32), "saveResponse");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "indexPathForGroupInstance:", v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setGroupSnapshot:forIndexPath:", 0, v24);

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = objc_msgSend(v9, "isEqual:", v25);

        if ((_DWORD)v24)
        {
          v26 = ABGroupCreate();
          if (!v26)
            goto LABEL_15;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "abSourcesByIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (const void *)objc_msgSend(v27, "objectForKey:", v9);

          if (!v28)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
            v57 = v9;
            v58 = CFSTR("CNInvalidRecordIdentifiers");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v30;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v31);
            v32 = objc_claimAutoreleasedReturnValue();
            v33 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v34 = *(void **)(v33 + 40);
            *(_QWORD *)(v33 + 40) = v32;

            *a4 = 1;
LABEL_15:
            v29 = 0;
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_16;
          }
          v26 = ABGroupCreateInSource(v28);
          if (!v26)
            goto LABEL_15;
        }
        v29 = CFAutorelease(v26);
LABEL_16:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        {
          error = 0;
          objc_msgSend(v14, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABRecordSetValue(v29, property, v35, &error);

          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABRecordSetValue(v29, v44, (CFTypeRef)objc_msgSend(v14, "name"), &error);
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABAddressBookAddRecord((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook"), v29, &error);
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
                goto LABEL_23;
            }
          }
          v54 = v14;
          v55 = CFSTR("CNInvalidRecords");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v36;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v37, v38);
          v39 = objc_claimAutoreleasedReturnValue();
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v41 = *(void **)(v40 + 40);
          *(_QWORD *)(v40 + 40) = v39;

          if (error)
            CFRelease(error);
          v9 = v46;
          a4 = v47;
          *v47 = 1;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          {
LABEL_23:
            objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "setObject:forKey:", v29, v43);

            a4 = v47;
            v9 = v46;
          }
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    }
    while (v11);
  }

}

void __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CFErrorRef error;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)objc_msgSend(v7, "objectForKey:", v8);

  if (v9)
  {
    error = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = ABAddressBookRemoveRecord((ABAddressBookRef)objc_msgSend(*(id *)(a1 + 32), "addressBook"), v9, &error);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v17 = v6;
      v18 = CFSTR("CNInvalidRecords");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", error);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      if (error)
        CFRelease(error);
      *a4 = 1;
    }
  }

}

void __66__CNiOSAddressBookDataMapper__processGroupsFromSaveContext_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  const void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  ABPropertyID v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  ABPropertyID v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  ABPropertyID v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  ABPropertyID v41;
  void *v42;
  BOOL v43;
  uint64_t v44;
  BOOL v45;
  void *v46;
  void *v47;
  void *v48;
  char v49;
  ABPropertyID v50;
  void *v51;
  BOOL v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  CFTypeRef cf;
  id v67;
  const __CFString *v68;
  void *v69;
  id v70;
  const __CFString *v71;
  _QWORD v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (const void *)objc_msgSend(v7, "objectForKey:", v8);

  if (v9)
  {
    cf = 0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "snapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "isEqual:", v12);

      if ((v13 & 1) == 0)
      {
        v14 = *MEMORY[0x1E0CF5E88];
        objc_msgSend(v6, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = ABRecordSetValue(v9, v14, v15, (CFErrorRef *)&cf);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v17 + 24))
          v18 = v16;
        else
          v18 = 0;
        *(_BYTE *)(v17 + 24) = v18;

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(v6, "externalIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "snapshot");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "externalIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "isEqual:", v21);

      if ((v22 & 1) == 0)
      {
        v23 = *MEMORY[0x1E0CF5E60];
        objc_msgSend(v6, "externalIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = ABRecordSetValue(v9, v23, v24, (CFErrorRef *)&cf);
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v26 + 24))
          v27 = v25;
        else
          v27 = 0;
        *(_BYTE *)(v26 + 24) = v27;

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(v6, "externalModificationTag");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "snapshot");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "externalModificationTag");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v28, "isEqual:", v30);

      if ((v31 & 1) == 0)
      {
        v32 = *MEMORY[0x1E0CF5E68];
        objc_msgSend(v6, "externalModificationTag");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = ABRecordSetValue(v9, v32, v33, (CFErrorRef *)&cf);
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v35 + 24))
          v36 = v34;
        else
          v36 = 0;
        *(_BYTE *)(v35 + 24) = v36;

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(v6, "externalRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "snapshot");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "externalRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "isEqual:", v39);

      if ((v40 & 1) == 0)
      {
        v41 = *MEMORY[0x1E0CF5E70];
        objc_msgSend(v6, "externalRepresentation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = ABRecordSetValue(v9, v41, v42, (CFErrorRef *)&cf);
        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v44 + 24))
          v45 = v43;
        else
          v45 = 0;
        *(_BYTE *)(v44 + 24) = v45;

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(v6, "externalUUID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "snapshot");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "externalUUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v46, "isEqual:", v48);

      if ((v49 & 1) == 0)
      {
        v50 = *MEMORY[0x1E0CF5E78];
        objc_msgSend(v6, "externalUUID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = ABRecordSetValue(v9, v50, v51, (CFErrorRef *)&cf);
        v53 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        if (*(_BYTE *)(v53 + 24))
          v54 = v52;
        else
          v54 = 0;
        *(_BYTE *)(v53 + 24) = v54;

      }
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *a4 = 1;
      v67 = v6;
      v68 = CFSTR("CNInvalidRecords");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorForiOSABError:](CNErrorFactory, "errorForiOSABError:", cf);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v56, v57);
      v58 = objc_claimAutoreleasedReturnValue();
      v59 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v60 = *(void **)(v59 + 40);
      *(_QWORD *)(v59 + 40) = v58;

      if (cf)
        CFRelease(cf);
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    v70 = v6;
    v71 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = v61;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, &v71, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v62);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v65 = *(void **)(v64 + 40);
    *(_QWORD *)(v64 + 40) = v63;

    *a4 = 1;
  }

}

- (BOOL)_processContactMembershipsFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, void *, void *, _QWORD *);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v15 = 0;
    goto LABEL_10;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke;
  aBlock[3] = &unk_1E29FA340;
  v8 = v5;
  v22 = v8;
  v23 = &v31;
  v24 = &v25;
  v9 = (void (**)(void *, void *, void *, _QWORD *))_Block_copy(aBlock);
  if (*((_BYTE *)v32 + 24))
  {
    objc_msgSend(v8, "saveRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addedMembersByGroupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_5;
    v19[3] = &unk_1E29FA3A8;
    v12 = v8;
    v20 = v12;
    v9[2](v9, v11, &__block_literal_global_72_0, v19);

    if (*((_BYTE *)v32 + 24))
    {
      objc_msgSend(v12, "saveRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removedMembersByGroupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_7;
      v17[3] = &unk_1E29FA3A8;
      v18 = v12;
      v9[2](v9, v14, &__block_literal_global_74_0, v17);

      v15 = *((_BYTE *)v32 + 24) != 0;
      if (!a3)
        goto LABEL_9;
LABEL_7:
      if (!v15)
        *a3 = objc_retainAutorelease((id)v26[5]);
      goto LABEL_9;
    }
  }
  v15 = 0;
  if (a3)
    goto LABEL_7;
LABEL_9:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
LABEL_10:

  return v15;
}

- (BOOL)_processSubgroupMembershipsFromSaveContext:(_QWORD *)a3 error:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, void *, void *, _QWORD *);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v5 = a2;
  v6 = v5;
  if (!a1)
  {
    v15 = 0;
    goto LABEL_10;
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__16;
  v29 = __Block_byref_object_dispose__16;
  v30 = 0;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke;
  aBlock[3] = &unk_1E29FA3D0;
  v8 = v5;
  v22 = v8;
  v23 = &v31;
  v24 = &v25;
  v9 = (void (**)(void *, void *, void *, _QWORD *))_Block_copy(aBlock);
  if (*((_BYTE *)v32 + 24))
  {
    objc_msgSend(v8, "saveRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addedSubgroupsByGroupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_4;
    v19[3] = &unk_1E29FA3A8;
    v12 = v8;
    v20 = v12;
    v9[2](v9, v11, &__block_literal_global_77, v19);

    if (*((_BYTE *)v32 + 24))
    {
      objc_msgSend(v12, "saveRequest");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removedSubgroupsByGroupIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_6;
      v17[3] = &unk_1E29FA3A8;
      v18 = v12;
      v9[2](v9, v14, &__block_literal_global_78_1, v17);

      v15 = *((_BYTE *)v32 + 24) != 0;
      if (!a3)
        goto LABEL_9;
LABEL_7:
      if (!v15)
        *a3 = objc_retainAutorelease((id)v26[5]);
      goto LABEL_9;
    }
  }
  v15 = 0;
  if (a3)
    goto LABEL_7;
LABEL_9:

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
LABEL_10:

  return v15;
}

void __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_2;
  v11[3] = &unk_1E29FA318;
  v12 = *(id *)(a1 + 32);
  v13 = v8;
  v15 = *(_OWORD *)(a1 + 40);
  v14 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _BYTE *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id obj;
  _QWORD v36[4];
  id v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  _BYTE v48[128];
  void *v49;
  const __CFString *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v8;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v11)
    {
      v12 = v11;
      v33 = v8;
      v34 = v7;
      v13 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          v15 = a4;
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "abPersonsByIdentifier", v33, v34);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v40 = *(id *)(v20 + 40);
            v36[0] = MEMORY[0x1E0C809B0];
            v36[1] = 3221225472;
            v36[2] = __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_3;
            v36[3] = &unk_1E29FA2F0;
            v37 = *(id *)(a1 + 48);
            v38 = v10;
            v39 = v19;
            v21 = CNBridgeBoolResultAndErrorFromBlock(&v40, (uint64_t)v36);
            objc_storeStrong((id *)(v20 + 40), v40);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v21;
            a4 = v15;
            if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
              *v15 = 1;

          }
          else
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
            v45 = v16;
            v46 = CFSTR("CNInvalidRecords");
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v22;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v23);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v26 = *(void **)(v25 + 40);
            *(_QWORD *)(v25 + 40) = v24;

            a4 = v15;
            *v15 = 1;
          }
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v12);
      v8 = v33;
      v7 = v34;
    }
    v27 = obj;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v27;
    v50 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    *a4 = 1;
  }

}

uint64_t __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], a1[5], a1[6], a2);
}

BOOL __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_4(int a1, ABRecordRef group, ABRecordRef person, CFErrorRef *error)
{
  return ABGroupAddMember(group, person, error);
}

id __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupWithAddedMemberForGroupIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_6(int a1, ABRecordRef group, ABRecordRef member, CFErrorRef *error)
{
  return ABGroupRemoveMember(group, member, error);
}

id __78__CNiOSAddressBookDataMapper__processContactMembershipsFromSaveContext_error___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupWithRemovedMemberForGroupIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  __int128 v15;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_2;
  v11[3] = &unk_1E29FA318;
  v12 = *(id *)(a1 + 32);
  v13 = v8;
  v15 = *(_OWORD *)(a1 + 40);
  v14 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t i;
  _BYTE *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  _BYTE v43[128];
  id v44;
  const __CFString *v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v44 = v11;
    v45 = CFSTR("CNInvalidRecords");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v33 = *(void **)(v32 + 40);
    *(_QWORD *)(v32 + 40) = v31;

    *a4 = 1;
    goto LABEL_16;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v12)
  {
    v13 = v12;
    v34 = v8;
    v35 = v7;
    v14 = *(_QWORD *)v37;
    while (1)
    {
      v15 = v11;
      for (i = 0; i != v13; ++i)
      {
        v17 = a4;
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v15);
        v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "abGroupsByIdentifier", v34, v35);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          a4 = v17;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
            continue;
          +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = v22;
        }
        else
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          v40 = v18;
          v41 = CFSTR("CNInvalidRecords");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 200, v25);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
          v28 = *(void **)(v27 + 40);
          *(_QWORD *)(v27 + 40) = v26;

          a4 = v17;
        }

        *a4 = 1;
      }
      v11 = v15;
      v13 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
      if (!v13)
      {
        v8 = v34;
        v7 = v35;
        break;
      }
    }
  }
LABEL_16:

}

uint64_t __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_3()
{
  return ABGroupAddSubgroup();
}

id __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupWithAddedSubgroupForGroupIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_5()
{
  return ABGroupRemoveSubgroup();
}

id __79__CNiOSAddressBookDataMapper__processSubgroupMembershipsFromSaveContext_error___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "saveRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupWithRemovedSubgroupForGroupIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)defaultContainerIdentifier
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v4;
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v4 = addressBook;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CNiOSAddressBookDataMapper_defaultContainerIdentifier__block_invoke;
  v8[3] = &unk_1E29FA418;
  v8[4] = self;
  v8[5] = &v9;
  v5 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v4, "performSynchronousWorkWithInvalidatedAddressBook:", v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __56__CNiOSAddressBookDataMapper_defaultContainerIdentifier__block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[CNiOSAddressBookDataMapper defaultContainerIdentifierForAddressBook:error:](*(_QWORD *)(a1 + 32), a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __72__CNiOSAddressBookDataMapper__containersMatchingPredicate_remote_error___block_invoke_4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    return v1;
  +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)serverSearchContainersMatchingPredicate:(id)a3 error:(id *)a4
{
  return -[CNiOSAddressBookDataMapper _containersMatchingPredicate:remote:error:]((id *)&self->super.isa, a3, 1, a4);
}

- (id)policyForContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  CNPolicyDescription *v7;
  void *v8;

  v6 = a3;
  v7 = objc_alloc_init(CNPolicyDescription);
  -[CNPolicyDescription setContainerIdentifier:](v7, "setContainerIdentifier:", v6);

  -[CNiOSAddressBookDataMapper policyWithDescription:error:](self, "policyWithDescription:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __58__CNiOSAddressBookDataMapper_policyWithDescription_error___block_invoke_3(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    return v1;
  +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)usedLabelsForPropertyWithKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  _QWORD v19[2];
  id (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[5];
  int v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v6 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  v31 = 0;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (v8 && (v25 = 0, objc_msgSend(v8, "abPropertyID:", &v25)))
  {
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v11 = addressBook;
    v23[0] = v9;
    v23[1] = 3221225472;
    v23[2] = __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke;
    v23[3] = &unk_1E29FA4E0;
    v23[4] = &v26;
    v24 = v25;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v11, "performSynchronousWorkWithInvalidatedAddressBook:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)v27[5];
  v19[0] = v9;
  v19[1] = 3221225472;
  v20 = __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke_2;
  v21 = &unk_1E29F9EA8;
  v14 = v12;
  v22 = v14;
  v15 = v13;
  v16 = v19;
  v17 = v16;
  if (a4 && !v15)
  {
    v20((uint64_t)v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v26, 8);
  return v15;
}

void __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;

  v2 = (const void *)ABAddressBookCopyAllLabelsForProperty();
  if (v2)
    v3 = (void *)CFAutorelease(v2);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);
}

id __65__CNiOSAddressBookDataMapper_usedLabelsForPropertyWithKey_error___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)accountsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  id (*v22)(uint64_t);
  void *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  CNiOSAddressBookDataMapper *v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE18BE18) & 1) != 0)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__16;
    v36 = __Block_byref_object_dispose__16;
    v37 = 0;
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3032000000;
    v30[3] = __Block_byref_object_copy__16;
    v30[4] = __Block_byref_object_dispose__16;
    v31 = 0;
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v9 = addressBook;
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke;
    v25[3] = &unk_1E29FA508;
    v26 = v7;
    v27 = self;
    v28 = v30;
    v29 = &v32;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v9, "performSynchronousWorkWithInvalidatedAddressBook:", v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isSuccess") & 1) != 0)
    {
      v12 = (void *)v33[5];
      v21[0] = v10;
      v21[1] = 3221225472;
      v22 = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_4;
      v23 = &unk_1E29FA490;
      v24 = v30;
      v13 = v12;
      v14 = v21;
      v15 = v14;
      if (!a4 || v13)
        goto LABEL_16;
      v22((uint64_t)v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      if (!a4)
      {
        v13 = 0;
        goto LABEL_16;
      }
      v16 = objc_retainAutorelease(v17);
      v13 = 0;
    }
    *a4 = v16;
LABEL_16:

    _Block_object_dispose(v30, 8);
    _Block_object_dispose(&v32, 8);

    goto LABEL_17;
  }
  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 400);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  v13 = 0;
LABEL_17:

  return v13;
}

void __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  const void *v10;
  const void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  id v28;

  v4 = objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EE18BE18);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v28 = *(id *)(v6 + 40);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_2;
    v25[3] = &unk_1E29FA440;
    v26 = *(id *)(a1 + 32);
    v27 = a2;
    CNBridgeABCFResultAndErrorFromBlock(&v28, (uint64_t)v25);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v6 + 40), v28);

LABEL_3:
    v8 = 0;
    goto LABEL_18;
  }
  if (*(_QWORD *)(a1 + 32))
  {
    v8 = 0;
    v7 = 0;
  }
  else
  {
    v9 = (void *)ABAddressBookCopyArrayOfAllAccounts();
    if (v9)
      v9 = (void *)CFAutorelease(v9);
    v7 = v9;
    v10 = (const void *)ABAddressBookCopyLocalSource();
    if (!v10)
      goto LABEL_3;
    v11 = v10;
    v12 = (void *)ABRecordCopyValue(v10, *MEMORY[0x1E0CF62E0]);
    v8 = (!-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](*(_QWORD *)(a1 + 40))
       || ((v13 = *(_QWORD *)(a1 + 40)) == 0 ? (v14 = 0) : (v14 = *(void **)(v13 + 40)),
           objc_msgSend(v14, "canReadFromLocalAccount")))
      && ((objc_msgSend(v12, "BOOLValue") & 1) != 0 || !objc_msgSend(v7, "count"));
    CFRelease(v11);

  }
LABEL_18:
  if (-[CNiOSAddressBookDataMapper _hasManagementRestrictionsEnabled](*(_QWORD *)(a1 + 40)))
  {
    v24[0] = v5;
    v24[1] = 3221225472;
    v24[2] = __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_3;
    v24[3] = &unk_1E29FA230;
    v24[4] = *(_QWORD *)(a1 + 40);
    v24[5] = a2;
    objc_msgSend(v7, "_cn_filter:", v24);
    v15 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v15;
  }
  if (v7)
  {
    +[CNiOSABConversions accountsFromABAccounts:]((uint64_t)CNiOSABConversions, (uint64_t)v7);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  if (v8)
  {
    v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v19)
    {
      +[CNAccount localAccount](CNAccount, "localAccount");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "arrayByAddingObject:", v20);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

    }
  }

}

uint64_t __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyAccountsInAddressBook:error:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_3(uint64_t a1)
{
  ABAddressBookGetDefaultSourceForAccount();
  return -[CNiOSAddressBookDataMapper _hasManagedAccessToReadFromAccountCorrespondingToSource:fromAddressBook:](*(_QWORD *)(a1 + 32));
}

id __62__CNiOSAddressBookDataMapper_accountsMatchingPredicate_error___block_invoke_4(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    return v1;
  +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)groupsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];
  id (*v22)(uint64_t);
  void *v23;
  _QWORD *v24;
  _QWORD v25[4];
  id v26;
  _QWORD *v27;
  uint64_t *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a3;
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE18F0E8) & 1) != 0)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__16;
    v35 = __Block_byref_object_dispose__16;
    v36 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__16;
    v29[4] = __Block_byref_object_dispose__16;
    v30 = 0;
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v9 = addressBook;
    v10 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke;
    v25[3] = &unk_1E29F9FE0;
    v26 = v7;
    v27 = v29;
    v28 = &v31;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v9, "performSynchronousWorkWithInvalidatedAddressBook:", v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isSuccess") & 1) != 0)
    {
      v12 = (void *)v32[5];
      v21[0] = v10;
      v21[1] = 3221225472;
      v22 = __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_3;
      v23 = &unk_1E29FA490;
      v24 = v29;
      v13 = v12;
      v14 = v21;
      v15 = v14;
      if (!a4 || v13)
        goto LABEL_16;
      v22((uint64_t)v14);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v11, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v17;
      if (!a4)
      {
        v13 = 0;
        goto LABEL_16;
      }
      v16 = objc_retainAutorelease(v17);
      v13 = 0;
    }
    *a4 = v16;
LABEL_16:

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(&v31, 8);

    goto LABEL_17;
  }
  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 400);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  v13 = 0;
LABEL_17:

  return v13;
}

void __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke(uint64_t a1, const void *a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  const void *v13;
  id v14;

  if (objc_msgSend(*(id *)(a1 + 32), "conformsToProtocol:", &unk_1EE18F0E8))
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(id *)(v5 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_2;
    v11[3] = &unk_1E29FA440;
    v12 = v4;
    v13 = a2;
    CNBridgeABCFResultAndErrorFromBlock(&v14, (uint64_t)v11);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v5 + 40), v14);

    if (!v6)
      return;
LABEL_8:
    +[CNiOSABConversions groupsFromABGroups:]((uint64_t)CNiOSABConversions, (uint64_t)v6);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    return;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    v7 = ABAddressBookCopyArrayOfAllGroups(a2);
    if (v7)
      v7 = (void *)CFAutorelease(v7);
    v6 = v7;
    if (v6)
      goto LABEL_8;
  }
}

uint64_t __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "cn_copyGroupsInAddressBook:error:", *(_QWORD *)(a1 + 40), a2);
}

id __60__CNiOSAddressBookDataMapper_groupsMatchingPredicate_error___block_invoke_3(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v1)
    return v1;
  +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)groupsWithIdentifiers:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  +[CNGroup predicateForGroupsWithIdentifiers:](CNGroup, "predicateForGroupsWithIdentifiers:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNiOSAddressBookDataMapper groupsMatchingPredicate:error:](self, "groupsMatchingPredicate:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)subgroupsOfGroupWithIdentifier:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1005);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    *a4 = objc_retainAutorelease(v5);

  return 0;
}

- (id)executeFetchRequest:(id)a3 progressiveResults:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNContactsLogger *logger;
  CNContactsLogger *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  CNiOSAddressBook *addressBook;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, void *);
  void *v30;
  id v31;
  CNiOSAddressBookDataMapper *v32;
  CNContactsLogger *v33;
  id v34;
  id v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
    logger = self->_logger;
  else
    logger = 0;
  v12 = logger;
  objc_msgSend(v8, "predicate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "unifyResults");
  objc_msgSend(v8, "keysToFetch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactsLogger fetchContactsProgressivelyMatchingPredicate:unifyResults:keysToFetch:](v12, "fetchContactsProgressivelyMatchingPredicate:unifyResults:keysToFetch:", v13, v14, v15);

  objc_msgSend(v8, "effectivePredicate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D139B8]);
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke;
    v30 = &unk_1E29FA580;
    v31 = v8;
    v32 = self;
    v33 = v12;
    v35 = v9;
    v19 = v10;
    v36 = v19;
    v20 = v17;
    v34 = v20;
    -[CNiOSAddressBook performAsynchronousWorkWithInvalidatedAddressBook:](addressBook, "performAsynchronousWorkWithInvalidatedAddressBook:", &v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isSuccess", v27, v28, v29, v30);
    if (v19 && (v22 & 1) == 0)
    {
      objc_msgSend(v21, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v19 + 2))(v19, v23);

    }
    v24 = v20;

  }
  else
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 400);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      (*((void (**)(id, void *))v10 + 2))(v10, v25);

    v24 = 0;
  }

  return v24;
}

void __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  CNiOSContactFetcher *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  CNiOSContactFetcher *v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a3;
  v6 = [CNiOSContactFetcher alloc];
  v8 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD **)(a1 + 40);
  if (v7)
    v7 = (_QWORD *)v7[3];
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    v10 = *(_QWORD *)(v9 + 40);
  else
    v10 = 0;
  v11 = v7;
  v12 = -[CNiOSContactFetcher initWithFetchRequest:addressBook:environment:managedConfiguration:](v6, "initWithFetchRequest:addressBook:environment:managedConfiguration:", v8, a2, v11, v10);

  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_2;
  v20[3] = &unk_1E29FA530;
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 64);
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_3;
  v16[3] = &unk_1E29FA558;
  v17 = *(id *)(a1 + 48);
  v14 = v5;
  v18 = v14;
  v19 = *(id *)(a1 + 72);
  -[CNiOSContactFetcher executeFetchRequestWithProgressiveResults:completion:](v12, "executeFetchRequestWithProgressiveResults:completion:", v20, v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(*(id *)(a1 + 56), "addCancelable:", v15);

}

void __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "didFetchContacts:error:", v7, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __80__CNiOSAddressBookDataMapper_executeFetchRequest_progressiveResults_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "didFetchContacts:error:", 0, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (NSString)legacyTetheredSyncComputerAnchor
{
  return (NSString *)-[CNiOSAddressBookDataMapper legacyTetheredSyncAnchorForKey:]((uint64_t)self, (uint64_t)CFSTR("LegacyTetheredSyncComputerAnchor"));
}

- (id)legacyTetheredSyncAnchorForKey:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = *(id *)(a1 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CNiOSAddressBookDataMapper_legacyTetheredSyncAnchorForKey___block_invoke;
  v7[3] = &unk_1E29FA5A8;
  v7[4] = &v8;
  v7[5] = a2;
  v4 = (id)objc_msgSend(v3, "performSynchronousWorkWithInvalidatedAddressBook:", v7);

  v5 = (void *)v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setLegacyTetheredSyncComputerAnchor:(id)a3
{
  -[CNiOSAddressBookDataMapper setLegacyTetheredSyncAnchor:forKey:]((uint64_t)self, a3, (uint64_t)CFSTR("LegacyTetheredSyncComputerAnchor"));
}

- (void)setLegacyTetheredSyncAnchor:(uint64_t)a3 forKey:
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[6];

  if (a1)
  {
    v3 = *(void **)(a1 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__CNiOSAddressBookDataMapper_setLegacyTetheredSyncAnchor_forKey___block_invoke;
    v6[3] = &__block_descriptor_48_e9_v16__0_v8l;
    v6[4] = a3;
    v6[5] = a2;
    v4 = a2;
    v5 = (id)objc_msgSend(v3, "performSynchronousWorkWithInvalidatedAddressBook:", v6);

  }
}

- (NSString)legacyTetheredSyncDeviceAnchor
{
  return (NSString *)-[CNiOSAddressBookDataMapper legacyTetheredSyncAnchorForKey:]((uint64_t)self, (uint64_t)CFSTR("LegacyTetheredSyncDeviceAnchor"));
}

- (void)setLegacyTetheredSyncDeviceAnchor:(id)a3
{
  -[CNiOSAddressBookDataMapper setLegacyTetheredSyncAnchor:forKey:]((uint64_t)self, a3, (uint64_t)CFSTR("LegacyTetheredSyncDeviceAnchor"));
}

uint64_t __61__CNiOSAddressBookDataMapper_legacyTetheredSyncAnchorForKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABAddressBookCopyValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __65__CNiOSAddressBookDataMapper_setLegacyTetheredSyncAnchor_forKey___block_invoke()
{
  return ABAddressBookSetValue();
}

- (id)descriptorForRequiredKeysForMatchingDictionary
{
  return CFSTR("iOSLegacyIdentifier");
}

- (id)matchingDictionaryForContact:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "hasBeenPersisted"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__16;
    v17 = __Block_byref_object_dispose__16;
    v18 = 0;
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v6 = addressBook;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__CNiOSAddressBookDataMapper_matchingDictionaryForContact___block_invoke;
    v10[3] = &unk_1E29F9E08;
    v11 = v4;
    v12 = &v13;
    v7 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", v10);

    v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __59__CNiOSAddressBookDataMapper_matchingDictionaryForContact___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (ABAddressBookGetPersonWithRecordID(a2, objc_msgSend(*(id *)(a1 + 32), "iOSLegacyIdentifier")))
  {
    objc_msgSend(*(id *)(a1 + 32), "isUnified");
    ABPersonGetMatchingDictionary();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)contactIdentifierWithMatchingDictionary:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__CNiOSAddressBookDataMapper_contactIdentifierWithMatchingDictionary___block_invoke;
  v11[3] = &unk_1E29F9E08;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  v8 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __70__CNiOSAddressBookDataMapper_contactIdentifierWithMatchingDictionary___block_invoke(uint64_t a1)
{
  const void *PersonMatchingMatchingDictionary;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  PersonMatchingMatchingDictionary = (const void *)ABAddressBookFindPersonMatchingMatchingDictionary();
  +[CNiOSABConversions contactIdentifierFromABPerson:]((uint64_t)CNiOSABConversions, PersonMatchingMatchingDictionary);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)registerChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  CNiOSAddressBook *addressBook;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 600);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a5)
      *a5 = objc_retainAutorelease(v10);

    v12 = 0;
  }
  else
  {
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __97__CNiOSAddressBookDataMapper_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v18[3] = &unk_1E29FA618;
    v18[4] = self;
    v19 = v9;
    v20 = v8;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](addressBook, "performSynchronousWorkWithInvalidatedAddressBook:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "isSuccess");
    objc_msgSend(v14, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5 && (v12 & 1) == 0)
      *a5 = objc_retainAutorelease(v15);

  }
  return v12;
}

void __97__CNiOSAddressBookDataMapper_registerChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  ABChangeHistoryRegisterClientForSource();
  if (v1)
    CFRelease(v1);
}

- (uint64_t)copySourceForContainerIdentifier:(uint64_t)a1 fromAddressBook:(void *)a2
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)ABAddressBookCopySourcesWithUUIDs();
    objc_msgSend(v5, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)unregisterChangeHistoryClientIdentifier:(id)a3 forContainerIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  BOOL v12;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  CNiOSAddressBookDataMapper *v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v8 = a3;
  v9 = a4;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 600);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a5)
      *a5 = objc_retainAutorelease(v10);

    v12 = 0;
  }
  else
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__16;
    v29 = __Block_byref_object_dispose__16;
    v30 = 0;
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v14 = addressBook;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __99__CNiOSAddressBookDataMapper_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke;
    v19[3] = &unk_1E29FA640;
    v23 = &v25;
    v20 = v8;
    v21 = self;
    v22 = v9;
    v24 = &v31;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v14, "performSynchronousWorkWithInvalidatedAddressBook:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "isSuccess") & 1) != 0)
    {
      v12 = *((_BYTE *)v32 + 24) != 0;
      if (a5 && !*((_BYTE *)v32 + 24))
      {
        v12 = 0;
        *a5 = objc_retainAutorelease((id)v26[5]);
      }
    }
    else
    {
      objc_msgSend(v15, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (a5)
        *a5 = objc_retainAutorelease(v16);

      v12 = 0;
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }

  return v12;
}

void __99__CNiOSAddressBookDataMapper_unregisterChangeHistoryClientIdentifier_forContainerIdentifier_error___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if ((ABChangeHistoryHasClientWithIdentifier() & 1) != 0)
  {
    v2 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
    ABChangeHistoryUnregisterClientForSource();
    if (v2)
      CFRelease(v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  }
  else
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 601);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v5;

  }
}

- (id)changeHistoryWithFetchRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  CNiOSAddressBook *addressBook;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  CNiOSAddressBookDataMapper *v25;

  v6 = a3;
  if (!objc_msgSend(v6, "shouldEnforceClientIdentifer")
    || (v7 = *MEMORY[0x1E0D13848],
        objc_msgSend(v6, "clientIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8),
        v8,
        !(_DWORD)v7))
  {
    if (objc_msgSend(v6, "shouldUnifyResults") && objc_msgSend(v6, "includeLinkingChanges"))
    {
      v9 = 605;
      goto LABEL_7;
    }
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke;
    v23 = &unk_1E29FA690;
    v24 = v6;
    v25 = self;
    -[CNiOSAddressBook resultWithInvalidatedAddressBook:](addressBook, "resultWithInvalidatedAddressBook:", &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isSuccess", v20, v21, v22, v23) & 1) != 0)
    {
      objc_msgSend(v14, "value");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13748] + 16))())
      {
        objc_msgSend(v15, "left");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v15, "right");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (a4)
        *a4 = objc_retainAutorelease(v17);

    }
    else
    {
      objc_msgSend(v14, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16;
      if (a4)
      {
        v15 = objc_retainAutorelease(v16);
        v12 = 0;
        *a4 = v15;
        goto LABEL_21;
      }
    }
    v12 = 0;
    goto LABEL_21;
  }
  v9 = 600;
LABEL_7:
  +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4)
    *a4 = objc_retainAutorelease(v10);

  v12 = 0;
LABEL_22:

  return v12;
}

id __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  char HasClientWithIdentifier;
  CNChangeHistoryResult *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  CNChangeHistoryResult *v11;
  void (**v12)(void *, _QWORD);
  void *v13;
  int LatestConsumedSequenceNumberForClient;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CNChangeHistoryAnchor *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id (*v27)(uint64_t, int);
  void *v28;
  id v29;
  CNChangeHistoryResult *v30;
  uint64_t v31;
  const void *v32;

  v4 = objc_msgSend(*(id *)(a1 + 32), "shouldEnforceClientIdentifer");
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HasClientWithIdentifier = ABChangeHistoryHasClientWithIdentifier();

    if ((HasClientWithIdentifier & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0D13A18];
      +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 601);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "eitherWithRight:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      return v21;
    }
  }
  v7 = objc_alloc_init(CNChangeHistoryResult);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](v8, v9);

  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke_2;
  v28 = &unk_1E29FA668;
  v29 = *(id *)(a1 + 32);
  v31 = a2;
  v32 = v10;
  v11 = v7;
  v30 = v11;
  v12 = (void (**)(void *, _QWORD))_Block_copy(&v25);
  if (v4
    && (objc_msgSend(*(id *)(a1 + 32), "clientIdentifier", v25, v26, v27, v28, v29),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        LatestConsumedSequenceNumberForClient = ABChangeHistoryGetLatestConsumedSequenceNumberForClient(),
        v13,
        LatestConsumedSequenceNumberForClient == -1))
  {
    v23 = -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", (int)ABAddressBookGetSequenceNumber());
    -[CNChangeHistoryResult setLatestChangeAnchor:](v11, "setLatestChangeAnchor:", v23);

    -[CNChangeHistoryResult setChangesTruncated:](v11, "setChangesTruncated:", 1);
  }
  else
  {
    v12[2](v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNChangeHistoryResult setContactChanges:](v11, "setContactChanges:", v15);

    if (objc_msgSend(*(id *)(a1 + 32), "includeGroupChanges"))
    {
      v12[2](v12, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNChangeHistoryResult setGroupChanges:](v11, "setGroupChanges:", v16);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "includeLabeledValueChanges", v25, v26, v27, v28))
    {
      v12[2](v12, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNChangeHistoryResult setLabeledValueChanges:](v11, "setLabeledValueChanges:", v17);

    }
    if (-[CNChangeHistoryResult changesTruncated](v11, "changesTruncated")
      && objc_msgSend(*(id *)(a1 + 32), "resultType") == 1)
    {
      +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 603);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  v18 = 0;
  if (v10)
LABEL_16:
    CFRelease(v10);
LABEL_17:
  if (v18)
    objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithRight:", v18);
  else
    objc_msgSend(MEMORY[0x1E0D13A18], "eitherWithLeft:", v11);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

id __66__CNiOSAddressBookDataMapper_changeHistoryWithFetchRequest_error___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CNChangeHistoryAnchor *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  CFIndex v28;
  uint64_t v29;
  int v30;
  void *v31;
  CNChangeHistoryAnchor *v32;
  void *v33;
  void *v34;
  void *v35;
  CNChangeHistoryGroupChange *v36;
  void *v37;
  CNChangeHistoryLabeledValueChange *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CNChangeHistoryContactChange *v43;
  uint64_t v45;
  void *v46;
  const __CFArray *v47;
  const __CFArray *v48;
  void *v49;
  void *v50;
  void *v51;
  CFArrayRef v52;
  const __CFArray *Value;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  CFArrayRef theArray;
  const __CFArray *theArraya;
  void *key;
  const __CFArray *keya;
  int v64;
  uint64_t v65;
  const void *ValueAtIndex;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[14];

  v71[12] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CF5E00];
  v5 = *MEMORY[0x1E0CF5E20];
  v71[0] = *MEMORY[0x1E0CF5E00];
  v71[1] = v5;
  v6 = *MEMORY[0x1E0CF5E48];
  v7 = (void *)*MEMORY[0x1E0CF5E08];
  v71[2] = *MEMORY[0x1E0CF5E48];
  v71[3] = v7;
  key = v7;
  v8 = (const __CFArray *)*MEMORY[0x1E0CF5DF8];
  theArray = (CFArrayRef)*MEMORY[0x1E0CF5E50];
  v71[4] = *MEMORY[0x1E0CF5E50];
  v71[5] = v8;
  v52 = v8;
  v9 = (void *)*MEMORY[0x1E0CF5E18];
  v54 = *MEMORY[0x1E0CF5E10];
  v71[6] = *MEMORY[0x1E0CF5E10];
  v71[7] = v9;
  v58 = v9;
  v10 = *MEMORY[0x1E0CF5E30];
  v67 = (id)*MEMORY[0x1E0CF5E40];
  v71[8] = *MEMORY[0x1E0CF5E40];
  v71[9] = v10;
  v56 = v10;
  v11 = *MEMORY[0x1E0CF5E38];
  v65 = *MEMORY[0x1E0CF5E28];
  v71[10] = *MEMORY[0x1E0CF5E28];
  v71[11] = v11;
  v69 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 12);
  v64 = a2;
  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "shouldUnifyResults");
    objc_msgSend(*(id *)(a1 + 32), "includeLinkingChanges");
    objc_msgSend(*(id *)(a1 + 32), "includeMeCardChanges");
  }
  objc_msgSend(*(id *)(a1 + 32), "startingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "startingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sequenceNumber");

  }
  if (objc_msgSend(*(id *)(a1 + 32), "shouldEnforceClientIdentifer"))
  {
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");

  }
  objc_msgSend(*(id *)(a1 + 32), "excludedTransactionAuthors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "excludedTransactionAuthors");

  }
  v45 = *(_QWORD *)(a1 + 56);
  ABChangeHistoryGetChanges();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(_QWORD))(*MEMORY[0x1E0D13820] + 16))(*MEMORY[0x1E0D13820]) & 1) == 0)
  {
    if (!v64)
      objc_msgSend(*(id *)(a1 + 40), "setUnifyResults:", objc_msgSend(*(id *)(a1 + 32), "shouldUnifyResults", v45));
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v15, "objectForKeyedSubscript:", v4, v45);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setChangesTruncated:", objc_msgSend(v17, "BOOLValue") | objc_msgSend(v16, "changesTruncated"));

    if ((objc_msgSend(*(id *)(a1 + 40), "changesTruncated") & 1) == 0)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (int)objc_msgSend(v18, "intValue");

      objc_msgSend(*(id *)(a1 + 40), "latestChangeAnchor");
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20
        || (v21 = (void *)v20,
            objc_msgSend(*(id *)(a1 + 40), "latestChangeAnchor"),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v23 = objc_msgSend(v22, "sequenceNumber"),
            v22,
            v21,
            v23 < v19))
      {
        v24 = -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", v19);
        objc_msgSend(*(id *)(a1 + 40), "setLatestChangeAnchor:", v24);

      }
      objc_msgSend(v15, "objectForKeyedSubscript:", v6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(a1 + 32), "resultType") == 1)
      {
        objc_msgSend(*(id *)(a1 + 40), "setChangesCount:", objc_msgSend(*(id *)(a1 + 40), "changesCount") + objc_msgSend(v25, "count"));
        v68 = (id)MEMORY[0x1E0C9AA60];
LABEL_46:

        goto LABEL_47;
      }
      keya = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, key);
      theArraya = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, theArray);
      Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, v52);
      objc_msgSend(v15, "objectForKeyedSubscript:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, v58);
      objc_msgSend(v15, "objectForKeyedSubscript:", v56);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v15, v67);
      objc_msgSend(v15, "objectForKeyedSubscript:", v65);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v69);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");
      if (!v26)
      {
        v68 = (id)MEMORY[0x1E0C9AA60];
LABEL_45:

        goto LABEL_46;
      }
      v27 = (void *)v26;
      v46 = v15;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v26);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v29 = *MEMORY[0x1E0D13880];
      v30 = v64;
      v57 = v25;
      v59 = v27;
      while (1)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v31);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        ValueAtIndex = CFArrayGetValueAtIndex(keya, v28);
        v32 = -[CNChangeHistoryAnchor initWithSequenceNumber:]([CNChangeHistoryAnchor alloc], "initWithSequenceNumber:", CFArrayGetValueAtIndex(theArraya, v28));
        if (objc_msgSend(*(id *)(a1 + 32), "includeChangeIDs"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CFArrayGetValueAtIndex(Value, v28));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33 = 0;
        }
        if (objc_msgSend(*(id *)(a1 + 32), "includeExternalIDs"))
        {
          objc_msgSend(v55, "objectAtIndexedSubscript:", v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
            goto LABEL_30;
        }
        else
        {
          v35 = 0;
          if (!v30)
          {
LABEL_30:
            if (objc_msgSend(*(id *)(a1 + 32), "includeImagesChanged"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CFArrayGetValueAtIndex(v47, v28) != 0);
              v36 = (CNChangeHistoryGroupChange *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v36 = 0;
            }
            if (objc_msgSend(*(id *)(a1 + 32), "includeLinkingChanges"))
            {
              objc_msgSend(v50, "objectAtIndexedSubscript:", v28);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v40 = 0;
            }
            if (objc_msgSend(*(id *)(a1 + 32), "includeLinkingChanges"))
            {
              objc_msgSend(v49, "objectAtIndexedSubscript:", v28);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *))(v29 + 16))(v29, v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v42 = 0;
            }
            v43 = -[CNChangeHistoryContactChange initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:]([CNChangeHistoryContactChange alloc], "initWithIdentifier:changeType:changeAnchor:changeID:externalID:imagesChanged:linkToPersonUUID:personLinkUUID:", v70, ValueAtIndex, v32, v33, v35, v36, v40, v42);
            objc_msgSend(v68, "addObject:", v43);

            v30 = v64;
            v25 = v57;
            goto LABEL_41;
          }
        }
        if (v30 == 2)
          break;
        if (v30 == 1)
        {
          v36 = -[CNChangeHistoryGroupChange initWithIdentifier:changeType:changeAnchor:changeID:externalID:]([CNChangeHistoryGroupChange alloc], "initWithIdentifier:changeType:changeAnchor:changeID:externalID:", v70, ValueAtIndex, v32, v33, v35);
          objc_msgSend(v68, "addObject:", v36);
LABEL_41:

          v27 = v59;
        }

        if (v27 == (void *)++v28)
        {
          v15 = v46;
          goto LABEL_45;
        }
      }
      objc_msgSend(v51, "objectAtIndexedSubscript:", v28);
      v36 = (CNChangeHistoryGroupChange *)objc_claimAutoreleasedReturnValue();
      +[CNContact contactPropertyKeyFromABPropertyID:](CNContact, "contactPropertyKeyFromABPropertyID:", CFArrayGetValueAtIndex(v48, v28));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[CNChangeHistoryLabeledValueChange initWithContactIdentifier:propertyKey:labeledValueIdentifier:changeType:]([CNChangeHistoryLabeledValueChange alloc], "initWithContactIdentifier:propertyKey:labeledValueIdentifier:changeType:", v70, v37, v36, 2);
      objc_msgSend(v68, "addObject:", v38);

      v25 = v57;
      goto LABEL_41;
    }
  }
  v68 = (id)MEMORY[0x1E0C9AA60];
LABEL_47:

  return v68;
}

- (BOOL)executeChangeHistoryClearRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  CNiOSAddressBookDataMapper *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;

  v6 = a3;
  v7 = *MEMORY[0x1E0D13848];
  objc_msgSend(v6, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  if ((_DWORD)v7)
  {
    v9 = 600;
LABEL_3:
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4)
      *a4 = objc_retainAutorelease(v10);

    v12 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v6, "toChangeAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13
    || (objc_msgSend(v6, "contactChangeIDs"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "count")))
  {

  }
  else
  {
    objc_msgSend(v6, "groupChangeIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (!v21)
    {
      v9 = 1002;
      goto LABEL_3;
    }
  }
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__16;
  v34 = __Block_byref_object_dispose__16;
  v35 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v15 = addressBook;
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __69__CNiOSAddressBookDataMapper_executeChangeHistoryClearRequest_error___block_invoke;
  v25 = &unk_1E29FA508;
  v26 = v6;
  v27 = self;
  v28 = &v30;
  v29 = &v36;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v15, "performSynchronousWorkWithInvalidatedAddressBook:", &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "isSuccess", v22, v23, v24, v25) & 1) != 0)
  {
    v12 = *((_BYTE *)v37 + 24) != 0;
    if (a4 && !*((_BYTE *)v37 + 24))
    {
      v12 = 0;
      *a4 = objc_retainAutorelease((id)v31[5]);
    }
  }
  else
  {
    objc_msgSend(v16, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4)
      *a4 = objc_retainAutorelease(v17);

    v12 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
LABEL_19:

  return v12;
}

void __69__CNiOSAddressBookDataMapper_executeChangeHistoryClearRequest_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFArray *v11;
  void *v12;
  __CFArray *v13;
  void *v14;
  __CFArray *v15;
  void *v16;
  __CFArray *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");

  if ((ABChangeHistoryHasClientWithIdentifier() & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "containerIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (const void *)-[CNiOSAddressBookDataMapper copySourceForContainerIdentifier:fromAddressBook:](v2, v3);

    objc_msgSend(*(id *)(a1 + 32), "toChangeAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      objc_msgSend(v6, "toChangeAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sequenceNumber");
      ABChangeHistoryClearChangesUpToSequenceNumberForClient();

    }
    else
    {
      objc_msgSend(v6, "contactChangeIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = *(__CFArray **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "contactChangeIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CNiOSAddressBookDataMapper copyChangeTableRowIDsFromChangeIDs:](v11, v12);

        ABChangeHistoryClearEntityChangeTableRowIDsForClient();
        CFRelease(v13);
      }
      objc_msgSend(*(id *)(a1 + 32), "groupChangeIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = *(__CFArray **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "groupChangeIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CNiOSAddressBookDataMapper copyChangeTableRowIDsFromChangeIDs:](v15, v16);

        ABChangeHistoryClearEntityChangeTableRowIDsForClient();
        CFRelease(v17);
      }
    }
    if (v4)
      CFRelease(v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 601);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v18;

  }
}

- (__CFArray)copyChangeTableRowIDsFromChangeIDs:(__CFArray *)Mutable
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (Mutable)
  {
    Mutable = CFArrayCreateMutable(0, 0, 0);
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          CFArrayAppendValue(Mutable, (const void *)(int)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "intValue", (_QWORD)v10));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
  return Mutable;
}

+ (id)_copyEligiblePrimarySourceForAccountWithIdentifier:(uint64_t)a3 addressBook:(_QWORD *)a4 error:
{
  id v5;
  const __CFArray *v6;
  const __CFArray *v7;
  uint64_t DefaultSourceForAccount;
  const void *v9;
  int IntValue;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  const void *v15;
  const void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_self();
  v22[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v6 = (const __CFArray *)ABAddressBookCopyAccountsWithUUIDs();
  if (!v6)
    goto LABEL_14;
  v7 = v6;
  if (CFArrayGetCount(v6) < 1)
  {
    CFRelease(v7);
LABEL_14:
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 200);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    goto LABEL_19;
  }
  CFArrayGetValueAtIndex(v7, 0);
  DefaultSourceForAccount = ABAddressBookGetDefaultSourceForAccount();
  if (!DefaultSourceForAccount
    || ((v9 = (const void *)DefaultSourceForAccount,
         IntValue = ABRecordGetIntValue(),
         v11 = ABRecordGetIntValue() & 0x1000000,
         IntValue == 1)
      ? (v12 = v11 == 0)
      : (v12 = 0),
        !v12 || (v13 = (void *)CFRetain(v9)) == 0))
  {
    v14 = (void *)ABAddressBookCopyArrayOfAllSourcesInAccount();
    if (v14)
    {
      v15 = v14;
      v16 = (const void *)objc_msgSend(v14, "_cn_firstObjectPassingTest:", &__block_literal_global_152);
      if (v16)
        v13 = (void *)CFRetain(v16);
      else
        v13 = 0;
      CFRelease(v15);
    }
    else
    {
      v13 = 0;
    }
  }
  CFRelease(v7);
  v17 = 0;
LABEL_19:
  v18 = v13;
  v19 = v18;
  if (a4 && !v18)
    *a4 = objc_retainAutorelease(v17);
  v20 = v19;

  return v20;
}

+ (const)_copyLocalSourceIfEnabledInAddressBook:
{
  const void *v0;
  int IntValue;
  int v2;

  objc_opt_self();
  v0 = (const void *)ABAddressBookCopyLocalSource();
  if (v0)
  {
    IntValue = ABRecordGetIntValue();
    v2 = ABRecordGetIntValue() & 0x1000000;
    if (IntValue != 1 || v2 != 0)
    {
      CFRelease(v0);
      return 0;
    }
  }
  return v0;
}

- (BOOL)setDefaultAccountIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v6 = a3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 200);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
      *a4 = objc_retainAutorelease(v7);

    v9 = 0;
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__16;
    v24 = __Block_byref_object_dispose__16;
    v25 = 0;
    if (self)
      addressBook = self->_addressBook;
    else
      addressBook = 0;
    v11 = addressBook;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __64__CNiOSAddressBookDataMapper_setDefaultAccountIdentifier_error___block_invoke;
    v16[3] = &unk_1E29F9FE0;
    v17 = v6;
    v18 = &v20;
    v19 = &v26;
    -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v11, "performSynchronousWorkWithInvalidatedAddressBook:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isSuccess") & 1) != 0)
    {
      v9 = *((_BYTE *)v27 + 24) != 0;
      if (a4 && !*((_BYTE *)v27 + 24))
      {
        v9 = 0;
        *a4 = objc_retainAutorelease((id)v21[5]);
      }
    }
    else
    {
      objc_msgSend(v12, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a4)
        *a4 = objc_retainAutorelease(v13);

      v9 = 0;
    }

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }

  return v9;
}

void __64__CNiOSAddressBookDataMapper_setDefaultAccountIdentifier_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  const void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id obj;

  v4 = (void *)a1[4];
  +[CNAccount localAccount](CNAccount, "localAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqualToString:", v6);

  if ((_DWORD)v4)
  {
    v7 = +[CNiOSAddressBookDataMapper _copyLocalSourceIfEnabledInAddressBook:]();
    if (v7)
    {
LABEL_3:
      ABAddressBookSetDefaultSource();
      CFRelease(v7);
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      return;
    }
  }
  else
  {
    v8 = (void *)a1[4];
    v9 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v9 + 40);
    v7 = +[CNiOSAddressBookDataMapper _copyEligiblePrimarySourceForAccountWithIdentifier:addressBook:error:]((uint64_t)CNiOSAddressBookDataMapper, v8, a2, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    if (v7)
      goto LABEL_3;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    +[CNErrorFactory errorWithCode:](CNErrorFactory, "errorWithCode:", 1002);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[5] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

- (BOOL)resetSortDataIfNeededWithError:(id *)a3
{
  ABAddressBookResetSortDataInProcessIfNeeded();
  return 1;
}

- (BOOL)hasMultipleGroupsOrAccounts
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v3 = addressBook;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CNiOSAddressBookDataMapper_hasMultipleGroupsOrAccounts__block_invoke;
  v6[3] = &unk_1E29F9DE0;
  v6[4] = &v7;
  v4 = -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v3, "performSynchronousWorkWithInvalidatedAddressBook:", v6);

  LOBYTE(v3) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v3;
}

CFIndex __57__CNiOSAddressBookDataMapper_hasMultipleGroupsOrAccounts__block_invoke(uint64_t a1, ABAddressBookRef addressBook)
{
  CFIndex result;

  result = ABAddressBookGetGroupCount(addressBook);
  if (result > 0 || (result = ABAddressBookGetSourceCountIncludingDisabled(), result >= 2))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return result;
}

- (id)fetchLimitedAccessContactIdentifiersForBundle:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = (id)MEMORY[0x1E0C9AA60];
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __76__CNiOSAddressBookDataMapper_fetchLimitedAccessContactIdentifiersForBundle___block_invoke;
  v17 = &unk_1E29FA418;
  v19 = &v20;
  v7 = v4;
  v18 = v7;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "value", v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v10 = v21[5];

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CNiOSAddressBookDataMapper fetchLimitedAccessContactIdentifiersForBundle:].cold.1();

LABEL_11:
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __76__CNiOSAddressBookDataMapper_fetchLimitedAccessContactIdentifiersForBundle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  ABLimitedAccessContactIdentifiersForBundle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v9 = addressBook;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__CNiOSAddressBookDataMapper_addLimitedAccessForBundle_contactIdentifier___block_invoke;
  v16[3] = &unk_1E29FA6F8;
  v19 = &v20;
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v18 = v11;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v9, "performSynchronousWorkWithInvalidatedAddressBook:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v14 = *((_BYTE *)v21 + 24) == 0;

      if (!v14)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_error_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_ERROR, "addLimitedAccessForBundle: %@, id: %@, failed: %@", buf, 0x20u);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);

}

uint64_t __74__CNiOSAddressBookDataMapper_addLimitedAccessForBundle_contactIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABAddLimitedAccessForBundle();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __83__CNiOSAddressBookDataMapper_removeContactIdentifierFromLimitedAcessForAllBundles___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABRemoveContactIdentifierFromLimitedAccessForAllBundles();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeLimitedAccessForBundle:(id)a3 contactIdentifier:(id)a4
{
  id v6;
  id v7;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v9 = addressBook;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__CNiOSAddressBookDataMapper_removeLimitedAccessForBundle_contactIdentifier___block_invoke;
  v16[3] = &unk_1E29FA6F8;
  v19 = &v20;
  v10 = v6;
  v17 = v10;
  v11 = v7;
  v18 = v11;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v9, "performSynchronousWorkWithInvalidatedAddressBook:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v14 = *((_BYTE *)v21 + 24) == 0;

      if (!v14)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    _os_log_error_impl(&dword_18F8BD000, v15, OS_LOG_TYPE_ERROR, "removeLimitedAccessForBundle: %@, id: %@, failed: %@", buf, 0x20u);
  }

LABEL_11:
  _Block_object_dispose(&v20, 8);

}

uint64_t __77__CNiOSAddressBookDataMapper_removeLimitedAccessForBundle_contactIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABRemoveLimitedAccessForBundle();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)populateSyncTableForLimitedAccessAboveSequenceNumber:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  char v11;
  NSObject *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16;
  v25 = __Block_byref_object_dispose__16;
  v26 = (id)MEMORY[0x1E0C9AA70];
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __83__CNiOSAddressBookDataMapper_populateSyncTableForLimitedAccessAboveSequenceNumber___block_invoke;
  v18 = &unk_1E29FA418;
  v20 = &v21;
  v7 = v4;
  v19 = v7;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || ((objc_msgSend(v8, "value", v15, v16, v17, v18),
         v9 = (void *)objc_claimAutoreleasedReturnValue(),
         v10 = objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]),
         v7)
      ? (v11 = v10)
      : (v11 = 0),
        v9,
        (v11 & 1) == 0))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNiOSAddressBookDataMapper populateSyncTableForLimitedAccessAboveSequenceNumber:].cold.1();

  }
  v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __83__CNiOSAddressBookDataMapper_populateSyncTableForLimitedAccessAboveSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  ABPopulateSyncTableForLimitedAccessAboveSequenceNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)purgeLimitedAccessRecordsForBundle:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65__CNiOSAddressBookDataMapper_purgeLimitedAccessRecordsForBundle___block_invoke;
  v15 = &unk_1E29FA418;
  v17 = &v18;
  v7 = v4;
  v16 = v7;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "value", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v10 = *((unsigned __int8 *)v19 + 24);

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CNiOSAddressBookDataMapper purgeLimitedAccessRecordsForBundle:].cold.1();

LABEL_11:
  _Block_object_dispose(&v18, 8);

}

uint64_t __65__CNiOSAddressBookDataMapper_purgeLimitedAccessRecordsForBundle___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABPurgeLimitedAccessRecordsForBundle();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)updateLimitedAccessTable:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __55__CNiOSAddressBookDataMapper_updateLimitedAccessTable___block_invoke;
  v15 = &unk_1E29FA418;
  v17 = &v18;
  v7 = v4;
  v16 = v7;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "value", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v10 = *((unsigned __int8 *)v19 + 24);

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CNiOSAddressBookDataMapper updateLimitedAccessTable:].cold.1();

LABEL_11:
  _Block_object_dispose(&v18, 8);

}

uint64_t __55__CNiOSAddressBookDataMapper_updateLimitedAccessTable___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABLimitedAccessUpdateTable();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)getLimitedAccessContactsCountForBundle:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __69__CNiOSAddressBookDataMapper_getLimitedAccessContactsCountForBundle___block_invoke;
  v17 = &unk_1E29FA418;
  v19 = &v20;
  v7 = v4;
  v18 = v7;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "value", v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v10 = v21[5];

      if (v10)
        goto LABEL_11;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[CNiOSAddressBookDataMapper getLimitedAccessContactsCountForBundle:].cold.1();

LABEL_11:
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __69__CNiOSAddressBookDataMapper_getLimitedAccessContactsCountForBundle___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  ABLimitedAccessContactsCountForBundle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getLimitedAccessLastSyncSequenceNumber:(id *)a3
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__16;
  v19 = __Block_byref_object_dispose__16;
  v20 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v5 = addressBook;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__CNiOSAddressBookDataMapper_getLimitedAccessLastSyncSequenceNumber___block_invoke;
  v14[3] = &unk_1E29F9DE0;
  v14[4] = &v15;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v5, "performSynchronousWorkWithInvalidatedAddressBook:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "value"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]),
        v7,
        (v8 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CNiOSAddressBookDataMapper getLimitedAccessLastSyncSequenceNumber:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (id)v16[5];
  v12 = v11;
  if (a3 && !v11)
    *a3 = objc_retainAutorelease(v9);

  _Block_object_dispose(&v15, 8);
  return v12;
}

void __69__CNiOSAddressBookDataMapper_getLimitedAccessLastSyncSequenceNumber___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  ABGetLimitedAccessLastSyncSequenceNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  CNLimitedAccessSyncData *v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__16;
  v24 = __Block_byref_object_dispose__16;
  v25 = objc_alloc_init(CNLimitedAccessSyncData);
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __84__CNiOSAddressBookDataMapper_getWatchLimitedAccessSyncDataStartingAtSequenceNumber___block_invoke;
  v17 = &unk_1E29F9E08;
  v7 = v4;
  v18 = v7;
  v19 = &v20;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v6, "performSynchronousWorkWithInvalidatedAddressBook:", &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (objc_msgSend(v8, "value", v14, v15, v16, v17),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]),
        v9,
        (v10 & 1) == 0))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CNiOSAddressBookDataMapper getWatchLimitedAccessSyncDataStartingAtSequenceNumber:].cold.1((uint64_t)v8, buf, objc_msgSend(v7, "integerValue"), v11);

  }
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v12;
}

void __84__CNiOSAddressBookDataMapper_getWatchLimitedAccessSyncDataStartingAtSequenceNumber___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CNLimitedAccessSyncEvent *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "integerValue");
  ABGetWatchLimitedAccessSyncDataStartingAtSequenceNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFullSyncRequired:", objc_msgSend(v2, "fullSyncRequired"));
  v13 = a1;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCurrentSequenceNumber:", objc_msgSend(v2, "currentSequenceNumber"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v2, "syncEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = objc_alloc_init(CNLimitedAccessSyncEvent);
        objc_msgSend(v9, "bundleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNLimitedAccessSyncEvent setBundleID:](v10, "setBundleID:", v11);

        objc_msgSend(v9, "contactID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNLimitedAccessSyncEvent setContactID:](v10, "setContactID:", v12);

        -[CNLimitedAccessSyncEvent setSequenceNumber:](v10, "setSequenceNumber:", objc_msgSend(v9, "sequenceNumber"));
        -[CNLimitedAccessSyncEvent setIsActive:](v10, "setIsActive:", objc_msgSend(v9, "isActive"));
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v13 + 40) + 8) + 40), "setSyncEventsArray:", v3);
}

- (void)applyLimitedAccessSyncEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v15;
  id v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x1E0CF5D70]);
        objc_msgSend(v10, "bundleID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBundleID:", v12);

        objc_msgSend(v10, "contactID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContactID:", v13);

        objc_msgSend(v11, "setSequenceNumber:", objc_msgSend(v10, "sequenceNumber"));
        objc_msgSend(v11, "setIsActive:", objc_msgSend(v10, "isActive"));
        objc_msgSend(v5, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v7);
  }

  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v15 = addressBook;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __59__CNiOSAddressBookDataMapper_applyLimitedAccessSyncEvents___block_invoke;
  v24 = &unk_1E29FA418;
  v26 = &v31;
  v16 = v5;
  v25 = v16;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v15, "performSynchronousWorkWithInvalidatedAddressBook:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "value", v21, v22, v23, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) != 0)
    {
      v19 = *((_BYTE *)v32 + 24) == 0;

      if (!v19)
        goto LABEL_18;
    }
    else
    {

    }
  }
  objc_opt_class();
  +[CNiOSAddressBookDataMapper os_log]();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[CNiOSAddressBookDataMapper applyLimitedAccessSyncEvents:].cold.1();

LABEL_18:
  _Block_object_dispose(&v31, 8);

}

uint64_t __59__CNiOSAddressBookDataMapper_applyLimitedAccessSyncEvents___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABApplyLimitedAccessSyncEvents();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)dropAllLimitedAccessRows
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "dropAllLimitedAccessRows failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __54__CNiOSAddressBookDataMapper_dropAllLimitedAccessRows__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABDropAllLimitedAccessRows();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)dropAllLimitedAccessRowsAndSyncNotify
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "dropAllLimitedAccessRowsAndSyncNotify failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

uint64_t __67__CNiOSAddressBookDataMapper_dropAllLimitedAccessRowsAndSyncNotify__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ABDropAllLimitedAccessRows();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setLimitedAccessTableCurrentSequenceNumber:(id)a3
{
  id v4;
  CNiOSAddressBook *addressBook;
  id v6;
  CNiOSAddressBook *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CNiOSAddressBookDataMapper_setLimitedAccessTableCurrentSequenceNumber___block_invoke;
  v12[3] = &unk_1E29FA720;
  v6 = v4;
  v13 = v6;
  v7 = addressBook;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v7, "performSynchronousWorkWithInvalidatedAddressBook:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8
    || (objc_msgSend(v8, "value"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqual:", MEMORY[0x1E0C9AAB0]),
        v9,
        (v10 & 1) == 0))
  {
    objc_opt_class();
    +[CNiOSAddressBookDataMapper os_log]();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CNiOSAddressBookDataMapper setLimitedAccessTableCurrentSequenceNumber:].cold.1();

  }
}

uint64_t __73__CNiOSAddressBookDataMapper_setLimitedAccessTableCurrentSequenceNumber___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "integerValue");
  return ABSetLimitedAccessTableCurrentSequenceNumber();
}

- (BOOL)shouldAnalyzeDatabaseWithError:(id *)a3
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[3];
  char v15;

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v5 = addressBook;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__CNiOSAddressBookDataMapper_shouldAnalyzeDatabaseWithError___block_invoke;
  v13[3] = &unk_1E29F9DE0;
  v13[4] = v14;
  -[CNiOSAddressBook performSynchronousWorkWithInvalidatedAddressBook:](v5, "performSynchronousWorkWithInvalidatedAddressBook:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
  }
  else
  {
    objc_msgSend(v7, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }

  _Block_object_dispose(v14, 8);
  return v10 != 0;
}

uint64_t __61__CNiOSAddressBookDataMapper_shouldAnalyzeDatabaseWithError___block_invoke(uint64_t a1, ABAddressBookRef addressBook)
{
  uint64_t result;

  ABAddressBookGetPersonCount(addressBook);
  result = ABAddressBookShouldAnalyzeDatabase();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)analyzeDatabaseWithError:(id *)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  if (self)
    self = (CNiOSAddressBookDataMapper *)self->_addressBook;
  -[CNiOSAddressBookDataMapper performSynchronousWorkWithInvalidatedAddressBook:](self, "performSynchronousWorkWithInvalidatedAddressBook:", &__block_literal_global_157);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "value");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v6;
  }
  else
  {
    objc_msgSend(v4, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      v7 = 0;
      *a3 = v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7 != 0;
}

uint64_t __55__CNiOSAddressBookDataMapper_analyzeDatabaseWithError___block_invoke(int a1, ABAddressBookRef addressBook)
{
  ABAddressBookGetPersonCount(addressBook);
  return ABAddressBookAnalyzeDatabase();
}

void __85__CNiOSAddressBookDataMapper_executeSaveRequest_response_authorizationContext_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Error decoding CNLabeledValue: could not create save context", v1, 2u);
}

- (void)updateLimitedAccessListForSaveRequest:(uint64_t)a1 authorizationContext:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v3, "clientBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "authorization context is nil (Client: %@)", v5, 0xCu);

}

- (void)removeContactIdentifierFromLimitedAcessForAllBundles:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "removeContactIdentifierFromLimitedAcessForAllBundles failed; id: %@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_logDeleteHasRemovedRecordWithResult:(os_log_t)log err:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("success");
  if ((a1 & 1) == 0)
    v3 = CFSTR("failed");
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_debug_impl(&dword_18F8BD000, log, OS_LOG_TYPE_DEBUG, "_processContactsFromSaveContext delete, ABAddressBookRemoveRecord %{public}@, error: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_logDeleteHasError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18F8BD000, v0, OS_LOG_TYPE_DEBUG, "_processContactsFromSaveContext delete, error: %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

void __68__CNiOSAddressBookDataMapper__processContactsFromSaveContext_error___block_invoke_3_cold_1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_18F8BD000, log, OS_LOG_TYPE_FAULT, "Attempt to save fullscreen image data without setting image data", buf, 2u);
}

- (void)fetchLimitedAccessContactIdentifiersForBundle:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "fetchLimitedAccessContactIdentifiersForBundle: %@, failed: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)populateSyncTableForLimitedAccessAboveSequenceNumber:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "populateSyncTableForLimitedAccessAboveSequenceNumber: %@, failed: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)purgeLimitedAccessRecordsForBundle:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_2(&dword_18F8BD000, v0, v1, "purgeLimitedAccessRecordsForBundle: %@ failed: %@");
  OUTLINED_FUNCTION_2_0();
}

- (void)updateLimitedAccessTable:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "updateLimitedAccessTable failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)getLimitedAccessContactsCountForBundle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "getLimitedAccessContactsCountForBundle failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)getLimitedAccessLastSyncSequenceNumber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "getLimitedAccessLastSyncSequenceNumber failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)getWatchLimitedAccessSyncDataStartingAtSequenceNumber:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "getWatchLimitedAccessSyncDataStartingAtSequenceNumber: %ld, failed: %@", buf, 0x16u);
}

- (void)applyLimitedAccessSyncEvents:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "applyLimitedAccessSyncEvents failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)setLimitedAccessTableCurrentSequenceNumber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, v0, v1, "setLimitedAccessTableCurrentSequenceNumber failed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
