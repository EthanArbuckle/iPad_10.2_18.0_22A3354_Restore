@implementation EKDiff

- (EKDiff)initWithFirstObject:(id)a3 secondObject:(id)a4
{
  id v6;
  id v7;
  EKDiff *v8;
  EKDiff *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EKDiff;
  v8 = -[EKDiff init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[EKDiff setFirstObject:](v8, "setFirstObject:", v6);
    -[EKDiff setSecondObject:](v9, "setSecondObject:", v7);
  }

  return v9;
}

- (id)_nonNilObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[EKDiff firstObject](self, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[EKDiff secondObject](self, "secondObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)diffBetweenObject:(id)a3 andObject:(id)a4
{
  return +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:](EKDiff, "diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:", a3, a4, 0);
}

+ (id)diffBetweenObject:(id)a3 andObject:(id)a4 compareUIVisiblePropertiesOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v12;
  EKDiff *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.5((uint64_t)v8, (uint64_t)v9, v10);
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  v12 = !v11;
  v13 = -[EKDiff initWithFirstObject:secondObject:]([EKDiff alloc], "initWithFirstObject:secondObject:", v8, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v12)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.4();
    v14 = 1;
LABEL_28:
    -[EKDiff setResult:](v13, "setResult:", v14);
    goto LABEL_29;
  }
  objc_msgSend(a1, "_populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:", v13, v5);
  objc_msgSend(a1, "_populateImmutableKeysForDiff:", v13);
  objc_msgSend(a1, "_populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:", v13, v5);
  objc_msgSend(a1, "_populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:", v13, v5);
  -[EKDiff differentSingleValueKeys](v13, "differentSingleValueKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    -[EKDiff differentRelationshipSingleValueKeys](v13, "differentRelationshipSingleValueKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "count"))
    {
      -[EKDiff differentRelationshipMultiValueKeys](v13, "differentRelationshipMultiValueKeys");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v21, "count"))
      {
        -[EKDiff differentImmutableKeys](v13, "differentImmutableKeys");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "count"))
          v22 = v12;
        else
          v22 = 0;
        v24 = v22;

        if ((v24 & 1) != 0)
          goto LABEL_34;
LABEL_16:
        if (v5)
          goto LABEL_18;
        goto LABEL_17;
      }

    }
    if ((v12 & 1) != 0)
      goto LABEL_34;
    goto LABEL_16;
  }

  if (!v12)
    goto LABEL_16;
LABEL_34:
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.3();
  -[EKDiff setResult:](v13, "setResult:", 3);
  if (!v5)
LABEL_17:
    objc_msgSend(a1, "_populateIdentityKeysForDiff:", v13);
LABEL_18:
  -[EKDiff differentIdentityKeys](v13, "differentIdentityKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  v18 = v12 ^ 1;
  if (!v17)
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.2();
    -[EKDiff setResult:](v13, "setResult:", 2);
  }
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:].cold.1();
    v14 = 4;
    goto LABEL_28;
  }
LABEL_29:

  return v13;
}

+ (id)_keysToIgnoreForComputingDiff
{
  if (_keysToIgnoreForComputingDiff_onceToken != -1)
    dispatch_once(&_keysToIgnoreForComputingDiff_onceToken, &__block_literal_global_22);
  return (id)_keysToIgnoreForComputingDiff_keysToIgnore;
}

void __39__EKDiff__keysToIgnoreForComputingDiff__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0D0B2A8];
  v6[0] = *MEMORY[0x1E0D0B298];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0D0B620];
  v6[2] = *MEMORY[0x1E0D0B338];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E0D0B7B8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_keysToIgnoreForComputingDiff_keysToIgnore;
  _keysToIgnoreForComputingDiff_keysToIgnore = v4;

}

+ (id)_keysToIgnoreForComputingUIDiff
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__EKDiff__keysToIgnoreForComputingUIDiff__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_keysToIgnoreForComputingUIDiff_onceToken != -1)
    dispatch_once(&_keysToIgnoreForComputingUIDiff_onceToken, block);
  return (id)_keysToIgnoreForComputingUIDiff_keysToIgnore;
}

void __41__EKDiff__keysToIgnoreForComputingUIDiff__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E47B5B90);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_keysToIgnoreForComputingUIDiff_keysToIgnore;
  _keysToIgnoreForComputingUIDiff_keysToIgnore = v2;

  objc_msgSend(*(id *)(a1 + 32), "_keysToIgnoreForComputingDiff");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setByAddingObjectsFromSet:", _keysToIgnoreForComputingUIDiff_keysToIgnore);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_keysToIgnoreForComputingUIDiff_keysToIgnore;
  _keysToIgnoreForComputingUIDiff_keysToIgnore = v4;

}

