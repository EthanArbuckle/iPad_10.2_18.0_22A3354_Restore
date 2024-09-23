@implementation CKAtomBatch

- (CKAtomBatch)initWithMergeableDelta:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  CKAtomBatch *v29;
  int v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v7 = *MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
  {
    v31 = 138412290;
    v32 = v6;
    _os_log_debug_impl(&dword_1D4AFF000, v7, OS_LOG_TYPE_DEBUG, "Creating atom batch from delta: %@", (uint8_t *)&v31, 0xCu);
  }
  objc_msgSend_fileURL(v6, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_valueID(v6, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadata(v6, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectors(v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self = (CKAtomBatch *)(id)objc_msgSend_initWithFileURL_mergeableValueID_vectors_options_error_(self, v20, (uint64_t)v12, v13, v19, 0, a4);
  }
  else
  {
    objc_msgSend_dataWithError_(v6, v10, (uint64_t)a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v29 = 0;
      goto LABEL_10;
    }
    objc_msgSend_valueID(v6, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadata(v6, v23, v24);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectors(v19, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    self = (CKAtomBatch *)(id)objc_msgSend_initWithData_mergeableValueID_vectors_error_(self, v28, (uint64_t)v13, v16, v27, a4);

  }
  v29 = self;
LABEL_10:

  return v29;
}

- (id)splitWithMaximumDeltaSize:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  const char *v9;
  char v10;
  id v11;
  void *v12;
  char v13;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = sub_1D4BBDEC0;
  v29 = sub_1D4BBDED0;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v7 = (void *)objc_opt_new();
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1D4BBDED8;
  v16[3] = &unk_1E984B5F0;
  v18 = &v25;
  v19 = &v21;
  v8 = v7;
  v17 = v8;
  v10 = objc_msgSend_splitWithMaximumSize_error_block_(self, v9, a3, &v20, v16);
  v11 = v20;
  v12 = v11;
  if (*((_BYTE *)v22 + 24))
    v13 = v10;
  else
    v13 = 0;
  if ((v13 & 1) != 0)
  {
    v14 = v8;
  }
  else if (a4)
  {
    if (v26[5])
      v11 = (id)v26[5];
    v14 = 0;
    *a4 = objc_retainAutorelease(v11);
  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

- (CKAtomBatch)initWithData:(id)a3 error:(id *)a4
{
  return (CKAtomBatch *)objc_msgSend_initWithData_mergeableValueID_vectors_error_(self, a2, (uint64_t)a3, 0, 0, a4);
}

- (CKAtomBatch)initWithData:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 error:(id *)a6
{
  return (CKAtomBatch *)MEMORY[0x1E0DE7D20](self, sel_initWithData_mergeableValueID_vectors_options_error_, a3);
}

- (CKAtomBatch)initWithData:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CKDSReadableStorage *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  CKAtomBatch *v23;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = [CKDSReadableStorage alloc];
  v18 = (void *)objc_msgSend_initWithData_(v16, v17, (uint64_t)v15);

  objc_msgSend_underlyingReaderOptionsByClass(v12, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (CKAtomBatch *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(self, v22, (uint64_t)v18, v21, v14, v13, 3, a7);
  return v23;
}

- (CKAtomBatch)initWithFileURL:(id)a3 mergeableValueID:(id)a4 vectors:(id)a5 options:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  CKDSReadableStorage *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  CKAtomBatch *v23;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = [CKDSReadableStorage alloc];
  v18 = (void *)objc_msgSend_initWithFileURL_(v16, v17, (uint64_t)v15);

  objc_msgSend_underlyingReaderOptionsByClass(v12, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (CKAtomBatch *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(self, v22, (uint64_t)v18, v21, v14, v13, 3, a7);
  return v23;
}

- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 version:(unsigned __int8)a5
{
  void *inited;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v19;

  v19 = 0;
  inited = (void *)objc_msgSend_initWriterWithMergeableValueID_metadata_formatVersion_error_(self, a2, (uint64_t)a3, a4, a5, &v19);
  v6 = v19;
  v7 = inited;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v6, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v17, v11, CFSTR("Failed to initialize %@: %@"), v13, v16);

  }
  return v8;
}

- (id)initWriterWithMergeableValueID:(id)a3 metadata:(id)a4 formatVersion:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *inited;

  v7 = a5;
  v10 = a3;
  objc_msgSend_vectors(a4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initWriterWithMergeableValueID_vectors_formatVersion_error_(self, v14, (uint64_t)v10, v13, v7, a6);

  return inited;
}

- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 formatVersion:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  void *inited;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend_setFormatVersion_(v12, v13, v7);
  objc_msgSend_setFileBacked_(v12, v14, (_DWORD)v7 == 3);
  inited = (void *)objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(self, v15, (uint64_t)v11, v10, v12, a6);

  return inited;
}

- (id)initWriterWithMergeableValueID:(id)a3 vectors:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  int v15;
  CKDSWritableStorage *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  CKAtomBatch *v29;
  id v31;

  v10 = a3;
  v11 = a4;
  v14 = a5;
  if (!v14)
    v14 = (id)objc_opt_new();
  v15 = objc_msgSend_fileBacked(v14, v12, v13);
  v16 = [CKDSWritableStorage alloc];
  if (!v15)
  {
    v21 = (id)objc_msgSend_initInMemory(v16, v17, v18);
    goto LABEL_7;
  }
  v31 = 0;
  v19 = objc_msgSend_initWithTemporaryFile_(v16, v17, (uint64_t)&v31);
  v20 = v31;
  v21 = v20;
  if (v19)
  {

    v21 = (id)v19;
LABEL_7:
    objc_msgSend_underlyingWriterOptionsByClass(v14, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_formatVersion(v14, v25, v26);
    self = (CKAtomBatch *)(id)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(self, v28, (uint64_t)v21, v24, v10, v11, v27, a6);

    v29 = self;
    goto LABEL_8;
  }
  if (a6)
  {
    v21 = objc_retainAutorelease(v20);
    v29 = 0;
    *a6 = v21;
  }
  else
  {
    v29 = 0;
  }
LABEL_8:

  return v29;
}

- (CKAtomBatch)initWithStorage:(id)a3 optionsByReaderWriterClass:(id)a4 mergeableValueID:(id)a5 vectors:(id)a6 formatVersion:(unsigned __int8)a7 error:(id *)a8
{
  uint64_t v9;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  id v20;
  char isKindOfClass;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  CKAtomBatch *v27;
  uint64_t v28;
  CKMergeableValueID *mergeableValueID;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  CKMergeableDeltaVectors *vectors;
  const char *v34;
  uint64_t v35;
  id v36;
  void *v37;
  const char *v38;
  CKXBackingStore *v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  int v44;
  CKXBackingStore *backingStore;
  void *v46;
  CKAtomBatch *v47;
  const __CFString *v49;
  const __CFString *v50;
  NSObject *v51;
  unsigned int v52;
  NSObject *v53;
  const char *v54;
  void *v55;
  void *v56;
  const char *v57;
  const char *v58;
  char v59;
  id *v60;
  id v61;
  id v62;
  objc_super v63;
  uint8_t buf[4];
  const __CFString *v65;
  __int16 v66;
  const __CFString *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v9 = a7;
  v70 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v20 = a6;
  if (!v15)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v18, v19);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v56, v57, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 139, CFSTR("Storage must not be nil"));

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_msgSend_fileURL(v15, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v63.receiver = self;
  v63.super_class = (Class)CKAtomBatch;
  v27 = -[CKAtomBatch init](&v63, sel_init);
  if (!v27)
  {
    v36 = 0;
    goto LABEL_13;
  }
  v28 = objc_msgSend_copy(v17, v25, v26);
  mergeableValueID = v27->_mergeableValueID;
  v27->_mergeableValueID = (CKMergeableValueID *)v28;

  v32 = objc_msgSend_copy(v20, v30, v31);
  vectors = v27->_vectors;
  v27->_vectors = (CKMergeableDeltaVectors *)v32;

  if ((isKindOfClass & 1) != 0)
  {
    v62 = 0;
    objc_msgSend__setStorage_optionsByReaderWriterClass_error_(v27, v34, (uint64_t)v15, v16, &v62);
    v36 = v62;
    goto LABEL_12;
  }
  v60 = a8;
  v59 = isKindOfClass;
  if (v9 < 3)
  {
    if (v24)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v34, v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v58, (uint64_t)a2, v27, CFSTR("CKAtomBatch.m"), 159, CFSTR("File-backed batches only supported for format version %d"), 3);
      goto LABEL_29;
    }
  }
  else if (!v20)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v34, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, v27, CFSTR("CKAtomBatch.m"), 157, CFSTR("Expecting non-nil metadata for format version %d"), v9);
LABEL_29:

  }
  v39 = [CKXBackingStore alloc];
  v40 = (void *)objc_opt_class();
  objc_msgSend_bindingForFormatVersion_(v40, v41, v9);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v44 = v9;
  v9 = objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(v39, v43, (uint64_t)v15, v42, v16, v9, &v61);
  v36 = v61;
  backingStore = v27->_backingStore;
  v27->_backingStore = (CKXBackingStore *)v9;
  LODWORD(v9) = v44;

  a8 = v60;
  isKindOfClass = v59;
