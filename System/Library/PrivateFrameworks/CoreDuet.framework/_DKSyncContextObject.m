@implementation _DKSyncContextObject

+ (id)new
{
  return 0;
}

- (_DKSyncContextObject)init
{

  return 0;
}

- (_DKSyncContextObject)initWithContext:(id)a3
{
  id v5;
  _DKSyncContextObject *v6;
  _DKSyncContextObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DKSyncContextObject;
  v6 = -[_DKSyncContextObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (_DKSyncContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
