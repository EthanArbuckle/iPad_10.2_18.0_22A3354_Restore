@implementation AXServerInstanceActionHandlerHelper

- (void)notifyActionOccurredWithType:(int64_t)a3 payload:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSObject *v13;
  NSMutableArray *obj;
  _QWORD block[4];
  id v16;
  AXServerInstanceActionHandlerHelper *v17;
  uint64_t v18;
  int64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (notifyActionOccurredWithType_payload__onceToken[0] != -1)
    dispatch_once(notifyActionOccurredWithType_payload__onceToken, &__block_literal_global_29);
  if (notifyActionOccurredWithType_payload__actionQueue)
  {
    v7 = (void *)objc_msgSend(v6, "copy");

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = self->_actionHandlers;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v13 = notifyActionOccurredWithType_payload__actionQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2;
          block[3] = &unk_1E24C7E60;
          v19 = a3;
          v16 = v7;
          v17 = self;
          v18 = v12;
          dispatch_async(v13, block);

        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
  else
  {
    v7 = v6;
  }

}

void __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  AXIPCMessage *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v2 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObject:forKey:", v3, CFSTR("type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("payload"));
  v6 = -[AXIPCMessage initWithKey:payload:]([AXIPCMessage alloc], "initWithKey:payload:", objc_msgSend(*(id *)(a1 + 40), "actionResultMessageKey"), v4);
  v7 = *(void **)(a1 + 48);
  v17 = 0;
  v8 = objc_msgSend(v7, "sendSimpleMessage:withError:", v6, &v17);
  v9 = v17;
  if ((v8 & 1) == 0)
  {
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2_cold_1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (int)actionResultMessageKey
{
  return self->_actionResultMessageKey;
}

- (AXServerInstanceActionHandlerHelper)initWithRegistrationMessageKey:(int)a3 actionResultMessageKey:(int)a4
{
  AXServerInstanceActionHandlerHelper *v6;
  AXServerInstanceActionHandlerHelper *v7;
  uint64_t v8;
  NSMutableArray *actionHandlers;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXServerInstanceActionHandlerHelper;
  v6 = -[AXServerInstanceActionHandlerHelper init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_registrationMessageKey = a3;
    v6->_actionResultMessageKey = a4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    actionHandlers = v7->_actionHandlers;
    v7->_actionHandlers = (NSMutableArray *)v8;

  }
  return v7;
}

- (id)handleActionHandlerRegistrationMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  AXIPCClient *v9;
  double v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  AXIPCMessage *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  AXIPCMessage *v24;
  _QWORD v26[5];
  int v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "payload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("register"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = objc_msgSend(v4, "clientPort");
  if (!v7)
  {
    -[AXServerInstanceActionHandlerHelper _removeActionHandler:](self, "_removeActionHandler:", v8);
    goto LABEL_6;
  }
  if (-[AXServerInstanceActionHandlerHelper _hasActionHandlerForClientPort:](self, "_hasActionHandlerForClientPort:", v8))
  {
LABEL_6:
    v11 = 1;
    goto LABEL_11;
  }
  v9 = -[AXIPCClient initWithPort:]([AXIPCClient alloc], "initWithPort:", v8);
  LODWORD(v10) = 1.0;
  -[AXIPCClient setTimeout:](v9, "setTimeout:", v10);
  v28 = 0;
  v11 = -[AXIPCClient connectWithError:](v9, "connectWithError:", &v28);
  v12 = v28;
  if ((_DWORD)v11)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __78__AXServerInstanceActionHandlerHelper_handleActionHandlerRegistrationMessage___block_invoke;
    v26[3] = &unk_1E24C5EE8;
    v26[4] = self;
    v27 = v8;
    -[AXIPCClient setPortDeathHandler:](v9, "setPortDeathHandler:", v26);
    -[NSMutableArray addObject:](self->_actionHandlers, "addObject:", v9);
  }
  else
  {
    AXLogIPC();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AXServerInstanceActionHandlerHelper handleActionHandlerRegistrationMessage:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

  }
LABEL_11:
  v20 = [AXIPCMessage alloc];
  v21 = -[AXServerInstanceActionHandlerHelper registrationMessageKey](self, "registrationMessageKey");
  v29 = CFSTR("result");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AXIPCMessage initWithKey:payload:](v20, "initWithKey:payload:", v21, v23);

  return v24;
}

uint64_t __78__AXServerInstanceActionHandlerHelper_handleActionHandlerRegistrationMessage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeActionHandler:", *(unsigned int *)(a1 + 40));
}

void __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("axserverinstance-action-queue", attr);
  v2 = (void *)notifyActionOccurredWithType_payload__actionQueue;
  notifyActionOccurredWithType_payload__actionQueue = (uint64_t)v1;

}

- (BOOL)_hasActionHandlerForClientPort:(unsigned int)a3
{
  NSMutableArray *actionHandlers;
  _QWORD v5[4];
  unsigned int v6;

  actionHandlers = self->_actionHandlers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__AXServerInstanceActionHandlerHelper__hasActionHandlerForClientPort___block_invoke;
  v5[3] = &__block_descriptor_36_e28_B32__0__AXIPCClient_8Q16_B24l;
  v6 = a3;
  return -[NSMutableArray indexOfObjectPassingTest:](actionHandlers, "indexOfObjectPassingTest:", v5) != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __70__AXServerInstanceActionHandlerHelper__hasActionHandlerForClientPort___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v6;
  int v7;

  v6 = objc_msgSend(a2, "serviceMachPort");
  v7 = *(_DWORD *)(a1 + 32);
  if (v6 == v7)
    *a4 = 1;
  return v6 == v7;
}

- (void)_removeActionHandler:(unsigned int)a3
{
  NSMutableArray *actionHandlers;
  void *v5;
  void *v6;
  _QWORD v7[4];
  unsigned int v8;

  actionHandlers = self->_actionHandlers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__AXServerInstanceActionHandlerHelper__removeActionHandler___block_invoke;
  v7[3] = &__block_descriptor_36_e15_B32__0_8Q16_B24l;
  v8 = a3;
  -[NSMutableArray indexesOfObjectsPassingTest:](actionHandlers, "indexesOfObjectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[NSMutableArray removeObjectsAtIndexes:](self->_actionHandlers, "removeObjectsAtIndexes:", v5);
    v5 = v6;
  }

}

BOOL __60__AXServerInstanceActionHandlerHelper__removeActionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceMachPort") == *(_DWORD *)(a1 + 32);
}

- (int)registrationMessageKey
{
  return self->_registrationMessageKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionHandlers, 0);
}

- (void)handleActionHandlerRegistrationMessage:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Could not connect client for registering serveri nstance action handler: %{public}@", a5, a6, a7, a8, 2u);
}

void __76__AXServerInstanceActionHandlerHelper_notifyActionOccurredWithType_payload___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18C62B000, a2, a3, "Error sending server instance action: %@", a5, a6, a7, a8, 2u);
}

@end