+ (void)_populateSingleValueKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  BOOL v28;

  v4 = a4;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:].cold.2();
  objc_msgSend(v6, "_nonNilObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownSingleValueKeysForComparison");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_keysToIgnoreForComputingDiff");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "_nonNilObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "knownIdentityKeysForComparison");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_nonNilObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "knownSingleValueKeysToSkipForUIComparison");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setByAddingObjectsFromArray:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __73__EKDiff__populateSingleValueKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke;
  v24 = &unk_1E4785830;
  v15 = v6;
  v25 = v15;
  v28 = v4;
  v16 = v9;
  v26 = v16;
  v27 = a1;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectsAtIndexes:", v17, v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDifferentSingleValueKeys:", v19);

  v20 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:].cold.1(v20);

}

uint64_t __73__EKDiff__populateSingleValueKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned int (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_nonNilObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "specialComparisonBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v3);
  v6 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 56) && v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "secondObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = ((unsigned int (**)(_QWORD, void *, void *))v6)[2](v6, v7, v8) ^ 1;

LABEL_7:
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_nonNilObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_class();
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "secondObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_keysToIgnoreForComputingDiff");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v11, v12, v13, v14) ^ 1;

    goto LABEL_7;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

+ (void)_populateSingleValueRelationshipKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  _BOOL4 v47;
  id obj;
  uint64_t v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  id v56;
  id v57;
  BOOL v58;
  _BYTE v59[128];
  uint64_t v60;

  v4 = a4;
  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:].cold.2();
  objc_msgSend(v6, "_nonNilObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownDerivedAndSingleValueRelationshipKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_keysToIgnoreForComputingDiff");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v6, "_nonNilObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "knownIdentityKeysForComparison");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_nonNilObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "knownSingleValueKeysToSkipForUIComparison");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setByAddingObjectsFromArray:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __85__EKDiff__populateSingleValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke;
  v55[3] = &unk_1E4785858;
  v42 = v9;
  v56 = v42;
  v15 = v6;
  v57 = v15;
  v47 = v4;
  v58 = v4;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v55);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v8;
  objc_msgSend(v8, "objectsAtIndexes:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDifferentRelationshipSingleValueKeys:", v18);

  v19 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:].cold.1(v19);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count", v42));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v17;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v49)
  {
    v21 = *(_QWORD *)v52;
    v45 = *(_QWORD *)v52;
    v46 = v15;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v52 != v21)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v22);
        objc_msgSend(v15, "secondObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "valueForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v15, "firstObject");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "valueForKey:", v23);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "secondObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "valueForKey:", v23);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "copy");

          v50 = v30;
          if (v27)
          {
            objc_msgSend(v15, "firstObject");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "eventStore");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "meltedObjectInStore:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "secondObject");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "eventStore");
            v35 = v20;
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "meltedObjectInStore:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v33, "diffWithObject:compareUIVisiblePropertiesOnly:", v37, v47);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "differentKeys");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = objc_msgSend(v39, "count");

            v20 = v35;
            if (v40)
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v38, v23);

            v21 = v45;
            v15 = v46;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v33, v23);
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, v23);
        }

        ++v22;
      }
      while (v49 != v22);
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v49);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v20);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRelationshipSingleValueModifies:", v41);

}

uint64_t __85__EKDiff__populateSingleValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_nonNilObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "secondObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "_compareSingleValueRelationshipKey:forObject:againstObject:propertiesToIgnore:ignoreIdentityKeys:", v3, v7, v8, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48)) ^ 1;

  }
  return v4;
}

+ (void)_populateMultiValueRelationshipKeysForDiff:(id)a3 compareUIVisiblePropertiesOnly:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id obj;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL4 v69;
  void *v70;
  uint64_t v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v69 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:].cold.2();
  objc_msgSend(v5, "_nonNilObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownRelationshipMultiValueKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __84__EKDiff__populateMultiValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke;
  v89[3] = &unk_1E4785880;
  v58 = a1;
  v91 = a1;
  v8 = v5;
  v90 = v8;
  objc_msgSend(v7, "indexesOfObjectsPassingTest:", v89);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v7;
  objc_msgSend(v7, "objectsAtIndexes:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v56 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDifferentRelationshipMultiValueKeys:", v11);

  v12 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:].cold.1(v12);
  v13 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v8, "differentRelationshipMultiValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
  if (v66)
  {
    v64 = *(_QWORD *)v86;
    v65 = v8;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v86 != v64)
          objc_enumerationMutation(obj);
        v67 = v14;
        v15 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v71 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v13 + 3592), "dictionary");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_opt_new();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v8, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = v15;
        objc_msgSend(v17, "valueForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v82 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
              objc_msgSend(v23, "uniqueIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "length"))
                objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, v24);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
          }
          while (v20);
        }

        v25 = (void *)objc_opt_new();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        objc_msgSend(v8, "secondObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueForKey:", v68);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v78 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
              objc_msgSend(v32, "uniqueIdentifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v33, "length"))
                objc_msgSend(v25, "setObject:forKeyedSubscript:", v32, v33);

            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
          }
          while (v29);
        }

        v34 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v16, "allKeys");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setWithArray:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "allKeys");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setByAddingObjectsFromArray:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v39 = v38;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
        v41 = (void *)v71;
        if (v40)
        {
          v42 = v40;
          v43 = *(_QWORD *)v74;
          do
          {
            for (k = 0; k != v42; ++k)
            {
              if (*(_QWORD *)v74 != v43)
                objc_enumerationMutation(v39);
              v45 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k);
              objc_msgSend(v16, "objectForKeyedSubscript:", v45);
              v46 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKeyedSubscript:", v45);
              v47 = objc_claimAutoreleasedReturnValue();
              v48 = (void *)v47;
              if (!(v46 | v47))
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v58, CFSTR("EKDiff.m"), 269, CFSTR("One of these has to be non-nil"));

LABEL_40:
                v50 = v41;
                v51 = v48;
LABEL_41:
                objc_msgSend(v50, "addObject:", v51);
                goto LABEL_42;
              }
              if (!v46)
                goto LABEL_40;
              if (!v47)
              {
                v50 = v72;
                v51 = (void *)v46;
                goto LABEL_41;
              }
              if ((objc_msgSend((id)v46, "isEqual:ignoringProperties:", v47, 0) & 1) == 0)
              {
                +[EKDiff diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:](EKDiff, "diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:", v46, v48, v69);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "setObject:forKeyedSubscript:", v49, v45);

                v41 = (void *)v71;
              }
