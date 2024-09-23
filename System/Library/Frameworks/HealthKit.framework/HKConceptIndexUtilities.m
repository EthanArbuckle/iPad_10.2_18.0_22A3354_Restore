@implementation HKConceptIndexUtilities

- (HKConceptIndexUtilities)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)keyPathRemovingFirstComponentFromKeyPath:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKConceptIndexUtilities.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("."));
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("No remaining key-path"));
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "substringFromIndex:", v8 + v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)firstComponentForKeyPath:(id)a3 error:(id *)a4
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKConceptIndexUtilities.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  if (objc_msgSend(v7, "length"))
  {
    v8 = objc_msgSend(v7, "rangeOfString:", CFSTR("."));
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v7, "substringToIndex:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to get first component for empty key-path"));
    v10 = 0;
  }

  return v10;
}

+ (id)keyPaths:(id)a3 prefix:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__HKConceptIndexUtilities_keyPaths_prefix___block_invoke;
    v9[3] = &unk_1E37F0270;
    v10 = v5;
    objc_msgSend(a3, "hk_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)objc_msgSend(a3, "copy");
  }

  return v7;
}

uint64_t __43__HKConceptIndexUtilities_keyPaths_prefix___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), a2);
}

+ (id)indexedCodingsForCodingCollections:(id)a3 context:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKConceptIndexUtilities.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("codingCollections"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKConceptIndexUtilities.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

LABEL_3:
  if ((unint64_t)objc_msgSend(v9, "count") <= 0x7F)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2020000000;
    v33 = 1;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__27;
    v28 = __Block_byref_object_dispose__27;
    v29 = 0;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__HKConceptIndexUtilities_indexedCodingsForCodingCollections_context_error___block_invoke;
    v20[3] = &unk_1E37F0298;
    v22 = &v24;
    v23 = &v30;
    v14 = v13;
    v21 = v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v20);
    if (*((_BYTE *)v31 + 24))
    {
      v12 = (void *)objc_msgSend(v14, "copy");
    }
    else
    {
      v15 = (id)v25[5];
      v16 = v15;
      if (v15)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v15);
        else
          _HKLogDroppedError(v15);
      }

      v12 = 0;
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Unable to generate concept index for array of length %lu for context %@"), objc_msgSend(v9, "count"), v11);
    v12 = 0;
  }

  return v12;
}

void __76__HKConceptIndexUtilities_indexedCodingsForCodingCollections_context_error___block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v4;
  void *v5;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  +[HKIndexableObject indexableObjectWithObject:index:error:](HKIndexableObject, "indexableObjectWithObject:index:error:", a2, a3, &obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

}

+ (id)conceptsForIndexedConcepts:(id)a3 expectedCount:(int64_t)a4 context:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v9 = a3;
  v10 = a5;
  +[HKIndexableObject indexableObjectsByApplyingOutermostIndex:expectedCount:error:](HKIndexableObject, "indexableObjectsByApplyingOutermostIndex:expectedCount:error:", v9, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__27;
    v26 = __Block_byref_object_dispose__27;
    v27 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __82__HKConceptIndexUtilities_conceptsForIndexedConcepts_expectedCount_context_error___block_invoke;
    v18[3] = &unk_1E37F02C0;
    v19 = v10;
    v20 = &v22;
    v21 = &v28;
    objc_msgSend(v11, "hk_map:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (*((_BYTE *)v29 + 24))
    {
      v14 = v12;
    }
    else
    {
      v15 = (id)v23[5];
      v16 = v15;
      if (v15)
      {
        if (a6)
          *a6 = objc_retainAutorelease(v15);
        else
          _HKLogDroppedError(v15);
      }

      v14 = 0;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

id __82__HKConceptIndexUtilities_conceptsForIndexedConcepts_expectedCount_context_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  void *v9;
  id obj;

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  v7 = HKIndexableObjectCheckCardinalityForIndexRestore(v4, 1, v5, (uint64_t)&obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    objc_msgSend(v3, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

  return v9;
}

+ (id)medicalCodingCollectionForIndexableObject:(id)a3 keyPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(v7, "codingsForKeyPath:error:", v8, a5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("No remaining key-path"));
    v9 = 0;
  }

  return v9;
}

+ (BOOL)applyConcepts:(id)a3 toIndexableObject:(id)a4 keyPath:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  BOOL v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v10)
      v12 = objc_msgSend(v10, "applyConcepts:forKeyPath:error:", v9, v11, a6);
    else
      v12 = HKIndexableObjectCheckCardinalityForIndexRestore(objc_msgSend(v9, "count"), 0, (uint64_t)v11, (uint64_t)a6);
    v13 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("No remaining key-path"));
    v13 = 0;
  }

  return v13;
}

+ (BOOL)assignError:(id *)a3 forInvalidKeyPath:(id)a4 inClass:(Class)a5
{
  void *v7;
  id v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = a4;
  NSStringFromClass(a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v7, "hk_assignError:code:format:", a3, 3, CFSTR("%@ does not support codings for key path %@"), v9, v8);

  return (char)a3;
}

@end
