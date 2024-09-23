@implementation KVStreamProfileWriter

- (KVStreamProfileWriter)initWithOutputStream:(id)a3
{
  id v5;
  KVStreamProfileWriter *v6;
  KVStreamProfileWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVStreamProfileWriter;
  v6 = -[KVStreamProfileWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (BOOL)startProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSOutputStream *stream;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;

  v6 = a3;
  v28 = 0;
  v29 = 0;
  v30 = xmmword_1B7111340;
  v31 = 0u;
  v32 = 0u;
  v33 = 0;
  v34 = 1;
  v35 = 256;
  v36 = 0;
  sub_1B7106BCC((unint64_t)&v28, v6, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_length(v7, v8, v9, v10);
  stream = self->_stream;
  v13 = objc_retainAutorelease(v7);
  v17 = objc_msgSend_bytes(v13, v14, v15, v16);
  v21 = objc_msgSend_length(v13, v18, v19, v20);
  v25 = objc_msgSend_write_maxLength_(stream, v22, v17, v21);
  if (v11 != v25)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("profile header: %@ with info: %@"), v24, v13, v6);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a4, v26, self->_stream, 2u);

  }
  sub_1B70ED4B4(&v28);

  return v11 == v25;
}

- (BOOL)startDataset:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSOutputStream *stream;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v6 = a3;
  objc_msgSend_buffer(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B70F6000(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend_length(v11, v12, v13, v14);
  stream = self->_stream;
  v17 = objc_retainAutorelease(v11);
  v21 = objc_msgSend_bytes(v17, v18, v19, v20);
  v25 = objc_msgSend_length(v17, v22, v23, v24);
  v29 = objc_msgSend_write_maxLength_(stream, v26, v21, v25);
  if (v15 != v29)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v27, (uint64_t)CFSTR("profile datasetInfo: %@ buffer: %@"), v28, v6, v17);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a4, v30, self->_stream, 2u);

  }
  return v15 == v29;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSOutputStream *stream;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  BOOL v32;
  void *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_buffer(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B70F6000(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend_length(v11, v12, v13, v14))
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v42 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("Invalid item %@"), v17, v6);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v34;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v35, (uint64_t)v43, (uint64_t)&v42, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v37, (uint64_t)CFSTR("com.apple.koa.profile"), 7, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (a4 && v38)
      *a4 = objc_retainAutorelease(v38);

    goto LABEL_9;
  }
  v18 = objc_msgSend_length(v11, v15, v16, v17);
  stream = self->_stream;
  v20 = objc_retainAutorelease(v11);
  v24 = objc_msgSend_bytes(v20, v21, v22, v23);
  v28 = objc_msgSend_length(v20, v25, v26, v27);
  if (v18 != objc_msgSend_write_maxLength_(stream, v29, v24, v28))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v30, (uint64_t)CFSTR("profile item: %@ buffer: %@"), v31, v6, v20);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a4, v40, self->_stream, 2u);

LABEL_9:
    v32 = 0;
    goto LABEL_10;
  }
  v32 = 1;
LABEL_10:

  return v32;
}

- (BOOL)finishDataset:(id *)a3
{
  return 1;
}

- (BOOL)finishProfile:(id *)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