LABEL_42:

            }
            v42 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v92, 16);
          }
          while (v42);
        }

        if (objc_msgSend(v41, "count"))
          objc_msgSend(v63, "setObject:forKeyedSubscript:", v41, v68);
        if (objc_msgSend(v72, "count"))
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v72, v68);
        if (objc_msgSend(v70, "count"))
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v70, v68);

        v14 = v67 + 1;
        v8 = v65;
        v13 = 0x1E0C99000;
      }
      while (v67 + 1 != v66);
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    }
    while (v66);
  }

  if (objc_msgSend(v63, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v63);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRelationshipMultiValueAdds:", v53);

  }
  if (objc_msgSend(v62, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v62);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRelationshipMultiValueRemoves:", v54);

  }
  if (objc_msgSend(v61, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v61);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRelationshipMultiValueModifies:", v55);

  }
}

uint64_t __84__EKDiff__populateMultiValueRelationshipKeysForDiff_compareUIVisiblePropertiesOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_keysToIgnoreForComputingDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_nonNilObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "secondObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_keysToIgnoreForComputingDiff");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_compareMultiValueRelationshipKey:forObject:againstObject:propertiesToIgnore:", v3, v9, v10, v11) ^ 1;

  }
  return v6;
}

+ (void)_populateIdentityKeysForDiff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateIdentityKeysForDiff:].cold.2();
  objc_msgSend(v4, "_nonNilObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownIdentityKeysForComparison");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __39__EKDiff__populateIdentityKeysForDiff___block_invoke;
  v15 = &unk_1E4785880;
  v17 = a1;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v8, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDifferentIdentityKeys:", v10);

  v11 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateIdentityKeysForDiff:].cold.1(v11);

}

uint64_t __39__EKDiff__populateIdentityKeysForDiff___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_keysToIgnoreForComputingDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_nonNilObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "secondObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_keysToIgnoreForComputingDiff");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v9, v10, v11, v12) ^ 1;

  }
  return v6;
}

+ (void)_populateImmutableKeysForDiff:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateImmutableKeysForDiff:].cold.2();
  objc_msgSend(v4, "_nonNilObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "knownImmutableKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __40__EKDiff__populateImmutableKeysForDiff___block_invoke;
  v15 = &unk_1E4785880;
  v17 = a1;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v8, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDifferentImmutableKeys:", v10);

  v11 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
    +[EKDiff _populateImmutableKeysForDiff:].cold.1(v11);

}

uint64_t __40__EKDiff__populateImmutableKeysForDiff___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "_keysToIgnoreForComputingDiff");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_nonNilObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "secondObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_keysToIgnoreForComputingDiff");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v9, v10, v11, v12) ^ 1;

  }
  return v6;
}

