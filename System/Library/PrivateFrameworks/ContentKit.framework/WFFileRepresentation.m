@implementation WFFileRepresentation

+ (void)addDisallowedDirectory:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (void *)_disallowedDirectoryURLs;
    if (!_disallowedDirectoryURLs)
      v4 = (void *)MEMORY[0x24BDBD1A8];
    v8 = v4;
    objc_msgSend(v8, "arrayByAddingObject:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)_disallowedDirectoryURLs;
    _disallowedDirectoryURLs = v5;

  }
  else
  {
    getWFFileRepresentationLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "+[WFFileRepresentation addDisallowedDirectory:]";
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_FAULT, "%s Adding disallowed directory failed because the URL is nil", buf, 0xCu);
    }

  }
}

- (WFFileRepresentation)initWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 originalURL:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFFileRepresentation *v15;
  uint64_t v16;
  NSData *data;
  uint64_t v18;
  NSDate *creationDate;
  WFFileType *v20;
  void *wfType;
  WFFileType *v22;
  WFFileType *v23;
  void *v24;
  WFFileType *v25;
  uint64_t v26;
  id v27;
  NSString *filename;
  uint64_t v29;
  NSString *wfName;
  WFFileRepresentation *v31;
  void *v33;
  id v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFFileRepresentation.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[data isKindOfClass:[NSData class]]"));

  }
  v15 = -[WFFileRepresentation init](self, "init");
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    data = v15->_data;
    v15->_data = (NSData *)v16;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    creationDate = v15->_creationDate;
    v15->_creationDate = (NSDate *)v18;

    objc_storeStrong((id *)&v15->_originalURL, a6);
    v15->_isTemporaryFile = 1;
    v15->_initialRepresentationType = 0;
    if (v12)
    {
      v20 = (WFFileType *)v12;
      wfType = v15->_wfType;
      v15->_wfType = v20;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", v13);
      wfType = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(wfType, "isDeclared"))
      {
        v22 = wfType;
      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "typeOfData:", v15->_data);
        v22 = (WFFileType *)objc_claimAutoreleasedReturnValue();
      }
      v23 = v15->_wfType;
      v15->_wfType = v22;

    }
    v24 = (void *)objc_opt_class();
    v25 = v15->_wfType;
    v34 = 0;
    objc_msgSend(v24, "proposedFilenameForFile:ofType:unsanitizedName:", v13, v25, &v34);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v34;
    filename = v15->_filename;
    v15->_filename = (NSString *)v26;

    v29 = objc_msgSend(v27, "copy");
    wfName = v15->_wfName;
    v15->_wfName = (NSString *)v29;

    v31 = v15;
  }

  return v15;
}

- (WFFileRepresentation)initWithFileURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6 originalURL:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  WFFileRepresentation *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSString *v35;
  NSString *filename;
  NSString *v37;
  NSString *wfName;
  void *v39;
  NSDate *v40;
  NSDate *modificationDate;
  NSDate *v42;
  NSObject *v43;
  unint64_t v44;
  int v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id obj;
  NSObject *v51;
  id v52;
  id v53;
  objc_super v54;
  _QWORD v55[4];
  NSObject *v56;
  _BYTE *v57;
  _QWORD v58[4];
  NSObject *v59;
  NSObject *v60;
  _BYTE *v61;
  id v62;
  uint8_t v63[4];
  const char *v64;
  __int16 v65;
  int64_t v66;
  __int16 v67;
  int v68;
  __int16 v69;
  void *v70;
  _BYTE buf[24];
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "isFileURL"))
  {
    if ((a4 & 8) != 0)
    {
      if ((objc_msgSend(v13, "startAccessingSecurityScopedResource") & 1) != 0)
      {
        v17 = 1;
        goto LABEL_10;
      }
      getWFFileRepresentationLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        _os_log_impl(&dword_20BBAD000, v18, OS_LOG_TYPE_ERROR, "%s Failed to start accessing a security scoped resource.", buf, 0xCu);
      }

    }
    v17 = 0;
