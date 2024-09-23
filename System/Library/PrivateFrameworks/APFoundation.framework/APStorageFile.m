@implementation APStorageFile

- (id)nextObject
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  id v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  NSString *loggablePath;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_nextObjectData(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_classes(APSupportedSecureEncodedClass, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v10, (uint64_t)v9, (uint64_t)v8, &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
    if (v12)
    {
      APLogForCategory(0x2DuLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        loggablePath = self->_loggablePath;
        *(_DWORD *)buf = 138478339;
        v34 = v15;
        v35 = 2117;
        v36 = loggablePath;
        v37 = 2114;
        v38 = v12;
        _os_log_impl(&dword_1CF251000, v13, OS_LOG_TYPE_ERROR, "[%{private}@] Error occurred getting nextObject for file(%{sensitive}@):%{public}@", buf, 0x20u);

      }
      objc_msgSend__removeCorruptedFile_(self, v17, (uint64_t)v12, v18);
      v31[0] = CFSTR("storage_error");
      objc_msgSend_debugDescription(v12, v19, v20, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v22;
      v25 = CFSTR("nil");
      if (v22)
        v26 = (const __CFString *)v22;
      else
        v26 = CFSTR("nil");
      v31[1] = CFSTR("storage_path");
      v32[0] = v26;
      if (self->_loggablePath)
        v25 = (const __CFString *)self->_loggablePath;
      v32[1] = v25;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v23, (uint64_t)v32, (uint64_t)v31, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      CreateDiagnosticReport(CFSTR("Error occurred getting nextObject for file"), v27, CFSTR("Storage File"));
      v28 = 0;
    }
    else
    {
      v28 = v11;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_loggablePath, 0);
}

- (id)nextObjectData
{
  uint64_t v2;
  uint64_t v3;
  size_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSString *loggablePath;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  NSString *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  NSString *v36;
  const char *v37;
  NSObject *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  size_t v48;
  const char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  void *v65;
  const char *v66;
  void *v67;
  NSObject *v68;
  objc_class *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  unsigned int __ptr;
  uint8_t v74[4];
  void *v75;
  __int16 v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  NSString *v83;
  __int16 v84;
  NSObject *v85;
  const __CFString *v86;
  const __CFString *v87;
  _QWORD v88[2];
  _QWORD v89[3];

  v89[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend_fp(self, a2, v2, v3))
    return 0;
  __ptr = 0;
  v5 = fread(&__ptr, 4uLL, 1uLL, self->_fp);
  v6 = *__error();
  if (feof(self->_fp))
  {
    APLogForCategory(0x2DuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      loggablePath = self->_loggablePath;
      *(_DWORD *)buf = 138478083;
      v81 = v11;
      v82 = 2117;
      v83 = loggablePath;
      _os_log_impl(&dword_1CF251000, v9, OS_LOG_TYPE_INFO, "[%{private}@] Reached End of File for file(%{sensitive}@)", buf, 0x16u);

    }
    goto LABEL_17;
  }
  if (v5 != 1)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = kSFSFileInconsistencyError;
    v89[0] = CFSTR("Could not read item header.");
    v88[0] = CFSTR("reason");
    v88[1] = CFSTR("code");
    objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v7, v6, v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v89[1] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)v89, (uint64_t)v88, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v32, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v28, v31);
    v9 = objc_claimAutoreleasedReturnValue();

    APLogForCategory(0x2DuLL);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = self->_loggablePath;
      *(_DWORD *)buf = 138478339;
      v81 = v35;
      v82 = 2117;
      v83 = v36;
      v84 = 2112;
      v85 = v9;
      _os_log_impl(&dword_1CF251000, v33, OS_LOG_TYPE_ERROR, "[%{private}@] Read error occurred getting nextObjectData for file(%{sensitive}@):\n%@", buf, 0x20u);

    }
    objc_msgSend_sendAnalyticError_domain_code_(APStorageManager, v37, (uint64_t)CFSTR("Failed"), (uint64_t)CFSTR("SFS"), 16105);
    goto LABEL_16;
  }
  v14 = __ptr;
  if (__ptr > 0x40000)
  {
    APLogForCategory(0x2DuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v81) = v14;
      _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, "data appears to be corrupt, data.length(%d) is too big.  We are aborting reading file data.", buf, 8u);
    }

    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = kSFSFileInconsistencyError;
    v86 = CFSTR("reason");
    v87 = CFSTR("Data is larger than intended for read.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)&v87, (uint64_t)&v86, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v16, v20, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v17, v19);
    v9 = objc_claimAutoreleasedReturnValue();

    APLogForCategory(0x2DuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = self->_loggablePath;
      *(_DWORD *)buf = 138478339;
      v81 = v23;
      v82 = 2117;
      v83 = v24;
      v84 = 2114;
      v85 = v9;
      _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_ERROR, "[%{private}@] Header error occurred getting nextObjectData for file(%{sensitive}@):\n%{public}@", buf, 0x20u);

    }