- (id)_multiValueModifiedObjectsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKDiff relationshipMultiValueModifies](self, "relationshipMultiValueModifies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "secondObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)differentKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKDiff differentIdentityKeys](self, "differentIdentityKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v4);

  -[EKDiff differentImmutableKeys](self, "differentImmutableKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  -[EKDiff differentSingleValueKeys](self, "differentSingleValueKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v6);

  -[EKDiff differentRelationshipSingleValueKeys](self, "differentRelationshipSingleValueKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v7);

  -[EKDiff differentRelationshipMultiValueKeys](self, "differentRelationshipMultiValueKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v8);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)summaryDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  void *v50;
  EKDiff *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t ii;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v87;
  uint64_t v88;
  id obj;
  void *v90;
  void *v91;
  uint64_t v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  char *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
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
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v136 = 0u;
  -[EKDiff differentSingleValueKeys](self, "differentSingleValueKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v134;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v134 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
    }
    while (v6);
  }

  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  -[EKDiff differentIdentityKeys](self, "differentIdentityKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v130;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v130 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
    }
    while (v13);
  }

  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  -[EKDiff differentImmutableKeys](self, "differentImmutableKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v126;
    do
    {
      for (k = 0; k != v20; ++k)
      {
        if (*(_QWORD *)v126 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
    }
    while (v20);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  -[EKDiff differentRelationshipSingleValueKeys](self, "differentRelationshipSingleValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v122;
    v87 = *(_QWORD *)v122;
    do
    {
      v28 = 0;
      v88 = v26;
      do
      {
        if (*(_QWORD *)v122 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v28);
        -[EKDiff firstObject](self, "firstObject", v87);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "valueForKey:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        -[EKDiff secondObject](self, "secondObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "valueForKey:", v29);
        v33 = objc_claimAutoreleasedReturnValue();

        v34 = (void *)v33;
        if (v31)
          v35 = v33 == 0;
        else
          v35 = 1;
        if (v35)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, v29);
        }
        else
        {
          v92 = v28;
          v93 = v29;
          objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "knownSingleValueKeysForComparison");
          v37 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "knownIdentityKeysForComparison");
          v38 = objc_claimAutoreleasedReturnValue();
          v91 = (void *)v37;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v37);
          v95 = (void *)v33;
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (void *)v38;
          objc_msgSend(v39, "addObjectsFromArray:", v38);
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v40 = v39;
          v34 = (void *)v33;
          v99 = v40;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
          if (v41)
          {
            v42 = v41;
            v43 = *(_QWORD *)v118;
            do
            {
              v44 = 0;
              v97 = v42;
              do
              {
                if (*(_QWORD *)v118 != v43)
                  objc_enumerationMutation(v99);
                v45 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * v44);
                objc_msgSend(v31, "valueForKey:", v45);
                v46 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "valueForKey:", v45);
                v47 = objc_claimAutoreleasedReturnValue();
                v48 = (void *)v47;
                if (v46)
                  v49 = v47 == 0;
                else
                  v49 = 1;
                if (v49)
                {
                  if (!(v46 | v47))
                    goto LABEL_45;
LABEL_44:
                  objc_msgSend((id)objc_opt_class(), "summaryKeyForChangedProperty:subProperty:", v93, v45);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v51 = self;
                  v52 = v43;
                  v53 = v31;
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = v95;
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v54, v93);

                  objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, v50);

                  v31 = v53;
                  v43 = v52;
                  self = v51;
                  v42 = v97;

                  goto LABEL_45;
                }
                v56 = objc_msgSend((id)v46, "isEqual:", v47);
                if ((v56 & 1) == 0)
                  goto LABEL_44;
LABEL_45:

                ++v44;
              }
              while (v42 != v44);
              v57 = objc_msgSend(v99, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
              v42 = v57;
            }
            while (v57);
          }

          v27 = v87;
          v26 = v88;
          v36 = v91;
          v28 = v92;
        }

        ++v28;
      }
      while (v28 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
    }
    while (v26);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  -[EKDiff differentRelationshipMultiValueKeys](self, "differentRelationshipMultiValueKeys");
  v94 = (id)objc_claimAutoreleasedReturnValue();
  v98 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v113, v140, 16);
  if (v98)
  {
    v96 = *(_QWORD *)v114;
    do
    {
      v58 = 0;
      do
      {
        if (*(_QWORD *)v114 != v96)
          objc_enumerationMutation(v94);
        v100 = v58;
        v59 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)v58);
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v112 = 0u;
        -[EKDiff relationshipMultiValueAdds](self, "relationshipMultiValueAdds");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v59);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v109, v139, 16);
        if (v62)
        {
          v63 = v62;
          v64 = *(_QWORD *)v110;
          do
          {
            for (m = 0; m != v63; ++m)
            {
              if (*(_QWORD *)v110 != v64)
                objc_enumerationMutation(v61);
              v66 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * m);
              v67 = (void *)objc_opt_class();
              objc_msgSend((id)objc_opt_class(), "summaryKeyForMultiValueAddOfPropertyKey:", v59);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "_addObject:forKey:toDiff:", v66, v68, v3);

            }
            v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v109, v139, 16);
          }
          while (v63);
        }

        v107 = 0u;
        v108 = 0u;
        v105 = 0u;
        v106 = 0u;
        -[EKDiff relationshipMultiValueRemoves](self, "relationshipMultiValueRemoves");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "objectForKeyedSubscript:", v59);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v105, v138, 16);
        if (v71)
        {
          v72 = v71;
          v73 = *(_QWORD *)v106;
          do
          {
            for (n = 0; n != v72; ++n)
            {
              if (*(_QWORD *)v106 != v73)
                objc_enumerationMutation(v70);
              v75 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * n);
              v76 = (void *)objc_opt_class();
              objc_msgSend((id)objc_opt_class(), "summaryKeyForMultiValueRemoveOfPropertyKey:", v59);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v76, "_addObject:forKey:toDiff:", v75, v77, v3);

            }
            v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v105, v138, 16);
          }
          while (v72);
        }

        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        -[EKDiff _multiValueModifiedObjectsForKey:](self, "_multiValueModifiedObjectsForKey:", v59);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v101, v137, 16);
        if (v79)
        {
          v80 = v79;
          v81 = *(_QWORD *)v102;
          do
          {
            for (ii = 0; ii != v80; ++ii)
            {
              if (*(_QWORD *)v102 != v81)
                objc_enumerationMutation(v78);
              v83 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * ii);
              v84 = (void *)objc_opt_class();
              objc_msgSend((id)objc_opt_class(), "summaryKeyForMultiValueModifyOfPropertyKey:", v59);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "_addObject:forKey:toDiff:", v83, v85, v3);

            }
            v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v101, v137, 16);
          }
          while (v80);
        }

        v58 = v100 + 1;
      }
      while (v100 + 1 != (char *)v98);
      v98 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v113, v140, 16);
    }
    while (v98);
  }

  return v3;
}

