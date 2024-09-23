@implementation _DKSyncOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (BOOL)isExecuting
{
  int v2;

  v2 = atomic_load(&self->_state);
  return v2 == 1;
}

- (BOOL)isFinished
{
  int v2;

  v2 = atomic_load(&self->_state);
  if (v2 == 2)
    return 1;
  else
    return -[_DKSyncOperation isCancelled](self, "isCancelled");
}

- (_DKSyncOperation)init
{
  _DKSyncOperation *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_DKSyncOperation;
  result = -[_DKSyncOperation init](&v3, sel_init);
  if (result)
    atomic_store(0, &result->_state);
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)_DKSyncOperation;
  -[_DKSyncOperation dealloc](&v2, sel_dealloc);
}

- (void)start
{
  void *v3;

  v3 = (void *)MEMORY[0x193FEE914](self, a2);
  if ((-[_DKSyncOperation isCancelled](self, "isCancelled") & 1) != 0
    || (-[_DKSyncOperation startOperation](self, "startOperation"),
        -[_DKSyncOperation main](self, "main"),
        (-[_DKSyncOperation isAsynchronous](self, "isAsynchronous") & 1) == 0))
  {
    -[_DKSyncOperation endOperation](self, "endOperation");
  }
  objc_autoreleasePoolPop(v3);
}

- (void)startOperation
{
  id v3;

  -[_DKSyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  atomic_store(1u, &self->_state);
  -[_DKSyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:userInfo:sender:", CFSTR("_DKSyncOperationStateDidChangeNotification"), 0, self);

}

- (void)endOperation
{
  id v3;

  -[_DKSyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[_DKSyncOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  atomic_store(2u, &self->_state);
  -[_DKSyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  -[_DKSyncOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  +[_CDObservationCenter sharedInstance](_CDObservationCenter, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:userInfo:sender:", CFSTR("_DKSyncOperationStateDidChangeNotification"), 0, self);

}

@end
