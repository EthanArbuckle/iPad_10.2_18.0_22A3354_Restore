@implementation CKXBackingStore

- (CKXBackingStore)initWithStorage:(id)a3 binding:(id)a4 error:(id *)a5
{
  return (CKXBackingStore *)objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(self, a2, (uint64_t)a3, a4, 0, 3, a5);
}

- (id)initWriterWithStorage:(id)a3 binding:(id)a4 formatVersion:(unsigned __int8)a5
{
  return (id)objc_msgSend_initWithStorage_binding_optionsByReaderWriterClass_formatVersion_error_(self, a2, (uint64_t)a3, a4, 0, a5, 0);
}

- (CKXBackingStore)initWithStorage:(id)a3 binding:(id)a4 optionsByReaderWriterClass:(id)a5 formatVersion:(unsigned __int8)a6 error:(id *)a7
{
  id v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  CKXBackingStore *v19;
  char isKindOfClass;
  char *v21;
  uint64_t v22;
  void *v23;
  CKXVersionedReaderWriterStore *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  const char *v33;
  uint64_t v34;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  SEL v42;
  void *v43;
  void *v44;
  objc_super v45;

  v14 = a3;
  v15 = a4;
  v18 = a5;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v36, v37, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 60, CFSTR("Storage must not be nil"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 61, CFSTR("Binding must not be nil"));

LABEL_3:
  v42 = a2;
  v19 = (CKXBackingStore *)a7;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v45.receiver = self;
  v45.super_class = (Class)CKXBackingStore;
  v21 = -[CKXBackingStore init](&v45, sel_init);
  if (v21)
  {
    v22 = objc_opt_new();
    v23 = (void *)*((_QWORD *)v21 + 4);
    *((_QWORD *)v21 + 4) = v22;

    objc_storeStrong((id *)v21 + 8, a4);
    v24 = [CKXVersionedReaderWriterStore alloc];
    v26 = objc_msgSend_initWithBinding_optionsByReaderWriterClass_(v24, v25, (uint64_t)v15, v18);
    v27 = (void *)*((_QWORD *)v21 + 3);
    *((_QWORD *)v21 + 3) = v26;

    objc_storeStrong((id *)v21 + 2, a3);
    if ((isKindOfClass & 1) != 0)
    {
      *((_WORD *)v21 + 4) = 0;
      v21[10] = 0;
      v44 = 0;
      v29 = objc_msgSend__setupBackingStoreForReadingWithError_(v21, v28, (uint64_t)&v44);
      v30 = v44;
    }
    else
    {
      v21[8] = a6;
      *(_WORD *)(v21 + 9) = 1025;
      v43 = 0;
      v29 = objc_msgSend__setupBackingStoreForWritingWithError_(v21, v28, (uint64_t)&v43);
      v30 = v43;
    }
    v32 = v30;
    v31 = v32;
    if ((v29 & 1) == 0)
    {
      if (v32)
      {
        if (!a7)
          goto LABEL_13;
      }
      else
      {
        objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v33, v34);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)v42, v21, CFSTR("CKXBackingStore.mm"), 90, CFSTR("No error found for failed backing store init"));

        if (!a7)
          goto LABEL_13;
      }
      v31 = objc_retainAutorelease(v31);
      v19 = 0;
      *a7 = v31;
      goto LABEL_13;
    }
  }
  else
  {
    v31 = 0;
  }
  v19 = v21;
LABEL_13:

  return v19;
}

- (BOOL)_validateVersion:(unsigned __int8)a3 isReader:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  unsigned int v7;
  const char *v8;
  char v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v6 = a4;
  v7 = a3;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, a2, a3);
  if ((v9 & 1) != 0)
    return v9;
  if (v6)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    if (v7 >= 4)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Unknown reader format version %d"), v7);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v16 = (void *)v11;
      goto LABEL_12;
    }
    if (!v7)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Invalid reader format version"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    CKDSStringForBackingStoreFormatVersion(v7, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v10, v15, (uint64_t)CFSTR("Unsupported reader format version %@"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    if ((v7 - 4) <= 0xFCu)
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("Unknown writer format version"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    CKDSStringForBackingStoreFormatVersion(v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v18, (uint64_t)CFSTR("Unsupported writer format version %@"), v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v12, (uint64_t)v25, &v24, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v19, v21, (uint64_t)CFSTR("CKDSErrorDomain"), 4, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v22);

  return v9;
}