LABEL_10:
    if (objc_msgSend((id)objc_opt_class(), "fileIsInDisallowedDirectory:", v13))
    {
      getWFFileRepresentationLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_20BBAD000, v19, OS_LOG_TYPE_ERROR, "%s Cannot represent file URL, returning nil: %@", buf, 0x16u);
      }

      if (v17)
        objc_msgSend(v13, "stopAccessingSecurityScopedResource");
      goto LABEL_36;
    }
    if ((v17 & 1) == 0 && (objc_msgSend((id)objc_opt_class(), "sandboxAllowsRepresentingFileURL:", v13) & 1) == 0)
    {
      getWFFileRepresentationLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_20BBAD000, v24, OS_LOG_TYPE_ERROR, "%s Cannot represent file URL, returning nil: %@", buf, 0x16u);
      }

      goto LABEL_36;
    }
    v51 = v13;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v72 = __Block_byref_object_copy__8213;
    v73 = __Block_byref_object_dispose__8214;
    v74 = 0;
    if (v14)
    {
      obj = v14;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "typeOfFile:", v51);
      obj = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)objc_opt_class();
    v21 = v15;
    if (!v15)
    {
      -[NSObject lastPathComponent](v51, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v62 = 0;
    objc_msgSend(v20, "proposedFilenameForFile:ofType:unsanitizedName:", v21, obj, &v62);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v62;
    if (!v15)

    if ((a4 & 5) != 5 && (a4 & 3) != 3)
    {
      objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), a3);
      v22 = v51;
      goto LABEL_27;
    }
    v45 = -[NSObject wf_fileIsDirectory](v51, "wf_fileIsDirectory");
    if (v45)
      +[WFTemporaryFileManager createTemporaryDirectoryWithFilename:](WFTemporaryFileManager, "createTemporaryDirectoryWithFilename:", v49);
    else
      +[WFTemporaryFileManager createTemporaryFileWithFilename:](WFTemporaryFileManager, "createTemporaryFileWithFilename:", v49);
    v23 = objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v23;

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      if ((a4 & 5) != 5)
      {
        v47 = (void *)objc_opt_class();
        v33 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v55[0] = MEMORY[0x24BDAC760];
        v55[1] = 3221225472;
        v55[2] = __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke_47;
        v55[3] = &unk_24C4DE7D0;
        v34 = v51;
        v56 = v34;
        v57 = buf;
        if ((objc_msgSend(v47, "coordinateFileOperation:shouldCoordinate:fileURL:destinationURL:accessor:", 4, ((unint64_t)a4 >> 4) & 1, v34, v33, v55) & 1) == 0)
        {
          v25 = 0;
          v32 = v56;
          v51 = v34;
          goto LABEL_60;
        }
        v22 = *(id *)(*(_QWORD *)&buf[8] + 40);

LABEL_27:
        v54.receiver = self;
        v54.super_class = (Class)WFFileRepresentation;
        self = -[WFFileRepresentation init](&v54, sel_init, v44);
        if (!self)
        {
          v25 = 0;
LABEL_61:

          _Block_object_dispose(buf, 8);
          goto LABEL_37;
        }
        if ((a4 & 8) != 0)
        {
          if (*(NSObject **)(*(_QWORD *)&buf[8] + 40) == v51)
            self->_securityScopedResource = 1;
          else
            -[NSObject stopAccessingSecurityScopedResource](v51, "stopAccessingSecurityScopedResource");
        }
        self->_deletesFileOnDeallocation = a4 & 1;
        self->_isTemporaryFile = a4 & 1;
        objc_storeStrong((id *)&self->_fileURL, *(id *)(*(_QWORD *)&buf[8] + 40));
        v35 = (NSString *)objc_msgSend(v49, "copy");
        filename = self->_filename;
        self->_filename = v35;

        v37 = (NSString *)objc_msgSend(v48, "copy");
        wfName = self->_wfName;
        self->_wfName = v37;

        objc_storeStrong((id *)&self->_wfType, obj);
        v53 = 0;
        -[NSObject getResourceValue:forKey:error:](v22, "getResourceValue:forKey:error:", &v53, *MEMORY[0x24BDBCBF0], 0);
        v32 = v53;
        v39 = v32;
        if (!v32)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_storeStrong((id *)&self->_creationDate, v39);
        if (!v32)

        v52 = 0;
        -[NSObject getResourceValue:forKey:error:](v22, "getResourceValue:forKey:error:", &v52, *MEMORY[0x24BDBCBE0], 0);
        v40 = (NSDate *)v52;
        modificationDate = self->_modificationDate;
        self->_modificationDate = v40;
        v42 = v40;

        objc_storeStrong((id *)&self->_originalURL, a7);
        self->_initialRepresentationType = 1;
        self = self;
        v51 = v22;
        v25 = self;
LABEL_60:

        v22 = v51;
        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v46 = (void *)objc_opt_class();
        v44 = ((unint64_t)a4 >> 4) & 1;
        v31 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        v58[0] = MEMORY[0x24BDAC760];
        v58[1] = 3221225472;
        v58[2] = __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke;
        v58[3] = &unk_24C4DE7A8;
        v22 = v51;
        v59 = v22;
        v61 = buf;
        v32 = v30;
        v60 = v32;
        LOBYTE(v31) = objc_msgSend(v46, "coordinateFileOperation:shouldCoordinate:fileURL:destinationURL:accessor:", 3, v44, v22, v31, v58);

        if ((v31 & 1) == 0)
        {
          v25 = 0;
          v51 = v22;
          goto LABEL_60;
        }

        goto LABEL_27;
      }
      getWFFileRepresentationLogObject();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v63 = 136315906;
        v64 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        v65 = 2050;
        v66 = a4;
        v67 = 1026;
        v68 = v45;
        v69 = 2112;
        v70 = v49;
        _os_log_impl(&dword_20BBAD000, v43, OS_LOG_TYPE_ERROR, "%s Failed to create temporary file URL, adoptionBehavior = %{public}ld, isDirectory = %{public}d, filename = %@", v63, 0x26u);
      }

      v32 = 0;
    }
    else
    {
      getWFFileRepresentationLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v63 = 136315906;
        v64 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]";
        v65 = 2050;
        v66 = a4;
        v67 = 1026;
        v68 = v45;
        v69 = 2112;
        v70 = v49;
        _os_log_impl(&dword_20BBAD000, v32, OS_LOG_TYPE_ERROR, "%s Failed to create new file URL, adoptionBehavior = %{public}ld, isDirectory = %{public}d, filename = %@", v63, 0x26u);
      }
    }
    v25 = 0;
    goto LABEL_60;
  }
LABEL_36:
  v25 = 0;
LABEL_37:

  return v25;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSURL *v7;
  void *v8;
  NSObject *v9;
  NSURL *fileURL;
  objc_super v11[3];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  NSURL *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_fileURL)
  {
    if (self->_deletesFileOnDeallocation)
    {
      if (!INFileURLHasAssociatedAuditToken())
        goto LABEL_8;
      objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      if (v3)
        objc_msgSend(v3, "if_auditToken");
      else
        memset(&v11[1], 0, 32);
      v5 = INFileURLAuditTokenEquals();

      if (v5)
      {
LABEL_8:
        getWFFileRepresentationLogObject();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          -[NSURL absoluteString](self->_fileURL, "absoluteString");
          v7 = (NSURL *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v13 = "-[WFFileRepresentation dealloc]";
          v14 = 2112;
          v15 = v7;
          _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_DEFAULT, "%s Deleting file on deallocation: %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeItemAtURL:error:", self->_fileURL, 0);

      }
    }
    if (self->_securityScopedResource)
    {
      getWFFileRepresentationLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        fileURL = self->_fileURL;
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFFileRepresentation dealloc]";
        v14 = 2112;
        v15 = fileURL;
        _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_DEFAULT, "%s Revoking access to security scoped URL: %@", buf, 0x16u);
      }

      -[NSURL stopAccessingSecurityScopedResource](self->_fileURL, "stopAccessingSecurityScopedResource");
    }
  }
  v11[0].receiver = self;
  v11[0].super_class = (Class)WFFileRepresentation;
  -[objc_super dealloc](v11, sel_dealloc);
}

