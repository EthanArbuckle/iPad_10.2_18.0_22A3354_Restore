@implementation __NSCFURLSessionTaskGroup

- (NSURLSessionConfiguration)_groupConfiguration
{
  return self->_groupConfiguration_ivar;
}

- (NSURLSession)_groupSession
{
  return self->_groupSession_ivar;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSCFURLSessionTaskGroup;
  -[__NSCFURLSessionTaskGroup dealloc](&v3, sel_dealloc);
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  const char *Name;

  Name = sel_getName(a3);
  NSLog(CFSTR("TaskGroup: forward %s to %@"), Name, self->_groupSession_ivar);
  return self->_groupSession_ivar;
}

- (id)dataTaskWithRequest:(id)a3
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], self);
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, a3, 16);
  return -[NSURLSession _dataTaskWithTaskForClass:](self->_groupSession_ivar, "_dataTaskWithTaskForClass:", v7);
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  _QWORD *v7;
  const char *v8;
  void *v9;
  SEL v10;

  v7 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], self);
  v9 = v7;
  if (v7)
  {
    objc_setProperty_atomic(v7, v8, a3, 16);
    objc_setProperty_atomic_copy(v9, v10, a4, 48);
  }
  return -[NSURLSession _dataTaskWithTaskForClass:](self->_groupSession_ivar, "_dataTaskWithTaskForClass:", v9);
}

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  _QWORD *v5;
  const char *v6;
  void *v7;

  v5 = -[__NSCFTaskForClass initWithGroup:]([__NSCFTaskForClass alloc], self);
  v7 = v5;
  if (v5)
    objc_setProperty_atomic(v5, v6, a3, 16);
  return -[NSURLSession _uploadTaskWithTaskForClass:](self->_groupSession_ivar, "_uploadTaskWithTaskForClass:", v7);
}

@end
