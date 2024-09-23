@implementation CMPhotoProcessMonitor

uint64_t __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD v3[5];

  result = objc_msgSend(*(id *)(a1 + 32), "processMonitor");
  if (!result)
  {
    result = +[CMPhotoProcessMonitor isManagedByRunningBoard](CMPhotoProcessMonitor, "isManagedByRunningBoard");
    if ((_DWORD)result)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_2;
      v3[3] = &unk_1E53F5A58;
      v3[4] = *(_QWORD *)(a1 + 32);
      return objc_msgSend(*(id *)(a1 + 32), "setProcessMonitor:", objc_msgSend(MEMORY[0x1E0D87D90], "monitorWithConfiguration:", v3));
    }
  }
  return result;
}

- (RBSProcessMonitor)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)takeAssertionUntilTime:(unint64_t)a3 forContext:(void *)a4
{
  os_unfair_lock_s *p_lock;
  dispatch_time_t v8;
  uint64_t v9;
  int v10;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = dispatch_time(0, 30000000000);
  if (v8 <= a3)
  {
    v10 = FigSignalErrorAt();
  }
  else
  {
    -[CMPhotoProcessMonitor _takeRBSAssertionForContext:until:maxLength:](self, "_takeRBSAssertionForContext:until:maxLength:", a4, a3, v8);
    -[CMPhotoProcessMonitor _takeOSTransactionForContext:](self, "_takeOSTransactionForContext:", a4);
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3), v9);
    v10 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (NSMutableDictionary)heldAssertions
{
  return self->_heldAssertions;
}

- (void)_takeRBSAssertionForContext:(void *)a3 until:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (+[CMPhotoProcessMonitor isManagedByRunningBoard](CMPhotoProcessMonitor, "isManagedByRunningBoard", a3)&& !-[CMPhotoProcessMonitor gotRBSConnectionError](self, "gotRBSConnectionError")&& (!-[CMPhotoProcessMonitor latestAssertion](self, "latestAssertion")|| -[CMPhotoProcessMonitor assertionHeldToTime](self, "assertionHeldToTime") <= a4))
  {
    v8 = objc_alloc(MEMORY[0x1E0D87C98]);
    v9 = objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", getpid());
    v14[0] = -[CMPhotoProcessMonitor domainAttribute](self, "domainAttribute");
    v10 = (id)objc_msgSend(v8, "initWithExplanation:target:attributes:", CFSTR("CMPhoto pool cleanup timer"), v9, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1));
    if (!v10)
    {
      FigSignalErrorAt();
      return;
    }
    v11 = v10;
    v13 = 0;
    if ((objc_msgSend(v10, "acquireWithError:", &v13) & 1) != 0)
      goto LABEL_11;
    v12 = objc_msgSend(v13, "domain");
    if ((v12 != *MEMORY[0x1E0D87E20] || objc_msgSend(v13, "code") != 2) && objc_msgSend(v13, "code") == 4099)
    {
      -[CMPhotoProcessMonitor setGotRBSConnectionError:](self, "setGotRBSConnectionError:", 1);
LABEL_11:
      -[RBSAssertion invalidate](-[CMPhotoProcessMonitor latestAssertion](self, "latestAssertion"), "invalidate");
      -[CMPhotoProcessMonitor setAssertionHeldToTime:](self, "setAssertionHeldToTime:", a5);
      -[CMPhotoProcessMonitor setLatestAssertion:](self, "setLatestAssertion:", v11);
    }
  }
}

- (RBSAssertion)latestAssertion
{
  return self->_latestAssertion;
}

+ (BOOL)isManagedByRunningBoard
{
  if (isManagedByRunningBoard_onceToken != -1)
    dispatch_once(&isManagedByRunningBoard_onceToken, &__block_literal_global_11);
  return isManagedByRunningBoard_sIsManagedByRunningBoard;
}

- (BOOL)gotRBSConnectionError
{
  return self->_gotRBSConnectionError;
}

- (void)_takeOSTransactionForContext:(void *)a3
{
  uint64_t v4;
  id v5;

  if (-[CMPhotoProcessMonitor latestTransaction](self, "latestTransaction", a3))
  {
    -[CMPhotoProcessMonitor latestTransaction](self, "latestTransaction");
    os_transaction_needs_more_time();
  }
  else
  {
    v4 = os_transaction_create();
    if (v4)
    {
      v5 = (id)v4;
      -[CMPhotoProcessMonitor setLatestTransaction:](self, "setLatestTransaction:", v4);

    }
    else
    {
      FigSignalErrorAt();
    }
  }
}

- (OS_os_transaction)latestTransaction
{
  return self->_latestTransaction;
}

