@implementation AVOutputContext

id __23__AVOutputContext_impl__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)predictedOutputDevice
{
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl"), "predictedOutputDevice");
}

- (id)outputDevices
{
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl"), "outputDevices");
}

- (id)contextID
{
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl"), "ID");
}

- (BOOL)providesControlForAllVolumeFeatures
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "providesControlForAllVolumeFeatures");
}

- (id)impl
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__24;
  v10 = __Block_byref_object_dispose__24;
  v11 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __23__AVOutputContext_impl__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

AVFigCommChannelUUIDCommunicationChannelManager *__87__AVOutputContext_FigRoutingContext__commChannelUUIDCommunicationChannelManagerCreator__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[AVFigCommChannelUUIDCommunicationChannelManager initWithRoutingContext:]([AVFigCommChannelUUIDCommunicationChannelManager alloc], "initWithRoutingContext:", a2);
}

+ (id)sharedAudioPresentationOutputContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedAudioPresentationOutputContext"));
}

+ (id)outputContextForID:(id)a3
{
  if (a3)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "outputContextImplForID:type:", a3, 0));
  else
    return 0;
}

- (AVOutputContext)initWithOutputContextImpl:(id)a3
{
  AVOutputContext *v4;
  AVOutputContextInternal *v5;
  AVOutputContextImpl *impl;
  AVOutputContext *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVOutputContext;
  v4 = -[AVOutputContext init](&v9, sel_init);
  if (v4
    && (v5 = objc_alloc_init(AVOutputContextInternal), (v4->_outputContext = v5) != 0)
    && (v4->_outputContext->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.outputcontext.ivars"),
        v4->_outputContext->impl = (AVOutputContextImpl *)a3,
        (impl = v4->_outputContext->impl) != 0))
  {
    -[AVOutputContextImpl setParentOutputContext:](impl, "setParentOutputContext:", v4);
    v7 = v4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)defaultOutputContextImplClass
{
  return (Class)objc_opt_class();
}

+ (id)commChannelUUIDCommunicationChannelManagerCreator
{
  return (id)objc_msgSend(&__block_literal_global_39, "copy");
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

+ (id)outputContext
{
  id v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__AVOutputContext_outputContext__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = a1;
  if (outputContext_onceToken != -1)
    dispatch_once(&outputContext_onceToken, block);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier"), "isEqualToString:", CFSTR("com.apple.UIKit.screenpicker")))v3 = (id)outputContext_sSharedContext;
  else
    v3 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "platformDependentScreenOrVideoContext"));
  return v3;
}

uint64_t __32__AVOutputContext_outputContext__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "defaultOutputContextImplClass"), "platformDependentScreenOrVideoContext"));
  outputContext_sSharedContext = result;
  return result;
}

+ (id)auxiliaryOutputContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "auxiliaryOutputContext"));
}

+ (id)sharedSystemAudioContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemAudioContext"));
}

+ (id)sharedSystemRemoteDisplayContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemRemoteDisplayContext"));
}

+ (id)sharedSystemScreenContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemScreenContext"));
}

+ (id)sharedSystemRemotePoolContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "sharedSystemRemotePoolContext"));
}

+ (id)iTunesAudioContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "iTunesAudioContext"));
}

+ (id)addSharedAudioOutputContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "addSharedAudioOutputContextImpl"));
}

+ (id)allSharedAudioOutputContexts
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "allSharedAudioOutputContextImpls");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v3;
}

+ (id)defaultSharedOutputContext
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "defaultSharedOutputContextImpl");
  if (result)
    return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", result);
  return result;
}

+ (id)outputContextForControllingOutputDeviceGroupWithID:(id)a3 options:(id)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend(a1, "defaultOutputContextImplClass"), "outputContextImplForControllingOutputDeviceGroupWithID:options:", a3, a4));
}

+ (id)outputContextForControllingOutputDeviceGroupWithID:(id)a3
{
  return (id)objc_msgSend(a1, "outputContextForControllingOutputDeviceGroupWithID:options:", a3, 0);
}

- (AVOutputContext)init
{
  return -[AVOutputContext initWithOutputContextImpl:](self, "initWithOutputContextImpl:", objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "defaultOutputContextImplClass"), "platformDependentScreenOrVideoContext"));
}