- (NSData)data
{
  NSData *data;
  id v4;
  NSURL *fileURL;
  NSData *v6;
  id v7;
  NSData *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  data = self->_data;
  if (data)
    return data;
  if (!self->_fileURL)
  {
    data = 0;
    return data;
  }
  v4 = objc_alloc(MEMORY[0x24BDBCE50]);
  fileURL = self->_fileURL;
  v11 = 0;
  v6 = (NSData *)objc_msgSend(v4, "initWithContentsOfURL:options:error:", fileURL, 0, &v11);
  v7 = v11;
  v8 = self->_data;
  self->_data = v6;

  if (!self->_data)
  {
    getWFFileRepresentationLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[WFFileRepresentation data]";
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_ERROR, "%s Failed to read file: %{error}@", buf, 0x16u);
    }

  }
  return self->_data;
}

- (NSURL)fileURL
{
  NSURL *fileURL;
  void *v4;
  void *v5;

  fileURL = self->_fileURL;
  if (!fileURL)
  {
    if (self->_data)
    {
      -[WFFileRepresentation filename](self, "filename");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFFileRepresentation writeToTemporaryFileURL:error:](self, "writeToTemporaryFileURL:error:", v5, 0);
      fileURL = self->_fileURL;
    }
    else
    {
      fileURL = 0;
    }
  }
  return fileURL;
}

- (BOOL)writeToTemporaryFileURL:(id)a3 error:(id *)a4
{
  id v7;
  _BOOL4 v8;
  BOOL v9;

  v7 = a3;
  if (v7)
  {
    v8 = -[WFFileRepresentation writeToFileURL:copy:overwrite:error:](self, "writeToFileURL:copy:overwrite:error:", v7, -[WFFileRepresentation deletesFileOnDeallocation](self, "deletesFileOnDeallocation") ^ 1, 0, a4);
    v9 = 0;
    if (v8)
    {
      v9 = 1;
      self->_deletesFileOnDeallocation = 1;
      self->_isTemporaryFile = 1;
      objc_storeStrong((id *)&self->_fileURL, a3);
      INFileURLSetMarkedForDeletionOnDeallocation();
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)writeToFileURL:(id)a3 copy:(BOOL)a4 overwrite:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  NSObject *v11;
  char v12;
  uint64_t v13;
  void *v14;
  NSURL *v15;
  void *v16;
  void *v17;
  NSURL *v18;
  void *v19;
  NSURL *v20;
  void *v21;
  void *v22;
  NSURL *fileURL;
  void *v24;
  _QWORD v26[6];
  BOOL v27;
  _QWORD v28[4];
  NSURL *v29;
  _BYTE *v30;
  _QWORD v31[4];
  NSURL *v32;
  _BYTE *v33;
  _QWORD v34[4];
  id v35;
  NSURL *v36;
  WFFileRepresentation *v37;
  _BYTE *v38;
  _BYTE buf[24];
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v7 = a5;
  v8 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (!objc_msgSend((id)objc_opt_class(), "fileIsInDisallowedDirectory:", v10))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__8213;
    v41 = __Block_byref_object_dispose__8214;
    v42 = 0;
    v13 = objc_msgSend(v10, "wf_fileIsShortcutsOwned") ^ 1;
    if (self->_fileURL)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v15 = self->_fileURL;
        if (v8)
        {
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFTemporaryFileManager proposedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedTemporaryFileURLForFilename:", v17);
          v18 = (NSURL *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v14, "copyItemAtURL:toURL:error:", self->_fileURL, v18, a6) & 1) == 0)
          {

            v12 = 0;
LABEL_19:
            _Block_object_dispose(buf, 8);

            goto LABEL_20;
          }
          v15 = v18;
        }
        v19 = (void *)objc_opt_class();
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke;
        v34[3] = &unk_24C4DE7F8;
        v35 = v14;
        v20 = v15;
        v37 = self;
        v38 = buf;
        v36 = v20;
        v12 = objc_msgSend(v19, "coordinateFileOperation:shouldCoordinate:fileURL:destinationURL:accessor:", 1, v13, v10, 0, v34);

      }
      else
      {
        v22 = (void *)objc_opt_class();
        fileURL = self->_fileURL;
        if (v8)
        {
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_52;
          v31[3] = &unk_24C4DE7D0;
          v32 = v14;
          v33 = buf;
          v12 = objc_msgSend(v22, "coordinateFileOperation:shouldCoordinate:fileURL:destinationURL:accessor:", 3, v13, fileURL, v10, v31);
          v20 = v32;
        }
        else
        {
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_53;
          v28[3] = &unk_24C4DE7D0;
          v29 = v14;
          v30 = buf;
          v12 = objc_msgSend(v22, "coordinateFileOperation:shouldCoordinate:fileURL:destinationURL:accessor:", 4, v13, fileURL, v10, v28);
          v20 = v29;
        }
      }

    }
    else
    {
      v21 = (void *)objc_opt_class();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_54;
      v26[3] = &unk_24C4DE820;
      v27 = v7;
      v26[4] = self;
      v26[5] = buf;
      v12 = objc_msgSend(v21, "coordinateFileOperation:shouldCoordinate:fileURL:destinationURL:accessor:", 1, v13, v10, 0, v26);
    }
    if (a6)
    {
      v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (v24)
        *a6 = objc_retainAutorelease(v24);
    }
    goto LABEL_19;
  }
  getWFFileRepresentationLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_ERROR, "%s Cannot save file URL to disallowed directory: %@", buf, 0x16u);
  }

  v12 = 0;
