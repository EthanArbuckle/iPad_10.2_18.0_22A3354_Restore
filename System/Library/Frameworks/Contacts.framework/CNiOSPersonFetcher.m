@implementation CNiOSPersonFetcher

+ (id)peopleForFetchRequest:(id)a3 matchInfos:(id *)a4 inAddressBook:(void *)a5 environment:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  CNiOSPersonFetcher *v13;
  void *v14;

  v11 = a6;
  v12 = a3;
  v13 = -[CNiOSPersonFetcher initWithAddressBook:fetchRequest:environment:]([CNiOSPersonFetcher alloc], "initWithAddressBook:fetchRequest:environment:", a5, v12, v11);

  -[CNiOSPersonFetcher fetchPeopleReturningMatchInfos:error:](v13, "fetchPeopleReturningMatchInfos:error:", a4, a7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (CNiOSPersonFetcher)initWithAddressBook:(void *)a3 fetchRequest:(id)a4 environment:(id)a5
{
  id v9;
  id v10;
  CNiOSPersonFetcher *v11;
  void *v12;
  CNiOSPersonFetcher *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CNiOSPersonFetcher;
  v11 = -[CNiOSPersonFetcher init](&v15, sel_init);
  if (v11)
  {
    if (a3)
      v12 = (void *)CFRetain(a3);
    else
      v12 = 0;
    v11->_addressBook = v12;
    objc_storeStrong((id *)&v11->_fetchRequest, a4);
    objc_storeStrong((id *)&v11->_environment, a5);
    v13 = v11;
  }

  return v11;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)CNiOSPersonFetcher;
  -[CNiOSPersonFetcher dealloc](&v4, sel_dealloc);
}

- (id)executeFetchRequestWithProgressiveResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[CNiOSPersonFetchRequest predicate](self->_fetchRequest, "predicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE18D8E0))
  {
    objc_msgSend(v8, "cn_fetchPeopleInAddressBook:fetchRequest:progressiveResults:completion:environment:", self->_addressBook, self->_fetchRequest, v6, v7, self->_environment);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)fetchPeopleReturningMatchInfos:(id *)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;

  -[CNiOSPersonFetcher fetchPeopleUsingNativeSortReturningMatchInfos:error:](self, "fetchPeopleUsingNativeSortReturningMatchInfos:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNiOSPersonFetcher shouldSortInMemory](self, "shouldSortInMemory"))
  {
    -[CNiOSPersonFetcher sortPeople:](self, "sortPeople:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)fetchPeopleUsingNativeSortReturningMatchInfos:(id *)a3 error:(id *)a4
{
  void *v6;
  id v7;
  _QWORD v9[7];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  v10 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__CNiOSPersonFetcher_fetchPeopleUsingNativeSortReturningMatchInfos_error___block_invoke;
  v9[3] = &unk_1E29F9288;
  v9[5] = &v11;
  v9[6] = a3;
  v9[4] = self;
  CNBridgeABCFResultAndErrorFromBlock(&v10, (uint64_t)v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  if (v7)
  {

    v6 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __74__CNiOSPersonFetcher_fetchPeopleUsingNativeSortReturningMatchInfos_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  void *v11;
  id *p_obj;
  void *v13;
  uint64_t v14;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "addressBook");
  objc_msgSend(*(id *)(a1 + 32), "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v9 + 40);
    v10 = (id *)(v9 + 40);
    obj = v11;
    p_obj = &obj;
  }
  else
  {
    p_obj = 0;
    v10 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v5, "cn_copyPeopleInAddressBook:fetchRequest:matchInfos:environment:error:", v6, v7, p_obj, v13, a2);
  if (v8)
    objc_storeStrong(v10, obj);

  return v14;
}

- (BOOL)shouldSortInMemory
{
  void *v3;
  int v4;

  if (-[CNiOSPersonFetchRequest shouldSort](self->_fetchRequest, "shouldSort"))
  {
    -[CNiOSPersonFetchRequest predicate](self->_fetchRequest, "predicate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "cn_supportsNativeSorting") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)sortPeople:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__CNiOSPersonFetcher_sortPeople___block_invoke;
  v4[3] = &unk_1E29F92B0;
  v4[4] = self;
  objc_msgSend(a3, "sortedArrayUsingComparator:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

CFComparisonResult __33__CNiOSPersonFetcher_sortPeople___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  CFComparisonResult v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = ABPersonComparePeopleByName(v6, v5, objc_msgSend(v7, "sortOrder"));

  return v8;
}

- (CNiOSPersonFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)addressBook
{
  return self->_addressBook;
}

- (CNContactsEnvironment)environment
{
  return self->_environment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end
