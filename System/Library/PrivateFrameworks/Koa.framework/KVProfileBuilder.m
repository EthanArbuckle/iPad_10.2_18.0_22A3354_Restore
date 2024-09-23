@implementation KVProfileBuilder

- (KVProfileBuilder)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KVProfileBuilder)initWithProfileInfo:(id)a3 outputStream:(id)a4 fileURL:(id)a5 format:(unsigned __int8)a6 provider:(id)a7 error:(id *)a8
{
  uint64_t v10;
  id v15;
  KVProfileBuilder *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  KVProfileBuilder *v20;
  KVProfileBuilder *v21;
  uint64_t *p_profileInfo;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  _BOOL4 v32;
  void **p_stream;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  KVProfileWriter *writer;
  const char *v42;
  KVProfileWriter *v43;
  KVProfileBuilder *v44;
  void *v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  const char *v60;
  void *v61;
  void *v62;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;
  _QWORD v75[2];
  _QWORD v76[2];
  uint64_t v77;
  void *v78;
  uint64_t v79;
  _QWORD v80[2];

  v10 = a6;
  v80[1] = *MEMORY[0x1E0C80C00];
  v71 = a3;
  v72 = a4;
  v73 = a5;
  v15 = a7;
  v74.receiver = self;
  v74.super_class = (Class)KVProfileBuilder;
  v16 = -[KVProfileBuilder init](&v74, sel_init);
  v20 = v16;
  v21 = v16;
  if (!v16)
    goto LABEL_10;
  if ((v10 - 1) >= 3)
  {
    v45 = (void *)MEMORY[0x1E0CB35C8];
    v79 = *MEMORY[0x1E0CB2D50];
    v46 = (void *)MEMORY[0x1E0CB3940];
    sub_1B70F5FAC(v10, v17, v18, v19);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v46, v48, (uint64_t)CFSTR("Unrecognized format: %@"), v49, v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v50;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v51, (uint64_t)v80, (uint64_t)&v79, 1);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v45, v53, (uint64_t)CFSTR("com.apple.koa.profile"), 3, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (a8 && v54)
      *a8 = objc_retainAutorelease(v54);
    goto LABEL_14;
  }
  p_profileInfo = (uint64_t *)&v16->_profileInfo;
  objc_storeStrong((id *)&v16->_profileInfo, a3);
  if (!*p_profileInfo)
  {
    v27 = 0;
    goto LABEL_17;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v27 = (void *)*p_profileInfo;
  if ((isKindOfClass & 1) == 0)
    goto LABEL_17;
  objc_msgSend_buffer(v27, v23, v25, v24);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_length(v28, v29, v30, v31) == 0;

  if (v32)
  {
    v27 = (void *)*p_profileInfo;
LABEL_17:
    v56 = (void *)MEMORY[0x1E0CB35C8];
    v77 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v23, (uint64_t)CFSTR("Invalid ProfileInfo: %@"), v24, v27);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v57;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v58, (uint64_t)&v78, (uint64_t)&v77, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v56, v60, (uint64_t)CFSTR("com.apple.koa.profile"), 5, v59);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (a8 && v61)
      *a8 = objc_retainAutorelease(v61);

    goto LABEL_21;
  }
  p_stream = (void **)&v20->_stream;
  objc_storeStrong((id *)&v20->_stream, a4);
  if (objc_msgSend_streamStatus(v20->_stream, v34, v35, v36) != 2)
  {
    v64 = (void *)MEMORY[0x1E0CB35C8];
    v75[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v37, (uint64_t)CFSTR("Output stream error: %@"), v38, *p_stream);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v47;
    v75[1] = *MEMORY[0x1E0CB3388];
    objc_msgSend_streamError(*p_stream, v65, v66, v67);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v76[1] = v50;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v68, (uint64_t)v76, (uint64_t)v75, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v64, v69, (uint64_t)CFSTR("com.apple.koa.profile"), 4, v52);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v70;
    if (a8 && v70)
      *a8 = objc_retainAutorelease(v70);
LABEL_14:

LABEL_21:
    v44 = 0;
    goto LABEL_22;
  }
  objc_storeStrong((id *)&v20->_fileURL, a5);
  objc_msgSend_profileWriterForFormat_outputStream_error_(v15, v39, v10, (uint64_t)v21->_stream, a8);
  v40 = objc_claimAutoreleasedReturnValue();
  writer = v21->_writer;
  v21->_writer = (KVProfileWriter *)v40;

  v43 = v21->_writer;
  if (!v43 || !objc_msgSend_startProfile_error_(v43, v42, *p_profileInfo, (uint64_t)a8))
    goto LABEL_21;
  v21->_datasetCount = 0;
LABEL_10:
  v44 = v21;
LABEL_22:

  return v44;
}

- (id)addDataset:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  KVDatasetBuilder *activeDataset;
  KVDatasetBuilder *v10;
  const char *v11;
  KVDatasetBuilder *v12;
  KVDatasetBuilder *v13;
  KVDatasetBuilder *v14;
  KVDatasetBuilder *v15;

  v8 = a3;
  if (self->_writer
    && ((activeDataset = self->_activeDataset) == 0
     || (objc_msgSend__finishWithError_(activeDataset, v6, (uint64_t)a4, v7) & 1) != 0)
    && (v10 = [KVDatasetBuilder alloc],
        v12 = (KVDatasetBuilder *)objc_msgSend_initWithDatasetInfo_writer_error_(v10, v11, (uint64_t)v8, (uint64_t)self->_writer, a4), v13 = self->_activeDataset, self->_activeDataset = v12, v13, (v14 = self->_activeDataset) != 0))
  {
    ++self->_datasetCount;
    v15 = v14;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_finishWithError:(id *)a3
{
  uint64_t v3;
  KVDatasetBuilder *activeDataset;
  int v7;
  unsigned int datasetCount;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  KVProfileWriter *writer;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  if (!self->_writer)
  {
LABEL_11:
    LOBYTE(v7) = 0;
    return v7;
  }
  activeDataset = self->_activeDataset;
  if (activeDataset)
  {
    v7 = objc_msgSend__finishWithError_(activeDataset, a2, (uint64_t)a3, v3);
    if (!v7)
      return v7;
  }
  datasetCount = self->_datasetCount;
  if (datasetCount != objc_msgSend_datasetCount(self->_profileInfo, a2, (uint64_t)a3, v3))
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_msgSend_datasetCount(self->_profileInfo, v9, v10, v11);
    objc_msgSend_stringWithFormat_(v14, v16, (uint64_t)CFSTR("Expected %u datasets but %u were added."), v17, v15, self->_datasetCount);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v19, (uint64_t)v26, (uint64_t)&v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v13, v21, (uint64_t)CFSTR("com.apple.koa.profile"), 9, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (a3 && v22)
      *a3 = objc_retainAutorelease(v22);

    goto LABEL_11;
  }
  v7 = objc_msgSend_finishProfile_(self->_writer, v9, (uint64_t)a3, v11);
  if (v7)
  {
    writer = self->_writer;
    self->_writer = 0;

    LOBYTE(v7) = 1;
  }
  return v7;
}