LABEL_20:

  return v12;
}

- (BOOL)writeToFileURL:(id)a3 overwriting:(BOOL)a4 error:(id *)a5
{
  return -[WFFileRepresentation writeToFileURL:copy:overwrite:error:](self, "writeToFileURL:copy:overwrite:error:", a3, 1, a4, a5);
}

- (BOOL)atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:(id)a3 sourceURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  char v10;
  void *v11;
  id v12;
  id *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  char v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "wf_fileIsOnSameVolumeAsURL:", v8))
  {
    getWFFilesLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v34 = "-[WFFileRepresentation atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:]";
      v35 = 2112;
      v36 = v7;
      v37 = 2112;
      v38 = v8;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_DEFAULT, "%s Files are on the same volume not attempting replace across volumes (%@) - (%@)", buf, 0x20u);
    }
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = objc_claimAutoreleasedReturnValue();
    v32 = 0;
    -[NSObject URLForDirectory:inDomain:appropriateForURL:create:error:](v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v7, 1, &v32);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = a5;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = v11;
    v31 = v12;
    v27 = v8;
    v18 = -[NSObject copyItemAtURL:toURL:error:](v9, "copyItemAtURL:toURL:error:", v8, v16, &v31);
    v19 = v31;

    v30 = v19;
    v28 = (void *)v16;
    v20 = -[NSObject replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:](v9, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v7, v16, 0, 0, 0, &v30);
    v21 = v30;

    if (v11)
      v10 = v20 & v18;
    else
      v10 = 0;
    if (v13 && v21)
      *v13 = objc_retainAutorelease(v21);
    if (v11)
    {
      v29 = 0;
      v22 = -[NSObject removeItemAtURL:error:](v9, "removeItemAtURL:error:", v17, &v29);
      v23 = v29;
      if ((v22 & 1) == 0)
      {
        getWFFilesLogObject();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v34 = "-[WFFileRepresentation atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:]";
          v35 = 2114;
          v36 = v23;
          _os_log_impl(&dword_20BBAD000, v24, OS_LOG_TYPE_ERROR, "%s Failed to cleanup staging directory during atomic replace: %{public}@", buf, 0x16u);
        }

      }
    }
    if ((v10 & 1) == 0)
    {
      getWFFilesLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFFileRepresentation atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:]";
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_20BBAD000, v25, OS_LOG_TYPE_ERROR, "%s Failed to replace across volumes: %{public}@", buf, 0x16u);
      }

    }
    v8 = v27;
  }

  return v10;
}

- (int64_t)representationType
{
  return self->_data == 0;
}

- (int64_t)fileSize
{
  NSData *data;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  data = self->_data;
  if (data)
    return -[NSData length](data, "length");
  if (!self->_fileURL)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_fileURL, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileSize");

  return v8;
}

