@implementation _NSProgressProxy

- (id)fileURL
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressFileURLKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileTotalCount
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressFileTotalCountKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileCompletedCount
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressFileCompletedCountKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)_NSProgressProxy;
  -[NSProgress dealloc](&v3, sel_dealloc);
}

- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4
{
  __CFRunLoop *Main;
  const void *v8;
  __CFRunLoop *v9;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1E0C9B270];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51___NSProgressProxy__setRemoteUserInfoValue_forKey___block_invoke;
  v10[3] = &unk_1E0F51588;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  CFRunLoopPerformBlock(Main, v8, v10);
  v9 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v9);
}

- (void)_invokeUnpublishingHandler
{
  __CFRunLoop *Main;
  const void *v4;
  __CFRunLoop *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  Main = CFRunLoopGetMain();
  v4 = (const void *)*MEMORY[0x1E0C9B270];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46___NSProgressProxy__invokeUnpublishingHandler__block_invoke;
  v6[3] = &unk_1E0F4D2D8;
  v6[4] = self;
  CFRunLoopPerformBlock(Main, v4, v6);
  v5 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v5);
}

- (void)_invokePublishingHandler:(id)a3
{
  __CFRunLoop *Main;
  const void *v6;
  __CFRunLoop *v7;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  Main = CFRunLoopGetMain();
  v6 = (const void *)*MEMORY[0x1E0C9B270];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45___NSProgressProxy__invokePublishingHandler___block_invoke;
  block[3] = &unk_1E0F4E060;
  block[4] = self;
  block[5] = a3;
  CFRunLoopPerformBlock(Main, v6, block);
  v7 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v7);
}

- (id)_initWithForwarder:(id)a3 values:(id)a4 isOld:(BOOL)a5
{
  _QWORD *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_NSProgressProxy;
  v7 = -[NSProgress _initWithValues:](&v9, sel__initWithValues_, a4);
  if (v7)
  {
    v7[15] = a3;
    *((_BYTE *)v7 + 128) = a5;
  }
  return v7;
}

- (void)_setRemoteValues:(id)a3 forKeys:(id)a4
{
  __CFRunLoop *Main;
  const void *v8;
  __CFRunLoop *v9;
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  Main = CFRunLoopGetMain();
  v8 = (const void *)*MEMORY[0x1E0C9B270];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45___NSProgressProxy__setRemoteValues_forKeys___block_invoke;
  v10[3] = &unk_1E0F51588;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = self;
  CFRunLoopPerformBlock(Main, v8, v10);
  v9 = CFRunLoopGetMain();
  CFRunLoopWakeUp(v9);
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't make an NSProgress published by another process the current one."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)resignCurrent
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't make an NSProgress published by another process the current one."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v2);
}

- (void)setTotalUnitCount:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setLocalizedDescription:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setCancellable:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setPausable:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setCancellationHandler:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setPausingHandler:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setPrioritizable:(BOOL)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setPrioritizationHandler:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setUserInfoObject:(id)a3 forKey:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v4);
}

- (void)setKind:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setEstimatedTimeRemaining:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setThroughput:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setFileOperationKind:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setFileURL:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setFileTotalCount:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setFileCompletedCount:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setByteTotalCount:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (void)setByteCompletedCount:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't change an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v3);
}

- (id)estimatedTimeRemaining
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressEstimatedTimeRemainingKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)throughput
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressThroughputKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)fileOperationKind
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressFileOperationKindKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)byteTotalCount
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressByteTotalCountKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (id)byteCompletedCount
{
  id v3;

  -[NSLock lock](self->super._lock, "lock");
  v3 = -[NSOwnedDictionaryProxy objectForKey:](self->super._userInfoProxy, "objectForKey:", CFSTR("NSProgressByteCompletedCountKey"));
  -[NSLock unlock](self->super._lock, "unlock");
  return v3;
}

- (void)publish
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[NSProgress %@]: you can't republish an NSProgress published by another process."), NSStringFromSelector(a2)), 0);
  objc_exception_throw(v2);
}

- (void)cancel
{
  -[NSProgressPublisher cancel](self->_forwarder, "cancel");
}

- (void)pause
{
  -[NSProgressPublisher pause](self->_forwarder, "pause");
}

- (void)prioritize
{
  -[NSProgressPublisher prioritize](self->_forwarder, "prioritize");
}

- (void)resume
{
  -[NSProgressPublisher resume](self->_forwarder, "resume");
}

- (void)acknowledgeWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  NSString *v5;

  v3 = a3;
  v5 = -[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier");
  if (v5)
    -[NSProgressPublisher appWithBundleID:didAcknowledgeWithSuccess:](self->_forwarder, "appWithBundleID:didAcknowledgeWithSuccess:", v5, v3);
}

- (BOOL)isOld
{
  return self->_isOld;
}

@end
