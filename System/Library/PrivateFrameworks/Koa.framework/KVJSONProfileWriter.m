@implementation KVJSONProfileWriter

- (KVJSONProfileWriter)initWithOutputStream:(id)a3
{
  id v5;
  KVJSONProfileWriter *v6;
  KVJSONProfileWriter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVJSONProfileWriter;
  v6 = -[KVJSONProfileWriter init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_stream, a3);
    *(_QWORD *)&v7->_datasetIdx = 0;
  }

  return v7;
}

- (BOOL)startProfile:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSOutputStream *stream;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v6 = a3;
  v7 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v10 = (void *)objc_msgSend_initWithString_(v7, v8, (uint64_t)CFSTR("{\n"), v9);
  objc_msgSend_JSONWithIndent_(v6, v11, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v10, v14, (uint64_t)CFSTR("%@\"%@\":\n%@,\n"), v15, CFSTR("  "), CFSTR("profileInfo"), v13);

  objc_msgSend_appendFormat_(v10, v16, (uint64_t)CFSTR("%@\"%@\": [\n"), v17, CFSTR("  "), CFSTR("datasets"));
  objc_msgSend_dataUsingEncoding_(v10, v18, 4, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_length(v20, v21, v22, v23);
  stream = self->_stream;
  v26 = objc_retainAutorelease(v20);
  v30 = objc_msgSend_bytes(v26, v27, v28, v29);
  v34 = objc_msgSend_length(v26, v31, v32, v33);
  v38 = objc_msgSend_write_maxLength_(stream, v35, v30, v34);
  if (v24 != v38)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v36, (uint64_t)CFSTR("profile header: %@ data: %@"), v37, v10, v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a4, v39, self->_stream, 3u);

  }
  return v24 == v38;
}

- (BOOL)startDataset:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSOutputStream *stream;
  __CFString *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSOutputStream *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  BOOL v58;
  void *v59;
  __CFString *v60;

  v8 = a3;
  v9 = self->_datasetIdx + 1;
  self->_datasetIdx = v9;
  if (v9 >= 2)
  {
    objc_msgSend_dataUsingEncoding_(CFSTR(",\n"), v6, 4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_length(v10, v11, v12, v13);
    stream = self->_stream;
    v16 = objc_retainAutorelease(v10);
    v20 = objc_msgSend_bytes(v16, v17, v18, v19);
    v24 = objc_msgSend_length(v16, v21, v22, v23);
    if (v14 != objc_msgSend_write_maxLength_(stream, v25, v20, v24))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("dataset separator: %@"), v27, v16);
      v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
      sub_1B7106D8C(a4, v60, self->_stream, 3u);
      v58 = 0;
      goto LABEL_8;
    }

  }
  v28 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend_appendFormat_(v28, v29, (uint64_t)CFSTR("%@{\n"), v30, CFSTR("    "));
  objc_msgSend_JSONWithIndent_(v8, v31, 4, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v28, v34, (uint64_t)CFSTR("%@\"%@\":\n%@,\n"), v35, CFSTR("      "), CFSTR("datasetInfo"), v33);

  objc_msgSend_appendFormat_(v28, v36, (uint64_t)CFSTR("%@\"%@\": [\n"), v37, CFSTR("      "), CFSTR("items"));
  objc_msgSend_dataUsingEncoding_(v28, v38, 4, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_length(v40, v41, v42, v43);
  v45 = self->_stream;
  v46 = objc_retainAutorelease(v40);
  v50 = objc_msgSend_bytes(v46, v47, v48, v49);
  v54 = objc_msgSend_length(v46, v51, v52, v53);
  v58 = v44 == objc_msgSend_write_maxLength_(v45, v55, v50, v54);
  if (!v58)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v56, (uint64_t)CFSTR("dataset header: %@ data: %@"), v57, v28, v46);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a4, v59, self->_stream, 3u);

  }
  v16 = CFSTR("    ");
  v60 = CFSTR("      ");
