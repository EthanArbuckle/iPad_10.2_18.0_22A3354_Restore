@implementation CRKShareTargetBrowser

- (void)dealloc
{
  objc_super v3;

  -[CRKShareTargetBrowser invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CRKShareTargetBrowser;
  -[CRKShareTargetBrowser dealloc](&v3, sel_dealloc);
}

- (CRKShareTargetBrowser)initWithDelegate:(id)a3
{
  return -[CRKShareTargetBrowser initWithDelegate:queue:](self, "initWithDelegate:queue:", a3, MEMORY[0x24BDAC9B8]);
}

- (CRKShareTargetBrowser)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CRKShareTargetBrowser *v10;
  CRKShareTargetBrowser *v11;
  uint64_t v12;
  CATOperationQueue *mOperationQueue;
  uint64_t v14;
  CRKShareTargetBrowserTransportFactory *transportFactory;
  uint64_t v16;
  CRKShareTargetCollector *shareTargetCollector;
  void *v19;
  void *v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShareTargetBrowser.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShareTargetBrowser.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v21.receiver = self;
  v21.super_class = (Class)CRKShareTargetBrowser;
  v10 = -[CRKShareTargetBrowser init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->mIsValid = 1;
    objc_storeWeak((id *)&v10->mDelegate, v7);
    objc_storeStrong((id *)&v11->mDelegateQueue, a4);
    v12 = objc_opt_new();
    mOperationQueue = v11->mOperationQueue;
    v11->mOperationQueue = (CATOperationQueue *)v12;

    v14 = objc_opt_new();
    transportFactory = v11->_transportFactory;
    v11->_transportFactory = (CRKShareTargetBrowserTransportFactory *)v14;

    v16 = objc_opt_new();
    shareTargetCollector = v11->_shareTargetCollector;
    v11->_shareTargetCollector = (CRKShareTargetCollector *)v16;

    -[CRKShareTargetCollector setDelegate:](v11->_shareTargetCollector, "setDelegate:", v11);
  }

  return v11;
}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  if (!self->mIsValid)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShareTargetBrowser.m"), 67, CFSTR("Browser has already been invalidated"));

  }
  if (!self->mBrowsing)
  {
    self->mBrowsing = 1;
    v3 = (void *)objc_opt_new();
    -[CRKShareTargetBrowser setStudentClient:](self, "setStudentClient:", v3);

    -[CRKShareTargetBrowser studentClient](self, "studentClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", self);

    v5 = (void *)objc_opt_new();
    -[CRKShareTargetBrowser setInstructorClient:](self, "setInstructorClient:", v5);

    -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

    -[CRKShareTargetBrowser connectToStudentd](self, "connectToStudentd");
    -[CRKShareTargetBrowser connectToInstructord](self, "connectToInstructord");
  }
}

- (void)suspend
{
  self->mBrowsing = 0;
  -[CRKShareTargetBrowser tearDownStudentClient](self, "tearDownStudentClient");
  -[CRKShareTargetBrowser tearDownInstructorClient](self, "tearDownInstructorClient");
}

- (void)invalidate
{
  self->mIsValid = 0;
  -[CRKShareTargetBrowser suspend](self, "suspend");
}

- (void)connectToStudentd
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  CRKShareTargetBrowser *v11;
  uint8_t buf[16];

  _CRKLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Share target browser requesting studentd transport", buf, 2u);
  }

  -[CRKShareTargetBrowser studentClient](self, "studentClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShareTargetBrowser.m"), 107, CFSTR("Attempting to fetch a transport without a student task client"));

  }
  -[CRKShareTargetBrowser transportFactory](self, "transportFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__CRKShareTargetBrowser_connectToStudentd__block_invoke;
  v9[3] = &unk_24D9C8F48;
  v10 = v5;
  v11 = self;
  v7 = v5;
  objc_msgSend(v6, "makeStudentdTransportWithCompletion:", v9);

}

void __42__CRKShareTargetBrowser_connectToStudentd__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "studentClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("ClassroomKit.error")))
      {
        v10 = objc_msgSend(v6, "code");

        if (v10 == 202)
          goto LABEL_12;
      }
      else
      {

      }
      _CRKLogGeneral_5();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __42__CRKShareTargetBrowser_connectToStudentd__block_invoke_cold_1(v6);

      objc_msgSend(*(id *)(a1 + 40), "delegateDidInterruptWithError:", v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "studentClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "connectWithTransport:", v5);

    }
  }
  else
  {
    objc_msgSend(v5, "invalidate");
  }
