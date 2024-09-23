@implementation EDAttachmentPersistenceManager

- (EDAttachmentPersistenceManager)initWithDatabase:(id)a3 messagePersistence:(id)a4
{
  id v6;
  id v7;
  EDAttachmentPersistenceManager *v8;
  EDAttachmentPersistence *v9;
  EDAttachmentPersistence *attachmentPersistence;
  uint64_t v11;
  EFScheduler *synapseAttributesScheduler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDAttachmentPersistenceManager;
  v8 = -[EDAttachmentPersistenceManager init](&v14, sel_init);
  if (v8)
  {
    v9 = -[EDAttachmentPersistence initWithDatabase:]([EDAttachmentPersistence alloc], "initWithDatabase:", v6);
    attachmentPersistence = v8->_attachmentPersistence;
    v8->_attachmentPersistence = v9;

    objc_storeStrong((id *)&v8->_messagePersistence, a4);
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.EDAttachmentPersistenceManager"), 17);
    v11 = objc_claimAutoreleasedReturnValue();
    synapseAttributesScheduler = v8->_synapseAttributesScheduler;
    v8->_synapseAttributesScheduler = (EFScheduler *)v11;

  }
  return v8;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EDAttachmentPersistenceManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, block);
  return (OS_os_log *)(id)log_log_9;
}

void __37__EDAttachmentPersistenceManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;

}

+ (id)attachmentDirectoryURLWithBasePath:(id)a3
{
  objc_msgSend(a3, "URLByAppendingPathComponent:isDirectory:", CFSTR("AttachmentData"), 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_updateFileWrapperNameToStaticFileName:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "preferredFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "filename");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(v8, "pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("attachment"), v9);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("attachment"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    EDAttachmentsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Created new attachment filename %@", buf, 0xCu);
    }

    objc_msgSend(v4, "setPreferredFilename:", v10);
    objc_msgSend(v4, "setFilename:", v10);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (uint64_t)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(void *)a3 orURL:(void *)a4 attachmentMetadata:(void *)a5 basePath:(int)a6 shouldUpdateAttachmentID:
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  EDAttachmentMetadata *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  char v33;
  NSObject *v34;
  char v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  char v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  BOOL v59;
  int v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  char v67;
  NSObject *v68;
  void *v69;
  uint64_t v70;
  int v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  unsigned __int8 v84;
  uint8_t v85[4];
  void *v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v77 = a4;
  v74 = a5;
  v75 = v12;
  if (!a1)
  {
    v70 = 0;
    goto LABEL_88;
  }
  v78 = *(id *)(a1 + 8);
  if (v11)
  {
    -[EDAttachmentPersistenceManager _updateFileWrapperNameToStaticFileName:](a1, v11);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isDirectory") & 1) != 0)
    {
      if (!v12)
      {
        v79 = 0;
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    objc_msgSend(v11, "regularFileContents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDAttachmentPersistence hashForAttachmentData:](EDAttachmentPersistence, "hashForAttachmentData:", v14);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
    {
      objc_msgSend(v12, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("attachment"), v13);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), CFSTR("attachment"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", v12);
      if (!v14)
      {
        EDAttachmentsLog();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:].cold.4((uint64_t)v12, v43, v44);

        v79 = 0;
        v84 = 0;
        goto LABEL_87;
      }
      +[EDAttachmentPersistence hashForAttachmentData:](EDAttachmentPersistence, "hashForAttachmentData:", v14);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__persistAndUpdateAttachmentPersistenceTableFromFileWrapper_orURL_attachmentMetadata_basePath_shouldUpdateAttachmentID_, a1, CFSTR("EDAttachmentPersistenceManager.m"), 98, CFSTR("Need to have either a fileWrapper or a URL"));
    v76 = 0;
    v79 = 0;
  }
LABEL_15:

LABEL_16:
  EDAttachmentsLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v72 = a6;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v77, "globalMessageID");
    objc_msgSend(v77, "mimePartNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v88 = (uint64_t)v79;
    v89 = 2048;
    v90 = v16;
    v91 = 2114;
    v92 = v17;
    _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Created hash %{public}@ for attachment for globalMessageID %lld MIME part %{public}@", buf, 0x20u);

  }
  if (v11)
  {
    objc_msgSend(v11, "fileAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attributesOfItemAtPath:error:", v21, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A38]);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19 || !v73)
    {
      EDAttachmentsLog();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:].cold.3((uint64_t)v75, v45, v46);

      v84 = 0;
      goto LABEL_86;
    }
  }

  EDAttachmentsLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "Checking if the attachment hash already exists in the attachments table", buf, 2u);
  }

  objc_msgSend(v78, "uniqueAttachmentDataForHash:", v79);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  v24 = *MEMORY[0x1E0D1DC08];
  if (!v23)
  {
    v27 = -[EDAttachmentMetadata initWithAttachmentHash:nameOnDisk:size:downloadDate:]([EDAttachmentMetadata alloc], "initWithAttachmentHash:nameOnDisk:size:downloadDate:", v79, v76, v19, v73);
    EDAttachmentsLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v37, OS_LOG_TYPE_DEFAULT, "No existing attachment found. Adding to the attachments table", buf, 2u);
    }

    v38 = objc_msgSend(v78, "insertAttachmentMetadata:", v27);
    if (v38 == v24)
    {
      v36 = 0;
LABEL_61:
      EDAttachmentsLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "preferredFilename");
        objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:].cold.1();
      }
      v35 = 0;
      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), v38);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "URLByAppendingPathComponent:isDirectory:", v47, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    EDAttachmentsLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "preferredFilename");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v88 = v38;
      v89 = 2112;
      v90 = (uint64_t)v50;
      v91 = 2112;
      v92 = v48;
      _os_log_impl(&dword_1D2F2C000, v49, OS_LOG_TYPE_DEFAULT, "Persisting attachment %lld %@ to disk at directory %@", buf, 0x20u);

    }
    if (v11)
    {
      v83 = 0;
      v51 = -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:](a1, v11, v48, &v83);
      v36 = v83;

      if ((v51 & 1) == 0)
        goto LABEL_61;
    }
    else
    {
      objc_msgSend(v48, "URLByAppendingPathComponent:", v76);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = 0;
      v57 = -[EDAttachmentPersistenceManager _moveAttachmentAtURL:toURL:outError:](a1, v75, v56, (uint64_t)&v82);
      v36 = v82;

      if (!v57)
        goto LABEL_61;
    }
    EDAttachmentsLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "preferredFilename");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v88 = v38;
      v89 = 2112;
      v90 = (uint64_t)v52;
      _os_log_impl(&dword_1D2F2C000, v28, OS_LOG_TYPE_DEFAULT, "Persisted attachment %lld %@ to disk", buf, 0x16u);

    }
    v35 = 1;
    goto LABEL_64;
  }
  v25 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v23, "attachmentID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@"), v26);
  v27 = (EDAttachmentMetadata *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v74, "URLByAppendingPathComponent:isDirectory:", v27, 1);
  v28 = objc_claimAutoreleasedReturnValue();
  -[NSObject URLByAppendingPathComponent:](v28, "URLByAppendingPathComponent:", v76);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "relativePath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  EDAttachmentsLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v88 = (uint64_t)v30;
    _os_log_impl(&dword_1D2F2C000, v31, OS_LOG_TYPE_DEFAULT, "Found the attachment in the attachments table. Checking if it exists on disk at %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "fileExistsAtPath:", v30);

  if ((v33 & 1) == 0)
  {
    EDAttachmentsLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "preferredFilename");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v88 = (uint64_t)v40;
      _os_log_impl(&dword_1D2F2C000, v39, OS_LOG_TYPE_DEFAULT, "No existing attachment found on disk. Writing attachment %@ to disk", buf, 0xCu);

    }
    if (v11)
    {
      v81 = 0;
      v41 = -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:](a1, v11, v28, &v81);
      v36 = v81;
      if ((v41 & 1) != 0)
      {
LABEL_39:
        EDAttachmentsLog();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "preferredFilename");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v88 = (uint64_t)v42;
          _os_log_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_DEFAULT, "Persisted attachment %@ to disk with existing metadata", buf, 0xCu);

        }
        v35 = 1;
        goto LABEL_59;
      }
    }
    else
    {
      -[NSObject URLByAppendingPathComponent:](v28, "URLByAppendingPathComponent:", v76);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0;
      v54 = -[EDAttachmentPersistenceManager _moveAttachmentAtURL:toURL:outError:](a1, v75, v53, (uint64_t)&v80);
      v36 = v80;

      if (v54)
        goto LABEL_39;
    }
    EDAttachmentsLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "preferredFilename");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:].cold.2((uint64_t)v36, v55, (uint64_t)buf);
    }
    v35 = 0;
    goto LABEL_59;
  }
  EDAttachmentsLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_DEFAULT, "Found the attachment on disk. No write needed", buf, 2u);
  }
  v35 = 0;
  v36 = 0;