- (BOOL)_setupBackingStoreForReadingWithError:(id *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  char isReader_error;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  unint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  id v51;
  BOOL v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  char v65;
  uint64_t v66;
  const char *v67;
  void *v68;
  CKDSReadableStorage *v69;
  const char *v70;
  void *v71;
  const char *v72;
  char v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  CKXReadStructProxy *topLevelReadProxy;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  unsigned int v90;
  const char *v91;
  void *v92;
  const char *v93;
  __int128 v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  const __CFString *v101;
  uint64_t v102;
  _QWORD v103[2];

  v103[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_readableStorage(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v83, v84, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 142, CFSTR("Readable storage not present"));

  }
  if (self->_topLevelReadProxy)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v85, v86, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 143, CFSTR("Backing store already set up for reading"));

  }
  v9 = (void *)objc_opt_class();
  objc_msgSend_readableStorage(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0;
  v14 = objc_msgSend_header_forStorage_error_(v9, v13, (uint64_t)&self->_header, v12, &v99);
  v15 = v99;

  if ((v14 & 1) != 0)
  {
    v18 = objc_msgSend_formatVersion(self, v16, v17);
    v98 = 0;
    isReader_error = objc_msgSend__validateVersion_isReader_error_(self, v19, v18, 1, &v98);
    v21 = v98;
    v24 = v21;
    if ((isReader_error & 1) == 0)
    {
      v52 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v21);
      goto LABEL_29;
    }
    objc_msgSend_readerWriterStore(self, v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_formatVersion(self, v26, v27);
    objc_msgSend_readerForVersion_(v25, v29, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v31, v32);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend_formatVersion(self, v88, v89);
      CKDSStringForBackingStoreFormatVersion(v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v87, v93, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 167, CFSTR("Reader unexpectedly unavailable for atom batch format version %@"), v92);

    }
    v33 = (void *)objc_opt_class();
    v36 = objc_msgSend_formatVersion(self, v34, v35);
    v38 = objc_msgSend_headerSizeForFormatVersion_(v33, v37, v36);
    objc_msgSend_readableStorage(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_fileURL(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44 == 0;

    if (v45)
    {
      objc_msgSend_readableStorage(self, v46, v47);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v53, v54, v55);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend_length(v49, v56, v57) < v38)
      {
        v60 = (void *)MEMORY[0x1E0CB35C8];
        v100 = *MEMORY[0x1E0CB2D50];
        v101 = CFSTR("Invalid file length");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v58, (uint64_t)&v101, &v100, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v60, v62, (uint64_t)CFSTR("CKDSErrorDomain"), 5, v61);
        v51 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      v66 = objc_msgSend_length(v49, v58, v59);
      objc_msgSend_subdataWithRange_(v49, v67, v38, v66 - v38);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = [CKDSReadableStorage alloc];
      v71 = (void *)objc_msgSend_initWithData_(v69, v70, (uint64_t)v68);
      v96 = 0;
      v73 = objc_msgSend_setReadableStorage_error_(v30, v72, (uint64_t)v71, &v96);
      v51 = v96;

      if ((v73 & 1) == 0)
        goto LABEL_21;
    }
    else
    {
      if (v38)
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v102 = *MEMORY[0x1E0CB2D50];
        v103[0] = CFSTR("Not implemented");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v46, (uint64_t)v103, &v102, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v48, v50, (uint64_t)CFSTR("CKDSErrorDomain"), 1, v49);
        v51 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
        if (a3)
          *a3 = objc_retainAutorelease(v51);

        v52 = 0;
        goto LABEL_28;
      }
      objc_msgSend_readableStorage(self, v46, v47);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = 0;
      v65 = objc_msgSend_setReadableStorage_error_(v30, v64, (uint64_t)v63, &v97);
      v51 = v97;

      if ((v65 & 1) == 0)
        goto LABEL_21;
    }

    v94 = 0uLL;
    v95 = 0;
    objc_msgSend_binding(self, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend_topLevelStructToken(v76, v77, v78);
    objc_msgSend_rootStructWithType_(self, v80, v79);

    topLevelReadProxy = self->_topLevelReadProxy;
    self->_topLevelReadProxy = 0;

    v52 = 1;
LABEL_28:

LABEL_29:
    goto LABEL_30;
  }
  v52 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v15);
LABEL_30:

  return v52;
}

- (BOOL)_setupBackingStoreForWritingWithError:(id *)a3
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  char isReader_error;
  id v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  char v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  const char *v39;
  CKXWriteStructProxy *v40;
  CKXWriteStructProxy *topLevelWriteProxy;
  id v42;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  unsigned int v51;
  const char *v52;
  void *v53;
  const char *v54;
  __int128 v55;
  uint64_t v56;
  id v57;
  __int128 v58;
  uint64_t v59;
  id v60;
  id v61;

  objc_msgSend_writableStorage(self, a2, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v44, v45, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 216, CFSTR("Writable storage not present"));

  }
  if (self->_topLevelWriteProxy)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v7, v8);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v46, v47, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 217, CFSTR("Backing store already set up for writing"));

  }
  v9 = objc_msgSend_formatVersion(self, v7, v8);
  v61 = 0;
  isReader_error = objc_msgSend__validateVersion_isReader_error_(self, v10, v9, 0, &v61);
  v12 = v61;
  v15 = v12;
  if ((isReader_error & 1) != 0)
  {
    objc_msgSend_readerWriterStore(self, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_formatVersion(self, v17, v18);
    objc_msgSend_writerForVersion_(v16, v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v22, v23);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_formatVersion(self, v49, v50);
      CKDSStringForBackingStoreFormatVersion(v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v48, v54, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 231, CFSTR("Writer unexpectedly unavailable for atom batch format version %@"), v53);

    }
    objc_msgSend_writableStorage(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v26 = objc_msgSend_setWritableStorage_error_(v21, v25, (uint64_t)v24, &v60);
    v27 = v60;

    if ((v26 & 1) != 0)
    {

      v58 = 0uLL;
      v59 = 0;
      objc_msgSend_binding(self, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_topLevelStructToken(v30, v31, v32);
      v57 = 0;
      objc_msgSend_beginRootStructWithType_error_(self, v34, v33, &v57);
      v27 = v57;

      v37 = (_QWORD)v58 != 0;
      if ((_QWORD)v58)
      {
        v55 = v58;
        v56 = v59;
        v38 = objc_msgSend_cacheScope(self, v35, v36);
        objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v39, (uint64_t)&v55, 1, v38);
        v40 = (CKXWriteStructProxy *)objc_claimAutoreleasedReturnValue();
        topLevelWriteProxy = self->_topLevelWriteProxy;
        self->_topLevelWriteProxy = v40;

LABEL_20:
        goto LABEL_21;
      }
      if (!a3)
        goto LABEL_20;
      v42 = objc_retainAutorelease(v27);
    }
    else
    {
      if (!a3)
      {
        v37 = 0;
        goto LABEL_20;
      }
      v42 = objc_retainAutorelease(v27);
      v27 = v42;
      v37 = 0;
    }
    *a3 = v42;
    goto LABEL_20;
  }
  v37 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v12);
