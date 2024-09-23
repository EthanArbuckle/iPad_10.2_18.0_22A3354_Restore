@implementation _KSTaskScheduler

- (_KSTaskScheduler)init
{
  _KSTaskScheduler *v2;
  uint64_t v3;
  NSMutableDictionary *allTasks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_KSTaskScheduler;
  v2 = -[_KSTaskScheduler init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
    allTasks = v2->_allTasks;
    v2->_allTasks = (NSMutableDictionary *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34___KSTaskScheduler_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance__sharedManager;
}

- (void)registerTask:(id)a3
{
  id v4;
  NSMutableDictionary *allTasks;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  _QWORD handler[4];
  id v12;

  v4 = a3;
  allTasks = self->_allTasks;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](allTasks, "setObject:forKey:", v4, v6);

  objc_msgSend(v4, "name");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = (void *)*MEMORY[0x24BDAC5A0];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __33___KSTaskScheduler_registerTask___block_invoke;
  handler[3] = &unk_24E2047E0;
  v12 = v4;
  v10 = v4;
  xpc_activity_register(v8, v9, handler);

}

- (void)unregisterTask:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](self->_allTasks, "removeObjectForKey:", v4);
  v5 = objc_retainAutorelease(v4);
  xpc_activity_unregister((const char *)objc_msgSend(v5, "UTF8String"));

}

- (NSMutableDictionary)allTasks
{
  return self->_allTasks;
}

- (void)setAllTasks:(id)a3
{
  objc_storeStrong((id *)&self->_allTasks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTasks, 0);
}

@end
