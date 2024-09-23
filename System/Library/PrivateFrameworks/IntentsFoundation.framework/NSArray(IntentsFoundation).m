@implementation NSArray(IntentsFoundation)

- (id)if_compactMap:()IntentsFoundation
{
  return _IFArrayTransform(a1, a3);
}

- (void)if_enumerateAsynchronouslyInSequenceOnQueue:()IntentsFoundation block:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = malloc_type_calloc(1uLL, 1uLL, 0x100004077774924uLL);
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__9;
  v33 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __98__NSArray_IntentsFoundation__if_enumerateAsynchronouslyInSequenceOnQueue_block_completionHandler___block_invoke;
  v21[3] = &unk_1E9778A18;
  v13 = v11;
  v22 = v13;
  v14 = v8;
  v23 = v14;
  v15 = v10;
  v24 = v15;
  v26 = &v28;
  v27 = v12;
  v16 = v9;
  v25 = v16;
  v17 = MEMORY[0x1D8259490](v21);
  v18 = (void *)v29[5];
  v29[5] = v17;

  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29[5] + 16))(v29[5], 0, v19, v20);
  _Block_object_dispose(&v28, 8);

}

- (id)if_map:()IntentsFoundation
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__NSArray_IntentsFoundation__if_map___block_invoke;
  v8[3] = &unk_1E9778840;
  v9 = v4;
  v5 = v4;
  _IFArrayTransform(a1, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)if_firstObjectWithValue:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__NSArray_IntentsFoundation__if_firstObjectWithValue_forKey___block_invoke;
  v12[3] = &unk_1E9778890;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "if_firstObjectPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)if_firstObjectPassingTest:()IntentsFoundation
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)if_objectsPassingTest:()IntentsFoundation
{
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (v4[2](v4, v12))
          objc_msgSend(v5, "setObject:atIndexedSubscript:", v12, v9++, (_QWORD)v14);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)if_flatMap:()IntentsFoundation
{
  void (**v4)(id, _QWORD);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10));
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
        {

          v13 = 0;
          goto LABEL_14;
        }
        v12 = (void *)v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v5, "addObjectsFromArray:", v12);
        else
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }

  v13 = (void *)objc_msgSend(v5, "copy");
LABEL_14:

  return v13;
}

- (void)if_mapAsynchronously:()IntentsFoundation completionHandler:
{
  _IFAsyncArrayTransform(a1, 0, 0, a3, a4);
}

- (id)if_mapConcurrently:()IntentsFoundation
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__NSArray_IntentsFoundation__if_mapConcurrently___block_invoke;
  v8[3] = &unk_1E9778840;
  v9 = v4;
  v5 = v4;
  _IFConcurrentArrayTransform(a1, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)if_mapAsynchronouslyOnQueue:()IntentsFoundation transform:completionHandler:
{
  _IFAsyncArrayTransform(a1, 0, a3, a4, a5);
}

- (id)if_compactMapConcurrently:()IntentsFoundation
{
  return _IFConcurrentArrayTransform(a1, a3);
}

- (void)if_flatMapAsynchronously:()IntentsFoundation completionHandler:
{
  _IFAsyncArrayTransform(a1, 1, 0, a3, a4);
}

- (void)if_flatMapAsynchronouslyOnQueue:()IntentsFoundation transform:completionHandler:
{
  _IFAsyncArrayTransform(a1, 1, a3, a4, a5);
}

- (id)if_escapedComponentsJoinedByString:()IntentsFoundation forLocale:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __75__NSArray_IntentsFoundation__if_escapedComponentsJoinedByString_forLocale___block_invoke;
  v16 = &unk_1E9778868;
  v17 = v6;
  v18 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "if_compactMap:", &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", v9, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)if_arrayByRemovingObject:()IntentsFoundation
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);

  return v5;
}

- (id)if_arrayByRemovingObjectsInArray:()IntentsFoundation
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectsInArray:", v4);

  return v5;
}

