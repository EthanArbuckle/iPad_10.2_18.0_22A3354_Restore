@implementation NWURLSessionResponseConsumerDownload

- (void)task:(id)a3 deliverResponse:(id)a4 completionHandler:(id)a5
{
  id *v8;
  id v9;
  const char *v10;
  void (**v11)(id, _QWORD, void *);
  uint64_t v12;
  NSURL *v13;
  _BOOL4 isResuming;
  id *v15;
  void *v16;
  void *v17;
  NSURL *fileURL;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  dispatch_fd_t v23;
  NSURL *v24;
  NSURL *v25;
  NSURL *v26;
  NSURL *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  OS_dispatch_io *v33;
  OS_dispatch_io *io;
  NSObject *v35;
  int64_t countOfBytesReceivedInternal;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSURL *v41;
  int v42;
  int v43;
  uint64_t v44;
  void *v45;
  _QWORD cleanup_handler[5];
  id *v47;
  dispatch_fd_t v48;
  char v49[1024];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = (id *)a3;
  v9 = a4;
  v11 = (void (**)(id, _QWORD, void *))a5;
  if (!self)
  {
    v44 = countOfBytesExpectedToReceive(v9);
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v44);
    if (v8)
      goto LABEL_7;
LABEL_44:
    v16 = 0;
    v17 = 0;
    goto LABEL_31;
  }
  objc_setProperty_atomic(self, v10, v9, 24);
  v12 = countOfBytesExpectedToReceive(v9);
  if (self->_isResuming)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "statusCode") == 206)
    {
      if (v12 != *MEMORY[0x1E0C92BE0])
        v12 += self->_countOfBytesReceivedInternal;
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
      countOfBytesReceivedInternal = self->_countOfBytesReceivedInternal;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeItemAtURL:error:", self->_fileURL, 0);

      -[NWURLSessionResponseConsumerDownload checkCountOfBytesReceived]((uint64_t)self);
      -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
      countOfBytesReceivedInternal = 0;
    }
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v8, countOfBytesReceivedInternal);
    -[NWURLSessionTask delegateWrapper](v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionDelegateWrapper downloadTask:didResumeAtOffset:expectedTotalBytes:]((uint64_t)v37, v8, objc_msgSend(v8, "countOfBytesReceived"), objc_msgSend(v8, "countOfBytesExpectedToReceive"));

  }
  else
  {
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v8, v12);
  }
  v13 = self->_fileURL;
  if (v13)
  {
    isResuming = self->_isResuming;

    if (!isResuming)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeItemAtURL:error:", self->_fileURL, 0);

      fileURL = self->_fileURL;
      if (!fileURL)
        goto LABEL_11;
      goto LABEL_37;
    }
  }
  if (!v8)
    goto LABEL_44;
LABEL_7:
  v15 = (id *)v8[50];
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15[3], "_pathToDownloadTaskFile");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {

      if (!self)
      {
LABEL_11:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "temporaryDirectory");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", CFSTR("URLSessionDownload_XXXXXX.tmp"), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v21, "getFileSystemRepresentation:maxLength:", v49, 1024))
        {
          v38 = 63;
LABEL_35:
          -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:]((uint64_t)self, -3000, v38, v8);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v11[2](v11, 0, v39);

          goto LABEL_23;
        }
        v22 = mkstemps(v49, 4);
        if (v22 != -1)
        {
          v23 = v22;
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v49, 0, 0);
          v24 = (NSURL *)objc_claimAutoreleasedReturnValue();
          if (self)
          {
            v25 = self->_fileURL;
            self->_fileURL = v24;

            v26 = self->_fileURL;
          }
          else
          {

            v26 = 0;
          }
          v27 = v26;
          -[NSURL lastPathComponent](v27, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (self)
            objc_storeStrong((id *)&self->_tempFileName, v28);

          if (v8)
            goto LABEL_18;
LABEL_42:
          v30 = 0;
          v31 = 0;
          goto LABEL_20;
        }