- (AVOutputContext)initWithCoder:(id)a3
{
  AVOutputContext *v5;
  uint64_t v6;
  uint64_t v7;
  AVOutputContext *v8;

  v5 = (AVOutputContext *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVOutputContextSerializationKeyContextID"));
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AVOutputContextSerializationKeyContextType"));
  if (v5)
  {
    v7 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "defaultOutputContextImplClass"), "outputContextImplForID:type:", v5, v6);
    if (v7
      && (v8 = -[AVOutputContext initWithOutputContextImpl:](self, "initWithOutputContextImpl:", v7), (self = v8) != 0))
    {
      v5 = v8;
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  id v6;

  v5 = -[AVOutputContext contextID](self, "contextID");
  v6 = -[AVOutputContext outputContextType](self, "outputContextType");
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("AVOutputContextSerializationKeyContextID"));
  objc_msgSend(a3, "encodeObject:forKey:", v6, CFSTR("AVOutputContextSerializationKeyContextType"));
}

- (void)dealloc
{
  AVOutputContextInternal *outputContext;
  NSObject *ivarAccessQueue;
  objc_super v5;

  outputContext = self->_outputContext;
  if (outputContext)
  {

    outputContext = self->_outputContext;
    ivarAccessQueue = outputContext->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      outputContext = self->_outputContext;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)AVOutputContext;
  -[AVOutputContext dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, ID=%@, type=%@>"), NSStringFromClass(v4), self, -[AVOutputContext contextID](self, "contextID"), -[AVOutputContext outputContextType](self, "outputContextType"));
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(-[AVOutputContext impl](self, "impl"), "isEqual:", objc_msgSend(a3, "impl"));
  else
    return 0;
}

- (unint64_t)hash
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "hash");
}

- (id)outputContextType
{
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl"), "outputContextType");
}

- (int)applicationProcessID
{
  int v3;

  v3 = 0;
  -[AVOutputContext getApplicationProcessID:](self, "getApplicationProcessID:", &v3);
  return v3;
}

- (BOOL)getApplicationProcessID:(int *)a3
{
  NSObject *ivarAccessQueue;
  int v5;
  BOOL v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVOutputContext_getApplicationProcessID___block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v13;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v5 = *((unsigned __int8 *)v14 + 24);
  if (*((_BYTE *)v14 + 24))
    *a3 = *((_DWORD *)v10 + 6);
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

_QWORD *__43__AVOutputContext_getApplicationProcessID___block_invoke(_QWORD *result)
{
  *(_DWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 32);
  *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 36);
  return result;
}

- (void)setApplicationProcessID:(int)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *ivarAccessQueue;
  _QWORD block[5];
  int v8;
  os_log_type_t type;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    v10 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVOutputContext_setApplicationProcessID___block_invoke;
  block[3] = &unk_1E30317D0;
  block[4] = self;
  v8 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend(-[AVOutputContext impl](self, "impl"), "outputContextDidChangeApplicationProcessID:", self);
}

uint64_t __43__AVOutputContext_setApplicationProcessID___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = *(_DWORD *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 36) = 1;
  return result;
}

- (NSString)deviceName
{
  NSString *result;

  result = -[AVOutputContext outputDevice](self, "outputDevice");
  if (result)
    return (NSString *)-[NSString name](result, "name");
  return result;
}

- (id)outputDevice
{
  void *v3;

  v3 = (void *)objc_msgSend(-[AVOutputContext impl](self, "impl"), "outputDevice");
  -[AVOutputContext supportsMultipleOutputDevices](self, "supportsMultipleOutputDevices");
  return v3;
}

- (void)setOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[7];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicePasswordKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceCancelIfAuthRequiredKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceSuppressUserInteractionOnSenderOnlyKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceInitiatorKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceFadePlaybackKey"));
  if (dword_1ECDECEF8)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = -[AVOutputContext impl](self, "impl", v11, v12);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__AVOutputContext_setOutputDevice_options_completionHandler___block_invoke;
  v13[3] = &unk_1E3034290;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  objc_msgSend(v10, "setOutputDevice:options:completionHandler:", a3, a4, v13);
}

uint64_t __61__AVOutputContext_setOutputDevice_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a2, "status", v6, v7) == 2
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeGroupControl")) & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeSharedSystemRemotePool")) & 1) == 0&& objc_msgSend(*(id *)(a1 + 40), "ID"))
  {
    objc_msgSend(*(id *)(a1 + 40), "updateFrecencyScore");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  return result;
}

