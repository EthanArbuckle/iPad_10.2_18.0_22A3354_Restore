@implementation IXPromisedOutOfBandStreamingZipTransfer

- (IXPromisedOutOfBandStreamingZipTransfer)initWithCoder:(id)a3
{
  IXPromisedOutOfBandStreamingZipTransfer *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IXPromisedOutOfBandStreamingZipTransfer *v9;
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
  v14.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  v3 = -[IXOpaqueDataPromise initWithCoder:](&v14, sel_initWithCoder_, a3);
  if (!v3)
    goto LABEL_3;
  v4 = objc_alloc(MEMORY[0x1E0DAFE60]);
  -[IXDataPromise seed](v3, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "szOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithOptions:", v6);
  -[IXPromisedOutOfBandStreamingZipTransfer setExtractor:](v3, "setExtractor:", v7);

  -[IXPromisedOutOfBandStreamingZipTransfer extractor](v3, "extractor");
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
      v16 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithCoder:]";
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

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  -[IXOpaqueDataPromise encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXPromisedOutOfBandStreamingZipTransfer)initWithName:(id)a3 client:(unint64_t)a4 streamingZipOptions:(id)a5 archiveSize:(unint64_t)a6 diskSpaceNeeded:(unint64_t)a7
{
  id v12;
  id v13;
  IXPromisedOutOfBandStreamingZipTransfer *v14;
  IXPromisedOutOfBandStreamingZipTransfer *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  IXPromisedOutOfBandStreamingZipTransfer *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[4];
  IXPromisedOutOfBandStreamingZipTransfer *v27;
  _BYTE *v28;
  _QWORD v29[5];
  objc_super v30;
  _BYTE buf[24];
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  v14 = -[IXDataPromise initWithName:client:diskSpaceNeeded:](&v30, sel_initWithName_client_diskSpaceNeeded_, v12, a4, a7);
  v15 = v14;
  if (v14)
  {
    -[IXDataPromise seed](v14, "seed");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setArchiveSizeBytes:", a6);

    -[IXDataPromise seed](v15, "seed");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSzOptions:", v13);

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFE60]), "initWithOptions:", v13);
    -[IXPromisedOutOfBandStreamingZipTransfer setExtractor:](v15, "setExtractor:", v18);

    -[IXPromisedOutOfBandStreamingZipTransfer extractor](v15, "extractor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v19 == 0;

    if ((_DWORD)v18)
    {
      IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[IXPromisedOutOfBandStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSi"
                             "ze:diskSpaceNeeded:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v13;
        _os_log_impl(&dword_1A4BF6000, v24, OS_LOG_TYPE_DEFAULT, "%s: -[SZExtractor initWithOptions:] returned nil for options %@", buf, 0x16u);
      }

    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v32 = 0;
      +[IXServerConnection sharedConnection](IXServerConnection, "sharedConnection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke;
      v29[3] = &unk_1E4DC41B0;
      v29[4] = buf;
      objc_msgSend(v20, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
      v22 = (IXPromisedOutOfBandStreamingZipTransfer *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
        _Block_object_dispose(buf, 8);
        goto LABEL_11;
      }
      -[IXDataPromise seed](v15, "seed");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v21;
      v26[1] = 3221225472;
      v26[2] = __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke_6;
      v26[3] = &unk_1E4DC5198;
      v28 = buf;
      v27 = v15;
      -[IXPromisedOutOfBandStreamingZipTransfer _remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:completion:](v22, "_remote_createOutOfBandStreamingZipTransferDataPromiseWithSeed:completion:", v23, v26);

      LODWORD(v23) = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
      if (!(_DWORD)v23)
        goto LABEL_5;
    }
    v22 = 0;
    goto LABEL_11;
  }
LABEL_5:
  v22 = v15;
LABEL_11:

  return v22;
}

void __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke(uint64_t a1, void *a2)
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
    v6 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]_block_invoke";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to contact daemon: %@", (uint8_t *)&v5, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __111__IXPromisedOutOfBandStreamingZipTransfer_initWithName_client_streamingZipOptions_archiveSize_diskSpaceNeeded___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
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
      v8 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1A4BF6000, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed tell daemon to set up out of band StreamingZip transfer promise: %@", (uint8_t *)&v7, 0x16u);
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
  char *v3;
  void (**v4)(id, _QWORD, void *);
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = kIXLoggingSubsystem;
  v4 = (void (**)(id, _QWORD, void *))a3;
  IXGetLoggingHandle((uint64_t)v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[IXPromisedOutOfBandStreamingZipTransfer prepareForExtraction:].cold.1();

  _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer prepareForExtraction:]", 111, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("You must call -prepareForExtractionToPath: instead; -prepareForExtraction: is not valid on this type of promise."),
    v6,
    v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, v7);

}

