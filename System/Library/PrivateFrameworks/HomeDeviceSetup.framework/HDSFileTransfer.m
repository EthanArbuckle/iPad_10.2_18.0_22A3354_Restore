@implementation HDSFileTransfer

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

- (HDSFileTransfer)init
{
  HDSFileTransfer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  HDSFileTransfer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HDSFileTransfer;
  v2 = -[HDSFileTransfer init](&v8, sel_init);
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

- (void)waitForFilesWithTargetId:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x2348A3184]();
  v9 = objc_opt_new();
  v10 = (void *)_fileTransferSession;
  _fileTransferSession = v9;

  objc_msgSend((id)_fileTransferSession, "setTargetID:", v6);
  objc_msgSend(MEMORY[0x24BDBCE50], "mb_dataFromHexadecimalString:", CFSTR("e905dc700dfc2c3f26692d20346463a2adf3c4c340d4ea661696a0ae736800ec"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_fileTransferSession, "setPeerPublicKey:", v11);

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 1);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v14 = v6;
    LogPrintF();
  }
  v18 = 0;
  v12 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v18, v14);
  v13 = v18;
  if ((v12 & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke;
    v15[3] = &unk_24FCD4068;
    v15[4] = self;
    v17 = v7;
    v16 = v13;
    objc_msgSend((id)_fileTransferSession, "setProgressHandler:", v15);
    objc_msgSend((id)_fileTransferSession, "setReceivedItemHandler:", &__block_literal_global);
    objc_msgSend((id)_fileTransferSession, "activate");

  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v13);
  }
  objc_autoreleasePoolPop(v8);

}

void __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  void *v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
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
          v7 = v5;
          LogPrintF();
          goto LABEL_20;
      }
    }
    v5 = "?";
    goto LABEL_19;
  }
LABEL_20:
  if ((int)objc_msgSend(v3, "type", v7) >= 11)
  {
    v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke_2;
    v8[3] = &unk_24FCD4040;
    v10 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v6, "invalidate:", v8);

  }
}

uint64_t __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __59__HDSFileTransfer_waitForFilesWithTargetId_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v4 = a3;
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "itemURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v4[2](v4, 0);

}

- (void)beginSysDropFileTransfer:(id)a3 pathToFile:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x2348A3184]();
  v12 = objc_opt_new();
  v13 = (void *)_fileTransferSession;
  _fileTransferSession = v12;

  objc_msgSend((id)_fileTransferSession, "setTargetID:", v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "mb_dataFromHexadecimalString:", CFSTR("4a631f38b46cc4c9a28685d7bbfab4ec1bf5611f43574dc73a3075251164ade8"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_fileTransferSession, "setPeerPublicKey:", v14);

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v27 = v9;
    LogPrintF();
  }
  v36 = 0;
  v15 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", &v36, v27);
  v16 = v36;
  if ((v15 & 1) != 0)
  {
    v29 = v11;
    objc_msgSend((id)_fileTransferSession, "setProgressHandler:", &__block_literal_global_28);
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_2;
    v33[3] = &unk_24FCD4110;
    v33[4] = self;
    v17 = v10;
    v35 = v17;
    v34 = v16;
    objc_msgSend((id)_fileTransferSession, "setCompletionHandler:", v33);
    v30 = v9;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v9);
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v18, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v20, 0);

    if ((v21 & 1) != 0)
    {
      v22 = (void *)objc_opt_new();
      v23 = objc_alloc(MEMORY[0x24BDBCF48]);
      objc_msgSend(v18, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initFileURLWithPath:isDirectory:", v24, 0);
      objc_msgSend(v22, "setItemURL:", v25);

      objc_msgSend(v18, "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFilename:", v26);

      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_4;
      v31[3] = &unk_24FCD4138;
      v32 = v18;
      objc_msgSend(v22, "setCompletionHandler:", v31);
      objc_msgSend((id)_fileTransferSession, "addItem:", v22);
      objc_msgSend((id)_fileTransferSession, "activate");

    }
    else
    {
      if (gLogCategory_HDSFileTransfer <= 90
        && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorF();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v17 + 2))(v17, v22);
    }
    v11 = v29;
    v9 = v30;

  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v16);
  }
  objc_autoreleasePoolPop(v11);

}

