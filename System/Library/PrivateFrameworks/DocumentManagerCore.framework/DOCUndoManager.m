@implementation DOCUndoManager

+ (DOCUndoManager)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_12);
  return (DOCUndoManager *)(id)shared_undoManager;
}

void __24__DOCUndoManager_shared__block_invoke()
{
  DOCUndoManager *v0;
  void *v1;

  v0 = objc_alloc_init(DOCUndoManager);
  v1 = (void *)shared_undoManager;
  shared_undoManager = (uint64_t)v0;

}

- (DOCUndoManager)init
{
  DOCUndoManager *v2;
  DOCUndoManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCUndoManager;
  v2 = -[DOCUndoManager init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DOCUndoManager setGroupsByEvent:](v2, "setGroupsByEvent:", 0);
    -[DOCUndoManager startUndoNotificationsObservation](v3, "startUndoNotificationsObservation");
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[DOCUndoManager stopUndoNotificationsObservation](self, "stopUndoNotificationsObservation");
  v3.receiver = self;
  v3.super_class = (Class)DOCUndoManager;
  -[DOCUndoManager dealloc](&v3, sel_dealloc);
}

- (void)startUndoNotificationsObservation
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_didPerformUndoableOperation, *MEMORY[0x24BDD13B0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_didPerformUndoableOperation, *MEMORY[0x24BDD13B8], 0);

}

- (void)stopUndoNotificationsObservation
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)didPerformUndoableOperation
{
  if (-[DOCUndoManager shouldRemoveAllActions](self, "shouldRemoveAllActions"))
  {
    -[DOCUndoManager setShouldRemoveAllActions:](self, "setShouldRemoveAllActions:", 0);
    -[DOCUndoManager removeAllActions](self, "removeAllActions");
  }
}

- (void)registerUndoOperationForSender:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[DOCUndoManager processSupportsUndoingActions](self, "processSupportsUndoingActions"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__DOCUndoManager_registerUndoOperationForSender___block_invoke;
    v5[3] = &unk_24C0FE190;
    v5[4] = self;
    v6 = v4;
    DOCRunInMainThread(v5);

  }
}

void __49__DOCUndoManager_registerUndoOperationForSender___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "beginUndoGrouping");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__DOCUndoManager_registerUndoOperationForSender___block_invoke_2;
  v5[3] = &unk_24C0FEEF8;
  objc_copyWeak(&v7, &location);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v2, "registerUndoWithTarget:handler:", v3, v5);
  objc_msgSend(*(id *)(a1 + 40), "actionNameForUndoing");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "setActionName:", v4);
  objc_msgSend(*(id *)(a1 + 32), "endUndoGrouping");

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __49__DOCUndoManager_registerUndoOperationForSender___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationForUndoing");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      if (objc_msgSend(WeakRetained, "isActionOperation:", *(_QWORD *)(a1 + 32))
        && objc_msgSend(WeakRetained, "isActionOperation:", v2))
      {
        v3 = *(void **)(a1 + 32);
        v4 = v2;
        objc_msgSend(v3, "itemManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "scheduleAction:", v4);

      }
    }
    else
    {
      objc_msgSend(WeakRetained, "setShouldRemoveAllActions:", 1);
    }

  }
}

- (BOOL)isActionOperation:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)processSupportsUndoingActions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(&unk_24C10A560, "containsObject:", v3);
  return (char)v2;
}

- (BOOL)shouldRemoveAllActions
{
  return self->_shouldRemoveAllActions;
}

- (void)setShouldRemoveAllActions:(BOOL)a3
{
  self->_shouldRemoveAllActions = a3;
}

@end
