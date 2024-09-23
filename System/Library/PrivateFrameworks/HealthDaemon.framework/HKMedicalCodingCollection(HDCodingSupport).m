@implementation HKMedicalCodingCollection(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)objc_opt_self();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v6, "items", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(v5, "createWithCodable:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
            v13 = objc_claimAutoreleasedReturnValue();
            if (!v13)
            {

              v15 = 0;
              goto LABEL_15;
            }
            v14 = (void *)v13;
            objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            continue;
          break;
        }
      }

      v15 = (void *)objc_msgSend(v7, "copy");
LABEL_15:

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0CB6830], "collectionWithCodings:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {

      v15 = 0;
    }
    v16 = 0;
    goto LABEL_18;
  }
  v16 = 0;
LABEL_19:

  return v16;
}

- (HDCodableMedicalCodingList)codableRepresentationForSync
{
  id v1;
  HDCodableMedicalCodingList *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "codings");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v2 = objc_alloc_init(HDCodableMedicalCodingList);
  objc_msgSend(v1, "hk_map:", &__block_literal_global_71);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  -[HDCodableMedicalCodingList setItems:](v2, "setItems:", v4);

  return v2;
}

@end
