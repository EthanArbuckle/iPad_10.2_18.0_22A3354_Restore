@implementation CRKFetchObservingInstructorsByCourseOperation

- (CRKFetchObservingInstructorsByCourseOperation)initWithRequestPerformer:(id)a3
{
  id v5;
  CRKFetchObservingInstructorsByCourseOperation *v6;
  CRKFetchObservingInstructorsByCourseOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchObservingInstructorsByCourseOperation;
  v6 = -[CRKFetchObservingInstructorsByCourseOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_requestPerformer, a3);

  return v7;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  _QWORD block[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRKFetchObservingInstructorsByCourseOperation;
  -[CRKFetchObservingInstructorsByCourseOperation cancel](&v4, sel_cancel);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CRKFetchObservingInstructorsByCourseOperation_cancel__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __55__CRKFetchObservingInstructorsByCourseOperation_cancel__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchCoursesOperation");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "fetchInstructorsOperation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancel");

    v4 = *(void **)(a1 + 32);
    CATErrorWithCodeAndUserInfo();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endOperationWithError:", v5);

  }
}

- (void)main
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[CRKFetchObservingInstructorsByCourseOperation requestPerformer](self, "requestPerformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    objc_msgSend(v4, "operationForRequest:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchObservingInstructorsByCourseOperation setFetchCoursesOperation:](self, "setFetchCoursesOperation:", v6);

    -[CRKFetchObservingInstructorsByCourseOperation requestPerformer](self, "requestPerformer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "operationForRequest:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchObservingInstructorsByCourseOperation setFetchInstructorsOperation:](self, "setFetchInstructorsOperation:", v9);

    v17 = (id)objc_opt_new();
    -[CRKFetchObservingInstructorsByCourseOperation fetchCoursesOperation](self, "fetchCoursesOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addDependency:", v10);

    -[CRKFetchObservingInstructorsByCourseOperation fetchInstructorsOperation](self, "fetchInstructorsOperation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addDependency:", v11);

    objc_msgSend(v17, "addTarget:selector:forOperationEvents:", self, sel_operationsDidComplete_, 6);
    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchObservingInstructorsByCourseOperation fetchCoursesOperation](self, "fetchCoursesOperation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addOperation:", v13);

    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchObservingInstructorsByCourseOperation fetchInstructorsOperation](self, "fetchInstructorsOperation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addOperation:", v15);

    objc_msgSend(MEMORY[0x24BE2C758], "crk_backgroundQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addOperation:", v17);

  }
  else
  {
    -[CRKFetchObservingInstructorsByCourseOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)operationsDidComplete:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  id v24;

  if (-[CRKFetchObservingInstructorsByCourseOperation isExecuting](self, "isExecuting", a3))
  {
    -[CRKFetchObservingInstructorsByCourseOperation fetchCoursesOperation](self, "fetchCoursesOperation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CRKFetchObservingInstructorsByCourseOperation fetchCoursesOperation](self, "fetchCoursesOperation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CRKFetchObservingInstructorsByCourseOperation fetchInstructorsOperation](self, "fetchInstructorsOperation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "error");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[CRKFetchObservingInstructorsByCourseOperation fetchCoursesOperation](self, "fetchCoursesOperation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resultObject");
        v24 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKFetchObservingInstructorsByCourseOperation operationsDidComplete:]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (objc_class *)objc_opt_class();
          NSStringFromClass(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("CRKFetchObservingInstructorsByCourseOperation.m"), 99, CFSTR("expected %@, got %@"), v15, v17);

        }
        -[CRKFetchObservingInstructorsByCourseOperation fetchInstructorsOperation](self, "fetchInstructorsOperation");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resultObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[CRKFetchObservingInstructorsByCourseOperation operationsDidComplete:]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("CRKFetchObservingInstructorsByCourseOperation.m"), 100, CFSTR("expected %@, got %@"), v21, v23);

        }
        -[CRKFetchObservingInstructorsByCourseOperation compileResultsWithFetchCoursesResult:fetchScreenObserversResult:](self, "compileResultsWithFetchCoursesResult:fetchScreenObserversResult:", v24, v9);
        goto LABEL_8;
      }
      -[CRKFetchObservingInstructorsByCourseOperation fetchInstructorsOperation](self, "fetchInstructorsOperation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v24 = v6;
    objc_msgSend(v6, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKFetchObservingInstructorsByCourseOperation endOperationWithError:](self, "endOperationWithError:", v9);
LABEL_8:

  }
}

- (void)compileResultsWithFetchCoursesResult:(id)a3 fetchScreenObserversResult:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKFetchObservingInstructorsByCourseOperation.m"), 105, CFSTR("%@ must be called from the main thread"), v13);

  }
  objc_msgSend(v7, "courses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_2;
  v14[3] = &unk_24D9C87E0;
  v15 = v8;
  v10 = v8;
  objc_msgSend(v9, "crk_dictionaryUsingKeyGenerator:valueGenerator:", &__block_literal_global_45, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKFetchObservingInstructorsByCourseOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v11);
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  id (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "instructors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_3;
  v18[3] = &unk_24D9C8750;
  v6 = v3;
  v19 = v6;
  objc_msgSend(v4, "crk_mapUsingBlock:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v5;
  v14 = 3221225472;
  v15 = __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_4;
  v16 = &unk_24D9C8778;
  v17 = v6;
  v8 = v6;
  objc_msgSend(v7, "crk_mapUsingBlock:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", &__block_literal_global_22, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
    v11 = v10;
  else
    v11 = 0;

  return v11;
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (!objc_msgSend(v3, "isObservingStudentScreen"))
    goto LABEL_4;
  objc_msgSend(v3, "sessionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "courseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    objc_msgSend(v3, "userIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:
    v8 = 0;
  }

  return v8;
}

id __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "instructorsByIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __113__CRKFetchObservingInstructorsByCourseOperation_compileResultsWithFetchCoursesResult_fetchScreenObserversResult___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "userIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (CRKRequestPerformingProtocol)requestPerformer
{
  return self->_requestPerformer;
}

- (CATRemoteTaskOperation)fetchInstructorsOperation
{
  return self->_fetchInstructorsOperation;
}

- (void)setFetchInstructorsOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchInstructorsOperation, a3);
}

- (CATRemoteTaskOperation)fetchCoursesOperation
{
  return self->_fetchCoursesOperation;
}

- (void)setFetchCoursesOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchCoursesOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchCoursesOperation, 0);
  objc_storeStrong((id *)&self->_fetchInstructorsOperation, 0);
  objc_storeStrong((id *)&self->_requestPerformer, 0);
}

@end