- (id)inputStream
{
  int64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[WFFileRepresentation representationType](self, "representationType");
  v4 = objc_alloc(MEMORY[0x24BDBCE90]);
  if (v3 == 1)
  {
    -[WFFileRepresentation fileURL](self, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithURL:", v5);

    objc_setAssociatedObject(v6, sel_inputStream, self, (void *)1);
  }
  else
  {
    -[WFFileRepresentation data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithData:", v7);

  }
  return v6;
}

- (id)mappedData
{
  return -[WFFileRepresentation mappedDataWithError:](self, "mappedDataWithError:", 0);
}

- (id)mappedDataWithError:(id *)a3
{
  NSData *data;
  NSURL *fileURL;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  WFFileRepresentation *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  data = self->_data;
  if (data)
    return data;
  fileURL = self->_fileURL;
  if (fileURL)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", fileURL, 8, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    getWFFileRepresentationLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "-[WFFileRepresentation mappedDataWithError:]";
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_20BBAD000, v9, OS_LOG_TYPE_FAULT, "%s Both _data and _fileURL are nil in fileRepresentation: %@", (uint8_t *)&v10, 0x16u);
    }

    v8 = 0;
  }
  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFFileRepresentation;
  -[WFFileRepresentation description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFileRepresentation filename](self, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)typeForUserEnteredName:(id)a3 addingExtensionIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFilename:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isDeclared") & 1) == 0)
  {
    if (v4)
      -[WFFileRepresentation wfType](self, "wfType");
    else
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350]);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (id)updatedFilenameForUserEnteredName:(id)a3 addingExtensionIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[WFFileRepresentation typeForUserEnteredName:addingExtensionIfNecessary:](self, "typeForUserEnteredName:addingExtensionIfNecessary:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFFileRepresentation proposedFilenameForFile:ofType:](WFFileRepresentation, "proposedFilenameForFile:ofType:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)wfName
{
  NSString *wfName;
  NSString *v3;
  void *v4;

  wfName = self->_wfName;
  if (wfName)
  {
    v3 = wfName;
  }
  else
  {
    -[WFFileRepresentation filename](self, "filename");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)copyWithName:(id)a3 zone:(_NSZone *)a4
{
  return -[WFFileRepresentation copyWithName:addingExtensionIfNecessary:zone:](self, "copyWithName:addingExtensionIfNecessary:zone:", a3, 1, a4);
}

- (id)copyWithName:(id)a3 addingExtensionIfNecessary:(BOOL)a4 zone:(_NSZone *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  uint64_t v16;

  v6 = a4;
  v8 = a3;
  -[WFFileRepresentation typeForUserEnteredName:addingExtensionIfNecessary:](self, "typeForUserEnteredName:addingExtensionIfNecessary:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFFileRepresentation representationType](self, "representationType");
  v11 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a5);
  if (v10 != 1)
  {
    -[WFFileRepresentation data](self, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v13 = objc_msgSend(v11, "initWithData:ofType:proposedFilename:originalURL:", v12, v9, v8, self->_originalURL);
      goto LABEL_6;
    }
    -[WFFileRepresentation wfName](self, "wfName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "initWithData:ofType:proposedFilename:originalURL:", v12, v9, v15, self->_originalURL);
LABEL_9:
    v14 = (id *)v16;

    goto LABEL_10;
  }
  -[WFFileRepresentation fileURL](self, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[WFFileRepresentation wfName](self, "wfName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v11, "initWithFileURL:options:ofType:proposedFilename:originalURL:", v12, 5, v9, v15, self->_originalURL);
    goto LABEL_9;
  }
  v13 = objc_msgSend(v11, "initWithFileURL:options:ofType:proposedFilename:originalURL:", v12, 5, v9, v8, self->_originalURL);
LABEL_6:
  v14 = (id *)v13;
LABEL_10:

  objc_storeStrong(v14 + 7, self->_creationDate);
  objc_storeStrong(v14 + 8, self->_modificationDate);

  return v14;
}

- (WFFileRepresentation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  WFFileRepresentation *v11;
  uint64_t v12;
  NSString *filename;
  void *v14;
  uint64_t v15;
  NSString *wfName;
  void *v17;
  uint64_t v18;
  NSData *data;
  uint64_t v20;
  NSURL *originalURL;
  uint64_t v22;
  NSDate *creationDate;
  uint64_t v24;
  NSDate *modificationDate;
  NSObject *v26;
  NSObject *v28;
  __int16 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wfType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filename"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v4, "wfFileCoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "decodeFileWithCoder:fileShouldBeDeletedOnDeallocation:fileIsSecurityScoped:", v4, (char *)&v29 + 1, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v29)
  {
    v9 = HIBYTE(v29) | 8;
  }
  else
  {
    if (!objc_msgSend(v8, "wf_fileIsReadable"))
    {
      v11 = -[WFFileRepresentation init](self, "init");
      if (!v11)
        goto LABEL_18;
      if (v8)
      {
        getWFFileRepresentationLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "-[WFFileRepresentation initWithCoder:]";
          v32 = 2112;
          v33 = v8;
          _os_log_impl(&dword_20BBAD000, v28, OS_LOG_TYPE_FAULT, "%s Unable to read file at fileURL while decoding file representation: %@", buf, 0x16u);
        }

      }
      goto LABEL_10;
    }
    v10 = 5;
    if (HIBYTE(v29))
      v10 = 1;
    if ((_BYTE)v29)
      v9 = HIBYTE(v29) | 8;
    else
      v9 = v10;
  }
  v11 = -[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:](self, "initWithFileURL:options:ofType:proposedFilename:originalURL:", v8, v9, v5, v6, v8);
  if (!v11)
  {
    getWFFileRepresentationLogObject();
    v11 = (WFFileRepresentation *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFFileRepresentation initWithCoder:]";
      v32 = 2114;
      v33 = v8;
      _os_log_impl(&dword_20BBAD000, &v11->super.super, OS_LOG_TYPE_ERROR, "%s Unable to decode file representation for fileURL: %{public}@", buf, 0x16u);
    }
    goto LABEL_17;
  }
LABEL_10:
  v12 = objc_msgSend(v6, "copy");
  filename = v11->_filename;
  v11->_filename = (NSString *)v12;

  objc_storeStrong((id *)&v11->_wfType, v5);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wfName"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  wfName = v11->_wfName;
  v11->_wfName = (NSString *)v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");
  data = v11->_data;
  v11->_data = (NSData *)v18;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalURL"));
  v20 = objc_claimAutoreleasedReturnValue();
  originalURL = v11->_originalURL;
  v11->_originalURL = (NSURL *)v20;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
  v22 = objc_claimAutoreleasedReturnValue();
  creationDate = v11->_creationDate;
  v11->_creationDate = (NSDate *)v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
  v24 = objc_claimAutoreleasedReturnValue();
  modificationDate = v11->_modificationDate;
  v11->_modificationDate = (NSDate *)v24;

  v11->_isTemporaryFile = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isTemporaryFile"));
  if (!v11->_data && !v11->_fileURL)
  {
    getWFFileRepresentationLogObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[WFFileRepresentation initWithCoder:]";
      _os_log_impl(&dword_20BBAD000, v26, OS_LOG_TYPE_FAULT, "%s Failing to decode file representation because both _data and _fileURL are nil", buf, 0xCu);
    }

LABEL_17:
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *wfName;
  WFFileType *wfType;
  NSURL *originalURL;
  NSDate *creationDate;
  NSDate *modificationDate;
  void *v10;
  void *v11;
  void *v12;
  int isKindOfClass;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSString *filename;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTemporaryFile, CFSTR("isTemporaryFile"));
  wfName = self->_wfName;
  if (wfName)
    objc_msgSend(v4, "encodeObject:forKey:", wfName, CFSTR("wfName"));
  wfType = self->_wfType;
  if (wfType)
    objc_msgSend(v4, "encodeObject:forKey:", wfType, CFSTR("wfType"));
  originalURL = self->_originalURL;
  if (originalURL)
    objc_msgSend(v4, "encodeObject:forKey:", originalURL, CFSTR("originalURL"));
  creationDate = self->_creationDate;
  if (creationDate)
    objc_msgSend(v4, "encodeObject:forKey:", creationDate, CFSTR("creationDate"));
  modificationDate = self->_modificationDate;
  if (modificationDate)
    objc_msgSend(v4, "encodeObject:forKey:", modificationDate, CFSTR("modificationDate"));
  objc_msgSend(v4, "wfFileCoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "sharedDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v14 = -[NSURL wf_isContainedByDirectoryAtURL:](self->_fileURL, "wf_isContainedByDirectoryAtURL:", v12);
    if ((v12 || (isKindOfClass & 1) != 0)
      && (objc_msgSend(v11, "deletionResponsibility") == 1
       && -[WFFileRepresentation deletesFileOnDeallocation](self, "deletesFileOnDeallocation")
       || ((self->_fileURL != 0) & (isKindOfClass | v14)) == 0))
    {
      -[WFFileRepresentation filename](self, "filename");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sharedTemporaryDirectory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[WFTemporaryFileManager proposedFileURLForFilename:inDirectory:](WFTemporaryFileManager, "proposedFileURLForFilename:inDirectory:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0;
      LOBYTE(v18) = -[WFFileRepresentation writeToFileURL:copy:overwrite:error:](self, "writeToFileURL:copy:overwrite:error:", v20, 1, 0, &v28);
      v21 = v28;
      if ((v18 & 1) == 0)
      {
        getWFFileRepresentationLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[WFFileRepresentation encodeWithCoder:]";
          v31 = 2112;
          v32 = v21;
          _os_log_impl(&dword_20BBAD000, v22, OS_LOG_TYPE_FAULT, "%s Couldn't write data to file when encoding WFFileRepresentation: %@", buf, 0x16u);
        }

      }
      v23 = (void *)MEMORY[0x24BDD1580];
      v24 = v20;
      objc_msgSend(v23, "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "wf_removeExtendedAttributeName:ofItemAtURL:", CFSTR("INFileURLAssociatedAuditToken"), v24);

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "wf_removeExtendedAttributeName:ofItemAtURL:", CFSTR("INFileURLHasAssociatedAuditToken"), v24);

      objc_msgSend(v11, "archiveFileAtURL:fileShouldBeDeletedOnDeallocation:withCoder:", v24, 1, v4);
    }
    else
    {
      -[WFFileRepresentation fileURL](self, "fileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "archiveFileAtURL:fileShouldBeDeletedOnDeallocation:withCoder:", v15, 0, v4);

    }
    filename = self->_filename;
    if (filename)
      objc_msgSend(v4, "encodeObject:forKey:", filename, CFSTR("filename"));

  }
  else
  {
    -[WFFileRepresentation data](self, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("data"));

    -[WFFileRepresentation filename](self, "filename");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v17, CFSTR("filename"));

  }
}

