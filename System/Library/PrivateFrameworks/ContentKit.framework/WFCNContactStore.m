@implementation WFCNContactStore

- (WFCNContactStore)init
{
  void *v3;
  WFCNContactStore *v4;

  getCNContactStoreClass();
  v3 = (void *)objc_opt_new();
  v4 = -[WFCNContactStore initWithContactStore:](self, "initWithContactStore:", v3);

  return v4;
}

- (WFCNContactStore)initWithContactStore:(id)a3
{
  id v5;
  WFCNContactStore *v6;
  WFCNContactStore *v7;
  WFCNContactStore *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCNContactStore;
  v6 = -[WFContactStore init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)allContactsWithSortOrder:(int64_t)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  if (WFCNContactAuthorizationStatus() == 3)
  {
    v7 = objc_alloc((Class)getCNContactFetchRequestClass());
    +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithKeysToFetch:", v8);

    if ((unint64_t)(a3 - 1) >= 3)
      v10 = 0;
    else
      v10 = a3;
    objc_msgSend(v9, "setSortOrder:", v10);
    v11 = (void *)objc_opt_new();
    -[WFCNContactStore contactStore](self, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __57__WFCNContactStore_allContactsWithSortOrder_passingTest___block_invoke;
    v17[3] = &unk_24C4DF3E8;
    v19 = v6;
    v13 = v11;
    v18 = v13;
    objc_msgSend(v12, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, 0, v17);

    v14 = v18;
    v15 = v13;

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)allContactsWithSortOrder:(int64_t)a3
{
  return -[WFCNContactStore allContactsWithSortOrder:passingTest:](self, "allContactsWithSortOrder:passingTest:", a3, &__block_literal_global_37);
}

- (id)contactsWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCNContactStore contactsWithName:keysToFetch:](self, "contactsWithName:keysToFetch:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contactsWithName:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (WFCNContactAuthorizationStatus() == 3)
  {
    v8 = 0;
  }
  else
  {
    -[WFCNContactStore contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getCNContactClass(), "predicateForContactsMatchingName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "if_map:", &__block_literal_global_39_10547);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)firstContactWithPredicate:(id)a3 propertyID:(int)a4 valueEqualityBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v6 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (WFCNContactAuthorizationStatus() != 3)
  {
    -[WFCNContactStore contactStore](self, "contactStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v11, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v12, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v25;

    if (v13)
    {
      objc_msgSend(v13, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        CNContactPropertyKeyFromWFContactPropertyID(v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject isKeyAvailable:](v15, "isKeyAvailable:", v16))
        {
          -[NSObject valueForKey:](v15, "valueForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = MEMORY[0x24BDAC760];
          v21 = 3221225472;
          v22 = __76__WFCNContactStore_firstContactWithPredicate_propertyID_valueEqualityBlock___block_invoke;
          v23 = &unk_24C4DF490;
          v24 = v9;
          v18 = objc_msgSend(v17, "indexOfObjectPassingTest:", &v20);
          if (v18 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = 0;
          }
          else
          {
            +[WFCNContact contactWithCNContact:propertyID:multivalueIndex:](WFCNContact, "contactWithCNContact:propertyID:multivalueIndex:", v15, v6, v18, v20, v21, v22, v23);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v10 = 0;
        }

        goto LABEL_15;
      }
    }
    else
    {
      getWFWFContactLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "-[WFCNContactStore firstContactWithPredicate:propertyID:valueEqualityBlock:]";
        v28 = 2114;
        v29 = v8;
        v30 = 2114;
        v31 = v14;
        _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_ERROR, "%s Failed to fetch contacts for predicate %{public}@: %{public}@", buf, 0x20u);
      }
    }
    v10 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v10 = 0;
LABEL_16:

  return v10;
}

- (id)firstContactWithEmailAddress:(id)a3
{
  id v4;
  id CNContactClass;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  CNContactClass = getCNContactClass();
  objc_msgSend(v4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CNContactClass, "predicateForContactsMatchingEmailAddress:groupIdentifiers:limitToOneResult:", v6, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__WFCNContactStore_firstContactWithEmailAddress___block_invoke;
  v11[3] = &unk_24C4DFD88;
  v12 = v4;
  v8 = v4;
  -[WFCNContactStore firstContactWithPredicate:propertyID:valueEqualityBlock:](self, "firstContactWithPredicate:propertyID:valueEqualityBlock:", v7, 4, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)firstContactWithPhoneNumber:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getCNPhoneNumberClass_softClass;
  v18 = getCNPhoneNumberClass_softClass;
  if (!getCNPhoneNumberClass_softClass)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getCNPhoneNumberClass_block_invoke;
    v14[3] = &unk_24C4E3118;
    v14[4] = &v15;
    __getCNPhoneNumberClass_block_invoke((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v4, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneNumberWithStringValue:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(getCNContactClass(), "predicateForContactsMatchingPhoneNumber:prefixHint:groupIdentifiers:limitToOneResult:", v8, 0, 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __48__WFCNContactStore_firstContactWithPhoneNumber___block_invoke;
    v12[3] = &unk_24C4DFD88;
    v13 = v8;
    -[WFCNContactStore firstContactWithPredicate:propertyID:valueEqualityBlock:](self, "firstContactWithPredicate:propertyID:valueEqualityBlock:", v9, 3, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)contactWithIdentifier:(id)a3
{
  id v5;
  id CNContactClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCNContact.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contactIdentifier"));

  }
  if (WFCNContactAuthorizationStatus() == 3)
  {
    CNContactClass = getCNContactClass();
    v24[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CNContactClass, "predicateForContactsWithIdentifiers:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFCNContactStore contactStore](self, "contactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v9, "unifiedContactsMatchingPredicate:keysToFetch:error:", v8, v10, &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v17;

    if (v11)
    {
      if (!objc_msgSend(v11, "count"))
      {
        v14 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v11, "firstObject");
      v13 = objc_claimAutoreleasedReturnValue();
      +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      getWFWFContactLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v19 = "-[WFCNContactStore contactWithIdentifier:]";
        v20 = 2114;
        v21 = v8;
        v22 = 2114;
        v23 = v12;
        _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Failed to fetch contacts for predicate %{public}@: %{public}@", buf, 0x20u);
      }
      v14 = 0;
    }

LABEL_13:
    goto LABEL_14;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (id)contactsMatchingPredicate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  -[WFCNContactStore contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFCNContact requiredKeysToFetch](WFCNContact, "requiredKeysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "if_map:", &__block_literal_global_51_10383);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)addContact:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v7 = (void *)getCNSaveRequestClass_softClass;
  v17 = getCNSaveRequestClass_softClass;
  if (!getCNSaveRequestClass_softClass)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __getCNSaveRequestClass_block_invoke;
    v13[3] = &unk_24C4E3118;
    v13[4] = &v14;
    __getCNSaveRequestClass_block_invoke((uint64_t)v13);
    v7 = (void *)v15[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v14, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v9, "addContact:toContainerWithIdentifier:", v6, 0);
  -[WFCNContactStore contactStore](self, "contactStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "executeSaveRequest:error:", v9, a4);

  return v11;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

WFCNContact *__52__WFCNContactStore_contactsMatchingPredicate_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", a2);
}

uint64_t __48__WFCNContactStore_firstContactWithPhoneNumber___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLikePhoneNumber:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __49__WFCNContactStore_firstContactWithEmailAddress___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __76__WFCNContactStore_firstContactWithPredicate_propertyID_valueEqualityBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

WFCNContact *__49__WFCNContactStore_contactsWithName_keysToFetch___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", a2);
}

uint64_t __45__WFCNContactStore_allContactsWithSortOrder___block_invoke()
{
  return 1;
}

void __57__WFCNContactStore_allContactsWithSortOrder_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  +[WFCNContact contactWithCNContact:](WFCNContact, "contactWithCNContact:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
