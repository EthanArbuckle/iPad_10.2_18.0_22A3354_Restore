@implementation CNiOSEncodedPeopleFetcher

- (id)cursorWithError:(id *)a1
{
  id *v2;
  id v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;

  if (a1)
  {
    v2 = a1;
    if (a1[7])
    {
LABEL_3:
      a1 = (id *)v2[7];
      return a1;
    }
    objc_msgSend(a1[3], "effectivePredicate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v4, "cn_supportsEncodedFetching") & 1) != 0)
    {
      v4 = v4;
      v5 = v2[9];
      v6 = v2[3];
      +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:managedConfiguration:error:](CNiOSPersonFetchRequest, "fetchRequestFromCNFetchRequest:managedConfiguration:error:", v6, v5, a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = objc_opt_respondsToSelector();
        v9 = v2[2];
        if ((v8 & 1) != 0)
        {
          v10 = v2[4];
          objc_msgSend(v4, "cn_cursorForEncodedPeopleFromAddressBook:fetchRequest:environment:error:", v9, v7, v10, a2);
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "cn_ABQSLPredicateForAddressBook:fetchRequest:error:", v2[2], v7, a2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v18;
          if (!v18)
          {
LABEL_18:

            goto LABEL_3;
          }
          if (objc_msgSend(v18, "isNullPredicate"))
          {
            v11 = objc_opt_new();
          }
          else
          {
            -[CNiOSEncodedPeopleFetcher queryCursorForABSQLPredicate:fetchRequest:](v2, v10, v7);
            v11 = objc_claimAutoreleasedReturnValue();
          }
        }
        v19 = v2[7];
        v2[7] = (id)v11;

        goto LABEL_18;
      }

    }
    else
    {
      v12 = (void *)MEMORY[0x1E0C99DA0];
      v13 = *MEMORY[0x1E0C99768];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_cn_supportsEncodedFetching);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise:format:", v13, CFSTR("Cannot use %@ with a predicate not supporting %@"), v15, v16);

    }
    a1 = 0;
  }
  return a1;
}

- (_QWORD)queryCursorForABSQLPredicate:(void *)a3 fetchRequest:
{
  _QWORD *v3;
  id v5;
  id v6;
  void *v7;
  CFTypeRef v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = a1;
  if (a1)
  {
    v5 = a3;
    v6 = a2;
    objc_msgSend(v5, "keysToFetch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[CNiOSABConversions requiredABPropertyIDSetForKeysToFetch:]((uint64_t)CNiOSABConversions, v7);

    v9 = objc_alloc(MEMORY[0x1E0CF5D58]);
    v10 = v3[2];
    v11 = objc_msgSend(v5, "unifiedFetch");
    v12 = objc_msgSend(v5, "sortOrderIncludingNone");
    v13 = objc_msgSend(v5, "batchSize");
    objc_msgSend(v5, "managedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = (_QWORD *)objc_msgSend(v9, "initWithAddressBook:predicate:propertyIdentifierSet:includeLinkedContacts:sortOrder:suggestedContactsPerBatch:managedConfiguration:identifierAuditMode:authorizationContext:", v10, v6, v8, v11, v12, v13, v14, v3[10], v3[11]);
  }
  return v3;
}

- (BOOL)fetchEncodedPeopleWithError:(id *)a3 cancelationToken:(id)a4 batchHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t *v12;
  BOOL v13;
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

  v8 = a4;
  v9 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__10;
  v23 = __Block_byref_object_dispose__10;
  v24 = 0;
  v10 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __87__CNiOSEncodedPeopleFetcher_fetchEncodedPeopleWithError_cancelationToken_batchHandler___block_invoke;
    v15[3] = &unk_1E29F93E8;
    v17 = &v19;
    v18 = &v25;
    v11 = v9;
    v16 = v11;
    -[CNiOSEncodedPeopleFetcher fetchNextBatchWithReply:](self, "fetchNextBatchWithReply:", v15);

    v12 = v20;
    if (*((_BYTE *)v26 + 24) || v20[5])
      break;
    if (objc_msgSend(v8, "isCanceled"))
    {
      v12 = v20;
      break;
    }
  }
  if (a3)
  {
    *a3 = objc_retainAutorelease((id)v12[5]);
    v12 = v20;
  }
  v13 = v12[5] == 0;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v13;
}

void __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  id v28;

  v3 = a2;
  v4 = (void *)MEMORY[0x19400675C]();
  v5 = *(id **)(a1 + 32);
  v28 = 0;
  -[CNiOSEncodedPeopleFetcher cursorWithError:](v5, (uint64_t)&v28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v28;
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[8];
  v9 = v8;
  v10 = v9;
  if (v6)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke_2;
    v20[3] = &unk_1E29F9410;
    v11 = v9;
    v21 = v11;
    v22 = *(id *)(a1 + 40);
    v23 = &v24;
    objc_msgSend(v6, "fetchNextBatchWithReply:", v20);
    if (!*((_BYTE *)v25 + 24))
    {

      _Block_object_dispose(&v24, 8);
      objc_autoreleasePoolPop(v4);
      goto LABEL_17;
    }
    -[CNiOSEncodedPeopleFetcher setCursor:](*(_QWORD *)(a1 + 32), 0);

    _Block_object_dispose(&v24, 8);
    v10 = v6;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  objc_autoreleasePoolPop(v4);
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    v15 = *(_QWORD *)(v15 + 40);
  if (v15)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v12, v13, v14);
    v17 = *(void **)(a1 + 32);
    if (v17)
      objc_setProperty_nonatomic_copy(v17, v16, 0, 40);
  }
  v18 = *(const void **)(a1 + 48);
  if (v18)
    CFRelease(v18);
  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
    *(_QWORD *)(v19 + 16) = 0;