- (unint64_t)outputDeviceFeatures
{
  NSObject *ivarAccessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__AVOutputContext_outputDeviceFeatures__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__AVOutputContext_outputDeviceFeatures__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (BOOL)setOutputDevice:(id)a3 forFeatures:(unint64_t)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;
  id v9;
  NSObject *ivarAccessQueue;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD block[6];
  os_log_type_t type;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array", v15, v16);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v17[0] = v11;
  v17[1] = 3221225472;
  v17[2] = __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke_2;
  v17[3] = &unk_1E30342B8;
  v17[4] = v9;
  v17[5] = v8;
  -[AVOutputContext setOutputDevice:options:completionHandler:](self, "setOutputDevice:options:completionHandler:", a3, 0, v17);
  objc_msgSend(v9, "lock");
  v12 = (void *)objc_msgSend(v8, "firstObject");
  if (v12)
    v13 = objc_msgSend(v12, "status") == 2;
  else
    v13 = 1;
  objc_msgSend(v9, "unlock");

  return v13;
}

uint64_t __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __47__AVOutputContext_setOutputDevice_forFeatures___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

- (void)setOutputDevice:(id)a3 options:(id)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicePasswordKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceCancelIfAuthRequiredKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceSuppressUserInteractionOnSenderOnlyKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceInitiatorKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDeviceFadePlaybackKey"));
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext setOutputDevice:options:completionHandler:](self, "setOutputDevice:options:completionHandler:", a3, a4, 0, v8, v9);
}

+ (void)resetOutputDeviceForAllOutputContexts
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  os_log_type_t type;
  int v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    v16 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v17 = objc_msgSend(a1, "defaultOutputContextImplClass", v9, v10, 0);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "resetOutputDeviceForAllOutputContexts");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v18, 16);
    }
    while (v6);
  }
}

+ (BOOL)outputContextExistsWithRemoteOutputDevice
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = objc_msgSend(a1, "defaultOutputContextImplClass", 0);
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v2);
      if ((v5 & 1) != 0)
        v5 = 1;
      else
        v5 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "outputContextExistsWithRemoteOutputDevice");
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  }
  while (v4);
  return v5;
}

- (void)outputContextImpl:(id)a3 didInitiateDestinationChange:(id)a4
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("AVOutputContextDestinationChangeKey");
  v10[0] = a4;
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7, v8), "postNotificationName:object:userInfo:", CFSTR("AVOutputContextDestinationChangeInitiatedNotification"), self, v5);
}

- (void)outputContextImpl:(id)a3 didChangeOutputDeviceWithInitiator:(id)a4
{
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v9 = CFSTR("AVOutputContextDestinationChangeInitiatorKey");
    v10[0] = a4;
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  }
  else
  {
    v5 = 0;
  }
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v7, v8), "postNotificationName:object:userInfo:", CFSTR("AVOutputContextOutputDeviceDidChangeNotification"), self, v5);
}

- (void)outputContextImplDidChangeGlobalOutputDeviceConfiguration:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (AVOutputContextIsSystemContextAllowed_onceToken != -1)
    dispatch_once(&AVOutputContextIsSystemContextAllowed_onceToken, &__block_literal_global_25);
  if (AVOutputContextIsSystemContextAllowed_isAllowed)
  {
    if (dword_1ECDECEF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextGlobalOutputDeviceConfigurationDidChangeNotification"), self);
  }
}

- (BOOL)supportsMultipleOutputDevices
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "supportsMultipleOutputDevices");
}

- (BOOL)supportsMultipleBluetoothOutputDevices
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "supportsMultipleBluetoothOutputDevices");
}

- (void)outputContextImpl:(id)a3 didChangeOutputDevicesWithInitiator:(id)a4 reason:(id)a5 deviceID:(id)a6 previousDeviceIDs:(id)a7
{
  void *v12;
  void *v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v13 = v12;
  if (a4)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", a4, CFSTR("AVOutputContextDestinationChangeInitiatorKey"));
  if (a5)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", a5, CFSTR("AVOutputContextDestinationChangeReasonKey"));
  if (a6)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", a6, CFSTR("AVOutputContextDestinationChangeDeviceIDKey"));
  if (a7)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", a7, CFSTR("AVOutputContextDestinationChangePreviousDeviceIDsKey"));
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v15, v16), "postNotificationName:object:userInfo:", CFSTR("AVOutputContextOutputDevicesDidChangeNotification"), self, v13);
}

- (void)setOutputDevices:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext setOutputDevices:options:completionHandler:](self, "setOutputDevices:options:completionHandler:", a3, 0, 0, v6, v7);
}