LABEL_12:
  if (!v27->_backingStore)
  {
    if (a8)
    {
      v36 = objc_retainAutorelease(v36);
      v47 = 0;
      *a8 = v36;
    }
    else
    {
      v47 = 0;
    }
    goto LABEL_17;
  }
LABEL_13:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v46 = (void *)*MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
  {
    if (v24)
      v49 = CFSTR("file-backed ");
    else
      v49 = &stru_1E984CDF0;
    if ((isKindOfClass & 1) != 0)
      v50 = CFSTR("reader");
    else
      v50 = CFSTR("writer");
    v51 = v46;
    v52 = v9;
    v53 = v51;
    CKDSStringForBackingStoreFormatVersion(v52, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v65 = v49;
    v66 = 2112;
    v67 = v50;
    v68 = 2112;
    v69 = v55;
    _os_log_debug_impl(&dword_1D4AFF000, v53, OS_LOG_TYPE_DEBUG, "Created %@%@ atom batch with format version %@", buf, 0x20u);

  }
  v47 = v27;
LABEL_17:

  return v47;
}

- (CKDSReadableStorage)storage
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_backingStore(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readableStorage(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKDSReadableStorage *)v6;
}

- (unsigned)formatVersion
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  unsigned __int8 v11;
  void *v13;
  const char *v14;

  objc_msgSend_backingStore(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 187, CFSTR("Unable to read format version before data is set"));

  }
  objc_msgSend_backingStore(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_formatVersion(v8, v9, v10);

  return v11;
}

- (BOOL)fileBacked
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  objc_msgSend_storage(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURL(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != 0;

  return v7;
}

- (id)writerOptions
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  v3 = (void *)objc_opt_new();
  v6 = objc_msgSend_formatVersion(self, v4, v5);
  objc_msgSend_setFormatVersion_(v3, v7, v6);
  v10 = objc_msgSend_fileBacked(self, v8, v9);
  objc_msgSend_setFileBacked_(v3, v11, v10);
  return v3;
}

- ($06D0163FE0D7AFE752A9F21F38483579)writerIdentity
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  $06D0163FE0D7AFE752A9F21F38483579 v11;
  void *v13;
  const char *v14;

  objc_msgSend_backingStore(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 204, CFSTR("Unable to read writer identity before data is set"));

  }
  objc_msgSend_backingStore(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = ($06D0163FE0D7AFE752A9F21F38483579)objc_msgSend_writerIdentity(v8, v9, v10);

  return v11;
}

- (void)enumerateAtomsWithOptions:(id)a3 usingBlock:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend_backingStore(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 210, CFSTR("Unable to read atoms before data is set"));

  }
  objc_msgSend_backingStore(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D4BCDA40;
  v20[3] = &unk_1E984B970;
  v21 = v7;
  v22 = v8;
  v15 = v8;
  v19 = v7;
  objc_msgSend_readUsingBlock_(v14, v16, (uint64_t)v20);

}