LABEL_59:

  v38 = v24;
LABEL_64:

  objc_msgSend(v18, "attachmentID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
    v59 = 0;
  else
    v59 = v38 == v24;
  v60 = !v59;

  if (v60)
  {
    objc_msgSend(v18, "attachmentID");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (!v61)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v38);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v77, "setAttachmentID:", v62);
    if (!v61)

    EDAttachmentsLog();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "attachmentID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v85 = 138412290;
      v86 = v64;
      _os_log_impl(&dword_1D2F2C000, v63, OS_LOG_TYPE_DEFAULT, "Checking if we need to update or insert the attachment metadata in the message_attachments table for attachment: %@", v85, 0xCu);

    }
    if (v72)
    {
      EDAttachmentsLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v18, "attachmentID");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v85 = 138412290;
        v86 = v66;
        _os_log_impl(&dword_1D2F2C000, v65, OS_LOG_TYPE_DEFAULT, "Update the message_attachments table with the updated attachment ID: %@", v85, 0xCu);

      }
      v67 = objc_msgSend(v78, "updateAttachmentIDForMessageAttachment:", v77);
    }
    else
    {
      EDAttachmentsLog();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v77, "attachmentID");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v85 = 138412290;
        v86 = v69;
        _os_log_impl(&dword_1D2F2C000, v68, OS_LOG_TYPE_DEFAULT, "Create a new entry into the message_attachments table with attachment ID: %@", v85, 0xCu);

      }
      v67 = objc_msgSend(v78, "insertMessageAttachmentMetadata:", v77);
    }
    v35 = v67;
  }
  v84 = v35;

LABEL_86:
LABEL_87:

  v70 = v84;
LABEL_88:

  return v70;
}

- (uint64_t)_writeAttachment:(void *)a3 toDirectory:(_QWORD *)a4 outError:
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v23 = 0;
    goto LABEL_25;
  }
  v9 = objc_msgSend(v7, "isDirectory");
  v10 = (void *)MEMORY[0x1D824B334]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v29);
  v13 = v29;

  if (v12)
  {
    objc_msgSend(v7, "preferredFilename");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14 || (objc_msgSend(v7, "filename"), (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (v9)
        objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v14, 1);
      else
        objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v13;
      v17 = objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", &v28);
      v18 = v28;

      if ((v17 & 1) != 0)
      {
        EDAttachmentsLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v15, "path");
          objc_claimAutoreleasedReturnValue();
          -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:].cold.2();
        }

        v26 = v18;
        v16 = -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:](a1, v7, v15, &v26);
        v13 = v26;

        goto LABEL_22;
      }
      objc_msgSend(v18, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        v21 = objc_msgSend(v18, "code") == 260;

        if (v21)
        {
          v27 = v18;
          v16 = -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:](a1, v7, v15, &v27);
          v13 = v27;

          goto LABEL_22;
        }
      }
      else
      {

      }
      EDAttachmentsLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v15, "path");
        objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:].cold.3();
      }

      v16 = 0;
      v13 = v18;
      goto LABEL_22;
    }
    EDAttachmentsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:].cold.1((uint64_t)v7, v25, (uint64_t)v31);
    }
  }
  else
  {
    EDAttachmentsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:].cold.4();
    }
  }
  v15 = 0;
  v16 = 0;
LABEL_22:

  objc_autoreleasePoolPop(v10);
  if (a4)
    *a4 = objc_retainAutorelease(v13);
  v30 = v16;

  v23 = v30;
LABEL_25:

  return v23;
}

- (uint64_t)_moveAttachmentAtURL:(void *)a3 toURL:(uint64_t)a4 outError:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1)
  {
    objc_msgSend(v8, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, a4);

    if (v12)
    {
      if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "removeItemAtURL:error:", v7, 0);
        v14 = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "moveItemAtURL:toURL:error:", v7, v9, a4);
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)persistAttachment:(id)a3 attachmentMetadata:(id)a4 basePath:(id)a5 error:(id *)a6
{
  return -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:]((id *)&self->super.isa, a3, 0, a4, a5);
}

- (uint64_t)_persistAttachmentWithWrapper:(id *)a1 orURL:(void *)a2 attachmentMetadata:(void *)a3 basePath:(void *)a4 error:(void *)a5
{
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v32;
  __int128 v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  id v38;
  id v39;
  void *v40;
  id v41;
  NSObject *v42;
  int v43;
  void *v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  v36 = a3;
  v9 = a4;
  v38 = a5;
  v44 = v9;
  if (!a1)
  {
    v17 = 0;
    goto LABEL_49;
  }
  v10 = objc_msgSend(v9, "globalMessageID");
  objc_msgSend(v9, "mimePartNumber");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = a1[1];
  EDAttachmentsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Checking to see if the attachment metadata already exists in the message_attachments table", buf, 2u);
  }

  v50 = 0;
  if (v40)
  {
    v43 = objc_msgSend(v39, "messageAttachmentExistsForGlobalMessageID:mimePartNumber:hasAttachmentEntry:", v10, v40, &v50);
LABEL_8:
    if (v50 && v43)
    {
      EDAttachmentsLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Found both the attachment metadata and the attachment in the message_attachments and attachments table. No insertion needed.", buf, 2u);
      }

      -[EDAttachmentPersistenceManager _attachmentURLForAttachmentMetadata:basePath:](a1, v44, v38);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v41)
        v14 = -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:]((uint64_t)a1, v41, v13, 0);
      else
        v14 = -[EDAttachmentPersistenceManager _moveAttachmentAtURL:toURL:outError:]((uint64_t)a1, v36, v13, 0);
      v17 = v14;
    }
    else
    {
      if (v50)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__persistAttachmentWithWrapper_orURL_attachmentMetadata_basePath_error_, a1, CFSTR("EDAttachmentPersistenceManager.m"), 366, CFSTR("We can't possibly have found an attachment entry without a message_attachment"));

      }
      +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:](EDAttachmentPersistenceManager, "attachmentDirectoryURLWithBasePath:", v38);
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v41, "isRegularFile") ^ 1;
      if (v36)
        LOBYTE(v15) = 0;
      if ((v15 & 1) != 0)
      {
        EDAttachmentsLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Persisting archive attachment", buf, 2u);
        }

        -[EDAttachmentPersistenceManager _tempDirectoryForArchiveAttachmentsWithParentDirectory:](a1, v42);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _writeAttachment:toDirectory:outError:]((uint64_t)a1, v41, v19, 0);
        objc_msgSend(v34, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v19, MEMORY[0x1E0C9AA60], 16, 0);
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
        if (v20)
        {
          LOBYTE(v17) = 0;
          v22 = *(_QWORD *)v47;
          *(_QWORD *)&v21 = 138412290;
          v33 = v21;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v47 != v22)
                objc_enumerationMutation(obj);
              objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * i), "relativeString", v33);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "stringByRemovingPercentEncoding");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "URLByAppendingPathComponent:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              v27 = objc_alloc(MEMORY[0x1E0D1EEB8]);
              v45 = 0;
              v28 = (void *)objc_msgSend(v27, "initWithURL:options:error:", v26, 1, &v45);
              v29 = v45;
              if (objc_msgSend(v28, "isDirectory"))
              {
                EDAttachmentsLog();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v33;
                  v52 = v26;
                  _os_log_impl(&dword_1D2F2C000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Persisting archive attachment from temp directory %@", buf, 0xCu);
                }

                LOBYTE(v17) = -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]((uint64_t)a1, v28, 0, v44, v42, v43);
              }
              if ((v17 & 1) == 0)
              {
                EDAttachmentsLog();
                v30 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v41, "preferredFilename");
                  objc_claimAutoreleasedReturnValue();
                  -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:].cold.2();
                }

                goto LABEL_45;
              }

              v17 = 1;
            }
            v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
            if (v20)
              continue;
            break;
          }
        }
        else
        {
LABEL_45:
          v17 = 0;
        }

        objc_msgSend(v34, "removeItemAtURL:error:", v19, 0);
      }
      else
      {
        EDAttachmentsLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Persisting regular file attachment", buf, 2u);
        }

        v17 = -[EDAttachmentPersistenceManager _persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:]((uint64_t)a1, v41, v36, v44, v42, v43);
      }

      v13 = v42;
    }
    goto LABEL_48;
  }
  if (v35)
  {
    v43 = objc_msgSend(v39, "messageAttachmentExistsForGlobalMessageID:remoteURL:hasAttachmentEntry:", v10, v35, &v50);
    goto LABEL_8;
  }
  EDAttachmentsLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v44, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:].cold.1();
  }
  v17 = 0;