LABEL_12:

}

- (void)acquireStudentActivityAssertion
{
  void *v3;
  void *v4;
  id v5;

  -[CRKShareTargetBrowser studentClient](self, "studentClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "prepareTaskOperationForRequest:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addTarget:selector:forOperationEvents:", self, sel_acquireStudentActivityAssertionOperationDidFail_, 4);
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v5);

}

- (void)acquireStudentActivityAssertionOperationDidFail:(id)a3
{
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CRKShareTargetBrowser isClientInvalidationError:](self, "isClientInvalidationError:", v4))
  {
    _CRKLogGeneral_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CRKShareTargetBrowser acquireStudentActivityAssertionOperationDidFail:].cold.1(v4);

    -[CRKShareTargetBrowser delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v4);
  }

}

- (void)startBrowsingForStudentTargets
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _CRKLogGeneral_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Classroom: Share target browser starting to browse for student targets", v7, 2u);
  }

  -[CRKShareTargetBrowser studentClient](self, "studentClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "prepareTaskOperationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addTarget:selector:forOperationEvents:", self, sel_browseForStudentTargetsOperationDidFail_, 4);
  objc_msgSend(v6, "setNotificationDelegate:", self);
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v6);

}

- (void)browseForStudentTargetsOperationDidFail:(id)a3
{
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CRKShareTargetBrowser isClientInvalidationError:](self, "isClientInvalidationError:", v4))
  {
    _CRKLogGeneral_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CRKShareTargetBrowser browseForStudentTargetsOperationDidFail:].cold.1(v4);

    -[CRKShareTargetBrowser delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v4);
  }

}

- (void)connectToInstructord
{
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  CRKShareTargetBrowser *v11;
  uint8_t buf[16];

  _CRKLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Classroom: Share target browser requesting instructord transport", buf, 2u);
  }

  -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKShareTargetBrowser.m"), 181, CFSTR("Attempting to fetch a transport without an instructor task client"));

  }
  -[CRKShareTargetBrowser transportFactory](self, "transportFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__CRKShareTargetBrowser_connectToInstructord__block_invoke;
  v9[3] = &unk_24D9C8F48;
  v10 = v5;
  v11 = self;
  v7 = v5;
  objc_msgSend(v6, "makeInstructordTransportWithCompletion:", v9);

}

void __45__CRKShareTargetBrowser_connectToInstructord__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "instructorClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    if (v6)
    {
      objc_msgSend(v6, "domain");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("ClassroomKit.error")))
      {
        v10 = objc_msgSend(v6, "code");

        if (v10 == 101)
          goto LABEL_12;
      }
      else
      {

      }
      _CRKLogGeneral_5();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __45__CRKShareTargetBrowser_connectToInstructord__block_invoke_cold_1(v6);

      objc_msgSend(*(id *)(a1 + 40), "delegateDidInterruptWithError:", v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "instructorClient");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "connectWithTransport:", v5);

    }
  }
  else
  {
    objc_msgSend(v5, "invalidate");
  }
LABEL_12:

}

- (void)startBrowsingForInstructorTargets
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  _CRKLogGeneral_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_218C99000, v3, OS_LOG_TYPE_INFO, "Classroom: Share target browser starting to browse for instructor targets", v7, 2u);
  }

  -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "prepareTaskOperationForRequest:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addTarget:selector:forOperationEvents:", self, sel_browseForInstructorTargetsOperationDidFail_, 4);
  objc_msgSend(v6, "setNotificationDelegate:", self);
  -[CATOperationQueue addOperation:](self->mOperationQueue, "addOperation:", v6);

}

- (void)browseForInstructorTargetsOperationDidFail:(id)a3
{
  void *v4;
  NSObject *v5;

  objc_msgSend(a3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CRKShareTargetBrowser isClientInvalidationError:](self, "isClientInvalidationError:", v4))
  {
    _CRKLogGeneral_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CRKShareTargetBrowser browseForInstructorTargetsOperationDidFail:].cold.1(v4);

    -[CRKShareTargetBrowser delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v4);
  }

}

