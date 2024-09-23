@implementation CRKASMTimeoutRosterProvider

- (void)dealloc
{
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  -[CRKASMTimeoutRosterProvider completionsByTimer](self, "completionsByTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMTimeoutRosterProvider.m"), 30, CFSTR("Roster provider deallocated with in-flight crud operations"));

  }
  v7.receiver = self;
  v7.super_class = (Class)CRKASMTimeoutRosterProvider;
  -[CRKASMTimeoutRosterProvider dealloc](&v7, sel_dealloc);
}

- (CRKASMTimeoutRosterProvider)initWithRosterProvider:(id)a3 timeout:(double)a4
{
  CRKASMTimeoutRosterProvider *v5;
  CRKASMTimeoutRosterProvider *v6;
  uint64_t v7;
  NSMapTable *completionsByTimer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRKASMTimeoutRosterProvider;
  v5 = -[CRKASMRosterProviderDecoratorBase initWithRosterProvider:](&v10, sel_initWithRosterProvider_, a3);
  v6 = v5;
  if (v5)
  {
    v5->_timeout = a4;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    completionsByTimer = v6->_completionsByTimer;
    v6->_completionsByTimer = (NSMapTable *)v7;

  }
  return v6;
}

- (void)createCourseWithProperties:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17F0];
  v9 = a3;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMTimeoutRosterProvider.m"), 46, CFSTR("%@ must be called from the main thread"), v14);

  }
  -[CRKASMTimeoutRosterProvider scheduleTimeoutForCompletion:](self, "scheduleTimeoutForCompletion:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__CRKASMTimeoutRosterProvider_createCourseWithProperties_completion___block_invoke;
  v15[3] = &unk_24D9C8FB8;
  v15[4] = self;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "createCourseWithProperties:completion:", v9, v15);

}

uint64_t __69__CRKASMTimeoutRosterProvider_createCourseWithProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "operationDidFinishWithTimer:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;

  v9 = a5;
  v10 = (void *)MEMORY[0x24BDD17F0];
  v11 = a4;
  v12 = a3;
  if ((objc_msgSend(v10, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMTimeoutRosterProvider.m"), 55, CFSTR("%@ must be called from the main thread"), v17);

  }
  -[CRKASMTimeoutRosterProvider scheduleTimeoutForCompletion:](self, "scheduleTimeoutForCompletion:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __80__CRKASMTimeoutRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke;
  v18[3] = &unk_24D9C8FB8;
  v18[4] = self;
  v19 = v13;
  v15 = v13;
  objc_msgSend(v14, "updateCourseWithIdentifier:properties:completion:", v12, v11, v18);

}

uint64_t __80__CRKASMTimeoutRosterProvider_updateCourseWithIdentifier_properties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "operationDidFinishWithTimer:error:", *(_QWORD *)(a1 + 40), a2);
}

- (void)removeCourseWithIdentifier:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v7 = a4;
  v8 = (void *)MEMORY[0x24BDD17F0];
  v9 = a3;
  if ((objc_msgSend(v8, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMTimeoutRosterProvider.m"), 64, CFSTR("%@ must be called from the main thread"), v14);

  }
  -[CRKASMTimeoutRosterProvider scheduleTimeoutForCompletion:](self, "scheduleTimeoutForCompletion:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMRosterProviderDecoratorBase underlyingRosterProvider](self, "underlyingRosterProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__CRKASMTimeoutRosterProvider_removeCourseWithIdentifier_completion___block_invoke;
  v15[3] = &unk_24D9C8FB8;
  v15[4] = self;
  v16 = v10;
  v12 = v10;
  objc_msgSend(v11, "removeCourseWithIdentifier:completion:", v9, v15);

}

uint64_t __69__CRKASMTimeoutRosterProvider_removeCourseWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "operationDidFinishWithTimer:error:", *(_QWORD *)(a1 + 40), a2);
}

- (id)scheduleTimeoutForCompletion:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDBCF40];
  v5 = a3;
  -[CRKASMTimeoutRosterProvider timeout](self, "timeout");
  objc_msgSend(v4, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_timeoutDidFire_, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKASMTimeoutRosterProvider completionsByTimer](self, "completionsByTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x219A226E8](v5);

  objc_msgSend(v7, "setObject:forKey:", v8, v6);
  return v6;
}

- (void)operationDidFinishWithTimer:(id)a3 error:(id)a4
{
  id v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKASMTimeoutRosterProvider.m"), 86, CFSTR("%@ must be called from the main thread"), v12);

  }
  objc_msgSend(v13, "invalidate");
  -[CRKASMTimeoutRosterProvider completionsByTimer](self, "completionsByTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v13);
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CRKASMTimeoutRosterProvider completionsByTimer](self, "completionsByTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v13);

    ((void (**)(_QWORD, id))v9)[2](v9, v7);
  }

}

- (void)timeoutDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  CRKErrorWithCodeAndUserInfo(32, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKASMTimeoutRosterProvider operationDidFinishWithTimer:error:](self, "operationDidFinishWithTimer:error:", v4, v5);

}

- (double)timeout
{
  return self->_timeout;
}

- (NSMapTable)completionsByTimer
{
  return self->_completionsByTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionsByTimer, 0);
}

@end