LABEL_21:

  return v37;
}

- (CKDSReadableStorage)readableStorage
{
  CKDSStorage *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_storage;
  else
    v3 = 0;
  return (CKDSReadableStorage *)v3;
}

- (CKDSWritableStorage)writableStorage
{
  CKDSStorage *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_storage;
  else
    v3 = 0;
  return (CKDSWritableStorage *)v3;
}

- (BOOL)isWriting
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_writableStorage(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (unsigned)formatVersion
{
  uint64_t v2;

  return objc_msgSend_header(self, a2, v2);
}

- ($06D0163FE0D7AFE752A9F21F38483579)writerIdentity
{
  uint64_t v2;

  return ($06D0163FE0D7AFE752A9F21F38483579)(objc_msgSend_header(self, a2, v2) >> 8);
}

- (id)reader
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;

  if (objc_msgSend_isWriting(self, a2, v2))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 291, CFSTR("Reading not permitted while writing"));

  }
  objc_msgSend_readerWriterStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_formatVersion(self, v8, v9);
  objc_msgSend_readerForVersion_(v7, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 293, CFSTR("Reader not found"));

  }
  return v12;
}

- (id)writer
{
  uint64_t v2;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;

  if ((objc_msgSend_isWriting(self, a2, v2) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v5, v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 298, CFSTR("Writing not permitted while reading"));

  }
  objc_msgSend_readerWriterStore(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_formatVersion(self, v8, v9);
  objc_msgSend_writerForVersion_(v7, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 300, CFSTR("Writer not found"));

  }
  return v12;
}

- (void)readUsingBlock:(id)a3
{
  void (**v5)(id, NSObject *);
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  unsigned __int8 v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  unsigned __int8 v26;
  const char *v27;
  uint64_t v28;
  unsigned __int8 v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  unsigned __int8 v33;
  const char *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  unsigned __int8 v38;
  const char *v39;
  uint64_t v40;
  unsigned __int8 v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  int v47;
  id v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, NSObject *))a3;
  v6 = (void *)MEMORY[0x1D82649A4]();
  if (objc_msgSend_isWriting(self, v7, v8))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v9, v10);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v45, v46, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 306, CFSTR("finishWriting needs to be called before any data can be read"));

  }
  objc_msgSend_topLevelReadProxy(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)*MEMORY[0x1E0C952F8];
  if (v11)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v12);
    v13 = (id)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend_header(self, v14, v15);
      CKDSStringForBackingStoreFormatVersion(v21, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (unsigned __int16)objc_msgSend_header(self, v24, v25) >> 8;
      v29 = objc_msgSend_header(self, v27, v28) >> 16;
      objc_msgSend_readableStorage(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138413058;
      v48 = v23;
      v49 = 1024;
      v50 = v26;
      v51 = 1024;
      v52 = v29;
      v53 = 2112;
      v54 = v32;
      _os_log_debug_impl(&dword_1D4AFF000, v13, OS_LOG_TYPE_DEBUG, "Reading %@ file with writer code %u, writer version %d, and storage %@", (uint8_t *)&v47, 0x22u);

    }
    objc_msgSend_topLevelReadProxy(self, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v18);
  }
  else
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v12);
    v18 = (id)*MEMORY[0x1E0C952C0];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v33 = objc_msgSend_header(self, v19, v20);
      CKDSStringForBackingStoreFormatVersion(v33, v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v38 = (unsigned __int16)objc_msgSend_header(self, v36, v37) >> 8;
      v41 = objc_msgSend_header(self, v39, v40) >> 16;
      objc_msgSend_readableStorage(self, v42, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138413058;
      v48 = v35;
      v49 = 1024;
      v50 = v38;
      v51 = 1024;
      v52 = v41;
      v53 = 2112;
      v54 = v44;
      _os_log_debug_impl(&dword_1D4AFF000, v18, OS_LOG_TYPE_DEBUG, "Skipping read for %@ file with writer code %u, writer version %d, and storage %@, due to null root struct", (uint8_t *)&v47, 0x22u);

    }
  }

  objc_autoreleasePoolPop(v6);
}