- (void)appendAtomWithBlock:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  CKMergeableValueID *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  CKMergeableValueID *v15;
  const char *v16;
  void *v17;
  const char *v18;
  id v19;
  _QWORD v20[5];
  CKMergeableValueID *v21;
  id v22;

  v5 = a3;
  objc_msgSend_backingStore(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 230, CFSTR("Unable to append atoms before data is set"));

  }
  v11 = self->_mergeableValueID;
  objc_msgSend_backingStore(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D4BCDDDC;
  v20[3] = &unk_1E984B9C0;
  v21 = v11;
  v22 = v5;
  v20[4] = self;
  v15 = v11;
  v19 = v5;
  objc_msgSend_writeUsingBlock_(v14, v16, (uint64_t)v20);

}

- (BOOL)isWriting
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char isWriting;

  objc_msgSend_backingStore(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isWriting = objc_msgSend_isWriting(v3, v4, v5);

  return isWriting;
}

- (void)finishWriting
{
  char v2;
  const char *v3;
  id v4;
  id v5;

  v5 = 0;
  v2 = objc_msgSend_finishWritingWithError_(self, a2, (uint64_t)&v5);
  v4 = v5;
  if ((v2 & 1) == 0)
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v3, *MEMORY[0x1E0C99750], CFSTR("Failed to finish writing: %@"), v4);

}