LABEL_17:

}

- (void)setCursor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (void)fetchNextBatchWithReply:(id)a3
{
  id v4;
  void *addressBook;
  CNContactsLogger *logger;
  id v7;
  _QWORD v8[5];
  id v9;
  void *v10;

  v4 = a3;
  if (self)
  {
    addressBook = self->_addressBook;
    logger = self->_logger;
  }
  else
  {
    addressBook = 0;
    logger = 0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke;
  v8[3] = &unk_1E29F9438;
  v8[4] = self;
  v9 = v4;
  v10 = addressBook;
  v7 = v4;
  -[CNContactsLogger fetchingContactsBatch:](logger, "fetchingContactsBatch:", v8);

}

- (void)dealloc
{
  void (**cursorCompletionHandler)(id, SEL);
  void *addressBook;
  objc_super v5;

  cursorCompletionHandler = (void (**)(id, SEL))self->_cursorCompletionHandler;
  if (cursorCompletionHandler)
    cursorCompletionHandler[2](cursorCompletionHandler, a2);
  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v5.receiver = self;
  v5.super_class = (Class)CNiOSEncodedPeopleFetcher;
  -[CNiOSEncodedPeopleFetcher dealloc](&v5, sel_dealloc);
}

void __87__CNiOSEncodedPeopleFetcher_fetchEncodedPeopleWithError_cancelationToken_batchHandler___block_invoke(_QWORD *a1, void *a2, char a3, void *a4)
{
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v7 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a4);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
    v8 = (void *)MEMORY[0x19400675C]();
    (*(void (**)(void))(a1[4] + 16))();
    objc_autoreleasePoolPop(v8);
  }

}

void __53__CNiOSEncodedPeopleFetcher_fetchNextBatchWithReply___block_invoke_2(_QWORD *a1, void *a2, char a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)a1[4];
  v8 = a4;
  v9 = a2;
  objc_msgSend(v9, "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didFetchEncodedContacts:error:", v10, v8);

  (*(void (**)(void))(a1[5] + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationContext, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong(&self->_cursorCompletionHandler, 0);
  objc_storeStrong(&self->_addressBookCompletionHandler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactFetchRequest, 0);
}

- (CNiOSEncodedPeopleFetcher)initWithFetchRequest:(id)a3 addressBook:(void *)a4 managedConfiguration:(id)a5 addressBookCompletionHandler:(id)a6 cursorCompletionHandler:(id)a7 environment:(id)a8 identifierAuditMode:(int64_t)a9 authorizationContext:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  CNiOSEncodedPeopleFetcher *v21;
  void *v22;
  void *v23;
  id cursorCompletionHandler;
  void *v25;
  id addressBookCompletionHandler;
  void *v27;
  uint64_t v28;
  CNContactsLogger *logger;
  CNiOSEncodedPeopleFetcher *v30;
  id v32;
  id v33;
  objc_super v34;

  v33 = a3;
  v32 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a10;
  v34.receiver = self;
  v34.super_class = (Class)CNiOSEncodedPeopleFetcher;
  v21 = -[CNiOSEncodedPeopleFetcher init](&v34, sel_init);
  if (v21)
  {
    if (a4)
      v22 = (void *)CFRetain(a4);
    else
      v22 = 0;
    v21->_addressBook = v22;
    objc_storeStrong((id *)&v21->_contactFetchRequest, a3);
    objc_storeStrong((id *)&v21->_environment, a8);
    v23 = _Block_copy(v18);
    cursorCompletionHandler = v21->_cursorCompletionHandler;
    v21->_cursorCompletionHandler = v23;

    v25 = _Block_copy(v17);
    addressBookCompletionHandler = v21->_addressBookCompletionHandler;
    v21->_addressBookCompletionHandler = v25;

    objc_msgSend(v19, "loggerProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "contactsLogger");
    v28 = objc_claimAutoreleasedReturnValue();
    logger = v21->_logger;
    v21->_logger = (CNContactsLogger *)v28;

    objc_storeStrong((id *)&v21->_managedConfiguration, a5);
    v21->_identifierAuditMode = a9;
    objc_storeStrong((id *)&v21->_authorizationContext, a10);
    v30 = v21;
  }

  return v21;
}

- (BOOL)preferLinkIdentifiersForIdentifierAudit
{
  return self->_preferLinkIdentifiersForIdentifierAudit;
}

- (void)setPreferLinkIdentifiersForIdentifierAudit:(BOOL)a3
{
  self->_preferLinkIdentifiersForIdentifierAudit = a3;
}

@end
