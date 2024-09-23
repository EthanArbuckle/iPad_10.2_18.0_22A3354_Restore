@implementation GEOProgressForSendingOverXPC

void __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _xpc_connection_s *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD handler[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x18D765A14]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    if (v3 == (id)MEMORY[0x1E0C81260])
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;

    }
  }
  else if (v4 == MEMORY[0x1E0C812E0])
  {
    v5 = (_xpc_connection_s *)v3;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(v6 + 8) + 40);
    if (v7)
    {
      objc_msgSend(*(id *)(v7 + 152), "addObject:", v5);
      v6 = *(_QWORD *)(a1 + 40);
    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke_2;
    handler[3] = &unk_1E1C0C8F8;
    handler[4] = v6;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_set_target_queue(v5, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_activate(v5);
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_broadcastOverXPCConnections:", v9);

  }
}

void __58___GEOProgressForSendingOverXPC_initWithMirroredProgress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  void *v7;

  v4 = MEMORY[0x18D765A14](a2);
  if (a2 == MEMORY[0x1E0C81260] && v4 == MEMORY[0x1E0C81310])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_connectionDidInvalidate");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __67___GEOProgressForSendingOverXPC_initWithMirroredProgress_endpoint___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  void *v7;

  v4 = MEMORY[0x18D765A14](a2);
  if (a2 == MEMORY[0x1E0C81260] && v4 == MEMORY[0x1E0C81310])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_connectionDidInvalidate");
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
}

void __40___GEOProgressForSendingOverXPC__update__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __39___GEOProgressForSendingOverXPC_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_xpc_connection_s **)(v2 + 128);
  if (v3)
  {
    xpc_connection_cancel(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(v2 + 152);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        xpc_connection_cancel(*(xpc_connection_t *)(*((_QWORD *)&v12 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 128);
  *(_QWORD *)(v9 + 128) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "removeAllObjects", (_QWORD)v12);
}

uint64_t __57___GEOProgressForSendingOverXPC__connectionDidInvalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
