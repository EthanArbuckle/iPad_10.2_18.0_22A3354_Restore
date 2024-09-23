@implementation NWMessageConnection

- (void)readMessageWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[NWConnection internalConnection](self, "internalConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__NWMessageConnection_readMessageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E14A93A0;
  v8 = v4;
  v6 = v4;
  nw_connection_receive_internal(v5, 0, 0xFFFFFFFF, 0xFFFFFFFF, v7);

}

- (void)writeMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  _QWORD completion[4];
  id v14;

  v6 = a4;
  v7 = a3;
  v8 = nw_content_context_create("NWMessageConnection");
  objc_msgSend(v7, "relativePriority");
  nw_content_context_set_relative_priority(v8, v9);
  nw_content_context_set_expiration_milliseconds(v8, objc_msgSend(v7, "expirationMilliseconds"));
  -[NWConnection internalConnection](self, "internalConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalContent");
  v11 = objc_claimAutoreleasedReturnValue();

  completion[0] = MEMORY[0x1E0C809B0];
  completion[1] = 3221225472;
  completion[2] = __54__NWMessageConnection_writeMessage_completionHandler___block_invoke;
  completion[3] = &unk_1E14A93C8;
  v14 = v6;
  v12 = v6;
  nw_connection_send(v10, v11, v8, 1, completion);

}

void __54__NWMessageConnection_writeMessage_completionHandler___block_invoke(uint64_t a1, nw_error_t error)
{
  uint64_t v2;
  CFErrorRef v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = nw_error_copy_cf_error(error);
  (*(void (**)(uint64_t, CFErrorRef))(v2 + 16))(v2, v3);

}

void __56__NWMessageConnection_readMessageWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  NSObject *v8;
  id v9;
  id v10;
  uint64_t v11;
  CFErrorRef v12;
  NWInboundMessage *v13;

  v8 = a5;
  v9 = a3;
  v10 = a2;
  v13 = -[NWMessage initWithContent:context:]([NWInboundMessage alloc], "initWithContent:context:", v10, v9);

  v11 = *(_QWORD *)(a1 + 32);
  v12 = nw_error_copy_cf_error(v8);

  (*(void (**)(uint64_t, NWInboundMessage *, CFErrorRef))(v11 + 16))(v11, v13, v12);
}

@end
