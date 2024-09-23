@implementation NSEntityDescription(VSSubscriptionAdditions)

- (void)vs_setUserInfoValue:()VSSubscriptionAdditions forKey:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(a1, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "mutableCopy");

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v10)
  {
    objc_msgSend(v8, "setObject:forKey:", v10, v6);
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v8, "removeObjectForKey:", v6);
  }
  objc_msgSend(a1, "setUserInfo:", v8);

}

- (id)vs_referenceValueAttribute
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VSReferenceValueAttributeUserInfoKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = v3;
    objc_msgSend(a1, "attributesByName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)vs_setReferenceValueAttribute:()VSSubscriptionAdditions
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a3, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v7);

  if (v6)
    objc_msgSend(a1, "vs_setUserInfoValue:forKey:", v7, CFSTR("VSReferenceValueAttributeUserInfoKey"));
  else
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The attribute must belong to the receiver."));

}

+ (id)vs_subscriptionEntityForVersion:()VSSubscriptionAdditions
{
  id v4;
  objc_class *v5;
  void *v6;
  unint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t j;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  uint64_t k;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t m;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id obj;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  id v113;
  id v114;
  _QWORD v115[2];
  _QWORD v116[5];
  _QWORD v117[4];
  _QWORD v118[2];
  _QWORD v119[2];
  void *v120;
  _QWORD v121[2];
  _QWORD v122[3];

  v122[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C97B20]);
  objc_msgSend(v4, "setName:", CFSTR("Subscription"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManagedObjectClassName:", v6);

  v7 = 0x1E0C99000uLL;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v8, "addObject:", v10);
  objc_msgSend(v10, "setName:", CFSTR("expirationDate"));
  objc_msgSend(v10, "vs_setSubscriptionKeyPath:", CFSTR("expirationDate"));
  objc_msgSend(v10, "vs_setPropertyListKey:", CFSTR("PSSSExpirationDate"));
  objc_msgSend(v10, "setAttributeType:", 900);
  objc_msgSend(v10, "setOptional:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDefaultValue:", v11);

  v83 = v10;
  objc_msgSend(v9, "addObject:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v8, "addObject:", v12);
  objc_msgSend(v12, "setName:", CFSTR("creationDate"));
  objc_msgSend(v12, "vs_setSubscriptionKeyPath:", CFSTR("creationDate"));
  objc_msgSend(v12, "vs_setSuitablePurposes:", 5);
  objc_msgSend(v12, "vs_setPropertyListKey:", CFSTR("PSSSDateCreated"));
  objc_msgSend(v12, "setAttributeType:", 900);
  objc_msgSend(v12, "setOptional:", 0);
  v82 = v12;
  objc_msgSend(v9, "addObject:", v12);
  v13 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v8, "addObject:", v13);
  objc_msgSend(v13, "setName:", CFSTR("mostRecentSaveDate"));
  objc_msgSend(v13, "vs_setSubscriptionKeyPath:", CFSTR("modificationDate"));
  objc_msgSend(v13, "vs_setSuitablePurposes:", 5);
  objc_msgSend(v13, "vs_setPropertyListKey:", CFSTR("PSSSDateModified"));
  objc_msgSend(v13, "setAttributeType:", 900);
  objc_msgSend(v13, "setOptional:", 0);
  v80 = v13;
  objc_msgSend(v9, "addObject:", v13);
  v14 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v14, "vs_setPropertyListKey:", CFSTR("PSSSSubscriptionInfo"));
  objc_msgSend(v14, "setAttributeType:", 700);
  objc_msgSend(v14, "setOptional:", a3 < 1);
  objc_msgSend(v14, "setDefaultValue:", &stru_1E93A8CC0);
  v15 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v15, "vs_setSubscriptionKeyPath:", CFSTR("providedSubscriptionInfo"));
  objc_msgSend(v8, "addObject:", v15);
  objc_msgSend(v15, "setName:", CFSTR("providedSubscriptionInfo"));
  v81 = v15;
  objc_msgSend(v9, "addObject:", v15);
  v79 = v14;
  v16 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(v16, "vs_setSubscriptionKeyPath:", CFSTR("derivedSubscriptionInfo"));
  objc_msgSend(v8, "addObject:", v16);
  objc_msgSend(v16, "setTransient:", 1);
  objc_msgSend(v16, "setName:", CFSTR("derivedSubscriptionInfo"));
  v78 = v16;
  objc_msgSend(v16, "vs_setSuitablePurposes:", 4);
  v17 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v8, "addObject:", v17);
  objc_msgSend(v17, "setName:", CFSTR("sourceIdentifier"));
  objc_msgSend(v17, "vs_setSubscriptionKeyPath:", CFSTR("source.identifier"));
  objc_msgSend(v17, "vs_setPropertyListKey:", CFSTR("PSSSIdentifier"));
  objc_msgSend(v17, "setAttributeType:", 700);
  objc_msgSend(v17, "setOptional:", 0);
  objc_msgSend(v9, "addObject:", v17);
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= 1"), CFSTR("length"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", v20);

  objc_msgSend(v19, "addObject:", &unk_1E93CC660);
  v76 = v19;
  v77 = v18;
  objc_msgSend(v17, "setValidationPredicates:withValidationWarnings:", v18, v19);
  v84 = v17;
  v89 = v9;
  if (a3 < 1)
  {
    v113 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v113, 1);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v114 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v114, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUniquenessConstraints:", v44);
  }
  else
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C97A80]);
    objc_msgSend(v8, "addObject:", v21);
    objc_msgSend(v21, "setName:", CFSTR("sourceKind"));
    objc_msgSend(v21, "vs_setSubscriptionKeyPath:", CFSTR("source.kind"));
    objc_msgSend(v21, "vs_setPropertyListKey:", CFSTR("PSSSIdentifierType"));
    objc_msgSend(v21, "vs_setPropertyListValueTransformerName:", CFSTR("VSSubscriptionSourceKindPropertyListValueTransformer"));
    objc_msgSend(v21, "setAttributeType:", 100);
    objc_msgSend(v21, "setOptional:", 0);
    objc_msgSend(v9, "addObject:", v21);
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), &unk_1E93CC678);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v24);

    objc_msgSend(v23, "addObject:", &unk_1E93CC690);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self <= %@"), &unk_1E93CC6A8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v25);

    objc_msgSend(v23, "addObject:", &unk_1E93CC6C0);
    v87 = v22;
    objc_msgSend(v21, "setValidationPredicates:withValidationWarnings:", v22, v23);
    objc_msgSend(v21, "setDefaultValue:", &unk_1E93CC678);
    if (a3 != 1)
    {
      v26 = objc_alloc_init(MEMORY[0x1E0C97A80]);
      objc_msgSend(v8, "addObject:", v26);
      objc_msgSend(v26, "setName:", CFSTR("subscriberIdentifierHash"));
      objc_msgSend(v26, "vs_setSubscriptionKeyPath:", CFSTR("subscriberIdentifierHash"));
      objc_msgSend(v26, "vs_setJSONKey:", CFSTR("account"));
      objc_msgSend(v26, "vs_setJSONValueTransformerName:", CFSTR("VSSubscriptionAccountHashValueTransformer"));
      objc_msgSend(v26, "setAttributeType:", 700);
      objc_msgSend(v26, "setOptional:", 0);
      objc_msgSend(v26, "setDefaultValue:", &stru_1E93A8CC0);

      if ((unint64_t)a3 >= 3)
      {
        v27 = objc_alloc_init(MEMORY[0x1E0C97A80]);
        objc_msgSend(v8, "addObject:", v27);
        objc_msgSend(v27, "setName:", CFSTR("billingIdentifier"));
        objc_msgSend(v27, "vs_setSubscriptionKeyPath:", CFSTR("billingIdentifier"));
        objc_msgSend(v27, "vs_setJSONKey:", CFSTR("billingIdentifier"));
        objc_msgSend(v27, "setAttributeType:", 700);
        objc_msgSend(v27, "setOptional:", 0);
        objc_msgSend(v27, "setDefaultValue:", &stru_1E93A8CC0);

      }
    }
    v28 = objc_alloc_init(MEMORY[0x1E0C97A80]);
    objc_msgSend(v8, "addObject:", v28);
    objc_msgSend(v28, "setName:", CFSTR("accessLevel"));
    objc_msgSend(v28, "vs_setSubscriptionKeyPath:", CFSTR("accessLevel"));
    objc_msgSend(v28, "vs_setJSONKey:", CFSTR("availabilityType"));
    objc_msgSend(v28, "vs_setRequiredJSONValue:", 1);
    v122[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "vs_setExpectedJSONValueClasses:", v29);

    objc_msgSend(v28, "vs_setJSONValueTransformerName:", CFSTR("VSSubscriptionAvailabilityTypeJSONValueTransformer"));
    objc_msgSend(v28, "setAttributeType:", 100);
    objc_msgSend(v28, "setOptional:", 0);
    objc_msgSend(v28, "setDefaultValue:", &unk_1E93CC678);
    v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), &unk_1E93CC678);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v32);

    objc_msgSend(v31, "addObject:", &unk_1E93CC690);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self <= %@"), &unk_1E93CC6D8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v33);

    objc_msgSend(v31, "addObject:", &unk_1E93CC6C0);
    objc_msgSend(v28, "setValidationPredicates:withValidationWarnings:", v30, v31);
    v34 = objc_alloc_init(MEMORY[0x1E0C97A80]);
    objc_msgSend(v8, "addObject:", v34);
    objc_msgSend(v34, "setName:", CFSTR("tierIdentifiers"));
    objc_msgSend(v34, "vs_setSubscriptionKeyPath:", CFSTR("tierIdentifiers"));
    objc_msgSend(v34, "vs_setJSONKey:", CFSTR("tiers"));
    v121[0] = objc_opt_class();
    v121[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "vs_setExpectedJSONValueClasses:", v35);

    objc_msgSend(v34, "setAttributeType:", 1800);
    objc_msgSend(v34, "setValueTransformerName:", *MEMORY[0x1E0CB3188]);
    objc_msgSend(v34, "setOptional:", 0);
    objc_msgSend(v34, "setDefaultValue:", MEMORY[0x1E0C9AA60]);
    v36 = (objc_class *)objc_opt_class();
    NSStringFromClass(v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAttributeValueClassName:", v37);

    v119[0] = v21;
    v119[1] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v38;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUniquenessConstraints:", v39);

    v118[0] = v21;
    v118[1] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 2);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v40);

    v117[0] = v21;
    v117[1] = v84;
    v117[2] = v83;
    v117[3] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 4);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v41);

    v116[0] = v81;
    v116[1] = v21;
    v116[2] = v84;
    v116[3] = v83;
    v116[4] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v42);

    v115[0] = v21;
    v115[1] = v82;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 2);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "addObject:", v43);

    v7 = 0x1E0C99000;
    v44 = v87;
  }

  objc_msgSend(v4, "setProperties:", v8);
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v45 = v8;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v106;
    v49 = *MEMORY[0x1E0CB3188];
    do
    {
      for (i = 0; i != v47; ++i)
      {
        if (*(_QWORD *)v106 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "setValueTransformerName:", v49);
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    }
    while (v47);
  }
  v75 = v45;

  objc_msgSend(v4, "vs_setReferenceValueAttribute:", v84);
  v51 = objc_alloc_init(*(Class *)(v7 + 3560));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v89;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v102 != v54)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
        objc_msgSend(v56, "name");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_alloc_init(*(Class *)(v7 + 3560));
        v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B40]), "initWithProperty:collationType:", v56, 0);
        objc_msgSend(v58, "addObject:", v59);

        v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B38]), "initWithName:elements:", v57, v58);
        objc_msgSend(v51, "addObject:", v60);

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    }
    while (v53);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v85 = v91;
  v92 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
  if (v92)
  {
    v88 = v51;
    v90 = *(_QWORD *)v98;
    do
    {
      for (k = 0; k != v92; ++k)
      {
        if (*(_QWORD *)v98 != v90)
          objc_enumerationMutation(v85);
        v62 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
        objc_msgSend(v62, "valueForKeyPath:", CFSTR("name"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v63;
        if (v63)
        {
          objc_msgSend(v63, "componentsJoinedByString:", CFSTR("_"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_alloc_init(*(Class *)(v7 + 3560));
          v93 = 0u;
          v94 = 0u;
          v95 = 0u;
          v96 = 0u;
          v67 = v62;
          v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
          if (v68)
          {
            v69 = v68;
            v70 = *(_QWORD *)v94;
            do
            {
              for (m = 0; m != v69; ++m)
              {
                if (*(_QWORD *)v94 != v70)
                  objc_enumerationMutation(v67);
                v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B40]), "initWithProperty:collationType:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * m), 0);
                objc_msgSend(v66, "addObject:", v72);

              }
              v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
            }
            while (v69);
          }

          v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B38]), "initWithName:elements:", v65, v66);
          v51 = v88;
          objc_msgSend(v88, "addObject:", v73);

          v7 = 0x1E0C99000;
        }

      }
      v92 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
    }
    while (v92);
  }

  objc_msgSend(v4, "setIndexes:", v51);
  return v4;
}

@end
