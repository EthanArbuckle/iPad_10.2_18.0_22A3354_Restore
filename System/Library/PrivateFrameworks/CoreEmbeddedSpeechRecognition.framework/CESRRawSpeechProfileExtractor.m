@implementation CESRRawSpeechProfileExtractor

+ (id)extractLocaleFromRawSpeechProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("rawSpeechProfile is nil or not an instance of NSDictionary.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4 && v9)
      *a4 = objc_retainAutorelease(v9);
    goto LABEL_11;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("language"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rawSpeechProfile is missing locale identifier with key: %@"), CFSTR("language"), *MEMORY[0x1E0CB2938]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a4 && v13)
      *a4 = objc_retainAutorelease(v13);

LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v7;
}

+ (id)extractItemsFromRawSpeechProfile:(id)a3 converter:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v25;
  void *v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "_extractUserDataFromRawSpeechProfile:error:", v7, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v9, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = v11;
      v28 = *(_QWORD *)v30;
      v25 = v7;
      v26 = v10;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v28)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v15 = v9;
          objc_msgSend(v9, "objectForKey:", v14, v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend((id)objc_opt_class(), "_isValidCategoryWithName:data:error:", v14, v16, a5))
            goto LABEL_17;
          objc_msgSend(v8, "speechCategoryId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v14, "hasSuffix:", v17);

          if (v18)
          {
            objc_msgSend((id)objc_opt_class(), "_extractEntitiesFromCategoryData:categoryName:error:", v16, v14, a5);
            v19 = objc_claimAutoreleasedReturnValue();
            if (!v19)
              goto LABEL_17;
            v20 = (void *)v19;
            objc_msgSend((id)objc_opt_class(), "_convertItemsFromEntities:categoryName:converter:error:", v19, v14, v8, a5);
            v21 = objc_claimAutoreleasedReturnValue();
            if (!v21)
            {

LABEL_17:
              v23 = 0;
              v9 = v15;
              v7 = v25;
              v10 = v26;
              goto LABEL_18;
            }
            v22 = (void *)v21;
            objc_msgSend(v26, "addObjectsFromArray:", v21);

          }
          v9 = v15;
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        v7 = v25;
        v10 = v26;
        if (v12)
          continue;
        break;
      }
    }

    v23 = v10;
LABEL_18:

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)_extractUserDataFromRawSpeechProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v27[0] = CFSTR("rawSpeechProfile is nil or not an instance of NSDictionary.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4 && v9)
      *a4 = objc_retainAutorelease(v9);
    goto LABEL_15;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("userData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2938];
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("rawSpeechProfile user data value for key: %@ has unexpected class: %@ expected %@ or %@"), CFSTR("userData"), v10, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (a4 && v21)
        *a4 = objc_retainAutorelease(v21);

LABEL_15:
      v11 = 0;
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_dictionaryFromUserDataArray:error:", v6, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
    v6 = v7;
  }
  v11 = v7;
LABEL_16:

  return v11;
}

+ (id)_dictionaryFromUserDataArray:(id)a3 error:(id *)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  objc_class *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    obj = v6;
LABEL_3:
    v10 = v5;
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      objc_msgSend(v12, "objectForKey:", CFSTR("categoryName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v26 = (void *)MEMORY[0x1E0CB35C8];
        v43 = *MEMORY[0x1E0CB2938];
        v27 = (void *)MEMORY[0x1E0CB3940];
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("rawSpeechProfile has unexpected category name value class: %@ expected: %@"), v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (a4 && v30)
          *a4 = objc_retainAutorelease(v30);

LABEL_22:
        v5 = v10;
        v6 = obj;
        goto LABEL_23;
      }
      objc_msgSend(v12, "objectForKey:", CFSTR("categoryData"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v10, "setObject:forKey:", v14, v13);
      }
      else
      {
        v15 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v40 = "+[CESRRawSpeechProfileExtractor _dictionaryFromUserDataArray:error:]";
          v41 = 2112;
          v42 = v13;
          _os_log_debug_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_DEBUG, "%s Skipping category with name: %@ found to have no category data.", buf, 0x16u);
        }
      }

      if (v8 == ++v11)
      {
        v6 = obj;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        v5 = v10;
        if (v8)
          goto LABEL_3;
        goto LABEL_14;
      }
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2938];
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("rawSpeechProfile has unexpected category class: %@ expected: %@"), v13, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (!a4)
      goto LABEL_22;
    v5 = v10;
    v6 = obj;
    if (v24)
    {
      v25 = objc_retainAutorelease(v24);
      *a4 = v25;
    }
LABEL_23:

    v16 = 0;
    goto LABEL_24;
  }
LABEL_14:

  v16 = v5;
LABEL_24:

  return v16;
}

+ (BOOL)_isValidCategoryWithName:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  void **v18;
  uint64_t *v19;
  void *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = 1;
      goto LABEL_10;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2938];
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("rawSpeechProfile has unexpected value class for category: %@. Found: %@ expected: %@"), v7, v13, v15, v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v16;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v28;
    v19 = &v27;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2938];
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("rawSpeechProfile contains category name with unrecognized format. Found: %@ expected: %@"), v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v16;
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = (void **)v30;
    v19 = &v29;
  }
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (a5 && v24)
    *a5 = objc_retainAutorelease(v24);

  v9 = 0;
LABEL_10:

  return v9;
}