LABEL_34:
        v38 = **(int **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        goto LABEL_35;
      }
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NWURLSessionResponseConsumerDownload setFileURL:]((uint64_t)self, v16);
  }
  else
  {
    v17 = 0;
  }
LABEL_31:

  if (!self)
    goto LABEL_11;
LABEL_10:
  fileURL = self->_fileURL;
  if (!fileURL)
    goto LABEL_11;
LABEL_37:
  v41 = fileURL;
  v21 = v41;
  if (self->_isResuming)
    v42 = 521;
  else
    v42 = 2561;
  v43 = open(-[NSURL fileSystemRepresentation](v41, "fileSystemRepresentation"), v42, 438);
  if (v43 == -1)
    goto LABEL_34;
  v23 = v43;

  if (!v8)
    goto LABEL_42;
LABEL_18:
  v29 = v8[49];
  v30 = v29;
  if (v29)
    v31 = (void *)*((_QWORD *)v29 + 15);
  else
    v31 = 0;
LABEL_20:
  v32 = v31;
  cleanup_handler[0] = MEMORY[0x1E0C809B0];
  cleanup_handler[1] = 3221225472;
  cleanup_handler[2] = __79__NWURLSessionResponseConsumerDownload_task_deliverResponse_completionHandler___block_invoke;
  cleanup_handler[3] = &unk_1E14A47A8;
  cleanup_handler[4] = self;
  v48 = v23;
  v47 = v8;
  v33 = (OS_dispatch_io *)dispatch_io_create(0, v23, v32, cleanup_handler);
  if (self)
  {
    io = self->_io;
    self->_io = v33;

    v35 = self->_io;
  }
  else
  {

    v35 = 0;
  }
  dispatch_io_set_low_water(v35, 0xFFFFFFFFFFFFFFFFLL);
  v11[2](v11, 1, 0);

LABEL_23:
}

- (void)task:(id)a3 deliverData:(id)a4 complete:(BOOL)a5 error:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  size_t size;
  int64_t v17;
  BOOL v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  OS_dispatch_io *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  NWURLError *error;
  _QWORD v31[5];
  id *v32;
  id v33;
  _QWORD aBlock[4];
  id *v35;
  NWURLSessionResponseConsumerDownload *v36;
  id v37;
  size_t v38;
  BOOL v39;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!v13)
  {
    size = 0;
    if (self)
      goto LABEL_3;
LABEL_16:
    -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, 0);
    v18 = v14 == 0;
    if (!v14)
    {
      v14 = 0;
      if (v9)
      {
        -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v12, 0);
        goto LABEL_20;
      }
    }
    goto LABEL_5;
  }
  size = dispatch_data_get_size(v13);
  if (!self)
    goto LABEL_16;
LABEL_3:
  v17 = self->_countOfBytesReceivedInternal + size;
  self->_countOfBytesReceivedInternal = v17;
  -[NWURLSessionTask setCountOfBytesReceived:]((uint64_t)v12, v17);
  v18 = v14 == 0;
  if (!v14 && v9)
  {
    -[NWURLSessionTask setCountOfBytesExpectedToReceive:](v12, self->_countOfBytesReceivedInternal);
    if (self->_io)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_5:
  if (v18)
  {
    if (!self)
      goto LABEL_20;
  }
  else
  {
    -[NWURLSessionResponseConsumerDownload setError:]((uint64_t)self, v14);
    if (!self)
      goto LABEL_20;
  }
  if (self->_io)
  {
LABEL_8:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke;
    aBlock[3] = &unk_1E14A47D0;
    v19 = (id *)v12;
    v38 = size;
    v35 = v19;
    v36 = self;
    v39 = v9;
    v37 = v15;
    v20 = _Block_copy(aBlock);
    v21 = v20;
    if (v13)
    {
      v22 = v14;
      v23 = self->_io;
      v24 = v12;
      if (v19)
      {
        v25 = v19[49];
        v26 = v25;
        v27 = v15;
        if (v25)
          v28 = (void *)*((_QWORD *)v25 + 15);
        else
          v28 = 0;
      }
      else
      {
        v27 = v15;
        v26 = 0;
        v28 = 0;
      }
      v29 = v28;
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_3;
      v31[3] = &unk_1E14A47F8;
      v31[4] = self;
      v32 = v19;
      v33 = v21;
      dispatch_io_write((dispatch_io_t)v23, 0, v13, v29, v31);

      v15 = v27;
      v12 = v24;
      v14 = v22;
    }
    else
    {
      (*((void (**)(void *))v20 + 2))(v20);
    }

    goto LABEL_14;
  }
LABEL_20:
  if (v9)
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:]((uint64_t)self, v12);
  if (self)
    error = self->_error;
  else
    error = 0;
  (*((void (**)(id, NWURLError *))v15 + 2))(v15, error);
