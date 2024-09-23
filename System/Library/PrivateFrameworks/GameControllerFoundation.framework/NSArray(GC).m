@implementation NSArray(GC)

- (id)gc_requiredObjectAtIndex:()GC ofClass:
{
  void *v6;
  id v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: aClass cannot be nil"), "-[NSArray(GC) gc_requiredObjectAtIndex:ofClass:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v8);
  }
  objc_msgSend(a1, "objectAtIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    NSStringFromClass(a4);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Object at index '%llu' has unexpected class '%@'."), a3, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR("GC_NSExceptionErrorDomain");
    v16[1] = CFSTR("GC_NSExceptionErrorCode");
    v17[0] = CFSTR("NSCollectionErrorDomain");
    v17[1] = &unk_1EA4F1640;
    v17[2] = CFSTR("Invalid array.");
    v16[2] = *MEMORY[0x1E0CB2D50];
    v16[3] = CFSTR("NSCollectionErrorIndexKey");
    +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v13;
    v17[4] = v11;
    v16[4] = CFSTR("NSCollectionErrorElementClassKey");
    v16[5] = CFSTR("NSCollectionErrorExpectedClassKey");
    v17[5] = v9;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidCollectionException"), v12, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  return v6;
}

- (_QWORD)gc_requiredObjectAtIndex:()GC ofClass:error:
{
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("*** %s: aClass cannot be nil"), "-[NSArray(GC) gc_requiredObjectAtIndex:ofClass:error:]");
    +[NSException exceptionWithName:reason:userInfo:](&off_1F03A68F8, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  if (objc_msgSend(a1, "count") <= a3
    || (objc_msgSend(a1, "objectAtIndex:", a3), (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!a5)
    {
      v10 = 0;
      goto LABEL_10;
    }
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Missing required element at index '%llu'."), a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB2D68];
    v26[0] = *MEMORY[0x1E0CB2D50];
    v26[1] = v12;
    v27[0] = CFSTR("Invalid array.");
    v27[1] = v11;
    v26[2] = CFSTR("NSCollectionErrorIndexKey");
    +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v13;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 1, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    goto LABEL_8;
  }
  v10 = (id)v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a5)
      goto LABEL_10;
    NSStringFromClass(a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSString stringWithFormat:](NSString_0, "stringWithFormat:", CFSTR("Element at index '%llu' has unexpected class '%@'."), a3, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0CB2D68];
    v24[0] = *MEMORY[0x1E0CB2D50];
    v24[1] = v21;
    v25[0] = CFSTR("Invalid array.");
    v25[1] = v20;
    v24[2] = CFSTR("NSCollectionErrorIndexKey");
    +[NSNumber numberWithUnsignedInteger:](&off_1F03A9E90, "numberWithUnsignedInteger:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v22;
    v25[3] = v19;
    v24[3] = CFSTR("NSCollectionErrorElementClassKey");
    v24[4] = CFSTR("NSCollectionErrorExpectedClassKey");
    v25[4] = v17;
    +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_1F03A6588, "dictionaryWithObjects:forKeys:count:", v25, v24, 5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSError errorWithDomain:code:userInfo:](&off_1F03A6B68, "errorWithDomain:code:userInfo:", CFSTR("NSCollectionErrorDomain"), 3, v23);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
    a5 = 0;
    goto LABEL_10;
  }
  v10 = v10;
  a5 = v10;
LABEL_10:

  return a5;
}

- (id)gc_reversedArray
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(a1, "count"));
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "reverseObjectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_msgSend(v2, "copy");
  return v8;
}

- (id)gc_arrayByTransformingElementsWithOptions:()GC usingBlock:
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  BOOL v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", objc_msgSend(a1, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = a1;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    v13 = a3 & 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(a4 + 16))(a4, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v11 + i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          v16 = 1;
        else
          v16 = v13 == 0;
        if (v16)
          objc_msgSend(v7, "addObject:", v15, (_QWORD)v19);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v11 += i;
    }
    while (v10);
  }

  v17 = (void *)objc_msgSend(v7, "copy");
  return v17;
}

- (uint64_t)gc_arrayByTransformingElementsUsingBlock:()GC
{
  return objc_msgSend(a1, "gc_arrayByTransformingElementsWithOptions:usingBlock:", 0, a3);
}

- (uint64_t)gc_enumerateObjectsWithOptions:()GC usingBlock:
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__NSArray_GC__gc_enumerateObjectsWithOptions_usingBlock___block_invoke;
  v5[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24lu32l8;
  v5[4] = a4;
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:", v5);
}

- (uint64_t)gc_enumerateObjectsUsingBlock:()GC
{
  return objc_msgSend(a1, "gc_enumerateObjectsWithOptions:usingBlock:", 0, a3);
}

@end