- (void)clientDidConnect:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a3;
  -[CRKShareTargetBrowser studentClient](self, "studentClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    _CRKLogGeneral_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218C99000, v8, OS_LOG_TYPE_INFO, "Classroom: Share target browser did connect to studentd", buf, 2u);
    }

    -[CRKShareTargetBrowser acquireStudentActivityAssertion](self, "acquireStudentActivityAssertion");
    -[CRKShareTargetBrowser startBrowsingForStudentTargets](self, "startBrowsingForStudentTargets");
  }
  else
  {
    -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      _CRKLogGeneral_5();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "Classroom: Share target browser did connect to instructord", v9, 2u);
      }

      -[CRKShareTargetBrowser startBrowsingForInstructorTargets](self, "startBrowsingForInstructorTargets");
    }
  }

}

- (void)client:(id)a3 didInterruptWithError:(id)a4
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
  NSObject *v15;
  NSObject *v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE2C4A8]))
  {

    goto LABEL_6;
  }
  v9 = objc_msgSend(v7, "code");

  if (v9 != 302
    || (objc_msgSend(v7, "userInfo"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kCATErrorMessageNameKey")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("CATTaskMessageProgressUpdate")),
        v11,
        v10,
        (v12 & 1) == 0))
  {
LABEL_6:
    -[CRKShareTargetBrowser studentClient](self, "studentClient");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v6)
    {
      _CRKLogGeneral_5();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CRKShareTargetBrowser client:didInterruptWithError:].cold.1(v7);

      -[CRKShareTargetBrowser tearDownStudentClient](self, "tearDownStudentClient");
    }
    else
    {
      -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
      v14 = (id)objc_claimAutoreleasedReturnValue();

      if (v14 != v6)
        goto LABEL_15;
      _CRKLogGeneral_5();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CRKShareTargetBrowser client:didInterruptWithError:].cold.2(v7);

      -[CRKShareTargetBrowser tearDownInstructorClient](self, "tearDownInstructorClient");
    }
    -[CRKShareTargetBrowser delegateDidInterruptWithError:](self, "delegateDidInterruptWithError:", v7);
  }
LABEL_15:

}

- (void)tearDownStudentClient
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[CRKShareTargetBrowser studentClient](self, "studentClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _CRKLogGeneral_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Classroom: Share target browser is tearing down studentd task client", v7, 2u);
    }

    -[CRKShareTargetBrowser shareTargetCollector](self, "shareTargetCollector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "studentTargetsDidChange:", MEMORY[0x24BDBD1A8]);

    -[CRKShareTargetBrowser studentClient](self, "studentClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKShareTargetBrowser setStudentClient:](self, "setStudentClient:", 0);
    -[CRKShareTargetBrowser invalidateClient:](self, "invalidateClient:", v6);

  }
}

- (void)tearDownInstructorClient
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _CRKLogGeneral_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_218C99000, v4, OS_LOG_TYPE_INFO, "Classroom: Share target browser is tearing down instructord task client", v7, 2u);
    }

    -[CRKShareTargetBrowser shareTargetCollector](self, "shareTargetCollector");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instructorTargetsDidChange:", MEMORY[0x24BDBD1A8]);

    -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKShareTargetBrowser setInstructorClient:](self, "setInstructorClient:", 0);
    -[CRKShareTargetBrowser invalidateClient:](self, "invalidateClient:", v6);

  }
}

- (void)invalidateClient:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "invalidate");

}