LABEL_14:

}

- (NSURLResponse)response
{
  if (self)
    self = (NWURLSessionResponseConsumerDownload *)objc_getProperty(self, a2, 24, 1);
  return (NSURLResponse *)self;
}

- (int64_t)countOfBytesReceived
{
  if (self)
    return *(_QWORD *)(self + 72);
  return self;
}

- (id)createResumeInfo
{
  NWURLSessionResponseConsumerResumeInfo *v3;
  NWURLSessionResponseConsumerResumeInfo *v4;
  void *tempFileName;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v3 = objc_alloc_init(NWURLSessionResponseConsumerResumeInfo);
  v4 = v3;
  if (!self)
  {
    tempFileName = 0;
    if (!v3)
      return v4;
    goto LABEL_6;
  }
  tempFileName = self->_tempFileName;
  if (!tempFileName)
  {
    tempFileName = self->_fileURL;
    if (!v3)
      return v4;
LABEL_6:
    v6 = 8;
    goto LABEL_7;
  }
  if (v3)
  {
    v6 = 16;
LABEL_7:
    v7 = tempFileName;
    v8 = *(Class *)((char *)&v4->super.isa + v6);
    *(Class *)((char *)&v4->super.isa + v6) = v7;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_pendingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_io, 0);
  objc_storeStrong((id *)&self->_tempFileName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_currentResponse, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

- (void)setError:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (void)deliverCompletionForTask:(uint64_t)a1
{
  id *v3;
  id *v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  id *v9;
  id *v10;
  BOOL v11;
  void *v12;
  id v13;
  SEL v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  const char *v21;
  id *v22;
  int v23;
  id Property;
  id v25;
  void *v26;
  BOOL v27;
  int v28;
  uint64_t v29;
  const char *v30;
  id *v31;
  id v32;
  SEL v33;
  id v34;
  id v35;
  id v36;
  id v37;
  const char *v38;
  _QWORD *v39;
  const char *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id *v53;
  _QWORD v54[2];
  void (*v55)(uint64_t);
  void *v56;
  id v57;
  BOOL v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  BOOL v64;
  BOOL v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD *v76;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    -[NWURLSessionTask finishProgressReporting]((uint64_t)v3);
    v5 = *(id *)(a1 + 32);
    v6 = *(id *)(a1 + 64);
    objc_msgSend(v6, "downloadTaskResumeData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

    if (v4)
    {
      v9 = (id *)v4[50];
      v10 = v9;
      if (v9 && (objc_msgSend(v9[3], "_keepDownloadTaskFile") & 1) != 0)
      {
        v11 = 1;

        if (!v5)
          goto LABEL_10;
        goto LABEL_9;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD *)(a1 + 40) == 0;

    if (!v5)
      goto LABEL_10;
LABEL_9:
    if (v6)
    {
      if (!v7 && !*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "removeItemAtURL:error:", v5, 0);

      }
      v5 = 0;
      v12 = *(void **)(a1 + 16);
      if (v12)
        goto LABEL_11;
      goto LABEL_24;
    }
LABEL_10:
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
LABEL_11:
      v13 = v12;
      v15 = objc_getProperty((id)a1, v14, 24, 1);
      if (v4)
      {
        v16 = 30;
        if (!v4[30])
          v16 = 29;
        v17 = v4[v16];
      }
      else
      {
        v17 = 0;
      }
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke;
      v59[3] = &unk_1E14A4820;
      v63 = v13;
      v60 = v5;
      v61 = v15;
      v62 = v6;
      v64 = v11;
      v65 = v8;
      v18 = v15;
      v19 = v13;
      if (v4)
      {
        v20 = (id *)v4[50];
        v22 = v20;
        if (v20)
          v23 = objc_msgSend(v20[3], "_callCompletionHandlerInline");
        else
          v23 = 0;
        Property = objc_getProperty(v4, v21, 432, 1);
      }
      else
      {
        v23 = 0;
        v22 = 0;
        Property = 0;
      }
      v25 = Property;
      -[NWURLSessionDelegateWrapper runCompletionHandler:noAsync:task:metrics:cachedResponse:cache:]((uint64_t)v17, v59, v23, v4, v25, 0, 0);

      goto LABEL_46;
    }
LABEL_24:
    if (v6)
      v27 = 1;
    else
      v27 = v5 == 0;
    v28 = !v27;
    if (v4)
    {
      v29 = 30;
      if (!v4[30])
        v29 = 29;
      v31 = (id *)v4[v29];
      if ((v28 & 1) != 0)
      {
        v32 = *(id *)(a1 + 32);
        v34 = objc_getProperty(v4, v33, 432, 1);
LABEL_35:
        v35 = v34;
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v55 = __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke_2;
        v56 = &unk_1E14A9B98;
        v58 = v11;
        v57 = v5;
        v53 = v4;
        v36 = v32;
        v37 = v35;
        v39 = v54;
        if (v31)
        {
          v52 = v5;
          -[NWURLSessionDelegateWrapper delegateFor_didFinishDownloadingToURL](v31, v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            -[NWURLSessionDelegateWrapper delegateFor_didFinishCollectingMetrics](v31, v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = 0;
          }
          -[NWURLSessionDelegateWrapper delegateFor_didCompleteWithError](v31, v40);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = (void *)v43;
          if (v41 || v42 || v43)
          {
            v48 = v31[4];
            v50 = v31[5];
            v66[0] = MEMORY[0x1E0C809B0];
            v66[1] = 3221225472;
            v66[2] = __102__NWURLSessionDelegateWrapper_downloadTask_didFinishDownloadingToURL_error_metrics_completionHandler___block_invoke;
            v66[3] = &unk_1E14AACD0;
            v67 = v41;
            v68 = v48;
            v69 = v53;
            v70 = v36;
            v71 = v42;
            v72 = v37;
            v73 = v44;
            v74 = 0;
            v75 = v50;
            v76 = v39;
            v45 = v31[6];
            v51 = v50;
            v49 = v48;
            -[NWURLSessionDelegateQueue runDelegateBlock:](v45, v66);

          }
          else
          {
            v55((uint64_t)v39);
          }

          v5 = v52;
        }

        goto LABEL_46;
      }
      v46 = objc_getProperty(v4, v30, 432, 1);
    }
    else
    {
      if (v28)
      {
        v32 = *(id *)(a1 + 32);
        v31 = 0;
        v34 = 0;
        goto LABEL_35;
      }
      v31 = 0;
      v46 = 0;
    }
    v47 = v46;
    -[NWURLSessionDelegateWrapper task:didCompleteWithError:metrics:]((uint64_t)v31, v4, v6, v47);

LABEL_46:
  }

}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  const char *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id v21;
  int8x16_t v22;
  _QWORD v23[2];
  void (*v24)(uint64_t, const char *);
  void *v25;
  int8x16_t v26;
  id v27;
  char v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = 240;
    if (!*(_QWORD *)(v2 + 240))
      v3 = 232;
    v4 = (id *)*(id *)(v2 + v3);
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      goto LABEL_5;
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
    {
LABEL_5:
      v7 = *(_QWORD *)(v6 + 72);
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  v8 = *(_QWORD *)(a1 + 56);
  v9 = objc_msgSend(v5, "countOfBytesExpectedToReceive");
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_2;
  v25 = &unk_1E14A9268;
  v28 = *(_BYTE *)(a1 + 64);
  v22 = *(int8x16_t *)(a1 + 32);
  v11 = (id)v22.i64[0];
  v26 = vextq_s8(v22, v22, 8uLL);
  v27 = *(id *)(a1 + 48);
  v12 = v5;
  v14 = v23;
  if (v4)
  {
    -[NWURLSessionDelegateWrapper delegateFor_didWriteData](v4, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = v4[4];
      v17 = v4[5];
      v29[0] = v10;
      v29[1] = 3221225472;
      v29[2] = __119__NWURLSessionDelegateWrapper_downloadTask_didWriteData_totalBytesWritten_totalBytesExpectedToWrite_completionHandler___block_invoke;
      v29[3] = &unk_1E14AAC30;
      v30 = v15;
      v31 = v16;
      v18 = v12;
      v35 = v8;
      v36 = v7;
      v37 = v9;
      v32 = v18;
      v33 = v17;
      v34 = v14;
      v19 = v4[6];
      v20 = v17;
      v21 = v16;
      -[NWURLSessionDelegateQueue runDelegateBlock:](v19, v29);

    }
    else
    {
      ((void (*)(_QWORD *))v24)(v14);
    }

  }
}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_3(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  if (a2)
  {
    if (a4)
    {
      v7 = *(_QWORD *)(a1 + 32);
      if (!v7 || !*(_QWORD *)(v7 + 64))
      {
        -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:](v7, -3003, a4, *(void **)(a1 + 40));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 32);
        if (v9)
          objc_storeStrong((id *)(v9 + 64), v8);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (id)errorForErrorCode:(uint64_t)a3 withPOSIXCode:(void *)a4 andTask:
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NWURLError *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v16;

  if (!a1)
    return 0;
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v7 = *MEMORY[0x1E0CB2FE0];
  v8 = a4;
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [NWURLError alloc];
  v11 = v8;
  if (v10)
  {
    v12 = *MEMORY[0x1E0CB32E8];
    v16.receiver = v10;
    v16.super_class = (Class)NWURLError;
    v13 = objc_msgSendSuper2(&v16, sel_initWithDomain_code_userInfo_, v12, a2, 0);
    v14 = v13;
    if (v13)
      objc_msgSend(v13, "fillErrorForLoader:andTask:", 0, v11);
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v14, "setUnderlyingError:", v9);
  return v14;
}

void __90__NWURLSessionResponseConsumerDownload_task_deliverData_complete_error_completionHandler___block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;

  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_2:
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(_QWORD *)(v3 + 64);
    else
      v4 = 0;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4);
    return;
  }
  v5 = *(_QWORD **)(a1 + 32);
  if (!v5 || !v5[6])
  {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:]((uint64_t)v5, *(void **)(a1 + 40));
    goto LABEL_2;
  }
  objc_setProperty_nonatomic_copy(v5, a2, *(id *)(a1 + 48), 56);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(NSObject **)(v6 + 48);
  else
    v7 = 0;
  dispatch_io_close(v7, 0);
}