LABEL_8:

  return v58;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  unsigned int v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSOutputStream *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSOutputStream *stream;
  id v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  BOOL v62;
  void *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = self->_itemIdx + 1;
  self->_itemIdx = v9;
  if (v9 < 2)
  {
LABEL_4:
    sub_1B7103470(5u);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend_appendFormat_(v29, v30, (uint64_t)CFSTR("%@{\n"), v31, CFSTR("        "));
    objc_msgSend_JSONWithIndent_(v8, v32, 5, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v29, v35, (uint64_t)CFSTR("%@\"%@\":\n%@,\n"), v36, v28, CFSTR("item"), v34);

    objc_msgSend_appendFormat_(v29, v37, (uint64_t)CFSTR("%@}"), v38, CFSTR("        "));
    objc_msgSend_dataUsingEncoding_(v29, v39, 4, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v41, v42, v43, v44))
    {
      v48 = objc_msgSend_length(v41, v45, v46, v47);
      stream = self->_stream;
      v50 = objc_retainAutorelease(v41);
      v54 = objc_msgSend_bytes(v50, v51, v52, v53);
      v58 = objc_msgSend_length(v50, v55, v56, v57);
      if (v48 == objc_msgSend_write_maxLength_(stream, v59, v54, v58))
      {
        v62 = 1;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v60, (uint64_t)CFSTR("item: %@ data: %@"), v61, v8, v50);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1B7106D8C(a4, v71, self->_stream, 3u);

    }
    else
    {
      v63 = (void *)MEMORY[0x1E0CB35C8];
      v73 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v45, (uint64_t)CFSTR("Invalid item %@"), v47, v8);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v64;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v65, (uint64_t)v74, (uint64_t)&v73, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v63, v67, (uint64_t)CFSTR("com.apple.koa.profile"), 7, v66);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (a4 && v68)
        *a4 = objc_retainAutorelease(v68);

    }
    v62 = 0;
    goto LABEL_14;
  }
  objc_msgSend_dataUsingEncoding_(CFSTR(",\n"), v6, 4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_length(v10, v11, v12, v13);
  v15 = self->_stream;
  v16 = objc_retainAutorelease(v10);
  v20 = objc_msgSend_bytes(v16, v17, v18, v19);
  v24 = objc_msgSend_length(v16, v21, v22, v23);
  if (v14 == objc_msgSend_write_maxLength_(v15, v25, v20, v24))
  {

    goto LABEL_4;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v26, (uint64_t)CFSTR("item separator: %@"), v27, v16);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1B7106D8C(a4, v70, self->_stream, 3u);

  v62 = 0;
LABEL_15:

  return v62;
}

- (BOOL)finishDataset:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSOutputStream *stream;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("\n%@]\n%@}"), v3, CFSTR("      "), CFSTR("    "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v6, v7, 4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v9, v10, v11, v12);
  stream = self->_stream;
  v15 = objc_retainAutorelease(v9);
  v19 = objc_msgSend_bytes(v15, v16, v17, v18);
  v23 = objc_msgSend_length(v15, v20, v21, v22);
  v27 = objc_msgSend_write_maxLength_(stream, v24, v19, v23);
  if (v13 == v27)
  {
    self->_itemIdx = 0;
  }
  else
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("dataset footer: %@ data: %@"), v26, v6, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a3, v28, self->_stream, 3u);

  }
  return v13 == v27;
}

- (BOOL)finishProfile:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSOutputStream *stream;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("\n%@]\n}"), v3, CFSTR("  "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataUsingEncoding_(v6, v7, 4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v9, v10, v11, v12);
  stream = self->_stream;
  v15 = objc_retainAutorelease(v9);
  v19 = objc_msgSend_bytes(v15, v16, v17, v18);
  v23 = objc_msgSend_length(v15, v20, v21, v22);
  v27 = objc_msgSend_write_maxLength_(stream, v24, v19, v23);
  if (v13 != v27)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v25, (uint64_t)CFSTR("dataset footer: %@ data: %@"), v26, v6, v15);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1B7106D8C(a3, v28, self->_stream, 3u);

  }
  return v13 == v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