+ (id)_extractEntitiesFromCategoryData:(id)a3 categoryName:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CESRRawSpeechProfileWord *v14;
  CESRRawSpeechProfileWord *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (!objc_msgSend(v6, "count"))
  {
LABEL_15:
    v16 = v7;
    goto LABEL_20;
  }
  v8 = 0;
  v34 = v7;
  v35 = v6;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "objectForKey:", CFSTR("attributes"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
        goto LABEL_14;
    }
    else
    {
      v10 = v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2938];
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("rawSpeechProfile has malformed entity words array at index: %@ in category: %@"), v28, v36);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (a5 && v31)
        *a5 = objc_retainAutorelease(v31);

      v16 = 0;
      goto LABEL_20;
    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    if (objc_msgSend(v10, "count"))
      break;
LABEL_13:
    v7 = v34;
    objc_msgSend(v34, "addObject:", v11);

    v6 = v35;
LABEL_14:

    if (++v8 >= (unint64_t)objc_msgSend(v6, "count"))
      goto LABEL_15;
  }
  v12 = 0;
  while (1)
  {
    objc_msgSend(v10, "objectAtIndex:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    v14 = -[CESRRawSpeechProfileWord initWithSpeechWordDictionary:]([CESRRawSpeechProfileWord alloc], "initWithSpeechWordDictionary:", v13);
    if (!v14)
      break;
    v15 = v14;
    objc_msgSend(v11, "addObject:", v14);

    if (++v12 >= (unint64_t)objc_msgSend(v10, "count"))
      goto LABEL_13;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v37 = *MEMORY[0x1E0CB2938];
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("rawSpeechProfile has malformed entity word dictionary at item index: %@ word index: %@ in category: %@"), v19, v20, v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (a5 && v23)
    *a5 = objc_retainAutorelease(v23);

  v16 = 0;
  v7 = v34;
  v6 = v35;
LABEL_20:

  return v16;
}

+ (id)_extractNamespaceFromCategoryName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?<=urn:)(.+)(?=:)"), 1, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v6)
  {
    v8 = objc_msgSend(v6, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to extract namespace from category name: %@"), v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.speech-profile.tools"), 2, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (a4 && v13)
        *a4 = objc_retainAutorelease(v13);

      v15 = 0;
    }
    else
    {
      objc_msgSend(v5, "substringWithRange:", v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v16 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "+[CESRRawSpeechProfileExtractor _extractNamespaceFromCategoryName:error:]";
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create regular expression, error: %@", buf, 0x16u);
    }
    v15 = 0;
    if (a4 && v7)
    {
      v15 = 0;
      *a4 = objc_retainAutorelease(v7);
    }
  }

  return v15;
}

+ (id)_convertItemsFromEntities:(id)a3 categoryName:(id)a4 converter:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t *v16;
  void *v17;
  void *v18;
  id v19;
  os_log_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  os_log_t v24;
  id v25;
  void *v26;
  os_log_t v27;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend((id)objc_opt_class(), "_extractNamespaceFromCategoryName:error:", v10, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v25 = 0;
    goto LABEL_24;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  if (!objc_msgSend(v9, "count"))
  {
LABEL_16:
    v25 = v13;
    goto LABEL_23;
  }
  v35 = a6;
  v36 = v10;
  v14 = 0;
  v15 = 0;
  v16 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  while (1)
  {
    objc_msgSend(v9, "objectAtIndex:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v17, "count"))
    {
      v20 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = v20;
        objc_msgSend(v21, "numberWithUnsignedInteger:", v15);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v39 = "+[CESRRawSpeechProfileExtractor _convertItemsFromEntities:categoryName:converter:error:]";
        v40 = 2112;
        v41 = v23;
        v42 = 2112;
        v43 = v36;
        _os_log_debug_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_DEBUG, "%s rawSpeechProfile has empty entity words at item index: %@ under category: %@", buf, 0x20u);

      }
      goto LABEL_12;
    }
    v37 = 0;
    objc_msgSend(v11, "vocabularyItemFromSpeechWords:speechNamespace:error:", v17, v12, &v37);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v37;
    if (v19)
      break;
    if (v18)
      objc_msgSend(v13, "addObject:", v18);
    else
      ++v14;

LABEL_12:
    if (++v15 >= (unint64_t)objc_msgSend(v9, "count"))
    {
      v10 = v36;
      if (v14)
      {
        v24 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEBUG))
        {
          v32 = (void *)MEMORY[0x1E0CB37E8];
          v33 = v24;
          objc_msgSend(v32, "numberWithUnsignedInteger:", v14);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315906;
          v39 = "+[CESRRawSpeechProfileExtractor _convertItemsFromEntities:categoryName:converter:error:]";
          v40 = 2112;
          v41 = v34;
          v42 = 2112;
          v43 = v12;
          v44 = 2112;
          v45 = v36;
          _os_log_debug_impl(&dword_1B3E5F000, v33, OS_LOG_TYPE_DEBUG, "%s Skipped %@ vocabulary items with namespace: %@ in category: %@", buf, 0x2Au);

        }
      }
      goto LABEL_16;
    }
  }
  v26 = v19;
  v27 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR))
  {
    v29 = (void *)MEMORY[0x1E0CB37E8];
    v30 = v27;
    objc_msgSend(v29, "numberWithUnsignedInteger:", v15);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v39 = "+[CESRRawSpeechProfileExtractor _convertItemsFromEntities:categoryName:converter:error:]";
    v40 = 2112;
    v41 = v31;
    v42 = 2112;
    v43 = v36;
    v44 = 2112;
    v45 = v26;
    _os_log_error_impl(&dword_1B3E5F000, v30, OS_LOG_TYPE_ERROR, "%s Conversion to vocabulary item at index: %@ in category: %@ failed with error: %@", buf, 0x2Au);

  }
  if (v35)
    *v35 = objc_retainAutorelease(v26);

  v25 = 0;
  v10 = v36;
LABEL_23:

LABEL_24:
  return v25;
}

@end
