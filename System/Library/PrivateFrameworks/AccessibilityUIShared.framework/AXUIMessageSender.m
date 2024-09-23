@implementation AXUIMessageSender

- (AXUIMessageSender)init
{
  AXUIMessageSender *v2;
  AXUIMessageSender *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXUIMessageSender;
  v2 = -[AXUIMessageSender init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXUIMessageSender setDelegateAccessLock:](v2, "setDelegateAccessLock:", 0);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", objc_opt_class(), CFSTR("MessageSchedulingSerializationQueue"), 1);
    if (v4)
    {
      -[AXUIMessageSender setMessageSchedulingSerializationQueue:](v3, "setMessageSchedulingSerializationQueue:", v4);
    }
    else
    {

      v3 = 0;
    }

  }
  return v3;
}

- (AXUIMessageSenderDelegate)delegate
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  v8 = __Block_byref_object_dispose_;
  v9 = 0;
  AX_PERFORM_WITH_LOCK();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (AXUIMessageSenderDelegate *)v2;
}

void __29__AXUIMessageSender_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

id __33__AXUIMessageSender_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

- (void)_sendLaunchAngelMessage:(id)a3 context:(void *)a4 remainingAttempts:(unint64_t)a5 previousError:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  AXUIMessageSender *v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  void *v35;
  unint64_t v36;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  if (a5)
  {
    v15 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke;
    v32[3] = &unk_24CF7FD58;
    v32[4] = self;
    v16 = v12;
    v33 = v16;
    v35 = a4;
    v36 = a5;
    v17 = v14;
    v34 = v17;
    v18 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199AF840](v32);
    -[AXUIMessageSender delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3;
      v25[3] = &unk_24CF7FDA8;
      v30 = v18;
      v26 = v16;
      v27 = v19;
      v28 = self;
      v31 = v17;
      v29 = v13;
      objc_msgSend(v27, "messageSender:accessLaunchAngelConnectionForMessageWithContext:usingBlock:", self, a4, v25);

      v20 = v30;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Failed to establish connection to the %@."), CFSTR("Accessibility UI Server"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v18)[2](v18, v20);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v12, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v13, "ax_nonRedundantDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Failed to send message %@ to the %@. Last encountered error: %@."), v21, CFSTR("Accessibility UI Server"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, _QWORD, void *))v14 + 2))(v14, 0, 0, v24);
  }

}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD v10[5];
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_2;
  v10[3] = &unk_24CF7FD30;
  v5 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v6 = v5;
  v14 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v12 = v3;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v13 = v9;
  v8 = v3;
  objc_msgSend(v4, "afterDelay:processReadingBlock:", v10, 0.05);

}

uint64_t __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLaunchAngelMessage:context:remainingAttempts:previousError:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72) - 1, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
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
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_8;
  v9[3] = &unk_24CF7FD80;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10 = v7;
  v11 = v8;
  v13 = *(id *)(a1 + 72);
  v12 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  objc_msgSend(v3, "sendBoardServiceMessage:callback:", v6, v9);

}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  size_t count;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *string;
  const char *v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  if (!v5 || MEMORY[0x2199AF9D8](v5) != MEMORY[0x24BDACFA0])
    goto LABEL_3;
  count = xpc_dictionary_get_count(v5);
  if (!count)
  {
    v11 = 0;
    goto LABEL_21;
  }
  v10 = count;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v22 = 0;
    v11 = objc_msgSend(*(id *)(a1 + 32), "messageSender:extractCustomDataFromXPCReply:numberOfKeyValuePairsForCustomData:", *(_QWORD *)(a1 + 40), v5, &v22);
    v10 -= v22;
  }
  else
  {
    v11 = 0;
  }
  if (v10 != 2)
  {
    if (v10 == 1 && xpc_dictionary_get_BOOL(v5, _AXUIMessageReplyKeyDidSucceed[0]))
    {
      v12 = *(_QWORD *)(a1 + 56);
      if (v12)
        (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v12 + 16))(v12, v11, 0, 0);
      goto LABEL_6;
    }
LABEL_21:
    v21 = 0;
    objc_msgSend(MEMORY[0x24BDFE500], "dictionaryFromXPCMessage:error:", v5, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v7 = v19;
    if (v8)
    {
      v20 = *(_QWORD *)(a1 + 56);
      if (v20)
        (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v20 + 16))(v20, v11, v8, 0);
      goto LABEL_5;
    }
    if (v19)
    {
LABEL_4:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v8 = 0;
LABEL_5:

      goto LABEL_6;
    }
