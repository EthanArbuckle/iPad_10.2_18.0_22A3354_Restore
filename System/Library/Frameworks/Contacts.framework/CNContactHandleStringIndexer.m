@implementation CNContactHandleStringIndexer

- (CNContactHandleStringIndexer)initWithTargetHandleStrings:(id)a3
{
  id v4;
  CNContactHandleStringIndexer *v5;
  CNCache *v6;
  CNCache *indexImpl;
  uint64_t v8;
  NSArray *targetHandleStrings;
  CNContactHandleStringIndexer *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactHandleStringIndexer;
  v5 = -[CNContactHandleStringIndexer init](&v12, sel_init);
  if (v5)
  {
    v6 = (CNCache *)objc_alloc_init(MEMORY[0x1E0D139B0]);
    indexImpl = v5->_indexImpl;
    v5->_indexImpl = v6;

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) == 0)
    {
      v8 = objc_msgSend(v4, "copy");
      targetHandleStrings = v5->_targetHandleStrings;
      v5->_targetHandleStrings = (NSArray *)v8;

    }
    v10 = v5;
  }

  return v5;
}

- (NSDictionary)index
{
  if (self->_targetHandleStrings)
    objc_msgSend((id)objc_opt_class(), "indexByMatchingIndexWithRawHandles:toTargetHandleStrings:", self->_indexImpl, self->_targetHandleStrings);
  else
    -[CNContactHandleStringIndexer indexWithRawHandles](self, "indexWithRawHandles");
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)indexContacts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CNContactHandleStringIndexer indexContact:](self, "indexContact:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)indexByMatchingIndexWithRawHandles:(id)a3 toTargetHandleStrings:(id)a4
{
  id v5;
  uint64_t v6;
  CNContactHandleIndexableString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v5 = a4;
  v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v26)
  {
    v24 = *(_QWORD *)v37;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v24)
          objc_enumerationMutation(obj);
        v29 = v6;
        v27 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v6);
        v7 = -[CNContactHandleIndexableString initWithString:]([CNContactHandleIndexableString alloc], "initWithString:", v27);
        -[CNContactHandleIndexableString indexKey](v7, "indexKey");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v10)
        {
          v11 = v10;
          v12 = 0;
          v13 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v33 != v13)
                objc_enumerationMutation(v9);
              v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              v31 = 1;
              objc_msgSend(v15, "first");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[CNContactHandleIndexableString isEquivalentToString:strict:](v7, "isEquivalentToString:strict:", v16, &v31);

              if (v17)
              {
                objc_msgSend(v15, "second");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                if (v31)
                {
                  v19 = v30;
                }
                else
                {
                  v19 = v12;
                  if (!v12)
                  {
                    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    v12 = v19;
                  }
                }
                objc_msgSend(v19, "addObject:", v18);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          }
          while (v11);
        }
        else
        {
          v12 = 0;
        }

        v20 = v30;
        if (objc_msgSend(v30, "count") || (v20 = v12, objc_msgSend(v12, "count")))
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v27);

        v6 = v29 + 1;
      }
      while (v29 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v26);
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetHandleStrings, 0);
  objc_storeStrong((id *)&self->_indexImpl, 0);
}

- (CNContactHandleStringIndexer)init
{
  return -[CNContactHandleStringIndexer initWithTargetHandleStrings:](self, "initWithTargetHandleStrings:", MEMORY[0x1E0C9AA60]);
}

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)indexWithRawHandles
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
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
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[CNCache allObjects](self->_indexImpl, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v29;
    v4 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v23 = v5;
        v6 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v5);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v25;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
              objc_msgSend(v12, "first");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKeyedSubscript:", v13);
              v14 = objc_claimAutoreleasedReturnValue();

              if (v14)
                v15 = (void *)v14;
              else
                v15 = v4;
              objc_msgSend(v12, "second");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "arrayByAddingObject:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v12, "first");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }

        v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v22);
  }

  return v3;
}

- (void)indexContact:(id)a3
{
  id v4;

  v4 = a3;
  -[CNContactHandleStringIndexer indexEmailAddressesOnContact:](self, "indexEmailAddressesOnContact:", v4);
  -[CNContactHandleStringIndexer indexPhoneNumbersOnContact:](self, "indexPhoneNumbersOnContact:", v4);

}

- (void)indexEmailAddressesOnContact:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", CFSTR("emailAddresses")))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "emailAddresses");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[CNContactHandleIndexableString emailIndexKey:](CNContactHandleIndexableString, "emailIndexKey:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNCache objectForKey:onCacheMiss:](self->_indexImpl, "objectForKey:onCacheMiss:", v10, *MEMORY[0x1E0D13708]);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v9, v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

- (void)indexPhoneNumbersOnContact:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isKeyAvailable:", CFSTR("phoneNumbers")))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v4, "phoneNumbers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "value");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          +[CNContactHandleIndexableString phoneNumberIndexKey:](CNContactHandleIndexableString, "phoneNumberIndexKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNCache objectForKey:onCacheMiss:](self->_indexImpl, "objectForKey:onCacheMiss:", v11, *MEMORY[0x1E0D13708]);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v10, v4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

  }
}

- (CNCache)indexImpl
{
  return self->_indexImpl;
}

- (NSArray)targetHandleStrings
{
  return self->_targetHandleStrings;
}

@end