- (void)setOutputDevices:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[7];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextSetOutputDevicesOptionFadePlayback"));
  if (dword_1ECDECEF8)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = -[AVOutputContext impl](self, "impl", v11, v12);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__AVOutputContext_setOutputDevices_options_completionHandler___block_invoke;
  v13[3] = &unk_1E3034290;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  objc_msgSend(v10, "setOutputDevices:options:completionHandler:", a3, a4, v13);
}

uint64_t __62__AVOutputContext_setOutputDevices_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  os_log_type_t type;
  int v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    v19 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a2, "status", v12, v13) == 2
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeGroupControl")) & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeSharedSystemRemotePool")) & 1) == 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *(void **)(a1 + 40);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "ID"))
            objc_msgSend(v10, "updateFrecencyScore");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v7);
    }
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  return result;
}

- (void)addOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[7];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionAuthorizationToken"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceCancelIfAuthRequiredKey"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionInitiator"));
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextAddOutputDeviceOptionFadePlayback"));
  if (dword_1ECDECEF8)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = -[AVOutputContext impl](self, "impl", v11, v12);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__AVOutputContext_addOutputDevice_options_completionHandler___block_invoke;
  v13[3] = &unk_1E3034290;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  objc_msgSend(v10, "addOutputDevice:options:completionHandler:", a3, a4, v13);
}

uint64_t __61__AVOutputContext_addOutputDevice_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (objc_msgSend(a2, "status", v6, v7) == 2
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeGroupControl")) & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "outputContextType"), "isEqualToString:", CFSTR("AVOutputContextTypeSharedSystemRemotePool")) & 1) == 0&& objc_msgSend(*(id *)(a1 + 40), "ID"))
  {
    objc_msgSend(*(id *)(a1 + 40), "updateFrecencyScore");
  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, void *))(result + 16))(result, a2);
  return result;
}

- (void)addOutputDevice:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext addOutputDevice:options:completionHandler:](self, "addOutputDevice:options:completionHandler:", a3, 0, 0, v6, v7);
}

- (void)removeOutputDevice:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[6];
  os_log_type_t type;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("AVOutputContextRemoveOutputDeviceOptionFadePlayback"));
  if (dword_1ECDECEF8)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = -[AVOutputContext impl](self, "impl", v11, v12);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__AVOutputContext_removeOutputDevice_options_completionHandler___block_invoke;
  v13[3] = &unk_1E30342E0;
  v13[4] = self;
  v13[5] = a5;
  objc_msgSend(v10, "removeOutputDevice:options:completionHandler:", a3, a4, v13);
}

uint64_t __64__AVOutputContext_removeOutputDevice_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t result;

  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)removeOutputDevice:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[AVOutputContext removeOutputDevice:options:completionHandler:](self, "removeOutputDevice:options:completionHandler:", a3, 0, 0, v6, v7);
}

- (void)outputContextImplDidChangePredictedOutputDevice:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextPredictedOutputDeviceDidChangeNotification"), self);
}

- (void)resetPredictedOutputDevice
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(-[AVOutputContext impl](self, "impl", v4, v5), "resetPredictedOutputDevice");
}

- (void)outputContextImplDidChangeProvidesControlForAllVolumeFeatures:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextProvidesControlForAllVolumeFeaturesDidChangeNotification"), self);
}

- (float)volume
{
  float result;

  objc_msgSend(-[AVOutputContext impl](self, "impl"), "volume");
  return result;
}

- (void)outputContextImplDidChangeVolume:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextVolumeDidChangeNotification"), self);
}

- (BOOL)canSetVolume
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "canSetVolume");
}

- (void)outputContextImplDidChangeCanSetVolume:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextCanSetVolumeDidChangeNotification"), self);
}

- (void)outputContextImplDidChangeCanMute:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextCanMuteDidChangeNotification"), self);
}

- (void)outputContextImplDidChangeMute:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextMutedDidChangeNotification"), self);
}

- (void)setVolume:(float)a3
{
  id v4;
  double v5;

  v4 = -[AVOutputContext impl](self, "impl");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setVolume:", v5);
}

- (void)increaseVolumeByCount:(int64_t)a3
{
  objc_msgSend(-[AVOutputContext impl](self, "impl"), "increaseVolumeByCount:", a3);
}

- (void)decreaseVolumeByCount:(int64_t)a3
{
  objc_msgSend(-[AVOutputContext impl](self, "impl"), "decreaseVolumeByCount:", a3);
}

