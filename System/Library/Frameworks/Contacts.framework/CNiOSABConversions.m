@implementation CNiOSABConversions

+ (id)contactPropertiesByABPropertyID
{
  objc_opt_self();
  if (contactPropertiesByABPropertyID_onceToken != -1)
    dispatch_once(&contactPropertiesByABPropertyID_onceToken, &__block_literal_global_5_3);
  return (id)contactPropertiesByABPropertyID_propertiesByABPropertyID;
}

+ (id)stringFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a3, a4, 4);
}

+ (id)numberFromIntegerABBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;

  if (a4 == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Integer parameter was unexpectedly large during contact buffer decode."));
    v4 = 0;
  }
  return v4;
}

+ (CFTypeRef)requiredABPropertyIDSetForKeysToFetch:(uint64_t)a1
{
  id v2;
  CFMutableSetRef Mutable;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CFTypeRef v15;
  id obj;
  _QWORD v18[4];
  id v19;
  CFMutableSetRef v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  Mutable = CFSetCreateMutable(0, objc_msgSend(v2, "count"), 0);
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "_cn_requiredKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v9, "_cn_optionalKeys");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "unionKeyVector:", v12);

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "_cn_unauthorizedKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v9, "_cn_unauthorizedKeys");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "minusKeyVector:", v14);

          }
        }
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __60__CNiOSABConversions_requiredABPropertyIDSetForKeysToFetch___block_invoke;
        v18[3] = &unk_1E29FBFB8;
        v19 = v4;
        v20 = Mutable;
        objc_msgSend(v11, "enumeratePropertiesUsingBlock:", v18);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  v15 = CFAutorelease(Mutable);
  return v15;
}

void __60__CNiOSABConversions_requiredABPropertyIDSetForKeysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *value;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    LODWORD(value) = 0;
    if (objc_msgSend(v6, "abPropertyID:", &value))
      CFSetAddValue(*(CFMutableSetRef *)(a1 + 40), (const void *)(int)value);
  }

}

+ (id)dataFromABBytes:(char *)a3 length:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a3, a4);
}