- (void)taskOperation:(id)a3 didPostNotificationWithName:(id)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a5;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("CRKShareTargetsDidChangeNotificationName")))
  {
    objc_msgSend(v15, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ShareTargets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKShareTargetBrowser makeShareTargetsWithDictionaries:taskClient:](self, "makeShareTargetsWithDictionaries:taskClient:", v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKShareTargetBrowser studentClient](self, "studentClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v12)
    {
      -[CRKShareTargetBrowser shareTargetCollector](self, "shareTargetCollector");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "studentTargetsDidChange:", v11);
    }
    else
    {
      -[CRKShareTargetBrowser instructorClient](self, "instructorClient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v13)
      {
LABEL_7:

        goto LABEL_8;
      }
      -[CRKShareTargetBrowser shareTargetCollector](self, "shareTargetCollector");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "instructorTargetsDidChange:", v11);
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)shareTargetCollector:(id)a3 didFindTargets:(id)a4
{
  -[CRKShareTargetBrowser delegateDidFindTargets:](self, "delegateDidFindTargets:", a4);
}

- (void)shareTargetCollector:(id)a3 didRemoveTargets:(id)a4
{
  -[CRKShareTargetBrowser delegateDidRemoveTargets:](self, "delegateDidRemoveTargets:", a4);
}

- (id)makeShareTargetsWithDictionaries:(id)a3 taskClient:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__CRKShareTargetBrowser_makeShareTargetsWithDictionaries_taskClient___block_invoke;
  v9[3] = &unk_24D9C8F70;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "crk_mapUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

CRKShareTarget *__69__CRKShareTargetBrowser_makeShareTargetsWithDictionaries_taskClient___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CRKShareTarget *v4;

  v3 = a2;
  v4 = -[CRKShareTarget initWithDictionary:]([CRKShareTarget alloc], "initWithDictionary:", v3);

  -[CRKShareTarget setTaskClient:](v4, "setTaskClient:", *(_QWORD *)(a1 + 32));
  return v4;
}

- (BOOL)isClientInvalidationError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE2C4A8]))
    v5 = objc_msgSend(v3, "code") == 503;
  else
    v5 = 0;

  return v5;
}

- (void)delegateDidInterruptWithError:(id)a3
{
  id v4;
  NSObject *mDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mDelegateQueue = self->mDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__CRKShareTargetBrowser_delegateDidInterruptWithError___block_invoke;
  v7[3] = &unk_24D9C72D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mDelegateQueue, v7);

}

void __55__CRKShareTargetBrowser_delegateDidInterruptWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "shareTargetBrowser:didInterruptWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)delegateDidFindTargets:(id)a3
{
  id v4;
  NSObject *mDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mDelegateQueue = self->mDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__CRKShareTargetBrowser_delegateDidFindTargets___block_invoke;
  v7[3] = &unk_24D9C72D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mDelegateQueue, v7);

}

void __48__CRKShareTargetBrowser_delegateDidFindTargets___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "shareTargetBrowser:didFindTargets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)delegateDidRemoveTargets:(id)a3
{
  id v4;
  NSObject *mDelegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  mDelegateQueue = self->mDelegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__CRKShareTargetBrowser_delegateDidRemoveTargets___block_invoke;
  v7[3] = &unk_24D9C72D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(mDelegateQueue, v7);

}

void __50__CRKShareTargetBrowser_delegateDidRemoveTargets___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "shareTargetBrowser:didRemoveTargets:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (CATTaskClient)studentClient
{
  return self->_studentClient;
}

- (void)setStudentClient:(id)a3
{
  objc_storeStrong((id *)&self->_studentClient, a3);
}

- (CATTaskClient)instructorClient
{
  return self->_instructorClient;
}

- (void)setInstructorClient:(id)a3
{
  objc_storeStrong((id *)&self->_instructorClient, a3);
}

- (CRKShareTargetBrowserTransportFactory)transportFactory
{
  return self->_transportFactory;
}

- (CRKShareTargetCollector)shareTargetCollector
{
  return self->_shareTargetCollector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareTargetCollector, 0);
  objc_storeStrong((id *)&self->_transportFactory, 0);
  objc_storeStrong((id *)&self->_instructorClient, 0);
  objc_storeStrong((id *)&self->_studentClient, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mDelegateQueue, 0);
}

void __42__CRKShareTargetBrowser_connectToStudentd__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Share target browser failed to fetch studentd endpoint: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)acquireStudentActivityAssertionOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Classroom: Share target browser student activity assertion failed: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)browseForStudentTargetsOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Classroom: Share target browser failed to fetch student targets: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

void __45__CRKShareTargetBrowser_connectToInstructord__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Classroom: Share target browser failed to fetch instructor transport: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)browseForInstructorTargetsOperationDidFail:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Classroom: Share target browser failed to fetch instructor targets: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)client:(void *)a1 didInterruptWithError:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Classroom: Share target browser student connection interrupted: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

- (void)client:(void *)a1 didInterruptWithError:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_218C99000, v2, v3, "Classroom: Share target browser instructor connection interrupted: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_1();
}

@end
