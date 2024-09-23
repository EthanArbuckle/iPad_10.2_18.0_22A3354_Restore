@implementation CRKExpiredCoursesInteraction

- (CRKExpiredCoursesInteraction)initWithStudentDaemonProxy:(id)a3 delegate:(id)a4 courses:(id)a5
{
  id v10;
  id v11;
  id v12;
  CRKExpiredCoursesInteraction *v13;
  CRKExpiredCoursesInteraction *v14;
  uint64_t v15;
  NSSet *courses;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCoursesInteraction.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCoursesInteraction.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("studentDaemonProxy"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCoursesInteraction.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courses"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)CRKExpiredCoursesInteraction;
  v13 = -[CRKExpiredCoursesInteraction init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_studentDaemonProxy, a3);
    objc_storeStrong((id *)&v14->_delegate, a4);
    v15 = objc_msgSend(v12, "copy");
    courses = v14->_courses;
    v14->_courses = (NSSet *)v15;

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
  v4.super_class = (Class)CRKExpiredCoursesInteraction;
  -[CRKExpiredCoursesInteraction cancel](&v4, sel_cancel);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__CRKExpiredCoursesInteraction_cancel__block_invoke;
  v3[3] = &unk_24D9C7020;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v3);
}

void __38__CRKExpiredCoursesInteraction_cancel__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 376), "cancel");
    v2 = *(_BYTE **)(a1 + 32);
    if (v2[384])
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "interactionNoLongerWantsToPromptCourseExpiration:", *(_QWORD *)(a1 + 32));

      v2 = *(_BYTE **)(a1 + 32);
    }
    CATErrorWithCodeAndUserInfo();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

- (void)main
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__CRKExpiredCoursesInteraction_main__block_invoke;
  v2[3] = &unk_24D9C7020;
  v2[4] = self;
  objc_msgSend(MEMORY[0x24BDBCF18], "cat_performBlockOnMainRunLoop:", v2);
}

void __36__CRKExpiredCoursesInteraction_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "courses");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_48);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "count");
    v6 = *(_BYTE **)(a1 + 32);
    if (v5)
    {
      v6[384] = 1;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __36__CRKExpiredCoursesInteraction_main__block_invoke_3;
      v9[3] = &unk_24D9C72D0;
      v9[4] = v8;
      v10 = v4;
      objc_msgSend(v7, "interaction:willRemoveExpiredCourses:acknowledgementHandler:", v8, v10, v9);

    }
    else
    {
      objc_msgSend(v6, "endOperationWithResultObject:", 0);
    }

  }
}

uint64_t __36__CRKExpiredCoursesInteraction_main__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "type") == 1)
    v3 = objc_msgSend(v2, "mustRequestUnenroll") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __36__CRKExpiredCoursesInteraction_main__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 384) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "removeCourses:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)removeCourses:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  CATRemoteTaskOperation *v8;
  CATRemoteTaskOperation *mLeaveControlGroupsOperation;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCoursesInteraction.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("courses"));

  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v12, "crk_mapUsingBlock:", &__block_literal_global_17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupIdentifiers:", v6);

  -[CRKExpiredCoursesInteraction studentDaemonProxy](self, "studentDaemonProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "operationForRequest:", v5);
  v8 = (CATRemoteTaskOperation *)objc_claimAutoreleasedReturnValue();
  mLeaveControlGroupsOperation = self->mLeaveControlGroupsOperation;
  self->mLeaveControlGroupsOperation = v8;

  -[CATRemoteTaskOperation addTarget:selector:forOperationEvents:](self->mLeaveControlGroupsOperation, "addTarget:selector:forOperationEvents:", self, sel_leaveControlGroupsOperationDidFinish_, 6);
  objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addOperation:", self->mLeaveControlGroupsOperation);

}

uint64_t __46__CRKExpiredCoursesInteraction_removeCourses___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "courseIdentifier");
}

- (void)leaveControlGroupsOperationDidFinish:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCoursesInteraction.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("leaveControlGroupsOperation"));

  }
  if (-[CRKExpiredCoursesInteraction isExecuting](self, "isExecuting"))
  {
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      if (_CRKLogGeneral_onceToken_11 != -1)
        dispatch_once(&_CRKLogGeneral_onceToken_11, &__block_literal_global_55);
      v7 = (void *)_CRKLogGeneral_logObj_11;
      if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_11, OS_LOG_TYPE_ERROR))
        -[CRKExpiredCoursesInteraction leaveControlGroupsOperationDidFinish:].cold.1(v7, v5);
      objc_msgSend(v5, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKExpiredCoursesInteraction endOperationWithError:](self, "endOperationWithError:", v8);

      -[CRKExpiredCoursesInteraction delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "interaction:didEncounterError:", self, v10);

    }
    else
    {
      -[CRKExpiredCoursesInteraction endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    }
  }

}

- (NSSet)courses
{
  return self->_courses;
}

- (CRKExpiredCoursesInteractionDelegate)delegate
{
  return self->_delegate;
}

- (CRKRequestPerformingProtocol)studentDaemonProxy
{
  return self->_studentDaemonProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentDaemonProxy, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_courses, 0);
  objc_storeStrong((id *)&self->mLeaveControlGroupsOperation, 0);
}

+ (id)new
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("CRKExpiredCoursesInteraction.m"), 137, CFSTR("%@ is unavailable for %@"), v5, a1);

  return 0;
}

- (CRKExpiredCoursesInteraction)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKExpiredCoursesInteraction.m"), 142, CFSTR("%@ is unavailable for %@"), v5, self);

  return 0;
}

- (void)leaveControlGroupsOperationDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_218C99000, v3, OS_LOG_TYPE_ERROR, "Failed to remove expired courses: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
