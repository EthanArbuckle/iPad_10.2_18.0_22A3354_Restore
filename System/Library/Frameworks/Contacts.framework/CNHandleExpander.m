@implementation CNHandleExpander

- (CNHandleExpander)initWithHandles:(id)a3
{
  id v5;
  CNHandleExpander *v6;
  CNHandleExpander *v7;
  CNHandleExpander *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNHandleExpander;
  v6 = -[CNHandleExpander init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_incomingAddresses, a3);
    v8 = v7;
  }

  return v7;
}

- (id)expandedHandles
{
  NSArray *expandedAddresses;

  expandedAddresses = self->_expandedAddresses;
  if (!expandedAddresses)
  {
    -[CNHandleExpander expandHandles](self, "expandHandles");
    expandedAddresses = self->_expandedAddresses;
  }
  return expandedAddresses;
}

- (void)expandHandles
{
  NSArray *expandedAddresses;
  void *v4;
  void *v5;
  void *v6;
  CNContactFetchRequest *v7;
  void *v8;
  NSArray *v9;
  id v10;
  NSArray *v11;
  NSArray *v12;
  _QWORD v13[4];
  NSArray *v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D137F8] + 16))())
  {
    expandedAddresses = self->_expandedAddresses;
    self->_expandedAddresses = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "contactStoreForFetchingContacts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNContact predicateForContactsMatchingHandleStrings:](CNContact, "predicateForContactsMatchingHandleStrings:", self->_incomingAddresses);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("emailAddresses");
    v16[1] = CFSTR("phoneNumbers");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v6);
    -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __33__CNHandleExpander_expandHandles__block_invoke;
    v13[3] = &unk_1E29FA870;
    v9 = v8;
    v14 = v9;
    objc_msgSend(v4, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v15, v13);
    v10 = v15;
    v11 = self->_expandedAddresses;
    self->_expandedAddresses = v9;
    v12 = v9;

  }
}

void __33__CNHandleExpander_expandHandles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "emailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_map:", &__block_literal_global_7_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(v4, "phoneNumbers");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_cn_map:", &__block_literal_global_8_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v8);

}

+ (id)contactStoreForFetchingContacts
{
  if (contactStoreForFetchingContacts_cn_once_token_0 != -1)
    dispatch_once(&contactStoreForFetchingContacts_cn_once_token_0, &__block_literal_global_70);
  return (id)contactStoreForFetchingContacts_cn_once_object_0;
}

void __51__CNHandleExpander_contactStoreForFetchingContacts__block_invoke()
{
  CNContactStore *v0;
  void *v1;

  v0 = objc_alloc_init(CNContactStore);
  v1 = (void *)contactStoreForFetchingContacts_cn_once_object_0;
  contactStoreForFetchingContacts_cn_once_object_0 = (uint64_t)v0;

}

- (NSArray)incomingAddresses
{
  return self->_incomingAddresses;
}

- (void)setIncomingAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_incomingAddresses, a3);
}

- (NSArray)expandedAddresses
{
  return self->_expandedAddresses;
}

- (void)setExpandedAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_expandedAddresses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedAddresses, 0);
  objc_storeStrong((id *)&self->_incomingAddresses, 0);
}

@end