+ (void)_addObject:(id)a3 forKey:(id)a4 toDiff:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "objectForKey:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v7);
  }

}

+ (id)summaryKeyForChangedProperty:(id)a3 subProperty:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
}

+ (id)_summaryKeyForMultiValueChange:(id)a3 ofPropertyKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a4, a3);
}

+ (id)summaryKeyForMultiValueAddOfPropertyKey:(id)a3
{
  return (id)objc_msgSend(a1, "_summaryKeyForMultiValueChange:ofPropertyKey:", CFSTR("add"), a3);
}

+ (id)summaryKeyForMultiValueRemoveOfPropertyKey:(id)a3
{
  return (id)objc_msgSend(a1, "_summaryKeyForMultiValueChange:ofPropertyKey:", CFSTR("remove"), a3);
}

+ (id)summaryKeyForMultiValueModifyOfPropertyKey:(id)a3
{
  return (id)objc_msgSend(a1, "_summaryKeyForMultiValueChange:ofPropertyKey:", CFSTR("modify"), a3);
}

- (id)summaryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKDiff firstObject](self, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDiff firstObject](self, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDiff secondObject](self, "secondObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDiff _summarizeDiffsBetweenFirstObject:secondObject:mutableString:depth:](self, "_summarizeDiffsBetweenFirstObject:secondObject:mutableString:depth:", v5, v6, v4, 0);

    objc_msgSend(v4, "appendString:", CFSTR("\n-------------------------\n"));
    -[EKDiff secondObject](self, "secondObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDiff firstObject](self, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDiff _summarizeDiffsBetweenFirstObject:secondObject:mutableString:depth:](self, "_summarizeDiffsBetweenFirstObject:secondObject:mutableString:depth:", v7, v8, v4, 0);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[EKDiff secondObject](self, "secondObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("No object for comparison, %@ is entirely different"), v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_summarizeDiffsBetweenFirstObject:(id)a3 secondObject:(id)a4 mutableString:(id)a5 depth:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "_basicSummaryWithDepth:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendString:", v13);

  v14 = (void *)objc_opt_class();
  -[EKDiff differentSingleValueKeys](self, "differentSingleValueKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_addSummaryWithDepth:toMutableString:forSingleValueKeys:firstObject:secondObject:", a6, v10, v16, v12, v11);

  v17 = (void *)objc_opt_class();
  -[EKDiff differentIdentityKeys](self, "differentIdentityKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_addSummaryWithDepth:toMutableString:forSingleValueKeys:firstObject:secondObject:", a6, v10, v19, v12, v11);

  v20 = (void *)objc_opt_class();
  -[EKDiff differentImmutableKeys](self, "differentImmutableKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_addSummaryWithDepth:toMutableString:forSingleValueKeys:firstObject:secondObject:", a6, v10, v22, v12, v11);

  v23 = (void *)objc_opt_class();
  -[EKDiff differentRelationshipSingleValueKeys](self, "differentRelationshipSingleValueKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_addSummaryWithDepth:toMutableString:forRelationshipSingleValueKeys:firstObject:secondObject:", a6, v10, v25, v12, v11);

  v26 = (void *)objc_opt_class();
  -[EKDiff differentRelationshipMultiValueKeys](self, "differentRelationshipMultiValueKeys");
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "allObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_addSummaryWithDepth:toMutableString:forRelationshipMultiValueKeys:firstObject:secondObject:", a6, v10, v27, v12, v11);

}

