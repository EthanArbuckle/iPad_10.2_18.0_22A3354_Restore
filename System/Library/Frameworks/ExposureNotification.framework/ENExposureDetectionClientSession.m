@implementation ENExposureDetectionClientSession

- (ENExposureDetectionClientSession)init
{
  ENExposureDetectionClientSession *v2;
  ENExposureDetectionClientSession *v3;
  ENExposureDetectionClientSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENExposureDetectionClientSession;
  v2 = -[ENExposureDetectionClientSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (ENExposureDetectionClientSession)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureDetectionClientSession *v7;
  void *v8;
  ENExposureConfiguration *v9;
  ENExposureConfiguration *configuration;
  ENExposureDetectionClientSession *v11;

  v6 = a3;
  v7 = -[ENExposureDetectionClientSession init](self, "init");
  if (!v7)
  {
    if (a4)
      goto LABEL_12;
    goto LABEL_13;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (a4)
    {
LABEL_12:
      ENErrorF(2);
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_13:
    v11 = 0;
    goto LABEL_8;
  }
  xpc_dictionary_get_value(v6, "expC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[ENExposureConfiguration initWithXPCObject:error:]([ENExposureConfiguration alloc], "initWithXPCObject:error:", v8, a4);
    if (!v9)
    {
      v11 = 0;
      goto LABEL_7;
    }
    configuration = v7->_configuration;
    v7->_configuration = v9;

  }
  v11 = v7;
LABEL_7:

LABEL_8:
  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  ENExposureConfiguration *configuration;
  ENExposureConfiguration *v5;
  id v6;
  xpc_object_t value;

  configuration = self->_configuration;
  if (configuration)
  {
    v5 = configuration;
    v6 = a3;
    value = xpc_dictionary_create(0, 0, 0);
    -[ENExposureConfiguration encodeWithXPCObject:](v5, "encodeWithXPCObject:", value);

    xpc_dictionary_set_value(v6, "expC", value);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__ENExposureDetectionClientSession_activate__block_invoke;
  block[3] = &unk_24C38AE38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__ENExposureDetectionClientSession_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_ENExposureDetection <= 30
    && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
    LogPrintF_safe();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__ENExposureDetectionClientSession_invalidate__block_invoke;
  block[3] = &unk_24C38AE38;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__ENExposureDetectionClientSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (gLogCategory_ENExposureDetection <= 30)
  {
    if (gLogCategory_ENExposureDetection != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF_safe();
  }
  v2 = *(_QWORD *)(v1 + 32);
  if (!*(_BYTE *)(v2 + 8))
    *(_BYTE *)(v2 + 8) = 1;
  return result;
}

- (void)_reportError:(id)a3 where:(const char *)a4
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id completionHandler;
  void *v7;
  id v8;

  v8 = a3;
  if (gLogCategory__ENExposureDetection <= 90
    && (gLogCategory__ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  self->_runState = 3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD2F464](self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v5)
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v8);

}

- (void)_run
{
  int runState;
  int v4;
  _BOOL4 v5;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      runState = self->_runState;
      v4 = 10;
      switch(runState)
      {
        case 0:
          goto LABEL_18;
        case 10:
          v5 = -[ENExposureDetectionClientSession _runActivateStart](self, "_runActivateStart");
          goto LABEL_12;
        case 11:
          if (self->_guardActivateDone)
          {
            v4 = 12;
            goto LABEL_18;
          }
          v4 = 11;
          break;
        case 12:
          goto LABEL_9;
        case 13:
          if (self->_mainFileIndex >= self->_mainFileCount)
          {
            v4 = 15;
            goto LABEL_18;
          }
          v5 = -[ENExposureDetectionClientSession _runAddFile](self, "_runAddFile");
LABEL_12:
          v4 = self->_runState;
          if (v5)
          {
            ++v4;
            goto LABEL_18;
          }
          break;
        case 14:
          if (self->_guardAddFileDone)
          {
LABEL_9:
            v4 = 13;
            goto LABEL_18;
          }
          v4 = 14;
          break;
        case 15:
          v4 = 16;
          goto LABEL_18;
        case 16:
          v5 = -[ENExposureDetectionClientSession _runFinishStart](self, "_runFinishStart");
          goto LABEL_12;
        case 17:
          if (self->_guardFinishDone)
          {
            v4 = 18;
LABEL_18:
            self->_runState = v4;
          }
          else
          {
            v4 = 17;
          }
          break;
        case 18:
          -[ENExposureDetectionClientSession _runDetectionDone](self, "_runDetectionDone");
          v4 = 4;
          goto LABEL_18;
        default:
          return;
      }
      if (v4 == runState)
        break;
      if (gLogCategory_ENExposureDetection <= 30
        && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (BOOL)_runActivateStart
{
  NSMutableArray *v3;
  NSMutableArray *mainFileURLs;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *signatureURLMap;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t mainFileCount;
  ENManager *manager;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSArray *obj;
  ENExposureDetectionClientSession *v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mainFileURLs = self->_mainFileURLs;
  self->_mainFileURLs = v3;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v5 = self->_diagnosisKeyURLs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v52 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v10, "pathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("sig"));

        if (v12)
          -[NSMutableArray addObject:](self->_mainFileURLs, "addObject:", v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v7);
  }

  v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  signatureURLMap = self->_signatureURLMap;
  self->_signatureURLMap = v13;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = self->_diagnosisKeyURLs;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    v41 = self;
    v38 = *(_QWORD *)v48;
    do
    {
      v18 = 0;
      v39 = v16;
      do
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v18);
        objc_msgSend(v19, "pathExtension");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "caseInsensitiveCompare:", CFSTR("sig"));

        if (!v21)
        {
          objc_msgSend(v19, "URLByDeletingPathExtension");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "absoluteString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v24 = self->_mainFileURLs;
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v44;
            while (2)
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v44 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                objc_msgSend(v29, "URLByDeletingPathExtension");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "absoluteString");
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (!objc_msgSend(v31, "caseInsensitiveCompare:", v23))
                {
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v41->_signatureURLMap, "setObject:forKeyedSubscript:", v19, v29);

                  goto LABEL_26;
                }

              }
              v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
              if (v26)
                continue;
              break;
            }
          }
