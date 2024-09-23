@implementation DDMLGetTaggerModel

void __DDMLGetTaggerModel_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  DDMLTaggerModel *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  +[DDMLTaggerModel currentTaggerModel](DDMLTaggerModel, "currentTaggerModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(*(id *)(a1 + 32), "assetLocaleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "embeddingLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
  else
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__1249;
    v21 = __Block_byref_object_dispose__1250;
    v22 = 0;
    LDEnumerateAssetDataItems_delayInitStub(COERCE_DOUBLE(3221225472));
    v8 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend((id)v18[5], "URLByAppendingPathComponent:", CFSTR("model.plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithContentsOfURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("models"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = [DDMLTaggerModel alloc];
    v14 = -[DDMLTaggerModel initWithEmbeddingLocale:modelDictionary:baseURL:](v13, "initWithEmbeddingLocale:modelDictionary:baseURL:", v5, v12, v18[5]);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    +[DDMLTaggerModel setCurrentTaggerModel:](DDMLTaggerModel, "setCurrentTaggerModel:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    _Block_object_dispose(&v17, 8);

  }
}

void __DDMLGetTaggerModel_block_invoke_2(uint64_t a1, void *a2, double a3)
{
  double Helper_x8__kLDAssetTypeDataDetectorHead;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  Helper_x8__kLDAssetTypeDataDetectorHead = gotLoadHelper_x8__kLDAssetTypeDataDetectorHead(a3);
  if (objc_msgSend(v7, "isEqualToString:", **(_QWORD **)(v6 + 2104), Helper_x8__kLDAssetTypeDataDetectorHead))
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v8 + 40))
    {
      objc_msgSend(a2, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "hasPrefix:", CFSTR("/System/Library/LinguisticData")))
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
      v9 = v11;
    }
    else
    {
      v10 = a2;
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v10;
    }

  }
}

@end
