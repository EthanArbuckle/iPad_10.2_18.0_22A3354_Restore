@implementation NSManagedObjectModel(VSDeveloperModeAdditions)

+ (id)vs_developerModeModelForVersion:()VSDeveloperModeAdditions
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x1E0C97B98]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "vs_identityProviderEntityForVersion:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(v5, "setEntities:", v6);

  return v5;
}

+ (id)vs_identityProviderEntityForVersion:()VSDeveloperModeAdditions
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  id v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C97B20]);
  objc_msgSend(v4, "setName:", CFSTR("IdentityProvider"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setManagedObjectClassName:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v7, "addObject:", v9);
  objc_msgSend(v9, "setName:", CFSTR("uniqueID"));
  objc_msgSend(v9, "setAttributeType:", 700);
  objc_msgSend(v9, "setOptional:", 0);
  objc_msgSend(v8, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v7, "addObject:", v10);
  objc_msgSend(v10, "setName:", CFSTR("providerID"));
  objc_msgSend(v10, "setAttributeType:", 700);
  objc_msgSend(v10, "setOptional:", 0);
  v40 = v10;
  objc_msgSend(v8, "addObject:", v10);
  v11 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v7, "addObject:", v11);
  objc_msgSend(v11, "setName:", CFSTR("nameForSorting"));
  objc_msgSend(v11, "setAttributeType:", 700);
  objc_msgSend(v11, "setOptional:", 0);
  v39 = v11;
  objc_msgSend(v8, "addObject:", v11);
  v12 = objc_alloc_init(MEMORY[0x1E0C97A80]);
  objc_msgSend(v7, "addObject:", v12);
  objc_msgSend(v12, "setName:", CFSTR("authenticationURL"));
  objc_msgSend(v12, "setAttributeType:", 700);
  v38 = v12;
  objc_msgSend(v12, "setOptional:", 0);
  if (a3 >= 1)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C97A80]);
    objc_msgSend(v7, "addObject:", v13);
    objc_msgSend(v13, "setName:", CFSTR("certificateURL"));
    objc_msgSend(v13, "setAttributeType:", 700);
    objc_msgSend(v13, "setOptional:", 1);

    if (a3 != 1)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C97A80]);
      objc_msgSend(v7, "addObject:", v14);
      objc_msgSend(v14, "setName:", CFSTR("authenticationSchemes"));
      objc_msgSend(v14, "setAttributeType:", 1800);
      objc_msgSend(v14, "setOptional:", 1);

      if ((unint64_t)a3 >= 3)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C97A80]);
        objc_msgSend(v7, "addObject:", v15);
        objc_msgSend(v15, "setName:", CFSTR("requireBootUrlSystemTrust"));
        objc_msgSend(v15, "setAttributeType:", 800);
        objc_msgSend(v15, "setOptional:", 1);
        v16 = objc_alloc_init(MEMORY[0x1E0C97A80]);
        objc_msgSend(v7, "addObject:", v16);
        objc_msgSend(v16, "setName:", CFSTR("requireXHRRequestSystemTrust"));
        objc_msgSend(v16, "setAttributeType:", 800);
        objc_msgSend(v16, "setOptional:", 1);

      }
    }
  }
  objc_msgSend(v4, "setProperties:", v7);
  v41 = v9;
  v52 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniquenessConstraints:", v18);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v19 = v7;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v47;
    v23 = *MEMORY[0x1E0CB3188];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v47 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "setValueTransformerName:", v23);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v21);
  }
  v37 = v19;

  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v26 = v8;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v31, "name", v37);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B40]), "initWithProperty:collationType:", v31, 0);
        objc_msgSend(v33, "addObject:", v34);

        v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B38]), "initWithName:elements:", v32, v33);
        objc_msgSend(v25, "addObject:", v35);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v28);
  }

  objc_msgSend(v4, "setIndexes:", v25);
  return v4;
}

@end