+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forSingleValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v12, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = v12;
    obj = v12;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
          objc_msgSend(v11, "appendString:", CFSTR("\n"));
          objc_msgSend((id)objc_opt_class(), "_addChangeStarIfChangedKey:onObject:", v18, v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_addPaddedHeaderToMutableString:forKey:withDepth:", v11, v19, a3);
          objc_msgSend(v13, "valueForKey:", v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "appendFormat:", CFSTR("%@"), v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    v12 = v21;
  }

}

+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forRelationshipSingleValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int64_t v24;
  id obj;
  uint64_t v26;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v11;
  v29 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v29)
  {
    v26 = *(_QWORD *)v31;
    v24 = a3 + 4;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v26)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v14);
        objc_msgSend(v10, "appendString:", CFSTR("\n"));
        objc_msgSend(a1, "_addPaddedHeaderToMutableString:forKey:withDepth:", v10, v15, a3);
        objc_msgSend(v12, "valueForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "valueForKey:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventStore");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "meltedObjectInStore:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "eventStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "meltedObjectInStore:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(v10, "appendString:", CFSTR("(null)"));
          goto LABEL_13;
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "meltedClass"), "isWeakRelationObject:forKey:", v16, v15))
        {
          objc_msgSend(v16, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "appendFormat:", CFSTR("<weak relation: %@>"), v22);
LABEL_12:

          goto LABEL_13;
        }
        if (v13)
        {
          objc_msgSend(v19, "diffWithObject:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "_summarizeDiffsBetweenFirstObject:secondObject:mutableString:depth:", v19, v21, v10, v24);
          goto LABEL_12;
        }
        objc_msgSend(v19, "_addSummaryWithDepth:toMutableString:indentFirstLine:", v24, v10, 0);
LABEL_13:

        ++v14;
      }
      while (v29 != v14);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v29 = v23;
    }
    while (v23);
  }

}

+ (void)_addSummaryWithDepth:(int64_t)a3 toMutableString:(id)a4 forRelationshipMultiValueKeys:(id)a5 firstObject:(id)a6 secondObject:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  int64_t v33;
  id v34;
  uint64_t v35;
  id obj;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v13;
  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v43;
    v18 = a3 + 8;
    v33 = a3;
    v34 = a7;
    v31 = *(_QWORD *)v43;
    v32 = a1;
    do
    {
      v19 = 0;
      v35 = v16;
      do
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19);
        objc_msgSend(v12, "appendString:", CFSTR("\n"));
        objc_msgSend(a1, "_addPaddedHeaderToMutableString:forKey:withDepth:", v12, v20, a3);
        v37 = v19;
        if (a7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("There is a difference for the multi-valued key: %@"), v20);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v21);
        }
        else
        {
          objc_msgSend(v14, "valueForKey:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (!v22 || !objc_msgSend(v22, "count"))
            objc_msgSend(v12, "appendString:", CFSTR("(null)"));
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v21 = v23;
          v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v39;
            do
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v39 != v26)
                  objc_enumerationMutation(v21);
                v28 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v27);
                objc_msgSend(v14, "eventStore");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "meltedObjectInStore:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v12, "appendString:", CFSTR("\n"));
                if (v28)
                  objc_msgSend(v30, "_addSummaryWithDepth:toMutableString:indentFirstLine:", v18, v12, 1);
                else
                  objc_msgSend(v12, "appendString:", CFSTR("(null)"));

                ++v27;
              }
              while (v25 != v27);
              v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            }
            while (v25);
          }

          a3 = v33;
          a7 = v34;
          v17 = v31;
          a1 = v32;
          v16 = v35;
        }

        v19 = v37 + 1;
      }
      while (v37 + 1 != v16);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v16);
  }

}

+ (void)_addPaddedHeaderToMutableString:(id)a3 forKey:(id)a4 withDepth:(int64_t)a5
{
  int64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5 + 4;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_indentStringAtDepth:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v10);

  objc_msgSend(v8, "stringByPaddingToLength:withString:startingAtIndex:", 20, CFSTR(" "), 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appendFormat:", CFSTR("%@: "), v11);
}

+ (id)_addChangeStarIfChangedKey:(id)a3 onObject:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  v5 = a3;
  objc_msgSend(a4, "changeSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasUnsavedChangeForKey:", v5);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("* %@"), v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

+ (id)_indentStringAtDepth:(int64_t)a3
{
  return (id)objc_msgSend(&stru_1E4789A58, "stringByPaddingToLength:withString:startingAtIndex:", a3, CFSTR(" "), 0);
}

- (id)copyOfObject:(id)a3 alreadyCopiedObjects:(id)a4 madeNewCopy:(BOOL *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    if (a5)
      *a5 = 0;
  }
  else
  {
    if (a5)
      *a5 = 1;
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v9);
  }

  return v11;
}

