@implementation IXPromisedStreamingZipTransfer

- (IXPromisedStreamingZipTransfer)initWithCoder:(id)a3
{
  id v4;
  IXPromisedStreamingZipTransfer *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  IXPromisedStreamingZipTransfer *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)IXPromisedStreamingZipTransfer;
  v5 = -[IXOwnedDataPromise initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_4;
  v6 = objc_alloc(MEMORY[0x1E0DAFE60]);
  -[IXDataPromise seed](v5, "seed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "szOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOptions:", v8);
  -[IXPromisedStreamingZipTransfer setExtractor:](v5, "setExtractor:", v9);

  -[IXPromisedStreamingZipTransfer extractor](v5, "extractor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v5->_needsConsume = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsConsume"));
LABEL_4:
    v11 = v5;
    goto LABEL_8;
  }
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    -[IXDataPromise seed](v5, "seed");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "szOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v18 = "-[IXPromisedStreamingZipTransfer initWithCoder:]";
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_1A4BF6000, v12, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);

  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IXPromisedStreamingZipTransfer;
  v4 = a3;
  -[IXDataPromise encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[IXPromisedStreamingZipTransfer needsConsume](self, "needsConsume", v5.receiver, v5.super_class), CFSTR("needsConsume"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedStreamingZipTransfer)initWithName:(id)a3 client:(unint64_t)a4 streamingZipOptions:(id)a5 archiveSize:(unint64_t)a6 diskSpaceNeeded:(unint64_t)a7
{
  id v12;
  id v13;
  IXPromisedStreamingZipTransfer *v14;
  IXPromisedStreamingZipTransfer *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  IXPromisedStreamingZipTransfer *v24;
  int v25;
  NSObject *v26;
  IXPromisedStreamingZipTransfer *v27;
  _QWORD v29[4];
  IXPromisedStreamingZipTransfer *v30;
  _BYTE *v31;
  _QWORD v32[5];
  objc_super v33;
  _BYTE buf[24];
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v33.receiver = self;
  v33.super_class = (Class)IXPromisedStreamingZipTransfer;
  v14 = -[IXOwnedDataPromise initWithName:client:diskSpaceNeeded:](&v33, sel_initWithName_client_diskSpaceNeeded_, v12, a4, a7);
  v15 = v14;
  if (!v14)
    goto LABEL_14;
  -[IXDataPromise seed](v14, "seed");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setArchiveSizeBytes:", a6);

  -[IXDataPromise seed](v15, "seed");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSzOptions:", v13);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFE60]), "initWithOptions:", v13);
  -[IXPromisedStreamingZipTransfer setExtractor:](v15, "setExtractor:", v18);

  -[IXPromisedStreamingZipTransfer extractor](v15, "extractor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = v19 == 0;

  if ((_DWORD)v18)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[IXPromisedStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1A4BF6000, v26, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);
    }

    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v35 = 0;
  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __102__IXPromisedStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke;
  v32[3] = &unk_1E4DC41B0;
  v32[4] = buf;
  objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v32);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[IXDataPromise seed](v15, "seed");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v21;
    v29[1] = 3221225472;
    v29[2] = __102__IXPromisedStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke_7;
    v29[3] = &unk_1E4DC5098;
    v31 = buf;
    v24 = v15;
    v30 = v24;
    objc_msgSend(v22, "_remote_createStreamingZipTransferDataPromiseWithSeed:completion:", v23, v29);

    v25 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24)
       || !-[IXOwnedDataPromise consumeSandboxExtensionWithError:](v24, "consumeSandboxExtensionWithError:", 0);

  }
  else
  {
    v25 = 1;
  }

  _Block_object_dispose(buf, 8);
  if (!v25)
  {
LABEL_14:
    v27 = v15;
    goto LABEL_15;
  }
LABEL_13:
  v27 = 0;
LABEL_15:

  return v27;
}

void __102__IXPromisedStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[IXPromisedStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __102__IXPromisedStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[IXPromisedStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up StreamingZip transfer promise: %@", (uint8_t *)&v7, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateInitWithSeed:notifyDaemon:", a2, 0);
  }

}

- (BOOL)useProgressFromSZExtractor
{
  void *v2;
  BOOL v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "archiveSizeBytes") == 0;

  return v3;
}

- (void)prepareForExtraction:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void (**)(id, _QWORD, void *))a3;
  -[IXPromisedStreamingZipTransfer setNeedsConsume:](self, "setNeedsConsume:", 0);
  -[IXOwnedDataPromise stagedPath](self, "stagedPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[IXPromisedStreamingZipTransfer _prepareForExtractionToPath:completionBlock:](self, "_prepareForExtractionToPath:completionBlock:", v6, v4);
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer prepareForExtraction:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer prepareForExtraction:]", 129, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.stagedPath.path was unexpectedly nil!"), v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v9, 15, 0);
    v4[2](v4, 0, v9);

  }
}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[IXPromisedStreamingZipTransfer setNeedsConsume:](self, "setNeedsConsume:", 1);
  -[IXPromisedStreamingZipTransfer _prepareForExtractionToPath:completionBlock:](self, "_prepareForExtractionToPath:completionBlock:", v7, v6);

}