- (void)writeUsingBlock:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a3;
  v5 = (void *)MEMORY[0x1D82649A4]();
  if ((objc_msgSend_isWriting(self, v6, v7) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 320, CFSTR("Writing not permitted after finishWriting has already been called"));

  }
  objc_msgSend_topLevelWriteProxy(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13, v10);

  objc_autoreleasePoolPop(v5);
}

- (BOOL)finishWritingWithError:(id *)a3
{
  const char *v5;
  char v6;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  char v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  CKDSStorage *v23;
  CKDSStorage *storage;
  const char *v25;
  uint64_t v26;
  CKXWriteStructProxy *topLevelWriteProxy;
  const char *v28;
  char v29;
  BOOL v30;
  id v32;
  id v33;
  id v34;

  if (objc_msgSend_isWriting(self, a2, (uint64_t)a3))
  {
    v34 = 0;
    v6 = objc_msgSend_flushWithError_(self, v5, (uint64_t)&v34);
    v7 = v34;
    if ((v6 & 1) != 0)
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend_writableStorage(self, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend_formatVersion(self, v12, v13);
      v33 = v7;
      v16 = objc_msgSend_prefixStorage_withHeaderForVersion_error_(v8, v15, (uint64_t)v11, v14, &v33);
      v17 = v33;

      if ((v16 & 1) == 0)
      {
        if (!a3)
        {
          v30 = 0;
          v7 = v17;
          goto LABEL_12;
        }
        v7 = v17;
        goto LABEL_11;
      }
      objc_msgSend_writableStorage(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_readableStorage(v20, v21, v22);
      v23 = (CKDSStorage *)objc_claimAutoreleasedReturnValue();
      storage = self->_storage;
      self->_storage = v23;

      objc_msgSend_reset(self->_topLevelWriteProxy, v25, v26);
      topLevelWriteProxy = self->_topLevelWriteProxy;
      self->_topLevelWriteProxy = 0;

      v32 = v17;
      v29 = objc_msgSend__setupBackingStoreForReadingWithError_(self, v28, (uint64_t)&v32);
      v7 = v32;

      if ((v29 & 1) != 0)
      {
        v30 = 1;
LABEL_12:

        return v30;
      }
    }
    if (!a3)
    {
      v30 = 0;
      goto LABEL_12;
    }
LABEL_11:
    v7 = objc_retainAutorelease(v7);
    v30 = 0;
    *a3 = v7;
    goto LABEL_12;
  }
  return 1;
}

- (id)structProxyForStructReference:(unint64_t)a3 inStructInstance:(id *)a4 mutable:(BOOL)a5
{
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v13;
  __int128 v14;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v15;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  if (!a4->var0)
    goto LABEL_7;
  v5 = a5;
  if (a5)
  {
    v16 = *a4;
    objc_msgSend_beginReferencedStructForReference_inStruct_(self, a2, a3, &v16);
  }
  else
  {
    v15 = *a4;
    objc_msgSend_referencedStructForReference_inStruct_(self, a2, a3, &v15);
  }
  v19 = v18;
  if (v17)
  {
    v13 = v17;
    v14 = v19;
    v9 = objc_msgSend_cacheScope(self, v7, v8);
    objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v10, (uint64_t)&v13, v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v11 = 0;
  }
  return v11;
}

- (id)structListProxyForListReference:(unint64_t)a3 inStructInstance:(id *)a4 mutable:(BOOL)a5
{
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  uint64_t v13;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v14;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  if (!a4->var0)
    goto LABEL_7;
  v5 = a5;
  if (a5)
  {
    v15 = *a4;
    objc_msgSend_beginReferencedListForReference_inStruct_(self, a2, a3, &v15);
  }
  else
  {
    v14 = *a4;
    objc_msgSend_referencedListForReference_inStruct_(self, a2, a3, &v14);
  }
  v19 = v18;
  if (v17)
  {
    v9 = objc_msgSend_cacheScope(self, v7, v8, v16, v17, v19);
    objc_msgSend__proxyWithListInstance_mutable_cacheScope_(self, v10, (uint64_t)&v13, v5, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v11 = 0;
  }
  return v11;
}

- (id)appendedStructProxyForListInstance:(id *)a3
{
  __int128 v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  __int128 v11;
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;

  if (a3->var1
    && (v13 = 0uLL,
        v14 = 0,
        v4 = *(_OWORD *)&a3->var2,
        v12[0] = *(_OWORD *)&a3->var0,
        v12[1] = v4,
        objc_msgSend_beginAppendedListStructInList_(self, a2, (uint64_t)v12),
        (_QWORD)v13))
  {
    v7 = objc_msgSend_cacheScope(self, v5, v6, v13, v14);
    objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v8, (uint64_t)&v11, 1, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)structProxyForListInstance:(id *)a3 atIndex:(int64_t)a4
{
  __int128 v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  __int128 v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;

  if (a3->var1
    && (v14 = 0uLL,
        v15 = 0,
        v5 = *(_OWORD *)&a3->var2,
        v13[0] = *(_OWORD *)&a3->var0,
        v13[1] = v5,
        objc_msgSend_referencedStructAtIndex_inList_(self, a2, a4, v13),
        (_QWORD)v14))
  {
    v8 = objc_msgSend_cacheScope(self, v6, v7, v14, v15);
    objc_msgSend__proxyWithStructInstance_mutable_cacheScope_(self, v9, (uint64_t)&v12, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_proxyWithStructInstance:(id *)a3 mutable:(BOOL)a4 cacheScope:(int64_t)a5
{
  _BOOL4 v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  const char *v17;
  const char *v18;
  void *v21;
  const char *v22;
  __int128 v23;
  unint64_t var2;

  v6 = a4;
  if (a3->var0 == -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v21, v22, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 443, CFSTR("Invalid struct token"));

    if (a3->var0)
      goto LABEL_3;
    return 0;
  }
  if (!a3->var0)
    return 0;
LABEL_3:
  objc_msgSend_proxyCache(self, a2, (uint64_t)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_binding(self, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v14 = objc_msgSend_mutableProxyClassForStructToken_(v13, v12, a3->var0);
  else
    v14 = objc_msgSend_proxyClassForStructToken_(v13, v12, a3->var0);
  objc_msgSend_proxyForClass_withScope_(v9, v15, v14, a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_associateWithBackingStore_(v16, v17, (uint64_t)self);
  v23 = *(_OWORD *)&a3->var0;
  var2 = a3->var2;
  objc_msgSend_associateWithStructInstance_(v16, v18, (uint64_t)&v23);
  return v16;
}

- (id)_proxyWithListInstance:(id *)a3 mutable:(BOOL)a4 cacheScope:(int64_t)a5
{
  unint64_t var1;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  __int128 v14;
  const char *v15;
  void *v18;
  const char *v19;
  _OWORD v20[2];

  var1 = a3->var1;
  if (var1 == -1)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 456, CFSTR("Invalid struct token"));

    if (a3->var1)
      goto LABEL_3;
  }
  else if (var1)
  {
LABEL_3:
    objc_msgSend_proxyCache(self, a2, (uint64_t)a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    objc_msgSend_proxyForClass_withScope_(v9, v11, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_associateWithBackingStore_(v12, v13, (uint64_t)self);
    v14 = *(_OWORD *)&a3->var2;
    v20[0] = *(_OWORD *)&a3->var0;
    v20[1] = v14;
    objc_msgSend_associateWithListInstance_(v12, v15, (uint64_t)v20);
    return v12;
  }
  return 0;
}

- (void)proxyScope:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  void (**v19)(void);

  v19 = (void (**)(void))a3;
  v6 = objc_msgSend_cacheScope(self, v4, v5);
  v9 = objc_msgSend_cacheScope(self, v7, v8) + 1;
  objc_msgSend_setCacheScope_(self, v10, v9);
  v12 = objc_msgSend_setCacheScope_(self, v11, v9);
  v13 = (void *)MEMORY[0x1D82649A4](v12);
  v19[2]();
  objc_autoreleasePoolPop(v13);
  objc_msgSend_proxyCache(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_putBackAllProxiesWithScope_(v16, v17, v9);

  objc_msgSend_setCacheScope_(self, v18, v6);
}

- (id)readerForProxy:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v11;
  const char *v12;

  v5 = a3;
  if (objc_msgSend_isMutable(v5, v6, v7))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 480, CFSTR("Proxy must be immutable for reading"));

  }
  return self;
}

- (id)writerForProxy:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  const char *v13;
  void *v15;
  const char *v16;

  v5 = a3;
  if ((objc_msgSend_isMutable(v5, v6, v7) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v8, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 485, CFSTR("Proxy must be mutable for writing"));

  }
  if (objc_msgSend_committed(v5, v8, v9))
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_raise_format_(v10, v13, *MEMORY[0x1E0C99768], CFSTR("Write proxy %@ was retained out of scope and cannot be reused"), v12);

  }
  return self;
}

- (id)schema
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_binding(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_schema(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)valueSizeForField:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;

  objc_msgSend_schema(self, a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = sub_1D4BB5864((uint64_t)v4, (const char *)a3, v5);

  return v6;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)rootStructWithType:(SEL)a3
{
  void *v6;
  const char *v7;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v9;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend_reader(self, a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v6)
  {
    objc_msgSend_rootStructWithType_(v6, v7, a4);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  __int128 v18;
  unint64_t var2;

  objc_msgSend_schema(self, a3, a4);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend_reader(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_referencedStructForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)referencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  __int128 v18;
  unint64_t var2;

  objc_msgSend_schema(self, a3, a4);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = -1;
    retstr->var3 = -1;
    return result;
  }
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  objc_msgSend_reader(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_referencedListForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }

  return result;
}

- (BOOL)referenceIsNull:(unint64_t)a3 inStruct:(id *)a4
{
  _QWORD *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char IsNull_inStruct;
  __int128 v16;
  unint64_t var2;

  objc_msgSend_schema(self, a2, a3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (v8 = v7[10], 0x6DB6DB6DB6DB6DB7 * ((v7[11] - v8) >> 3) <= a3))
  {

    return 1;
  }
  v9 = *(unsigned __int8 *)(v8 + 56 * a3);

  if (!v9)
    return 1;
  objc_msgSend_reader(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)&a4->var0;
  var2 = a4->var2;
  IsNull_inStruct = objc_msgSend_referenceIsNull_inStruct_(v12, v13, a3, &v16);

  return IsNull_inStruct;
}

- (int64_t)lengthForList:(id *)a3
{
  void *v4;
  __int128 v5;
  const char *v6;
  int64_t v7;
  _OWORD v9[2];

  if (!a3->var1)
    return 0;
  objc_msgSend_reader(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->var2;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  v7 = objc_msgSend_lengthForList_(v4, v6, (uint64_t)v9);

  return v7;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)referencedStructAtIndex:(SEL)a3 inList:(int64_t)a4
{
  _QWORD *v9;
  unint64_t var1;
  uint64_t v11;
  int v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  __int128 v19;
  _OWORD v20[2];

  objc_msgSend_schema(self, a3, a4);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (var1 = a5->var1, v11 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v11) >> 3) <= var1))
  {

    goto LABEL_7;
  }
  v12 = *(unsigned __int8 *)(v11 + 56 * var1);

  if (!v12)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend_reader(self, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v16;
  v19 = *(_OWORD *)&a5->var2;
  v20[0] = *(_OWORD *)&a5->var0;
  v20[1] = v19;
  if (v16)
  {
    objc_msgSend_referencedStructAtIndex_inList_(v16, v17, a4, v20);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (void)copyData:(void *)a3 forField:(unint64_t)a4 inStruct:(id *)a5
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  unint64_t var2;

  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v9 && (v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) > a4))
  {
    v11 = *(unsigned __int8 *)(v10 + 56 * a4);

    if (v11)
    {
      objc_msgSend_reader(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_OWORD *)&a5->var0;
      var2 = a5->var2;
      objc_msgSend_copyData_forField_inStruct_(v14, v15, (uint64_t)a3, a4, &v16);

    }
  }
  else
  {

  }
}

- (void)copyData:(void *)a3 forList:(id *)a4
{
  _QWORD *v7;
  unint64_t var1;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  const char *v15;
  _OWORD v16[2];

  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v7 && (var1 = a4->var1, v9 = v7[10], 0x6DB6DB6DB6DB6DB7 * ((v7[11] - v9) >> 3) > var1))
  {
    v10 = *(unsigned __int8 *)(v9 + 56 * var1);

    if (v10)
    {
      objc_msgSend_reader(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_OWORD *)&a4->var2;
      v16[0] = *(_OWORD *)&a4->var0;
      v16[1] = v14;
      objc_msgSend_copyData_forList_(v13, v15, (uint64_t)a3, v16);

    }
  }
  else
  {

  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginRootStructWithType:(SEL)a3 error:(unint64_t)a4
{
  void *v8;
  const char *v9;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v11;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend_writer(self, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  if (v8)
  {
    objc_msgSend_beginRootStructWithType_error_(v8, v9, a4, a5);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginReferencedStructForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  __int128 v18;
  unint64_t var2;

  objc_msgSend_schema(self, a3, a4);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend_writer(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_beginReferencedStructForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- ($3CC19D079FD0B010EE84973AA846B91B)beginReferencedListForReference:(SEL)a3 inStruct:(unint64_t)a4
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  $3CC19D079FD0B010EE84973AA846B91B *result;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  __int128 v18;
  unint64_t var2;

  objc_msgSend_schema(self, a3, a4);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v9 || (v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) <= a4))
  {

    goto LABEL_7;
  }
  v11 = *(unsigned __int8 *)(v10 + 56 * a4);

  if (!v11)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = -1;
    retstr->var3 = -1;
    return result;
  }
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  objc_msgSend_writer(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = *(_OWORD *)&a5->var0;
  var2 = a5->var2;
  if (v15)
  {
    objc_msgSend_beginReferencedListForReference_inStruct_(v15, v16, a4, &v18);
  }
  else
  {
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }

  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)beginAppendedListStructInList:(SEL)a3
{
  _QWORD *v7;
  unint64_t var1;
  uint64_t v9;
  int v10;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  __int128 v17;
  _OWORD v18[2];

  objc_msgSend_schema(self, a3, (uint64_t)a4);
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v7 || (var1 = a4->var1, v9 = v7[10], 0x6DB6DB6DB6DB6DB7 * ((v7[11] - v9) >> 3) <= var1))
  {

    goto LABEL_7;
  }
  v10 = *(unsigned __int8 *)(v9 + 56 * var1);

  if (!v10)
  {
LABEL_7:
    retstr->var0 = 0;
    retstr->var1 = -1;
    retstr->var2 = -1;
    return result;
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  objc_msgSend_writer(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  v17 = *(_OWORD *)&a4->var2;
  v18[0] = *(_OWORD *)&a4->var0;
  v18[1] = v17;
  if (v14)
  {
    objc_msgSend_beginAppendedListStructInList_(v14, v15, (uint64_t)v18);
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }

  return result;
}

- (void)setData:(void *)a3 withEncoding:(const char *)a4 forField:(unint64_t)a5 inStruct:(id *)a6
{
  _QWORD *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  __int128 v18;
  unint64_t var2;

  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v11 && (v12 = v11[10], 0x6DB6DB6DB6DB6DB7 * ((v11[11] - v12) >> 3) > a5))
  {
    v13 = *(unsigned __int8 *)(v12 + 56 * a5);

    if (v13)
    {
      objc_msgSend_writer(self, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_OWORD *)&a6->var0;
      var2 = a6->var2;
      objc_msgSend_setData_withEncoding_forField_inStruct_(v16, v17, (uint64_t)a3, a4, a5, &v18);

    }
  }
  else
  {

  }
}

- (void)setData:(void *)a3 withLength:(unint64_t)a4 forList:(id *)a5
{
  _QWORD *v9;
  unint64_t var1;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  const char *v17;
  _OWORD v18[2];

  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v9 && (var1 = a5->var1, v11 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v11) >> 3) > var1))
  {
    v12 = *(unsigned __int8 *)(v11 + 56 * var1);

    if (v12)
    {
      objc_msgSend_writer(self, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_OWORD *)&a5->var2;
      v18[0] = *(_OWORD *)&a5->var0;
      v18[1] = v16;
      objc_msgSend_setData_withLength_forList_(v15, v17, (uint64_t)a3, a4, v18);

    }
  }
  else
  {

  }
}

- (void)assignStruct:(id *)a3 toReference:(unint64_t)a4 inStruct:(id *)a5
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  __int128 v16;
  unint64_t v17;
  __int128 v18;
  unint64_t var2;

  objc_msgSend_schema(self, a2, (uint64_t)a3);
  v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v9 && (v10 = v9[10], 0x6DB6DB6DB6DB6DB7 * ((v9[11] - v10) >> 3) > a4))
  {
    v11 = *(unsigned __int8 *)(v10 + 56 * a4);

    if (v11)
    {
      objc_msgSend_writer(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_OWORD *)&a3->var0;
      var2 = a3->var2;
      v16 = *(_OWORD *)&a5->var0;
      v17 = a5->var2;
      objc_msgSend_assignStruct_toReference_inStruct_(v14, v15, (uint64_t)&v18, a4, &v16);

    }
  }
  else
  {

  }
}