CNMutableContact *__70__CNiOSABConversions_contactFromABPerson_uniqueKeysToConvert_mutable___block_invoke(uint64_t a1)
{
  void *v2;
  CNMutableContact *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int v8;
  ABRecordID RecordID;
  CNMutableContact *v10;
  CNMutableContact *v11;
  id v13;

  +[CNiOSABConversions contactIdentifierFromABPerson:](*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[CNContact initWithIdentifier:]([CNMutableContact alloc], "initWithIdentifier:", v2);
  v4 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(v4, "updateContact:fromABPerson:keysToConvert:availableKeyDescriptor:", v3, v5, v6, &v13);
  v7 = v13;
  -[CNMutableContact setAvailableKeyDescriptor:](v3, "setAvailableKeyDescriptor:", v7);
  v8 = *(unsigned __int8 *)(a1 + 56);
  RecordID = ABRecordGetRecordID(*(ABRecordRef *)(a1 + 48));

  if (v8)
  {
    if (RecordID != -1)
      -[CNMutableContact setSnapshot:](v3, "setSnapshot:", v3);
    v10 = v3;
  }
  else
  {
    if (RecordID == -1)
      -[CNMutableContact freeze](v3, "freeze");
    else
      -[CNMutableContact freezeWithSelfAsSnapshot](v3, "freezeWithSelfAsSnapshot");
    v10 = (CNMutableContact *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

+ (void)updateContact:(id)a3 fromABPerson:(void *)a4 keysToConvert:(id)a5 availableKeyDescriptor:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int v24;
  NSObject *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[5];
  NSObject *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  NSObject *v40;
  id v41;
  _QWORD aBlock[4];
  id v43;
  void *v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (a4)
  {
    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke;
    aBlock[3] = &unk_1E29FBED8;
    v43 = v10;
    v44 = a4;
    v13 = _Block_copy(aBlock);
    if (v11)
    {
      v27 = a6;
      v30 = v10;
      v14 = (void *)objc_opt_new();
      +[CN writableAlwaysFetchedProperties](CN, "writableAlwaysFetchedProperties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v12;
      v39[1] = 3221225472;
      v39[2] = __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_2;
      v39[3] = &unk_1E29FBF00;
      v28 = v13;
      v16 = v13;
      v41 = v16;
      v17 = v14;
      v40 = v17;
      objc_msgSend(v15, "enumerateObjectsUsingBlock:", v39);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v29 = v11;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (!v19)
        goto LABEL_21;
      v20 = v19;
      v21 = *(_QWORD *)v36;
      while (1)
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v18);
          v23 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * v22);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {

LABEL_13:
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_3;
            v31[3] = &unk_1E29FBF28;
            v31[4] = v23;
            v34 = a1;
            v33 = v16;
            v32 = v17;
            objc_msgSend(v23, "_cn_executeGetterForRepresentedKeys:", v31);

            goto LABEL_14;
          }
          v24 = objc_msgSend(v23, "conformsToProtocol:", &unk_1EE191798);

          if (v24)
            goto LABEL_13;
          objc_msgSend((id)objc_opt_class(), "os_log");
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v46 = v23;
            _os_log_impl(&dword_18F8BD000, v25, OS_LOG_TYPE_INFO, "Found a key descriptor non conforming to the expected protocol, ignoring: %{public}@", buf, 0xCu);
          }

LABEL_14:
          ++v22;
        }
        while (v20 != v22);
        v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        v20 = v26;
        if (!v26)
        {
LABEL_21:

          if (v27)
            *v27 = -[NSObject copy](v17, "copy");

          v11 = v29;
          v10 = v30;
          v13 = v28;
          goto LABEL_26;
        }
      }
    }
    objc_msgSend((id)objc_opt_class(), "os_log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_INFO, "Keys to convert should have been non null, not fetching anything", buf, 2u);
    }
LABEL_26:

  }
}

id __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(*(id *)(a1 + 32), "_cn_unauthorizedKeys"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsKey:", v3),
        v4,
        v5))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138543362;
      v12 = v3;
      _os_log_impl(&dword_18F8BD000, v6, OS_LOG_TYPE_INFO, "Found an unauthorized key, ignoring: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }
  else
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)contactIdentifierFromABPerson:(uint64_t)a1
{
  void *v3;
  id v4;

  objc_opt_self();
  if (a2)
  {
    v3 = (void *)ABRecordCopyValue(a2, *MEMORY[0x1E0CF6090]);
    if (v3)
      v3 = (void *)CFAutorelease(v3);
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

id __86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (id)(*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

__CFString *__86__CNiOSABConversions_updateContact_fromABPerson_keysToConvert_availableKeyDescriptor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  if (v6
    && (objc_msgSend(v5, "key"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "containsKey:", v7),
        v7,
        v8))
  {
    objc_msgSend(v5, "CNValueForContact:", *(_QWORD *)(a1 + 32));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v5)
  {
    objc_msgSend(v5, "CNValueFromABValue:", objc_msgSend(v5, "ABValueForABPerson:", *(_QWORD *)(a1 + 40)));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      if (objc_msgSend(v5, "isNonnull"))
      {
        v10 = objc_msgSend(v5, "valueClass");
        if (v10 == objc_opt_class())
        {
          v9 = &stru_1E29FF900;
        }
        else
        {
          v11 = objc_msgSend(v5, "valueClass");
          if (v11 == objc_opt_class())
          {
            v9 = (__CFString *)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v12 = objc_msgSend(v5, "valueClass");
            if (v12 == objc_opt_class())
              v9 = (__CFString *)MEMORY[0x1E0C9AA70];
            else
              v9 = 0;
          }
        }
      }
      else
      {
        v9 = 0;
      }
    }
    objc_msgSend(v5, "setCNValue:onContact:", v9, *(_QWORD *)(a1 + 32));
    if (v6)
    {
      objc_msgSend(v5, "key");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addKey:", v13);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __53__CNiOSABConversions_contactPropertiesByABPropertyID__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN allContactProperties](CN, "allContactProperties");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v5);
        v13 = 0;
        if (objc_msgSend(v6, "abPropertyID:", &v13))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            objc_msgSend(v8, "arrayByAddingObject:", v6);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v18 = v6;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "setObject:forKey:", v9, v10);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v3);
  }
  v11 = objc_msgSend(v0, "copy");
  v12 = (void *)contactPropertiesByABPropertyID_propertiesByABPropertyID;
  contactPropertiesByABPropertyID_propertiesByABPropertyID = v11;

}