LABEL_48:

LABEL_49:
  return v17;
}

- (BOOL)persistAttachmentWithURL:(id)a3 attachmentMetadata:(id)a4 basePath:(id)a5 error:(id *)a6
{
  return -[EDAttachmentPersistenceManager _persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:]((id *)&self->super.isa, 0, a3, a4, a5);
}

- (id)createAttachmentFileWriterForAttachmentMetadata:(id)a3 basePath:(id)a4 downloadDate:(id)a5 queue:(id)a6 compressionQueue:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  EDMessageAttachmentMetadata *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  EDMessageAttachmentMetadata *v26;
  void *v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v13, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (EDMessageAttachmentMetadata *)v13;
  }
  else
  {
    v26 = [EDMessageAttachmentMetadata alloc];
    v21 = objc_msgSend(v13, "globalMessageID");
    objc_msgSend(v13, "mimePartNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attachmentID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[EDMessageAttachmentMetadata initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:](v26, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", v21, CFSTR("attachment"), v27, v22, v23);

  }
  -[EDAttachmentPersistenceManager _createAttachmentFileWriterForAttachmentMetadata:basePath:downloadDate:queue:compressionQueue:completion:]((EDAttachmentFileWriter *)self, v20, v14, v15, v16, v17, v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (EDAttachmentFileWriter)_createAttachmentFileWriterForAttachmentMetadata:(void *)a3 basePath:(void *)a4 downloadDate:(void *)a5 queue:(void *)a6 compressionQueue:(void *)a7 completion:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  EDAttachmentFileWriter *v22;
  NSObject *v23;
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  NSObject *v28;
  EDAttachmentFileWriter *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v25 = a5;
  v16 = a6;
  v17 = a7;
  if (a1)
  {
    -[EDAttachmentPersistenceManager _attachmentURLForAttachmentMetadata:basePath:](a1, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0))
    {
      EDAttachmentsLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v13, "globalMessageID");
        objc_msgSend(v13, "mimePartNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v34 = v20;
        v35 = 2114;
        v36 = v21;
        _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Attachment file for global ID %llu MIME part [%{public}@] already exists. Not creating file writer.", buf, 0x16u);

      }
      a1 = 0;
    }
    else
    {
      -[EDAttachmentPersistenceManager _createTemporaryURLForAttachmentMetadata:basePath:](a1, v13, v14);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v22 = [EDAttachmentFileWriter alloc];
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke;
        v26[3] = &unk_1E949B1A0;
        v27 = v13;
        v28 = v19;
        v29 = a1;
        v30 = v14;
        v31 = v15;
        v32 = v17;
        a1 = -[EDAttachmentFileWriter initWithFinalURL:queue:compressionQueue:completion:](v22, "initWithFinalURL:queue:compressionQueue:completion:", v28, v25, v16, v26);

        v23 = v27;
      }
      else
      {
        EDAttachmentsLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "globalMessageID");
          objc_msgSend(v13, "mimePartNumber");
          objc_claimAutoreleasedReturnValue();
          -[EDAttachmentPersistenceManager _createAttachmentFileWriterForAttachmentMetadata:basePath:downloadDate:queue:compressionQueue:completion:].cold.1();
        }
        a1 = 0;
      }

    }
  }

  return a1;
}

- (id)_attachmentURLForAttachmentMetadata:(void *)a3 basePath:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "mimePartNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(v5, "globalMessageID");
      objc_msgSend(v5, "mimePartNumber");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachmentURLForGlobalMessageID:mimePartNumber:basePath:", v8, v9, v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "remoteURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        a1 = 0;
        goto LABEL_7;
      }
      v12 = objc_msgSend(v5, "globalMessageID");
      objc_msgSend(v5, "remoteURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "attachmentURLForGlobalMessageID:remoteURL:basePath:", v12, v9, v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    a1 = (void *)v10;

  }
LABEL_7:

  return a1;
}

- (id)_createTemporaryURLForAttachmentMetadata:(void *)a3 basePath:
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAttachmentPersistenceManager _temporaryFileURLWithBasePath:name:]((uint64_t)a1, v6, v7);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

void __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    EDAttachmentsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke_cold_1((uint64_t)v14, objc_msgSend(*(id *)(a1 + 32), "globalMessageID"));

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    v10 = *(void **)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v12 = *(void **)(a1 + 64);
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[EDAttachmentPersistenceManager _didCompleteWritingAttachmentToFile:basePath:digest:metadata:downloadDate:](v8, v11, v9, v5, v10, v13);
    if (!v12)

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_didCompleteWritingAttachmentToFile:(void *)a3 basePath:(void *)a4 digest:(void *)a5 metadata:(void *)a6 downloadDate:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    -[EDAttachmentPersistenceManager _updateAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:](a1, v11, v14, v12, v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v18 = objc_msgSend(v17, "moveItemAtURL:toURL:error:", v11, v16, &v24);
      v19 = v24;

      if ((v18 & 1) != 0)
      {
        EDAttachmentsLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_msgSend(v14, "globalMessageID");
          *(_DWORD *)buf = 134217984;
          v26 = v21;
          _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "Did move attachment to final location (global ID %llu).", buf, 0xCu);
        }
      }
      else
      {
        EDAttachmentsLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v14, "globalMessageID");
          objc_msgSend(v19, "ef_publicDescription");
          objc_claimAutoreleasedReturnValue();
          -[EDAttachmentPersistenceManager _didCompleteWritingAttachmentToFile:basePath:digest:metadata:downloadDate:].cold.1();
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v20 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeItemAtURL:error:](v20, "removeItemAtURL:error:", v11, 0);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeItemAtURL:error:", v11, 0);

    }
  }

}