LABEL_26:

          self = v41;
          v17 = v38;
          v16 = v39;
        }
        ++v18;
      }
      while (v18 != v16);
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v16);
  }

  self->_mainFileIndex = 0;
  v32 = -[NSMutableArray count](self->_mainFileURLs, "count");
  self->_mainFileCount = v32;
  if (gLogCategory_ENExposureDetection <= 30)
  {
    mainFileCount = v32;
    if (gLogCategory_ENExposureDetection == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_33;
      mainFileCount = self->_mainFileCount;
    }
    v36 = mainFileCount;
    v37 = -[NSMutableDictionary count](self->_signatureURLMap, "count");
    LogPrintF_safe();
  }
LABEL_33:
  self->_guardActivateDone = 0;
  manager = self->_manager;
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __53__ENExposureDetectionClientSession__runActivateStart__block_invoke;
  v42[3] = &unk_24C38AFF0;
  v42[4] = self;
  -[ENManager exposureDetectionFileActivate:completion:](manager, "exposureDetectionFileActivate:completion:", self, v42, v36, v37);
  return 1;
}

uint64_t __53__ENExposureDetectionClientSession__runActivateStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_reportError:where:", a2, "Activate");
  v3[10] = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (BOOL)_runAddFile
{
  NSMutableArray *mainFileURLs;
  void *v4;
  void *v5;
  unint64_t mainFileIndex;
  unint64_t mainFileCount;
  void *v8;
  ENManager *manager;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  mainFileURLs = self->_mainFileURLs;
  ++self->_mainFileIndex;
  -[NSMutableArray objectAtIndexedSubscript:](mainFileURLs, "objectAtIndexedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_signatureURLMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_ENExposureDetection <= 30
    && (gLogCategory_ENExposureDetection != -1 || _LogCategory_Initialize()))
  {
    mainFileIndex = self->_mainFileIndex;
    mainFileCount = self->_mainFileCount;
    objc_msgSend(v4, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v13 = v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = mainFileIndex;
    v12 = mainFileCount;
    LogPrintF_safe();

  }
  self->_guardAddFileDone = 0;
  manager = self->_manager;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__ENExposureDetectionClientSession__runAddFile__block_invoke;
  v15[3] = &unk_24C38AFF0;
  v15[4] = self;
  -[ENManager exposureDetectionFileAdd:signatureURL:completion:](manager, "exposureDetectionFileAdd:signatureURL:completion:", v4, v5, v15, v11, v12, v13, v14);

  return 1;
}

uint64_t __47__ENExposureDetectionClientSession__runAddFile__block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;

  v3 = *(_BYTE **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "_reportError:where:", a2, "AddFile");
  v3[11] = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (BOOL)_runFinishStart
{
  ENManager *manager;
  _QWORD v4[5];

  self->_guardFinishDone = 0;
  manager = self->_manager;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__ENExposureDetectionClientSession__runFinishStart__block_invoke;
  v4[3] = &unk_24C38B018;
  v4[4] = self;
  -[ENManager exposureDetectionFileFinishWithCompletion:](manager, "exposureDetectionFileFinishWithCompletion:", v4);
  return 1;
}

void __51__ENExposureDetectionClientSession__runFinishStart__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v6;
  id v7;

  v7 = a2;
  v6 = *(id **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v6, "_reportError:where:", a3, "Finish");
  }
  else
  {
    objc_storeStrong(v6 + 3, a2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

- (void)_runDetectionDone
{
  id completionHandler;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x20BD2F464](self->_completionHandler, a2);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, ENExposureDetectionSummary *, _QWORD))v5 + 2))(v5, self->_summary, 0);
    v4 = v5;
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (ENExposureConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSArray)diagnosisKeyURLs
{
  return self->_diagnosisKeyURLs;
}

- (void)setDiagnosisKeyURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (ENManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_diagnosisKeyURLs, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_signatureURLMap, 0);
  objc_storeStrong((id *)&self->_mainFileURLs, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