- (void)commitStruct:(id *)a3
{
  void *v4;
  const char *v5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6;

  objc_msgSend_writer(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *a3;
  objc_msgSend_commitStruct_(v4, v5, (uint64_t)&v6);

}

- (BOOL)flushWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  const char *v12;
  char v13;
  id v15;

  objc_msgSend_topLevelWriteProxy(self, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_6;
  v15 = 0;
  v8 = objc_msgSend__setupBackingStoreForWritingWithError_(self, v6, (uint64_t)&v15);
  v9 = v15;
  v10 = v9;
  if (a3 && (v8 & 1) == 0)
    *a3 = objc_retainAutorelease(v9);

  if (!v8)
    return 0;
LABEL_6:
  objc_msgSend_writer(self, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_flushWithError_(v11, v12, (uint64_t)a3);

  return v13;
}

- (BOOL)setReadableStorage:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 642, CFSTR("setReadableStorage should not be called on the backing store instance"));

  return 0;
}

- (BOOL)setWritableStorage:(id)a3 error:(id *)a4
{
  void *v6;
  const char *v7;

  objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v6, v7, (uint64_t)a2, self, CFSTR("CKXBackingStore.mm"), 647, CFSTR("setWritableStorage should not be called on the backing store instance"));

  return 0;
}

