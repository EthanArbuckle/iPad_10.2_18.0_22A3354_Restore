@implementation CESRRawSpeechProfileItemConverterCustomTerm

- (CESRRawSpeechProfileItemConverterCustomTerm)init
{
  CESRRawSpeechProfileItemConverterCustomTerm *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterCustomTerm;
  v2 = -[CESRRawSpeechProfileItemConverterCustomTerm init](&v6, sel_init);
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
  return CFSTR("com.apple.siri.vocabularyupdates");
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unint64_t v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  KVItemBuilder *builder;
  id v30;
  id v31;
  void *v32;
  void *v33;
  KVItemBuilder *v34;
  void *v35;
  id v36;
  KVItemBuilder *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CESRRawSpeechProfileItemConverterCustomTerm *v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[CESRRawSpeechProfileItemConverterCustomTerm vocabularyItemFromSpeechWords:speechNamespace:error:]";
      v60 = 2112;
      v61 = v9;
      _os_log_debug_impl(&dword_1B3E5F000, v20, OS_LOG_TYPE_DEBUG, "%s rawSpeechProfile contains a SiriKit custom vocabulary item missing speech words. namespace: %@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawSpeechProfile contains a SiriKit custom vocabulary item with an unexpected number of speech words (expected only 1): %@ namespace: %@"), v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a5 && v24)
      *a5 = objc_retainAutorelease(v24);

LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
  v10 = v9;
  if (_reverseLookupFieldTypeFromOntologyLabel_onceToken != -1)
    dispatch_once(&_reverseLookupFieldTypeFromOntologyLabel_onceToken, &__block_literal_global_149);
  objc_msgSend((id)_reverseLookupFieldTypeFromOntologyLabel_lookupCache, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "BOOLValue") & 1) == 0)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v12 = (id)_reverseLookupFieldTypeFromOntologyLabel_validFieldTypes;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
    if (v13)
    {
      v14 = v13;
      v46 = self;
      v15 = *(_QWORD *)v51;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v51 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
          v18 = KVFieldTypeFromNumber() - 1;
          if (v18 > 0x10)
            v19 = 0;
          else
            v19 = off_1E6733B48[v18];
          if (objc_msgSend(v10, "isEqualToString:", v19))
          {
            v26 = v17;

            objc_msgSend((id)_reverseLookupFieldTypeFromOntologyLabel_lookupCache, "setObject:forKey:", v26, v10);
            v11 = v26;
            goto LABEL_26;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, buf, 16);
        if (v14)
          continue;
        break;
      }
LABEL_26:
      self = v46;
    }

  }
  v27 = KVFieldTypeFromNumber();

  if (!KVFieldTypeIsValid())
    goto LABEL_36;
  +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:](CESRRawSpeechProfileTools, "placeholderItemIdWithCategoryName:", CFSTR("customterm"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  builder = self->_builder;
  v49 = 0;
  v30 = (id)-[KVItemBuilder setItemType:itemId:error:](builder, "setItemType:itemId:error:", 1, v28, &v49);
  v31 = v49;
  objc_msgSend(v8, "firstObject");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "orthography");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = self->_builder;
  v48 = v31;
  -[KVItemBuilder addFieldWithType:value:error:](v34, "addFieldWithType:value:error:", v27, v33, &v48);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v48;

  if (!v35)
    goto LABEL_31;
  v37 = self->_builder;
  v47 = v36;
  -[KVItemBuilder buildItemWithError:](v37, "buildItemWithError:", &v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v47;

  v36 = v39;
  if (!v38)
  {
LABEL_31:
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v54[0] = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to process word: \"%@\" due to builder error."), v33);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = *MEMORY[0x1E0CB3388];
    v55[0] = v41;
    v55[1] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 6, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (a5 && v43)
      *a5 = objc_retainAutorelease(v43);

    v38 = 0;
  }

LABEL_37:
  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
