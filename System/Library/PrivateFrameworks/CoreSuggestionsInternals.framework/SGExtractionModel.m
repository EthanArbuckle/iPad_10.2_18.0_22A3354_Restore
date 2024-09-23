@implementation SGExtractionModel

+ (id)loadLazyPlistWithBasename:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("plplist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGExtractionModel.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relPath"));

  }
  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filesystemPathForAssetDataRelativePath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_error_impl(&dword_1C3607000, v9, OS_LOG_TYPE_ERROR, "Unable to resolve path: %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0D815D0], "dictionaryWithPath:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (!v8)
  {
    sgLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v9;
      _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "Unable to load plplist content for %@: %@", buf, 0x16u);
    }

LABEL_10:
    v8 = 0;
  }

  return v8;
}

+ (id)inputDictFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "inputDictFromTaggedCharacterRanges:usingTokenMapping:forModel:pflTraining:hasEvent:", v9, v8, v7, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)inputDictFromTaggedCharacterRanges:(id)a3 usingTokenMapping:(id)a4 forModel:(id)a5 pflTraining:(BOOL)a6 hasEvent:(BOOL)a7
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
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
  void *v40;
  id v41;
  _BOOL4 v43;
  void *v44;
  void *context;
  void *v46;
  id v47;
  id v48;
  _BOOL4 v49;
  id obj;
  unint64_t v51;
  id v52;
  id v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t *v67;
  id v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _BYTE v79[128];
  uint64_t v80;

  v43 = a7;
  v49 = a6;
  v80 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = __Block_byref_object_copy__8229;
  v75[4] = __Block_byref_object_dispose__8230;
  v76 = 0;
  v46 = v9;
  v12 = objc_msgSend(v9, "count");
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 1;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __104__SGExtractionModel_inputDictFromTaggedCharacterRanges_usingTokenMapping_forModel_pflTraining_hasEvent___block_invoke;
  v61[3] = &unk_1E7DAAB30;
  v68 = a1;
  v69 = v12;
  v52 = v11;
  v62 = v52;
  v66 = v75;
  v63 = v10;
  v67 = &v71;
  v48 = v13;
  v64 = v48;
  v70 = v49;
  v47 = v14;
  v65 = v47;
  v54 = v63;
  objc_msgSend(v63, "enumerateKeysAndObjectsUsingBlock:", v61);
  if (!*((_BYTE *)v72 + 24))
  {
    v41 = 0;
    goto LABEL_28;
  }
  v51 = 0;
LABEL_3:
  if (objc_msgSend(v46, "count") > v51)
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v46, "objectAtIndexedSubscript:", v51);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v44 = v15;
    objc_msgSend(v15, "tags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
    if (!v17)
      goto LABEL_20;
    v55 = *(_QWORD *)v58;
    obj = v16;
    while (1)
    {
      v18 = 0;
      v56 = v17;
      do
      {
        if (*(_QWORD *)v58 != v55)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v19, "substringWithRange:", 0, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)MEMORY[0x1C3BD4F6C]();
          v24 = objc_msgSend(a1, "featureDimensionForInputSection:forModel:", v21, v52);
          objc_msgSend(v19, "substringFromIndex:", 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            if (v24 < 2)
            {
              objc_msgSend(v48, "objectForKeyedSubscript:", v21);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v77[0] = v35;
              v77[1] = &unk_1E7E0C008;
              v77[2] = &unk_1E7E0C008;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v26, v36);

              if (v49)
              {
                objc_msgSend(v47, "objectForKeyedSubscript:", v21);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectAtIndexedSubscript:", v51);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "setObject:atIndexedSubscript:", v26, 0);
LABEL_16:

              }
            }
            else
            {
              objc_msgSend(v48, "objectForKeyedSubscript:", v21);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v51);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v78[0] = v28;
              v78[1] = &unk_1E7E0C008;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v26, "unsignedIntValue"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v78[2] = v29;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E7E0BFF0, v30);

              if (v49)
              {
                objc_msgSend(v47, "objectForKeyedSubscript:", v21);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "objectAtIndexedSubscript:", v51);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "firstObject");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "setObject:atIndexedSubscript:", &unk_1E7E0BFF0, objc_msgSend(v26, "unsignedIntValue"));

                goto LABEL_16;
              }
            }
          }

          objc_autoreleasePoolPop(v23);
        }

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v56 != v18);
      v16 = obj;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
      if (!v17)
      {
LABEL_20:

        objc_autoreleasePoolPop(context);
        ++v51;
        goto LABEL_3;
      }
    }
  }
  if (v49)
  {
    v37 = (void *)objc_opt_new();
    objc_msgSend(v47, "setObject:forKeyedSubscript:", v37, CFSTR("polarity_true"));

    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("polarity_true"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v43)
      v40 = &unk_1E7E0BFF0;
    else
      v40 = &unk_1E7E0C008;
    objc_msgSend(v38, "addObject:", v40);

    objc_msgSend(a1, "writeDummyRecordInStore");
    objc_msgSend(a1, "writeToBiomeStreamWithInput:", v47);
  }
  v41 = v48;
