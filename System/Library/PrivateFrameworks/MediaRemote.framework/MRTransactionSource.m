@implementation MRTransactionSource

- (MRTransactionSource)initWithName:(unint64_t)a3 playerPath:(id)a4 packets:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  MRTransactionSource *v14;
  MRTransactionSource *v15;
  MRTransactionPacketizer *v16;
  MRTransactionPacketizer *packetizer;
  uint64_t v18;
  NSMutableArray *packets;
  void *v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MRTransactionSource;
  v14 = -[MRTransactionSource init](&v26, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_name = a3;
    objc_storeStrong((id *)&v14->_playerPath, a4);
    v16 = objc_alloc_init(MRTransactionPacketizer);
    packetizer = v15->_packetizer;
    v15->_packetizer = v16;

    v18 = objc_msgSend(v12, "mutableCopy");
    packets = v15->_packets;
    v15->_packets = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v15->_delegate, a6);
    objc_initWeak(&location, v15);
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "workerQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __64__MRTransactionSource_initWithName_playerPath_packets_delegate___block_invoke;
    v23[3] = &unk_1E30C6AA0;
    objc_copyWeak(&v24, &location);
    dispatch_async(v21, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __64__MRTransactionSource_initWithName_playerPath_packets_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_begin");

}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _xpc_connection_s *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  MRCreateXPCMessage(0x100000000000009uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_uint64(v3, "MRXPC_TRANSACTION_NAME", self->_name);
  MRAddPlayerPathToXPCMessage(v3, self->_playerPath);
  objc_initWeak(&location, self);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  MRMediaRemoteServiceGetConnection(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connection");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "workerQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __29__MRTransactionSource__begin__block_invoke;
  v10[3] = &unk_1E30CAE98;
  objc_copyWeak(&v11, &location);
  xpc_connection_send_message_with_reply(v7, v3, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __29__MRTransactionSource__begin__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_processMessage:", v3);

}

- (void)_processMessage:(id)a3
{
  id v5;
  void *v6;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  xpc_object_t reply;
  uint64_t uint64;
  void *v13;
  MRTransactionPacketizer *packetizer;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  MRTransactionSource *v20;
  id v21;
  uint64_t v22;

  v5 = a3;
  v6 = v5;
  if (v5 == (id)MEMORY[0x1E0C81258] || v5 == (id)MEMORY[0x1E0C81260])
  {
    _MRLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MRTransactionSource _processMessage:].cold.1((uint64_t)self);

    -[MRTransactionSourceDelegate transactionDidEnd:](self->_delegate, "transactionDidEnd:", self);
  }
  else
  {
    xpc_dictionary_get_remote_connection(v5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      reply = xpc_dictionary_create_reply(v6);
      if (reply)
      {
        uint64 = xpc_dictionary_get_uint64(v6, "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE");
        if (!uint64)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTransaction.m"), 367, CFSTR("requested size is 0"));

        }
        v13 = (void *)-[NSMutableArray copy](self->_packets, "copy");
        -[NSMutableArray removeAllObjects](self->_packets, "removeAllObjects");
        packetizer = self->_packetizer;
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __39__MRTransactionSource__processMessage___block_invoke;
        v18[3] = &unk_1E30CCEE0;
        v22 = uint64;
        v19 = reply;
        v20 = self;
        v21 = v10;
        -[MRTransactionPacketizer packetize:packageSize:completion:](packetizer, "packetize:packageSize:completion:", v13, uint64, v18);

      }
      else
      {
        _MRLogForCategory(0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[MRTransactionSource _processMessage:].cold.3((uint64_t)self);

        -[MRTransactionSourceDelegate transactionDidEnd:](self->_delegate, "transactionDidEnd:", self);
      }

    }
    else
    {
      _MRLogForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[MRTransactionSource _processMessage:].cold.2((uint64_t)self);

      -[MRTransactionSourceDelegate transactionDidEnd:](self->_delegate, "transactionDidEnd:", self);
    }

  }
}

void __39__MRTransactionSource__processMessage___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  _xpc_connection_s *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = a2;
  MRTransactionPacketsCreateExternalRepresentation(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    v9 = objc_retainAutorelease(v6);
    xpc_dictionary_set_data(v8, "MRXPC_TRANSACTION_DATA", (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_TRANSACTION_DATA_REQUESTED_SIZE", *(_QWORD *)(a1 + 56));
  }
  _MRLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if ((a3 & 1) != 0)
  {
    if (v11)
      __39__MRTransactionSource__processMessage___block_invoke_cold_1(a1, v5);

    objc_initWeak(&location, *(id *)(a1 + 40));
    v12 = *(_xpc_connection_s **)(a1 + 48);
    v13 = *(void **)(a1 + 32);
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workerQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __39__MRTransactionSource__processMessage___block_invoke_126;
    v16[3] = &unk_1E30CAE98;
    objc_copyWeak(&v17, &location);
    xpc_connection_send_message_with_reply(v12, v13, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v11)
      __39__MRTransactionSource__processMessage___block_invoke_cold_2(a1, v5);

    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "MRXPC_TRANSACTION_ENDED", 1);
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 48), *(xpc_object_t *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "transactionDidEnd:");
  }

}

void __39__MRTransactionSource__processMessage___block_invoke_126(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_processMessage:", v3);

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
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_packets, 0);
  objc_storeStrong((id *)&self->_packetizer, 0);
}

- (void)_processMessage:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  MRTransactionNameGetDescription(*(_QWORD *)(a1 + 8));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[MRTransactionSource] Source %@ received interrupted/invalid connection to query", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

- (void)_processMessage:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  MRTransactionNameGetDescription(*(_QWORD *)(a1 + 8));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[MRTransactionSource] Source %@ could not extract connection", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

- (void)_processMessage:(uint64_t)a1 .cold.3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  MRTransactionNameGetDescription(*(_QWORD *)(a1 + 8));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_0_12(&dword_193827000, v2, v3, "[MRTransactionSource] Source %@ could not extract reply", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

void __39__MRTransactionSource__processMessage___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  MRTransactionNameGetDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MRTransactionPacketsGetKeys(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_5(&dword_193827000, v5, v6, "[MRTransactionSource] %@ sending packets: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

void __39__MRTransactionSource__processMessage___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  MRTransactionNameGetDescription(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MRTransactionPacketsGetKeys(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_3_5(&dword_193827000, v5, v6, "[MRTransactionSource] %@ sending end signal with packets %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2_1();
}

@end