- (BOOL)finishWritingWithError:(id *)a3
{
  id *v3;
  void *v4;
  const char *v5;

  v3 = a3;
  objc_msgSend_backingStore(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend_finishWritingWithError_(v4, v5, (uint64_t)v3);

  return (char)v3;
}

- (BOOL)validateWithError:(id *)a3
{
  const char *v5;
  uint64_t v6;
  BOOL v7;
  char v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  const char *v47;
  const char *v48;
  const char *v49;
  void *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  _QWORD v76[2];

  v76[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v5, *MEMORY[0x1E0C99778], CFSTR("-[CKAtomBatch finishWritingWithError:] must be called before reading data"));
    return 0;
  }
  else
  {
    v8 = objc_msgSend_formatVersion(self, v5, v6);
    objc_msgSend_vectors(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previous(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_mutableCopy(v14, v15, v16);

    objc_msgSend_contents(v11, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clockVector(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unionVector_(v17, v24, (uint64_t)v23);

    objc_msgSend_contents(v11, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_vectorFilteredByAtomState_(v27, v28, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_contents(v11, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_clockVector(v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend_mutableCopy(v35, v36, v37);

    objc_msgSend_clockVector(v29, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_minusVector_(v38, v42, (uint64_t)v41);

    v43 = (void *)objc_opt_new();
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 1;
    v65 = 0;
    v66 = &v65;
    v67 = 0x3032000000;
    v68 = sub_1D4BCE358;
    v69 = sub_1D4BCE368;
    v70 = 0;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_1D4BCE370;
    v58[3] = &unk_1E984BA38;
    v62 = &v65;
    v63 = &v71;
    v64 = v8;
    v44 = v11;
    v59 = v44;
    v45 = v17;
    v60 = v45;
    v46 = v43;
    v61 = v46;
    objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v47, 0, v58);
    if (!v66[5] && (objc_msgSend_isEqual_(v46, v48, (uint64_t)v38) & 1) == 0)
    {
      *((_BYTE *)v72 + 24) = 0;
      v50 = (void *)MEMORY[0x1E0CB35C8];
      v75 = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v49, (uint64_t)CFSTR("Batch contents %@ not equal to contents vector %@"), v46, v38);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v51;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v52, (uint64_t)v76, &v75, 1);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v50, v54, (uint64_t)CFSTR("CKDSErrorDomain"), 3, v53);
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = (void *)v66[5];
      v66[5] = v55;

    }
    if (a3)
      *a3 = objc_retainAutorelease((id)v66[5]);
    v7 = *((_BYTE *)v72 + 24) != 0;

    _Block_object_dispose(&v65, 8);
    _Block_object_dispose(&v71, 8);

  }
  return v7;
}

- (id)data
{
  void *v4;
  const char *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  void *v11;
  id v13;

  v13 = 0;
  objc_msgSend_dataWithError_(self, a2, (uint64_t)&v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v4)
  {
    v8 = v4;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 368, CFSTR("Unable to retrieve atom batch data: %@"), v7);

    v8 = (id)objc_opt_new();
  }
  v11 = v8;

  return v11;
}

- (id)dataWithError:(id *)a3
{
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v16;
  const char *v17;

  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v6, *MEMORY[0x1E0C99778], CFSTR("-[CKAtomBatch finishWritingWithError:] must be called before reading data"));
    v8 = 0;
  }
  else
  {
    objc_msgSend_backingStore(self, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_readableStorage(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 383, CFSTR("Unexpectedly nil readable storage"));

    }
    objc_msgSend_dataWithError_(v12, v13, (uint64_t)a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)_setStorage:(id)a3 optionsByReaderWriterClass:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  BOOL v17;
  char v18;
  id v19;
  void *v20;
  CKXBackingStore *v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  CKXBackingStore *v26;
  CKXBackingStore *backingStore;
  const char *v28;
  CKXBackingStore *v29;
  void *v30;
  void *v31;
  const char *v32;
  id v34;
  __int16 v35;
  char v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_backingStore(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v39 = *MEMORY[0x1E0CB2D50];
      v40[0] = CFSTR("Cannot replace existing backing store");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v40, &v39, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("CKDSErrorDomain"), 1, v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }
  else
  {
    v36 = 0;
    v35 = 0;
    v34 = 0;
    v18 = objc_msgSend_header_forStorage_error_(CKXBackingStore, v13, (uint64_t)&v35, v8, &v34);
    v19 = v34;
    v20 = v19;
    if ((v18 & 1) != 0)
    {
      v21 = [CKXBackingStore alloc];
      v22 = (void *)objc_opt_class();
      objc_msgSend_bindingForFormatVersion_(v22, v23, v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (CKXBackingStore *)objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(v21, v25, (uint64_t)v8, v24, v9, v35, a5);
      backingStore = self->_backingStore;
      self->_backingStore = v26;

      v29 = self->_backingStore;
      if (v29 && v35 >= 3u && !self->_vectors)
      {
        if (a5)
        {
          v30 = (void *)MEMORY[0x1E0CB35C8];
          v37 = *MEMORY[0x1E0CB2D50];
          v38 = CFSTR("Expecting non-nil vectors");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v28, (uint64_t)&v38, &v37, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorWithDomain_code_userInfo_(v30, v32, (uint64_t)CFSTR("CKDSErrorDomain"), 2, v31);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v29 = self->_backingStore;
        }
        self->_backingStore = 0;

        v29 = self->_backingStore;
      }
      v17 = v29 != 0;
    }
    else
    {
      v17 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v19);
    }

  }
  return v17;
}

- (CKMergeableValueID)mergeableValueID
{
  uint64_t v2;
  CKMergeableValueID **p_mergeableValueID;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  p_mergeableValueID = &self->_mergeableValueID;
  if (!self->_mergeableValueID
    && objc_msgSend_formatVersion(self, a2, v2) <= 2
    && (objc_msgSend_isWriting(self, v5, v6) & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = sub_1D4BCE358;
    v18 = sub_1D4BCE368;
    v19 = 0;
    objc_msgSend_backingStore(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1D4BCEFEC;
    v13[3] = &unk_1E984BA88;
    v13[4] = &v14;
    objc_msgSend_readUsingBlock_(v9, v10, (uint64_t)v13);

    v11 = (void *)v15[5];
    if (v11)
      objc_storeStrong((id *)p_mergeableValueID, v11);
    _Block_object_dispose(&v14, 8);

  }
  return *p_mergeableValueID;
}

- (BOOL)size:(unint64_t *)a3 error:(id *)a4
{
  const char *v7;
  uint64_t v8;
  char v9;
  void *v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  char isEncrypted;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v33;
  unint64_t v34;

  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v7, *MEMORY[0x1E0C99778], CFSTR("-[CKAtomBatch finishWritingWithError:] must be called before getting the size"));
    return 0;
  }
  else
  {
    v34 = 0;
    objc_msgSend_storage(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v9 = objc_msgSend_size_error_(v10, v11, (uint64_t)&v34, &v33);
    v12 = v33;

    if ((v9 & 1) != 0)
    {
      objc_msgSend_mergeableValueID(self, v13, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15
        && (v18 = (void *)v15,
            objc_msgSend_mergeableValueID(self, v16, v17),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            isEncrypted = objc_msgSend_isEncrypted(v19, v20, v21),
            v19,
            v18,
            (isEncrypted & 1) == 0))
      {
        v23 = v34;
      }
      else
      {
        v23 = v34 + 28;
        v34 += 28;
      }
      v24 = v23 + 2;
      if (v23 >= 0x80)
      {
        do
        {
          ++v24;
          v25 = v23 >> 14;
          v23 >>= 7;
        }
        while (v25);
      }
      objc_msgSend__metadataForCoding(self, v16, v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_size(v26, v27, v28);
      v30 = v29 + 2;
      if (v29 >= 0x80)
      {
        do
        {
          ++v30;
          v31 = v29 >> 14;
          v29 >>= 7;
        }
        while (v31);
      }

      if (a3)
        *a3 = v24 + v30 + 16;
    }
    else if (a4)
    {
      *a4 = objc_retainAutorelease(v12);
    }

  }
  return v9;
}

- (int64_t)count
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  int64_t v9;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (objc_msgSend_isWriting(self, a2, v2))
  {
    objc_msgSend_backingStore(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1D4BCF34C;
    v12[3] = &unk_1E984BAB0;
    v12[4] = &v13;
    objc_msgSend_writeUsingBlock_(v6, v7, (uint64_t)v12);
  }
  else
  {
    objc_msgSend_backingStore(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1D4BCF394;
    v11[3] = &unk_1E984BA88;
    v11[4] = &v13;
    objc_msgSend_readUsingBlock_(v6, v8, (uint64_t)v11);
  }

  v9 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v9;
}

- (CKDistributedTimestampStateVector)enumeratedContentsVector
{
  void *v3;
  id v4;
  const char *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D4BCF460;
  v7[3] = &unk_1E984BAD8;
  v4 = v3;
  v8 = v4;
  objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v5, 0, v7);

  return (CKDistributedTimestampStateVector *)v4;
}

- (CKMergeableDeltaVectors)vectors
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  CKMergeableDeltaVectors *v10;
  CKMergeableDeltaVectors *vectors;

  if (!self->_vectors && (objc_msgSend_isWriting(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_enumeratedContentsVector(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C94EC8]);
    v8 = (void *)objc_opt_new();
    v10 = (CKMergeableDeltaVectors *)objc_msgSend_initWithPreviousStateVector_currentStateVector_(v7, v9, (uint64_t)v8, v6);
    vectors = self->_vectors;
    self->_vectors = v10;

  }
  return self->_vectors;
}

- (id)contentsDescriptionWithStringSiteIdentifiers:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const __CFString *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  id v53;
  const char *v54;
  const char *v55;
  id v56;
  _QWORD v58[5];
  id v59;
  uint64_t *v60;
  _QWORD *v61;
  _QWORD *v62;
  BOOL v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  _QWORD v68[4];
  _QWORD v69[5];
  id v70;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = sub_1D4BCE358;
  v69[4] = sub_1D4BCE368;
  v70 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v68[3] = 0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v8 = objc_msgSend_count(self, v6, v7);
  v11 = objc_msgSend_count(self, v9, v10);
  v13 = CFSTR("s");
  if (v11 == 1)
    v13 = &stru_1E984CDF0;
  objc_msgSend_appendFormat_(v5, v12, (uint64_t)CFSTR("Atom Batch (%ld atom%@) {\n"), v8, v13);
  if (objc_msgSend_isWriting(self, v14, v15))
  {
    objc_msgSend_appendFormat_(v5, v16, (uint64_t)CFSTR("  <Writing, not yet fully initialized>\n"));
  }
  else
  {
    objc_msgSend_vectors(self, v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previous(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v22, v23, v3, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v5, v25, (uint64_t)CFSTR("  Previous: %@\n"), v24);

    objc_msgSend_vectors(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_contents(v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v31, v32, v3, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v5, v34, (uint64_t)CFSTR("  Contents: %@\n"), v33);

    objc_msgSend_vectors(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removals(v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v40, v41, v3, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v5, v43, (uint64_t)CFSTR("  Removals: %@\n"), v42);

    objc_msgSend_vectors(self, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dependencies(v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptionWithStringSiteIdentifiers_usingSuperscripts_(v49, v50, v3, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v5, v52, (uint64_t)CFSTR("  Dependencies: %@\n"), v51);

    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_1D4BCF980;
    v58[3] = &unk_1E984BB28;
    v63 = v3;
    v60 = &v64;
    v58[4] = self;
    v61 = v69;
    v62 = v68;
    v53 = v5;
    v59 = v53;
    objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v54, 0, v58);
    if (*((_BYTE *)v65 + 24))
      objc_msgSend_appendFormat_(v53, v55, (uint64_t)CFSTR("\n  }\n"));

  }
  objc_msgSend_appendFormat_(v5, v18, (uint64_t)CFSTR("}"));
  v56 = v5;
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v69, 8);

  return v56;
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  objc_class *v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  unsigned int v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t isWriting;
  const char *v31;
  void *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v48;

  v3 = (void *)objc_opt_new();
  objc_msgSend_backingStore(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readableStorage(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v9;
  if (v9)
  {
    v13 = v9;
  }
  else
  {
    objc_msgSend_backingStore(self, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writableStorage(v14, v15, v16);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v48 = 0;
  objc_msgSend_size_error_(v13, v17, (uint64_t)&v48, 0);
  v18 = (objc_class *)objc_opt_class();
  NSStringFromClass(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v20, (uint64_t)CFSTR("<%@: %p; "), v19, self);

  v23 = objc_msgSend_formatVersion(self, v21, v22);
  CKDSStringForBackingStoreFormatVersion(v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v26, (uint64_t)CFSTR("formatVersion=%@, "), v25);

  v27 = (void *)MEMORY[0x1E0CB37E8];
  isWriting = objc_msgSend_isWriting(self, v28, v29);
  objc_msgSend_numberWithBool_(v27, v31, isWriting);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v33, (uint64_t)CFSTR("isWriting=%@, "), v32);

  objc_msgSend_appendFormat_(v3, v34, (uint64_t)CFSTR("storage=%@, "), v13);
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v35, v48);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendFormat_(v3, v37, (uint64_t)CFSTR("size=%@, "), v36);

  if (self->_mergeableValueID || (objc_msgSend_isWriting(self, v38, v39) & 1) == 0)
  {
    objc_msgSend_mergeableValueID(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v41, (uint64_t)CFSTR("valueID=%@, "), v40);

  }
  if (self->_vectors)
  {
    objc_msgSend_vectors(self, v38, v39);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendFormat_(v3, v43, (uint64_t)CFSTR("vectors=%@, "), v42);

  }
  v44 = objc_msgSend_length(v3, v38, v39);
  objc_msgSend_deleteCharactersInRange_(v3, v45, v44 - 2, 2);
  objc_msgSend_appendFormat_(v3, v46, (uint64_t)CFSTR(">"));

  return v3;
}

- (id)contentsDescription
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_contentsDescriptionWithStringSiteIdentifiers_, 0);
}

- (id)contentsDescriptionWithStringSiteIdentifiers
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_contentsDescriptionWithStringSiteIdentifiers_, 1);
}

- (unint64_t)hash
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;

  objc_msgSend_mergeableValueID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_hash(v4, v5, v6);
  objc_msgSend_vectors(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_hash(v10, v11, v12) ^ v7;

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  CKAtomBatch *v5;
  CKAtomBatch *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char isEqual;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v32;

  v5 = (CKAtomBatch *)a3;
  if (v5 == self)
  {
    isEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend_mergeableValueID(self, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergeableValueID(v6, v10, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v14)
      {
        objc_msgSend_mergeableValueID(self, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mergeableValueID(v6, v16, v17);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqual_(v15, v18, (uint64_t)v3))
        {
          isEqual = 0;
LABEL_13:

LABEL_14:
          goto LABEL_15;
        }
        v32 = v15;
      }
      objc_msgSend_vectors(self, v12, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vectors(v6, v21, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v25)
      {
        isEqual = 1;
      }
      else
      {
        objc_msgSend_vectors(self, v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_vectors(v6, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v26, v30, (uint64_t)v29);

      }
      v15 = v32;
      if (v9 == v14)
        goto LABEL_14;
      goto LABEL_13;
    }
    isEqual = 0;
  }
LABEL_15:

  return isEqual;
}

+ (id)bindingForFormatVersion:(unsigned __int8)a3
{
  if (a3 == 2)
    CKXAtomBindingFormatVersionORC();
  else
    CKXAtomBindingFormatVersionORCv2();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)writableCopyWithMergeableValueID:(id)a3 vectors:(id)a4
{
  id v7;
  id v8;
  CKAtomBatch *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *inited;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  id v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;

  v7 = a3;
  v8 = a4;
  v9 = [CKAtomBatch alloc];
  objc_msgSend_writerOptions(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  inited = (void *)objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v9, v13, (uint64_t)v7, v8, v12, &v36);

  v15 = v36;
  if (v15)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v15, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v32, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 688, v31);

  }
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = sub_1D4BD02A4;
  v33[3] = &unk_1E984BB78;
  v18 = inited;
  v34 = v18;
  v35 = v7;
  v19 = v7;
  objc_msgSend_enumerateAtomsWithOptions_usingBlock_(self, v20, 0, v33);
  objc_msgSend_atomValueDescriptionBlock(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAtomValueDescriptionBlock_(v18, v24, (uint64_t)v23);

  v25 = v35;
  v26 = v18;

  return v26;
}

- (id)writableCopy
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_mergeableValueID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writableCopyWithMergeableValueID_vectors_(self, v5, (uint64_t)v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)atomBatchByMergingAtomBatches:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  CKAtomBatch *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *inited;
  id v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  int v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  const char *v59;
  char v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  const char *v65;
  id v67;
  void *v68;
  id v69;
  id *v70;
  id obj;
  id v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  const __CFString *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;
  _QWORD v89[3];

  v89[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend_count(v5, v6, v7))
  {
    if (objc_msgSend_count(v5, v8, v9) == 1)
    {
      objc_msgSend_firstObject(v5, v10, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = a4;
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v17 = v5;
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v80, v87, 16);
      if (v19)
      {
        v22 = v19;
        v23 = *(_QWORD *)v81;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v81 != v23)
              objc_enumerationMutation(v17);
            objc_msgSend_vectors(*(void **)(*((_QWORD *)&v80 + 1) + 8 * i), v20, v21);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v16, v26, (uint64_t)v25);

          }
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v80, v87, 16);
        }
        while (v22);
      }

      objc_msgSend_mergeableDeltaMetadataVectorsByCombiningVectors_(MEMORY[0x1E0C94EC8], v27, (uint64_t)v16);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v17, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writerOptions(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = [CKAtomBatch alloc];
      objc_msgSend_firstObject(v17, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergeableValueID(v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = 0;
      inited = (void *)objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v35, v42, (uint64_t)v41, v28, v34, &v79);
      v44 = v79;

      if (inited)
      {
        v67 = v44;
        v68 = v28;
        v69 = v5;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        obj = v17;
        v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v75, v86, 16);
        if (v46)
        {
          v49 = v46;
          v50 = *(_QWORD *)v76;
          v51 = MEMORY[0x1E0C809B0];
          while (2)
          {
            for (j = 0; j != v49; ++j)
            {
              if (*(_QWORD *)v76 != v50)
                objc_enumerationMutation(obj);
              v53 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
              v54 = objc_msgSend_formatVersion(v53, v47, v48, v67, v68, v69);
              if (v54 != objc_msgSend_formatVersion(v34, v55, v56))
              {
                if (v70)
                {
                  v63 = (void *)MEMORY[0x1E0CB35C8];
                  v84 = *MEMORY[0x1E0CB2D50];
                  v85 = CFSTR("Unable to merge atom batches with different format versions");
                  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v57, (uint64_t)&v85, &v84, 1);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_errorWithDomain_code_userInfo_(v63, v65, (uint64_t)CFSTR("CKDSErrorDomain"), 2, v64);
                  *v70 = (id)objc_claimAutoreleasedReturnValue();

                }
                v12 = 0;
                v28 = v68;
                v5 = v69;
                v44 = v67;
                goto LABEL_34;
              }
              v73[0] = v51;
              v73[1] = 3221225472;
              v73[2] = sub_1D4BD088C;
              v73[3] = &unk_1E984BAD8;
              v74 = inited;
              objc_msgSend_enumerateAtomsWithOptions_usingBlock_(v53, v58, 0, v73);

            }
            v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v75, v86, 16);
            if (v49)
              continue;
            break;
          }
        }

        v72 = 0;
        v60 = objc_msgSend_finishWritingWithError_(inited, v59, (uint64_t)&v72);
        v61 = v72;
        v62 = v61;
        if ((v60 & 1) != 0)
        {
          v12 = inited;
        }
        else
        {
          v12 = 0;
          if (v70)
            *v70 = objc_retainAutorelease(v61);
        }
        v28 = v68;
        v5 = v69;
        v44 = v67;

      }
      else
      {
        v12 = 0;
        if (v70)
          *v70 = objc_retainAutorelease(v44);
      }
LABEL_34:

    }
  }
  else
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v88 = *MEMORY[0x1E0CB2D50];
      v89[0] = CFSTR("Cannot merge zero atom batches");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v8, (uint64_t)v89, &v88, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, (uint64_t)CFSTR("CKDSErrorDomain"), 2, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0;
  }

  return v12;
}