- (id)changeSetForDiff
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  EKChangeSet *v56;
  void *v57;
  EKChangeSet *v58;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id obj;
  id obja;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  char v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[EKDiff differentSingleValueKeys](self, "differentSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
  v5 = 0x1E0C99000uLL;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v85 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
        -[EKDiff secondObject](self, "secondObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v14 = v13;

        objc_msgSend(v70, "setObject:forKeyedSubscript:", v14, v9);
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_opt_new();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[EKDiff differentRelationshipSingleValueKeys](self, "differentRelationshipSingleValueKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
  if (v68)
  {
    v16 = *(_QWORD *)v81;
    v64 = *(_QWORD *)v81;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v81 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
        -[EKDiff relationshipSingleValueModifies](self, "relationshipSingleValueModifies");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v5 + 3640), "null");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "isEqual:", v21);

        if ((v22 & 1) != 0)
        {
          -[EKDiff secondObject](self, "secondObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "valueForKey:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (v24)
          {
            v26 = v24;
          }
          else
          {
            objc_msgSend(*(id *)(v5 + 3640), "null");
            v26 = (id)objc_claimAutoreleasedReturnValue();
          }
          v35 = v26;

          objc_msgSend(v70, "setObject:forKeyedSubscript:", v35, v18);
        }
        else
        {
          v27 = v5;
          v79 = 0;
          -[EKDiff secondObject](self, "secondObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "valueForKey:", v18);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          -[EKDiff secondObject](self, "secondObject");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "eventStore");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "meltedObjectInStore:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v33 = -[EKDiff copyOfObject:alreadyCopiedObjects:madeNewCopy:](self, "copyOfObject:alreadyCopiedObjects:madeNewCopy:", v32, v15, &v79);
          if (v79)
          {
            objc_msgSend(v20, "changeSetForDiff");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addChanges:", v34);

          }
          objc_msgSend(v70, "setObject:forKeyedSubscript:", v33, v18);

          v5 = v27;
          v16 = v64;
        }

      }
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    }
    while (v68);
  }

  v36 = (void *)MEMORY[0x1E0C99E08];
  -[EKDiff relationshipMultiValueAdds](self, "relationshipMultiValueAdds");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "dictionaryWithDictionary:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[EKDiff relationshipMultiValueModifies](self, "relationshipMultiValueModifies");
  v60 = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (v63)
  {
    v61 = *(_QWORD *)v76;
    v62 = v38;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v76 != v61)
          objc_enumerationMutation(v60);
        v40 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v39);
        objc_msgSend(v38, "objectForKeyedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        v69 = v39;
        if (v41)
        {
          v43 = v41;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v43 = (id)objc_claimAutoreleasedReturnValue();
        }
        v44 = v43;

        -[EKDiff relationshipMultiValueModifies](self, "relationshipMultiValueModifies");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        obja = v40;
        objc_msgSend(v45, "objectForKeyedSubscript:", v40);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v65 = v46;
        objc_msgSend(v46, "allValues");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v72;
          do
          {
            for (k = 0; k != v49; ++k)
            {
              if (*(_QWORD *)v72 != v50)
                objc_enumerationMutation(v47);
              v52 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
              v79 = 0;
              objc_msgSend(v52, "secondObject");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              v54 = -[EKDiff copyOfObject:alreadyCopiedObjects:madeNewCopy:](self, "copyOfObject:alreadyCopiedObjects:madeNewCopy:", v53, v15, &v79);

              if (v79)
              {
                objc_msgSend(v52, "changeSetForDiff");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "addChanges:", v55);

              }
              objc_msgSend(v44, "addObject:", v54);

            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v71, v88, 16);
          }
          while (v49);
        }

        v38 = v62;
        objc_msgSend(v62, "setObject:forKeyedSubscript:", v44, obja);

        v39 = v69 + 1;
      }
      while (v69 + 1 != v63);
      v63 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    }
    while (v63);
  }

  v56 = [EKChangeSet alloc];
  -[EKDiff relationshipMultiValueRemoves](self, "relationshipMultiValueRemoves");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[EKChangeSet initWithSingleValueChanges:multiValueAdditions:multiValueRemovals:](v56, "initWithSingleValueChanges:multiValueAdditions:multiValueRemovals:", v70, v38, v57);

  return v58;
}

- (EKObject)firstObject
{
  return self->_firstObject;
}

- (void)setFirstObject:(id)a3
{
  objc_storeStrong((id *)&self->_firstObject, a3);
}

- (EKObject)secondObject
{
  return self->_secondObject;
}

- (void)setSecondObject:(id)a3
{
  objc_storeStrong((id *)&self->_secondObject, a3);
}

- (int)result
{
  return self->_result;
}

- (void)setResult:(int)a3
{
  self->_result = a3;
}

- (NSSet)differentIdentityKeys
{
  return self->_differentIdentityKeys;
}

- (void)setDifferentIdentityKeys:(id)a3
{
  objc_storeStrong((id *)&self->_differentIdentityKeys, a3);
}

- (NSSet)differentImmutableKeys
{
  return self->_differentImmutableKeys;
}

- (void)setDifferentImmutableKeys:(id)a3
{
  objc_storeStrong((id *)&self->_differentImmutableKeys, a3);
}