- (void)_prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = (uint64_t)__78__IXPromisedStreamingZipTransfer__prepareForExtractionToPath_completionBlock___block_invoke;
    v13[3] = (uint64_t)&unk_1E4DC4250;
    v13[4] = (uint64_t)self;
    v14 = v7;
    objc_msgSend(v9, "prepareForExtractionToPath:completionBlock:", v6, v13);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer _prepareForExtractionToPath:completionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer _prepareForExtractionToPath:completionBlock:]", 147, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v11, v13[0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v12, 15, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __78__IXPromisedStreamingZipTransfer__prepareForExtractionToPath_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__IXPromisedStreamingZipTransfer__prepareForExtractionToPath_completionBlock___block_invoke_2;
    v9[3] = &unk_1E4DC42A0;
    v11 = *(id *)(a1 + 40);
    v10 = v4;
    objc_msgSend(v5, "cancelForReason:client:completion:", v10, 15, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExtractorDelegate:", v5);

    v7 = objc_msgSend(*(id *)(a1 + 32), "useProgressFromSZExtractor");
    objc_msgSend(*(id *)(a1 + 32), "extractor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveExtractorDelegateMethods:", v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __78__IXPromisedStreamingZipTransfer__prepareForExtractionToPath_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXPromisedStreamingZipTransfer _prepareForExtractionToPath:completionBlock:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)supplyBytes:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint64_t);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, void *, uint64_t);

  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  if (-[IXDataPromise localIsComplete](self, "localIsComplete"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer supplyBytes:withCompletionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer supplyBytes:withCompletionBlock:]", 182, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-supplyBytes:withCompletionBlock: called after promise was complete"), v9, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[IXDataPromise localError](self, "localError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_6:
    v7[2](v7, v10, 1);
    goto LABEL_7;
  }
  -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__IXPromisedStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke;
    v17[3] = &unk_1E4DC50C0;
    v17[4] = self;
    v19 = v7;
    v18 = v6;
    objc_msgSend(v12, "supplyBytes:withCompletionBlock:", v18, v17);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer supplyBytes:withCompletionBlock:].cold.2();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer supplyBytes:withCompletionBlock:]", 194, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v14, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
    v7[2](v7, v15, 1);

  }
LABEL_7:

}

void __66__IXPromisedStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = a1[4];
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __66__IXPromisedStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E4DC42A0;
    v7 = a1[6];
    v6 = v3;
    objc_msgSend(v4, "cancelForReason:client:completion:", v6, 15, v5);

  }
  else
  {
    if ((objc_msgSend(a1[4], "useProgressFromSZExtractor") & 1) == 0)
      objc_msgSend(a1[4], "addArchiveBytesConsumed:", objc_msgSend(a1[5], "length"));
    (*((void (**)(void))a1[6] + 2))();
  }

}

void __66__IXPromisedStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXPromisedStreamingZipTransfer supplyBytes:withCompletionBlock:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)suspendStreamWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10[5];
  id v11;

  v4 = a3;
  -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = (uint64_t)__67__IXPromisedStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke;
    v10[3] = (uint64_t)&unk_1E4DC4250;
    v10[4] = (uint64_t)self;
    v11 = v4;
    objc_msgSend(v6, "suspendStreamWithCompletionBlock:", v10);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer suspendStreamWithCompletionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer suspendStreamWithCompletionBlock:]", 222, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v8, v10[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v9, 15, 0);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

  }
}

void __67__IXPromisedStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__IXPromisedStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke_2;
    v6[3] = &unk_1E4DC42A0;
    v5 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v7 = v4;
    objc_msgSend(v5, "cancelForReason:client:completion:", v7, 15, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __67__IXPromisedStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXPromisedStreamingZipTransfer suspendStreamWithCompletionBlock:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)finishStreamWithCompletionBlock:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13[5];
  void (**v14)(id, void *);

  v4 = (void (**)(id, void *))a3;
  if (-[IXDataPromise localIsComplete](self, "localIsComplete"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer finishStreamWithCompletionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer finishStreamWithCompletionBlock:]", 245, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-finishStreamWithCompletionBlock: called after promise was complete"), v6, v13[0]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

  }
  else
  {
    -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = (uint64_t)__66__IXPromisedStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke;
      v13[3] = (uint64_t)&unk_1E4DC50E8;
      v13[4] = (uint64_t)self;
      v14 = v4;
      objc_msgSend(v9, "finishStreamWithCompletionBlock:", v13);

    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[IXPromisedStreamingZipTransfer finishStreamWithCompletionBlock:].cold.2();

      _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer finishStreamWithCompletionBlock:]", 251, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v11, v13[0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v12, 15, 0);
      v4[2](v4, v12);

    }
  }

}

