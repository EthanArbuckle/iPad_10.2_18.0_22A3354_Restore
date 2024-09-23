@implementation _CNAggregateTask

- (_CNAggregateTask)initWithName:(id)a3 tasks:(id)a4
{
  id v6;
  _CNAggregateTask *v7;
  uint64_t v8;
  NSArray *tasks;
  _CNAggregateTask *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_CNAggregateTask;
  v7 = -[CNTask initWithName:](&v12, sel_initWithName_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    tasks = v7->_tasks;
    v7->_tasks = (NSArray *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  -[CNTask name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNAggregateTask tasks](self, "tasks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNDescriptionBuilder descriptionForObject:withNamesAndObjects:](CNDescriptionBuilder, "descriptionForObject:withNamesAndObjects:", self, CFSTR("name"), v3, CFSTR("subtasks"), v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)run:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[_CNAggregateTask tasks](self, "tasks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
LABEL_3:
    v11 = 0;
    v12 = v9;
    v13 = v5;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
      v17 = v12;
      -[_CNAggregateTask runSubtask:error:](self, "runSubtask:error:", v14, &v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v17;

      if (!v5)
        break;
      ++v11;
      v12 = v9;
      v13 = v5;
      if (v8 == v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v9 = 0;
  }

  +[CNFoundationError ifResultIsNil:setOutputError:toError:](CNFoundationError, "ifResultIsNil:setOutputError:toError:", v5, a3, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)runSubtask:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (-[CNTask isCancelled](self, "isCancelled"))
  {
    +[CNFoundationError userCanceledError](CNFoundationError, "userCanceledError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (a4)
      *a4 = objc_retainAutorelease(v7);

    v9 = 0;
  }
  else
  {
    objc_msgSend(v6, "run:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)cancel
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNAggregateTask;
  v3 = -[CNTask cancel](&v5, sel_cancel);
  if (v3)
    -[_CNAggregateTask cancelSubtasks](self, "cancelSubtasks");
  return v3;
}

- (void)cancelSubtasks
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_CNAggregateTask tasks](self, "tasks", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSArray)tasks
{
  return self->_tasks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end
