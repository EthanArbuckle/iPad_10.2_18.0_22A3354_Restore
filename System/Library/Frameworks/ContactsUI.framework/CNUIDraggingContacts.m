@implementation CNUIDraggingContacts

- (CNUIDraggingContacts)initWithDraggingContacts:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  CNUIDraggingContacts *v9;
  CNUIDraggingContacts *v10;
  CNUIDraggingContacts *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUIDraggingContacts;
  v9 = -[CNUIDraggingContacts init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_draggingContacts, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D137F8];
  -[CNUIDraggingContacts draggingContacts](self, "draggingContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  if ((_DWORD)v8)
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    -[CNUIDraggingContacts draggingContacts](self, "draggingContacts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dataRepresentationForType:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = v12;
    else
      v13 = 0;
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v13, 0);

  }
  return 0;
}

- (NSArray)draggingContacts
{
  return self->_draggingContacts;
}

- (void)setDraggingContacts:(id)a3
{
  objc_storeStrong((id *)&self->_draggingContacts, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_draggingContacts, 0);
}

+ (id)dragItemForContact:(id)a3 withContactStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "itemProviderForContact:withContactStore:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v8);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__CNUIDraggingContacts_dragItemForContact_withContactStore___block_invoke;
  v12[3] = &__block_descriptor_40_e20___UIDragPreview_8__0l;
  v12[4] = a1;
  objc_msgSend(v9, "setPreviewProvider:", v12);
  +[CNUIVCardUtilities fileNameForContact:](CNUIVCardUtilities, "fileNameForContact:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSuggestedName:", v10);
  return v9;
}

+ (id)itemProviderForContact:(id)a3 withContactStore:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CNUIDraggingContacts *v9;
  void *v10;
  CNUIDraggingContacts *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C972E8]), "initWithContact:contactStore:", v6, v7);
    v9 = [CNUIDraggingContacts alloc];
    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CNUIDraggingContacts initWithDraggingContacts:contactStore:](v9, "initWithDraggingContacts:contactStore:", v10, v7);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v11);
    v13 = *MEMORY[0x1E0C96748];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__CNUIDraggingContacts_itemProviderForContact_withContactStore___block_invoke;
    v19[3] = &unk_1E204B5C0;
    v22 = a1;
    v14 = v6;
    v20 = v14;
    v15 = v7;
    v21 = v15;
    objc_msgSend(v12, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v13, 0, v19);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13DA0]), "initWithContactStore:", v15);
    objc_msgSend(v16, "makeActivityAdvertisingViewingOfContact:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "updateUserActivityState:withContentsOfContact:", v17, v14);
    objc_msgSend(v12, "registerObject:visibility:", v17, 0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)imageForDragging
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("vCardDragging"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)canAcceptDropForDropSession:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0CA5CB0];
  v12[0] = *MEMORY[0x1E0CA5B48];
  v12[1] = v4;
  v12[2] = *MEMORY[0x1E0C96750];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasItemsConformingToTypeIdentifiers:", v5))
  {
    objc_msgSend(v3, "localDragSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      v8 = *MEMORY[0x1E0C96748];
      v11[0] = *MEMORY[0x1E0C966F0];
      v11[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v3, "hasItemsConformingToTypeIdentifiers:", v9) ^ 1;

    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

+ (void)provideContactsForDropSession:(id)a3 withKeys:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  int v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];
  _QWORD v27[4];
  void (**v28)(id, _QWORD);
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  v12 = objc_msgSend(v9, "canLoadObjectsOfClass:", objc_opt_class());
  v13 = *MEMORY[0x1E0C96750];
  v29[0] = *MEMORY[0x1E0C96748];
  v29[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v9, "hasItemsConformingToTypeIdentifiers:", v14);

  if ((v12 & 1) == 0 && (v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNUIDraggingContacts.m"), 112, CFSTR("dropSession does not support creating items of class CNUIDraggingContacts or CNContact"));

  }
  v16 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v9, "items");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v17);

  if ((v16 & 1) == 0)
    v11[2](v11, 0);
  if (v15)
  {
    v18 = objc_opt_class();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke;
    v27[3] = &unk_1E204B5E8;
    v19 = (id *)&v28;
    v28 = v11;
    v20 = (id)objc_msgSend(v9, "loadObjectsOfClass:completion:", v18, v27);
LABEL_10:

    goto LABEL_11;
  }
  if (v12)
  {
    v21 = objc_opt_class();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke_2;
    v24[3] = &unk_1E204B610;
    v19 = (id *)v26;
    v26[0] = v11;
    v26[1] = a1;
    v25 = v10;
    v22 = (id)objc_msgSend(v9, "loadObjectsOfClass:completion:", v21, v24);

    goto LABEL_10;
  }
