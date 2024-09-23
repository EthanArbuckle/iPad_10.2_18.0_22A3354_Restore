@implementation HDSFileTransferService

+ (id)tmpRapportDir
{
  void *v2;
  void *v3;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)destDirectoryForTargetId:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  +[HDSFileTransfer tmpRapportDir](HDSFileTransfer, "tmpRapportDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/com.apple.rapport/FileTransfer/%@.rpftd"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HDSFileTransferService)init
{
  HDSFileTransferService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  HDSFileTransferService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDSFileTransferService;
  v2 = -[HDSFileTransferService init](&v8, sel_init);
  if (v2)
  {
    _invalidateCalled = 0;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.soundboard.hdsfiletransfer", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)handleSysDropStartFileTransferRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  int v21;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v21 = 0;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x2348A3184]();
  v10 = objc_opt_new();
  v11 = (void *)_fileTransferSession;
  _fileTransferSession = v10;

  objc_msgSend((id)_fileTransferSession, "setTargetID:", v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "mb_dataFromHexadecimalString:", CFSTR("e905dc700dfc2c3f26692d20346463a2adf3c4c340d4ea661696a0ae736800ec"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_fileTransferSession, "setPeerPublicKey:", v12);

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 1);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  objc_msgSend((id)_fileTransferSession, "setProgressHandlerTimeInterval:", 1.0);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v17 = v8;
    LogPrintF();
  }
  v20 = 0;
  v13 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v20, v17);
  v14 = v20;
  v15 = v14;
  if ((v13 & 1) != 0 || !v14)
  {
    v16 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke;
    v19[3] = &unk_24FCD41D8;
    v19[4] = self;
    objc_msgSend((id)_fileTransferSession, "setProgressHandler:", v19);
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke_2;
    v18[3] = &unk_24FCD4200;
    v18[4] = self;
    objc_msgSend((id)_fileTransferSession, "setReceivedItemHandler:", v18);
    objc_msgSend((id)_fileTransferSession, "activate");
    objc_autoreleasePoolPop(v9);
    v7[2](v7, 0);
  }
  else
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    ((void (**)(id, void *))v7)[2](v7, v15);
    objc_autoreleasePoolPop(v9);
  }

}

void __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v3 = a2;
  v18 = v3;
  if (gLogCategory_HDSFileTransfer > 30)
    goto LABEL_28;
  if (gLogCategory_HDSFileTransfer != -1 || (v6 = _LogCategory_Initialize(), v3 = v18, v6))
  {
    v4 = objc_msgSend(v3, "type");
    if (v4 > 10)
    {
      switch(v4)
      {
        case 11:
          v5 = "ControlDisconnected";
          goto LABEL_19;
        case 20:
          v5 = "Completed";
          goto LABEL_19;
        case 30:
          v5 = "DataTransferred";
          goto LABEL_19;
      }
    }
    else
    {
      switch(v4)
      {
        case 0:
          v5 = "Unspecified";
          goto LABEL_19;
        case 1:
          v5 = "SessionStart";
          goto LABEL_19;
        case 10:
          v5 = "ControlConnected";
LABEL_19:
          v16 = (uint64_t)v5;
          LogPrintF();
          v3 = v18;
          goto LABEL_20;
      }
    }
    v5 = "?";
    goto LABEL_19;
  }
LABEL_20:
  if (gLogCategory_HDSFileTransfer <= 30)
  {
    if (gLogCategory_HDSFileTransfer != -1 || (v7 = _LogCategory_Initialize(), v3 = v18, v7))
    {
      v16 = (uint64_t)v3;
      LogPrintF();
      v3 = v18;
    }
    if (gLogCategory_HDSFileTransfer <= 30)
    {
      if (gLogCategory_HDSFileTransfer != -1 || (v8 = _LogCategory_Initialize(), v3 = v18, v8))
      {
        v16 = objc_msgSend(v3, "transferredByteCount", v16);
        v17 = objc_msgSend(v18, "totalByteCount");
        LogPrintF();
        v3 = v18;
      }
    }
  }
LABEL_28:
  v9 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v9 + 8))
  {
    if (objc_msgSend(v3, "type") == 11)
    {
      NSErrorF();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 16);
      *(_QWORD *)(v11 + 16) = v10;

      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 48);
      if (v14)
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, *(_QWORD *)(v13 + 16), 0);
      objc_msgSend((id)_fileTransferSession, "invalidate", v16, v17);
      v15 = (void *)_fileTransferSession;
      _fileTransferSession = 0;

LABEL_42:
      v3 = v18;
      goto LABEL_43;
    }
    v9 = *(_QWORD *)(a1 + 32);
    v3 = v18;
  }
  if (*(_QWORD *)(v9 + 40) && !*(_BYTE *)(v9 + 24) && !*(_QWORD *)(v9 + 16))
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
    goto LABEL_42;
  }
LABEL_43:

}

void __80__HDSFileTransferService_handleSysDropStartFileTransferRequest_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = a3;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v13, "itemURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "metadata");
    v11 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v13);
  objc_msgSend((id)_fileTransferSession, "invalidate", v11, v12);
  v10 = (void *)_fileTransferSession;
  _fileTransferSession = 0;

  v6[2](v6, 0);
}

- (void)invalidate
{
  void *v2;

  if (_fileTransferSession)
  {
    objc_msgSend((id)_fileTransferSession, "invalidate");
    v2 = (void *)_fileTransferSession;
    _fileTransferSession = 0;

  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)fileTransferProgressHandler
{
  return self->_fileTransferProgressHandler;
}

- (void)setFileTransferProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)fileTransferCompletionHandler
{
  return self->_fileTransferCompletionHandler;
}

- (void)setFileTransferCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fileTransferCompletionHandler, 0);
  objc_storeStrong(&self->_fileTransferProgressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rpFileTransferError, 0);
  objc_storeStrong((id *)&self->_transferItem, 0);
}

@end