- (id)_buildWithError:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  NSURL *fileURL;
  void *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend__finishWithError_(self, a2, (uint64_t)a3, v3))
    return 0;
  fileURL = self->_fileURL;
  if (fileURL)
  {
    v24 = 0;
    objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], v6, (uint64_t)fileURL, 8, &v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v24;
    if (!v9)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v25[0] = *MEMORY[0x1E0CB2D50];
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v10, (uint64_t)CFSTR("Failed to load built profile from URL: %@"), v11, self->_fileURL);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = *MEMORY[0x1E0CB3388];
      v26[0] = v14;
      v26[1] = v12;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v26, (uint64_t)v25, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v13, v17, (uint64_t)CFSTR("com.apple.koa.profile"), 2, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (a3)
      {
        if (v18)
          *a3 = objc_retainAutorelease(v18);
      }

    }
  }
  else
  {
    objc_msgSend_propertyForKey_(self->_stream, v6, *MEMORY[0x1E0C99868], v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_close(self->_stream, v20, v21, v22);
  return v9;
}

- (id)buildWithError:(id *)a3
{
  uint64_t v3;
  void *v5;
  KVProfile *v6;
  const char *v7;
  void *v8;

  objc_msgSend__buildWithError_(self, a2, (uint64_t)a3, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [KVProfile alloc];
    v8 = (void *)objc_msgSend_initWithProfileData_error_(v6, v7, (uint64_t)v5, (uint64_t)a3);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_activeDataset, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

+ (void)initalize
{
  if (qword_1ED114580 != -1)
    dispatch_once(&qword_1ED114580, &unk_1E6B7B4A0);
}

+ (id)builderWithProfileInfo:(id)a3 format:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  KVProfileWriterFactory *v16;
  const char *v17;
  void *v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend_outputStreamToMemory(MEMORY[0x1E0C99E48], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_open(v11, v12, v13, v14);
  v15 = objc_alloc((Class)objc_opt_class());
  v16 = objc_alloc_init(KVProfileWriterFactory);
  v18 = (void *)objc_msgSend_initWithProfileInfo_outputStream_fileURL_format_provider_error_(v15, v17, (uint64_t)v7, (uint64_t)v11, 0, v6, v16, a5);

  return v18;
}

- (id)finishWritingWithError:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!self->_fileURL)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2D50];
    v17[0] = CFSTR("Cannot finish writing with in-memory profile builder. use FileWriter class category to initialize builder.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v17, (uint64_t)&v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, (uint64_t)CFSTR("com.apple.koa.profile"), 2, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a3 && v13)
      *a3 = objc_retainAutorelease(v13);

    goto LABEL_8;
  }
  if (!objc_msgSend__finishWithError_(self, a2, (uint64_t)a3, v3))
  {
LABEL_8:
    v9 = 0;
    return v9;
  }
  objc_msgSend__fileURL(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

+ (id)fileWriterWithProfileInfo:(id)a3 targetDirectory:(id)a4 filename:(id)a5 format:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  char isDirectory;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  KVProfileWriterFactory *v33;
  const char *v34;
  void *v35;
  void *v36;
  const char *v37;
  const char *v38;
  KVProfileWriterFactory *v39;
  void *v40;
  const char *v41;
  const char *v42;
  char v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];

  v8 = a6;
  v48[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v44 = 0;
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v12, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v17, v22, (uint64_t)v21, (uint64_t)&v44);

  if ((isDirectory & 1) != 0)
  {
    if (v44)
    {
      objc_msgSend_URLByAppendingPathComponent_(v12, v24, (uint64_t)v13, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_outputStreamWithURL_append_(MEMORY[0x1E0C99E48], v27, (uint64_t)v26, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_open(v28, v29, v30, v31);
      v32 = objc_alloc((Class)objc_opt_class());
      v33 = objc_alloc_init(KVProfileWriterFactory);
      v35 = (void *)objc_msgSend_initWithProfileInfo_outputStream_fileURL_format_provider_error_(v32, v34, (uint64_t)v11, (uint64_t)v28, v26, v8, v33, a7);
      goto LABEL_9;
    }
    v40 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("Target directory exists but is not a directory: %@"), v25, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v26;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v41, (uint64_t)&v46, (uint64_t)&v45, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v40, v42, (uint64_t)CFSTR("com.apple.koa.profile"), 1, v28);
    v39 = (KVProfileWriterFactory *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("No directory exists at target directory URL: %@"), v25, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v26;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v37, (uint64_t)v48, (uint64_t)&v47, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v36, v38, (uint64_t)CFSTR("com.apple.koa.profile"), 1, v28);
    v39 = (KVProfileWriterFactory *)objc_claimAutoreleasedReturnValue();
  }
  v33 = v39;
  v35 = 0;
  if (a7 && v39)
  {
    v33 = objc_retainAutorelease(v39);
    v35 = 0;
    *a7 = v33;
  }
LABEL_9:

  return v35;
}

+ (id)fileWriterWithProfileInfo:(id)a3 targetDirectory:(id)a4 format:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;

  v7 = a5;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_opt_class();
  objc_msgSend_capturedTime(v9, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v15;
  if ((v7 - 1) > 2)
    v20 = 0;
  else
    v20 = *((_QWORD *)&off_1E6B7ADD8 + (v7 - 1));
  objc_msgSend_timeIntervalSince1970(v15, v16, v17, v18);
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v22, (uint64_t)CFSTR("vocabulary-profile-%llu.%@"), v23, (unint64_t)(v21 * 1000.0), v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileWriterWithProfileInfo_targetDirectory_filename_format_error_(v11, v25, (uint64_t)v9, (uint64_t)v10, v24, v7, a6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
