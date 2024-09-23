@implementation MTRDownload

- (MTRDownload)initWithType:(int64_t)a3 fabricIndex:(id)a4 nodeID:(id)a5 queue:(id)a6 completion:(id)a7 done:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  MTRDownload *v19;
  const char *v20;
  MTRDownload *v21;
  NSString *v22;
  const char *v23;
  void *v24;
  id v25;
  NSURL *v26;
  void *v27;
  id v28;
  NSString *fileDesignator;
  NSString *v30;
  NSURL *fileURL;
  NSURL *v32;
  NSURL *v33;
  NSFileHandle *fileHandle;
  uint64_t v35;
  id finalize;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  NSURL *v42;
  id v43;
  id v44;
  id v45;
  id location;
  objc_super v47;

  v39 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v47.receiver = self;
  v47.super_class = (Class)MTRDownload;
  v19 = -[MTRDownload init](&v47, sel_init);
  v21 = v19;
  if (v19)
  {
    v38 = v15;
    objc_msgSend__toFileDesignatorString_nodeID_(v19, v20, a3, v15);
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__toFileURL_nodeID_(v21, v23, a3, v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v21);
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = sub_233CBD150;
    v40[3] = &unk_2504F0190;
    v41 = v16;
    objc_copyWeak(&v45, &location);
    v43 = v17;
    v25 = v16;
    v26 = v24;
    v42 = v26;
    v44 = v18;
    v27 = (void *)MEMORY[0x23493EEA8](v40);
    v28 = v17;
    fileDesignator = v21->_fileDesignator;
    v21->_fileDesignator = v22;
    v30 = v22;

    objc_storeStrong((id *)&v21->_fabricIndex, a4);
    objc_storeStrong((id *)&v21->_nodeID, a5);
    fileURL = v21->_fileURL;
    v21->_fileURL = v26;
    v32 = v26;
    v16 = v25;
    v33 = v32;

    v17 = v28;
    fileHandle = v21->_fileHandle;
    v21->_fileHandle = 0;

    v35 = MEMORY[0x23493EEA8](v27);
    finalize = v21->_finalize;
    v21->_finalize = (id)v35;

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
    v15 = v38;
  }

  return v21;
}

- (void)checkInteractionModelResponse:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  const char *v12;
  id v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  int v25;
  __int128 v26;
  int v27;

  v6 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend_status(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqual_(v10, v11, (uint64_t)&unk_250591AA0))
    {
      LODWORD(v26) = 219;
      *((_QWORD *)&v26 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDiagnosticLogsDownloader.mm";
      v27 = 190;
      sub_2340017F0((uint64_t)MTRError, &v26);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failure_(self, v14, (uint64_t)v13);
    }
    else if (objc_msgSend_isEqual_(v10, v12, (uint64_t)&unk_250591AB8))
    {
      LODWORD(v24) = 165;
      *((_QWORD *)&v24 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/C"
                              "HIP/MTRDiagnosticLogsDownloader.mm";
      v25 = 191;
      sub_2340017F0((uint64_t)MTRError, &v24);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_failure_(self, v16, (uint64_t)v13);
    }
    else
    {
      if ((objc_msgSend_isEqual_(v10, v15, (uint64_t)&unk_250591AD0) & 1) == 0
        && !objc_msgSend_isEqual_(v10, v17, (uint64_t)&unk_250591AE8))
      {
        goto LABEL_13;
      }
      objc_msgSend_logContent(v6, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend_writeToFile_error_(self, v20, (uint64_t)v19, &v23);
      v13 = v23;

      if (v13)
        objc_msgSend_failure_(self, v21, (uint64_t)v13);
      else
        objc_msgSend_success(self, v21, v22);
    }

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend_failure_(self, v7, (uint64_t)v9);
LABEL_14:

}

- (void)createFile:(id *)a3
{
  NSFileHandle **p_fileHandle;
  void *v6;
  const char *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char FileAtPath_contents_attributes;
  const char *v14;
  void *v15;
  __int128 v16;
  int v17;

  p_fileHandle = &self->_fileHandle;
  if (!self->_fileHandle)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, (uint64_t)a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(v6, v7, 99, 1, self->_fileURL, 1, a3);
    if (!*a3)
    {
      objc_msgSend_path(self->_fileURL, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      FileAtPath_contents_attributes = objc_msgSend_createFileAtPath_contents_attributes_(v6, v12, (uint64_t)v11, 0, 0);

      if ((FileAtPath_contents_attributes & 1) != 0)
      {
        objc_msgSend_fileHandleForWritingToURL_error_(MEMORY[0x24BDD1578], v14, (uint64_t)self->_fileURL, a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*a3)
          objc_storeStrong((id *)p_fileHandle, v15);

      }
      else
      {
        LODWORD(v16) = 172;
        *((_QWORD *)&v16 + 1) = "/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework"
                                "/CHIP/MTRDiagnosticLogsDownloader.mm";
        v17 = 220;
        sub_2340017F0((uint64_t)MTRError, &v16);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
}

- (void)deleteFile
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  NSURL *fileURL;
  id v12;
  uint8_t buf[4];
  NSURL *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->_fileHandle)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_path(self->_fileURL, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend_removeItemAtPath_error_(v4, v8, (uint64_t)v7, &v12);
    v9 = v12;

    if (v9)
    {
      sub_234117B80(0, "NotSpecified");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        fileURL = self->_fileURL;
        *(_DWORD *)buf = 138412546;
        v14 = fileURL;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_ERROR, "Error trying to delete the log file: %@. Error: %@", buf, 0x16u);
      }

      if (sub_234114844(1u))
        sub_2341147D0(0, 1);
    }

  }
}

- (void)writeToFile:(id)a3 error:(id *)a4
{
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  id v10;

  v10 = a3;
  objc_msgSend_createFile_(self, v6, (uint64_t)a4);
  objc_msgSend_seekToEndOfFile(self->_fileHandle, v7, v8);
  objc_msgSend_writeData_error_(self->_fileHandle, v9, (uint64_t)v10, a4);

}

- (BOOL)matches:(id)a3 fabricIndex:(id)a4 nodeID:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  const char *v13;
  char isEqualToNumber;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend_isEqualToString_(self->_fileDesignator, v11, (uint64_t)v8)
    && objc_msgSend_isEqualToNumber_(self->_fabricIndex, v12, (uint64_t)v9))
  {
    isEqualToNumber = objc_msgSend_isEqualToNumber_(self->_nodeID, v13, (uint64_t)v10);
  }
  else
  {
    isEqualToNumber = 0;
  }

  return isEqualToNumber;
}

