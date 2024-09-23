@implementation NSSQLBlockRequestContext

- (BOOL)isWritingRequest
{
  return 1;
}

- (NSSQLBlockRequestContext)initWithBlock:(id)a3 context:(id)a4 sqlCore:(id)a5
{
  NSSQLBlockRequestContext *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSSQLBlockRequestContext;
  v6 = -[NSSQLStoreRequestContext initWithRequest:context:sqlCore:](&v8, sel_initWithRequest_context_sqlCore_, 0, a4, a5);
  if (v6)
    v6->_workBlock = (id)objc_msgSend(a3, "copy");
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_workBlock = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSSQLBlockRequestContext;
  -[NSSQLStoreRequestContext dealloc](&v3, sel_dealloc);
}

- (BOOL)executeRequestCore:(id *)a3
{
  const char *v5;

  (*((void (**)(void))self->_workBlock + 2))();
  if (a3 && *a3)
    objc_setProperty_nonatomic(self, v5, *a3, 40);
  return !self->super._exception && self->super._error == 0;
}

@end
