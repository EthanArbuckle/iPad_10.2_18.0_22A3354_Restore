@implementation _CPInhibitorManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sharedInstance__sharedManager;
}

- (_CPInhibitorManager)init
{
  _CPInhibitorManager *v2;
  os_log_t v3;
  OS_os_log *os_log;
  NSMutableDictionary *v5;
  NSMutableDictionary *inhibitorMap;
  NSLock *v7;
  NSLock *inhibitorMapLock;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  RBSTarget *runningBoardTarget;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSArray *runningBoardAttributes;
  NSObject *v24;
  objc_super v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint8_t buf[16];
  Class (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)_CPInhibitorManager;
  v2 = -[_CPInhibitorManager init](&v26, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.appsupport", "running-board-inhibitor");
    os_log = v2->_os_log;
    v2->_os_log = (OS_os_log *)v3;

    if (!RunningBoardServicesLibraryCore_frameworkLibrary)
    {
      *(_OWORD *)buf = xmmword_1E28819D8;
      v33 = 0;
      RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (RunningBoardServicesLibraryCore_frameworkLibrary)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      inhibitorMap = v2->_inhibitorMap;
      v2->_inhibitorMap = v5;

      v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
      inhibitorMapLock = v2->_inhibitorMapLock;
      v2->_inhibitorMapLock = v7;

      v27 = 0;
      v28 = &v27;
      v29 = 0x2050000000;
      v9 = (void *)getRBSProcessHandleClass_softClass;
      v30 = getRBSProcessHandleClass_softClass;
      if (!getRBSProcessHandleClass_softClass)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        v33 = __getRBSProcessHandleClass_block_invoke;
        v34 = &unk_1E28819F8;
        v35 = &v27;
        __getRBSProcessHandleClass_block_invoke((uint64_t)buf);
        v9 = (void *)v28[3];
      }
      v10 = objc_retainAutorelease(v9);
      _Block_object_dispose(&v27, 8);
      objc_msgSend(v10, "currentProcess");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isManaged"))
      {
        v2->_isProcessRunningBoardManaged = 1;
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v12 = (void *)getRBSTargetClass_softClass;
        v30 = getRBSTargetClass_softClass;
        if (!getRBSTargetClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          v33 = __getRBSTargetClass_block_invoke;
          v34 = &unk_1E28819F8;
          v35 = &v27;
          __getRBSTargetClass_block_invoke((uint64_t)buf);
          v12 = (void *)v28[3];
        }
        v13 = objc_retainAutorelease(v12);
        _Block_object_dispose(&v27, 8);
        objc_msgSend(v13, "currentProcess");
        v14 = objc_claimAutoreleasedReturnValue();
        runningBoardTarget = v2->_runningBoardTarget;
        v2->_runningBoardTarget = (RBSTarget *)v14;

        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v16 = (void *)getRBSDomainAttributeClass_softClass;
        v30 = getRBSDomainAttributeClass_softClass;
        if (!getRBSDomainAttributeClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          v33 = __getRBSDomainAttributeClass_block_invoke;
          v34 = &unk_1E28819F8;
          v35 = &v27;
          __getRBSDomainAttributeClass_block_invoke((uint64_t)buf);
          v16 = (void *)v28[3];
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&v27, 8);
        objc_msgSend(v17, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v18;
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v19 = (void *)getRBSAcquisitionCompletionAttributeClass_softClass;
        v30 = getRBSAcquisitionCompletionAttributeClass_softClass;
        if (!getRBSAcquisitionCompletionAttributeClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          v33 = __getRBSAcquisitionCompletionAttributeClass_block_invoke;
          v34 = &unk_1E28819F8;
          v35 = &v27;
          __getRBSAcquisitionCompletionAttributeClass_block_invoke((uint64_t)buf);
          v19 = (void *)v28[3];
        }
        v20 = objc_retainAutorelease(v19);
        _Block_object_dispose(&v27, 8);
        objc_msgSend(v20, "attributeWithCompletionPolicy:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
        v22 = objc_claimAutoreleasedReturnValue();
        runningBoardAttributes = v2->_runningBoardAttributes;
        v2->_runningBoardAttributes = (NSArray *)v22;

      }
    }
    else
    {
      v24 = v2->_os_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EB0F000, v24, OS_LOG_TYPE_DEFAULT, "RunningBoardServices softlink unavailable", buf, 2u);
      }
    }
  }
  return v2;
}