void __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  if (*(_QWORD *)(a1 + 32) && !*(_BYTE *)(a1 + 64) && !*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
}

void __65__NWURLSessionResponseConsumerDownload_deliverCompletionForTask___block_invoke_2(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)checkCountOfBytesReceived
{
  uint64_t v2;
  void *v3;
  id v4;
  char v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C99998];
  objc_msgSend(*(id *)(a1 + 32), "removeCachedResourceValueForKey:", *MEMORY[0x1E0C99998]);
  v3 = *(void **)(a1 + 32);
  v10 = 0;
  v11 = 0;
  v4 = v3;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, v2, &v10);
  v6 = v11;
  v7 = v10;

  if ((v5 & 1) != 0)
  {
    v8 = objc_msgSend(v6, "longLongValue");
  }
  else
  {
    if (__nwlog_url_log::onceToken != -1)
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
    v9 = (id)gurlLogObj;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_182FBE000, v9, OS_LOG_TYPE_ERROR, "Error getting response consumer file size: %@", buf, 0xCu);
    }

    v8 = 0;
  }
  *(_QWORD *)(a1 + 72) = v8;

}

- (void)setFileURL:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

void __79__NWURLSessionResponseConsumerDownload_task_deliverResponse_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (*v9)(void);
  id v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v4 = *(_QWORD *)(v4 + 64);
  if (a2 || v4)
  {
    v16 = 65541;
    if (ffsctl(*(_DWORD *)(a1 + 48), 0xC0084A44uLL, &v16, 0))
    {
      if (__nwlog_url_log::onceToken != -1)
        dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_54_44225);
      v13 = (id)gurlLogObj;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8);
        *(_DWORD *)buf = 67109120;
        v18 = v14;
        _os_log_impl(&dword_182FBE000, v13, OS_LOG_TYPE_ERROR, "Failed to make download file purgeable: %{errno}d", buf, 8u);
      }

    }
    close(*(_DWORD *)(a1 + 48));
    if (a2)
    {
      -[NWURLSessionResponseConsumerDownload errorForErrorCode:withPOSIXCode:andTask:](*(_QWORD *)(a1 + 32), -3000, a2, *(void **)(a1 + 40));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWURLSessionResponseConsumerDownload setError:](*(_QWORD *)(a1 + 32), v15);

      -[NWURLSessionResponseConsumerDownload setIo:](*(_QWORD *)(a1 + 32));
      return;
    }
  }
  else
  {
    close(*(_DWORD *)(a1 + 48));
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && *(_QWORD *)(v5 + 56))
  {
    -[NWURLSessionResponseConsumerDownload deliverCompletionForTask:](v5, *(void **)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
    {
      v7 = *(void **)(v6 + 56);
      v8 = (uint64_t)v7 + 16;
    }
    else
    {
      v7 = 0;
      v8 = 16;
    }
    v9 = *(void (**)(void))v8;
    v10 = v7;
    v9();

    v12 = *(void **)(a1 + 32);
    if (v12)
      objc_setProperty_nonatomic_copy(v12, v11, 0, 56);
  }
}

- (void)setIo:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), 0);
}

- (id)initWithResumeInfo:(void *)a3 completionHandler:
{
  id *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  objc_super v15;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v15.receiver = a1;
    v15.super_class = (Class)NWURLSessionResponseConsumerDownload;
    a1 = (id *)objc_msgSendSuper2(&v15, sel_init);
    if (a1)
    {
      v7 = _Block_copy(v6);
      v8 = a1[2];
      a1[2] = v7;

      if (v5)
      {
        objc_storeStrong(a1 + 5, v5[2]);
        if (a1[5])
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "temporaryDirectory");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", a1[5], 0);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = a1[4];
          a1[4] = (id)v11;

        }
        else
        {
          v13 = v5[1];
          v9 = a1[4];
          a1[4] = v13;
        }

        *((_BYTE *)a1 + 8) = 1;
        -[NWURLSessionResponseConsumerDownload checkCountOfBytesReceived]((uint64_t)a1);
      }
    }
  }

  return a1;
}

@end
