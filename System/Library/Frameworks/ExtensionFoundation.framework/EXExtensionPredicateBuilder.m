@implementation EXExtensionPredicateBuilder

void __136___EXExtensionPredicateBuilder_gatherChildrenPredicateWithRuleDictionary_parentType_parentAccepted_acceptedChildTypes_exceptChildTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  char v38;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ACCEPT")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("REJECT")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("TYPE")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("TYPES")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("EXCEPT_TYPES")) & 1) == 0)
  {
    v7 = _NSIsNSDictionary();
    v8 = v5;
    if (v7)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("ACCEPT"));
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("REJECT"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("TYPES"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(v6, "objectForKey:", CFSTR("TYPE"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }

      }
      objc_msgSend(v6, "objectForKey:", CFSTR("EXCEPT_TYPES"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v6;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      v13 = 0;
      v14 = 0;
      v9 = (uint64_t)v6;
    }
    v15 = v6;
    v38 = 0;
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_BYTE *)(a1 + 72);
    v36 = 0;
    v37 = 0;
    v34 = (void *)v9;
    LOBYTE(v33) = v18;
    v35 = v8;
    objc_msgSend(v16, "applyRuleWithRuleName:acceptRule:rejectRule:types:exceptTypes:parentType:children:parentAccepted:accepted:acceptedTypesInSubtree:exceptTypesInSubtree:", v8, v9, v10, v11, v13, v17, v14, v33, &v38, &v37, &v36);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v37;
    v21 = v36;
    if (v19)
    {
      v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v22)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v25 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = v23;

        v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v22, "addObject:", v19);
    }
    if (v38 && objc_msgSend(v11, "count") || objc_msgSend(v20, "count"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

      }
      if (v38 && objc_msgSend(v11, "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v11);
      if (objc_msgSend(v20, "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v20);
    }
    if (v38 && objc_msgSend(v13, "count") || objc_msgSend(v21, "count"))
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v30 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v31 = *(void **)(v30 + 40);
        *(_QWORD *)(v30 + 40) = v29;

      }
      if (v38 && objc_msgSend(v13, "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", v13);
      if (objc_msgSend(v21, "count"))
      {
        v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        objc_msgSend(v32, "addObjectsFromArray:", v32);
      }
    }

  }
}

@end