LABEL_28:

  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(v75, 8);

  return v41;
}

+ (void)writeToBiomeStreamWithInput:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  __int128 buf;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81560];
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "compress:lowMemory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  sgLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(v8, "length");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEFAULT, "JsonData: %tu bytes", (uint8_t *)&buf, 0xCu);
    }

    v10 = objc_msgSend(MEMORY[0x1E0D024C0], "newPrivateStreamDefaultConfigurationWithStoreBasePath:", CFSTR("/private/var/mobile/Library/PrivateBiomeStream/SemlPlugin/"));
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02790]), "initWithPrivateStreamIdentifier:storeConfig:", CFSTR("ExamplePrivateStream"), v10);
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    objc_msgSend(v12, "publisherWithStartTime:endTime:maxEvents:lastN:reversed:", 0, 0, &unk_1E7E0BFD8, 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_2;
    v20[3] = &unk_1E7DAAB78;
    v20[4] = &buf;
    v20[5] = &v21;
    v16 = (id)objc_msgSend(v14, "sinkWithCompletion:receiveInput:", &__block_literal_global_8266, v20);
    v17 = v22[3];
    if (v17 == objc_msgSend(&unk_1E7E0BFD8, "unsignedIntValue"))
    {
      v19[0] = v15;
      v19[1] = 3221225472;
      v19[2] = __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_3;
      v19[3] = &unk_1E7DAABA0;
      v19[4] = &buf;
      objc_msgSend(v12, "pruneWithPredicateBlock:", v19);
    }
    +[ExampleEvent eventWithData:dataVersion:](ExampleEvent, "eventWithData:dataVersion:", v8, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sendEvent:", v18);

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&buf, 8);

  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "JSON data could not be generated: %@", (uint8_t *)&buf, 0xCu);
  }

}

+ (void)writeDummyRecordInStore
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, void *);
  void *v9;
  NSObject *v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D398]), "initWithBundleIdentifier:", CFSTR("com.apple.CoreSuggestions.SemlPlugin"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "deleteAllSavedRecordsWithCompletion:", &__block_literal_global_124);
    v4 = (void *)objc_opt_new();
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __44__SGExtractionModel_writeDummyRecordInStore__block_invoke_131;
    v9 = &unk_1E7DAABE8;
    v10 = &unk_1E7E11518;
    objc_msgSend(v3, "saveRecordWithData:recordInfo:completion:", v4);

    v5 = v10;
  }
  else
  {
    sgLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("com.apple.CoreSuggestions.SemlPlugin");
      _os_log_error_impl(&dword_1C3607000, v5, OS_LOG_TYPE_ERROR, "SemlTraining failed to get a DESRecordStore for %@", buf, 0xCu);
    }
  }

}

+ (unint64_t)featureDimensionForInputSection:(id)a3 forModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "modelDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputDescriptionsByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "multiArrayConstraint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shape");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");

  }
  else
  {
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v5;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "featureDimensionForInputSection: Model doesn't have description for inputSection: %@", (uint8_t *)&v15, 0xCu);
    }

    v12 = 1;
  }

  return v12;
}