LABEL_3:
    v7 = *(id *)(a1 + 48);
    goto LABEL_4;
  }
  string = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDomain[0]);
  v14 = xpc_dictionary_get_string(v5, _AXUIMessageReplyKeyErrorDescription[0]);
  if (!string)
    goto LABEL_21;
  v15 = v14;
  if (!v14)
    goto LABEL_21;
  if (*(_QWORD *)(a1 + 56))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", string);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v15);
    objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", v16, CFSTR("%@"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
LABEL_6:

}

- (void)_didFinishSendingXPCMessage:(id)a3 replyCustomData:(void *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  -[AXUIMessageSender messageSchedulingSerializationQueue](self, "messageSchedulingSerializationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __65__AXUIMessageSender__didFinishSendingXPCMessage_replyCustomData___block_invoke;
  v14[3] = &unk_24CF7FDD0;
  v14[5] = &v15;
  v14[6] = a4;
  v14[4] = self;
  objc_msgSend(v7, "performSynchronousWritingBlock:", v14);

  v8 = (void *)v16[5];
  if (v8)
  {
    objc_msgSend(v8, "xpcMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend((id)v16[5], "context");
    objc_msgSend((id)v16[5], "completion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend((id)v16[5], "completionRequiresWritingBlock");
    objc_msgSend((id)v16[5], "targetAccessQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16[5], "timeout");
    -[AXUIMessageSender _sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:](self, "_sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:", v9, v10, v11, v12, v13);

  }
  _Block_object_dispose(&v15, 8);

}

void __65__AXUIMessageSender__didFinishSendingXPCMessage_replyCustomData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "messageSender:processCustomDataFromXPCReply:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "messageQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (v3)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x2199AF6FC]();
    objc_msgSend(v2, "ax_dequeueObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "xpcMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "messageSender:willSendXPCMessage:context:", v9, v10, objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "context"));

    }
    objc_autoreleasePoolPop(v5);
    if (v4 == 1)
      objc_msgSend(*(id *)(a1 + 32), "setMessageQueue:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setSendingMessage:", 0);
  }

}

