@implementation CNiOSPersonFetchRequest

- (CNManagedConfiguration)managedConfiguration
{
  return (CNManagedConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)unifiedFetch
{
  return self->_unifiedFetch;
}

- (unsigned)sortOrderIncludingNone
{
  if (-[CNiOSPersonFetchRequest shouldSort](self, "shouldSort"))
    return -[CNiOSPersonFetchRequest sortOrder](self, "sortOrder");
  else
    return -1;
}

- (BOOL)shouldSort
{
  return self->_shouldSort;
}

- (NSArray)keysToFetch
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

+ (id)fetchRequestFromCNFetchRequest:(id)a3 managedConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CNiOSPersonFetchRequest *v18;
  void *v19;
  void *v20;
  CNiOSPersonFetchRequest *v21;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "predicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "validatePredicate:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(a1, "resolvedSortOrderFromContactSortOrder:", objc_msgSend(v8, "sortOrder"));
    v13 = v12 != 0;
    +[CNiOSABConstantsMapping CNToABPersonSortOrderingConstantsMapping](CNiOSABConstantsMapping, "CNToABPersonSortOrderingConstantsMapping");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mappedConstant:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntValue");

    v18 = [CNiOSPersonFetchRequest alloc];
    objc_msgSend(v8, "effectiveKeysToFetch");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CNiOSPersonFetchRequest initWithPredicate:keysToFetch:shouldSort:sortOrder:unifiedFetch:batchSize:managedConfiguration:options:](v18, "initWithPredicate:keysToFetch:shouldSort:sortOrder:unifiedFetch:batchSize:managedConfiguration:options:", v11, v20, v13, v17, objc_msgSend(v8, "unifyResults"), objc_msgSend(v8, "batchSize"), v9, 1);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (CNiOSPersonFetchRequest)initWithPredicate:(id)a3 keysToFetch:(id)a4 shouldSort:(BOOL)a5 sortOrder:(unsigned int)a6 unifiedFetch:(BOOL)a7 batchSize:(int64_t)a8 managedConfiguration:(id)a9 options:(unint64_t)a10
{
  id v17;
  id v18;
  CNiOSPersonFetchRequest *v19;
  CNiOSPersonFetchRequest *v20;
  CNiOSPersonFetchRequest *v21;
  id v23;
  objc_super v24;

  v17 = a3;
  v18 = a4;
  v23 = a9;
  v24.receiver = self;
  v24.super_class = (Class)CNiOSPersonFetchRequest;
  v19 = -[CNiOSPersonFetchRequest init](&v24, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_keysToFetch, a4);
    objc_storeStrong((id *)&v20->_predicate, a3);
    v20->_shouldSort = a5;
    v20->_sortOrder = a6;
    v20->_options = a10;
    v20->_unifiedFetch = a7;
    v20->_batchSize = a8;
    objc_storeStrong((id *)&v20->_managedConfiguration, a9);
    v21 = v20;
  }

  return v20;
}

+ (id)validatePredicate:(id)a3 error:(id *)a4
{
  void *v5;

  objc_msgSend(a1, "effectivePredicate:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EE185958) & 1) != 0)
      return v5;
  }
  else if (a4)
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v5 = 0;
  return v5;
}

+ (int64_t)resolvedSortOrderFromContactSortOrder:(int64_t)a3
{
  void *v4;
  int64_t v5;

  if ((unint64_t)a3 <= 3 && a3 != 1 || a3 == 1000)
    return a3;
  +[CNContactsUserDefaults sharedDefaults](CNContactsUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sortOrder");

  return v5;
}

+ (id)effectivePredicate:(id)a3
{
  id v3;

  v3 = a3;
  if (!v3)
  {
    +[CNContact predicateForAllContacts](CNContact, "predicateForAllContacts");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (CNiOSContactPredicate)predicate
{
  return (CNiOSContactPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)options
{
  return self->_options;
}

@end
