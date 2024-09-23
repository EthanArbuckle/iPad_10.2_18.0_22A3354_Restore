@implementation NSXPCStoreMessageContext

- (void)dealloc
{
  objc_super v3;

  self->_message = 0;
  self->_result = 0;

  self->_error = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSXPCStoreMessageContext;
  -[NSXPCStoreMessageContext dealloc](&v3, sel_dealloc);
}

- (id)initForMessage:(id)a3 store:(id)a4
{
  NSXPCStoreMessageContext *v6;
  NSCoreDataXPCMessage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSXPCStoreMessageContext;
  v6 = -[NSXPCStoreMessageContext init](&v9, sel_init);
  if (v6)
  {
    v7 = (NSCoreDataXPCMessage *)a3;
    v6->_store = (NSXPCStore *)a4;
    v6->_message = v7;
    v6->_result = 0;
  }
  return v6;
}

@end