- (CKDSStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (CKXVersionedReaderWriterStore)readerWriterStore
{
  return self->_readerWriterStore;
}

- (void)setReaderWriterStore:(id)a3
{
  objc_storeStrong((id *)&self->_readerWriterStore, a3);
}

- (CKXProxyCache)proxyCache
{
  return self->_proxyCache;
}

- (void)setProxyCache:(id)a3
{
  objc_storeStrong((id *)&self->_proxyCache, a3);
}

- (unint64_t)cacheScope
{
  return self->_cacheScope;
}

- (void)setCacheScope:(unint64_t)a3
{
  self->_cacheScope = a3;
}

- (CKXReadStructProxy)topLevelReadProxy
{
  return self->_topLevelReadProxy;
}

- (void)setTopLevelReadProxy:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelReadProxy, a3);
}

- (CKXWriteStructProxy)topLevelWriteProxy
{
  return self->_topLevelWriteProxy;
}

- ($00740EB67EC846EA2D41B6DF60171431)header
{
  return ($00740EB67EC846EA2D41B6DF60171431)(*(unsigned __int16 *)&self->_header.formatVersion | (self->_header.writerIdentity.writerVersion << 16));
}

- (void)setHeader:(id)a3
{
  self->_header = ($4648BA6A93F1E3DAEC2343E896DE4F97)a3;
}