- (int)registerBackgroundNotificationHandlerForContext:(void *)a3 handler:(id)a4
{
  void *v7;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v9;

  -[CMPhotoProcessMonitor _createRBSMonitorIfNeeded](self, "_createRBSMonitorIfNeeded");
  v7 = (void *)objc_msgSend(a4, "copy");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = -[CMPhotoProcessMonitor backgroundNotificationBlocks](self, "backgroundNotificationBlocks");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3));
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (NSMutableDictionary)backgroundNotificationBlocks
{
  return self->_backgroundNotificationBlocks;
}

- (void)_createRBSMonitorIfNeeded
{
  OS_dispatch_queue *v3;
  _QWORD block[5];

  v3 = -[CMPhotoProcessMonitor processMonitorSyncQueue](self, "processMonitorSyncQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke;
  block[3] = &unk_1E53F5A80;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v3, block);
}

- (OS_dispatch_queue)processMonitorSyncQueue
{
  return self->_processMonitorSyncQueue;
}

- (unint64_t)assertionHeldToTime
{
  return self->_assertionHeldToTime;
}

- (void)setAssertionHeldToTime:(unint64_t)a3
{
  self->_assertionHeldToTime = a3;
}

- (RBSDomainAttribute)domainAttribute
{
  return self->_domainAttribute;
}

uint64_t __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v6[5];
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_1E53FE768);
  objc_msgSend(a2, "setStateDescriptor:", v4);
  v7[0] = objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingIdentifier:", objc_msgSend(MEMORY[0x1E0D87D70], "identifierForCurrentProcess"));
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_3;
  v6[3] = &unk_1E53F5A30;
  v6[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "setUpdateHandler:", v6);
}

CMPhotoProcessMonitor *__34__CMPhotoProcessMonitor_getShared__block_invoke()
{
  CMPhotoProcessMonitor *result;

  result = (CMPhotoProcessMonitor *)FigServer_IsServerProcess();
  if (!(_DWORD)result)
  {
    result = objc_alloc_init(CMPhotoProcessMonitor);
    getShared_sSharedMonitor = (uint64_t)result;
  }
  return result;
}

- (CMPhotoProcessMonitor)init
{
  CMPhotoProcessMonitor *v2;
  CMPhotoProcessMonitor *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  dispatch_queue_t v7;
  CMPhotoProcessMonitor *v8;
  BOOL v9;
  CMPhotoProcessMonitor *v12;
  int v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CMPhotoProcessMonitor;
  v2 = -[CMPhotoProcessMonitor init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskCanSleep"));
    v5 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = dispatch_queue_create("com.apple.coremedia.CMPhotoProcessMonitor.notifications", 0);
    v8 = (CMPhotoProcessMonitor *)v7;
    if (v4)
      v9 = v5 == 0;
    else
      v9 = 1;
    if (v9 || v6 == 0 || v7 == 0)
    {
      v14 = FigSignalErrorAt();

      v12 = 0;
      v8 = v3;
      if (!v14)
        return v3;
    }
    else
    {
      -[CMPhotoProcessMonitor setDomainAttribute:](v3, "setDomainAttribute:", v4);
      -[CMPhotoProcessMonitor setHeldAssertions:](v3, "setHeldAssertions:", v5);
      -[CMPhotoProcessMonitor setBackgroundNotificationBlocks:](v3, "setBackgroundNotificationBlocks:", v6);
      -[CMPhotoProcessMonitor setProcessMonitorSyncQueue:](v3, "setProcessMonitorSyncQueue:", v8);
      v12 = v3;
    }

    return v12;
  }
  return v3;
}

- (void)setBackgroundNotificationBlocks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (void)setProcessMonitorSyncQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void)setHeldAssertions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (void)setDomainAttribute:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

uint64_t __40__CMPhotoProcessMonitor_isForegroundApp__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "isApplication");
  isForegroundApp_sIsForeground = result;
  return result;
}

uint64_t __48__CMPhotoProcessMonitor_isManagedByRunningBoard__block_invoke()
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0D87D68], "currentProcess"), "isManaged");
  isManagedByRunningBoard_sIsManagedByRunningBoard = result;
  return result;
}

+ (BOOL)isForegroundApp
{
  if (isForegroundApp_onceToken != -1)
    dispatch_once(&isForegroundApp_onceToken, &__block_literal_global_1);
  return isForegroundApp_sIsForeground;
}

+ (id)getShared
{
  if (getShared_onceToken != -1)
    dispatch_once(&getShared_onceToken, &__block_literal_global_5);
  return (id)getShared_sSharedMonitor;
}

