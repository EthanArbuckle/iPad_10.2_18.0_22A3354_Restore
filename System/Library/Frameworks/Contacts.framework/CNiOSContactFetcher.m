@implementation CNiOSContactFetcher

+ (id)contactsForFetchRequest:(id)a3 matchInfos:(id *)a4 inAddressBook:(void *)a5 environment:(id)a6 managedConfiguration:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  CNiOSContactFetcher *v17;
  CNiOSContactFetcher *v18;
  id *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v26;
  id v27;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x19400675C]();
  v17 = -[CNiOSContactFetcher initWithFetchRequest:addressBook:environment:managedConfiguration:]([CNiOSContactFetcher alloc], "initWithFetchRequest:addressBook:environment:managedConfiguration:", v13, a5, v14, v15);
  v18 = v17;
  if (a4)
    v19 = &v27;
  else
    v19 = 0;
  if (a4)
    v27 = 0;
  v26 = 0;
  -[CNiOSContactFetcher fetchContactsReturningMatchInfos:error:](v17, "fetchContactsReturningMatchInfos:error:", v19, &v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
    v21 = v27;
  else
    v21 = 0;
  v22 = v26;

  objc_autoreleasePoolPop(v16);
  if (a4)
    *a4 = objc_retainAutorelease(v21);
  v23 = v20;
  v24 = v23;
  if (a8 && !v23)
    *a8 = objc_retainAutorelease(v22);

  return v24;
}

- (CNiOSContactFetcher)initWithFetchRequest:(id)a3 addressBook:(void *)a4 environment:(id)a5 managedConfiguration:(id)a6
{
  id v11;
  id v12;
  id v13;
  CNiOSContactFetcher *v14;
  CNiOSContactFetcher *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id personToContact;
  void *v20;
  CNiOSContactFetcher *v21;
  objc_super v23;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNiOSContactFetcher;
  v14 = -[CNiOSContactFetcher init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fetchRequest, a3);
    -[CNContactFetchRequest effectiveKeysToFetch](v15->_fetchRequest, "effectiveKeysToFetch");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNiOSABConversions personToContactTransformWithKeysToFetch:mutable:]((uint64_t)CNiOSABConversions, v16, objc_msgSend(v11, "mutableObjects"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    personToContact = v15->_personToContact;
    v15->_personToContact = (id)v18;

    if (a4)
      v20 = (void *)CFRetain(a4);
    else
      v20 = 0;
    v15->_addressBook = v20;
    objc_storeStrong((id *)&v15->_environment, a5);
    objc_storeStrong((id *)&v15->_managedConfiguration, a6);
    v21 = v15;
  }

  return v15;
}

- (void)dealloc
{
  void *addressBook;
  objc_super v4;

  addressBook = self->_addressBook;
  if (addressBook)
    CFRelease(addressBook);
  v4.receiver = self;
  v4.super_class = (Class)CNiOSContactFetcher;
  -[CNiOSContactFetcher dealloc](&v4, sel_dealloc);
}

- (id)_abMatchMetadataToCNContactMatchInfoArray:(uint64_t)a1
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  if (!a1)
    return 0;
  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__CNiOSContactFetcher__abMatchMetadataToCNContactMatchInfoArray___block_invoke;
  v7[3] = &unk_1E29F92D8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __65__CNiOSContactFetcher__abMatchMetadataToCNContactMatchInfoArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (void)_batchLoadPropertiesForPeople:(void *)a3 keysToFetch:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, _QWORD *);
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD aBlock[4];
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke;
    aBlock[3] = &unk_1E29F9328;
    v14 = v6;
    v9 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_4;
    v10[3] = &unk_1E29F9350;
    v11 = v5;
    v12 = a1;
    v9[2](v9, v10);

  }
}

