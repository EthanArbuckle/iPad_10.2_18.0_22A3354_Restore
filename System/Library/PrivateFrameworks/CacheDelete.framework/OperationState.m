@implementation OperationState

- (OperationState)init
{
  OperationState *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OperationState;
  v2 = -[OperationState init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.cache_delete_services_operation_queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (BOOL)cancelled
{
  OperationState *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[OperationState queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__OperationState_cancelled__block_invoke;
  v5[3] = &unk_1E4A33120;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __27__OperationState_cancelled__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "operationCancelled");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "setOperationCancelled:", 0);
  }
  return result;
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  -[OperationState queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__OperationState_cancel__block_invoke;
  block[3] = &unk_1E4A32CD0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __24__OperationState_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOperationCancelled:", 1);
}

- (BOOL)begin
{
  OperationState *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[OperationState queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__OperationState_begin__block_invoke;
  v5[3] = &unk_1E4A33120;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __23__OperationState_begin__block_invoke(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "operationCancelled"))
    return objc_msgSend(*(id *)(a1 + 32), "setOperationRefcount:", objc_msgSend(*(id *)(a1 + 32), "operationRefcount") + 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setOperationCancelled:", 0);
}

- (void)end
{
  NSObject *v3;
  _QWORD block[5];

  -[OperationState queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__OperationState_end__block_invoke;
  block[3] = &unk_1E4A32CD0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __21__OperationState_end__block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "setOperationRefcount:", objc_msgSend(*(id *)(a1 + 32), "operationRefcount") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "operationRefcount");
  if ((result & 0x80000000) != 0)
  {
    CDGetLogHandle((uint64_t)"client");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_1A3662000, v3, OS_LOG_TYPE_ERROR, "UNBALANCED: operation refcount went below zero, resetting to zero", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setOperationRefcount:", 0);
  }
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)operationCancelled
{
  return self->_operationCancelled;
}

- (void)setOperationCancelled:(BOOL)a3
{
  self->_operationCancelled = a3;
}

- (int)operationRefcount
{
  return self->_operationRefcount;
}

- (void)setOperationRefcount:(int)a3
{
  self->_operationRefcount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