+ (id)modelOutputFromOutputMapping:(id)a3 modelOutput:(id)a4 modelInput:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8229;
  v24 = __Block_byref_object_dispose__8230;
  v25 = 0;
  v25 = (id)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__SGExtractionModel_modelOutputFromOutputMapping_modelOutput_modelInput___block_invoke;
  v15[3] = &unk_1E7DAAC10;
  v11 = v9;
  v18 = &v20;
  v19 = a1;
  v16 = v11;
  v12 = v10;
  v17 = v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)argMaxForSequence:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  if (v6 == 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "integerValue"));

    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    if (v11 >= 1)
    {
      v12 = 0;
      do
      {
        objc_msgSend(a1, "argMaxForOutputIndex:index:shape:", v4, v12, v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:atIndexedSubscript:", v13, v12);

        ++v12;
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

      }
      while (v15 > v12);
    }
  }
  else
  {
    objc_msgSend(a1, "argMaxForOutputIndex:index:shape:", v4, 0, v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v16, 0);

  }
  return v9;
}

+ (id)argMaxForLastOutput:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "argMaxForOutputIndex:index:shape:", v4, 0xFFFFFFFFLL, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)argMaxForOutputIndex:(id)a3 index:(int)a4 shape:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  unsigned int v20;
  void *v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  objc_msgSend(v7, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v7, "count") > 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "integerValue") < 1)
  {
    v20 = -1;
  }
  else
  {
    v9 = 0;
    v20 = -1;
    v10 = -1.0;
    do
    {
      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v14, "doubleValue");
      if (v15 > v10)
      {
        objc_msgSend(v14, "doubleValue");
        v10 = v16;
        v20 = v9;
      }

      ++v9;
    }
    while (objc_msgSend(v8, "integerValue") > v9);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)enrichTaggedCharacterRangesWithModelOutput:(id)a3 usingInputCharacterRanges:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __objc2_class **v8;
  void *v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v8 = off_1E7DA6000;
  v9 = v6;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v40 != v34)
          objc_enumerationMutation(obj);
        objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "count"))
        {
          v12 = 0;
          do
          {
            if (objc_msgSend(v7, "count") <= v12)
            {
              v13 = (void *)objc_opt_new();
              objc_msgSend(v7, "addObject:", v13);

            }
            objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("NONE"));

            if ((v15 & 1) == 0)
            {
              objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_alloc(MEMORY[0x1E0CB3940]);
              +[SGTaggedCharacterRange annotationTypeUniqueIdentifier:](SGTaggedCharacterRange, "annotationTypeUniqueIdentifier:", 10);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@_%@"), v18, v19);
              objc_msgSend(v16, "addObject:", v20);

              v8 = off_1E7DA6000;
              v6 = v9;

            }
            ++v12;
          }
          while (objc_msgSend(v11, "count") > v12);
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v7, "count"))
  {
    v21 = 0;
    do
    {
      v32 = objc_alloc(v8[134]);
      objc_msgSend(v6, "objectAtIndexedSubscript:", v21);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "tags");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v21);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v33);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "range");
      v26 = v25;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v32, "initWithAnnotationType:tags:range:text:", 4, v22, v24, v26, v28);
      objc_msgSend(v31, "addObject:", v29);

      v8 = off_1E7DA6000;
      v6 = v9;

      ++v21;
    }
    while (objc_msgSend(v7, "count") > v21);
  }

  return v31;
}

+ (void)cleanModelAssets
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD v13[3];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13[0] = CFSTR("ReminderModel");
  v13[1] = CFSTR("StructuredEventModel");
  v13[2] = CFSTR("structuredEventGazetteer");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(a1, "cleanLegacyModelsDirectoryOfModelsNamed:", v8);
        objc_msgSend(a1, "cleanModelsDirectoryOfModelsNamed:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

}

