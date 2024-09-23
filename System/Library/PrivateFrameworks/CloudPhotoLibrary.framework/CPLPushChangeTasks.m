@implementation CPLPushChangeTasks

- (void)_commitTasks
{
  NSDictionary *tasksByType;
  NSDictionary **p_tasksByType;
  NSMutableDictionary *mutableTasksByType;
  _QWORD v6[5];

  if (self->_mutableTasksByType)
  {
    p_tasksByType = &self->_tasksByType;
    tasksByType = self->_tasksByType;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__CPLPushChangeTasks__commitTasks__block_invoke;
    v6[3] = &unk_1E60DC160;
    v6[4] = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](tasksByType, "enumerateKeysAndObjectsUsingBlock:", v6);
    objc_storeStrong((id *)p_tasksByType, self->_mutableTasksByType);
    mutableTasksByType = self->_mutableTasksByType;
    self->_mutableTasksByType = 0;

  }
}

- (id)initEmpty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLPushChangeTasks;
  return -[CPLPushChangeTasks init](&v3, sel_init);
}

- (CPLPushChangeTasks)initWithCoder:(id)a3
{
  id v4;
  CPLPushChangeTasks *v5;
  uint64_t v6;
  NSDictionary *tasksByType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPushChangeTasks;
  v5 = -[CPLPushChangeTasks init](&v9, sel_init);
  if (v5)
  {
    if (initWithCoder__onceToken_15879 != -1)
      dispatch_once(&initWithCoder__onceToken_15879, &__block_literal_global_15880);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", initWithCoder__classes, CFSTR("tasks"));
    v6 = objc_claimAutoreleasedReturnValue();
    tasksByType = v5->_tasksByType;
    v5->_tasksByType = (NSDictionary *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  -[CPLPushChangeTasks _commitTasks](self, "_commitTasks");
  objc_msgSend(v4, "encodeObject:forKey:", self->_tasksByType, CFSTR("tasks"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  -[CPLPushChangeTasks _commitTasks](self, "_commitTasks");
  v5 = -[CPLPushChangeTasks initEmpty]([CPLPushChangeTasks alloc], "initEmpty");
  v6 = -[NSDictionary copyWithZone:](self->_tasksByType, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (void)enumerateScopedTasksWithBlock:(id)a3
{
  id v4;
  NSDictionary *tasksByType;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[CPLPushChangeTasks _commitTasks](self, "_commitTasks");
  tasksByType = self->_tasksByType;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke;
  v7[3] = &unk_1E60DC1D0;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](tasksByType, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)enumerateTasksWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__CPLPushChangeTasks_enumerateTasksWithBlock___block_invoke;
  v6[3] = &unk_1E60DC1F8;
  v7 = v4;
  v5 = v4;
  -[CPLPushChangeTasks enumerateScopedTasksWithBlock:](self, "enumerateScopedTasksWithBlock:", v6);

}

- (void)addTask:(int64_t)a3 forRecordWithScopedIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *mutableTasksByType;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    mutableTasksByType = self->_mutableTasksByType;
    if (!mutableTasksByType)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_mutableTasksByType;
      self->_mutableTasksByType = v8;

      mutableTasksByType = self->_mutableTasksByType;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](mutableTasksByType, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v11, "addObject:", v6);
    }
    else
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v6, 0);
      v14 = self->_mutableTasksByType;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v11, v15);

    }
  }
  else if (!_CPLSilentLogging)
  {
    __CPLSessionOSLogDomain_15864();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      +[CPLPushChangeTasks descriptionForTaskType:](CPLPushChangeTasks, "descriptionForTaskType:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Attempting to add a push change task %{public}@ for nil identifier", buf, 0xCu);

    }
  }

}

- (BOOL)hasTasks
{
  return -[NSDictionary count](self->_tasksByType, "count")
      || -[NSMutableDictionary count](self->_mutableTasksByType, "count") != 0;
}

- (id)_descriptionFromTasksByType:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  char v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = a3;
  objc_msgSend(v3, "stringWithString:", CFSTR("<"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __50__CPLPushChangeTasks__descriptionFromTasksByType___block_invoke;
  v11 = &unk_1E60DC220;
  v13 = 1;
  v6 = v5;
  v12 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v8);

  objc_msgSend(v6, "appendString:", CFSTR(">"), v8, v9, v10, v11);
  return v6;
}

- (id)description
{
  _QWORD *p_tasksByType;
  NSUInteger v4;
  uint64_t v5;
  __CFString *v6;

  p_tasksByType = &self->_tasksByType;
  v4 = -[NSDictionary count](self->_tasksByType, "count");
  v5 = -[NSMutableDictionary count](self->_mutableTasksByType, "count");
  if (v4)
  {
    if (v5)
      -[CPLPushChangeTasks _commitTasks](self, "_commitTasks");
  }
  else
  {
    p_tasksByType = &self->_mutableTasksByType;
    if (!v5)
    {
      v6 = CFSTR("<No Tasks>");
      return v6;
    }
  }
  -[CPLPushChangeTasks _descriptionFromTasksByType:](self, "_descriptionFromTasksByType:", *p_tasksByType);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)invalidRecordScopedIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NSDictionary objectForKeyedSubscript:](self->_tasksByType, "objectForKeyedSubscript:", &unk_1E611A258);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableTasksByType, "objectForKeyedSubscript:", &unk_1E611A258);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = v3;
    }
  }
  else if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }
  v7 = v6;

  return v7;
}

- (id)invalidRecordIdentifiers
{
  void *v2;
  void *v3;

  -[CPLPushChangeTasks invalidRecordScopedIdentifiers](self, "invalidRecordScopedIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLScopedIdentifier unscopedIdentifiersFromSetOfScopedIdentifiers:](CPLScopedIdentifier, "unscopedIdentifiersFromSetOfScopedIdentifiers:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableTasksByType, 0);
  objc_storeStrong((id *)&self->_tasksByType, 0);
}

void __50__CPLPushChangeTasks__descriptionFromTasksByType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  id v11;

  v4 = *(unsigned __int8 *)(a1 + 40);
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  +[CPLPushChangeTasks descriptionForTaskType:](CPLPushChangeTasks, "descriptionForTaskType:", objc_msgSend(a2, "integerValue"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v4)
    v10 = CFSTR("%@: (%@)");
  else
    v10 = CFSTR(",%@: (%@)");
  objc_msgSend(v5, "appendFormat:", v10, v11, v8);

}

void __46__CPLPushChangeTasks_enumerateTasksWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, a2, v7, a4);

}

void __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a3;
  v8 = objc_msgSend(a2, "integerValue");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke_2;
  v9[3] = &unk_1E60DC1A8;
  v10 = *(id *)(a1 + 32);
  v11 = v8;
  v12 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

uint64_t __52__CPLPushChangeTasks_enumerateScopedTasksWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a3)
    **(_BYTE **)(a1 + 48) = 1;
  return result;
}

void __36__CPLPushChangeTasks_initWithCoder___block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v6 = (void *)initWithCoder__classes;
  initWithCoder__classes = v5;

}

void __34__CPLPushChangeTasks__commitTasks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "unionSet:", v6);
  }
  else
  {
    v9 = objc_msgSend(v6, "mutableCopy");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v9, v10);
    v6 = (id)v9;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)descriptionForTaskType:(int64_t)a3
{
  if ((unint64_t)a3 < 0xA)
    return off_1E60DC290[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("??(%ld)"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
