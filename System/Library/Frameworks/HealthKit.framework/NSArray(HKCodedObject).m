@implementation NSArray(HKCodedObject)

+ (uint64_t)indexableKeyPathsWithPrefix:()HKCodedObject
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HKCodedObject.m"), 20, CFSTR("Indexing by key-path is not supported for NSArray"));

  return MEMORY[0x1E0C9AA60];
}

- (id)codingsForKeyPath:()HKCodedObject error:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSArray+HKCodedObject.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

  }
  if ((unint64_t)objc_msgSend(a1, "count") <= 0x7F)
  {
    v9 = &unk_1EE3A8508;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__42;
    v27 = __Block_byref_object_dispose__42;
    v28 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __50__NSArray_HKCodedObject__codingsForKeyPath_error___block_invoke;
    v18[3] = &unk_1E37F3008;
    v11 = v9;
    v19 = v11;
    v22 = &v23;
    v20 = v7;
    v12 = v10;
    v21 = v12;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v18);
    v13 = (void *)v24[5];
    if (v13)
    {
      v14 = v13;
      v15 = v14;
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError(v14);

      v8 = 0;
    }
    else
    {
      v8 = (void *)objc_msgSend(v12, "copy");
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Unable to generate concept index for array of length %lu for key-path %@"), objc_msgSend(a1, "count"), v7);
    v8 = 0;
  }

  return v8;
}

- (BOOL)applyConcepts:()HKCodedObject forKeyPath:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  +[HKIndexableObject indexableObjectsByApplyingOutermostIndex:expectedCount:error:](HKIndexableObject, "indexableObjectsByApplyingOutermostIndex:expectedCount:error:", v8, objc_msgSend(a1, "count"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__42;
    v25 = __Block_byref_object_dispose__42;
    v26 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __57__NSArray_HKCodedObject__applyConcepts_forKeyPath_error___block_invoke;
    v17[3] = &unk_1E37F3030;
    v20 = &v21;
    v18 = v10;
    v19 = v9;
    objc_msgSend(a1, "enumerateObjectsUsingBlock:", v17);
    v12 = (void *)v22[5];
    v13 = v12 == 0;
    if (v12)
    {
      v14 = v12;
      v15 = v14;
      if (a5)
        *a5 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError(v14);

    }
    _Block_object_dispose(&v21, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