+ (id)containersFromABSources:(char)a3 remote:(char)a4 includeDisabledSources:
{
  void *v7;
  _QWORD v9[5];
  char v10;
  char v11;

  v7 = (void *)objc_opt_self();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__CNiOSABConversions_containersFromABSources_remote_includeDisabledSources___block_invoke;
  v9[3] = &__block_descriptor_42_e9__16__0_v8l;
  v9[4] = v7;
  v10 = a3;
  v11 = a4;
  objc_msgSend(v7, "arrayByMappingTransform:onCFArray:", v9, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)arrayByMappingTransform:(id)a3 onCFArray:(__CFArray *)a4
{
  void (**v5)(id, const void *);
  CFIndex Count;
  void *v7;
  CFIndex i;
  const void *ValueAtIndex;
  void *v10;

  v5 = (void (**)(id, const void *))a3;
  if (a4)
  {
    Count = CFArrayGetCount(a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a4, i);
        v5[2](v5, ValueAtIndex);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v7, "addObject:", v10);

      }
    }
    a4 = (__CFArray *)objc_msgSend(v7, "copy");

  }
  return a4;
}

id __76__CNiOSABConversions_containersFromABSources_remote_includeDisabledSources___block_invoke(uint64_t a1, void *a2)
{
  return +[CNiOSABConversions containerFromABSource:remote:includeDisabledSources:](*(_QWORD *)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

+ (id)containerFromABSource:(int)a3 remote:(int)a4 includeDisabledSources:
{
  CNMutableContainer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2)
  {
    if (ABSourceIsRemote() != a3)
      return 0;
    if (!ABRecordGetIntValue() && a4 == 0)
      return 0;
    v8 = objc_alloc_init(CNMutableContainer);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    +[CN allContainerProperties](CN, "allContainerProperties", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "ABValueForABSource:", a2);
          if (!objc_msgSend(v14, "isConvertibleABValue:", v15))
          {

            a2 = 0;
            goto LABEL_18;
          }
          objc_msgSend(v14, "CNValueFromABValue:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setCNValue:onContainer:", v16, v8);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    -[CNMutableContainer freezeWithSelfAsSnapshot](v8, "freezeWithSelfAsSnapshot");
    a2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

  }
  return a2;
}

+ (id)contactFromABPerson:(void *)a3 keysToConvert:(uint64_t)a4 mutable:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contactFromABPerson:uniqueKeysToConvert:mutable:", a2, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)contactFromABPerson:(void *)a3 uniqueKeysToConvert:(id)a4 mutable:(BOOL)a5
{
  id v6;
  void *v7;
  void *v8;
  id v10;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    v10 = v6;
    CNResultWithAutoreleasePool();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)dateFromABBytes:(char *)a3 length:(unint64_t)a4
{
  void *v4;

  if (a4 == 8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Date parameter was unexpectedly large during contact buffer decode."));
    v4 = 0;
  }
  return v4;
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_13 != -1)
    dispatch_once(&os_log_cn_once_token_0_13, &__block_literal_global_91);
  return (id)os_log_cn_once_object_0_13;
}

void __28__CNiOSABConversions_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "contacts-iOSAB-conversions");
  v1 = (void *)os_log_cn_once_object_0_13;
  os_log_cn_once_object_0_13 = (uint64_t)v0;

}