+ (void)cleanModelsDirectoryOfModelsNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelsDirectoryName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPaths suggestionsSubdirectory:creatingDirectoriesIfNeeded:](SGPaths, "suggestionsSubdirectory:creatingDirectoriesIfNeeded:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "fileExistsAtPath:", v7))
  {
    objc_msgSend(v5, "enumeratorAtPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11 = (void *)v9;
      *(_QWORD *)&v10 = 138412290;
      v17 = v10;
      do
      {
        if (objc_msgSend(v11, "containsString:", v4, v17))
        {
          objc_msgSend(v7, "stringByAppendingPathComponent:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          v13 = objc_msgSend(v5, "removeItemAtPath:error:", v12, &v18);
          v14 = v18;

          if (!v13 || v14)
          {
            sgLogHandle();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              v20 = v11;
              _os_log_error_impl(&dword_1C3607000, v15, OS_LOG_TYPE_ERROR, "SGExtractionModel: Couldn't delete model file: %@", buf, 0xCu);
            }

          }
        }
        objc_msgSend(v8, "nextObject");
        v16 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v16;
      }
      while (v16);
    }

  }
}

+ (void)cleanLegacyModelsDirectoryOfModelsNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGPaths suggestionsDirectoryAfterCreatingIfNeeded:](SGPaths, "suggestionsDirectoryAfterCreatingIfNeeded:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = (void *)v7;
    *(_QWORD *)&v8 = 138412290;
    v15 = v8;
    do
    {
      if (objc_msgSend(v9, "containsString:", v3, v15)
        && ((objc_msgSend(v9, "containsString:", CFSTR("mlmodel")) & 1) != 0
         || objc_msgSend(v9, "containsString:", CFSTR("mlmodelc"))))
      {
        objc_msgSend(v5, "stringByAppendingPathComponent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        v11 = objc_msgSend(v4, "removeItemAtPath:error:", v10, &v16);
        v12 = v16;

        if (!v11 || v12)
        {
          sgLogHandle();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            v18 = v9;
            _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "SGExtractionModel: Couldn't delete model file: %@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(v6, "nextObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v14;
    }
    while (v14);
  }

}

+ (id)modelsDirectoryName
{
  return CFSTR("SGExtractionModels");
}

void __73__SGExtractionModel_modelOutputFromOutputMapping_modelOutput_modelInput___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("mapping"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IS_TIME_DISTRIBUTED"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v13 = (void *)objc_opt_class();
  v34 = a1;
  v35 = (void *)v9;
  if (v12)
  {
    v32 = v8;
    v33 = v7;
    objc_msgSend(v13, "argMaxForSequence:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_opt_new();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v38 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "integerValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            sgRemindersLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_1C3607000, v22, OS_LOG_TYPE_ERROR, "Unable to map output to label", buf, 2u);
            }

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v18);
    }

    v7 = v33;
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v34 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v15, v33);
    v8 = v32;
  }
  else
  {
    objc_msgSend(v13, "argMaxForLastOutput:", v9);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v16, "integerValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 40), "valueForKey:", CFSTR("L"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "shape");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "unsignedIntegerValue");

      for (; v28; --v28)
        objc_msgSend(v23, "addObject:", v15);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v34 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v23, v7);
    }
    else
    {
      sgRemindersLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v29, OS_LOG_TYPE_ERROR, "Found no Lemma input when trying to extend output label to sequence length.", buf, 2u);
      }

      v30 = *(_QWORD *)(*(_QWORD *)(v34 + 48) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = 0;

      *a4 = 1;
    }

  }
}

void __44__SGExtractionModel_writeDummyRecordInStore__block_invoke_131(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sgLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_1C3607000, v6, OS_LOG_TYPE_ERROR, "Failed to send session stats %@ to Fides. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "Successfully sent stats %@ to Fides.", (uint8_t *)&v9, 0xCu);
  }

}

