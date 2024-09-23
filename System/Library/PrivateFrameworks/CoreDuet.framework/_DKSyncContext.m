@implementation _DKSyncContext

+ (_DKSyncContext)new
{
  return 0;
}

- (_DKSyncContext)init
{

  return 0;
}

- (_DKSyncContext)initWithName:(id)a3
{
  id v5;
  _DKSyncContext *v6;
  _DKSyncContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKSyncContext;
  v6 = -[_DKSyncContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (_DKKnowledgeStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