LABEL_11:

}

+ (id)contactsFromDraggingContacts:(id)a3 withKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v23 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v11, "draggingContacts");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
              objc_msgSend(v17, "fetchContactWithKeys:", v6);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                objc_msgSend(v17, "fetchContactWithKeys:", v6);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v19);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  objc_msgSend(v7, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (void)provideVCardURLForDropSession:(id)a3 completionBlock:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD);
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = (id)*MEMORY[0x1E0CA5B48];
  v31[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "hasItemsConformingToTypeIdentifiers:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CNUIDraggingContacts.m"), 145, CFSTR("dropSession does not contain items of type file URL"));

  }
  v12 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v7, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v13);

  if ((v12 & 1) == 0)
    v8[2](v8, 0);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v7, "items", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    v18 = MEMORY[0x1E0C809B0];
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v19), "itemProvider");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v18;
        v24[1] = 3221225472;
        v24[2] = __70__CNUIDraggingContacts_provideVCardURLForDropSession_completionBlock___block_invoke;
        v24[3] = &unk_1E204D408;
        v25 = v8;
        v21 = (id)objc_msgSend(v20, "loadDataRepresentationForTypeIdentifier:completionHandler:", v9, v24);

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA5CB0];
  v4[0] = *MEMORY[0x1E0C966F0];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)contactsWithIdentifiers:(id)a3 store:(id)a4 keysToFetch:(id)a5 unifyResults:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;

  v8 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C97210];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v11 alloc], "initWithKeysToFetch:", v12);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setPredicate:", v16);
  objc_msgSend(v15, "setUnifyResults:", v8);
  objc_msgSend(v15, "setOnlyMainStore:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__CNUIDraggingContacts_contactsWithIdentifiers_store_keysToFetch_unifyResults_error___block_invoke;
  v22[3] = &unk_1E204B638;
  v23 = v17;
  v18 = v17;
  LODWORD(a7) = objc_msgSend(v13, "enumerateContactsWithFetchRequest:error:usingBlock:", v15, a7, v22);

  if ((_DWORD)a7)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

+ (id)draggingContactsWithItemProviderData:(id)a3 typeIdentifier:(id)a4 contactStore:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend((id)objc_opt_class(), "readableTypeIdentifiersForItemProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v11);

  if (v14)
  {
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C966F0]))
    {
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v10, 0, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
      {
        v20[0] = *MEMORY[0x1E0C966E8];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "contactsWithIdentifiers:store:keysToFetch:unifyResults:error:", v15, v12, v17, 0, a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CA5CB0]))
    {
      objc_msgSend(MEMORY[0x1E0C972A8], "contactsWithData:error:", v10, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(a1, "draggingContactsForContacts:contactStore:", v16, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)draggingContactsForContacts:(id)a3 contactStore:(id)a4
{
  id v5;
  id v6;
  CNUIDraggingContacts *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = objc_alloc(MEMORY[0x1E0C972E8]);
          v16 = (void *)objc_msgSend(v15, "initWithContact:contactStore:", v14, v6, (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    v7 = -[CNUIDraggingContacts initWithDraggingContacts:contactStore:]([CNUIDraggingContacts alloc], "initWithDraggingContacts:contactStore:", v8, v6);
  }

  return v7;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0C97298];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend((id)objc_opt_class(), "draggingContactsWithItemProviderData:typeIdentifier:contactStore:error:", v9, v8, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C972E8], "availableDataRepresentationTypes");
}

uint64_t __85__CNUIDraggingContacts_contactsWithIdentifiers_store_keysToFetch_unifyResults_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __70__CNUIDraggingContacts_provideVCardURLForDropSession_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithData:encoding:", v4, 4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__CNUIDraggingContacts_provideContactsForDropSession_withKeys_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend((id)objc_opt_class(), "contactsFromDraggingContacts:withKeys:", v4, *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
}

id __64__CNUIDraggingContacts_itemProviderForContact_withContactStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C972A8], "descriptorForRequiredKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v4, "contactsWithIdentifiers:store:keysToFetch:unifyResults:error:", v6, v7, v9, 1, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", *MEMORY[0x1E0C96748], v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, 0, 0);
    v13 = 0;
  }

  return v13;
}

id __60__CNUIDraggingContacts_dragItemForContact_withContactStore___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend((id)objc_opt_class(), "imageForDragging");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithImage:", v1);

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:", v2);
  return v3;
}

@end
