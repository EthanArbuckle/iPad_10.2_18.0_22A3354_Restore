@implementation MRTransactionDestination

- (MRTransactionDestination)initWithName:(unint64_t)a3 playerPath:(id)a4
{
  id v7;
  MRTransactionDestination *v8;
  MRTransactionDestination *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRTransactionDestination;
  v8 = -[MRTransactionDestination init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_name = a3;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.MediaRemote.transactionDestinationQueue", v10);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v9->_playerPath, a4);
  }

  return v9;
}

- (void)packetsFromMessage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  UInt8 *v8;
  void *v9;
  NSObject *v11;
  const UInt8 *v12;
  UInt8 *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  MRTransactionDestination *v23;

  v6 = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke;
  v21[3] = &unk_1E30CCF08;
  v7 = v6;
  v22 = v7;
  v23 = self;
  v8 = (UInt8 *)a4;
  v9 = (void *)MEMORY[0x194036C44](v21);
  if (v7 == (id)MEMORY[0x1E0C81258] || v7 == (id)MEMORY[0x1E0C81260])
  {
    _MRLogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MRTransactionDestination packetsFromMessage:completion:].cold.1((uint64_t)self);

    (*((void (**)(UInt8 *, _QWORD, void *))v8 + 2))(v8, 0, v9);
  }
  else
  {
    v12 = MRCreateDataFromXPCMessage(v7, "MRXPC_TRANSACTION_DATA");
    v13 = (UInt8 *)v12;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRTransactionDestination packetsFromMessage:completion:]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MRTransaction.m"), 451, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    }
    MRTransactionPacketsCreateFromExternalRepresentation(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MRTransactionDestination packetsFromMessage:completion:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MRTransaction.m"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("packets"));

    }
    _MRLogForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[MRTransactionDestination packetsFromMessage:completion:].cold.2((uint64_t)self, v14, v15);

    MRTransactionPacketsGetShallowCopy(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(UInt8 *, void *, void *))v8 + 2))(v8, v16, v9);

    v8 = v13;
  }

}

void __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  NSObject *reply;
  NSObject *v4;

  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
    if (reply)
    {
      xpc_connection_send_message(v2, reply);
    }
    else
    {
      _MRLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_2(a1);

    }
  }
  else
  {
    _MRLogForCategory(0);
    reply = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR))
      __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_1(a1);
  }

}

- (void)unpacketize:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MRTransactionDestination_unpacketize_completion___block_invoke;
  block[3] = &unk_1E30CA5C0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);

}

void __51__MRTransactionDestination_unpacketize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  MRTransactionPacketizer *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MRTransactionPacketizer);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MRTransactionDestination_unpacketize_completion___block_invoke_2;
  v7[3] = &unk_1E30C9FA0;
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "unpacketize:completion:", v6, v7);

}

void __51__MRTransactionDestination_unpacketize_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MRTransactionDestination_unpacketize_completion___block_invoke_3;
  v8[3] = &unk_1E30C6568;
  v6 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __51__MRTransactionDestination_unpacketize_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (unint64_t)name
{
  return self->_name;
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_packetizer, 0);
}

- (void)packetsFromMessage:(uint64_t)a1 completion:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  MRTransactionNameGetDescription(*(_QWORD *)(a1 + 24));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[MRTransactionDestination] %@ received interrupted/invalid connection", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

- (void)packetsFromMessage:(NSObject *)a3 completion:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  MRTransactionNameGetDescription(*(_QWORD *)(a1 + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MRTransactionPacketsGetKeys(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_193827000, a3, OS_LOG_TYPE_DEBUG, "[MRTransactionDestination] %@ received %@ for playerPath %@", (uint8_t *)&v9, 0x20u);

}

void __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  MRTransactionNameGetDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[MRTransactionDestination] %@ could not extract connection", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

void __58__MRTransactionDestination_packetsFromMessage_completion___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  MRTransactionNameGetDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[MRTransactionDestination] %@ could not extract reply", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

@end