- (void)prepareForExtractionToPath:(id)a3 completionBlock:(id)a4
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
  -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = (uint64_t)__86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke;
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
      -[IXPromisedOutOfBandStreamingZipTransfer prepareForExtractionToPath:completionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer prepareForExtractionToPath:completionBlock:]", 118, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v11, v13[0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v12, 15, 0);
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

  }
}

void __86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    v9[2] = __86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke_2;
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

void __86__IXPromisedOutOfBandStreamingZipTransfer_prepareForExtractionToPath_completionBlock___block_invoke_2(uint64_t a1, void *a2)
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
      v6 = "-[IXPromisedOutOfBandStreamingZipTransfer prepareForExtractionToPath:completionBlock:]_block_invoke_2";
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
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  void (**v19)(id, void *, uint64_t);
  uint64_t v20;

  v6 = a3;
  v7 = (void (**)(id, void *, uint64_t))a4;
  if (-[IXDataPromise localIsComplete](self, "localIsComplete"))
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]", 153, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-supplyBytes:withCompletionBlock: called after promise was complete"), v9, v17);
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
  -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v6, "length");
    -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke;
    v18[3] = &unk_1E4DC51C0;
    v18[4] = self;
    v19 = v7;
    v20 = v12;
    objc_msgSend(v13, "supplyBytes:withCompletionBlock:", v6, v18);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:].cold.2();

    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]", 165, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v15, v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v16, 15, 0);
    v7[2](v7, v16, 1);

  }
LABEL_7:

}

void __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E4DC42A0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "cancelForReason:client:completion:", v6, 15, v5);

  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "useProgressFromSZExtractor") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addBytesTransferred:", *(_QWORD *)(a1 + 48));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__IXPromisedOutOfBandStreamingZipTransfer_supplyBytes_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
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
      v6 = "-[IXPromisedOutOfBandStreamingZipTransfer supplyBytes:withCompletionBlock:]_block_invoke_2";
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
  -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = (uint64_t)__76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke;
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
      -[IXPromisedOutOfBandStreamingZipTransfer suspendStreamWithCompletionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer suspendStreamWithCompletionBlock:]", 196, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v8, v10[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v9, 15, 0);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v9);

  }
}

void __76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    v6[2] = __76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke_2;
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

void __76__IXPromisedOutOfBandStreamingZipTransfer_suspendStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
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
      v6 = "-[IXPromisedOutOfBandStreamingZipTransfer suspendStreamWithCompletionBlock:]_block_invoke_2";
      v7 = 2112;
      v8 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Failed to cancel for reason: %@", (uint8_t *)&v5, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)finishStreamWithCompletionBlock:(id)a3
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
  -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = (uint64_t)__75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke;
    v10[3] = (uint64_t)&unk_1E4DC50E8;
    v10[4] = (uint64_t)self;
    v11 = v4;
    objc_msgSend(v6, "finishStreamWithCompletionBlock:", v10);

  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[IXPromisedOutOfBandStreamingZipTransfer finishStreamWithCompletionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer finishStreamWithCompletionBlock:]", 219, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v8, v10[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v9, 15, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v9);

  }
}

void __75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke_2;
    v5[3] = &unk_1E4DC42A0;
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "cancelForReason:client:completion:", v6, 15, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setComplete:", 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __75__IXPromisedOutOfBandStreamingZipTransfer_finishStreamWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
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
      v6 = "-[IXPromisedOutOfBandStreamingZipTransfer finishStreamWithCompletionBlock:]_block_invoke_2";
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
      -[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:].cold.1();

    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]", 244, CFSTR("IXErrorDomain"), 4uLL, 0, 0, CFSTR("-terminateStreamWithError:completionBlock: called after promise was complete"), v9, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v10);

  }
  else
  {
    -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke;
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
        -[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:].cold.2();

      _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]", 250, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("self.extractor was unexpectedly nil!"), v14, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IXDataPromise cancelForReason:client:error:](self, "cancelForReason:client:error:", v15, 15, 0);
      v7[2](v7, v15);

    }
  }

}

void __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke(uint64_t a1, void *a2)
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
      v10 = "-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]_block_invoke";
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1A4BF6000, v4, OS_LOG_TYPE_DEFAULT, "%s: Terminating stream failed with error: %@", buf, 0x16u);
    }

  }
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke_17;
  v7[3] = &unk_1E4DC40C0;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "cancelForReason:client:completion:", v6, 15, v7);

}

