@implementation KVProfileWriterFactory

- (id)profileWriterForFormat:(unsigned __int8)a3 outputStream:(id)a4 error:(id *)a5
{
  unsigned int v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  _QWORD v28[2];

  v6 = a3;
  v28[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (v6 - 1 >= 3)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v16 = (void *)MEMORY[0x1E0CB3940];
    sub_1B70F5FAC(v6, v7, v8, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v16, v18, (uint64_t)CFSTR("Unsupported profile format: %@"), v19, v17, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v20;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v21, (uint64_t)v28, (uint64_t)&v27, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v23, (uint64_t)CFSTR("com.apple.koa.profile"), 3, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a5 && v24)
      *a5 = objc_retainAutorelease(v24);

    v14 = 0;
  }
  else
  {
    v11 = objc_alloc(*(&off_1E6B7B500)[(v6 - 1)]);
    v14 = (void *)objc_msgSend_initWithOutputStream_(v11, v12, (uint64_t)v10, v13);
  }

  return v14;
}

@end