- (id)startAnInhibitor
{
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (!-[_CPInhibitorManager isProcessRunningBoardManaged](self, "isProcessRunningBoardManaged"))
    return 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getRBSAssertionClass_softClass;
  v19 = getRBSAssertionClass_softClass;
  if (!getRBSAssertionClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getRBSAssertionClass_block_invoke;
    v15[3] = &unk_1E28819F8;
    v15[4] = &v16;
    __getRBSAssertionClass_block_invoke((uint64_t)v15);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v5 = [v4 alloc];
  -[_CPInhibitorManager runningBoardTarget](self, "runningBoardTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CPInhibitorManager runningBoardAttributes](self, "runningBoardAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithExplanation:target:attributes:", CFSTR("AppSupport sqlite connection lock"), v6, v7);

  v14 = 0;
  LODWORD(v7) = objc_msgSend(v8, "acquireWithError:", &v14);
  v9 = v14;
  if ((_DWORD)v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_CPInhibitorManager pushAssertion:withIdentifier:](self, "pushAssertion:withIdentifier:", v8, v11);
  }
  else
  {
    -[_CPInhibitorManager os_log](self, "os_log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_CPInhibitorManager startAnInhibitor].cold.1();

    v11 = 0;
  }

  return v11;
}

- (void)stopInhibitorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    -[_CPInhibitorManager popAssertionWithIdentifier:](self, "popAssertionWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "invalidate");
    }
    else
    {
      -[_CPInhibitorManager os_log](self, "os_log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[_CPInhibitorManager stopInhibitorWithIdentifier:].cold.1();

    }
  }

}

- (void)pushAssertion:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[_CPInhibitorManager os_log](self, "os_log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_CPInhibitorManager pushAssertion:withIdentifier:].cold.1();

  -[_CPInhibitorManager inhibitorMapLock](self, "inhibitorMapLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lock");

  -[_CPInhibitorManager inhibitorMap](self, "inhibitorMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v7, v6);

  -[_CPInhibitorManager inhibitorMapLock](self, "inhibitorMapLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlock");

}

- (id)popAssertionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[_CPInhibitorManager os_log](self, "os_log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_CPInhibitorManager popAssertionWithIdentifier:].cold.1();

  -[_CPInhibitorManager inhibitorMapLock](self, "inhibitorMapLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  -[_CPInhibitorManager inhibitorMap](self, "inhibitorMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CPInhibitorManager inhibitorMap](self, "inhibitorMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v4);

  -[_CPInhibitorManager inhibitorMapLock](self, "inhibitorMapLock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

  return v8;
}

- (OS_os_log)os_log
{
  return self->_os_log;
}

- (void)setOs_log:(id)a3
{
  objc_storeStrong((id *)&self->_os_log, a3);
}

- (NSMutableDictionary)inhibitorMap
{
  return self->_inhibitorMap;
}

- (void)setInhibitorMap:(id)a3
{
  objc_storeStrong((id *)&self->_inhibitorMap, a3);
}

- (NSLock)inhibitorMapLock
{
  return self->_inhibitorMapLock;
}

- (void)setInhibitorMapLock:(id)a3
{
  objc_storeStrong((id *)&self->_inhibitorMapLock, a3);
}

- (BOOL)isProcessRunningBoardManaged
{
  return self->_isProcessRunningBoardManaged;
}

- (void)setIsProcessRunningBoardManaged:(BOOL)a3
{
  self->_isProcessRunningBoardManaged = a3;
}

- (RBSTarget)runningBoardTarget
{
  return self->_runningBoardTarget;
}

- (void)setRunningBoardTarget:(id)a3
{
  objc_storeStrong((id *)&self->_runningBoardTarget, a3);
}

- (NSArray)runningBoardAttributes
{
  return self->_runningBoardAttributes;
}

- (void)setRunningBoardAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_runningBoardAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningBoardAttributes, 0);
  objc_storeStrong((id *)&self->_runningBoardTarget, 0);
  objc_storeStrong((id *)&self->_inhibitorMapLock, 0);
  objc_storeStrong((id *)&self->_inhibitorMap, 0);
  objc_storeStrong((id *)&self->_os_log, 0);
}

- (void)startAnInhibitor
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_18EB0F000, v0, v1, "Failed to take assertion, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)stopInhibitorWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_18EB0F000, v0, v1, "Failed to pop and invalidate assertion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)pushAssertion:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18EB0F000, v0, v1, "Push assertion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)popAssertionWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18EB0F000, v0, v1, "Pop assertion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
