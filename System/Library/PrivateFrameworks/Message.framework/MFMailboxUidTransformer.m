@implementation MFMailboxUidTransformer

void __88__MFMailboxUidTransformer__transformMailboxUid_parent_uidToMailboxMap_objectIDToUidMap___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setCanContainMessages:", objc_msgSend(*(id *)(a1 + 32), "isStore"));
  objc_msgSend(v3, "setParent:", *(_QWORD *)(a1 + 40));

}

- (id)transformMailboxUid:(id)a3 uidToMailboxMap:(id)a4 objectIDToUidMap:(id)a5
{
  -[MFMailboxUidTransformer _transformMailboxUid:parent:uidToMailboxMap:objectIDToUidMap:]((uint64_t)self, a3, 0, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_transformMailboxUid:(void *)a3 parent:(void *)a4 uidToMailboxMap:(void *)a5 objectIDToUidMap:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v31 = a3;
  v36 = a4;
  v10 = a5;
  v35 = v9;
  if (a1)
  {
    objc_msgSend(v9, "displayNameUsingSpecialNames");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithCapacity:", objc_msgSend(v12, "count") + 1);

    v14 = objc_alloc(MEMORY[0x1E0D1E2A8]);
    objc_msgSend(v9, "representedAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v14, "initWithRepresentedObjectID:", v16);

    objc_msgSend(v9, "objectID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v17 = objc_alloc(MEMORY[0x1E0D1E1D0]);
      v18 = objc_msgSend(v9, "type");
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __88__MFMailboxUidTransformer__transformMailboxUid_parent_uidToMailboxMap_objectIDToUidMap___block_invoke;
      v41[3] = &unk_1E4E8CD68;
      v19 = v9;
      v42 = v19;
      v43 = v31;
      v20 = (void *)objc_msgSend(v17, "initWithObjectID:repository:name:accountIdentifier:type:builder:", v34, 0, v32, v33, v18, v41);
      if (v36)
        objc_msgSend(v36, "setObject:forKey:", v20, v19);
      if (v10)
      {
        objc_msgSend(v20, "objectID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v19, v21);

      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v19, "children", v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v22);
            v26 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
            v27 = (void *)MEMORY[0x1A85B0E24]();
            -[MFMailboxUidTransformer _transformMailboxUid:parent:uidToMailboxMap:objectIDToUidMap:](a1, v26, v20, v36, v10);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObjectsFromArray:", v28);

            objc_autoreleasePoolPop(v27);
          }
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
        }
        while (v23);
      }

      objc_msgSend(v13, "addObject:", v20);
      v29 = (void *)objc_msgSend(v13, "copy");

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (MFMailboxUidTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailboxUidTransformer;
  return -[MFMailboxUidTransformer init](&v3, sel_init);
}

+ (BOOL)isMailbox:(id)a3 equalTo:(id)a4 uidToMailboxMap:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayNameUsingSpecialNames");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqual:", v14))
  {
    v16 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v10, "objectID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 || (objc_msgSend(v11, "URL"), (v24 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v10, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
    {

      v16 = 0;
      goto LABEL_14;
    }
    v25 = 1;
  }
  else
  {
    v24 = 0;
    v25 = 0;
  }
  v17 = objc_msgSend(v10, "type");
  if (v17 == objc_msgSend(v11, "type")
    && (v18 = objc_msgSend(v10, "canContainMessages"), v18 == objc_msgSend(v11, "isStore")))
  {
    if (v12)
    {
      objc_msgSend(v10, "parent");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "parent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)v20;
      v16 = v20 == (_QWORD)v21;

      if (!v25)
        goto LABEL_14;
      goto LABEL_13;
    }
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  if ((v25 & 1) != 0)
  {
LABEL_13:

  }
LABEL_14:
  if (!v15)

LABEL_17:
  return v16;
}

@end