- (CKXBinding)binding
{
  return self->_binding;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binding, 0);
  objc_storeStrong((id *)&self->_topLevelWriteProxy, 0);
  objc_storeStrong((id *)&self->_topLevelReadProxy, 0);
  objc_storeStrong((id *)&self->_proxyCache, 0);
  objc_storeStrong((id *)&self->_readerWriterStore, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

+ (unint64_t)headerSizeForFormatVersion:(unsigned __int8)a3
{
  unsigned int v3;
  const char *v6;
  uint64_t v7;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;

  v3 = a3;
  if ((objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, a2, a3) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CKDSStringForBackingStoreFormatVersion(v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v12, (uint64_t)a2, a1, CFSTR("CKXBackingStore.mm"), 661, CFSTR("Format version %@ not supported"), v11);

LABEL_7:
    return 0;
  }
  if (v3 != 3)
  {
    if (v3 == 2)
      return 7;
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v13, (uint64_t)a2, a1, CFSTR("CKXBackingStore.mm"), 670, CFSTR("Unexpected format version"));
    goto LABEL_7;
  }
  return 0;
}

+ (BOOL)header:(id *)a3 forStorage:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  id v26;

  v8 = a4;
  objc_msgSend_fileURL(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v14 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend_fileURL(v8, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend_dataWithContentsOfURL_options_error_(v14, v16, (uint64_t)v15, 1, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v26;

    v20 = v17 != 0;
    if (v17)
    {
      if (a3)
      {
        v21 = objc_msgSend_headerForData_(a1, v19, (uint64_t)v17);
        *(_WORD *)&a3->var0 = v21;
        a3->var1.var1 = BYTE2(v21);
      }
    }
    else if (a5)
    {
      *a5 = objc_retainAutorelease(v18);
    }

  }
  else
  {
    if (a3)
    {
      objc_msgSend_data(v8, v12, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend_headerForData_(a1, v23, (uint64_t)v22);
      *(_WORD *)&a3->var0 = v24;
      a3->var1.var1 = BYTE2(v24);

    }
    v20 = 1;
  }

  return v20;
}

+ ($00740EB67EC846EA2D41B6DF60171431)headerForData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;
  uint64_t (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  unsigned __int16 v22;
  unsigned __int8 v23;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = sub_1D4BC29E0;
  v20[3] = &unk_1E984B638;
  v5 = v3;
  v21 = v5;
  v6 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8264B0C](v20);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = sub_1D4BC2A48;
  v18[3] = &unk_1E984B638;
  v7 = v5;
  v19 = v7;
  v8 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8264B0C](v18);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = sub_1D4BC2B04;
  v16[3] = &unk_1E984B638;
  v9 = v7;
  v17 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D8264B0C](v16);
  v25 = 0;
  v24 = 0;
  v13 = objc_msgSend_length(v9, v11, v12);
  if (v13 >= 0xC)
    objc_msgSend_getBytes_range_(v9, v14, (uint64_t)&v24, 0, 12);
  else
    objc_msgSend_getBytes_range_(v9, v14, (uint64_t)&v24, 0, v13);
  v23 = 0;
  v22 = 0;
  if ((((uint64_t (**)(_QWORD, uint64_t *, unsigned __int16 *))v6)[2](v6, &v24, &v22) & 1) == 0
    && (((uint64_t (**)(_QWORD, uint64_t *, unsigned __int16 *))v8)[2](v8, &v24, &v22) & 1) == 0)
  {
    ((void (**)(_QWORD, uint64_t *, unsigned __int16 *))v10)[2](v10, &v24, &v22);
  }

  return ($00740EB67EC846EA2D41B6DF60171431)(v22 | (v23 << 16));
}