LABEL_16:
    objc_msgSend__removeCorruptedFile_(self, v25, (uint64_t)v9, v26);
    goto LABEL_17;
  }
  v39 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v9 = objc_msgSend_initWithCapacity_(v39, v40, v14, v41);
  v45 = 0;
  if ((_DWORD)v14)
  {
    while (1)
    {
      v46 = (void *)MEMORY[0x1D17CBC78]();
      v47 = v14 - v45 >= 0x40 ? 64 : v14 - v45;
      v48 = fread(buf, 1uLL, v47, self->_fp);
      if (v48 != v47)
        break;
      objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v49, (uint64_t)buf, v47, 0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendData_(v9, v51, (uint64_t)v50, v52);
      v56 = objc_msgSend_length(v50, v53, v54, v55);

      v45 += v56;
      objc_autoreleasePoolPop(v46);
      if (v45 >= v14)
        goto LABEL_28;
    }
    v45 += v48;
    objc_autoreleasePoolPop(v46);
  }
LABEL_28:
  if (v45 == v14)
  {
    v38 = v9;
    goto LABEL_18;
  }
  v57 = (void *)MEMORY[0x1E0CB3940];
  v58 = objc_msgSend_length(v9, v42, v43, v44);
  objc_msgSend_stringWithFormat_(v57, v59, (uint64_t)CFSTR("The data is wrong length(%lu) not (%lu)."), v60, v58, v14);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)MEMORY[0x1E0CB35C8];
  v63 = kSFSFileInconsistencyError;
  v78 = CFSTR("reason");
  v79 = v61;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v64, (uint64_t)&v79, (uint64_t)&v78, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v62, v66, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v63, v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  APLogForCategory(0x2DuLL);
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    v69 = (objc_class *)objc_opt_class();
    NSStringFromClass(v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v74 = 138478083;
    v75 = v70;
    v76 = 2114;
    v77 = v67;
    _os_log_impl(&dword_1CF251000, v68, OS_LOG_TYPE_ERROR, "[%{private}@] %{public}@", v74, 0x16u);

  }
  objc_msgSend__removeCorruptedFile_(self, v71, (uint64_t)v67, v72);

LABEL_17:
  v38 = 0;
LABEL_18:

  return v38;
}

- (BOOL)addData:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  size_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  int __ptr;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  uint8_t buf[4];
  size_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v10 = objc_msgSend_length(v6, v7, v8, v9);
  v14 = v10;
  if (v10 <= 0x10000)
  {
    if (!v10)
    {
LABEL_11:
      LOBYTE(a4) = 1;
      goto LABEL_19;
    }
  }
  else
  {
    APLogForCategory(0x2DuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v49 = v14;
      v50 = 1024;
      v51 = 0x10000;
      _os_log_impl(&dword_1CF251000, v15, OS_LOG_TYPE_ERROR, "EFS size warning: The data of length(%lu) is larger than %d.", buf, 0x12u);
    }

  }
  __ptr = objc_msgSend_length(v6, v11, v12, v13);
  if (fwrite(&__ptr, 4uLL, 1uLL, self->_fp) == 1)
  {
    v16 = objc_retainAutorelease(v6);
    v20 = (const void *)objc_msgSend_bytes(v16, v17, v18, v19);
    v24 = objc_msgSend_length(v16, v21, v22, v23);
    v25 = fwrite(v20, 1uLL, v24, self->_fp);
    APLogForCategory(0x2DuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v49 = v25;
      _os_log_impl(&dword_1CF251000, v26, OS_LOG_TYPE_DEBUG, "bytesWritten = %zu", buf, 0xCu);
    }

    if (v25 == objc_msgSend_length(v16, v27, v28, v29))
    {
      fflush(self->_fp);
      goto LABEL_11;
    }
    if (!a4)
      goto LABEL_19;
    v37 = (void *)MEMORY[0x1E0CB35C8];
    v38 = kSFSFileInconsistencyError;
    v44 = CFSTR("reason");
    v45 = CFSTR("Bytes written did not match expectation for encrypted data.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v30, (uint64_t)&v45, (uint64_t)&v44, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v37, v40, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v38, v39);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sendAnalyticError_domain_code_(APStorageManager, v41, (uint64_t)CFSTR("Failed"), (uint64_t)CFSTR("SFS"), 16104);
LABEL_18:
    LOBYTE(a4) = 0;
    goto LABEL_19;
  }
  APLogForCategory(0x2DuLL);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF251000, v31, OS_LOG_TYPE_ERROR, "Can't write header for data object", buf, 2u);
  }

  if (a4)
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v34 = kSFSWritingToFileError;
    v46 = CFSTR("reason");
    v47 = CFSTR("Couldn't write header for data object.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)&v47, (uint64_t)&v46, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v33, v36, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v34, v35);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
LABEL_19:

  return (char)a4;
}

