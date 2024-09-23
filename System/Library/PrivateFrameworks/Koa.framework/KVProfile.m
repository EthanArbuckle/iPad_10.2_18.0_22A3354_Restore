@implementation KVProfile

- (id)serializedSets:(id *)a3
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B70F13F4;
  v10[3] = &unk_1E6B7AC80;
  v6 = v5;
  v11 = v6;
  LODWORD(a3) = objc_msgSend__enumerateSerializedSetsWithError_usingBlock_(self, v7, (uint64_t)a3, (uint64_t)v10);

  if ((_DWORD)a3)
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (id)toSerializedSets:(id *)a3
{
  id v5;
  id v6;
  const char *v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_1B70F0D30;
  v21 = sub_1B70F0D40;
  v22 = 0;
  v15 = &v17;
  v16 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B70F1344;
  v13[3] = &unk_1E6B7ACA8;
  v6 = v5;
  v14 = v6;
  v8 = objc_msgSend__enumerateSerializedSetsWithError_usingBlock_(self, v7, (uint64_t)&v16, (uint64_t)v13);
  v9 = v16;
  v10 = v9;
  if ((v8 & 1) != 0)
  {

    v11 = v6;
  }
  else
  {
    if (v18[5])
      v9 = (id)v18[5];
    if (a3 && v9)
      *a3 = objc_retainAutorelease(v9);

    v11 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (BOOL)_enumerateSerializedSetsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  char v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0D3E450]);
  v9 = (void *)objc_msgSend_initWithDeviceIdentifier_options_error_(v7, v8, (uint64_t)CFSTR("local-device-placeholder"), (uint64_t)&unk_1E6B81390, a3);
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D0D3F8]);
    objc_msgSend_appendUInt32Value_(v10, v11, 0, v12);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_1B70F0D30;
    v35 = sub_1B70F0D40;
    v36 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_1B70F0D30;
    v29 = sub_1B70F0D40;
    v30 = 0;
    obj = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B70F0D48;
    v18[3] = &unk_1E6B7ACF8;
    v22 = &v25;
    v23 = &v31;
    v13 = v10;
    v19 = v13;
    v20 = v9;
    v21 = v6;
    v15 = objc_msgSend_enumerateDatasetsWithError_usingBlock_(self, v14, (uint64_t)&obj, (uint64_t)v18);
    objc_storeStrong(&v36, obj);
    if ((v15 & 1) == 0)
    {
      v16 = (void *)v26[5];
      if (!v16)
        v16 = (void *)v32[5];
      if (a3 && v16)
        *a3 = objc_retainAutorelease(v16);
    }

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (KVProfile)initWithProfileData:(id)a3 error:(id *)a4
{
  id v6;
  KVProfileReaderFactory *v7;
  const char *v8;
  KVProfile *v9;

  v6 = a3;
  v7 = objc_alloc_init(KVProfileReaderFactory);
  v9 = (KVProfile *)objc_msgSend_initWithProfileData_provider_error_(self, v8, (uint64_t)v6, (uint64_t)v7, a4);

  return v9;
}

- (KVProfile)initWithProfileData:(id)a3 provider:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  KVProfile *v11;
  uint64_t v12;
  KVProfileReader *profileReader;
  KVProfile *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)KVProfile;
  v11 = -[KVProfile init](&v16, sel_init);
  if (v11
    && (objc_msgSend_profileReaderForData_error_(v9, v10, (uint64_t)v8, (uint64_t)a5),
        v12 = objc_claimAutoreleasedReturnValue(),
        profileReader = v11->_profileReader,
        v11->_profileReader = (KVProfileReader *)v12,
        profileReader,
        !v11->_profileReader))
  {
    v14 = 0;
  }
  else
  {
    v14 = v11;
  }

  return v14;
}

- (id)profileInfo
{
  return (id)((uint64_t (*)(KVProfileReader *, char *))MEMORY[0x1E0DE7D20])(self->_profileReader, sel_profileInfo);
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6;
  KVProfileReader *profileReader;
  id v8;
  const char *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  profileReader = self->_profileReader;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B70F8288;
  v11[3] = &unk_1E6B7B070;
  v12 = v6;
  v8 = v6;
  LOBYTE(a3) = objc_msgSend_enumerateDatasetsWithError_usingBlock_(profileReader, v9, (uint64_t)a3, (uint64_t)v11);

  return (char)a3;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_description(self->_profileReader, a2, v2, v3);
}

- (void)encodeWithCoder:(id)a3
{
  KVProfileReader *profileReader;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  id v9;

  profileReader = self->_profileReader;
  v4 = a3;
  objc_msgSend_data(profileReader, v5, v6, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v9, (uint64_t)CFSTR("d"));

}

- (KVProfile)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  id v10;
  KVProfile *v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("d"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v9 = (void *)objc_msgSend_initWithProfileData_error_(self, v8, (uint64_t)v7, (uint64_t)&v14);
  v10 = v14;
  v11 = v9;
  if (!v11)
  {
    v12 = qword_1ED114588;
    if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[KVProfile initWithCoder:]";
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1B70E7000, v12, OS_LOG_TYPE_ERROR, "%s Failed to decode profile from data: %@ error: %@", buf, 0x20u);
    }
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileReader, 0);
}

+ (void)initalize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

+ (id)profileWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  char isDirectory;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  const char *v21;
  void *v22;
  const char *v23;
  KVProfileReaderFactory *v24;
  KVProfileReaderFactory *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  id v38;
  char v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint64_t v42;
  id v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39 = 0;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v9, v14, (uint64_t)v13, (uint64_t)&v39);

  if ((isDirectory & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v44 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("No profile exists at URL: %@"), v17, v5);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v45[0] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v45, (uint64_t)&v44, 1);
    goto LABEL_5;
  }
  if (v39)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v16, (uint64_t)CFSTR("Expected file but found directory at URL: %@"), v17, v5);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v43 = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)&v43, (uint64_t)&v42, 1);
LABEL_5:
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v18, v23, (uint64_t)CFSTR("com.apple.koa.profile"), 2, v22);
    v24 = (KVProfileReaderFactory *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    v26 = 0;
    if (a4 && v24)
    {
      v25 = objc_retainAutorelease(v24);
      v26 = 0;
      *a4 = v25;
    }
    goto LABEL_14;
  }
  v38 = 0;
  objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], v16, (uint64_t)v5, 8, &v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v38;
  if (v22)
  {
    v29 = objc_alloc((Class)objc_opt_class());
    v25 = objc_alloc_init(KVProfileReaderFactory);
    v26 = (void *)objc_msgSend_initWithProfileData_provider_error_(v29, v30, (uint64_t)v22, (uint64_t)v25, a4);
  }
  else
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v40[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)CFSTR("Failed to read profile at URL: %@"), v28, v5);
    v25 = (KVProfileReaderFactory *)objc_claimAutoreleasedReturnValue();
    v40[1] = *MEMORY[0x1E0CB3388];
    v41[0] = v25;
    v41[1] = v19;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)v41, (uint64_t)v40, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, (uint64_t)CFSTR("com.apple.koa.profile"), 2, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (a4 && v35)
      *a4 = objc_retainAutorelease(v35);

    v22 = 0;
    v26 = 0;
  }
LABEL_14:

  return v26;
}

+ (id)emptyProfile:(id *)a3
{
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend_syntheticWithDatasetCount_error_(KVProfileInfo, a2, 0, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend_builderWithProfileInfo_format_error_(KVProfileBuilder, v4, (uint64_t)v5, 1, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (v6)
    {
      objc_msgSend_buildWithError_(v6, v7, (uint64_t)a3, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