void __66__IXPromisedStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__IXPromisedStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke_2;
    v18[3] = &unk_1E4DC42A0;
    v20 = *(id *)(a1 + 40);
    v19 = v3;
    objc_msgSend(v4, "cancelForReason:client:completion:", v19, 15, v18);

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "needsConsume"))
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(*(id *)(a1 + 32), "extractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extractionPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:relativeToURL:", v7, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[IXFileManager defaultManager](IXFileManager, "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stagedPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v8, v10, &v17);
    v12 = v17;

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "setComplete:", 1);

      v12 = 0;
    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "stagedPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v22 = "-[IXPromisedStreamingZipTransfer finishStreamWithCompletionBlock:]_block_invoke";
        v23 = 2112;
        v24 = v14;
        v25 = 2112;
        v26 = v16;
        v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_1A4BF6000, v13, OS_LOG_TYPE_DEFAULT, "%s: Failed to capture extracted bytes at %@ and move to %@ : %@", buf, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 32), "cancelForReason:client:completion:", v12, 15, &__block_literal_global_5);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setComplete:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 32), "releaseSandboxExtension");

}

void __66__IXPromisedStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXPromisedStreamingZipTransfer finishStreamWithCompletionBlock:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)terminateStreamWithError:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  void (**v19)(id, void *);

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (-[IXDataPromise localIsComplete](self, "localIsComplete"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer terminateStreamWithError:completionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer terminateStreamWithError:completionBlock:]", 292, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-terminateStreamWithError:completionBlock: called after promise was complete"), v9, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

  }
  else
  {
    -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __75__IXPromisedStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke;
      v17[3] = &unk_1E4DC5110;
      v17[4] = self;
      v18 = v6;
      v19 = v7;
      objc_msgSend(v12, "terminateStreamWithError:completionBlock:", v18, v17);

    }
    else
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[IXPromisedStreamingZipTransfer terminateStreamWithError:completionBlock:].cold.2();

      _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer terminateStreamWithError:completionBlock:]", 298, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v14, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
      v7[2](v7, v15);

    }
  }

}

void __75__IXPromisedStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[IXPromisedStreamingZipTransfer terminateStreamWithError:completionBlock:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Terminating stream failed with error: %@", buf, 0x16u);
    }

  }
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__IXPromisedStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke_24;
  v7[3] = &unk_1E4DC40C0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "cancelForReason:client:completion:", v6, 15, v7);
  objc_msgSend(*(id *)(a1 + 32), "releaseSandboxExtension");

}

void __75__IXPromisedStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = "-[IXPromisedStreamingZipTransfer terminateStreamWithError:completionBlock:]_block_invoke";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)resetWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v16;

  v4 = (void (**)(id, void *))a3;
  -[IXDataPromise seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArchiveBytesConsumed:", 0);

  v6 = objc_alloc(MEMORY[0x1E0DAFE60]);
  -[IXDataPromise seed](self, "seed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "szOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithOptions:", v8);
  -[IXPromisedStreamingZipTransfer setExtractor:](self, "setExtractor:", v9);

  -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)IXPromisedStreamingZipTransfer;
    -[IXDataPromise resetWithCompletion:](&v16, sel_resetWithCompletion_, v4);
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[IXPromisedStreamingZipTransfer resetWithCompletion:].cold.1(self, v11);

    -[IXDataPromise seed](self, "seed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "szOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXPromisedStreamingZipTransfer resetWithCompletion:]", 328, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("-[SZExtractor initWithOptions:] returned nil for options %@"), v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v15);
  }

}

- (BOOL)doesConsumeExtractedData
{
  return 1;
}

- (BOOL)consumeExtractedDataIfNeeded
{
  return 1;
}

- (unint64_t)archiveBytesConsumed
{
  void *v2;
  unint64_t v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "archiveBytesConsumed");

  return v3;
}

- (void)setArchiveBytesConsumed:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[IXDataPromise seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setArchiveBytesConsumed:", a3);

  +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise seed](self, "seed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSPromisedStreamingZipTransfer:setArchiveBytesConsumed:", v7, objc_msgSend(v8, "archiveBytesConsumed"));

}

void __58__IXPromisedStreamingZipTransfer_setArchiveBytesConsumed___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[IXPromisedStreamingZipTransfer setArchiveBytesConsumed:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to set bytes completed: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)addArchiveBytesConsumed:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[IXDataPromise seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "archiveBytesConsumed") + a3;
  objc_msgSend(v5, "setArchiveBytesConsumed:", v6);

  -[IXPromisedStreamingZipTransfer setArchiveBytesConsumed:](self, "setArchiveBytesConsumed:", v6);
}

