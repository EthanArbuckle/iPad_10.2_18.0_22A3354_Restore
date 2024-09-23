@implementation CNiOSABSaveContext

- (CNiOSABSaveContext)initWithSaveRequest:(id)a3 response:(id)a4 addressBook:(void *)a5
{
  id v9;
  id v10;
  CNiOSABSaveContext *v11;
  CNiOSABSaveContext *v12;
  void *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *abPersonsByIdentifier;
  NSMutableDictionary *v16;
  NSMutableDictionary *abGroupsByIdentifier;
  NSMutableDictionary *v18;
  NSMutableDictionary *abSourcesByIdentifier;
  NSMutableDictionary *v20;
  NSMutableDictionary *abAccountsByIdentifier;
  NSMutableArray *v22;
  NSMutableArray *contactIdentifiersNeedingMetadataPurge;
  uint64_t v24;
  NSMapTable *contactIndicesByInstance;
  uint64_t v26;
  NSMapTable *groupIndicesByInstance;
  uint64_t v28;
  NSMapTable *containerIndicesByInstance;
  CNiOSABSaveContext *v30;
  objc_super v32;

  v9 = a3;
  v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)CNiOSABSaveContext;
  v11 = -[CNiOSABSaveContext init](&v32, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_saveRequest, a3);
    objc_storeStrong((id *)&v12->_saveResponse, a4);
    if (a5)
      v13 = (void *)CFRetain(a5);
    else
      v13 = 0;
    v12->_addressBook = v13;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    abPersonsByIdentifier = v12->_abPersonsByIdentifier;
    v12->_abPersonsByIdentifier = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    abGroupsByIdentifier = v12->_abGroupsByIdentifier;
    v12->_abGroupsByIdentifier = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    abSourcesByIdentifier = v12->_abSourcesByIdentifier;
    v12->_abSourcesByIdentifier = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    abAccountsByIdentifier = v12->_abAccountsByIdentifier;
    v12->_abAccountsByIdentifier = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    contactIdentifiersNeedingMetadataPurge = v12->_contactIdentifiersNeedingMetadataPurge;
    v12->_contactIdentifiersNeedingMetadataPurge = v22;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    contactIndicesByInstance = v12->_contactIndicesByInstance;
    v12->_contactIndicesByInstance = (NSMapTable *)v24;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    groupIndicesByInstance = v12->_groupIndicesByInstance;
    v12->_groupIndicesByInstance = (NSMapTable *)v26;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 512, 0);
    v28 = objc_claimAutoreleasedReturnValue();
    containerIndicesByInstance = v12->_containerIndicesByInstance;
    v12->_containerIndicesByInstance = (NSMapTable *)v28;

    -[CNiOSABSaveContext _populateSaveRequestIndexTables](v12, "_populateSaveRequestIndexTables");
    v30 = v12;
  }

  return v12;
}

- (void)addressBook
{
  void *addressBook;
  CFTypeRef v3;

  addressBook = self->_addressBook;
  if (addressBook && (v3 = CFRetain(addressBook)) != 0)
    return (void *)CFAutorelease(v3);
  else
    return 0;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)CNiOSABSaveContext;
  -[CNiOSABSaveContext dealloc](&v4, sel_dealloc);
}

- (void)_populateSaveRequestIndexTables
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  -[CNSaveRequest allContacts](self->_saveRequest, "allContacts");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke;
  v9[3] = &unk_1E29F9758;
  v9[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
  -[CNSaveRequest allGroups](self->_saveRequest, "allGroups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_3;
  v8[3] = &unk_1E29F9780;
  v8[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  -[CNSaveRequest allContainers](self->_saveRequest, "allContainers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_4;
  v7[3] = &unk_1E29F97A8;
  v7[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "contactIndicesByInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

  objc_msgSend(v6, "linkedContacts");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_2;
  v10[3] = &unk_1E29F9730;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = a3;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v7[0] = *(_QWORD *)(a1 + 40);
  v7[1] = a3;
  v4 = a2;
  objc_msgSend(v3, "contactIndicesByInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v7, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v4);

}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "groupIndicesByInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

void __53__CNiOSABSaveContext__populateSaveRequestIndexTables__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "containerIndicesByInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

- (id)indexPathForContactInstance:(id)a3
{
  return -[NSMapTable objectForKey:](self->_contactIndicesByInstance, "objectForKey:", a3);
}

- (id)indexPathForGroupInstance:(id)a3
{
  return -[NSMapTable objectForKey:](self->_groupIndicesByInstance, "objectForKey:", a3);
}

- (id)indexPathForContainerInstance:(id)a3
{
  return -[NSMapTable objectForKey:](self->_containerIndicesByInstance, "objectForKey:", a3);
}

- (NSMapTable)contactIndicesByInstance
{
  return self->_contactIndicesByInstance;
}

- (NSMapTable)groupIndicesByInstance
{
  return self->_groupIndicesByInstance;
}

- (NSMapTable)containerIndicesByInstance
{
  return self->_containerIndicesByInstance;
}

- (NSMutableDictionary)abPersonsByIdentifier
{
  return self->_abPersonsByIdentifier;
}

- (void)setAbPersonsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_abPersonsByIdentifier, a3);
}

- (NSMutableDictionary)abGroupsByIdentifier
{
  return self->_abGroupsByIdentifier;
}

- (void)setAbGroupsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_abGroupsByIdentifier, a3);
}

- (NSMutableDictionary)abSourcesByIdentifier
{
  return self->_abSourcesByIdentifier;
}

- (void)setAbSourcesByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_abSourcesByIdentifier, a3);
}

- (NSMutableDictionary)abAccountsByIdentifier
{
  return self->_abAccountsByIdentifier;
}

- (void)setAbAccountsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_abAccountsByIdentifier, a3);
}

- (NSMutableArray)contactIdentifiersNeedingMetadataPurge
{
  return self->_contactIdentifiersNeedingMetadataPurge;
}

- (void)setContactIdentifiersNeedingMetadataPurge:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifiersNeedingMetadataPurge, a3);
}

- (CNSaveRequest)saveRequest
{
  return self->_saveRequest;
}

- (CNMutableSaveResponse)saveResponse
{
  return self->_saveResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveRequest, 0);
  objc_storeStrong((id *)&self->_contactIdentifiersNeedingMetadataPurge, 0);
  objc_storeStrong((id *)&self->_abAccountsByIdentifier, 0);
  objc_storeStrong((id *)&self->_abSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_abGroupsByIdentifier, 0);
  objc_storeStrong((id *)&self->_abPersonsByIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIndicesByInstance, 0);
  objc_storeStrong((id *)&self->_groupIndicesByInstance, 0);
  objc_storeStrong((id *)&self->_contactIndicesByInstance, 0);
  objc_storeStrong((id *)&self->_saveResponse, 0);
}

@end