- (int64_t)volumeControlType
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "volumeControlType");
}

- (BOOL)canMute
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "canMute");
}

- (BOOL)isMuted
{
  return objc_msgSend(-[AVOutputContext impl](self, "impl"), "isMuted");
}

- (void)setMuted:(BOOL)a3
{
  objc_msgSend(-[AVOutputContext impl](self, "impl"), "setMuted:", a3);
}

- (void)outputContextImplDidChangeVolumeControlType:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, v5, v6), "postNotificationName:object:", CFSTR("AVOutputContextVolumeControlTypeDidChangeNotification"), self);
}

- (id)outgoingCommunicationChannel
{
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl"), "outgoingCommunicationChannel");
}

- (id)communicationChannelDelegate
{
  return objc_loadWeak((id *)&self->_outputContext->communicationChannelDelegate);
}

- (id)openCommunicationChannelWithOptions:(id)a3 error:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return (id)objc_msgSend(-[AVOutputContext impl](self, "impl", v9, v10), "openCommunicationChannelWithOptions:error:", a3, a4);
}

- (void)setCommunicationChannelDelegate:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1ECDECEF8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_storeWeak((id *)&self->_outputContext->communicationChannelDelegate, a3);
}

- (void)outputContextImplOutgoingCommunicationChannelDidBecomeAvailable:(id)a3
{
  id v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = -[AVOutputContext communicationChannelDelegate](self, "communicationChannelDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECEF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v4, "outputContextOutgoingCommunicationChannelDidBecomeAvailable:", self, v7, v8);
  }
  else if (dword_1ECDECEF8)
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputContextImpl:(id)a3 didReceiveData:(id)a4 fromCommunicationChannel:(id)a5
{
  id v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = -[AVOutputContext communicationChannelDelegate](self, "communicationChannelDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECEF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v8, "outputContext:didReceiveData:fromCommunicationChannel:", self, a4, a5, v11, v12);
  }
  else if (dword_1ECDECEF8)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputContextImpl:(id)a3 didCloseCommunicationChannel:(id)a4
{
  id v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = -[AVOutputContext communicationChannelDelegate](self, "communicationChannelDelegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (dword_1ECDECEF8)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v6, "outputContext:didCloseCommunicationChannel:", self, a4, v9, v10);
  }
  else if (dword_1ECDECEF8)
  {
    v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)outputContextImpl:(id)a3 didExpireWithReplacement:(id)a4
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__24;
  v12 = __Block_byref_object_dispose__24;
  v13 = 0;
  ivarAccessQueue = self->_outputContext->ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVOutputContext_outputContextImpl_didExpireWithReplacement___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a4;
  block[6] = &v8;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  objc_msgSend((id)v9[5], "setParentOutputContext:", 0);
  objc_msgSend(a4, "setParentOutputContext:", self);
  -[AVOutputContext outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:](self, "outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:", -[AVOutputContext impl](self, "impl"), CFSTR("server death"), 0, 0, 0);
  -[AVOutputContext outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:](self, "outputContextImpl:didChangeOutputDevicesWithInitiator:reason:deviceID:previousDeviceIDs:", -[AVOutputContext impl](self, "impl"), CFSTR("server death"), 0, 0, 0);
  -[AVOutputContext outputContextImplDidChangeGlobalOutputDeviceConfiguration:](self, "outputContextImplDidChangeGlobalOutputDeviceConfiguration:", -[AVOutputContext impl](self, "impl"));

  _Block_object_dispose(&v8, 8);
}

id __62__AVOutputContext_outputContextImpl_didExpireWithReplacement___block_invoke(uint64_t a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_retain(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                              + 8)
                                                                                  + 16));

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) = result;
  return result;
}