void __44__SGExtractionModel_writeDummyRecordInStore__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    sgLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_error_impl(&dword_1C3607000, v3, OS_LOG_TYPE_ERROR, "Failed to delete existing records in DESRecordStore. Error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

uint64_t __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v4;

  result = objc_msgSend(a2, "timestamp");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

BOOL __49__SGExtractionModel_writeToBiomeStreamWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timestamp");
  return v3 <= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __104__SGExtractionModel_inputDictFromTaggedCharacterRanges_usingTokenMapping_forModel_pflTraining_hasEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  unint64_t v26;
  void *v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  id v41;
  void *v42;
  id obj;
  _QWORD v44[3];
  uint8_t buf[4];
  id v46;
  _QWORD v47[3];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 80), "featureDimensionForInputSection:forModel:");
  v7 = objc_alloc(MEMORY[0x1E0C9E970]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v8;
  v48[1] = &unk_1E7E0BFF0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v7, "initWithShape:dataType:error:", v10, 131104, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

  v42 = (void *)v12;
  if (v12)
  {
    v14 = *(_QWORD *)(a1 + 88);
    v40 = a1;
    if (v14)
    {
      v15 = 0;
      *(_QWORD *)&v13 = 138412290;
      v38 = v13;
      do
      {
        if (v6)
        {
          for (i = 0; i != v6; ++i)
          {
            if (v6 < 2)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v41);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", &stru_1E7DB83A8);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              if (!v18)
              {
                sgLogHandle();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v38;
                  v46 = v41;
                  _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "inputDictFromTaggedCharacterRanges: '' not present for inputSection: %@", buf, 0xCu);
                }

                v18 = v17;
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15, v38);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v44[0] = v19;
              v44[1] = &unk_1E7E0C008;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v44[2] = v22;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v18, v23);

              a1 = v40;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v47[0] = v17;
              v47[1] = &unk_1E7E0C008;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
              v18 = (id)objc_claimAutoreleasedReturnValue();
              v47[2] = v18;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKeyedSubscript:", &unk_1E7E0C008, v19);
            }

          }
          v14 = *(_QWORD *)(a1 + 88);
        }
        ++v15;
      }
      while (v15 < v14);
    }
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v42, v41, v38);
    if (*(_BYTE *)(a1 + 96))
    {
      v24 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(v40 + 56), "setObject:forKeyedSubscript:", v24, v41);

      if (*(_QWORD *)(v40 + 88))
      {
        v26 = 0;
        *(_QWORD *)&v25 = 138412290;
        v39 = v25;
        do
        {
          v27 = (void *)objc_opt_new();
          if (v6)
          {
            for (j = 0; j != v6; ++j)
            {
              if (v6 < 2)
              {
                objc_msgSend(*(id *)(v40 + 40), "objectForKeyedSubscript:", v41);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", &stru_1E7DB83A8);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v31)
                {
                  sgLogHandle();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v39;
                    v46 = v41;
                    _os_log_error_impl(&dword_1C3607000, v34, OS_LOG_TYPE_ERROR, "inputDictFromTaggedCharacterRanges: '' not present for inputSection: %@", buf, 0xCu);
                  }

                  v31 = &unk_1E7E0C008;
                }
                v30 = v27;
                v32 = v31;
              }
              else
              {
                if (!j)
                {
                  v29 = (void *)objc_opt_new();
                  objc_msgSend(v27, "addObject:", v29);

                }
                objc_msgSend(v27, "objectAtIndex:", 0, v39);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v30;
                v32 = &unk_1E7E0C008;
              }
              objc_msgSend(v30, "addObject:", v32, v39);

            }
          }
          objc_msgSend(*(id *)(v40 + 56), "objectForKeyedSubscript:", v41, v39);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "addObject:", v27);

          ++v26;
        }
        while (v26 < *(_QWORD *)(v40 + 88));
      }
    }
  }
  else
  {
    sgLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v46 = v37;
      _os_log_error_impl(&dword_1C3607000, v36, OS_LOG_TYPE_ERROR, "Unable to create input MLMultiArray: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    *a4 = 1;
  }

}

- (id)currentModelURLForModelName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[16];

  v3 = a3;
  +[SGAsset localeAsset](SGAsset, "localeAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v3, CFSTR("mlmodelc"));

  objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v6);
  }
  else
  {
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v8, OS_LOG_TYPE_ERROR, "SGExtractioNModel: Unable to find URL for model", buf, 2u);
    }

    v7 = 0;
  }

  return v7;
}

@end