void __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_HDSFileTransfer > 30)
    goto LABEL_9;
  v6 = v2;
  if (gLogCategory_HDSFileTransfer != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
  {
    objc_msgSend(v3, "type");
    LogPrintF();
    v3 = v6;
  }
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {
LABEL_9:

  }
}

void __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_3;
  v3[3] = &unk_24FCD4040;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "invalidate:", v3);

}

uint64_t __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __70__HDSFileTransfer_beginSysDropFileTransfer_pathToFile_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    if (gLogCategory_HDSFileTransfer <= 90
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "path");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = v6;
LABEL_8:
      LogPrintF();

    }
  }
  else if (gLogCategory_HDSFileTransfer <= 30
         && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 32), "path");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    goto LABEL_8;
  }
  objc_msgSend((id)_fileTransferSession, "finish", v4, v5);

}

- (void)sideloadFilesForTargetId:(id)a3 pathToDirectory:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x2348A3184]();
  v12 = objc_opt_new();
  v13 = (void *)_fileTransferSession;
  _fileTransferSession = v12;

  objc_msgSend((id)_fileTransferSession, "setTargetID:", v8);
  objc_msgSend(MEMORY[0x24BDBCE50], "mb_dataFromHexadecimalString:", CFSTR("4a631f38b46cc4c9a28685d7bbfab4ec1bf5611f43574dc73a3075251164ade8"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_fileTransferSession, "setPeerPublicKey:", v14);

  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x40);
  objc_msgSend((id)_fileTransferSession, "setFlags:", objc_msgSend((id)_fileTransferSession, "flags") | 0x20);
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v24 = v9;
    LogPrintF();
  }
  v34[0] = 0;
  v15 = objc_msgSend((id)_fileTransferSession, "prepareTemplateAndReturnError:", v34, v24);
  v16 = v34[0];
  if ((v15 & 1) != 0)
  {
    v26 = v11;
    v17 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke;
    v31[3] = &unk_24FCD4110;
    v31[4] = self;
    v33 = v10;
    v32 = v16;
    objc_msgSend((id)_fileTransferSession, "setCompletionHandler:", v31);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subpathsAtPath:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v27[0] = v17;
    v27[1] = 3221225472;
    v27[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_3;
    v27[3] = &unk_24FCD4188;
    v28 = v9;
    v29 = v21;
    v22 = v20;
    v30 = v22;
    v23 = v21;
    objc_msgSend(v19, "enumerateObjectsUsingBlock:", v27);
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      v25 = objc_msgSend(v22, "count");
      LogPrintF();
    }
    objc_msgSend((id)_fileTransferSession, "addItems:", v22, v25);
    objc_msgSend((id)_fileTransferSession, "activate");

    v11 = v26;
  }
  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v16);
  }
  objc_autoreleasePoolPop(v11);

}

void __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_2;
  v3[3] = &unk_24FCD4040;
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "invalidate:", v3);

}

uint64_t __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unsigned __int8 v15;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), *(_QWORD *)(a1 + 32), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 1;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v15);
  v7 = v15;

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", CFSTR("PENDING"), v4);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v4, 0);
    objc_msgSend(v9, "setItemURL:", v10);

    objc_msgSend(v9, "setFilename:", v3);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_4;
    v12[3] = &unk_24FCD4160;
    v13 = v4;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v9, "setCompletionHandler:", v12);
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v9, "itemURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9, v11);

  }
}

void __75__HDSFileTransfer_sideloadFilesForTargetId_pathToDirectory_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (gLogCategory_HDSFileTransfer > 90)
      goto LABEL_10;
    if (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize())
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = v3;
      LogPrintF();
    }
  }
  if (gLogCategory_HDSFileTransfer <= 30
    && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
  {
    v11 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", CFSTR("COMPLETED"), *(_QWORD *)(a1 + 32), v11, v12);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PENDING"));

        if ((v10 & 1) != 0)
        {

          goto LABEL_20;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend((id)_fileTransferSession, "finish");
LABEL_20:

}

- (void)invalidate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__HDSFileTransfer_invalidate___block_invoke;
  v7[3] = &unk_24FCD41B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __30__HDSFileTransfer_invalidate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_invalidate
{
  void *v2;

  if (_invalidateCalled)
  {
    if (gLogCategory_HDSFileTransfer <= 115
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSFileTransfer <= 30
      && (gLogCategory_HDSFileTransfer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    _invalidateCalled = 1;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
