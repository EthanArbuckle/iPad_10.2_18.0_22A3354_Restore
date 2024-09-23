@implementation CESRRawSpeechProfileItemConverterAppInfo

- (CESRRawSpeechProfileItemConverterAppInfo)init
{
  CESRRawSpeechProfileItemConverterAppInfo *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterAppInfo;
  v2 = -[CESRRawSpeechProfileItemConverterAppInfo init](&v6, sel_init);
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
  return CFSTR("com.apple.siri.applications");
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  KVItemBuilder *builder;
  id v14;
  id v15;
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
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint8_t buf[4];
  const char *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    v27 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CESRRawSpeechProfileItemConverterAppInfo vocabularyItemFromSpeechWords:speechNamespace:error:]";
      _os_log_debug_impl(&dword_1B3E5F000, v27, OS_LOG_TYPE_DEBUG, "%s rawSpeechProfile contains an AppInfo item missing speech words.", buf, 0xCu);
    }
    goto LABEL_20;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawSpeechProfile contains an AppInfo item with an unexpected number of speech words (expected only 1): %@"), v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v28;
    v32 = 1;
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("appname")) & 1) == 0)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected namespace: %@ expected: %@"), v9, CFSTR("appname"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v33;
    v32 = 3;
LABEL_16:
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), v32, v30);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (a5 && v34)
      *a5 = objc_retainAutorelease(v34);

LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:](CESRRawSpeechProfileTools, "placeholderItemIdWithCategoryName:", CFSTR("appinfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orthography");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  builder = self->_builder;
  v39 = 0;
  v14 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 3, v10, &v39);
  v15 = v39;
  v16 = self->_builder;
  v38 = v15;
  -[KVItemBuilder addFieldWithType:value:error:](v16, "addFieldWithType:value:error:", 102, v12, &v38);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v38;

  if (!v17)
    goto LABEL_7;
  v19 = self->_builder;
  v37 = v18;
  -[KVItemBuilder buildItemWithError:](v19, "buildItemWithError:", &v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v37;

  v18 = v21;
  if (!v20)
  {
LABEL_7:
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v40[0] = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to process word: \"%@\" due to builder error."), v12);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = *MEMORY[0x1E0CB3388];
    v41[0] = v23;
    v41[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a5 && v25)
      *a5 = objc_retainAutorelease(v25);

    v20 = 0;
  }

LABEL_21:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
