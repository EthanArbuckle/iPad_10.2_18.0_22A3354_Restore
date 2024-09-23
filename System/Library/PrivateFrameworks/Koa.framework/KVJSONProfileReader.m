@implementation KVJSONProfileReader

- (KVJSONProfileReader)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  KVJSONProfileReader *v8;
  KVJSONProfileReader *v9;
  uint64_t *p_data;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  id v14;
  NSDictionary *profile;
  const char *v16;
  uint64_t v17;
  KVProfileInfo *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  KVProfileInfo *profileInfo;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *datasets;
  KVJSONProfileReader *v29;
  void *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  id v36;
  void *v38;
  void *v39;
  objc_class *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  void *v45;
  void *v46;
  id v47;
  objc_super v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v48.receiver = self;
  v48.super_class = (Class)KVJSONProfileReader;
  v8 = -[KVJSONProfileReader init](&v48, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_8;
  p_data = (uint64_t *)&v8->_data;
  objc_storeStrong((id *)&v8->_data, a3);
  v11 = *p_data;
  v47 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v12, v11, 0, &v47);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v47;
  profile = v9->_profile;
  v9->_profile = (NSDictionary *)v13;

  if (!v9->_profile || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("Attempt to parse profile from data: %@ as JSON failed with error: %@"), v17, *p_data, v14);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v31;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v52, (uint64_t)&v51, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v30, v34, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a4 && v35)
    {
      v36 = objc_retainAutorelease(v35);
      *a4 = v36;
    }
    goto LABEL_12;
  }
  v18 = [KVProfileInfo alloc];
  objc_msgSend_objectForKey_(v9->_profile, v19, (uint64_t)CFSTR("profileInfo"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_initFromDictionary_error_(v18, v22, (uint64_t)v21, (uint64_t)a4);
  profileInfo = v9->_profileInfo;
  v9->_profileInfo = (KVProfileInfo *)v23;

  if (!v9->_profileInfo)
  {
LABEL_13:

    v29 = 0;
    goto LABEL_14;
  }
  objc_msgSend_objectForKey_(v9->_profile, v25, (uint64_t)CFSTR("datasets"), v26);
  v27 = objc_claimAutoreleasedReturnValue();
  datasets = v9->_datasets;
  v9->_datasets = (NSArray *)v27;

  if (v9->_datasets)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v39 = (void *)MEMORY[0x1E0CB3940];
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v39, v41, (uint64_t)CFSTR("Unexpected datasets array class: %@"), v42, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v33;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v43, (uint64_t)&v50, (uint64_t)&v49, 1);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v38, v44, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v36);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (a4 && v45)
        *a4 = objc_retainAutorelease(v45);

LABEL_12:
      goto LABEL_13;
    }
  }

LABEL_8:
  v29 = v9;
LABEL_14:

  return v29;
}

- (id)data
{
  return self->_data;
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v6)(id, void *);
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  KVJSONDatasetReader *v15;
  const char *v16;
  void *v17;
  const char *v18;
  BOOL v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = self->_datasets;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v27, (uint64_t)v33, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v31 = *MEMORY[0x1E0CB2D50];
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v13, (uint64_t)CFSTR("Unexpected dataset dictionary: %@"), v14, v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v17;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)&v32, (uint64_t)&v31, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v20, v23, (uint64_t)CFSTR("com.apple.koa.profile"), 10, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (a3 && v24)
            *a3 = objc_retainAutorelease(v24);

LABEL_17:
          v19 = 0;
          goto LABEL_18;
        }
        v15 = [KVJSONDatasetReader alloc];
        v17 = (void *)objc_msgSend_initWithDictionary_error_(v15, v16, v12, (uint64_t)a3);
        if (!v17 || (v6[2](v6, v17) & 1) == 0)
          goto LABEL_17;

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v18, (uint64_t)&v27, (uint64_t)v33, 16);
      v19 = 1;
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v19 = 1;
  }
LABEL_18:

  return v19;
}

- (id)profileInfo
{
  return self->_profileInfo;
}

- (NSString)description
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = objc_msgSend_bytes(self->_data, v4, v5, v6);
  v11 = objc_msgSend_length(self->_data, v8, v9, v10);
  return (NSString *)(id)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v3, v12, v7, v11, 4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_datasets, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