- (id)_temporaryFileURLWithBasePath:(void *)a3 name:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("__temp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 18);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    arc4random_buf((void *)objc_msgSend(v9, "mutableBytes"), objc_msgSend(v9, "length"));
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDAttachmentPersistenceManager createFilenameForAttachmentName:](EDAttachmentPersistenceManager, "createFilenameForAttachmentName:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_updateAttachmentIDAndCreateFinalFileURLForFile:(void *)a3 metadata:(void *)a4 basePath:(void *)a5 digest:(void *)a6 downloadDate:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:](a1, v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attachmentID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v16, "attachmentID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAttachmentID:", v18);

      if ((objc_msgSend(*(id *)(a1 + 8), "updateAttachmentIDForMessageAttachment:", v12) & 1) != 0
        || (objc_msgSend(*(id *)(a1 + 8), "insertMessageAttachmentMetadata:", v12) & 1) != 0)
      {
        objc_msgSend(v16, "attachmentID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "nameOnDisk");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _attachmentURLWithBasePath:attachmentID:nameOnDisk:](a1, v13, v19, v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[EDAttachmentPersistenceManager _createParentDirectoryForFile:](a1, v17);
      }
      else
      {
        v17 = 0;
      }
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (EDAttachmentMetadata)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(void *)a3 metadata:(void *)a4 basePath:(void *)a5 digest:(void *)a6 downloadDate:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  EDAttachmentMetadata *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  char v26;
  NSObject *v27;
  void *v28;
  EDAttachmentMetadata *v29;
  void *v30;
  EDAttachmentMetadata *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!a1)
  {
    v18 = 0;
    goto LABEL_13;
  }
  if (v14)
  {
    if (objc_msgSend(v14, "length") == 32)
    {
      v16 = *(id *)(a1 + 8);
      objc_msgSend(v14, "ef_hexString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uniqueAttachmentDataForHash:", v17);
      v18 = (EDAttachmentMetadata *)objc_claimAutoreleasedReturnValue();

      -[EDAttachmentMetadata attachmentID](v18, "attachmentID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        EDAttachmentsLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_msgSend(objc_retainAutorelease(v14), "bytes");
          v22 = objc_msgSend(v12, "globalMessageID");
          -[EDAttachmentMetadata attachmentID](v18, "attachmentID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158466;
          v43 = 32;
          v44 = 2096;
          v45 = v21;
          v46 = 2048;
          v47 = v22;
          v48 = 2048;
          v49 = objc_msgSend(v23, "unsignedLongLongValue");
          _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "Found existing attachment with digest %.32P (global ID %llu): attachment ID: %llu", buf, 0x26u);

        }
      }
      else
      {

        v41 = 0;
        v25 = *MEMORY[0x1E0C99998];
        v40 = 0;
        v26 = objc_msgSend(v11, "getResourceValue:forKey:error:", &v41, v25, &v40);
        v20 = v41;
        v38 = v40;
        if ((v26 & 1) == 0)
        {
          EDAttachmentsLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "globalMessageID");
            objc_msgSend(v38, "ef_publicDescription");
            objc_claimAutoreleasedReturnValue();
            -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:].cold.3();
          }

        }
        objc_msgSend(v12, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[EDAttachmentPersistenceManager createFilenameForAttachmentName:](EDAttachmentPersistenceManager, "createFilenameForAttachmentName:", v28);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = [EDAttachmentMetadata alloc];
        objc_msgSend(v14, "ef_hexString");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[EDAttachmentMetadata initWithAttachmentHash:nameOnDisk:size:downloadDate:](v29, "initWithAttachmentHash:nameOnDisk:size:downloadDate:", v30, v39, v20, v15);

        v32 = objc_msgSend(*(id *)(a1 + 8), "insertAttachmentMetadata:", v31);
        if (v32 == *MEMORY[0x1E0D1DC08])
        {
          EDAttachmentsLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:].cold.2((uint64_t)buf, objc_msgSend(v12, "globalMessageID"));

          v18 = 0;
        }
        else
        {
          EDAttachmentsLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v35 = objc_msgSend(objc_retainAutorelease(v14), "bytes");
            v36 = objc_msgSend(v12, "globalMessageID");
            *(_DWORD *)buf = 68158466;
            v43 = 32;
            v44 = 2096;
            v45 = v35;
            v46 = 2048;
            v47 = v36;
            v48 = 2048;
            v49 = v32;
            _os_log_impl(&dword_1D2F2C000, v34, OS_LOG_TYPE_DEFAULT, "Did insert new attachment ID for digest %.32P (global ID %llu): attachment ID: %llu", buf, 0x26u);
          }

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v32);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDAttachmentMetadata setAttachmentID:](v31, "setAttachmentID:", v37);

          v18 = v31;
        }

      }
      goto LABEL_12;
    }
    EDAttachmentsLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:].cold.4((uint64_t)buf, objc_msgSend(v12, "globalMessageID"));
  }
  else
  {
    EDAttachmentsLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[EDAttachmentPersistenceManager _updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:].cold.1((uint64_t)buf, objc_msgSend(v12, "globalMessageID"));
  }
  v18 = 0;
LABEL_12:

LABEL_13:
  return v18;
}

- (id)_attachmentURLWithBasePath:(void *)a3 attachmentID:(void *)a4 nameOnDisk:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (a1 && v7 && v8 && v9)
  {
    +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:](EDAttachmentPersistenceManager, "attachmentDirectoryURLWithBasePath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (void)_createParentDirectoryForFile:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (a1)
  {
    v6 = v3;
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

    v3 = v6;
  }

}

- (uint64_t)_writeFileWrapper:(void *)a3 toURL:(_QWORD *)a4 outError:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
  {
    v9 = 0;
    goto LABEL_22;
  }
  v26 = 0;
  v9 = objc_msgSend(v7, "writeToURL:options:originalContentsURL:error:", v8, 3, 0, &v26);
  v10 = v26;
  if (!(_DWORD)v9)
  {
    EDAttachmentsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ef_publicDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v28 = v7;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      _os_log_error_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_ERROR, "Failed to write attachment file wrapper %@ to %{public}@, %{public}@", buf, 0x20u);

    }
    goto LABEL_19;
  }
  EDAttachmentsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Persisting attachment to filesystem: %{public}@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 16), "setContentProtectionForAttachmentFile:", v8);
  v13 = objc_msgSend(v7, "isDirectory");
  v14 = *(id *)(a1 + 16);
  v15 = v14;
  if (v13)
  {
    v25 = 0;
    v16 = objc_msgSend(v14, "compressDirectory:shouldCancel:error:", v8, 0, &v25);
    v17 = v25;

    if ((v16 & 1) != 0)
      goto LABEL_15;
    EDAttachmentsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      objc_claimAutoreleasedReturnValue();
      -[NSObject ef_publicDescription](v17, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:].cold.1();
    }
  }
  else
  {
    v24 = 0;
    v21 = objc_msgSend(v14, "compressFile:error:", v8, &v24);
    v17 = v24;

    if ((v21 & 1) != 0)
      goto LABEL_15;
    EDAttachmentsLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      objc_claimAutoreleasedReturnValue();
      -[NSObject ef_publicDescription](v17, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:].cold.1();
    }
  }

LABEL_15:
  if (v17)
  {
    EDAttachmentsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      objc_claimAutoreleasedReturnValue();
      -[NSObject ef_publicDescription](v17, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _writeFileWrapper:toURL:outError:].cold.1();
    }

  }
