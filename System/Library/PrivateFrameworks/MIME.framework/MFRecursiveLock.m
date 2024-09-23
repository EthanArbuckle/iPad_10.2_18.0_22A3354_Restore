@implementation MFRecursiveLock

- (void)lock
{
  id delegate;
  objc_super v4;

  delegate = self->_delegate;
  if (delegate)
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  v4.receiver = self;
  v4.super_class = (Class)MFRecursiveLock;
  -[MFRecursiveLock lock](&v4, sel_lock);
  _mfRegisterLockOnThisThread(self);
}

- (MFRecursiveLock)initWithName:(id)a3 andDelegate:(id)a4
{
  MFRecursiveLock *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFRecursiveLock;
  v6 = -[MFRecursiveLock init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)objc_msgSend(a3, "copy");
    v6->_delegate = a4;
  }
  return v6;
}

- (void)unlock
{
  objc_super v3;

  _mfUnregisterLockOnThisThread(self);
  v3.receiver = self;
  v3.super_class = (Class)MFRecursiveLock;
  -[MFRecursiveLock unlock](&v3, sel_unlock);
}

+ (void)initialize
{
  pthread_once(&__threadLockRelationsControl, (void (*)(void))_setupThreadLockRelationsDictionary);
}

- (MFRecursiveLock)init
{
  -[MFRecursiveLock doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFRecursiveLock init]", "NSLockAdditions.m", 903, "0");
}

- (BOOL)tryLock
{
  id delegate;
  _BOOL4 v4;
  objc_super v6;

  delegate = self->_delegate;
  if (delegate)
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  v6.receiver = self;
  v6.super_class = (Class)MFRecursiveLock;
  v4 = -[MFRecursiveLock tryLock](&v6, sel_tryLock);
  if (v4)
    _mfRegisterLockOnThisThread(self);
  return v4;
}

- (BOOL)lockBeforeDate:(id)a3
{
  id delegate;
  _BOOL4 v6;
  objc_super v8;

  delegate = self->_delegate;
  if (delegate)
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  v8.receiver = self;
  v8.super_class = (Class)MFRecursiveLock;
  v6 = -[MFRecursiveLock lockBeforeDate:](&v8, sel_lockBeforeDate_, a3);
  if (v6)
    _mfRegisterLockOnThisThread(self);
  return v6;
}

- (id)description
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)MFRecursiveLock;
  v4 = -[MFRecursiveLock description](&v6, sel_description);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ Delegate: <%@: %p>"), v4, self->_name, objc_opt_class(), self->_delegate);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFRecursiveLock;
  -[MFRecursiveLock dealloc](&v3, sel_dealloc);
}

@end
