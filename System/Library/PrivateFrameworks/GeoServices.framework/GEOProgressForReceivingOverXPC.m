@implementation GEOProgressForReceivingOverXPC

void __52___GEOProgressForReceivingOverXPC_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleEvent:", v3);

}

void __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  _QWORD handler[4];
  id v6;

  v3 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812E0])
  {
    v4 = (_xpc_connection_s *)v3;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke_2;
    handler[3] = &unk_1E1C07998;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    xpc_connection_set_event_handler(v4, handler);
    xpc_connection_set_target_queue(v4, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate(v4);
    objc_destroyWeak(&v6);

  }
}

void __55___GEOProgressForReceivingOverXPC_initVendingEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleEvent:", v3);

}

void __41___GEOProgressForReceivingOverXPC_cancel__block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 120));
}

@end