+ (id)personToContactTransformWithKeysToFetch:(char)a3 mutable:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t);
  void *v12;
  id v13;
  char v14;

  v4 = a2;
  objc_opt_self();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __70__CNiOSABConversions_personToContactTransformWithKeysToFetch_mutable___block_invoke;
  v12 = &unk_1E29FBEB0;
  v13 = v4;
  v14 = a3;
  v5 = v4;
  v6 = _Block_copy(&v9);
  v7 = (void *)objc_msgSend(v6, "copy", v9, v10, v11, v12);

  return v7;
}

id __70__CNiOSABConversions_personToContactTransformWithKeysToFetch_mutable___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CNiOSABConversions contactFromABPerson:uniqueKeysToConvert:mutable:](CNiOSABConversions, "contactFromABPerson:uniqueKeysToConvert:mutable:", a2, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

+ (id)groupFromABGroup:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  ABPropertyID v5;
  id v6;
  CFTypeRef v7;
  CFTypeRef v8;
  void *v9;
  void *v10;
  uint64_t RecordID;
  void *v12;
  ABPropertyID v13;
  id v14;
  void *v15;
  ABPropertyID v16;
  id v17;
  void *v18;
  ABPropertyID v19;
  id v20;
  void *v21;
  id v22;
  CNMutableGroup *v23;

  objc_opt_self();
  if (a2)
  {
    v3 = (void *)ABRecordCopyValue(a2, *MEMORY[0x1E0CF5E80]);
    if (v3)
      v3 = (void *)CFAutorelease(v3);
    v4 = *MEMORY[0x1E0D13780];
    v5 = *MEMORY[0x1E0CF5E88];
    v6 = v3;
    v7 = ABRecordCopyValue(a2, v5);
    if (v7)
      v8 = CFAutorelease(v7);
    else
      v8 = 0;
    (*(void (**)(uint64_t, CFTypeRef))(v4 + 16))(v4, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    RecordID = ABRecordGetRecordID(a2);
    v12 = (void *)ABRecordCopyValue(a2, *MEMORY[0x1E0CF5E60]);
    if (v12)
      v12 = (void *)CFAutorelease(v12);
    v13 = *MEMORY[0x1E0CF5E70];
    v14 = v12;
    v15 = (void *)ABRecordCopyValue(a2, v13);
    if (v15)
      v15 = (void *)CFAutorelease(v15);
    v16 = *MEMORY[0x1E0CF5E68];
    v17 = v15;
    v18 = (void *)ABRecordCopyValue(a2, v16);
    if (v18)
      v18 = (void *)CFAutorelease(v18);
    v19 = *MEMORY[0x1E0CF5E78];
    v20 = v18;
    v21 = (void *)ABRecordCopyValue(a2, v19);
    if (v21)
      v21 = (void *)CFAutorelease(v21);
    v22 = v21;
    v23 = -[CNGroup initWithIdentifier:name:]([CNMutableGroup alloc], "initWithIdentifier:name:", v6, v10);

    -[CNMutableGroup setIOSLegacyIdentifier:](v23, "setIOSLegacyIdentifier:", RecordID);
    -[CNMutableGroup setExternalIdentifier:](v23, "setExternalIdentifier:", v14);

    -[CNMutableGroup setExternalRepresentation:](v23, "setExternalRepresentation:", v17);
    -[CNMutableGroup setExternalModificationTag:](v23, "setExternalModificationTag:", v20);

    -[CNMutableGroup setExternalUUID:](v23, "setExternalUUID:", v22);
    -[CNMutableGroup freezeWithSelfAsSnapshot](v23, "freezeWithSelfAsSnapshot");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)groupsFromABGroups:(uint64_t)a1
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_opt_self();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__CNiOSABConversions_groupsFromABGroups___block_invoke;
  v5[3] = &__block_descriptor_40_e9__16__0_v8l;
  v5[4] = v3;
  objc_msgSend(v3, "arrayByMappingTransform:onCFArray:", v5, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __41__CNiOSABConversions_groupsFromABGroups___block_invoke(uint64_t a1, const void *a2)
{
  return +[CNiOSABConversions groupFromABGroup:](*(_QWORD *)(a1 + 32), a2);
}

+ (CNAccount)accountFromABAccount:(uint64_t)a1
{
  uint64_t v3;
  const void *v4;
  const void *v5;

  objc_opt_self();
  if (a2)
  {
    v3 = ABAccountCopyIdentifier();
    if (v3)
    {
      v4 = (const void *)v3;
      v5 = (const void *)ABAccountCopyInternalUUID();
      a2 = -[CNAccount initWithIdentifier:externalIdentifier:iOSLegacyIdentifier:]([CNAccount alloc], "initWithIdentifier:externalIdentifier:iOSLegacyIdentifier:", v5, v4, ABRecordGetRecordID(a2));
      if (v5)
        CFRelease(v5);
      CFRelease(v4);
    }
    else
    {
      +[CNAccount localAccount](CNAccount, "localAccount");
      a2 = (CNAccount *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a2;
}

+ (id)accountsFromABAccounts:(uint64_t)a1
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_opt_self();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CNiOSABConversions_accountsFromABAccounts___block_invoke;
  v5[3] = &__block_descriptor_40_e9__16__0_v8l;
  v5[4] = v3;
  objc_msgSend(v3, "arrayByMappingTransform:onCFArray:", v5, a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

CNAccount *__45__CNiOSABConversions_accountsFromABAccounts___block_invoke(uint64_t a1, CNAccount *a2)
{
  return +[CNiOSABConversions accountFromABAccount:](*(_QWORD *)(a1 + 32), a2);
}

+ (CNContactMatchInfo)contactMatchInfoFromABMatchMetadataDictionary:(uint64_t)a1
{
  id v2;
  CNContactMatchInfo *v3;
  void *v4;
  NSMapTable *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, uint64_t, uint64_t);
  void *v23;
  id v24;
  void *key;
  void *value;
  NSMapEnumerator enumerator;

  v2 = a2;
  objc_opt_self();
  v3 = objc_alloc_init(CNContactMatchInfo);
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CF5C68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNContactMatchInfo setRelevanceScore:](v3, "setRelevanceScore:", v4);
    -[CNContactMatchInfo setMatchedNameProperty:](v3, "setMatchedNameProperty:", objc_msgSend(v4, "integerValue") > 0);
  }
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CF5C58]);
  v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  if (-[NSMapTable count](v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNiOSABConversions contactPropertiesByABPropertyID]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, v5);
    key = 0;
    value = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ((_DWORD)key - 1));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v6, "setValue:forKey:", value, v11);

      }
    }
    NSEndMapTableEnumeration(&enumerator);
    -[CNContactMatchInfo setMatchedProperties:](v3, "setMatchedProperties:", v6);

  }
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CF5C50]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v12);
    v14 = *MEMORY[0x1E0CF5C48];
    v15 = objc_msgSend(v13, "length");
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __68__CNiOSABConversions_contactMatchInfoFromABMatchMetadataDictionary___block_invoke;
    v23 = &unk_1E29FBF90;
    v24 = v13;
    v16 = v13;
    objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v14, 0, v15, 0, &v20);
    v17 = objc_alloc_init(MEMORY[0x1E0D13B20]);
    objc_msgSend(v17, "finishWithResult:", v16, v20, v21, v22, v23);
    -[CNContactMatchInfo setExcerpt:](v3, "setExcerpt:", v17);

  }
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0CF5C60]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactMatchInfo setMatchedTerms:](v3, "setMatchedTerms:", v18);

  return v3;
}

void __68__CNiOSABConversions_contactMatchInfoFromABMatchMetadataDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a2, "BOOLValue"))
  {
    v7 = *(void **)(a1 + 32);
    v10 = CFSTR("contactExcerptEmphasized");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributes:range:", v9, a3, a4);

  }
}

@end