- (id)splitWithMaximumSize:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  id v8;
  const char *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v7 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D4BD09C4;
  v12[3] = &unk_1E984BBC8;
  v8 = v7;
  v13 = v8;
  if (objc_msgSend_splitWithMaximumSize_error_block_(self, v9, a3, a4, v12))
    v10 = v8;
  else
    v10 = 0;

  return v10;
}

- (BOOL)splitWithMaximumSize:(unint64_t)a3 error:(id *)a4 block:(id)a5
{
  void (**v9)(id, void *);
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  CKAtomBatch *v48;
  CKAtomBatch *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  unint64_t v93;
  const char *v94;
  char v95;
  id v96;
  const char *v97;
  uint64_t v98;
  unint64_t v99;
  id v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  id v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  CKAtomBatch *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t inited;
  id v119;
  void *v120;
  CKAtomBatch *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  id v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  const char *v135;
  const char *v136;
  int v137;
  id v138;
  const char *v139;
  void *v140;
  id v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  CKAtomBatch *v150;
  int v151;
  NSObject *v152;
  void (**v153)(id, void *);
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  CKAtomBatch *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  id v166;
  unint64_t v167;
  id *v168;
  NSObject *v169;
  BOOL v170;
  NSObject *v171;
  void *v173;
  const char *v174;
  id *v175;
  void *v176;
  void *v177;
  void *v178;
  void (**v179)(id, void *);
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  unint64_t v184;
  void *v185;
  CKAtomBatch *v186;
  uint64_t v187;
  void *context;
  unint64_t v189;
  id v190;
  id v191;
  _QWORD v192[4];
  id v193;
  id v194;
  unint64_t v195;
  id v196;
  id v197;
  id v198;
  id v199;
  unint64_t v200;
  uint8_t buf[4];
  CKAtomBatch *v202;
  __int16 v203;
  unint64_t v204;
  uint64_t v205;

  v205 = *MEMORY[0x1E0C80C00];
  v9 = (void (**)(id, void *))a5;
  if (objc_msgSend_isWriting(self, v10, v11))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v12, v13);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v173, v174, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 790, CFSTR("Cannot split an atom batch which is writing"));

  }
  objc_msgSend_vectors(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_previous(v14, v15, v16);
  v181 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vectors(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removals(v19, v20, v21);
  v178 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vectors(self, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dependencies(v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend_mutableCopy(v27, v28, v29);

  objc_msgSend_vectors(self, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_clockVector(v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = v30;
  objc_msgSend_unionVector_(v30, v40, (uint64_t)v39);

  objc_msgSend_vectors(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contents(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_vectorFilteredByAtomState_(v46, v47, 3);
  v177 = (void *)objc_claimAutoreleasedReturnValue();

  v183 = (void *)objc_opt_new();
  v182 = (void *)objc_opt_new();
  v48 = self;
  v49 = v48;
  if (!v48)
  {
    v50 = 0;
    v150 = 0;
    v167 = 0;
LABEL_46:
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v169 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v202 = v49;
      v203 = 2048;
      v204 = v167;
      _os_log_debug_impl(&dword_1D4AFF000, v169, OS_LOG_TYPE_DEBUG, "Successfully split atom batch %@ over %tu iterations", buf, 0x16u);
    }
    v170 = 1;
    goto LABEL_58;
  }
  v175 = a4;
  v50 = 0;
  v187 = 0;
  v51 = 1;
  v186 = v48;
  v184 = a3;
  v179 = v9;
  while (1)
  {
    v52 = v51;
    context = (void *)MEMORY[0x1D82649A4]();
    if (v49 != v186)
    {
      objc_msgSend_vectors(v186, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend_mutableCopy(v58, v59, v60);

      objc_msgSend_vectors(v49, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clockVector(v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_intersectVector_(v61, v71, (uint64_t)v70);

      objc_msgSend_vectors(v49, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_contents(v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_unionStateVector_(v77, v78, (uint64_t)v61);

      if (!v187)
      {
        objc_msgSend_vectors(v49, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_contents(v81, v82, v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v84, v85, (uint64_t)v177);

        objc_msgSend_vectors(v49, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_removals(v88, v89, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_unionStateVector_(v91, v92, (uint64_t)v178);

      }
    }
    v189 = v52;
    v93 = objc_msgSend_count(v49, v53, v54);
    v199 = v50;
    v200 = 0;
    v95 = objc_msgSend_size_error_(v49, v94, (uint64_t)&v200, &v199);
    v96 = v199;

    if ((v95 & 1) == 0)
    {

      objc_autoreleasePoolPop(context);
      v150 = 0;
      v50 = v96;
      v168 = v175;
      v167 = v189;
      goto LABEL_51;
    }
    v99 = v200;
    if (v200 <= a3 || v93 <= 1)
    {
      if (v9)
      {
        v9[2](v9, v49);
        ++v187;
        v99 = v200;
      }
      if (v99 > a3)
      {
        if (*MEMORY[0x1E0C95300] != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v152 = *MEMORY[0x1E0C952C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          v202 = (CKAtomBatch *)v200;
          v203 = 2048;
          v204 = a3;
          _os_log_impl(&dword_1D4AFF000, v152, OS_LOG_TYPE_INFO, "An indivisible batch of size %tu exceeds the maximum requested size %tu, continuing as a best effort", buf, 0x16u);
        }
      }
      v153 = v9;
      objc_msgSend_lastObject(v183, v97, v98);
      v154 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v182, v155, v156);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeLastObject(v183, v157, v158);
      objc_msgSend_removeLastObject(v182, v159, v160);
      if (!v154)
      {
        v150 = 0;
        v166 = v96;
        v140 = 0;
        goto LABEL_29;
      }
      v161 = [CKAtomBatch alloc];
      objc_msgSend_mergeableValueID(v186, v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v198 = v96;
      v150 = (CKAtomBatch *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(v161, v165, v154, 0, v164, v131, 3, &v198);
      v166 = v198;

      v140 = (void *)v154;
      if (v150)
      {
        a3 = v184;
LABEL_29:
        v9 = v153;
        v137 = 1;
        v151 = 4;
        goto LABEL_38;
      }
      v137 = 0;
      v151 = 5;
      a3 = v184;
      v9 = v153;
    }
    else
    {
      v100 = objc_alloc(MEMORY[0x1E0C94EC8]);
      v101 = (void *)objc_opt_new();
      v102 = (void *)objc_opt_new();
      v104 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v100, v103, (uint64_t)v181, v101, v102, v180);

      v105 = objc_alloc(MEMORY[0x1E0C94EC8]);
      v106 = (void *)objc_opt_new();
      v107 = (void *)objc_opt_new();
      v109 = objc_msgSend_initWithPreviousVector_contentsVector_removalsVector_dependenciesVector_(v105, v108, (uint64_t)v181, v106, v107, v180);

      v110 = [CKAtomBatch alloc];
      objc_msgSend_mergeableValueID(v186, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_writerOptions(v186, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v197 = v96;
      v185 = (void *)v104;
      inited = objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v110, v117, (uint64_t)v113, v104, v116, &v197);
      v119 = v197;

      v120 = (void *)inited;
      if (inited)
      {
        v121 = [CKAtomBatch alloc];
        objc_msgSend_mergeableValueID(v186, v122, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_writerOptions(v186, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v196 = v119;
        v129 = (void *)objc_msgSend_initWriterWithMergeableValueID_vectors_options_error_(v121, v128, (uint64_t)v124, v109, v127, &v196);
        v130 = v196;

        v131 = (void *)v109;
        if (v129)
        {
          v176 = (void *)v109;
          v192[0] = MEMORY[0x1E0C809B0];
          v192[1] = 3221225472;
          v192[2] = sub_1D4BD13E0;
          v192[3] = &unk_1E984BBF0;
          v195 = v93;
          v132 = v120;
          v193 = v132;
          v133 = v129;
          v134 = v129;
          v194 = v134;
          objc_msgSend_enumerateAtomsWithOptions_usingBlock_(v49, v135, 0, v192);
          v191 = v130;
          v137 = objc_msgSend_finishWritingWithError_(v132, v136, (uint64_t)&v191);
          v138 = v191;

          v140 = v185;
          if (v137)
          {
            v190 = v138;
            v137 = objc_msgSend_finishWritingWithError_(v134, v139, (uint64_t)&v190);
            v141 = v190;

            if (v137)
            {
              objc_msgSend_storage(v134, v142, v143);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v183, v145, (uint64_t)v144);

              objc_msgSend_vectors(v134, v146, v147);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v182, v149, (uint64_t)v148);

              v150 = (CKAtomBatch *)v132;
              v151 = 0;
              v137 = 1;
            }
            else
            {
              v150 = 0;
              v151 = 5;
            }
            v138 = v141;
          }
          else
          {
            v150 = 0;
            v151 = 5;
          }

          v130 = v138;
          v131 = v176;
          v129 = v133;
        }
        else
        {
          v150 = 0;
          v137 = 0;
          v151 = 5;
          v140 = v185;
        }

        v166 = v130;
      }
      else
      {
        v166 = v119;
        v150 = 0;
        v137 = 0;
        v151 = 5;
        v140 = v185;
        v131 = (void *)v109;
      }

      v9 = v179;
      a3 = v184;
    }
LABEL_38:

    objc_autoreleasePoolPop(context);
    if (v151 == 5)
      break;
    v167 = v189;
    v51 = v189 + 1;
    v49 = v150;
    v50 = v166;
    if (!v150)
      goto LABEL_44;
  }
  v167 = v189;
  v50 = v166;
LABEL_44:
  v168 = v175;
  if (v137)
  {
    v49 = v186;
    goto LABEL_46;
  }
LABEL_51:
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v171 = *MEMORY[0x1E0C952C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v202 = v186;
    v203 = 2048;
    v204 = v167;
    _os_log_error_impl(&dword_1D4AFF000, v171, OS_LOG_TYPE_ERROR, "Failed to split atom batch %@ over %tu iterations", buf, 0x16u);
    if (!v168)
      goto LABEL_57;
LABEL_55:
    v50 = objc_retainAutorelease(v50);
    v170 = 0;
    *v168 = v50;
  }
  else
  {
    if (v168)
      goto LABEL_55;
LABEL_57:
    v170 = 0;
  }
LABEL_58:

  return v170;
}

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v5;
  uint64_t v6;
  CKAtomBatch *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  CKMergeableValueID *mergeableValueID;
  CKMergeableDeltaVectors *vectors;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v28;
  const char *v29;
  id v30;

  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v28, v29, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 968, CFSTR("Cannot copy an atom batch which is writing"));

  }
  v7 = [CKAtomBatch alloc];
  objc_msgSend_storage(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  vectors = self->_vectors;
  mergeableValueID = self->_mergeableValueID;
  v15 = objc_msgSend_formatVersion(self, v13, v14);
  v30 = 0;
  v17 = (void *)objc_msgSend_initWithStorage_optionsByReaderWriterClass_mergeableValueID_vectors_formatVersion_error_(v7, v16, (uint64_t)v10, 0, mergeableValueID, vectors, v15, &v30);
  v18 = v30;

  if (!v17)
  {
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = *MEMORY[0x1E0C99778];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v18, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v19, v26, v20, CFSTR("Failed to copy %@: %@"), v22, v25);

  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  CKMergeableValueID *mergeableValueID;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend_isWriting(self, v6, v7))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v23, v24, (uint64_t)a2, self, CFSTR("CKAtomBatch.m"), 994, CFSTR("Cannot encode an atom batch which is writing"));

  }
  v25 = 0;
  objc_msgSend_dataWithError_(self, v8, (uint64_t)&v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  if (v10)
  {
    mergeableValueID = self->_mergeableValueID;
    NSStringFromSelector(sel_mergeableValueID);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v5, v14, (uint64_t)mergeableValueID, v13);

    if (self->_vectors)
    {
      objc_msgSend__metadataForCoding(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_encodeObject_forKey_(v5, v18, (uint64_t)v17, CFSTR("metadata"));

    }
    else
    {
      objc_msgSend_encodeObject_forKey_(v5, v15, 0, CFSTR("metadata"));
    }
    NSStringFromSelector(sel_data);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_encodeObject_forKey_(v5, v22, (uint64_t)v10, v21);

  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v11;
      _os_log_error_impl(&dword_1D4AFF000, v19, OS_LOG_TYPE_ERROR, "Error exporting data for atom batch in coder: %@", buf, 0xCu);
    }
    objc_msgSend_failWithError_(v5, v20, (uint64_t)v11);
  }

}

- (CKAtomBatch)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  id v21;
  NSObject *v22;
  const char *v23;
  CKAtomBatch *v24;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_mergeableValueID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v10, v9, CFSTR("metadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  NSStringFromSelector(sel_data);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v14, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_vectors(v11, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v20 = (void *)objc_msgSend_initWithData_mergeableValueID_vectors_error_(self, v19, (uint64_t)v15, v8, v18, &v26);
  v21 = v26;

  if (v21)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v22 = *MEMORY[0x1E0C952C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_error_impl(&dword_1D4AFF000, v22, OS_LOG_TYPE_ERROR, "Error initializing atom batch from data in coder: %@", buf, 0xCu);
    }
    objc_msgSend_failWithError_(v4, v23, (uint64_t)v21);
    v24 = 0;
  }
  else
  {
    v24 = v20;
  }

  return v24;
}

- (id)_metadataForCoding
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  v16[1] = 0;
  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  v5 = (void *)objc_msgSend_initWithUUIDBytes_(v3, v4, (uint64_t)v16);
  objc_msgSend_UUIDString(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0C94EC0]);
  objc_msgSend_vectors(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_initWithIdentifier_vectors_replacedDeltaIdentifiers_(v9, v13, (uint64_t)v8, v12, 0);

  return v14;
}

- (id)atomValueDescriptionBlock
{
  return self->_atomValueDescriptionBlock;
}

- (void)setAtomValueDescriptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (CKXBackingStore)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
  objc_storeStrong((id *)&self->_backingStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong(&self->_atomValueDescriptionBlock, 0);
  objc_storeStrong((id *)&self->_mergeableValueID, 0);
  objc_storeStrong((id *)&self->_vectors, 0);
}

@end