- (void)_sendXPCMessage:(id)a3 context:(void *)a4 completionBlock:(id)a5 completionRequiresWritingBlock:(BOOL)a6 targetAccessQueue:(id)a7 timeout:(double)a8
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  AXDispatchTimer *sendingTimer;
  NSObject *v23;
  AXDispatchTimer *v24;
  id v25;
  void *v26;
  NSObject *v27;
  AXUIMessageSendHandler *v28;
  void *v29;
  AXUIMessageSendHandler *v30;
  id v31;
  void *v32;
  id v33;
  AXUIMessageSendHandler *v34;
  NSObject *v35;
  AXDispatchTimer *v36;
  _QWORD v37[4];
  void *v38;
  _QWORD v39[5];
  AXUIMessageSendHandler *v40;
  id v41;
  _QWORD v42[5];
  id v43;
  uint8_t buf[8];
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  BOOL v49;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke;
  v45[3] = &unk_24CF7FE20;
  v45[4] = self;
  v18 = v14;
  v46 = v18;
  v19 = v15;
  v48 = v19;
  v20 = v16;
  v47 = v20;
  v49 = a6;
  v21 = (void *)MEMORY[0x2199AF840](v45);
  sendingTimer = self->_sendingTimer;
  if (a8 <= 0.0)
  {
    if (sendingTimer)
    {
      AXLogIPC();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213298000, v35, OS_LOG_TYPE_DEFAULT, "Error: sendingTimer should be nil", buf, 2u);
      }

      -[AXDispatchTimer cancel](self->_sendingTimer, "cancel");
      v36 = self->_sendingTimer;
      self->_sendingTimer = 0;

    }
    v37[0] = v17;
    v37[1] = 3221225472;
    v37[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_37;
    v37[3] = &unk_24CF7FE98;
    v38 = v21;
    v34 = v21;
    -[AXUIMessageSender _sendXPCMessage:context:remainingAttempts:previousError:completion:](self, "_sendXPCMessage:context:remainingAttempts:previousError:completion:", v18, a4, 10, 0, v37);
    v33 = v38;
  }
  else
  {
    if (sendingTimer)
    {
      AXLogIPC();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213298000, v23, OS_LOG_TYPE_DEFAULT, "Error: sendingTimer should be nil", buf, 2u);
      }

      -[AXDispatchTimer cancel](self->_sendingTimer, "cancel");
      v24 = self->_sendingTimer;
      self->_sendingTimer = 0;

    }
    v25 = objc_alloc(MEMORY[0x24BDFE490]);
    v26 = (void *)objc_msgSend(v25, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[AXUIMessageSender setSendingTimer:](self, "setSendingTimer:", v26);

    AXLogIPC();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[AXUIMessageSender _sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:].cold.1(v27);

    v28 = [AXUIMessageSendHandler alloc];
    -[AXUIMessageSender delegate](self, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[AXUIMessageSendHandler initWithMessageSender:delegate:](v28, "initWithMessageSender:delegate:", self, v29);

    v42[0] = v17;
    v42[1] = 3221225472;
    v42[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_30;
    v42[3] = &unk_24CF7FE48;
    v42[4] = self;
    v31 = v21;
    v43 = v31;
    -[AXUIMessageSendHandler sendXPCMessage:context:completion:](v30, "sendXPCMessage:context:completion:", v18, a4, v42);
    -[AXUIMessageSender sendingTimer](self, "sendingTimer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v17;
    v39[1] = 3221225472;
    v39[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_31;
    v39[3] = &unk_24CF7FE70;
    v39[4] = self;
    v40 = v30;
    v41 = v31;
    v33 = v31;
    v34 = v30;
    objc_msgSend(v32, "afterDelay:processBlock:", v39, a8);

  }
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    AXLogIPC();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "_didFinishSendingXPCMessage:replyCustomData:", *(_QWORD *)(a1 + 40), a2);
  v10 = *(void **)(a1 + 56);
  if (v10)
  {
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_25;
    v12[3] = &unk_24CF7FDF8;
    v15 = v10;
    v13 = v7;
    v14 = v8;
    objc_msgSend(v11, "_performBlock:inAccessQueue:treatAsWritingBlock:", v12, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

  }
}

uint64_t __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_25(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_30(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  AXLogIPC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_30_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "sendingTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "setSendingTimer:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[8];
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  AXLogIPC();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213298000, v2, OS_LOG_TYPE_DEFAULT, "Error: Sending message timeout, timer fired", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setSendingTimer:", 0);
  v3 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = CFSTR("Sending message timeout");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("AXUIMessageSenderXPC"), 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stopSendingXPCMessage");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performBlock:(id)a3 inAccessQueue:(id)a4 treatAsWritingBlock:(BOOL)a5
{
  if (a5)
    objc_msgSend(a4, "performAsynchronousWritingBlock:", a3);
  else
    objc_msgSend(a4, "performAsynchronousReadingBlock:", a3);
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8
{
  -[AXUIMessageSender sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:](self, "sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:", a3, a4, a5, a6, a7, a8, 0.0);
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 targetAccessQueue:(id)a6 completionRequiresWritingBlock:(BOOL)a7 completion:(id)a8 timeout:(double)a9
{
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  NSObject *v18;
  xpc_object_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _BOOL4 v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  void *v33;
  double v34;
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  id v40[2];

  v27 = a7;
  v14 = a3;
  v15 = a6;
  v16 = a8;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))v16;
  if (!v15 && v16)
  {
    AXLogUI();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[AXUIMessageSender sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:].cold.2(v18);

  }
  if (v14)
  {
    v40[0] = 0;
    v19 = (xpc_object_t)objc_msgSend(MEMORY[0x24BDFE500], "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v14, 0, v40);
    v20 = v40[0];
    if (v20)
    {
      AXLogUI();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        -[AXUIMessageSender sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:].cold.1();

    }
    if (v19)
      goto LABEL_12;
  }
  else
  {
    v19 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v19, _AXUIServiceMessageKeyMessageWasEmpty[0], 1);
    v20 = 0;
    if (v19)
    {
LABEL_12:
      xpc_dictionary_set_uint64(v19, _AXUIServiceMessageKeyMessageIdentifier[0], a4);
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      -[AXUIMessageSender messageSchedulingSerializationQueue](self, "messageSchedulingSerializationQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __136__AXUIMessageSender_sendAsynchronousMessage_withIdentifier_context_targetAccessQueue_completionRequiresWritingBlock_completion_timeout___block_invoke;
      v28[3] = &unk_24CF7FEC0;
      v32 = &v36;
      v28[4] = self;
      v23 = v19;
      v29 = v23;
      v33 = a5;
      v24 = v15;
      v30 = v24;
      v35 = v27;
      v25 = v17;
      v31 = v25;
      v34 = a9;
      objc_msgSend(v22, "performSynchronousWritingBlock:", v28);

      if (*((_BYTE *)v37 + 24))
        -[AXUIMessageSender _sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:](self, "_sendXPCMessage:context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:", v23, a5, v25, v27, v24, a9);

      _Block_object_dispose(&v36, 8);
      goto LABEL_20;
    }
  }
  if (v17)
  {
    if (!v20)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Failed to convert message %@ to its XPC representation."), v14);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(_QWORD, _QWORD, id))v17)[2](v17, 0, v20);
  }
LABEL_20:

}

void __136__AXUIMessageSender_sendAsynchronousMessage_withIdentifier_context_targetAccessQueue_completionRequiresWritingBlock_completion_timeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isSendingMessage") ^ 1;
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(v2, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "messageSender:willSendXPCMessage:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "setSendingMessage:", 1);
  }
  else
  {
    objc_msgSend(v2, "messageQueue");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = (id)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setMessageQueue:");
    }
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setXpcMessage:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "setContext:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v3, "setTargetAccessQueue:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setCompletionRequiresWritingBlock:", *(unsigned __int8 *)(a1 + 88));
    objc_msgSend(v3, "setCompletion:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v3, "setTimeout:", *(double *)(a1 + 80));
    objc_msgSend(v4, "ax_enqueueObject:", v3);

  }
}

- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 context:(void *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  dispatch_semaphore_t v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t *v20;
  id *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v10 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFE478]), "initWithParentClass:description:appendUUIDToLabel:", objc_opt_class(), CFSTR("SynchronousMessageSendTargetAccessQueue"), 1);
  v12 = dispatch_semaphore_create(0);
  v13 = v12;
  if (v11)
    v14 = v12 == 0;
  else
    v14 = 1;
  if (v14)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "ax_errorWithDomain:description:", CFSTR("AXUIErrorDomainCommunication"), CFSTR("Failed to initialize structures necessary for synchronous message send."));
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __73__AXUIMessageSender_sendSynchronousMessage_withIdentifier_context_error___block_invoke;
    v18[3] = &unk_24CF7FEE8;
    v20 = &v22;
    v21 = a6;
    v15 = v12;
    v19 = v15;
    -[AXUIMessageSender sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:](self, "sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:", v10, a4, a5, v11, 1, v18);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

  }
  v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v16;
}