void __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_2;
  v6[3] = &unk_1E29F9300;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isMultiValue"))
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    v6 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "conformsToProtocol:", &unk_1EE191798);

      if (!v8)
        goto LABEL_11;
    }
    objc_msgSend(v6, "_cn_requiredKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_3;
    v9[3] = &unk_1E29F8808;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "enumeratePropertiesUsingBlock:", v9);

  }
LABEL_11:

}

void __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isMultiValue"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __65__CNiOSContactFetcher__batchLoadPropertiesForPeople_keysToFetch___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;
  int v3;

  v3 = 0;
  result = objc_msgSend(a2, "abPropertyID:", &v3);
  if ((_DWORD)result)
    return ABMultiValueBatchLoad();
  return result;
}

- (id)_contactsFromPeople:(void *)a3 abMatchInfo:(void *)a4 keysToFetch:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  CNiOSABUtilities *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v10 = *(void **)(a1 + 40);
    if (v10 && objc_msgSend(v10, "deviceHasManagementRestrictions"))
    {
      v11 = -[CNiOSABUtilities initWithAddressBook:]([CNiOSABUtilities alloc], "initWithAddressBook:", *(_QWORD *)(a1 + 8));
      -[CNiOSABUtilities allAccountIdentifiers](v11, "allAccountIdentifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "readableAccountIdentifiersFromIdentifiers:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "count");
      if (v14 == objc_msgSend(v13, "count"))
      {
        v15 = v7;
      }
      else
      {
        -[CNiOSABUtilities filterPeople:matchingAccountIdentifiers:](v11, "filterPeople:matchingAccountIdentifiers:", v7, v13);
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;

    }
    else
    {
      v16 = v7;
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 16), "predicate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "cn_supportsNativeBatchFetch") & 1) == 0)
      -[CNiOSContactFetcher _batchLoadPropertiesForPeople:keysToFetch:](a1, v16, v9);
    if (objc_msgSend(*(id *)(a1 + 16), "unifyResults"))
    {
      v23 = 0;
      -[CNiOSContactFetcher unifyPeople:keysToFetch:abMatchInfos:filteredForAccountIdentifiers:outCNMatchInfos:](a1, v16, v9, v8, v13, &v23);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v23;
      objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v18, v19);
      a1 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[CNiOSContactFetcher _abMatchMetadataToCNContactMatchInfoArray:](a1, v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_cn_map:", *(_QWORD *)(a1 + 24));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13AF8], "pairWithFirst:second:", v21, v20);
      a1 = objc_claimAutoreleasedReturnValue();

    }
  }

  return (id)a1;
}