- (int)unregisterBackgroundNotificationForContext:(void *)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[CMPhotoProcessMonitor backgroundNotificationBlocks](self, "backgroundNotificationBlocks");
  -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3));
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (int)releaseAssertionForContext:(void *)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v6;
  dispatch_time_t v7;
  void *v8;
  _QWORD v10[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions");
  -[NSMutableDictionary removeObjectForKey:](v6, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3));
  if (-[NSMutableDictionary count](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "count"))
  {
    v7 = dispatch_time(0, 0);
    v8 = (void *)-[NSMutableDictionary allKeys](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "allKeys");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__CMPhotoProcessMonitor_releaseAssertionForContext___block_invoke;
    v10[3] = &unk_1E53F5AA8;
    v10[4] = self;
    v10[5] = v7;
    -[NSMutableDictionary removeObjectsForKeys:](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "removeObjectsForKeys:", objc_msgSend(v8, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10)));
  }
  if (!-[NSMutableDictionary count](-[CMPhotoProcessMonitor heldAssertions](self, "heldAssertions"), "count"))
  {
    -[RBSAssertion invalidate](-[CMPhotoProcessMonitor latestAssertion](self, "latestAssertion"), "invalidate");
    -[CMPhotoProcessMonitor setLatestAssertion:](self, "setLatestAssertion:", 0);
    -[CMPhotoProcessMonitor setLatestTransaction:](self, "setLatestTransaction:", 0);
  }
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (void)setLatestTransaction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (void)setLatestAssertion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

+ (BOOL)isCameraCaptured
{
  return _currentProcessIsOfIdentifier((uint64_t)CFSTR("com.apple.cameracaptured"));
}

+ (BOOL)isDeferredMediad
{
  return _currentProcessIsOfIdentifier((uint64_t)CFSTR("com.apple.deferredmediad"));
}

- (void)dealloc
{
  objc_super v3;

  if (-[CMPhotoProcessMonitor processMonitorSyncQueue](self, "processMonitorSyncQueue"))
    dispatch_barrier_sync((dispatch_queue_t)-[CMPhotoProcessMonitor processMonitorSyncQueue](self, "processMonitorSyncQueue"), &__block_literal_global_14);
  -[CMPhotoProcessMonitor setProcessMonitorSyncQueue:](self, "setProcessMonitorSyncQueue:", 0);
  -[CMPhotoProcessMonitor setBackgroundNotificationBlocks:](self, "setBackgroundNotificationBlocks:", 0);
  -[RBSProcessMonitor invalidate](-[CMPhotoProcessMonitor processMonitor](self, "processMonitor"), "invalidate");
  -[CMPhotoProcessMonitor setProcessMonitor:](self, "setProcessMonitor:", 0);
  -[RBSAssertion invalidate](-[CMPhotoProcessMonitor latestAssertion](self, "latestAssertion"), "invalidate");
  -[CMPhotoProcessMonitor setLatestAssertion:](self, "setLatestAssertion:", 0);
  -[CMPhotoProcessMonitor setLatestTransaction:](self, "setLatestTransaction:", 0);
  -[CMPhotoProcessMonitor setDomainAttribute:](self, "setDomainAttribute:", 0);
  -[CMPhotoProcessMonitor setHeldAssertions:](self, "setHeldAssertions:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CMPhotoProcessMonitor;
  -[CMPhotoProcessMonitor dealloc](&v3, sel_dealloc);
}

- (void)waitForPendingNotifications
{
  dispatch_barrier_sync((dispatch_queue_t)-[CMPhotoProcessMonitor processMonitorSyncQueue](self, "processMonitorSyncQueue"), &__block_literal_global_17);
}

uint64_t __50__CMPhotoProcessMonitor__createRBSMonitorIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v6;
  uint64_t result;

  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "previousState"), "endowmentNamespaces"), "containsObject:", CFSTR("com.apple.frontboard.visibility"));
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "state"), "endowmentNamespaces"), "containsObject:", CFSTR("com.apple.frontboard.visibility"));
  if (v6)
  {
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "_handleBackgroundingNotification");
  }
  return result;
}

- (void)_handleBackgroundingNotification
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[5];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[CMPhotoProcessMonitor processMonitorSyncQueue](self, "processMonitorSyncQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__CMPhotoProcessMonitor__handleBackgroundingNotification__block_invoke;
  block[3] = &unk_1E53F5A80;
  block[4] = self;
  dispatch_async((dispatch_queue_t)v4, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[CMPhotoProcessMonitor backgroundNotificationBlocks](self, "backgroundNotificationBlocks", 0);
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        dispatch_async((dispatch_queue_t)-[CMPhotoProcessMonitor processMonitorSyncQueue](self, "processMonitorSyncQueue"), (dispatch_block_t)-[NSMutableDictionary objectForKeyedSubscript:](-[CMPhotoProcessMonitor backgroundNotificationBlocks](self, "backgroundNotificationBlocks"), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++)));
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
  os_unfair_lock_unlock(p_lock);
}

void __57__CMPhotoProcessMonitor__handleBackgroundingNotification__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "processMonitor"), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "setProcessMonitor:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

BOOL __52__CMPhotoProcessMonitor_releaseAssertionForContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return (unint64_t)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "heldAssertions"), "objectForKeyedSubscript:", a2), "longLongValue") <= *(_QWORD *)(a1 + 40);
}

- (void)setGotRBSConnectionError:(BOOL)a3
{
  self->_gotRBSConnectionError = a3;
}

@end
