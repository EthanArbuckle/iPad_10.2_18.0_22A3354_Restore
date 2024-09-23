@implementation AXUIMessageSendHandler

- (AXUIMessageSendHandler)initWithMessageSender:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  AXUIMessageSendHandler *v8;
  AXUIMessageSendHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AXUIMessageSendHandler;
  v8 = -[AXUIMessageSendHandler init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_messageSender, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)sendXPCMessage:(id)a3 context:(void *)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = a3;
  -[AXUIMessageSendHandler setRemainingAttempts:](self, "setRemainingAttempts:", 10);
  -[AXUIMessageSendHandler setCompletion:](self, "setCompletion:", v8);

  -[AXUIMessageSendHandler _sendMessage:context:previousError:](self, "_sendMessage:context:previousError:", v9, a4, 0);
}

- (void)stopSendingXPCMessage
{
  -[AXUIMessageSendHandler setRemainingAttempts:](self, "setRemainingAttempts:", 0);
  -[AXUIMessageSendHandler setCompletion:](self, "setCompletion:", 0);
  -[AXUIMessageSendHandler setMessageSender:](self, "setMessageSender:", 0);
  -[AXUIMessageSendHandler setDelegate:](self, "setDelegate:", 0);
}

- (void)_sendMessage:(id)a3 context:(void *)a4 previousError:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD v22[4];
  id v23;
  id v24;
  AXUIMessageSendHandler *v25;
  id v26;
  void (**v27)(_QWORD, _QWORD);
  _QWORD v28[5];
  id v29;
  void *v30;

  v8 = a3;
  v9 = a5;
  if (-[AXUIMessageSendHandler remainingAttempts](self, "remainingAttempts"))
  {
    v10 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke;
    v28[3] = &unk_24CF7FF38;
    v28[4] = self;
    v11 = v8;
    v29 = v11;
    v30 = a4;
    v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199AF840](v28);
    -[AXUIMessageSendHandler delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[AXUIMessageSendHandler messageSender](self, "messageSender");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_6;
      v22[3] = &unk_24CF7FF88;
      v27 = v12;
      v23 = v11;
      v24 = v13;
      v25 = self;
      v26 = v9;
      objc_msgSend(v24, "messageSender:accessLaunchAngelConnectionForMessageWithContext:usingBlock:", v14, a4, v22);

      v15 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Failed to establish connection to the %@."), CFSTR("Accessibility UI Server"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v12)[2](v12, v15);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v9, "ax_nonRedundantDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Failed to send message %@ to the %@. Last encountered error: %@."), v16, CFSTR("Accessibility UI Server"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXUIMessageSendHandler completion](self, "completion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[AXUIMessageSendHandler completion](self, "completion");
      v21 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, void *))v21)[2](v21, 0, 0, v19);

    }
  }

}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  AXLogIPC();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_cold_1(v4);

  objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1;
  v10[3] = &unk_24CF7FF10;
  v6 = (void *)a1[5];
  v10[4] = a1[4];
  v7 = v6;
  v8 = a1[6];
  v12 = v3;
  v13 = v8;
  v11 = v7;
  v9 = v3;
  objc_msgSend(v5, "afterDelay:processReadingBlock:", v10, 0.05);

}

uint64_t __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1(uint64_t a1)
{
  NSObject *v2;

  AXLogIPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1_cold_1(a1, v2);

  if (objc_msgSend(*(id *)(a1 + 32), "remainingAttempts"))
    objc_msgSend(*(id *)(a1 + 32), "setRemainingAttempts:", objc_msgSend(*(id *)(a1 + 32), "remainingAttempts") - 1);
  return objc_msgSend(*(id *)(a1 + 32), "_sendMessage:context:previousError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v3 = a2;
  if (!v3)
  {
    AXLogIPC();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3_cold_1(v4);

    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Received nil connection when trying to send board services message."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_9;
  v10[3] = &unk_24CF7FF60;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v3, "sendBoardServiceMessage:callback:", v6, v10);

}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  size_t count;
  size_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const char *string;
  const char *v16;
  const char *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  if (!v5 || MEMORY[0x2199AF9D8](v5) != MEMORY[0x24BDACFA0])
    goto LABEL_3;
  count = xpc_dictionary_get_count(v5);
  if (!count)
  {
    v13 = 0;
    goto LABEL_22;
  }
  v10 = count;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25 = 0;
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "messageSender");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "messageSender:extractCustomDataFromXPCReply:numberOfKeyValuePairsForCustomData:", v12, v5, &v25);

    v10 -= v25;
  }
  else
  {
    v13 = 0;
  }
  if (v10 == 2)
  {
    string = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDomain[0]);
    v16 = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDescription[0]);
    if (string)
    {
      v17 = v16;
      if (v16)
      {
        objc_msgSend(*(id *)(a1 + 40), "completion");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_7;
        v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v17);
        objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", v7, CFSTR("%@"), v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "completion");
        v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, _QWORD, void *))v20)[2](v20, v13, 0, v19);

        goto LABEL_5;
      }
    }
LABEL_22:
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v5, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    v7 = v21;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "completion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 40), "completion");
        v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *, _QWORD))v23)[2](v23, v13, v8, 0);

      }
      goto LABEL_5;
    }
    if (v21)
    {
LABEL_4:
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      v8 = 0;
LABEL_5:

      goto LABEL_6;
    }
LABEL_3:
    v7 = *(id *)(a1 + 48);
    goto LABEL_4;
  }
  if (v10 != 1 || !xpc_dictionary_get_BOOL(v5, _AXUIMessageReplyKeyDidSucceed[0]))
    goto LABEL_22;
  objc_msgSend(*(id *)(a1 + 40), "completion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_7;
  objc_msgSend(*(id *)(a1 + 40), "completion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, _QWORD, _QWORD))v7 + 2))(v7, v13, 0, 0);
LABEL_6:

LABEL_7:
}

- (AXUIMessageSenderDelegate)delegate
{
  return (AXUIMessageSenderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXUIMessageSender)messageSender
{
  return (AXUIMessageSender *)objc_loadWeakRetained((id *)&self->_messageSender);
}

- (void)setMessageSender:(id)a3
{
  objc_storeWeak((id *)&self->_messageSender, a3);
}

- (unint64_t)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unint64_t)a3
{
  self->_remainingAttempts = a3;
}

- (id)completion
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_messageSender);
  objc_destroyWeak((id *)&self->_delegate);
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_213298000, log, OS_LOG_TYPE_DEBUG, "AXUIMessageSendHandler will re-try sending a message", v1, 2u);
}

void __61__AXUIMessageSendHandler__sendMessage_context_previousError___block_invoke_1_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "remainingAttempts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_213298000, a2, OS_LOG_TYPE_DEBUG, "AXUIMessageSendHandler remainingAttempts: %@", (uint8_t *)&v4, 0xCu);

}

@end