LABEL_19:

  if (a4)
    *a4 = objc_retainAutorelease(v10);

LABEL_22:
  return v9;
}

- (_QWORD)_tempDirectoryForArchiveAttachmentsWithParentDirectory:(_QWORD *)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)a1[3];
    if (!v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("__temp_%@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "URLByAppendingPathComponent:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[3];
      a1[3] = v8;

      v4 = (void *)a1[3];
    }
    a1 = v4;
  }

  return a1;
}

- (BOOL)persistAttachmentMetadata:(id)a3
{
  id v4;
  EDAttachmentPersistence *attachmentPersistence;
  EDAttachmentPersistence *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  v6 = attachmentPersistence;
  if (!objc_msgSend(v4, "globalMessageID"))
  {
    EDAttachmentsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EDAttachmentPersistenceManager persistAttachmentMetadata:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_11;
  }
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    EDAttachmentsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EDAttachmentPersistenceManager persistAttachmentMetadata:].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_11;
  }
  objc_msgSend(v4, "mimePartNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v4, "remoteURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      goto LABEL_13;
    EDAttachmentsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EDAttachmentPersistenceManager persistAttachmentMetadata:].cold.3(v9, v43, v44, v45, v46, v47, v48, v49);
LABEL_11:
    v24 = 0;
    goto LABEL_32;
  }

LABEL_13:
  EDAttachmentsLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(v4, "globalMessageID");
    objc_msgSend(v4, "mimePartNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v56 = v27;
    v57 = 2114;
    v58 = v28;
    _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Check the message_attachments table if attachment with message ID %lld MIME part %{public}@ exists", buf, 0x16u);

  }
  -[EDAttachmentPersistence messageAttachmentMetadataForMessageID:](v6, "messageAttachmentMetadataForMessageID:", objc_msgSend(v4, "globalMessageID"));
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v29 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v51 != v30)
          objc_enumerationMutation(v9);
        v32 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v32, "mimePartNumber");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "mimePartNumber");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "isEqualToString:", v34))
        {
          v35 = objc_msgSend(v32, "globalMessageID");
          LODWORD(v35) = v35 == objc_msgSend(v4, "globalMessageID");

          if ((_DWORD)v35)
          {
            objc_msgSend(v4, "mimePartNumber");
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            EDAttachmentsLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              v41 = objc_msgSend(v4, "globalMessageID");
              *(_DWORD *)buf = 134218242;
              v56 = v41;
              v57 = 2114;
              v58 = v38;
              _os_log_impl(&dword_1D2F2C000, v39, OS_LOG_TYPE_DEFAULT, "Attachment metadata already exists in message_attachments table for globalMessageID: %lld mime part number: %{public}@", buf, 0x16u);
            }

            v24 = 1;
            goto LABEL_32;
          }
        }
        else
        {

        }
      }
      v29 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      if (v29)
        continue;
      break;
    }
  }

  EDAttachmentsLog();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    v37 = objc_msgSend(v4, "globalMessageID");
    *(_DWORD *)buf = 134218242;
    v56 = v37;
    v57 = 2114;
    v58 = 0;
    _os_log_impl(&dword_1D2F2C000, v36, OS_LOG_TYPE_DEFAULT, "Attachment metadata doesn't exist in message_attachments table for messageID: %lld mime part number: %{public}@. Persisting into the message_attachments table", buf, 0x16u);
  }

  v24 = -[EDAttachmentPersistence insertMessageAttachmentMetadata:](v6, "insertMessageAttachmentMetadata:", v4);
LABEL_32:

  return v24;
}

- (uint64_t)removeDatabaseAttachments:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    EDAttachmentsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Removing attachments to delete %@ from the attachments table", (uint8_t *)&v6, 0xCu);
    }

    a1 = objc_msgSend(*(id *)(a1 + 8), "removeAttachments:", v3);
  }

  return a1;
}

- (BOOL)removeFilesystemAttachmentsByAccountIdentifier:(_BOOL8)a1
{
  id v3;
  NSObject *v4;
  _QWORD v6[5];
  __int128 buf;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    EDAttachmentsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v3;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Removing attachments to delete %@ from the filesystem", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v8 = 0x2020000000;
    v9 = 1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __81__EDAttachmentPersistenceManager_removeFilesystemAttachmentsByAccountIdentifier___block_invoke;
    v6[3] = &unk_1E949B1C8;
    v6[4] = &buf;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
    a1 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
    _Block_object_dispose(&buf, 8);
  }

  return a1;
}

void __81__EDAttachmentPersistenceManager_removeFilesystemAttachmentsByAccountIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v20 = a3;
  v21 = v5;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("regularAccountIdentifier")))
    objc_msgSend(MEMORY[0x1E0D1E2B8], "baseMailDirectory");
  else
    +[EDPersonaPersistenceLayoutManager baseAccountDirectoryForPersonaIdentifier:](EDPersonaPersistenceLayoutManager, "baseAccountDirectoryForPersonaIdentifier:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:](EDAttachmentPersistenceManager, "attachmentDirectoryURLWithBasePath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v20;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        EDAttachmentsLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v28 = v12;
          _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Deleting attachment directory: %{public}@", buf, 0xCu);
        }

        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        if (*(_BYTE *)(v14 + 24))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          v16 = objc_msgSend(v15, "removeItemAtURL:error:", v12, &v22);
          v17 = v22;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16;

        }
        else
        {
          v17 = 0;
          *(_BYTE *)(v14 + 24) = 0;
        }
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          EDAttachmentsLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v28 = v12;
            _os_log_error_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_ERROR, "Failed to delete attachment directory: %{public}@", buf, 0xCu);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v8);
  }

}

- (id)attachmentURLForGlobalMessageID:(int64_t)a3 mimePartNumber:(id)a4 basePath:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  EDAttachmentPersistence *attachmentPersistence;
  EDAttachmentPersistence *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  EDAttachmentsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 134218498;
    v23 = a3;
    v24 = 2114;
    v25 = (int64_t)v8;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Fetching attachment URL for globalMessageID %lld MIME part number %{public}@ at base path %@", (uint8_t *)&v22, 0x20u);

  }
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  v13 = attachmentPersistence;
  -[EDAttachmentPersistence attachmentMetadataForMessage:mimePartNumber:](v13, "attachmentMetadataForMessage:mimePartNumber:", a3, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDAttachmentPersistenceManager _attachmentURLForAttachmentTableMetadata:basePath:](self, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    EDAttachmentsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = (int64_t)v15;
      v24 = 2048;
      v25 = a3;
      v26 = 2114;
      v27 = v8;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Found attachment URL %{public}@ for globalMessageID %lld MIME part number %{public}@ at base path %@", (uint8_t *)&v22, 0x2Au);

    }
    v18 = v15;
  }
  else
  {
    EDAttachmentsLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218498;
      v23 = a3;
      v24 = 2114;
      v25 = (int64_t)v8;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Could not find attachment URL for globalMessageID %lld MIME part number %{public}@ at base path %@", (uint8_t *)&v22, 0x20u);

    }
  }

  return v15;
}

- (id)_attachmentURLForAttachmentTableMetadata:(void *)a3 basePath:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(v5, "attachmentID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v5, "nameOnDisk");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        a1 = 0;
        goto LABEL_8;
      }
      objc_msgSend(v5, "attachmentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nameOnDisk");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager _attachmentURLWithBasePath:attachmentID:nameOnDisk:]((uint64_t)a1, v6, v7, v10);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = 0;
    }

  }
LABEL_8:

  return a1;
}

