@implementation SFModelTaskSet

- (SFModelTaskSet)init
{
  SFModelTaskSet *v2;
  uint64_t v3;
  NSSet *tasks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFModelTaskSet;
  v2 = -[SFModelTaskSet init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    tasks = v2->_tasks;
    v2->_tasks = (NSSet *)v3;

  }
  return v2;
}

- (SFModelTaskSet)initWithTasks:(id)a3
{
  id v4;
  SFModelTaskSet *v5;
  NSSet *v6;
  NSSet *tasks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFModelTaskSet;
  v5 = -[SFModelTaskSet init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSSet *)v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    tasks = v5->_tasks;
    v5->_tasks = v6;

  }
  return v5;
}

- (id)tasks
{
  return self->_tasks;
}

- (unint64_t)count
{
  return -[NSSet count](self->_tasks, "count");
}

- (BOOL)containsTask:(unint64_t)a3
{
  NSSet *tasks;
  const __CFString *v4;

  tasks = self->_tasks;
  if (a3 > 0xA)
    v4 = CFSTR("Invalid Task");
  else
    v4 = off_1E64854C0[a3];
  return -[NSSet containsObject:](tasks, "containsObject:", v4);
}

- (BOOL)supportsAssistant
{
  return -[SFModelTaskSet containsTask:](self, "containsTask:", 5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
}

+ (id)set
{
  return objc_alloc_init(SFModelTaskSet);
}

+ (id)taskSetWithAssetPath:(id)a3
{
  id v3;
  void *v4;
  SFModelTaskSet *v5;
  void *v6;
  SFModelTaskSet *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SFModelTaskSet modelInfoWithAssetPath:taskHint:](SFModelTaskSet, "modelInfoWithAssetPath:taskHint:", v3, 1001);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [SFModelTaskSet alloc];
    objc_msgSend(v4, "tasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SFModelTaskSet initWithTasks:](v5, "initWithTasks:", v6);

  }
  else
  {
    v8 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "+[SFModelTaskSet taskSetWithAssetPath:]";
      v12 = 2112;
      v13 = v3;
      _os_log_error_impl(&dword_1B2494000, v8, OS_LOG_TYPE_ERROR, "%s Unable evaluate model at path: %@", (uint8_t *)&v10, 0x16u);
    }
    +[SFModelTaskSet set](SFModelTaskSet, "set");
    v7 = (SFModelTaskSet *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)modelInfoWithAssetPath:(id)a3 taskHint:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SFEntitledAssetManager jsonFilenameForAssetType:](SFEntitledAssetManager, "jsonFilenameForAssetType:", SFEntitledAssetTypeForTaskHint(a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F168]), "initWithConfig:", v7);
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v12 = SFLogFramework;
      if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
      {
        v14 = 136315394;
        v15 = "+[SFModelTaskSet modelInfoWithAssetPath:taskHint:]";
        v16 = 2112;
        v17 = v7;
        _os_log_error_impl(&dword_1B2494000, v12, OS_LOG_TYPE_ERROR, "%s Unable to read file at path: %@", (uint8_t *)&v14, 0x16u);
      }
    }

  }
  else
  {
    v11 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "+[SFModelTaskSet modelInfoWithAssetPath:taskHint:]";
      _os_log_error_impl(&dword_1B2494000, v11, OS_LOG_TYPE_ERROR, "%s Path cannot be nil.", (uint8_t *)&v14, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)modelInfoVersionWithAssetPath:(id)a3 taskHint:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[SFModelTaskSet modelInfoWithAssetPath:taskHint:](SFModelTaskSet, "modelInfoWithAssetPath:taskHint:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "+[SFModelTaskSet modelInfoVersionWithAssetPath:taskHint:]";
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1B2494000, v9, OS_LOG_TYPE_ERROR, "%s Unable evaluate model at path: %@", (uint8_t *)&v11, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

@end