- (id)if_objectsWithValue:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__NSArray_IntentsFoundation__if_objectsWithValue_forKey___block_invoke;
  v12[3] = &unk_1E9778890;
  v13 = v7;
  v14 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(a1, "if_objectsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)if_objectsWithBoolValue:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  char v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NSArray_IntentsFoundation__if_objectsWithBoolValue_forKey___block_invoke;
  v10[3] = &unk_1E97788B8;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  objc_msgSend(a1, "if_objectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)if_objectsWithIntValue:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__NSArray_IntentsFoundation__if_objectsWithIntValue_forKey___block_invoke;
  v10[3] = &unk_1E97788E0;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  objc_msgSend(a1, "if_objectsPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)if_firstObjectWithBoolValue:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  char v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__NSArray_IntentsFoundation__if_firstObjectWithBoolValue_forKey___block_invoke;
  v10[3] = &unk_1E97788B8;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  objc_msgSend(a1, "if_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)if_firstObjectWithIntValue:()IntentsFoundation forKey:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  int v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__NSArray_IntentsFoundation__if_firstObjectWithIntValue_forKey___block_invoke;
  v10[3] = &unk_1E97788E0;
  v11 = v6;
  v12 = a3;
  v7 = v6;
  objc_msgSend(a1, "if_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)if_objectsOfClass:()IntentsFoundation
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__NSArray_IntentsFoundation__if_objectsOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "if_objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)if_objectsNotOfClass:()IntentsFoundation
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__NSArray_IntentsFoundation__if_objectsNotOfClass___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "if_objectsPassingTest:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)if_enumerateAsynchronously:()IntentsFoundation completionHandler:
{
  return objc_msgSend(a1, "if_enumerateAsynchronouslyOnQueue:block:completionHandler:", 0, a3, a4);
}

- (void)if_enumerateAsynchronouslyOnQueue:()IntentsFoundation block:completionHandler:
{
  NSObject *v8;
  void (**v9)(id, uint64_t, uint64_t, _QWORD *);
  char v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  const char *label;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id obj;
  id v25;
  _QWORD block[4];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  NSObject *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v23 = a5;
  v10 = v8 != 0;
  v11 = dispatch_group_create();
  v12 = objc_msgSend(a1, "count");
  v25 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = a1;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  v21 = v12;
  v22 = v8;
  if (v13)
  {
    v14 = 0;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v35 = 0;
        v36 = &v35;
        v37 = 0x2020000000;
        v38 = 0;
        dispatch_group_enter(v11);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke;
        v30[3] = &unk_1E9778928;
        v31 = v25;
        v33 = &v43;
        v32 = v11;
        v34 = &v35;
        v9[2](v9, v17, v14 + i, v30);
        v18 = *((_BYTE *)v36 + 24) == 0;

        v10 |= v18;
        _Block_object_dispose(&v35, 8);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
      v14 += i;
    }
    while (v13);
  }

  if (v23)
  {
    if ((v10 & 1) != 0)
    {
      v19 = v22;
      if (!v22)
      {
        v19 = MEMORY[0x1E0C80D38];
        label = dispatch_queue_get_label(MEMORY[0x1E0C80D38]);
        if (label != dispatch_queue_get_label(0))
        {
          dispatch_get_global_queue(0, 0);
          v19 = objc_claimAutoreleasedReturnValue();
        }
      }
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __88__NSArray_IntentsFoundation__if_enumerateAsynchronouslyOnQueue_block_completionHandler___block_invoke_2;
      block[3] = &unk_1E9778950;
      v27 = v23;
      v28 = &v43;
      v29 = v21;
      v22 = v19;
      dispatch_group_notify(v11, v19, block);

    }
    else
    {
      (*((void (**)(id, uint64_t, uint64_t))v23 + 2))(v23, v21, v44[5]);
    }
  }
  _Block_object_dispose(&v43, 8);

}

- (void)if_enumerateAsynchronouslyInSequence:()IntentsFoundation completionHandler:
{
  const char *label;
  const char *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  label = dispatch_queue_get_label(MEMORY[0x1E0C80D38]);
  v8 = dispatch_queue_get_label(0);
  v9 = a4;
  v10 = a3;
  if (label == v8)
  {
    v11 = MEMORY[0x1E0C80D38];
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v11;
  objc_msgSend(a1, "if_enumerateAsynchronouslyInSequenceOnQueue:block:completionHandler:", v11, v10, v9);

}

+ (id)if_arrayWithObjectIfNonNil:()IntentsFoundation
{
  objc_class *v3;
  id v4;
  void *v5;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C99DE8];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithObjects:", v4, 0);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
