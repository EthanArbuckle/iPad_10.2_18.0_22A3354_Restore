@implementation AVOutputContextManager

+ (id)outputContextManagerForAllOutputContexts
{
  if (outputContextManagerForAllOutputContexts_onceToken != -1)
    dispatch_once(&outputContextManagerForAllOutputContexts_onceToken, &__block_literal_global_324);
  return (id)outputContextManagerForAllOutputContexts_sSharedManager;
}

void __66__AVOutputContextManager_outputContextManagerForAllOutputContexts__block_invoke()
{
  OpaqueFigEndpointUIAgent *v0;
  AVFigEndpointUIAgentOutputContextManagerImpl *v1;

  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent](AVFigEndpointUIAgentOutputContextManagerImpl, "copySharedEndpointUIAgent");
  v1 = -[AVFigEndpointUIAgentOutputContextManagerImpl initWithEndpointUIAgent:]([AVFigEndpointUIAgentOutputContextManagerImpl alloc], "initWithEndpointUIAgent:", v0);
  outputContextManagerForAllOutputContexts_sSharedManager = -[AVOutputContextManager initWithOutputContextManagerImpl:]([AVOutputContextManager alloc], "initWithOutputContextManagerImpl:", v1);
  AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped_block_invoke_notificationToken = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1E304D5F8, 0, 0, &__block_literal_global_328);
  if (v0)
    CFRelease(v0);

}

void __66__AVOutputContextManager_outputContextManagerForAllOutputContexts__block_invoke_2()
{
  OpaqueFigEndpointUIAgent *v0;
  AVFigEndpointUIAgentOutputContextManagerImpl *v1;

  v0 = +[AVFigEndpointUIAgentOutputContextManagerImpl copySharedEndpointUIAgent](AVFigEndpointUIAgentOutputContextManagerImpl, "copySharedEndpointUIAgent");
  v1 = -[AVFigEndpointUIAgentOutputContextManagerImpl initWithEndpointUIAgent:]([AVFigEndpointUIAgentOutputContextManagerImpl alloc], "initWithEndpointUIAgent:", v0);
  objc_msgSend((id)outputContextManagerForAllOutputContexts_sSharedManager, "outputContextManagerImplDidExpireWithReplacementImpl:", v1);

  if (v0)
    CFRelease(v0);
}

- (AVOutputContextManager)initWithOutputContextManagerImpl:(id)a3
{
  AVOutputContextManager *v4;
  AVOutputContextManagerInternal *v5;
  AVOutputContextManager *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVOutputContextManager;
  v4 = -[AVOutputContextManager init](&v8, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputContextManagerInternal), (v4->_ivars = v5) != 0)
    && (v4->_ivars->impl = (AVOutputContextManagerImpl *)a3) != 0)
  {
    v4->_ivars->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontextmanager.ivars");
    -[AVOutputContextManagerImpl setParentOutputContextManager:](v4->_ivars->impl, "setParentOutputContextManager:", v4);
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  AVOutputContextManagerInternal *ivars;
  NSObject *ivarAccessQueue;
  objc_super v5;

  ivars = self->_ivars;
  if (ivars)
  {

    ivars = self->_ivars;
    ivarAccessQueue = ivars->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      ivars = self->_ivars;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputContextManager;
  -[AVOutputContextManager dealloc](&v5, sel_dealloc);
}

- (void)outputContextManagerImpl:(id)a3 observedFailureToConnectToOutputDevice:(id)a4 reason:(id)a5 didFailToConnectToOutputDeviceDictionary:(id)a6
{
  void *v10;
  void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v11 = v10;
  if (a5)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", a5, CFSTR("AVOutputContextManagerFailureReasonKey"));
  if (a4)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", a4, CFSTR("AVOutputContextManagerOutputDeviceKey"));
  if (a6)
    objc_msgSend(v11, "setObject:forKeyedSubscript:", a6, CFSTR("AVOutputContextManagerDidFailToConnectToOutputDeviceUserInfoKey"));
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v13, v14), "postNotificationName:object:userInfo:", CFSTR("AVOutputContextManagerOutputContextDidFailToConnectToOutputDeviceNotification"), self, v11);
}

- (void)outputContextManagerImplDidExpireWithReplacementImpl:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__24;
  v11 = __Block_byref_object_dispose__24;
  v12 = 0;
  ivarAccessQueue = self->_ivars->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVOutputContextManager_outputContextManagerImplDidExpireWithReplacementImpl___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend((id)v8[5], "setParentOutputContextManager:", 0);
  objc_msgSend(a3, "setParentOutputContextManager:", self);

  _Block_object_dispose(&v7, 8);
}

id __79__AVOutputContextManager_outputContextManagerImplDidExpireWithReplacementImpl___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 16));

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) = result;
  return result;
}

@end