- (id)unifyPeople:(void *)a3 keysToFetch:(void *)a4 abMatchInfos:(void *)a5 filteredForAccountIdentifiers:(_QWORD *)a6 outCNMatchInfos:
{
  id v11;
  void *v12;
  CFMutableArrayRef Mutable;
  __CFArray *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  const void *v21;
  int IntValue;
  void *v23;
  const __CFArray *v24;
  const __CFArray *v25;
  CNiOSABUtilities *v26;
  const __CFArray *v27;
  const __CFDictionary *v28;
  id v29;
  void *v30;
  CFIndex Count;
  CFIndex v32;
  CFIndex v33;
  const CFArrayCallBacks *v34;
  const void *ValueAtIndex;
  const void *v36;
  void *Value;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  _QWORD *v89;
  id v90;
  id v91;
  id v92;
  id v93;
  const __CFDictionary *v94;
  void *v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void (**v102)(_QWORD, _QWORD);
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  const __CFArray *v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  void *v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v92 = a2;
  v91 = a3;
  v11 = a4;
  v90 = a5;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = a6;
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v96 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v96 = 0;
    }
    Mutable = CFArrayCreateMutable(0, objc_msgSend(v92, "count"), 0);
    v98 = a1;
    v95 = v12;
    if (Mutable)
    {
      v14 = Mutable;
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = 0u;
      v124 = 0u;
      v125 = 0u;
      v126 = 0u;
      v16 = v92;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v124;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v124 != v19)
              objc_enumerationMutation(v16);
            v21 = *(const void **)(*((_QWORD *)&v123 + 1) + 8 * i);
            IntValue = ABRecordGetIntValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", ABRecordGetRecordID(v21));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v23);

            if (IntValue != -1)
              CFArrayAppendValue(v14, (const void *)IntValue);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
        }
        while (v18);
      }

      v24 = (const __CFArray *)ABAddressBookCopyPeopleWithLinkIdentifiers();
      v25 = v24;
      if (v90)
      {
        v26 = -[CNiOSABUtilities initWithAddressBook:]([CNiOSABUtilities alloc], "initWithAddressBook:", *(_QWORD *)(a1 + 8));
        -[CNiOSABUtilities filterPeople:matchingAccountIdentifiers:](v26, "filterPeople:matchingAccountIdentifiers:", v25, v90);
        v27 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v27 = v24;
      }
      v121[0] = MEMORY[0x1E0C809B0];
      v121[1] = 3221225472;
      v121[2] = __106__CNiOSContactFetcher_unifyPeople_keysToFetch_abMatchInfos_filteredForAccountIdentifiers_outCNMatchInfos___block_invoke;
      v121[3] = &unk_1E29F93A0;
      v29 = v15;
      v122 = v29;
      -[__CFArray _cn_filter:](v27, "_cn_filter:", v121);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNiOSContactFetcher _batchLoadPropertiesForPeople:keysToFetch:](a1, v30, v91);
      if (v25)
      {
        v103 = v30;
        v105 = v29;
        v107 = v27;
        v28 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
        Count = CFArrayGetCount(v25);
        if (Count >= 1)
        {
          v32 = Count;
          v33 = 0;
          v34 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
          do
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v25, v33);
            v36 = (const void *)(int)ABRecordGetIntValue();
            Value = (void *)CFDictionaryGetValue(v28, v36);
            if (!Value)
            {
              Value = CFArrayCreateMutable(0, 0, v34);
              CFDictionarySetValue(v28, v36, Value);
              CFRelease(Value);
            }
            CFArrayAppendValue((CFMutableArrayRef)Value, ValueAtIndex);
            ++v33;
          }
          while (v32 != v33);
        }
        CFRelease(v25);
        a1 = v98;
        v29 = v105;
        v27 = v107;
        v30 = v103;
      }
      else
      {
        v28 = 0;
      }
      CFRelease(v14);

      v12 = v95;
    }
    else
    {
      v28 = 0;
    }
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v38 = v92;
    v100 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
    if (v100)
    {
      v99 = *(_QWORD *)v118;
      v93 = v38;
      v94 = v28;
      do
      {
        v39 = 0;
        do
        {
          if (*(_QWORD *)v118 != v99)
            objc_enumerationMutation(v38);
          v40 = ABRecordGetIntValue();
          v41 = v40;
          v108 = v39;
          v42 = (_DWORD)v40 != -1 && CFDictionaryContainsKey(v28, (const void *)(int)v40) != 0;
          v106 = v41;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v101, "containsObject:", v43);

          if (!v42 || (v44 & 1) == 0)
          {
            if (((!v42 | v44) & 1) != 0)
            {
              (*(void (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "identifier");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectForKey:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              if (v47)
              {
                +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v48 = 0;
              }
            }
            else
            {
              v49 = (void *)CFDictionaryGetValue(v28, (const void *)(int)v106);
              +[CNiOSContactFetcher linkedPeopleComparator]();
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "sortedArrayUsingComparator:", v50);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              v104 = v51;
              objc_msgSend(v51, "_cn_map:", *(_QWORD *)(a1 + 24));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "firstObject");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "keyVector");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = (void *)objc_msgSend(v54, "mutableCopy");

              v115 = 0u;
              v116 = 0u;
              v113 = 0u;
              v114 = 0u;
              v56 = v52;
              v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
              if (v57)
              {
                v58 = v57;
                v59 = 0;
                v60 = *(_QWORD *)v114;
                do
                {
                  for (j = 0; j != v58; ++j)
                  {
                    if (*(_QWORD *)v114 != v60)
                      objc_enumerationMutation(v56);
                    v62 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * j);
                    objc_msgSend(v56, "objectAtIndexedSubscript:", 0);
                    v63 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v62 != v63)
                    {
                      objc_msgSend(v62, "keyVector");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v64, "isEqualToKeyVector:", v55) & 1) == 0)
                      {
                        objc_msgSend(v55, "unionKeyVector:", v64);
                        v59 = 1;
                      }

                    }
                  }
                  v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v113, v129, 16);
                }
                while (v58);
              }
              else
              {
                v59 = 0;
              }

              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v55);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              +[CNiOSABConversions personToContactTransformWithKeysToFetch:mutable:]((uint64_t)CNiOSABConversions, v97, objc_msgSend(*(id *)(v98 + 16), "mutableObjects"));
              v102 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v56, "count"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v56, "count"))
              {
                v66 = 0;
                do
                {
                  objc_msgSend(v56, "objectAtIndexedSubscript:", v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v67 != v68)
                  {
                    if ((v59 & 1) != 0)
                    {
                      v128 = v55;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v128, 1);
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v70 = objc_msgSend(v67, "areKeysAvailable:", v69);

                      if ((v70 & 1) == 0)
                      {
                        objc_msgSend(v104, "objectAtIndexedSubscript:", v66);
                        v71 = (void *)objc_claimAutoreleasedReturnValue();

                        ((void (**)(_QWORD, void *))v102)[2](v102, v71);
                        v72 = objc_claimAutoreleasedReturnValue();

                        v67 = (void *)v72;
                      }
                    }
                    objc_msgSend(v65, "addObject:", v67);
                  }

                  ++v66;
                }
                while (v66 < objc_msgSend(v56, "count"));
              }

              v73 = v65;
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = 0u;
              v110 = 0u;
              v111 = 0u;
              v112 = 0u;
              v75 = v73;
              v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
              if (v76)
              {
                v77 = v76;
                v78 = *(_QWORD *)v110;
                do
                {
                  for (k = 0; k != v77; ++k)
                  {
                    if (*(_QWORD *)v110 != v78)
                      objc_enumerationMutation(v75);
                    v80 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
                    objc_msgSend(v80, "identifier");
                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "objectForKey:", v81);
                    v82 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v82)
                    {
                      +[CNiOSABConversions contactMatchInfoFromABMatchMetadataDictionary:]((uint64_t)CNiOSABConversions, v82);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v80, "identifier");
                      v84 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v74, "setObject:forKey:", v83, v84);

                    }
                  }
                  v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v109, v127, 16);
                }
                while (v77);
              }

              v38 = v93;
              if (objc_msgSend(v74, "count"))
              {
                +[CN unifyContactMatchInfos:linkedContacts:](CN, "unifyContactMatchInfos:linkedContacts:", v74, v75);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v48 = 0;
              }
              v12 = v95;
              +[CN contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:](CN, "contactUnifyingContacts:includingMainStoreContacts:allowMutableContactFreeze:", v75, 1, 1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v106);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "addObject:", v85);

              v28 = v94;
              v47 = v104;
            }

            if (v48)
            {
              objc_msgSend(v45, "identifier");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "setObject:forKey:", v48, v86);

            }
            objc_msgSend(v12, "addObject:", v45);

            a1 = v98;
          }
          v39 = v108 + 1;
        }
        while (v108 + 1 != v100);
        v100 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v117, v130, 16);
      }
      while (v100);
    }

    if (v89)
      *v89 = objc_retainAutorelease(v96);
    v87 = v92;
    if (v28)
      CFRelease(v28);

  }
  else
  {
    v12 = 0;
    v87 = v92;
  }

  return v12;
}

