@implementation MFConditionLock

- (void)unlock
{
  objc_super v3;

  _mfUnregisterLockOnThisThread(self);
  v3.receiver = self;
  v3.super_class = (Class)MFConditionLock;
  -[NSConditionLock unlock](&v3, sel_unlock);
}

- (BOOL)lockWhenCondition:(int64_t)a3 beforeDate:(id)a4
{
  id delegate;
  _BOOL4 v8;
  objc_super v10;

  delegate = self->_delegate;
  if (delegate)
    objc_msgSend(delegate, "_mf_checkToAllowLock:", self);
  v10.receiver = self;
  v10.super_class = (Class)MFConditionLock;
  v8 = -[NSConditionLock lockWhenCondition:beforeDate:](&v10, sel_lockWhenCondition_beforeDate_, a3, a4);
  if (v8)
    _mfRegisterLockOnThisThread(self);
  return v8;
}

- (void)unlockWithCondition:(int64_t)a3
{
  objc_super v5;

  _mfUnregisterLockOnThisThread(self);
  v5.receiver = self;
  v5.super_class = (Class)MFConditionLock;
  -[NSConditionLock unlockWithCondition:](&v5, sel_unlockWithCondition_, a3);
}

- (MFConditionLock)initWithName:(id)a3 condition:(int64_t)a4 andDelegate:(id)a5
{
  MFConditionLock *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MFConditionLock;
  v7 = -[NSConditionLock initWithCondition:](&v9, sel_initWithCondition_, a4);
  if (v7)
  {
    v7->_name = (NSString *)objc_msgSend(a3, "copy");
    v7->_delegate = a5;
  }
  return v7;
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
  v8.super_class = (Class)MFConditionLock;
  v6 = -[NSConditionLock lockBeforeDate:](&v8, sel_lockBeforeDate_, a3);
  if (v6)
    _mfRegisterLockOnThisThread(self);
  return v6;
}

+ (void)initialize
{
  pthread_once(&__threadLockRelationsControl, (void (*)(void))_setupThreadLockRelationsDictionary);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFConditionLock;
  -[NSConditionLock dealloc](&v3, sel_dealloc);
}

- (MFConditionLock)init
{
  __assert_rtn("-[MFConditionLock init]", "NSLockAdditions.m", 1064, "0");
}

- (MFConditionLock)initWithName:(id)a3 andDelegate:(id)a4
{
  return -[MFConditionLock initWithName:condition:andDelegate:](self, "initWithName:condition:andDelegate:", a3, 0, a4);
}

- (id)description
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v6.receiver = self;
  v6.super_class = (Class)MFConditionLock;
  v4 = -[NSConditionLock description](&v6, sel_description);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ Delegate: <%@: %p>"), v4, self->_name, objc_opt_class(), self->_delegate);
}

@end
