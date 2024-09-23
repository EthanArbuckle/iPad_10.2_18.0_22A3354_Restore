@implementation CESRRawSpeechProfileItemConverterContact

- (CESRRawSpeechProfileItemConverterContact)init
{
  CESRRawSpeechProfileItemConverterContact *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterContact;
  v2 = -[CESRRawSpeechProfileItemConverterContact init](&v6, sel_init);
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
  return CFSTR("com.apple.contact.people");
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8 || !objc_msgSend(v8, "count"))
    goto LABEL_12;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("contacts")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("company")))
    {
      -[CESRRawSpeechProfileItemConverterContact _companyContactFromSpeechWords:error:](self, "_companyContactFromSpeechWords:error:", v8, a5);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected namespace: %@ expected: %@"), v9, CFSTR("contacts"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 3, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5 && v15)
      *a5 = objc_retainAutorelease(v15);

LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  -[CESRRawSpeechProfileItemConverterContact _standardContactFromSpeechWords:error:](self, "_standardContactFromSpeechWords:error:", v8, a5);
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v11 = (void *)v10;
LABEL_13:

  return v11;
}

- (id)_standardContactFromSpeechWords:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  KVItemBuilder *builder;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  KVItemBuilder *v18;
  void *v19;
  void *v20;
  void *v21;
  KVItemBuilder *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  uint64_t v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:](CESRRawSpeechProfileTools, "placeholderItemIdWithCategoryName:", CFSTR("contacts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  builder = self->_builder;
  v49 = 0;
  v8 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 2, v6, &v49);
  v9 = v49;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v5;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
  if (!v10)
    goto LABEL_10;
  v11 = v10;
  v12 = *(_QWORD *)v46;
  v40 = v6;
  while (2)
  {
    v13 = 0;
    v14 = v9;
    do
    {
      if (*(_QWORD *)v46 != v12)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
      v16 = objc_msgSend(v15, "tagType") - 1;
      if (v16 >= 6)
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v54 = *MEMORY[0x1E0CB2938];
        v30 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "tagValue");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("rawSpeechProfile contains unrecognized tag: \"%@\" in contact speech words"), v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (a4 && v33)
        {
          v34 = objc_retainAutorelease(v33);
          *a4 = v34;
        }
        v9 = v14;
        goto LABEL_22;
      }
      v17 = qword_1B3F751A8[v16];
      v18 = self->_builder;
      objc_msgSend(v15, "orthography");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v14;
      -[KVItemBuilder addFieldWithType:value:error:](v18, "addFieldWithType:value:error:", v17, v19, &v44);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v44;

      if (!v20)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v52[0] = *MEMORY[0x1E0CB2938];
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "orthography");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "tagValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("failed to process word: \"%@\" with tag: \"%@\" due to builder error."), v28, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = *MEMORY[0x1E0CB3388];
        v53[0] = v32;
        v53[1] = v9;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        if (a4 && v37)
          *a4 = objc_retainAutorelease(v37);

LABEL_22:
        v6 = v40;

        v26 = obj;
        goto LABEL_23;
      }
      ++v13;
      v14 = v9;
    }
    while (v11 != v13);
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v56, 16);
    v6 = v40;
    if (v11)
      continue;
    break;
  }
LABEL_10:
  v21 = v9;

  v22 = self->_builder;
  v43 = v9;
  -[KVItemBuilder buildItemWithError:](v22, "buildItemWithError:", &v43);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v43;

  if (!v23)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB3388];
    v50[0] = *MEMORY[0x1E0CB2938];
    v50[1] = v25;
    v51[0] = CFSTR("failed to build item");
    v51[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (a4 && v27)
    {
      v28 = objc_retainAutorelease(v27);
      *a4 = v28;
    }
LABEL_23:

    v23 = 0;
  }

  return v23;
}

- (id)_companyContactFromSpeechWords:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  KVItemBuilder *builder;
  id v16;
  id v17;
  void *v18;
  KVItemBuilder *v19;
  void *v20;
  id v21;
  KVItemBuilder *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:](CESRRawSpeechProfileTools, "placeholderItemIdWithCategoryName:", CFSTR("contacts"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      builder = self->_builder;
      v30 = 0;
      v16 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 2, v9, &v30);
      v17 = v30;
      objc_msgSend(v6, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "orthography");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = self->_builder;
      v29 = v17;
      -[KVItemBuilder addFieldWithType:value:error:](v19, "addFieldWithType:value:error:", 64, v11, &v29);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v29;

      if (v20)
      {
        v22 = self->_builder;
        v28 = v21;
        -[KVItemBuilder buildItemWithError:](v22, "buildItemWithError:", &v28);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v28;

        if (v14)
        {
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {
        v10 = v21;
      }
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v31[0] = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to process word: \"%@\" due to builder error."), v11);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v31[1] = *MEMORY[0x1E0CB3388];
      v32[0] = v13;
      v32[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (a4 && v25)
        *a4 = objc_retainAutorelease(v25);

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2938];
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("rawSpeechProfile contains unexpected number of company speech words. Expected: 1 found: %@"), v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v34[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (a4 && v12)
      {
        v13 = objc_retainAutorelease(v12);
        *a4 = v13;
      }
    }

    v14 = 0;
    goto LABEL_16;
  }
  v14 = 0;
LABEL_17:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
