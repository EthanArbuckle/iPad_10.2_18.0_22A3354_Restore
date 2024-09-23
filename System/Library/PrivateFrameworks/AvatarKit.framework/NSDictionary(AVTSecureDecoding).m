@implementation NSDictionary(AVTSecureDecoding)

- (id)avt_objectForKey:()AVTSecureDecoding ofClass:didFail:error:
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Unexpected class %@ for key %@"), v14, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    avt_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_impl(&dword_1DD1FA000, v16, OS_LOG_TYPE_DEFAULT, "Decoding error: %@", buf, 0xCu);
    }

    if (a6)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 3, v18);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    *a5 = 1;

    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  return v11;
}

- (id)avt_objectForKey:()AVTSecureDecoding ofClasses:didFail:error:
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v13);
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = v12;
            goto LABEL_16;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
          continue;
        break;
      }
    }

    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Unexpected class %@ for key %@"), v20, v10, v26);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    avt_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_1DD1FA000, v21, OS_LOG_TYPE_DEFAULT, "Decoding error: %@", buf, 0xCu);
    }

    if (a6)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("AVTErrorDomain"), 3, v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = 0;
    *a5 = 1;
LABEL_16:

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)avt_mutableContainersCopy
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__NSDictionary_AVTSecureDecoding__avt_mutableContainersCopy__block_invoke;
  v5[3] = &unk_1EA61EDA8;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

@end