- (id)executeFetchRequestWithProgressiveResults:(id)a3 completion:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  CNiOSPersonFetcher *v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = (unint64_t)a3;
  v7 = (unint64_t)a4;
  if (v6 | v7)
  {
    +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:managedConfiguration:error:](CNiOSPersonFetchRequest, "fetchRequestFromCNFetchRequest:managedConfiguration:error:", self->_fetchRequest, self->_managedConfiguration, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[CNiOSPersonFetcher initWithAddressBook:fetchRequest:environment:]([CNiOSPersonFetcher alloc], "initWithAddressBook:fetchRequest:environment:", self->_addressBook, v8, self->_environment);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __76__CNiOSContactFetcher_executeFetchRequestWithProgressiveResults_completion___block_invoke;
      v12[3] = &unk_1E29F9378;
      v12[4] = self;
      v13 = (id)v6;
      -[CNiOSPersonFetcher executeFetchRequestWithProgressiveResults:completion:](v9, "executeFetchRequestWithProgressiveResults:completion:", v12, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __76__CNiOSContactFetcher_executeFetchRequestWithProgressiveResults_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = a3;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = (void *)MEMORY[0x19400675C]();
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      v8 = *(void **)(v7 + 16);
    else
      v8 = 0;
    v9 = v8;
    objc_msgSend(v9, "effectiveKeysToFetch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNiOSContactFetcher _contactsFromPeople:abMatchInfo:keysToFetch:](v7, v14, v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v6);
    objc_msgSend(v11, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "second");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (id)fetchContactsReturningMatchInfos:(id *)a3 error:(id *)a4
{
  void *v7;
  id *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  +[CNiOSPersonFetchRequest fetchRequestFromCNFetchRequest:managedConfiguration:error:](CNiOSPersonFetchRequest, "fetchRequestFromCNFetchRequest:managedConfiguration:error:", self->_fetchRequest, self->_managedConfiguration, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a3)
      v8 = &v18;
    else
      v8 = 0;
    if (a3)
      v18 = 0;
    +[CNiOSPersonFetcher peopleForFetchRequest:matchInfos:inAddressBook:environment:error:](CNiOSPersonFetcher, "peopleForFetchRequest:matchInfos:inAddressBook:environment:error:", v7, v8, self->_addressBook, self->_environment, a4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (a3)
    {
      v11 = v18;
      if (v10)
        goto LABEL_9;
    }
    else
    {
      v11 = 0;
      if (v9)
      {
LABEL_9:
        -[CNContactFetchRequest effectiveKeysToFetch](self->_fetchRequest, "effectiveKeysToFetch");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNiOSContactFetcher _contactsFromPeople:abMatchInfo:keysToFetch:]((uint64_t)self, v10, v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "first");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "second");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (a3 && v11)
          *a3 = objc_retainAutorelease(v15);

        goto LABEL_16;
      }
    }
    v14 = 0;
LABEL_16:

    goto LABEL_17;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

uint64_t __106__CNiOSContactFetcher_unifyPeople_keysToFetch_abMatchInfos_filteredForAccountIdentifiers_outCNMatchInfos___block_invoke(uint64_t a1, ABRecordRef record)
{
  uint64_t RecordID;
  void *v4;
  void *v5;
  uint64_t v6;

  RecordID = ABRecordGetRecordID(record);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", RecordID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5) ^ 1;

  return v6;
}

+ (id)linkedPeopleComparator
{
  objc_opt_self();
  if (linkedPeopleComparator_cn_once_token_0 != -1)
    dispatch_once(&linkedPeopleComparator_cn_once_token_0, &__block_literal_global_40);
  return (id)linkedPeopleComparator_cn_once_object_0;
}

void __45__CNiOSContactFetcher_linkedPeopleComparator__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = &__block_literal_global_25;
  v3[1] = &__block_literal_global_26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  CNAggregateComparator();
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)linkedPeopleComparator_cn_once_object_0;
  linkedPeopleComparator_cn_once_object_0 = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedConfiguration, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong(&self->_personToContact, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
}

@end