+ (id)preferredOutputDevicesForAudioSession:(id)a3
{
  void *v4;
  const void *v5;
  uint64_t v6;
  unsigned int (*v7)(const void *, _QWORD, uint64_t);
  uint64_t (*v8)(const void *, _QWORD, _QWORD, CFArrayRef *);
  int v9;
  CFArrayRef v10;
  BOOL v11;
  CFIndex v12;
  CFArrayRef theArray;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  theArray = 0;
  v5 = (const void *)AVCreateRouteDiscovererWithType(2);
  if (!v5
    || !+[AVOutputDevice prefersRouteDescriptors](AVOutputDevice, "prefersRouteDescriptors")
    || (v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "opaqueSessionID")),
        (v7 = *(unsigned int (**)(const void *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 56)) == 0)
    || v7(v5, *MEMORY[0x1E0D48B98], v6)
    || (v8 = *(uint64_t (**)(const void *, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48)) == 0)
  {
LABEL_13:
    v10 = theArray;
    goto LABEL_14;
  }
  v9 = v8(v5, *MEMORY[0x1E0D48BA0], *MEMORY[0x1E0C9AE00], &theArray);
  v10 = theArray;
  if (v9)
    v11 = 1;
  else
    v11 = theArray == 0;
  if (!v11)
  {
    if (CFArrayGetCount(theArray) >= 1)
    {
      v12 = 0;
      do
      {
        CFArrayGetValueAtIndex(theArray, v12);
        FigCFDictionaryGetBooleanIfPresent();
        ++v12;
      }
      while (v12 < CFArrayGetCount(theArray));
    }
    goto LABEL_13;
  }
LABEL_14:
  if (v10)
    CFRelease(v10);
  if (v5)
    CFRelease(v5);
  return v4;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 outputDeviceTranslator:(id)a4
{
  const void *v7;
  AVFigRoutingContextOutputContextImpl *v8;
  AVOutputContext *v9;

  v7 = (const void *)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  FigVolumeControllerCopySharedControllerRemote();
  v8 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:]([AVFigRoutingContextOutputContextImpl alloc], "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", v7, a3, a4, 0, objc_msgSend(a1, "defaultCommunicationChannelManagerCreator"));
  v9 = -[AVOutputContext initWithOutputContextImpl:]([AVOutputContext alloc], "initWithOutputContextImpl:", v8);
  if (v7)
    CFRelease(v7);

  return v9;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 volumeController:(OpaqueFigVolumeControllerState *)a4
{
  _BOOL8 v7;
  id DefaultDeviceTranslator;
  const void *v9;
  AVFigRoutingContextOutputContextImpl *v10;
  AVOutputContext *v11;

  v7 = AVOutputContextUsesRouteConfigUpdatedNotification();
  DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(v7);
  v9 = (const void *)(*((uint64_t (**)(id))a3 + 2))(a3);
  v10 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:]([AVFigRoutingContextOutputContextImpl alloc], "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", v9, a3, DefaultDeviceTranslator, a4, objc_msgSend(a1, "defaultCommunicationChannelManagerCreator"));
  v11 = -[AVOutputContext initWithOutputContextImpl:]([AVOutputContext alloc], "initWithOutputContextImpl:", v10);
  if (v9)
    CFRelease(v9);

  return v11;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3 communicationChannelManagerCreator:(id)a4
{
  const void *v6;
  _BOOL8 v7;
  id DefaultDeviceTranslator;
  AVFigRoutingContextOutputContextImpl *v9;
  AVOutputContext *v10;

  v6 = (const void *)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  v7 = AVOutputContextUsesRouteConfigUpdatedNotification();
  DefaultDeviceTranslator = AVOutputContextGetDefaultDeviceTranslator(v7);
  FigVolumeControllerCopySharedControllerRemote();
  v9 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:]([AVFigRoutingContextOutputContextImpl alloc], "initWithFigRoutingContext:routingContextReplacementBlock:outputDeviceTranslator:volumeController:communicationChannelManagerCreator:", v6, a3, DefaultDeviceTranslator, 0, a4);
  v10 = -[AVOutputContext initWithOutputContextImpl:]([AVOutputContext alloc], "initWithOutputContextImpl:", v9);
  if (v6)
    CFRelease(v6);

  return v10;
}

+ (AVOutputContext)outputContextWithFigRoutingContextCreator:(id)a3
{
  AVFigRoutingContextOutputContextImpl *v3;
  AVOutputContext *v4;

  v3 = -[AVFigRoutingContextOutputContextImpl initWithFigRoutingContextCreator:]([AVFigRoutingContextOutputContextImpl alloc], "initWithFigRoutingContextCreator:", a3);
  v4 = -[AVOutputContext initWithOutputContextImpl:]([AVOutputContext alloc], "initWithOutputContextImpl:", v3);

  return v4;
}

- (OpaqueFigRoutingContext)figRoutingContext
{
  id v2;

  v2 = -[AVOutputContext impl](self, "impl");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (OpaqueFigRoutingContext *)objc_msgSend(v2, "figRoutingContext");
  else
    return 0;
}

@end