void __84__IXPromisedOutOfBandStreamingZipTransfer_terminateStreamWithError_completionBlock___block_invoke_17(uint64_t a1, void *a2)
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
      v6 = "-[IXPromisedOutOfBandStreamingZipTransfer terminateStreamWithError:completionBlock:]_block_invoke";
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
  -[IXPromisedOutOfBandStreamingZipTransfer setExtractor:](self, "setExtractor:", v9);

  -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v16.receiver = self;
    v16.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
    -[IXDataPromise resetWithCompletion:](&v16, sel_resetWithCompletion_, v4);
  }
  else
  {
    IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[IXPromisedOutOfBandStreamingZipTransfer resetWithCompletion:].cold.1(self, v11);

    -[IXDataPromise seed](self, "seed");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "szOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[IXPromisedOutOfBandStreamingZipTransfer resetWithCompletion:]", 276, CFSTR("IXErrorDomain"), 1uLL, 0, 0, CFSTR("-[SZExtractor initWithOptions:] returned nil for options %@"), v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v15);
  }

}

- (BOOL)doesConsumeExtractedData
{
  return 0;
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
  objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise uniqueIdentifier](self, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IXDataPromise seed](self, "seed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_remote_IXSPromisedOutOfBandStreamingZipTransfer:setArchiveBytesConsumed:", v7, objc_msgSend(v8, "archiveBytesConsumed"));

}

void __67__IXPromisedOutOfBandStreamingZipTransfer_setArchiveBytesConsumed___block_invoke(uint64_t a1, void *a2)
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
    v5 = "-[IXPromisedOutOfBandStreamingZipTransfer setArchiveBytesConsumed:]_block_invoke";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_1A4BF6000, v3, OS_LOG_TYPE_DEFAULT, "%s: Failed to set bytes completed: %@", (uint8_t *)&v4, 0x16u);
  }

}

- (void)addBytesTransferred:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[IXDataPromise seed](self, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "archiveBytesConsumed") + a3;
  objc_msgSend(v5, "setArchiveBytesConsumed:", v6);

  -[IXPromisedOutOfBandStreamingZipTransfer setArchiveBytesConsumed:](self, "setArchiveBytesConsumed:", v6);
}

- (NSURL)extractionPath
{
  void *v2;
  void *v3;

  -[IXDataPromise seed](self, "seed");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extractionPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)setExtractorDelegate:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  id obj;

  obj = a3;
  if (-[IXPromisedOutOfBandStreamingZipTransfer useProgressFromSZExtractor](self, "useProgressFromSZExtractor"))
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
  -[IXPromisedOutOfBandStreamingZipTransfer extractor](self, "extractor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActiveExtractorDelegateMethods:", v4);

}

- (void)setExtractionProgress:(double)a3
{
  void *v5;
  char v6;
  void *v7;

  -[IXPromisedOutOfBandStreamingZipTransfer extractorDelegate](self, "extractorDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IXPromisedOutOfBandStreamingZipTransfer useProgressFromSZExtractor](self, "useProgressFromSZExtractor"))
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
  -[IXPromisedOutOfBandStreamingZipTransfer extractorDelegate](self, "extractorDelegate");
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

  -[IXPromisedOutOfBandStreamingZipTransfer extractorDelegate](self, "extractorDelegate");
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

- (IXPromisedOutOfBandStreamingZipTransfer)initWithSeed:(id)a3
{
  IXPromisedOutOfBandStreamingZipTransfer *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  IXPromisedOutOfBandStreamingZipTransfer *v9;
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
  v14.super_class = (Class)IXPromisedOutOfBandStreamingZipTransfer;
  v3 = -[IXDataPromise initWithSeed:](&v14, sel_initWithSeed_, a3);
  if (!v3)
    goto LABEL_3;
  v4 = objc_alloc(MEMORY[0x1E0DAFE60]);
  -[IXDataPromise seed](v3, "seed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "szOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithOptions:", v6);
  -[IXPromisedOutOfBandStreamingZipTransfer setExtractor:](v3, "setExtractor:", v7);

  -[IXPromisedOutOfBandStreamingZipTransfer extractor](v3, "extractor");
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
      v16 = "-[IXPromisedOutOfBandStreamingZipTransfer initWithSeed:]";
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
  OUTLINED_FUNCTION_1_0(&dword_1A4BF6000, v0, v1, "%s: You must call -prepareForExtractionToPath: instead; -prepareForExtraction: is not valid on this type of promise. : %@",
    v2,
    v3,
    v4,
    v5,
    2u);
  OUTLINED_FUNCTION_12();
}

- (void)prepareForExtractionToPath:completionBlock:.cold.1()
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
  v6 = "-[IXPromisedOutOfBandStreamingZipTransfer resetWithCompletion:]";
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = 0;
  _os_log_error_impl(&dword_1A4BF6000, a2, OS_LOG_TYPE_ERROR, "%s: -[SZExtractor initWithOptions:] returned nil for options %@ : %@", (uint8_t *)&v5, 0x20u);

}

@end