- (void)setExtractorDelegate:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id obj;

  obj = a3;
  if (-[IXPromisedStreamingZipTransfer useProgressFromSZExtractor](self, "useProgressFromSZExtractor"))
  {
    v4 = 1;
    v5 = obj;
    if (!obj)
      goto LABEL_12;
  }
  else
  {
    v5 = obj;
    if (!obj)
    {
      v4 = 0;
      goto LABEL_12;
    }
    LODWORD(v4) = objc_opt_respondsToSelector() & 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    LODWORD(v4) = v4 | 2;
  v6 = objc_opt_respondsToSelector();
  v5 = obj;
  if ((v6 & 1) != 0)
    v4 = v4 | 4;
  else
    v4 = v4;
LABEL_12:
  objc_storeWeak((id *)&self->_extractorDelegate, v5);
  -[IXPromisedStreamingZipTransfer extractor](self, "extractor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActiveExtractorDelegateMethods:", v4);

}

- (void)setExtractionProgress:(double)a3
{
  void *v5;
  char v6;
  void *v7;

  -[IXPromisedStreamingZipTransfer extractorDelegate](self, "extractorDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IXPromisedStreamingZipTransfer useProgressFromSZExtractor](self, "useProgressFromSZExtractor"))
    -[IXDataPromise setPercentComplete:](self, "setPercentComplete:", a3);
  v5 = v7;
  if (v7)
  {
    v6 = objc_opt_respondsToSelector();
    v5 = v7;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v7, "setExtractionProgress:", a3);
      v5 = v7;
    }
  }

}

- (void)extractionCompleteAtArchivePath:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[IXPromisedStreamingZipTransfer extractorDelegate](self, "extractorDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "extractionCompleteAtArchivePath:", v5);

}

- (void)extractionEnteredPassThroughMode
{
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;

  -[IXPromisedStreamingZipTransfer extractorDelegate](self, "extractorDelegate");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v5 = (void *)v2;
    v4 = objc_opt_respondsToSelector();
    v3 = v5;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v5, "extractionEnteredPassThroughMode");
      v3 = v5;
    }
  }

}

- (IXPromisedStreamingZipTransfer)initWithSeed:(id)a3
{
  IXPromisedStreamingZipTransfer *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IXPromisedStreamingZipTransfer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)IXPromisedStreamingZipTransfer;
  v3 = -[IXOwnedDataPromise initWithSeed:](&v14, sel_initWithSeed_, a3);
  if (!v3)
    goto LABEL_3;
  v4 = objc_alloc(MEMORY[0x1E0DAFE60]);
  -[IXDataPromise seed](v3, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "szOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithOptions:", v6);
  -[IXPromisedStreamingZipTransfer setExtractor:](v3, "setExtractor:", v7);

  -[IXPromisedStreamingZipTransfer extractor](v3, "extractor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[IXDataPromise seed](v3, "seed");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "szOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v16 = "-[IXPromisedStreamingZipTransfer initWithSeed:]";
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1A4BF6000, v10, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);

    }
    v9 = 0;
  }
  else
  {
LABEL_3:
    v9 = v3;
  }

  return v9;
}

- (Class)seedClass
{
  return (Class)objc_opt_class();
}

- (SZExtractorDelegate)extractorDelegate
{
  return (SZExtractorDelegate *)objc_loadWeakRetained((id *)&self->_extractorDelegate);
}

- (SZExtractor)extractor
{
  return self->_extractor;
}

- (void)setExtractor:(id)a3
{
  objc_storeStrong((id *)&self->_extractor, a3);
}

- (BOOL)needsConsume
{
  return self->_needsConsume;
}

- (void)setNeedsConsume:(BOOL)a3
{
  self->_needsConsume = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_destroyWeak((id *)&self->_extractorDelegate);
}

- (void)prepareForExtraction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: self.stagedPath.path was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)_prepareForExtractionToPath:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)supplyBytes:withCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -supplyBytes:withCompletionBlock: called after promise was complete : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)supplyBytes:withCompletionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)suspendStreamWithCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)finishStreamWithCompletionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -finishStreamWithCompletionBlock: called after promise was complete : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)finishStreamWithCompletionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)terminateStreamWithError:completionBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: -terminateStreamWithError:completionBlock: called after promise was complete : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)terminateStreamWithError:completionBlock:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: self.extractor was unexpectedly nil! : %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_12();
}

- (void)resetWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "seed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "szOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315650;
  v6 = "-[IXPromisedStreamingZipTransfer resetWithCompletion:]";
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = 0;
  _os_log_error_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_ERROR, "%s: -[SZExtractor initWithOptions:] returned nil for options %@ : %@", (uint8_t *)&v5, 0x20u);

}

@end