- (BOOL)isEncodable
{
  return 1;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (WFFileType)wfType
{
  return self->_wfType;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (BOOL)deletesFileOnDeallocation
{
  return self->_deletesFileOnDeallocation;
}

- (BOOL)securityScopedResource
{
  return self->_securityScopedResource;
}

- (BOOL)isTemporaryFile
{
  return self->_isTemporaryFile;
}

- (WFItemProviderRequestMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (int64_t)initialRepresentationType
{
  return self->_initialRepresentationType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_wfName, 0);
  objc_storeStrong((id *)&self->_wfType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_filename, 0);
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v21;
  id obj;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    getWFFilesLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]_block_invoke";
      v25 = 2112;
      v26 = 0;
      v27 = 2114;
      v28 = v7;
      _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_ERROR, "%s Failed to coordinate write to %@: %{public}@", buf, 0x20u);
    }
    v14 = 0;
    goto LABEL_8;
  }
  v10 = (void *)a1[4];
  v11 = a1[5];
  v12 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v10, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v8, v11, 0, 0, 0, &obj);
  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    v16 = (_QWORD *)a1[6];
    v17 = v16[4];
    v18 = *(_QWORD *)(a1[7] + 8);
    v21 = *(id *)(v18 + 40);
    v14 = objc_msgSend(v16, "atomicReplaceAcrossVolumesIfNeededWithURLForReplacing:sourceURL:error:", v8, v17, &v21);
    v19 = v21;
    v15 = *(NSObject **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v19;
LABEL_8:

    goto LABEL_9;
  }
  v14 = 1;
LABEL_9:

  return v14;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_52(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v8, v10, &v17);
    v14 = v17;
    v15 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v14;
  }
  else
  {
    getWFFilesLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]_block_invoke";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_ERROR, "%s Failed to coordinate copy from %@ to %@: %{public}@", buf, 0x2Au);
    }
    v13 = 0;
  }

  return v13;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_53(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v8, v10, &v17);
    v14 = v17;
    v15 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v14;
  }
  else
  {
    getWFFilesLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[WFFileRepresentation writeToFileURL:copy:overwrite:error:]_block_invoke";
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v10;
      v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_20BBAD000, v15, OS_LOG_TYPE_ERROR, "%s Failed to coordinate move from %@ to %@: %{public}@", buf, 0x2Au);
    }
    v13 = 0;
  }

  return v13;
}

uint64_t __60__WFFileRepresentation_writeToFileURL_copy_overwrite_error___block_invoke_54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = *(_BYTE *)(a1 + 48) == 0;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "writeToURL:options:error:", a3, 2 * v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  return v6;
}

