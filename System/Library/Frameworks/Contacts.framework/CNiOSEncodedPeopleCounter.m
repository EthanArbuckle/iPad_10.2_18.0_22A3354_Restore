@implementation CNiOSEncodedPeopleCounter

+ (id)os_log
{
  objc_opt_self();
  if (os_log_cn_once_token_0_22 != -1)
    dispatch_once(&os_log_cn_once_token_0_22, &__block_literal_global_133);
  return (id)os_log_cn_once_object_0_22;
}

void __35__CNiOSEncodedPeopleCounter_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNiOSEncodedPeopleCounter");
  v1 = (void *)os_log_cn_once_object_0_22;
  os_log_cn_once_object_0_22 = (uint64_t)v0;

}

- (CNiOSEncodedPeopleCounter)initWithFetchRequest:(id)a3 addressBook:(id)a4 managedConfiguration:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNiOSEncodedPeopleCounter *v12;
  CNiOSEncodedPeopleCounter *v13;
  CNiOSEncodedPeopleCounter *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNiOSEncodedPeopleCounter;
  v12 = -[CNiOSEncodedPeopleCounter init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_addressBook, a4);
    objc_storeStrong((id *)&v13->_contactFetchRequest, a3);
    objc_storeStrong((id *)&v13->_managedConfiguration, a5);
    v14 = v13;
  }

  return v13;
}

- (BOOL)supportsCounting
{
  CNiOSEncodedPeopleCounter *v2;
  BOOL v3;
  CNContactFetchRequest *contactFetchRequest;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;

  v2 = self;
  if (self)
    self = (CNiOSEncodedPeopleCounter *)self->_contactFetchRequest;
  if ((-[CNiOSEncodedPeopleCounter disallowsEncodedFetch](self, "disallowsEncodedFetch") & 1) == 0)
  {
    if (v2)
      contactFetchRequest = v2->_contactFetchRequest;
    else
      contactFetchRequest = 0;
    -[CNContactFetchRequest effectivePredicate](contactFetchRequest, "effectivePredicate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE185958))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (v7 && (objc_opt_respondsToSelector() & 1) == 0)
    {
      if ((objc_msgSend(v7, "cn_supportsEncodedFetching") & 1) != 0)
      {
        -[CNFavoritesEntry setBundleIdentifier:]((uint64_t)v2, v7);
        v3 = 1;
LABEL_18:

        return v3;
      }
      +[CNiOSEncodedPeopleCounter os_log]();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[CNiOSEncodedPeopleCounter supportsCounting].cold.1(v8);

    }
    v3 = 0;
    goto LABEL_18;
  }
  return 0;
}

- (id)fetchContactCountWithError:(id *)a3
{
  CNiOSAddressBook *addressBook;
  CNiOSAddressBook *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__33;
  v19 = __Block_byref_object_dispose__33;
  v20 = 0;
  if (self)
    addressBook = self->_addressBook;
  else
    addressBook = 0;
  v6 = addressBook;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__CNiOSEncodedPeopleCounter_fetchContactCountWithError___block_invoke;
  v14[3] = &unk_1E29FDD20;
  v14[4] = self;
  v14[5] = &v15;
  -[CNiOSAddressBook resultWithInvalidatedAddressBook:](v6, "resultWithInvalidatedAddressBook:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)v16[5];
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(v7, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;
  v12 = v11;
  if (a3 && !v11)
    *a3 = objc_retainAutorelease(v10);
  if (!v9)

  _Block_object_dispose(&v15, 8);
  return v12;
}

id __56__CNiOSEncodedPeopleCounter_fetchContactCountWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  id obj;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 16);
  else
    v5 = 0;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[5];
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v7 + 40);
  v8 = v6;
  v9 = v5;
  +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:managedConfiguration:error:](CNiOSPersonFetchRequest, "fetchRequestFromCNFetchRequest:managedConfiguration:error:", v9, v8, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);

  if (v10)
  {
    v11 = *(_QWORD **)(a1 + 32);
    if (v11)
      v11 = (_QWORD *)v11[6];
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v25 = *(id *)(v12 + 40);
    v13 = v11;
    objc_msgSend(v13, "cn_ABQSLPredicateForAddressBook:fetchRequest:error:", a2, v10, &v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), v25);

    if (v14)
    {
      v15 = objc_alloc(MEMORY[0x1E0CF5D60]);
      v16 = *(_QWORD **)(a1 + 32);
      if (v16)
        v16 = (_QWORD *)v16[2];
      v17 = v16;
      v18 = objc_msgSend(v17, "unifyResults");
      v19 = *(_QWORD *)(a1 + 32);
      if (v19)
        v20 = *(_QWORD *)(v19 + 40);
      else
        v20 = 0;
      v21 = (void *)objc_msgSend(v15, "initWithAddressBook:predicate:includeLinkedContacts:managedConfiguration:", a2, v14, v18, v20, v25);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v21, "fetchContactCount"));
      v22 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        v23 = 0;
      else
        v23 = &unk_1E2A401A0;
      v22 = v23;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatePredicate, 0);
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactFetchRequest, 0);
  objc_storeStrong((id *)&self->_addressBook, 0);
}

- (void)supportsCounting
{
  objc_class *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cn_supportsEncodedFetching);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl(&dword_18F8BD000, a1, OS_LOG_TYPE_ERROR, "Cannot use %{public}@ with a predicate not supporting %{public}@", (uint8_t *)&v5, 0x16u);

}

@end