- (NSSet)differentSingleValueKeys
{
  return self->_differentSingleValueKeys;
}

- (void)setDifferentSingleValueKeys:(id)a3
{
  objc_storeStrong((id *)&self->_differentSingleValueKeys, a3);
}

- (NSSet)differentRelationshipSingleValueKeys
{
  return self->_differentRelationshipSingleValueKeys;
}

- (void)setDifferentRelationshipSingleValueKeys:(id)a3
{
  objc_storeStrong((id *)&self->_differentRelationshipSingleValueKeys, a3);
}

- (NSSet)differentRelationshipMultiValueKeys
{
  return self->_differentRelationshipMultiValueKeys;
}

- (void)setDifferentRelationshipMultiValueKeys:(id)a3
{
  objc_storeStrong((id *)&self->_differentRelationshipMultiValueKeys, a3);
}

- (NSDictionary)relationshipMultiValueAdds
{
  return self->_relationshipMultiValueAdds;
}

- (void)setRelationshipMultiValueAdds:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipMultiValueAdds, a3);
}

- (NSDictionary)relationshipMultiValueRemoves
{
  return self->_relationshipMultiValueRemoves;
}

- (void)setRelationshipMultiValueRemoves:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipMultiValueRemoves, a3);
}

- (NSDictionary)relationshipMultiValueModifies
{
  return self->_relationshipMultiValueModifies;
}

- (void)setRelationshipMultiValueModifies:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipMultiValueModifies, a3);
}

- (NSDictionary)relationshipSingleValueModifies
{
  return self->_relationshipSingleValueModifies;
}

- (void)setRelationshipSingleValueModifies:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipSingleValueModifies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relationshipSingleValueModifies, 0);
  objc_storeStrong((id *)&self->_relationshipMultiValueModifies, 0);
  objc_storeStrong((id *)&self->_relationshipMultiValueRemoves, 0);
  objc_storeStrong((id *)&self->_relationshipMultiValueAdds, 0);
  objc_storeStrong((id *)&self->_differentRelationshipMultiValueKeys, 0);
  objc_storeStrong((id *)&self->_differentRelationshipSingleValueKeys, 0);
  objc_storeStrong((id *)&self->_differentSingleValueKeys, 0);
  objc_storeStrong((id *)&self->_differentImmutableKeys, 0);
  objc_storeStrong((id *)&self->_differentIdentityKeys, 0);
  objc_storeStrong((id *)&self->_secondObject, 0);
  objc_storeStrong((id *)&self->_firstObject, 0);
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "One or both objects are nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Objects have different identities.  Diff finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Objects have different values.  Diff finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)diffBetweenObject:andObject:compareUIVisiblePropertiesOnly:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Objects are of different classes.  Diff finished", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)diffBetweenObject:(uint64_t)a1 andObject:(uint64_t)a2 compareUIVisiblePropertiesOnly:(os_log_t)log .cold.5(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1A2318000, log, OS_LOG_TYPE_DEBUG, "Computing diff between %@ and %@", (uint8_t *)&v3, 0x16u);
}

+ (void)_populateSingleValueKeysForDiff:(void *)a1 compareUIVisiblePropertiesOnly:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  void *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "differentSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v3, "count") != 0;
  _os_log_debug_impl(&dword_1A2318000, v1, OS_LOG_TYPE_DEBUG, "Single value differences? [%d]", (uint8_t *)v4, 8u);

}

+ (void)_populateSingleValueKeysForDiff:compareUIVisiblePropertiesOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Computing single value differences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_populateSingleValueRelationshipKeysForDiff:(void *)a1 compareUIVisiblePropertiesOnly:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "differentRelationshipSingleValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0(v3, v4);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "differentRelationshipSingleValueKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_3(&dword_1A2318000, v6, v7, "Single value relationship differences? [%d] - %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_populateSingleValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Computing single value relationship differences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_populateMultiValueRelationshipKeysForDiff:(void *)a1 compareUIVisiblePropertiesOnly:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "differentRelationshipMultiValueKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0(v3, v4);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "differentRelationshipMultiValueKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_3(&dword_1A2318000, v6, v7, "Multi value relationship differences? [%d] - %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_populateMultiValueRelationshipKeysForDiff:compareUIVisiblePropertiesOnly:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Computing multi value relationship differences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_populateIdentityKeysForDiff:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "differentIdentityKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0(v3, v4);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "differentIdentityKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_3(&dword_1A2318000, v6, v7, "Identity differences? [%d] - %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_populateIdentityKeysForDiff:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Computing identity differences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)_populateImmutableKeysForDiff:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "differentImmutableKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8_0(v3, v4);
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "differentImmutableKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_3(&dword_1A2318000, v6, v7, "Immutable differences? [%d] - %@", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_populateImmutableKeysForDiff:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_1A2318000, v0, v1, "Computing immutable differences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
