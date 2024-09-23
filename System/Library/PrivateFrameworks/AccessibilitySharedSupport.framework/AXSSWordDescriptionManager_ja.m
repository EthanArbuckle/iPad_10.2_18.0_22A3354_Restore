@implementation AXSSWordDescriptionManager_ja

- (id)_convertString:(id)a3 ifNeededForHiragana:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (v4)
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    if (objc_msgSend(v8, "applyTransform:reverse:range:updatedRange:", *MEMORY[0x1E0C99878], 0, 0, objc_msgSend(v6, "length"), 0))
    {
      v7 = (void *)objc_msgSend(v8, "copy");

    }
    else
    {
      AXLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXSSWordDescriptionManager_ja _convertString:ifNeededForHiragana:].cold.1((uint64_t)v6, v9);

      v7 = v6;
    }

  }
  return v7;
}

- (id)descriptionForWord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, uint64_t);
  void *v14;
  AXSSWordDescriptionManager_ja *v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[4];
  _QWORD v22[5];
  id v23;

  v4 = a3;
  -[AXSSWordDescriptionManager managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__7;
    v22[4] = __Block_byref_object_dispose__7;
    v23 = 0;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0x7FFFFFFFFFFFFFFFLL;
    v7 = objc_msgSend(v4, "length");
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __52__AXSSWordDescriptionManager_ja_descriptionForWord___block_invoke;
    v14 = &unk_1E5F99D18;
    v19 = v22;
    v20 = v21;
    v15 = self;
    v8 = v6;
    v16 = v8;
    v17 = v4;
    v18 = v5;
    objc_msgSend(v17, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, &v11);
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("、"), v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v22, 8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_convertString:(uint64_t)a1 ifNeededForHiragana:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AF5CC000, a2, OS_LOG_TYPE_ERROR, "Unable to convert Hiragana string to Katakana: %@", (uint8_t *)&v2, 0xCu);
}

@end