uint64_t __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v28;
  id obj;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[5];
    v30 = 0;
    v13 = objc_msgSend(v11, "copyItemAtURL:toURL:error:", v8, v12, &v30);
    v14 = v30;

    if ((v13 & 1) == 0)
    {
      getWFFileRepresentationLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = a1[5];
        *(_DWORD *)buf = 136315906;
        v32 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
        v33 = 2112;
        v34 = v8;
        v35 = 2112;
        v36 = v26;
        v37 = 2114;
        v38 = v14;
        _os_log_impl(&dword_20BBAD000, v22, OS_LOG_TYPE_ERROR, "%s Failed to copy file from %@ to %@: %{public}@", buf, 0x2Au);
      }
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    v28 = v14;
    obj = v18;
    v19 = 1;
    v20 = objc_msgSend(v15, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v10, v16, 0, 1, &obj, &v28);
    objc_storeStrong((id *)(v17 + 40), obj);
    v21 = v28;

    if ((v20 & 1) == 0)
    {
      getWFFileRepresentationLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = a1[5];
        *(_DWORD *)buf = 136315906;
        v32 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = v23;
        v37 = 2114;
        v38 = v21;
        _os_log_impl(&dword_20BBAD000, v22, OS_LOG_TYPE_ERROR, "%s Failed to replace file at %@ with %@: %{public}@", buf, 0x2Au);
      }
      v14 = v21;
LABEL_13:

      v19 = 0;
      v21 = v14;
    }
  }
  else
  {
    getWFFileRepresentationLogObject();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)a1[4];
      v25 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v32 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
      v33 = 2112;
      v34 = v24;
      v35 = 2112;
      v36 = v25;
      v37 = 2114;
      v38 = v7;
      _os_log_impl(&dword_20BBAD000, v21, OS_LOG_TYPE_ERROR, "%s Failed to coordinate file copy from %@ to %@: %{public}@", buf, 0x2Au);
    }
    v19 = 0;
  }

  return v19;
}

uint64_t __84__WFFileRepresentation_initWithFileURL_options_ofType_proposedFilename_originalURL___block_invoke_47(uint64_t a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v21;
  id obj;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v8 || !v9)
  {
    getWFFileRepresentationLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18 = *(void **)(a1 + 32);
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315906;
      v24 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
      v25 = 2112;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_20BBAD000, v16, OS_LOG_TYPE_ERROR, "%s Failed to coordinate file move from %@ to %@: %{public}@", buf, 0x2Au);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  v21 = 0;
  obj = v13;
  v14 = 1;
  v15 = objc_msgSend(v11, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v10, v8, 0, 1, &obj, &v21);
  objc_storeStrong((id *)(v12 + 40), obj);
  v16 = v21;

  if ((v15 & 1) == 0)
  {
    getWFFileRepresentationLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[WFFileRepresentation initWithFileURL:options:ofType:proposedFilename:originalURL:]_block_invoke";
      v25 = 2112;
      v26 = v10;
      v27 = 2112;
      v28 = v8;
      v29 = 2114;
      v30 = v16;
      _os_log_impl(&dword_20BBAD000, v17, OS_LOG_TYPE_ERROR, "%s Failed to replace file at %@ with %@: %{public}@", buf, 0x2Au);
    }

LABEL_9:
    v14 = 0;
  }

  return v14;
}

+ (id)fileWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5
{
  return (id)objc_msgSend(a1, "fileWithData:ofType:proposedFilename:originalURL:", a3, a4, a5, 0);
}

+ (id)fileWithData:(id)a3 ofType:(id)a4 proposedFilename:(id)a5 originalURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:ofType:proposedFilename:originalURL:", v13, v12, v11, v10);

  return v14;
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4
{
  return (id)objc_msgSend(a1, "fileWithURL:options:ofType:", a3, a4, 0);
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5
{
  return (id)objc_msgSend(a1, "fileWithURL:options:ofType:proposedFilename:", a3, a4, a5, 0);
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6
{
  return (id)objc_msgSend(a1, "fileWithURL:options:ofType:proposedFilename:originalURL:", a3, a4, a5, a6, a3);
}

+ (id)fileWithURL:(id)a3 options:(int64_t)a4 ofType:(id)a5 proposedFilename:(id)a6 originalURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFileURL:options:ofType:proposedFilename:originalURL:", v15, a4, v14, v13, v12);

  return v16;
}

+ (id)disallowedDirectoryURLs
{
  return (id)_disallowedDirectoryURLs;
}

+ (BOOL)sandboxAllowsRepresentingFileURL:(id)a3
{
  return objc_msgSend(a3, "wf_sandboxAllowsReadingFile");
}

+ (BOOL)fileIsInDisallowedDirectory:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "URLByResolvingSymlinksInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a1, "disallowedDirectoryURLs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "wf_proposedFileIsContainedByDirectoryAtURL:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)isAllowedToRepresentFileURL:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (objc_msgSend(a1, "sandboxAllowsRepresentingFileURL:", v4))
    v5 = objc_msgSend(a1, "fileIsInDisallowedDirectory:", v4) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (id)typeOfData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = a3;
  WFFaultIfLoadingMagicKitInDaemon();
  v4 = (void *)MEMORY[0x24BEC14A0];
  +[GEMagicKit magicForData:](GEMagicKit, "magicForData:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "uniformType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)typeOfFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_msgSend(v3, "wfFileType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || objc_msgSend(v4, "isEqualToUTType:", *MEMORY[0x24BDF8350]))
  {
    WFFaultIfLoadingMagicKitInDaemon();
    v6 = (void *)MEMORY[0x24BEC14A0];
    +[GEMagicKit magicForFileAtURL:](GEMagicKit, "magicForFileAtURL:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniformType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "typeWithString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8510]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5;
}

+ (id)sanitizedFilename:(id)a3 withExtension:(id)a4
{
  return (id)objc_msgSend(a1, "sanitizedFilename:withExtension:unsanitizedName:", a3, a4, 0);
}

+ (id)sanitizedFilename:(id)a3 withExtension:(id)a4 unsanitizedName:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a4;
  if (a5)
    *a5 = objc_retainAutorelease(a3);
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v8, "stringByAppendingPathExtension:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v8;
  }
  v10 = v9;
  objc_msgSend(v9, "wf_filenameTruncatedToMaximumLength");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)proposedFilenameForFile:(id)a3 ofType:(id)a4
{
  return (id)objc_msgSend(a1, "proposedFilenameForFile:ofType:unsanitizedName:", a3, a4, 0);
}

