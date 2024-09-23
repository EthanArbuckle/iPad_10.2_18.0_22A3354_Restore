@implementation EKObject(Shared)

- (NSDictionary)cachedMeltedObjects
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__18;
  v9 = __Block_byref_object_dispose__18;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__EKObject_Shared__cachedMeltedObjects__block_invoke;
  v4[3] = &unk_1E4785190;
  v4[4] = self;
  v4[5] = &v5;
  -[EKObject _performWithLock:](self, "_performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDictionary *)v2;
}

- (void)setCachedMeltedObjects:()Shared
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EKObject_Shared__setCachedMeltedObjects___block_invoke;
  v6[3] = &unk_1E47853B0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EKObject _performWithLock:](self, "_performWithLock:", v6);

}

+ (BOOL)_compareKnownKeys:()Shared forObject:againstObject:compareIdentityKeys:compareImmutableKeys:propertiesToIgnore:
{
  _BOOL8 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  char v18;

  v9 = a7;
  v10 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v15 == v16)
  {
    v18 = 1;
  }
  else if (v10
         && !objc_msgSend(a1, "_compareIdentityKeysForObject:againstObject:propertiesToIgnore:", v15, v16, v17))
  {
    v18 = 0;
  }
  else
  {
    v18 = objc_msgSend(a1, "_compareNonIdentityKeys:forObject:againstObject:compareImmutableKeys:propertiesToIgnore:", v14, v15, v16, v9, v17);
  }

  return v18;
}

+ (BOOL)_compareKnownKeys:()Shared forObject:againstObject:compareImmutableKeys:propertiesToIgnore:
{
  return objc_msgSend(a1, "_compareKnownKeys:forObject:againstObject:compareIdentityKeys:compareImmutableKeys:propertiesToIgnore:", a3, a4, a5, 1, a6, a7);
}

+ (BOOL)_compareMultiValueRelationshipKeys:()Shared forObject:againstObject:propertiesToIgnore:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(a1, "_compareMultiValueRelationshipKey:forObject:againstObject:propertiesToIgnore:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v11, v12, v13, (_QWORD)v21))
        {
          v19 = 0;
          goto LABEL_11;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareNonIdentityKeys:()Shared forObject:againstObject:compareImmutableKeys:propertiesToIgnore:
{
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
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  char v35;
  id v38;
  id v39;
  void *v40;

  v11 = a3;
  v39 = a4;
  v38 = a5;
  v12 = a7;
  v13 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownRelationshipMultiValueKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownRelationshipSingleValueKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownSingleValueKeysForComparison");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "knownImmutableKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = v21;
  if (v11)
  {
    v25 = v15;
    objc_msgSend(v15, "intersectSet:", v11);
    objc_msgSend(v18, "intersectSet:", v11);
    objc_msgSend(v21, "intersectSet:", v11);
    objc_msgSend(v24, "intersectSet:", v11);
  }
  else
  {
    v25 = v15;
    if (!a6)
    {

      v24 = 0;
    }
  }
  objc_msgSend(v18, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v38;
  v27 = v39;
  v29 = objc_msgSend(a1, "_compareSingleValueRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v26, v39, v38, v12);

  if (!v29
    || (objc_msgSend(v25, "allObjects"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(a1, "_compareMultiValueRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v30, v39, v38, v12), v30, !v31))
  {
    v35 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v40, "allObjects");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(a1, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v32, v39, v38, v12);

  if (!v33)
  {
    v35 = 0;
LABEL_14:
    v28 = v38;
    v27 = v39;
    goto LABEL_11;
  }
  if (!v24)
  {
    v35 = 1;
    goto LABEL_14;
  }
  objc_msgSend(v24, "allObjects");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v38;
  v27 = v39;
  v35 = objc_msgSend(a1, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v34, v39, v38, v12);

LABEL_11:
  return v35;
}

+ (BOOL)_compareSingleValueRelationshipKeys:()Shared forObject:againstObject:propertiesToIgnore:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        if (!objc_msgSend(a1, "_compareSingleValueRelationshipKey:forObject:againstObject:propertiesToIgnore:ignoreIdentityKeys:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v11, v12, v13, 0, (_QWORD)v21))
        {
          v19 = 0;
          goto LABEL_11;
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v16)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_11:

  return v19;
}

+ (BOOL)_compareIdentityKeysForObject:()Shared againstObject:propertiesToIgnore:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(a1, "knownIdentityKeysForComparison");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "_compareNonRelationshipKeys:forObject:againstObject:propertiesToIgnore:", v11, v10, v9, v8);

  return (char)a1;
}

- (void)validate:()Shared .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "privacyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Reached maximum depth while validating root object %{public}@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

- (void)singleChangedValueForKey:()Shared .cold.1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_11();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "backingObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7_4(&dword_1A2318000, v5, v6, "Property %@ was unavailable on backingObject %@. %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

- (void)meltedAndCachedSingleRelationObjectForKey:()Shared .cold.1()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_11();
  v2 = v1;
  objc_msgSend((id)OUTLINED_FUNCTION_9_1(), "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_0_1(&dword_1A2318000, v4, v5, "Failed to get melted object for frozen object related by key %@. Event store is %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

@end
