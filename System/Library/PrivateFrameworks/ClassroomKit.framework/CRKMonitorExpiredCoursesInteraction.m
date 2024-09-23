@implementation CRKMonitorExpiredCoursesInteraction

- (CRKMonitorExpiredCoursesInteraction)initWithStudentDaemonProxy:(id)a3 enrollmentController:(id)a4 expiredCoursesInteractionDelegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  CRKMonitorExpiredCoursesInteraction *v13;
  CRKMonitorExpiredCoursesInteraction *v14;
  uint64_t v15;
  NSMutableSet *expiredCoursesToPresent;
  uint64_t v17;
  CATSerialOperationQueue *serialOperationQueue;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMonitorExpiredCoursesInteraction.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enrollmentController"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMonitorExpiredCoursesInteraction.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("studentDaemonProxy"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMonitorExpiredCoursesInteraction.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expiredCoursesInteractiondelegate"));

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)CRKMonitorExpiredCoursesInteraction;
  v13 = -[CRKMonitorExpiredCoursesInteraction init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_studentDaemonProxy, a3);
    objc_storeStrong((id *)&v14->_enrollmentController, a4);
    objc_storeStrong((id *)&v14->_expiredCoursesInteractionDelegate, a5);
    v15 = objc_opt_new();
    expiredCoursesToPresent = v14->_expiredCoursesToPresent;
    v14->_expiredCoursesToPresent = (NSMutableSet *)v15;

    v17 = objc_opt_new();
    serialOperationQueue = v14->_serialOperationQueue;
    v14->_serialOperationQueue = (CATSerialOperationQueue *)v17;

  }
  return v14;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKMonitorExpiredCoursesInteraction;
  -[CRKMonitorExpiredCoursesInteraction cancel](&v4, sel_cancel);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__CRKMonitorExpiredCoursesInteraction_cancel__block_invoke;
  v3[3] = &unk_24D9C7020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v3);
}

void __45__CRKMonitorExpiredCoursesInteraction_cancel__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (v2[376])
    {
      objc_msgSend(v2, "enrollmentController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("courses"), CFSTR("MonitorExpirationsIt"));

      v2 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v2, "serialOperationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelAllOperations");

    v5 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endOperationWithError:", v6);

  }
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __43__CRKMonitorExpiredCoursesInteraction_main__block_invoke;
  v2[3] = &unk_24D9C7020;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v2);
}

void __43__CRKMonitorExpiredCoursesInteraction_main__block_invoke(uint64_t a1)
{
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 376) = 1;
  objc_msgSend(*(id *)(a1 + 32), "enrollmentController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("courses"), 4, CFSTR("MonitorExpirationsIt"));

}

- (void)updateWithCourses:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  v12 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMonitorExpiredCoursesInteraction.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courses"));

    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_100);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredSetUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  -[CRKMonitorExpiredCoursesInteraction expiredCoursesToPresent](self, "expiredCoursesToPresent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  if (objc_msgSend(v9, "count"))
    -[CRKMonitorExpiredCoursesInteraction beginInteractionWithExpiredCourses:](self, "beginInteractionWithExpiredCourses:", v9);

}

uint64_t __57__CRKMonitorExpiredCoursesInteraction_updateWithCourses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 1)
    v3 = objc_msgSend(v2, "isExpired");
  else
    v3 = 0;

  return v3;
}

- (void)beginInteractionWithExpiredCourses:(id)a3
{
  CRKExpiredCoursesInteraction *v5;
  void *v6;
  void *v7;
  CRKExpiredCoursesInteraction *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMonitorExpiredCoursesInteraction.m"), 106, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courses"));

  }
  v5 = [CRKExpiredCoursesInteraction alloc];
  -[CRKMonitorExpiredCoursesInteraction studentDaemonProxy](self, "studentDaemonProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKMonitorExpiredCoursesInteraction expiredCoursesInteractionDelegate](self, "expiredCoursesInteractionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CRKExpiredCoursesInteraction initWithStudentDaemonProxy:delegate:courses:](v5, "initWithStudentDaemonProxy:delegate:courses:", v6, v7, v12);

  -[CRKExpiredCoursesInteraction addTarget:selector:forOperationEvents:](v8, "addTarget:selector:forOperationEvents:", self, sel_expiredCoursesInteractionDidFinish_, 6);
  -[CRKMonitorExpiredCoursesInteraction expiredCoursesToPresent](self, "expiredCoursesToPresent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unionSet:", v12);

  -[CRKMonitorExpiredCoursesInteraction serialOperationQueue](self, "serialOperationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", v8);

}

- (void)expiredCoursesInteractionDidFinish:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKMonitorExpiredCoursesInteraction.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("expiredCoursesInteraction"));

  }
  if (-[CRKMonitorExpiredCoursesInteraction isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (_CRKLogGeneral_onceToken_32 != -1)
        dispatch_once(&_CRKLogGeneral_onceToken_32, &__block_literal_global_67);
      v7 = (void *)_CRKLogGeneral_logObj_32;
      if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_32, OS_LOG_TYPE_ERROR))
        -[CRKMonitorExpiredCoursesInteraction expiredCoursesInteractionDidFinish:].cold.1(v7, v5);
    }
    -[CRKMonitorExpiredCoursesInteraction expiredCoursesToPresent](self, "expiredCoursesToPresent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "courses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "minusSet:", v9);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  if (a6 == CFSTR("MonitorExpirationsIt"))
  {
    -[CRKMonitorExpiredCoursesInteraction enrollmentController](self, "enrollmentController");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v11)
    {
      v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("courses"));

      if (v13)
      {
        if (-[CRKMonitorExpiredCoursesInteraction isExecuting](self, "isExecuting"))
        {
          -[CRKMonitorExpiredCoursesInteraction enrollmentController](self, "enrollmentController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "courses");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[CRKMonitorExpiredCoursesInteraction enrollmentController](self, "enrollmentController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "courses");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[CRKMonitorExpiredCoursesInteraction updateWithCourses:](self, "updateWithCourses:", v17);

          }
        }
      }
    }
    else
    {

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)CRKMonitorExpiredCoursesInteraction;
    -[CRKMonitorExpiredCoursesInteraction observeValueForKeyPath:ofObject:change:context:](&v18, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }

}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (CRKExpiredCoursesInteractionDelegate)expiredCoursesInteractionDelegate
{
  return self->_expiredCoursesInteractionDelegate;
}

- (CRKCourseEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (NSMutableSet)expiredCoursesToPresent
{
  return self->_expiredCoursesToPresent;
}

- (CATSerialOperationQueue)serialOperationQueue
{
  return self->_serialOperationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialOperationQueue, 0);
  objc_storeStrong((id *)&self->_expiredCoursesToPresent, 0);
  objc_storeStrong((id *)&self->_enrollmentController, 0);
  objc_storeStrong((id *)&self->_expiredCoursesInteractionDelegate, 0);
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
}

- (void)expiredCoursesInteractionDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Failed to complete expired course interaction: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