+ (id)proposedFilenameForFile:(id)a3 ofType:(id)a4 unsanitizedName:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id *v31;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC14A0], "typeFromFileExtension:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isDeclared") & 1) != 0 || objc_msgSend(v9, "isEqualToString:", v10))
  {
    v12 = objc_msgSend(v7, "hasSuffix:", CFSTR(".rtfd.zip"));
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v13, "stringByDeletingPathExtension");
      v15 = objc_claimAutoreleasedReturnValue();

      v7 = v14;
      v14 = (void *)v15;
    }

    v7 = v14;
  }
  v16 = v7;
  if ((objc_msgSend(v11, "isEqualToType:", v8) & 1) != 0)
    goto LABEL_7;
  objc_msgSend(v8, "fileExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "length"))
  {

    v17 = v10;
  }
  else
  {
    v19 = objc_msgSend(v11, "conformsToType:", v8);

    v17 = v10;
    if (v19)
LABEL_7:
      v17 = v9;
  }
  v20 = v17;
  if (!objc_msgSend(v16, "length"))
  {
    v22 = *MEMORY[0x24BDF8410];
    if (objc_msgSend(v8, "conformsToUTType:", *MEMORY[0x24BDF8410]))
    {
      v31 = a5;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "typeDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "capitalizedStringWithLocale:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "typeDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v27)
      {
        v28 = v27;
        v29 = v28;
        goto LABEL_20;
      }
      v31 = a5;
      objc_msgSend(v8, "typesConformedTo");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "typeDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
    }

    a5 = v31;
    if (v26)
    {
LABEL_21:
      objc_msgSend(a1, "sanitizedFilename:withExtension:unsanitizedName:", v26, v20, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v26 = v28;

    goto LABEL_21;
  }
  objc_msgSend(a1, "sanitizedFilename:withExtension:unsanitizedName:", v16, v20, a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v21;
}

+ (BOOL)coordinateFileOperation:(unint64_t)a3 shouldCoordinate:(BOOL)a4 fileURL:(id)a5 destinationURL:(id)a6 accessor:(id)a7
{
  id v13;
  id v14;
  uint64_t (**v15)(id, _QWORD, id, id);
  void *v16;
  char v17;
  uint64_t v18;
  id *v19;
  id *v20;
  id *v21;
  _QWORD *v22;
  uint64_t (**v23)(id, _QWORD, id, id);
  uint64_t (**v24)(id, _QWORD, id, id);
  uint64_t (**v25)(id, _QWORD, id, id);
  id v26;
  void *v27;
  _QWORD v29[7];
  uint64_t v30;
  _QWORD v31[7];
  uint64_t v32;
  _QWORD v33[4];
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[7];
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v13 = a5;
  v14 = a6;
  v15 = (uint64_t (**)(id, _QWORD, id, id))a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFFileRepresentation.m"), 603, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessor"));

    if (a4)
      goto LABEL_3;
LABEL_16:
    v17 = v15[2](v15, 0, v13, v14);
    goto LABEL_17;
  }
  if (!a4)
    goto LABEL_16;
LABEL_3:
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1570]), "initWithFilePresenter:", 0);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v17 = 1;
  v42 = 1;
  switch(a3)
  {
    case 0uLL:
      v38 = 0;
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke;
      v37[3] = &unk_24C4DE848;
      v37[6] = &v39;
      v22 = v37;
      v23 = v15;
      v37[4] = 0;
      v37[5] = v23;
      v19 = (id *)&v38;
      objc_msgSend(v16, "coordinateReadingItemAtURL:options:error:byAccessor:", v13, 2, &v38, v37);
      goto LABEL_11;
    case 1uLL:
    case 2uLL:
      if (a3 == 2)
        v18 = 1;
      else
        v18 = 8;
      v36 = 0;
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_2;
      v33[3] = &unk_24C4DE848;
      v35[1] = &v39;
      v34 = 0;
      v35[0] = v15;
      v19 = (id *)&v36;
      objc_msgSend(v16, "coordinateWritingItemAtURL:options:error:byAccessor:", v13, v18, &v36, v33);
      v20 = (id *)v35;
      v21 = (id *)&v34;
      goto LABEL_12;
    case 3uLL:
      v32 = 0;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_3;
      v31[3] = &unk_24C4DE870;
      v31[6] = &v39;
      v22 = v31;
      v24 = v15;
      v31[4] = 0;
      v31[5] = v24;
      v19 = (id *)&v32;
      objc_msgSend(v16, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v13, 2, v14, 8, &v32, v31);
      goto LABEL_11;
    case 4uLL:
      v30 = 0;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_4;
      v29[3] = &unk_24C4DE870;
      v29[6] = &v39;
      v22 = v29;
      v25 = v15;
      v29[4] = 0;
      v29[5] = v25;
      v19 = (id *)&v30;
      objc_msgSend(v16, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v13, 2, v14, 8, &v30, v29);
LABEL_11:
      v20 = (id *)(v22 + 5);
      v21 = (id *)(v22 + 4);
LABEL_12:
      v26 = *v19;

      v17 = *((_BYTE *)v40 + 24) != 0;
      break;
    default:
      v26 = 0;
      break;
  }
  _Block_object_dispose(&v39, 8);

LABEL_17:
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __97__WFFileRepresentation_coordinateFileOperation_shouldCoordinate_fileURL_destinationURL_accessor___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

@end
