@implementation CESRRawSpeechProfileItemConverterFindMy

- (CESRRawSpeechProfileItemConverterFindMy)init
{
  CESRRawSpeechProfileItemConverterFindMy *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterFindMy;
  v2 = -[CESRRawSpeechProfileItemConverterFindMy init](&v6, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x1E0D42BF0]);
    builder = v2->_builder;
    v2->_builder = v3;

  }
  return v2;
}

- (id)speechCategoryId
{
  return CFSTR("com.apple.icloud.fmip");
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  KVItemBuilder *builder;
  id v12;
  id v13;
  void *v14;
  void *v15;
  KVItemBuilder *v16;
  void *v17;
  id v18;
  KVItemBuilder *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];
  _QWORD v40[2];
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("deviceNames")) & 1) != 0)
      {
        +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:](CESRRawSpeechProfileTools, "placeholderItemIdWithCategoryName:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        builder = self->_builder;
        v38 = 0;
        v12 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 21, v10, &v38);
        v13 = v38;
        objc_msgSend(v8, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "orthography");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = self->_builder;
        v37 = v13;
        -[KVItemBuilder addFieldWithType:value:error:](v16, "addFieldWithType:value:error:", 950, v15, &v37);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v37;

        if (!v17)
          goto LABEL_7;
        v19 = self->_builder;
        v36 = v18;
        -[KVItemBuilder buildItemWithError:](v19, "buildItemWithError:", &v36);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v36;

        v18 = v21;
        if (!v20)
        {
LABEL_7:
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v39[0] = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to process word: \"%@\" due to builder error."), v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v39[1] = *MEMORY[0x1E0CB3388];
          v40[0] = v23;
          v40[1] = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (a5 && v25)
            *a5 = objc_retainAutorelease(v25);

          v20 = 0;
        }

        goto LABEL_21;
      }
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected namespace: %@ for category: %@"), v9, CFSTR("com.apple.icloud.fmip"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v32;
      v31 = 3;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawSpeechProfile contains a FindMy item with an unexpected number of speech words (expected only 1): %@ namespace: %@"), v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      v31 = 1;
    }
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), v31, v18);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (a5 && v33)
      *a5 = objc_retainAutorelease(v33);

    v20 = 0;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2938];
    v46[0] = CFSTR("rawSpeechProfile contains a FindMy item missing speech words.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v10);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v28;
    v20 = 0;
    if (a5 && v28)
    {
      v18 = objc_retainAutorelease(v28);
      v20 = 0;
      *a5 = v18;
    }
  }
LABEL_21:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
