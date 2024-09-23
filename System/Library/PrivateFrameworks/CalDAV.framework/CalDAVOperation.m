@implementation CalDAVOperation

- (CalDAVOperation)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVOperation.m"), 23, CFSTR("You must call initWithPrincipal:"));

  return 0;
}

- (CalDAVOperation)initWithPrincipal:(id)a3
{
  id v5;
  void *v6;
  CalDAVOperation *v7;
  NSMutableSet *v8;
  NSMutableSet *outstandingTaskGroups;
  objc_super v11;

  v5 = a3;
  objc_msgSend(v5, "taskManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CalDAVOperation;
  v7 = -[CoreDAVTaskGroup initWithAccountInfoProvider:taskManager:](&v11, sel_initWithAccountInfoProvider_taskManager_, v5, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_principal, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    outstandingTaskGroups = v7->_outstandingTaskGroups;
    v7->_outstandingTaskGroups = v8;

  }
  return v7;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[NSMutableSet count](self->_outstandingTaskGroups, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalDAVOperation.m"), 37, CFSTR("We should never finish a task group with an existing task group.  I have %@"), self->_outstandingTaskGroups);

  }
  v5.receiver = self;
  v5.super_class = (Class)CalDAVOperation;
  -[CoreDAVTaskGroup dealloc](&v5, sel_dealloc);
}

- (void)_tearDownAllTaskGroupsWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  if (!self->_isCancellingTaskGroups)
  {
    self->_isCancellingTaskGroups = 1;
    v5 = (void *)-[NSMutableSet copy](self->_outstandingTaskGroups, "copy");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          v4[2](v4, v11);
          objc_msgSend(v11, "setDelegate:", 0, (_QWORD)v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)cancelTaskGroup
{
  objc_super v3;

  -[CalDAVOperation _tearDownAllTaskGroupsWithBlock:](self, "_tearDownAllTaskGroupsWithBlock:", &__block_literal_global_2);
  v3.receiver = self;
  v3.super_class = (Class)CalDAVOperation;
  -[CoreDAVTaskGroup cancelTaskGroup](&v3, sel_cancelTaskGroup);
}

uint64_t __34__CalDAVOperation_cancelTaskGroup__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancelTaskGroup");
}

- (void)bailWithError:(id)a3
{
  id v4;
  id v5;
  objc_super v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__CalDAVOperation_bailWithError___block_invoke;
  v7[3] = &unk_24C1FB3B0;
  v8 = v4;
  v5 = v4;
  -[CalDAVOperation _tearDownAllTaskGroupsWithBlock:](self, "_tearDownAllTaskGroupsWithBlock:", v7);
  v6.receiver = self;
  v6.super_class = (Class)CalDAVOperation;
  -[CoreDAVTaskGroup bailWithError:](&v6, sel_bailWithError_, v5);

}

uint64_t __33__CalDAVOperation_bailWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bailWithError:", *(_QWORD *)(a1 + 32));
}

- (CalDAVPrincipal)principal
{
  return self->_principal;
}

- (void)setPrincipal:(id)a3
{
  objc_storeStrong((id *)&self->_principal, a3);
}

- (NSMutableSet)outstandingTaskGroups
{
  return self->_outstandingTaskGroups;
}

- (void)setOutstandingTaskGroups:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingTaskGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingTaskGroups, 0);
  objc_storeStrong((id *)&self->_principal, 0);
}

@end