void __73__AXUIMessageSender_sendSynchronousMessage_withIdentifier_context_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a3;
  v7 = v6;
  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (NSMutableArray)messageQueue
{
  return self->_messageQueue;
}

- (void)setMessageQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageQueue, a3);
}

- (AXAccessQueue)messageSchedulingSerializationQueue
{
  return self->_messageSchedulingSerializationQueue;
}

- (void)setMessageSchedulingSerializationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_messageSchedulingSerializationQueue, a3);
}

- (BOOL)isSendingMessage
{
  return self->_sendingMessage;
}

- (void)setSendingMessage:(BOOL)a3
{
  self->_sendingMessage = a3;
}

- (AXDispatchTimer)sendingTimer
{
  return (AXDispatchTimer *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSendingTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (os_unfair_lock_s)delegateAccessLock
{
  return self->_delegateAccessLock;
}

- (void)setDelegateAccessLock:(os_unfair_lock_s)a3
{
  self->_delegateAccessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendingTimer, 0);
  objc_storeStrong((id *)&self->_messageSchedulingSerializationQueue, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __96__AXUIMessageSender__sendLaunchAngelMessage_context_remainingAttempts_previousError_completion___block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_213298000, log, OS_LOG_TYPE_ERROR, "Tried to send a launch angel message but the connection was nil", v1, 2u);
}

- (void)_sendXPCMessage:(NSObject *)a1 context:completionBlock:completionRequiresWritingBlock:targetAccessQueue:timeout:.cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_213298000, a1, v3, "AXUIMessageSender created timeout timer in thread: %@", v4);

}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_213298000, v0, OS_LOG_TYPE_ERROR, "Error sending XPC message: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __118__AXUIMessageSender__sendXPCMessage_context_completionBlock_completionRequiresWritingBlock_targetAccessQueue_timeout___block_invoke_30_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_213298000, v0, v1, "Completed: Sending message, error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_213298000, v0, OS_LOG_TYPE_FAULT, "Problem making xpcMessage to send: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)sendAsynchronousMessage:(os_log_t)log withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:timeout:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_213298000, log, OS_LOG_TYPE_FAULT, "A target access queue is required for sending an asynchronous message with a completion handler.", v1, 2u);
}

@end
