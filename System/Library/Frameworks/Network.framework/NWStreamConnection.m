@implementation NWStreamConnection

- (BOOL)readDataWithMinimumLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  unsigned int v5;
  unsigned int v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[NWConnection internalConnection](self, "internalConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__NWStreamConnection_readDataWithMinimumLength_maximumLength_completionHandler___block_invoke;
  v12[3] = &unk_1E14A93A0;
  v13 = v8;
  v10 = v8;
  nw_connection_receive_internal(v9, 0, v6, v5, v12);

  return 1;
}

- (BOOL)writeData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD completion[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[NWConnection internalConnection](self, "internalConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v9 = objc_msgSend(v7, "_createDispatchData");
  else
    v9 = 0;

  if (v6 == &__block_literal_global_14095)
  {
    nw_connection_send(v8, v9, (nw_content_context_t)&__block_literal_global_41718, 1, &__block_literal_global_24144);

  }
  else
  {
    completion[0] = MEMORY[0x1E0C809B0];
    completion[1] = 3221225472;
    completion[2] = __50__NWStreamConnection_writeData_completionHandler___block_invoke;
    completion[3] = &unk_1E14A93C8;
    v12 = v6;
    nw_connection_send(v8, v9, (nw_content_context_t)&__block_literal_global_41718, 1, completion);

  }
  return 1;
}

- (BOOL)writeCloseWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD completion[4];
  id v9;

  v4 = a3;
  -[NWConnection internalConnection](self, "internalConnection");
  v5 = objc_claimAutoreleasedReturnValue();
  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __54__NWStreamConnection_writeCloseWithCompletionHandler___block_invoke;
  completion[3] = &unk_1E14A93C8;
  v9 = v4;
  v6 = v4;
  nw_connection_send(v5, 0, (nw_content_context_t)&__block_literal_global_3_41726, 1, completion);

  return 1;
}

void __54__NWStreamConnection_writeCloseWithCompletionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  nw_error_t v3;

  if (error)
    error = (nw_error_t)nw_error_copy_cf_error(error);
  v3 = error;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __50__NWStreamConnection_writeData_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  nw_error_t v3;

  if (error)
    error = (nw_error_t)nw_error_copy_cf_error(error);
  v3 = error;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __80__NWStreamConnection_readDataWithMinimumLength_maximumLength_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *error;

  error = a5;
  v8 = a2;
  v9 = v8;
  if (v8)
    v10 = v8;

  if (error)
  {
    v11 = nw_error_copy_cf_error(error);
    if (v9)
      goto LABEL_10;
  }
  else
  {
    v11 = 0;
    if (v9)
      goto LABEL_10;
  }
  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 57, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

+ (id)connectionWithConnectedSocket:(int)a3
{
  return -[NWConnection initWithConnectedSocket:]([NWStreamConnection alloc], "initWithConnectedSocket:", *(_QWORD *)&a3);
}

@end