- (void)failure:(id)a3
{
  (*((void (**)(void))self->_finalize + 2))();
}

- (void)success
{
  (*((void (**)(void))self->_finalize + 2))();
}

- (id)_toFileURL:(int64_t)a3 nodeID:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_setDateFormat_(v7, v8, (uint64_t)CFSTR("yyyy-MM-dd_HH:mm:ss.SSSZZZ"));
  objc_msgSend_now(MEMORY[0x24BDBCE60], v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v7, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__toNodeIDString_(self, v14, (uint64_t)v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__toTypeString_(self, v16, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v18, (uint64_t)CFSTR("%@_%@_%@"), v13, v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v21, v22, (uint64_t)v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_isDirectory_(v20, v24, (uint64_t)v23, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_toFileDesignatorString:(int64_t)a3 nodeID:(id)a4
{
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  unint64_t v13;
  const char *v14;
  void *v15;

  objc_msgSend__toNodeIDString_(self, a2, (uint64_t)a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__toTypeString_(self, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("bdx://%@/%@"), v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_length(v10, v11, v12);
  if (v13 >= 0x20)
    objc_msgSend_substringToIndex_(v10, v14, 32);
  else
    objc_msgSend_substringToIndex_(v10, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_toNodeIDString:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  v7 = objc_msgSend_unsignedLongLongValue(v3, v5, v6);
  objc_msgSend_stringWithFormat_(v4, v8, (uint64_t)CFSTR("%016llX"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_toTypeString:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
    sub_233CB7AC0();
  return off_2504F02D0[a3];
}

- (NSString)fileDesignator
{
  return self->_fileDesignator;
}

- (void)setFileDesignator:(id)a3
{
  objc_storeStrong((id *)&self->_fileDesignator, a3);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(id)a3
{
  objc_storeStrong((id *)&self->_fabricIndex, a3);
}

- (NSNumber)nodeID
{
  return self->_nodeID;
}

- (void)setNodeID:(id)a3
{
  objc_storeStrong((id *)&self->_nodeID, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSFileHandle)fileHandle
{
  return self->_fileHandle;
}

- (void)setFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_fileHandle, a3);
}

- (id)abortHandler
{
  return self->_abortHandler;
}

- (void)setAbortHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)finalize
{
  return self->_finalize;
}

- (void)setFinalize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finalize, 0);
  objc_storeStrong(&self->_abortHandler, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_fileDesignator, 0);
}

@end