- (id)initForReadingAtURL:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  APStorageFile *v13;
  id *p_isa;
  APStorageFile *v15;
  objc_super v17;
  id v18;

  v5 = a3;
  objc_msgSend_safePath(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v11 = objc_msgSend__constructFileForURL_forMode_error_(APStorageFile, v10, (uint64_t)v5, (uint64_t)"r", &v18);
  v12 = v18;
  if (v11)
  {
    v17.receiver = self;
    v17.super_class = (Class)APStorageFile;
    v13 = -[APStorageFile init](&v17, sel_init);
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      v13->_fp = (__sFILE *)v11;
      objc_storeStrong((id *)&v13->_fileURL, a3);
      objc_storeStrong(p_isa + 3, v9);
    }
    self = p_isa;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)initForAppendingAtURL:(id)a3
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
  id v14;
  const char *v15;
  id v16;
  const char *v17;
  NSObject *v18;
  APStorageFile *v19;
  FILE *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  const char *v29;
  APStorageFile *v30;
  id *p_isa;
  APStorageFile *v32;
  objc_super v33;
  id v34;
  id v35;
  const __CFString *v36;
  const __CFString *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_safePath(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByDeletingLastPathComponent(v5, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v35 = 0;
  objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v13, 1, 0, &v35);
  v16 = v35;

  if (v16)
  {
    APLogForCategory(0x2DuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

      v19 = 0;
      goto LABEL_5;
    }
LABEL_3:
    *(_DWORD *)buf = 138740227;
    v39 = v9;
    v40 = 2114;
    v41 = (uint64_t)v16;
    _os_log_impl(&dword_1CF251000, v18, OS_LOG_TYPE_ERROR, "ERROR: Unable to open file(%{sensitive}@): %{public}@", buf, 0x16u);
    goto LABEL_4;
  }
  v34 = 0;
  v21 = (FILE *)objc_msgSend__constructFileForURL_forMode_error_(APStorageFile, v17, (uint64_t)v5, (uint64_t)"a+", &v34);
  v16 = v34;
  if (!v21)
  {
    APLogForCategory(0x2DuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  if (fseek(v21, 0, 2))
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = kSFSFileInconsistencyError;
    v36 = CFSTR("reason");
    v37 = CFSTR("Could not seek to end of file.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v22, (uint64_t)&v37, (uint64_t)&v36, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v26, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v24, v25);
    v27 = objc_claimAutoreleasedReturnValue();

    APLogForCategory(0x2DuLL);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740227;
      v39 = v9;
      v40 = 2114;
      v41 = v27;
      _os_log_impl(&dword_1CF251000, v28, OS_LOG_TYPE_ERROR, "ERROR: Could not initialize file(%{sensitive}@) for appending: %{public}@", buf, 0x16u);
    }

    fclose(v21);
    v19 = 0;
    v16 = (id)v27;
  }
  else
  {
    if (MEMORY[0x1D17CBBB8](v21))
    {
      v33.receiver = self;
      v33.super_class = (Class)APStorageFile;
      v30 = -[APStorageFile init](&v33, sel_init);
      p_isa = (id *)&v30->super.isa;
      if (v30)
      {
        v30->_fp = v21;
        objc_storeStrong((id *)&v30->_fileURL, a3);
        objc_storeStrong(p_isa + 3, v9);
      }
      v32 = p_isa;
    }
    else
    {
      v32 = (APStorageFile *)(id)objc_msgSend__initForWritingFile_forURL_loggablePath_(self, v29, (uint64_t)v21, (uint64_t)v5, v9);
    }
    self = v32;
    v19 = v32;
  }
LABEL_5:

  return v19;
}

- (id)initForWritingAtURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  id v15;
  const char *v16;
  APStorageFile *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_safePath(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_URLByDeletingLastPathComponent(v4, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v23 = 0;
  objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v13, v14, (uint64_t)v12, 1, 0, &v23);
  v15 = v23;

  if (!v15)
  {
    v22 = 0;
    v18 = objc_msgSend__constructFileForURL_forMode_error_(APStorageFile, v16, (uint64_t)v4, (uint64_t)"w", &v22);
    v15 = v22;
    if (v18)
    {
      self = (APStorageFile *)(id)objc_msgSend__initForWritingFile_forURL_loggablePath_(self, v19, v18, (uint64_t)v4, v8);
      v17 = self;
      goto LABEL_5;
    }
    APLogForCategory(0x2DuLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138740227;
      v25 = v8;
      v26 = 2114;
      v27 = v15;
      _os_log_impl(&dword_1CF251000, v21, OS_LOG_TYPE_ERROR, "ERROR: Unable to open file(%{sensitive}@): %{public}@", buf, 0x16u);
    }

  }
  v17 = 0;
LABEL_5:

  return v17;
}

+ (__sFILE)_constructFileForURL:(id)a3 forMode:(char *)a4 error:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  FILE *v12;
  const char *v13;
  __sFILE *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v11 = (const char *)objc_msgSend_fileSystemRepresentation(v7, v8, v9, v10);
  v12 = fopen(v11, a4);
  v14 = v12;
  if (a5 && !v12)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = kSFSInvalidPathError;
    v20 = CFSTR("reason");
    v21[0] = CFSTR("Invalid path for SFS.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v13, (uint64_t)v21, (uint64_t)&v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v15, v18, (uint64_t)CFSTR("com.apple.ap.StorageFileSystem"), v16, v17);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)_initForWritingFile:(__sFILE *)a3 forURL:(id)a4 loggablePath:(id)a5
{
  id v9;
  id v10;
  APStorageFile *v11;
  id *p_isa;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APStorageFile;
  v11 = -[APStorageFile init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_fp = a3;
    objc_storeStrong((id *)&v11->_fileURL, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_close(self, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)APStorageFile;
  -[APStorageFile dealloc](&v5, sel_dealloc);
}

- (void)close
{
  FILE *fp;

  fp = self->_fp;
  if (fp)
  {
    fclose(fp);
    self->_fp = 0;
  }
}

- (BOOL)addObject:(id)a3 error:(id *)a4
{
  const char *v6;
  void *v7;
  char v8;

  objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], a2, (uint64_t)a3, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = objc_msgSend_addData_error_(self, v6, (uint64_t)v7, (uint64_t)a4);
  else
    v8 = 0;

  return v8;
}

- (id)initForMode:(int64_t)a3 atURL:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v8 = a4;
  switch(a3)
  {
    case 'a':
      v9 = (void *)objc_msgSend_initForAppendingAtURL_(self, v6, (uint64_t)v8, v7);
      goto LABEL_7;
    case 'w':
      v9 = (void *)objc_msgSend_initForWritingAtURL_(self, v6, (uint64_t)v8, v7);
      goto LABEL_7;
    case 'r':
      v9 = (void *)objc_msgSend_initForReadingAtURL_(self, v6, (uint64_t)v8, v7);
LABEL_7:
      self = v9;
      break;
  }

  return self;
}

- (id)_initWithFile:(__sFILE *)a3 forURL:(id)a4 loggablePath:(id)a5
{
  id v9;
  id v10;
  APStorageFile *v11;
  id *p_isa;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)APStorageFile;
  v11 = -[APStorageFile init](&v14, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_fp = a3;
    objc_storeStrong((id *)&v11->_fileURL, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (id)allObjects
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1D17CBC78]();
  objc_msgSend_nextObject(self, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13 = (void *)v10;
    do
    {
      objc_msgSend_addObject_(v5, v11, (uint64_t)v13, v12);
      objc_autoreleasePoolPop(v6);
      v6 = (void *)MEMORY[0x1D17CBC78]();
      objc_msgSend_nextObject(self, v14, v15, v16);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    while (v17);
  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend_arrayWithArray_(MEMORY[0x1E0C99D20], v18, (uint64_t)v5, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_removeCorruptedFile:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSString *loggablePath;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSURL *fileURL;
  const char *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  NSString *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  APLogForCategory(0x2DuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    loggablePath = self->_loggablePath;
    *(_DWORD *)buf = 138478083;
    v22 = v6;
    v23 = 2117;
    v24 = loggablePath;
    _os_log_impl(&dword_1CF251000, v4, OS_LOG_TYPE_ERROR, "[%{private}@] Removing corrupted file at path: %{sensitive}@", buf, 0x16u);

  }
  objc_msgSend_close(self, v8, v9, v10);
  v11 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  fileURL = self->_fileURL;
  v20 = 0;
  objc_msgSend_removeItemAtURL_error_(v11, v13, (uint64_t)fileURL, (uint64_t)&v20);
  v14 = v20;

  if (v14)
  {
    APLogForCategory(0x2DuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = self->_loggablePath;
      *(_DWORD *)buf = 138478339;
      v22 = v18;
      v23 = 2117;
      v24 = v19;
      v25 = 2114;
      v26 = v14;
      _os_log_impl(&dword_1CF251000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to remove file(%{sensitive}@):\n%{public}@", buf, 0x20u);

    }
  }
  objc_msgSend_sendAnalyticError_domain_code_(APStorageManager, v15, (uint64_t)CFSTR("Failed"), (uint64_t)CFSTR("SFS"), 16106);

}

- (__sFILE)fp
{
  return self->_fp;
}

- (void)setFp:(__sFILE *)a3
{
  self->_fp = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (NSString)loggablePath
{
  return self->_loggablePath;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

@end
