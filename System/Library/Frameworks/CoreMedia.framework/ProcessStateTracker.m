@implementation ProcessStateTracker

- (id)initForClientPID:(int)a3 withOperator:(id)a4
{
  ProcessStateTracker *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ProcessStateTracker;
  v6 = -[ProcessStateTracker init](&v8, sel_init);
  if (v6)
  {
    v6->_operator = (FigPurgeAndRenewPurgeOperator *)a4;
    v6->_monitor = 0;
    v6->_clientPID = a3;
    if (-[ProcessStateTracker startMonitoringClientPID](v6, "startMonitoringClientPID"))
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)ProcessStateTracker;
  -[ProcessStateTracker dealloc](&v3, sel_dealloc);
}

- (int)startMonitoringClientPID
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  RBSProcessMonitor *v7;
  int v8;
  _QWORD v10[6];
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__ProcessStateTracker_startMonitoringClientPID__block_invoke;
  v11[3] = &unk_1E28D7EE8;
  objc_copyWeak(&v12, &location);
  v4 = objc_msgSend(MEMORY[0x1E0D87D78], "identifierWithPid:", self->_clientPID);
  if (!v4)
    goto LABEL_7;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D87DA8], "predicateMatchingIdentifier:", v4);
  if (!v5)
  {
LABEL_8:
    v8 = -19471;
    goto LABEL_6;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0D87D60], "handleForIdentifier:error:", v4, 0);
  if (!v6)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __47__ProcessStateTracker_startMonitoringClientPID__block_invoke_2;
  v10[3] = &unk_1E28D7F10;
  v10[4] = v5;
  v10[5] = v11;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0D87D98], "monitorWithConfiguration:", v10);
  if (!objc_msgSend(v6, "currentState"))
    goto LABEL_8;
  v7 = v5;
  v5 = 0;
  v8 = 0;
  self->_monitor = v7;
LABEL_6:
  objc_msgSend(v5, "invalidate");
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

id __47__ProcessStateTracker_startMonitoringClientPID__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id result;

  result = objc_loadWeak((id *)(a1 + 32));
  if (result)
    return (id)objc_msgSend(result, "monitor:notifiedUpdate:forPID:", a2, a4, objc_msgSend(a3, "pid"));
  return result;
}

uint64_t __47__ProcessStateTracker_startMonitoringClientPID__block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D87DC8], "descriptor");
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &unk_1E28FD8A0);
  v6[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "setPredicates:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1));
  objc_msgSend(a2, "setStateDescriptor:", v4);
  objc_msgSend(a2, "setUpdateHandler:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(a2, "setEvents:", 1);
}

- (void)monitor:(id)a3 notifiedUpdate:(id)a4 forPID:(int)a5
{
  uint64_t v7;
  int v8;
  int v9;
  FigPurgeAndRenewPurgeOperator *operator;

  if (self->_monitor == a3 && self->_clientPID == a5)
  {
    v7 = objc_msgSend(a4, "exitEvent");
    v8 = objc_msgSend((id)objc_msgSend(a4, "state"), "taskState");
    if (v7)
    {
      -[FigPurgeAndRenewPurgeOperator processDidTerminate](self->_operator, "processDidTerminate");
    }
    else
    {
      v9 = v8;
      operator = self->_operator;
      if (v9 == 3)
        -[FigPurgeAndRenewPurgeOperator processDidSuspend](operator, "processDidSuspend");
      else
        -[FigPurgeAndRenewPurgeOperator processIsNoLongerSuspended](operator, "processIsNoLongerSuspended");
    }
  }
}

- (BOOL)isProcessTerminated
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D87D60], "handleForIdentifier:error:", objc_msgSend(MEMORY[0x1E0D87D78], "identifierWithPid:", self->_clientPID), 0);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "currentState") == 0;
  return (char)v2;
}

- (BOOL)setPurgeSuspended:(BOOL)a3
{
  return -[FigPurgeAndRenewPurgeOperator setPurgeSuspended:](self->_operator, "setPurgeSuspended:", a3);
}

- (BOOL)purgeSuspended
{
  return -[FigPurgeAndRenewPurgeOperator purgeSuspended](self->_operator, "purgeSuspended");
}

- (BOOL)isProcessStateSuspended
{
  return -[FigPurgeAndRenewPurgeOperator isProcessStateSuspended](self->_operator, "isProcessStateSuspended");
}

@end