+ (id)createHeaderDataForFormatVersion:(unsigned __int8)a3
{
  unsigned int v3;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  int v15;
  __int16 v16;
  char v17;

  v3 = a3;
  if ((objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, a2, a3) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CKDSStringForBackingStoreFormatVersion(v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v12, (uint64_t)a2, a1, CFSTR("CKXBackingStore.mm"), 759, CFSTR("Format version %@ not supported"), v11);

    goto LABEL_6;
  }
  if (v3 == 2)
  {
    v15 = -1421867861;
    v16 = 258;
    v17 = 4;
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)&v15, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    return v13;
  }
  if (v3 != 3)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v8, v9, (uint64_t)a2, a1, CFSTR("CKXBackingStore.mm"), 772, CFSTR("Unexpected format version"));
LABEL_6:

  }
  v13 = (void *)objc_opt_new();
  return v13;
}

+ (BOOL)prefixStorage:(id)a3 withHeaderForVersion:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v35;
  void *v36;
  const char *v37;
  void *v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v6 = a4;
  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((objc_msgSend_versionSupported_(CKXVersionedReaderWriterStore, v10, v6) & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v11, v12);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CKDSStringForBackingStoreFormatVersion(v6, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v30, v33, (uint64_t)a2, a1, CFSTR("CKXBackingStore.mm"), 781, CFSTR("Format version %@ not supported"), v32);

    LOBYTE(a5) = 0;
    goto LABEL_8;
  }
  objc_msgSend_createHeaderDataForFormatVersion_(a1, v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_length(v13, v14, v15))
  {
    objc_msgSend_data(v9, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      if (a5)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v40 = *MEMORY[0x1E0CB2D50];
        v41[0] = CFSTR("Not implemented");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v41, &v40, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v35, v37, (uint64_t)CFSTR("CKDSErrorDomain"), 1, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v39 = objc_retainAutorelease(v38);
        *a5 = v39;

        LOBYTE(a5) = 0;
      }
      goto LABEL_6;
    }
    objc_msgSend_data(v9, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_retainAutorelease(v13);
    v25 = objc_msgSend_bytes(v22, v23, v24);
    v28 = objc_msgSend_length(v22, v26, v27);
    objc_msgSend_replaceBytesInRange_withBytes_length_(v21, v29, 0, 0, v25, v28);

  }
  LOBYTE(a5) = 1;
LABEL_6:

LABEL_8:
  return (char)a5;
}

@end
