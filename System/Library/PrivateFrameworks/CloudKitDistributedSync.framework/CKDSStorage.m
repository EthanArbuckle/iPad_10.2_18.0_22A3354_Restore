@implementation CKDSStorage

- (id)initForWriting:(BOOL)a3 withFile:(id)a4 orData:(id)a5
{
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  CKDSStorage *v14;
  CKDSStorage *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSData *data;
  void *v21;
  const char *v22;
  objc_super v23;

  v10 = (unint64_t)a4;
  v13 = (unint64_t)a5;
  if (!(v10 | v13))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKDSUtils.m"), 56, CFSTR("Unexpected arguments"));

  }
  v23.receiver = self;
  v23.super_class = (Class)CKDSStorage;
  v14 = -[CKDSStorage init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_file, a4);
    if (a3)
      v18 = objc_msgSend_mutableCopy((void *)v13, v16, v17);
    else
      v18 = objc_msgSend_copy((void *)v13, v16, v17);
    data = v15->_data;
    v15->_data = (NSData *)v18;

    v15->_writable = a3;
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  v4 = objc_alloc((Class)objc_opt_class());
  v7 = objc_msgSend_writable(self, v5, v6);
  objc_msgSend_file(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend_initForWriting_withFile_orData_(v4, v14, v7, v10, v13);

  return v15;
}

- (NSURL)fileURL
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_file(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (BOOL)size:(unint64_t *)a3 error:(id *)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  char ResourceValue_forKey_error;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[2];
  _QWORD v39[3];

  v39[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  objc_msgSend_data(self, a2, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_data(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = objc_msgSend_length(v10, v11, v12);

    return 1;
  }
  objc_msgSend_fileURL(self, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    *a3 = 0;
    return 1;
  }
  objc_msgSend_fileURL(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v19 = *MEMORY[0x1E0C99998];
  v36 = 0;
  ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v18, v20, (uint64_t)&v37, v19, &v36);
  v21 = v37;
  v22 = v36;

  if ((ResourceValue_forKey_error & 1) != 0)
  {
    v25 = objc_msgSend_unsignedIntegerValue(v21, v23, v24);
  }
  else
  {
    if (a4)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v38[0] = *MEMORY[0x1E0CB2D50];
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend_fileURL(self, v23, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v27, v29, (uint64_t)CFSTR("Error reading file %@"), v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = *MEMORY[0x1E0CB3388];
      v39[0] = v30;
      v39[1] = v22;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v31, (uint64_t)v39, v38, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v26, v33, (uint64_t)CFSTR("CKDSErrorDomain"), 5, v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_retainAutorelease(v34);
      *a4 = v35;

    }
    v25 = 0;
  }
  *a3 = v25;

  return ResourceValue_forKey_error;
}

- (id)dataWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_data(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend_data(self, v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_fileURL(self, v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend_dataWithContentsOfURL_options_error_(v11, v13, (uint64_t)v12, 0, &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v24;

    if (v9)
      goto LABEL_10;
    if (v10)
      goto LABEL_7;
  }
  v14 = (void *)MEMORY[0x1E0CB35C8];
  v25 = *MEMORY[0x1E0CB2D50];
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v15, v18, (uint64_t)CFSTR("%@ was improperly initialized"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v19;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v20, (uint64_t)v26, &v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v14, v22, (uint64_t)CFSTR("CKDSErrorDomain"), 1, v21);
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  if (a3)
  {
    v10 = objc_retainAutorelease(v10);
    v9 = 0;
    *a3 = v10;
  }
  else
  {
    v9 = 0;
  }
LABEL_10:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CKDSStorage *v5;
  uint64_t v6;
  const char *v7;
  CKDSStorage *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  char isEqual;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v34;

  v5 = (CKDSStorage *)a3;
  if (self == v5)
  {
    isEqual = 1;
  }
  else
  {
    v6 = objc_opt_class();
    if (objc_msgSend_isMemberOfClass_(v5, v7, v6))
    {
      v8 = v5;
      objc_msgSend_data(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v8, v12, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 != v16)
      {
        objc_msgSend_data(self, v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v8, v18, v19);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v17, v20, (uint64_t)v3))
        {
          isEqual = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v34 = v17;
      }
      objc_msgSend_fileURL(self, v14, v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURL(v8, v23, v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == v27)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_fileURL(self, v25, v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_fileURL(v8, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v28, v32, (uint64_t)v31);

      }
      v17 = v34;
      if (v11 == v16)
        goto LABEL_14;
      goto LABEL_13;
    }
    isEqual = 0;
  }
LABEL_15:

  return isEqual;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  int isOwned;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  const char *v24;

  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p; "), v5, self);

  objc_msgSend_file(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_file(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isOwned = objc_msgSend_isOwned(v12, v13, v14);

    if (isOwned)
      objc_msgSend_appendFormat_(v3, v16, (uint64_t)CFSTR("type=ownedFile, "));
    else
      objc_msgSend_appendFormat_(v3, v16, (uint64_t)CFSTR("type=file, "));
    objc_msgSend_file(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_URL(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v23, (uint64_t)CFSTR("URL=%@"), v22);

  }
  else
  {
    objc_msgSend_appendFormat_(v3, v10, (uint64_t)CFSTR("type=data"));
  }
  objc_msgSend_appendFormat_(v3, v24, (uint64_t)CFSTR(">"));
  return v3;
}

- (NSData)data
{
  return self->_data;
}

- (CKDSStorageFile)file
{
  return self->_file;
}

- (BOOL)writable
{
  return self->_writable;
}

- (void)setWritable:(BOOL)a3
{
  self->_writable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