- (id)attachmentURLsForGlobalMessageIDs:(id)a3
{
  id v4;
  uint64_t v5;
  EDAttachmentPersistence *attachmentPersistence;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  char isKindOfClass;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  const __CFString *v26;
  id v27;
  __CFString *v29;
  EDAttachmentPersistenceManager *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v32, "allKeys");
  v5 = objc_claimAutoreleasedReturnValue();
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  -[EDAttachmentPersistence attachmentMetadataForMessageIDs:](attachmentPersistence, "attachmentMetadataForMessageIDs:", v5);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v7)
  {
    v30 = self;
    v31 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      v33 = v7;
      do
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v8);
        objc_msgSend(v32, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager _attachmentURLsAndNamesForMetadata:basePath:](self, v11, v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v36 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v17, "url");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = v18 == 0;

              if (!v19)
                objc_msgSend(v4, "addObject:", v17);
            }
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          }
          while (v14);
        }

        ++v8;
        self = v30;
      }
      while (v8 != v33);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v7);
  }

  if (v4)
  {
    EDAttachmentsLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)MEMORY[0x1E0D1EF48];
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v23 = &stru_1E94A4508;
      }
      else
      {
        objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v21, "partiallyRedactedStringForString:", v23);
      v25 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = &stru_1E94A4508;
      else
        v26 = v29;
      *(_DWORD *)buf = 138543618;
      v44 = v25;
      v45 = 2114;
      v46 = v26;
      _os_log_impl(&dword_1D2F2C000, v20, OS_LOG_TYPE_DEFAULT, "Found attachment URLs %{public}@ for globalMessageIDs %{public}@", buf, 0x16u);

      if ((isKindOfClass & 1) == 0)
    }

    v27 = v4;
  }
  else
  {
    EDAttachmentsLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v29;
      _os_log_impl(&dword_1D2F2C000, v24, OS_LOG_TYPE_DEFAULT, "Could not find attachment URLs for globalMessageIDs %{public}@", buf, 0xCu);
    }

  }
  return v4;
}

- (id)_attachmentURLsAndNamesForMetadata:(void *)a3 basePath:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__EDAttachmentPersistenceManager__attachmentURLsAndNamesForMetadata_basePath___block_invoke;
    v9[3] = &unk_1E949B1F0;
    v9[4] = a1;
    v10 = v6;
    objc_msgSend(v5, "ef_map:", v9);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

- (id)attachmentURLForGlobalMessageID:(int64_t)a3 remoteURL:(id)a4 basePath:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  EDAttachmentPersistence *attachmentPersistence;
  EDAttachmentPersistence *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v22;
  int64_t v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  EDAttachmentsLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 134218498;
    v23 = a3;
    v24 = 2112;
    v25 = (int64_t)v8;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Fetching attachment URL for globalMessageID %lld remoteURL %@ at base path %@", (uint8_t *)&v22, 0x20u);

  }
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  v13 = attachmentPersistence;
  -[EDAttachmentPersistence attachmentMetadataForMessage:remoteURL:](v13, "attachmentMetadataForMessage:remoteURL:", a3, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[EDAttachmentPersistenceManager _attachmentURLForAttachmentTableMetadata:basePath:](self, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    EDAttachmentsLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138544130;
      v23 = (int64_t)v15;
      v24 = 2048;
      v25 = a3;
      v26 = 2112;
      v27 = v8;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "Found attachment URL %{public}@ for globalMessageID %lld remoteURL %@ at base path %@", (uint8_t *)&v22, 0x2Au);

    }
    v18 = v15;
  }
  else
  {
    EDAttachmentsLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218498;
      v23 = a3;
      v24 = 2112;
      v25 = (int64_t)v8;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Could not find attachment URL for globalMessageID %lld remoteURL %@ at base path %@", (uint8_t *)&v22, 0x20u);

    }
  }

  return v15;
}

id __78__EDAttachmentPersistenceManager__attachmentURLsAndNamesForMetadata_basePath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1E0D8];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v3, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nameOnDisk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDAttachmentPersistenceManager _attachmentURLWithBasePath:attachmentID:nameOnDisk:](v5, v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentWithURL:displayName:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_cleanedNameForName:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "applyTransform:reverse:range:updatedRange:", CFSTR("Any-Latin; Latin-ASCII"),
      0,
      0,
      objc_msgSend(v3, "length"),
      0);
    objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addCharactersInString:", CFSTR("/."));
    while (1)
    {
      v8 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v7);
      if (!v9)
        break;
      objc_msgSend(v4, "replaceCharactersInRange:withString:", v8, v9, &stru_1E94A4508);
    }
    if (objc_msgSend(v4, "length"))
      v10 = v4;
    else
      v10 = 0;
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)createFilenameForAttachmentName:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  v4 = a3;
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistenceManager _cleanedNameForName:]((uint64_t)a1, v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDAttachmentPersistenceManager _cleanedNameForName:]((uint64_t)a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v9 = v6;
    if (!v8)
    {
      v10 = v6;
LABEL_6:
      v9 = v10;
      goto LABEL_7;
    }
LABEL_5:
    -[__CFString stringByAppendingPathExtension:](v9, "stringByAppendingPathExtension:", v8);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = CFSTR("attachment");
  if (v8)
    goto LABEL_5;
LABEL_7:

  return v9;
}

- (id)attachmentDirectoryURLForMessageID:(int64_t)a3 basePath:(id)a4
{
  +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:](EDAttachmentPersistenceManager, "attachmentDirectoryURLWithBasePath:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)attachmentURLForMessageAttachmentID:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  EDAttachmentPersistence *attachmentPersistence;
  EDAttachmentPersistence *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  EDAttachmentsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Fetching attachment URL for messageAttachmentID %@ at base path %@", (uint8_t *)&v20, 0x16u);

  }
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  v11 = attachmentPersistence;
  -[EDAttachmentPersistence attachmentMetadataForMessageAttachmentID:](v11, "attachmentMetadataForMessageAttachmentID:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v12, "attachmentID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");
    objc_msgSend(v12, "nameOnDisk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDAttachmentPersistenceManager _attachmentURLForAttachmentID:nameOnDisk:basePath:]((uint64_t)self, v14, v15, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    EDAttachmentsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v16;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Found attachment URL %@ for messageAttachmentID %@ at base path %@", (uint8_t *)&v20, 0x20u);

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_attachmentURLForAttachmentID:(void *)a3 nameOnDisk:(void *)a4 basePath:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = 0;
  if (a1 && v7 && *MEMORY[0x1E0D1DC08] != a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld"), a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDAttachmentPersistenceManager attachmentDirectoryURLWithBasePath:](EDAttachmentPersistenceManager, "attachmentDirectoryURLWithBasePath:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)insertMimePartAttachments:(id)a3 forGlobalMessageID:(int64_t)a4
{
  id v6;
  EDAttachmentPersistence *attachmentPersistence;
  id v8;

  v6 = a3;
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  v8 = v6;
  -[EDAttachmentPersistence insertMimePartAttachments:forGlobalMessageID:](attachmentPersistence, "insertMimePartAttachments:forGlobalMessageID:", v6, a4);

}

- (id)allAttachmentsInfoForGlobalMessageIDs:(id)a3 basePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EDAttachmentPersistence *attachmentPersistence;
  EDAttachmentPersistence *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    attachmentPersistence = self->_attachmentPersistence;
  else
    attachmentPersistence = 0;
  v10 = attachmentPersistence;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__EDAttachmentPersistenceManager_allAttachmentsInfoForGlobalMessageIDs_basePath___block_invoke;
  v16[3] = &unk_1E949B218;
  v16[4] = self;
  v11 = v7;
  v17 = v11;
  v12 = v8;
  v18 = v12;
  -[EDAttachmentPersistence enumerateAttachmentsInfoForGlobalMessageIDs:withBlock:](v10, "enumerateAttachmentsInfoForGlobalMessageIDs:withBlock:", v6, v16);

  v13 = v18;
  v14 = v12;

  return v14;
}

