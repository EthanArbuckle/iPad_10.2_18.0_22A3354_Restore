@implementation CMMTLCommandBuffer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interceptConfig, 0);
  objc_storeStrong((id *)&self->_commandBuffer, 0);
  objc_storeStrong((id *)&self->_cmCommandQueue, 0);
  objc_storeStrong((id *)&self->_cmLabel, 0);
}

- (InterceptConfig)interceptConfig
{
  return self->_interceptConfig;
}

- (CMMTLCommandBuffer)initWithCMMTLCommandQueue:(id)a3 unretained:(BOOL)a4
{
  id *v7;
  CMMTLCommandBuffer *v8;
  CMMTLCommandBuffer *v9;
  uint64_t v10;
  NSMutableString *cmLabel;
  MTLCommandQueue *commandQueue;
  uint64_t v13;
  MTLCommandBuffer *commandBuffer;
  uint64_t v15;
  MTLCommandBuffer *v16;
  CMMTLCommandBuffer *v17;
  CMMTLCommandBuffer *v18;
  int v20;
  objc_super v21;

  v7 = (id *)a3;
  v21.receiver = self;
  v21.super_class = (Class)CMMTLCommandBuffer;
  v8 = -[CMMTLCommandBuffer init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_unretained = a4;
    v10 = objc_opt_new();
    cmLabel = v9->_cmLabel;
    v9->_cmLabel = (NSMutableString *)v10;

    objc_storeStrong((id *)&v9->_cmCommandQueue, a3);
    commandQueue = v9->_cmCommandQueue->_commandQueue;
    if (v9->_unretained)
    {
      -[MTLCommandQueue commandBufferWithUnretainedReferences](commandQueue, "commandBufferWithUnretainedReferences");
      v13 = objc_claimAutoreleasedReturnValue();
      commandBuffer = v9->_commandBuffer;
      v9->_commandBuffer = (MTLCommandBuffer *)v13;

      if (!v9->_commandBuffer)
      {
LABEL_9:
        FigDebugAssert3();
        v20 = FigSignalErrorAt();
        v17 = 0;
        if (v20)
          goto LABEL_8;
        goto LABEL_7;
      }
    }
    else
    {
      -[MTLCommandQueue commandBuffer](commandQueue, "commandBuffer");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v9->_commandBuffer;
      v9->_commandBuffer = (MTLCommandBuffer *)v15;

      if (!v9->_commandBuffer)
        goto LABEL_9;
    }
    objc_storeStrong((id *)&v9->_interceptConfig, v7[3]);
    if (!v9->_interceptConfig)
      goto LABEL_9;
  }
LABEL_7:
  v17 = v9;
LABEL_8:
  v18 = v17;

  return v18;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  MTLCommandBuffer *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = self->_commandBuffer;
  else
    v4 = 0;
  return v4;
}

void __28__CMMTLCommandBuffer_commit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    v5 = v4;
    objc_sync_enter(v5);
    objc_msgSend(*(id *)(a1 + 32), "setCompletedCommandBuffersCount:", objc_msgSend(*(id *)(a1 + 32), "completedCommandBuffersCount") + 1);
    if (objc_msgSend(v3, "status") == 5)
    {
      objc_msgSend(*(id *)(a1 + 32), "setStatus:", 5);
      objc_msgSend(v3, "label");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      generateCommandBufferLabel(v6, *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "failedCommandBuffers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

    }
    objc_sync_exit(v5);

  }
  if (objc_msgSend(v3, "status") != 4 && objc_msgSend(v3, "status") == 5)
  {
    objc_msgSend(v3, "label");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    generateCommandBufferLabel(v9, *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("(Error) %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("(Error) %@"), &stru_1E94ED9E8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v16 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    if (*(_BYTE *)(a1 + 48))
    {
      notify_post(kCMINotification_GPUError);
      v17 = getprogname();
      if (!strcmp(v17, "deferredmediad"))
      {
        if (os_log_type_enabled(0, OS_LOG_TYPE_FAULT))
          __28__CMMTLCommandBuffer_commit__block_invoke_cold_1(v15, v10);
        fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v18 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        exit(-1);
      }
    }

  }
}

- (void)waitUntilScheduled
{
  -[MTLCommandBuffer waitUntilScheduled](self->_commandBuffer, "waitUntilScheduled");
}

- (void)commit
{
  NSMutableString *v3;
  void *v4;
  BOOL v5;
  MTLCommandBuffer *commandBuffer;
  NSMutableString *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NSMutableString *v11;
  BOOL v12;

  v3 = self->_cmLabel;
  -[InterceptConfig executionStatus](self->_interceptConfig, "executionStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[InterceptConfig notifyPostOnGPUError](self->_interceptConfig, "notifyPostOnGPUError");
  commandBuffer = self->_commandBuffer;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__CMMTLCommandBuffer_commit__block_invoke;
  v9[3] = &unk_1E94EB250;
  v10 = v4;
  v11 = v3;
  v12 = v5;
  v7 = v3;
  v8 = v4;
  -[MTLCommandBuffer addCompletedHandler:](commandBuffer, "addCompletedHandler:", v9);
  -[MTLCommandBuffer commit](self->_commandBuffer, "commit");

}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)self->_cmCommandQueue;
}

- (void)waitUntilCompleted
{
  -[MTLCommandBuffer waitUntilCompleted](self->_commandBuffer, "waitUntilCompleted");
}

- (void)encodeWaitForEvent:(id)a3 value:(unint64_t)a4
{
  -[MTLCommandBuffer encodeWaitForEvent:value:timeout:](self->_commandBuffer, "encodeWaitForEvent:value:timeout:", a3, a4, 30);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CMMTLCommandBuffer;
  return -[CMMTLCommandBuffer respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "invokeWithTarget:", self->_commandBuffer);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CMMTLCommandBuffer;
    -[CMMTLCommandBuffer forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (void)setInterceptConfig:(id)a3
{
  objc_storeStrong((id *)&self->_interceptConfig, a3);
}

void __28__CMMTLCommandBuffer_commit__block_invoke_cold_1(void *a1, void *a2)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v5 = 2080;
  v6 = objc_msgSend(objc_retainAutorelease(a2), "UTF8String");
  _os_log_fault_impl(&dword_1D3239000, 0, OS_LOG_TYPE_FAULT, "Deferred processing: aborting due to GPU failure: %s (%s)", (uint8_t *)&v3, 0x16u);
}

@end
