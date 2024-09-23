@implementation CESRRawSpeechProfileItemConverterMediaEntity

- (CESRRawSpeechProfileItemConverterMediaEntity)init
{
  CESRRawSpeechProfileItemConverterMediaEntity *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterMediaEntity;
  v2 = -[CESRRawSpeechProfileItemConverterMediaEntity init](&v6, sel_init);
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
  return CFSTR("com.apple.media.entities");
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  KVItemBuilder *builder;
  id v23;
  id v24;
  void *v25;
  void *v26;
  KVItemBuilder *v27;
  void *v28;
  KVItemBuilder *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8 && objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      v10 = v9;
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("artist")) & 1) != 0)
      {
        v11 = 202;
        goto LABEL_16;
      }
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("playlist")) & 1) != 0)
      {
        v11 = 216;
LABEL_16:

        +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:](CESRRawSpeechProfileTools, "placeholderItemIdWithCategoryName:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        builder = self->_builder;
        v40 = 0;
        v23 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 5, v13, &v40);
        v24 = v40;
        objc_msgSend(v8, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "orthography");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = self->_builder;
        v39 = v24;
        -[KVItemBuilder addFieldWithType:value:error:](v27, "addFieldWithType:value:error:", v11, v26, &v39);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v39;

        if (!v28)
          goto LABEL_18;
        v29 = self->_builder;
        v38 = v15;
        -[KVItemBuilder buildItemWithError:](v29, "buildItemWithError:", &v38);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v38;

        v15 = v30;
        if (!v16)
        {
LABEL_18:
          v31 = (void *)MEMORY[0x1E0CB35C8];
          v41[0] = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to process word: \"%@\" due to builder error."), v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = *MEMORY[0x1E0CB3388];
          v42[0] = v32;
          v42[1] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (a5 && v34)
            *a5 = objc_retainAutorelease(v34);

          v16 = 0;
        }

        goto LABEL_23;
      }

      v37 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected namespace: %@ for category: %@"), v10, CFSTR("com.apple.media.entities"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v37;
      v19 = 3;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawSpeechProfile contains a MediaEntity item with an unexpected number of speech words (expected only 1): %@ namespace: %@"), v8, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      v19 = 1;
    }
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), v19, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a5 && v20)
      *a5 = objc_retainAutorelease(v20);

    v16 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2938];
    v48[0] = CFSTR("rawSpeechProfile contains a MediaEntity item missing speech words.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 0;
    if (a5 && v14)
    {
      v15 = objc_retainAutorelease(v14);
      v16 = 0;
      *a5 = v15;
    }
  }
LABEL_23:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