void __81__EDAttachmentPersistenceManager_allAttachmentsInfoForGlobalMessageIDs_basePath___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  EDMessageAttachmentMetadata *v11;
  void *v12;
  EDMessageAttachmentMetadata *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v9 = a5;
  -[EDAttachmentPersistenceManager _attachmentURLForAttachmentID:nameOnDisk:basePath:](*(_QWORD *)(a1 + 32), a4, v9, *(void **)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [EDMessageAttachmentMetadata alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EDMessageAttachmentMetadata initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:](v11, "initWithGlobalMessageID:name:mimePart:attachmentID:remoteURL:", a2, v9, v21, v12, 0);

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "addObject:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

    v17 = (void *)v18;
  }

}

- (void)willDeleteAttachmentsForMessages:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id obj;
  _QWORD v23[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v20;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v7, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "baseAccount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "personaIdentifier");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (__CFString *)v10;
        else
          v12 = CFSTR("regularAccountIdentifier");
        v13 = v12;

        objc_msgSend(v3, "objectForKeyedSubscript:", v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v7);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__EDAttachmentPersistenceManager_willDeleteAttachmentsForMessages___block_invoke;
  v23[3] = &unk_1E949B260;
  v23[4] = self;
  v16 = v15;
  v24 = v16;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v23);
  if (objc_msgSend(v16, "count"))
  {
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "threadDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("attachmentsForAccountIdentifiers"));

  }
}

void __67__EDAttachmentPersistenceManager_willDeleteAttachmentsForMessages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(a3, "ef_map:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD **)(a1 + 32);
  if (v7)
    v7 = (_QWORD *)v7[1];
  v8 = v7;
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attachmentsForGlobalMessageIDs:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v11);
}

id __67__EDAttachmentPersistenceManager_willDeleteAttachmentsForMessages___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accountIdentifiersByAttachmentIDs:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __69__EDAttachmentPersistenceManager__accountIdentifiersByAttachmentIDs___block_invoke;
    v8[3] = &unk_1E949B288;
    v5 = v4;
    v9 = v5;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v8);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __69__EDAttachmentPersistenceManager__accountIdentifiersByAttachmentIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v10);

        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v5);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)isDeletingMessages:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(id *, void *, void *);
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("attachmentsForAccountIdentifiers"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    -[EDAttachmentPersistenceManager _accountIdentifiersByAttachmentIDs:]((uint64_t)self, v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke;
    v25[3] = &unk_1E949B2B0;
    v25[4] = self;
    v9 = v7;
    v26 = v9;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v25);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = v8;
    v19 = 3221225472;
    v20 = __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_2;
    v21 = &unk_1E949B300;
    v12 = v9;
    v22 = v12;
    v13 = v10;
    v23 = v13;
    v14 = v11;
    v24 = v14;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v18);
    if (objc_msgSend(v13, "count"))
      -[EDAttachmentPersistenceManager removeDatabaseAttachments:]((uint64_t)self, v13);
    if (objc_msgSend(v14, "count", v17, v18, v19, v20, v21))
      -[EDAttachmentPersistenceManager removeFilesystemAttachmentsByAccountIdentifier:]((_BOOL8)self, v14);
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "threadDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, CFSTR("attachmentsForAccountIdentifiers"));

  }
}

void __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[1];
  v5 = v4;
  objc_msgSend(v5, "globalMessageIDsForAttachment:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    EDAttachmentsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543618;
      v20 = v6;
      v21 = 2114;
      v22 = v3;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Duplicate globalMessageIDs found %{public}@ for attachment %{public}@", (uint8_t *)&v19, 0x16u);
    }

    v8 = *(_QWORD **)(a1 + 32);
    if (v8)
      v8 = (_QWORD *)v8[2];
    v9 = v8;
    objc_msgSend(v9, "persistedMessageIDsForGlobalMessageIDs:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD **)(a1 + 32);
    if (v11)
      v11 = (_QWORD *)v11[2];
    v12 = v11;
    objc_msgSend(v12, "persistedMessagesForDatabaseIDs:requireProtectedData:temporarilyUnavailableDatabaseIDs:", v10, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    EDAttachmentsLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138543618;
      v20 = v13;
      v21 = 2114;
      v22 = v3;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Found persisted messages %{public}@ for attachment %{public}@", (uint8_t *)&v19, 0x16u);
    }

    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v13, "ef_map:", &__block_literal_global_75);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v3);
  }

}

__CFString *__53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_74(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(a2, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personaIdentifier");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("regularAccountIdentifier");
  v6 = v4;

  return v6;
}

void __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v17 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_3;
    v22[3] = &unk_1E949B2D8;
    v23 = v6;
    objc_msgSend(v17, "ef_filter:", v22);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1[5], "addObject:", v5);
    v7 = v17;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v15, v12);

        }
        objc_msgSend(a1[6], "objectForKeyedSubscript:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v5);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v9);
  }

}

uint64_t __53__EDAttachmentPersistenceManager_isDeletingMessages___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

+ (void)removeSynapseAttachmentAttributesForMessages:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_81);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    EDAttachmentsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Remove Synapse attachment attributes for messages with persistentIDs %{public}@", buf, 0xCu);
    }

    if (objc_msgSend(v4, "count"))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DB0730]);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __79__EDAttachmentPersistenceManager_removeSynapseAttachmentAttributesForMessages___block_invoke_83;
      v7[3] = &unk_1E949B368;
      v8 = v4;
      objc_msgSend(v6, "unlinkDocumentsWithRelatedUniqueidentifiers:completion:", v8, v7);

    }
  }

}

id __79__EDAttachmentPersistenceManager_removeSynapseAttachmentAttributesForMessages___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "persistentID");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __79__EDAttachmentPersistenceManager_removeSynapseAttachmentAttributesForMessages___block_invoke_83(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  EDAttachmentsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109634;
    v9[1] = a2;
    v10 = 2114;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "unlinkDocumentsWithRelatedUniqueidentifiers succeeded: %{BOOL}d for persistentIDs %{public}@ error:%@", (uint8_t *)v9, 0x1Cu);

  }
}

- (id)addSynapseAttributesToAttachmentWithURL:(id)a3 contentType:(id)a4 usingGenerator:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  void (**v36)(_QWORD);
  id v37;
  _BYTE location[12];
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!v8)
  {
    EDAttachmentsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      v18 = "Not adding Synapse attributes. No file URL.";
LABEL_11:
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, v18, location, 2u);
    }
LABEL_14:

    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (!v9)
  {
    EDAttachmentsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      v18 = "Not adding Synapse attributes. No content type.";
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x1E0DB0728];
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v11, "isSupportedContentType:", v12);

  if ((v11 & 1) == 0)
  {
    EDAttachmentsLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v19;
      v39 = 2114;
      v40 = v9;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Not adding Synapse attributes to '%@': unsupported type %{public}@", location, 0x16u);

    }
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(MEMORY[0x1E0DB0718], "instancesRespondToSelector:", sel_saveToFileURL_additionalAttributes_completion_))
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v14 = (void *)MEMORY[0x1E0DB0718];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke;
    v33[3] = &unk_1E949B408;
    objc_copyWeak(&v37, (id *)location);
    v34 = v8;
    v15 = v13;
    v35 = v15;
    v36 = v10;
    objc_msgSend(v14, "fetchDocumentAttributesForFileAtURL:completion:", v34, v33);
    objc_msgSend(v15, "future");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v37);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x1E0DB0718], "documentAttributesForFileAtURL:error:", v8, &v32);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v32;

    if (v21)
    {
      EDAttachmentsLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "lastPathComponent");
        objc_claimAutoreleasedReturnValue();
        -[EDAttachmentPersistenceManager addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:].cold.2();
      }

      objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10[2](v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v31 = v15;
        v25 = objc_msgSend(v23, "saveToFile:error:", v8, &v31);
        v26 = v31;

        if ((v25 & 1) != 0)
        {
          EDAttachmentsLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v8, "lastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)location = 138412290;
            *(_QWORD *)&location[4] = v28;
            _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "Did add Synapse attributes to '%@'.", location, 0xCu);

          }
        }
        else
        {
          EDAttachmentsLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "lastPathComponent");
            objc_claimAutoreleasedReturnValue();
            -[EDAttachmentPersistenceManager addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:].cold.1();
          }
        }

        v29 = (void *)MEMORY[0x1E0D1EEC0];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "futureWithResult:", v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v26;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", MEMORY[0x1E0C9AAA0]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }

LABEL_15:
  return v16;
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke(id *a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id *v12;
  id v13;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2;
    v8[3] = &unk_1E949B3E0;
    v9 = v3;
    v10 = a1[4];
    v11 = a1[5];
    v7 = a1[6];
    v12 = v5;
    v13 = v7;
    objc_msgSend(v6, "performBlock:", v8);

  }
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    EDAttachmentsLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
      objc_claimAutoreleasedReturnValue();
      -[EDAttachmentPersistenceManager addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:].cold.2();
    }

    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      location[0] = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(location, *(id *)(a1 + 56));
      v4 = *(_QWORD *)(a1 + 40);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_93;
      v5[3] = &unk_1E949B3B8;
      objc_copyWeak(&v8, location);
      v6 = *(id *)(a1 + 40);
      v7 = *(id *)(a1 + 48);
      objc_msgSend(v3, "saveToFile:completion:", v4, v5);

      objc_destroyWeak(&v8);
      objc_destroyWeak(location);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", MEMORY[0x1E0C9AAA0]);
    }

  }
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_93(id *a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_94;
    v7[3] = &unk_1E949B390;
    v8 = v3;
    v9 = a1[4];
    v10 = a1[5];
    objc_msgSend(v6, "performBlock:", v7);

  }
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_94(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  EDAttachmentsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
      objc_claimAutoreleasedReturnValue();
      __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_94_cold_1();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Did add Synapse attributes to '%@'.", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 == 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishWithResult:", v7);

}

- (void)persistenceWillDeleteMessages:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EDAttachmentsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Hook called persistenceWillDeleteMessages to prepare attachment deletion for messages %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[EDAttachmentPersistenceManager willDeleteAttachmentsForMessages:](self, "willDeleteAttachmentsForMessages:", v4);
}

- (void)persistenceIsDeletingMessages:(id)a3 generationWindow:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  EDAttachmentsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Hook called persistenceIsDeletingMessages to delete attachments for messages %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[EDAttachmentPersistenceManager isDeletingMessages:](self, "isDeletingMessages:", v5);
}

- (void)persistenceDidDeleteMessages:(id)a3 generationWindow:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EDAttachmentsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Hook called persistenceDidDeleteMessages %{public}@", (uint8_t *)&v6, 0xCu);
  }

  +[EDAttachmentPersistenceManager removeSynapseAttachmentAttributesForMessages:](EDAttachmentPersistenceManager, "removeSynapseAttachmentAttributesForMessages:", v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synapseAttributesScheduler, 0);
  objc_storeStrong((id *)&self->_tempDirectoryForArchiveAttachments, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_attachmentPersistence, 0);
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(_QWORD *)(v3 + 14) = v4;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Error persisting attachment %@ to disk attachmentID %lld", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(uint64_t)a3 orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Error persisting attachment %@ to disk with existing metadata %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(uint64_t)a3 orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Couldn't get file attributes for attachment URL %@", (uint8_t *)&v3);
}

- (void)_persistAndUpdateAttachmentPersistenceTableFromFileWrapper:(uint64_t)a3 orURL:attachmentMetadata:basePath:shouldUpdateAttachmentID:.cold.4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Couldn't read data for attachment URL %@, device may be locked", (uint8_t *)&v3);
}

- (void)_writeAttachment:(uint64_t)a1 toDirectory:(void *)a2 outError:(uint64_t)a3 .cold.1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "No filename set on the file wrapper attachment %{public}@ for write to %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeAttachment:toDirectory:outError:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Attachment already exists at %{public}@. Overwriting with current attachment %@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeAttachment:toDirectory:outError:.cold.3()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Error figuring out if %{public}@ already exists, %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_writeAttachment:toDirectory:outError:.cold.4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to create attachment directory at %{public}@, %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)_persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  _os_log_fault_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_FAULT, "attachmentMetadata %{public}@ is missing either a mimePartNumber or a remoteURL. Aborting attachment write", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)_persistAttachmentWithWrapper:orURL:attachmentMetadata:basePath:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to write archive attachment %@ to %@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createAttachmentFileWriterForAttachmentMetadata:basePath:downloadDate:queue:compressionQueue:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Unable to create temporary file for global ID %llu MIME part [%{public}@].", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __139__EDAttachmentPersistenceManager__createAttachmentFileWriterForAttachmentMetadata_basePath_downloadDate_queue_compressionQueue_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint8_t *v4;
  os_log_t v5;

  v2 = OUTLINED_FUNCTION_12(a1, a2, 3.8521e-34);
  *(_WORD *)(v2 + 12) = 1024;
  *(_DWORD *)(v2 + 14) = v3;
  _os_log_error_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_ERROR, "File writer failed for global ID %llu (%{errno}d). Removing temp files.", v4, 0x12u);
}

- (void)_didCompleteWritingAttachmentToFile:basePath:digest:metadata:downloadDate:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to move attachment to final location (global ID %llu): %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_12(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v2, (uint64_t)v2, "No SHA-256 digest (global ID %llu).", v3);
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_12(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v2, (uint64_t)v2, "Failed to insert attachment data (global ID %llu).", v3);
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:metadata:basePath:digest:downloadDate:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_6(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to get size of attachment file (global ID %llu): %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_updateOrInsertAttachmentIDAndCreateFinalFileURLForFile:(uint64_t)a1 metadata:(uint64_t)a2 basePath:digest:downloadDate:.cold.4(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_12(a1, a2, 3.852e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v2, (uint64_t)v2, "Bad SHA-256 digest length (global ID %llu).", v3);
}

- (void)_writeFileWrapper:toURL:outError:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(v2, v3, v4, 5.8382e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Error occurred attempting to compress file: %{public}@: %{public}@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

- (void)persistAttachmentMetadata:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Trying to insert an attachment entry with no global message ID", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)persistAttachmentMetadata:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Trying to insert an attachment entry with no name", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)persistAttachmentMetadata:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, a1, a3, "Trying to insert an attachment entry neither a mime part number or remoteURL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to write Synapse attributes to attachment '%@': %@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)addSynapseAttributesToAttachmentWithURL:contentType:usingGenerator:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_10(&dword_1D2F2C000, v3, v4, "Attachment '%@' already has synapse attributes.", v5);

  OUTLINED_FUNCTION_2_0();
}

void __101__EDAttachmentPersistenceManager_addSynapseAttributesToAttachmentWithURL_contentType_usingGenerator___block_invoke_2_94_cold_1()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9();
  v2 = *v1;
  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)(v3 + 4) = v4;
  *(_WORD *)(v3 + 12) = 2112;
  *(_QWORD *)(v3 + 14) = v2;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Failed to write Synapse attributes to attachment '%@': %@", v5, v6);

  OUTLINED_FUNCTION_2_0();
}

@end
