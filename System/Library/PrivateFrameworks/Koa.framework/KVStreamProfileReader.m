@implementation KVStreamProfileReader

- (KVStreamProfileReader)initWithData:(id)a3 profileInfo:(id)a4 offset:(unsigned int)a5
{
  id v9;
  id v10;
  KVStreamProfileReader *v11;
  KVStreamProfileReader *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)KVStreamProfileReader;
  v11 = -[KVStreamProfileReader init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_data, a3);
    objc_storeStrong((id *)&v12->_profileInfo, a4);
    v12->_offset = a5;
  }

  return v12;
}

- (id)data
{
  return self->_data;
}

- (BOOL)enumerateDatasetsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v6)(id, void *);
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t offset;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  KVStreamDatasetReader *v19;
  const char *v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  BOOL v34;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  void *v41;
  uint64_t v43;
  void *v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a4;
  v10 = objc_msgSend_bytes(self->_data, v7, v8, v9);
  offset = self->_offset;
  v15 = objc_msgSend_length(self->_data, v12, v13, v14);
  v16 = qword_1ED114588;
  if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[KVStreamProfileReader enumerateDatasetsWithError:usingBlock:]";
    v47 = 2048;
    v48 = v15;
    _os_log_impl(&dword_1B70E7000, v16, OS_LOG_TYPE_INFO, "%s Linearly scanning profile data (length: %llu) for all datasets.", buf, 0x16u);
  }
  if (v15 <= offset)
  {
LABEL_14:
    v34 = 1;
  }
  else
  {
    while (1)
    {
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v17, v10 + offset, v15 - offset, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = [KVStreamDatasetReader alloc];
      v21 = (void *)objc_msgSend_initWithData_error_(v19, v20, (uint64_t)v18, (uint64_t)a3);
      if (!v21)
        break;
      v22 = qword_1ED114588;
      if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v46 = "-[KVStreamProfileReader enumerateDatasetsWithError:usingBlock:]";
        v47 = 2112;
        v48 = (unint64_t)v21;
        _os_log_impl(&dword_1B70E7000, v22, OS_LOG_TYPE_INFO, "%s Reading dataset: %@", buf, 0x16u);
      }
      if ((v6[2](v6, v21) & 1) == 0)
        break;
      v26 = objc_msgSend_offset(v21, v23, v24, v25);
      if (!v26)
      {
        v27 = qword_1ED114588;
        if (os_log_type_enabled((os_log_t)qword_1ED114588, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v46 = "-[KVStreamProfileReader enumerateDatasetsWithError:usingBlock:]";
          _os_log_debug_impl(&dword_1B70E7000, v27, OS_LOG_TYPE_DEBUG, "%s Dataset buffer offset not resolved, enumerating items to resolve offset.", buf, 0xCu);
        }
        if (!objc_msgSend_enumerateItemsWithError_usingBlock_(v21, v28, (uint64_t)a3, (uint64_t)&unk_1E6B7B4E0))break;
        v26 = objc_msgSend_offset(v21, v29, v30, v31);
        if (!v26)
        {
          v35 = (void *)MEMORY[0x1E0CB35C8];
          v43 = *MEMORY[0x1E0CB2D50];
          objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v32, (uint64_t)CFSTR("Cannot enumerate items in dataset: %@ aborting profile enumeration."), v33, v21);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v36;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)&v44, (uint64_t)&v43, 1);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v35, v39, (uint64_t)CFSTR("com.apple.koa.profile"), 3, v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          if (a3 && v40)
            *a3 = objc_retainAutorelease(v40);

          break;
        }
      }

      offset += v26;
      if (offset >= v15)
        goto LABEL_14;
    }

    v34 = 0;
  }

  return v34;
}

- (id)profileInfo
{
  return self->_profileInfo;
}

- (NSString)description
{
  uint64_t v2;
  void *v3;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("profile format: %@ info: %@"), v2, CFSTR("Binary Stream"), self->_profileInfo);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
