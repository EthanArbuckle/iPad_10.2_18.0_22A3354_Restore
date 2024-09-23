@implementation _DKSyncContextObjectFactory

+ (id)objectFactoryForClass:(Class)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a4;
  if (objectFactoryForClass_context__initialized != -1)
    dispatch_once(&objectFactoryForClass_context__initialized, &__block_literal_global_84);
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@::%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objectFactoryForClass_context__instances;
  objc_sync_enter(v11);
  objc_msgSend((id)objectFactoryForClass_context__instances, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:fabricateClass:", v6, a3);
    objc_msgSend((id)objectFactoryForClass_context__instances, "setObject:forKeyedSubscript:", v12, v10);
  }
  objc_sync_exit(v11);

  return v12;
}

- (_DKSyncContextObjectFactory)initWithContext:(id)a3 fabricateClass:(Class)a4
{
  id v7;
  _DKSyncContextObjectFactory *v8;
  _DKSyncContextObjectFactory *v9;
  uint64_t v10;
  NSMutableDictionary *instances;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DKSyncContextObjectFactory;
  v8 = -[_DKSyncContextObjectFactory init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_context, a3);
    objc_storeStrong((id *)&v9->_class, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v10 = objc_claimAutoreleasedReturnValue();
    instances = v9->_instances;
    v9->_instances = (NSMutableDictionary *)v10;

  }
  return v9;
}

- (id)instance
{
  void *v3;
  NSMutableDictionary *v4;
  void *v5;

  -[_DKSyncContext name](self->_context, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_instances;
  objc_sync_enter(v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_instances, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(self->_class), "initWithContext:", self->_context);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_instances, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_sync_exit(v4);

  return v5;
}

- (_DKSyncContext)context
{
  return self->_context;
}

- (Class)class
{
  return self->_class;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_class, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_instances, 0);
}

@end
