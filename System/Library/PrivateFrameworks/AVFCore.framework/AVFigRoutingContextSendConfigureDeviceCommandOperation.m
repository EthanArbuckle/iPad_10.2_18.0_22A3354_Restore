@implementation AVFigRoutingContextSendConfigureDeviceCommandOperation

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextSendConfigureDeviceCommandOperation)init
{
  return -[AVFigRoutingContextSendConfigureDeviceCommandOperation initWithRoutingContext:configuratorBlock:](self, "initWithRoutingContext:configuratorBlock:", 0, 0);
}

- (AVFigRoutingContextSendConfigureDeviceCommandOperation)initWithRoutingContext:(OpaqueFigRoutingContext *)a3 configuratorBlock:(id)a4
{
  AVFigRoutingContextSendConfigureDeviceCommandOperation *v6;
  AVFigRoutingContextSendConfigureDeviceCommandOperation *v7;
  OpaqueFigRoutingContext *v8;
  uint64_t v9;
  AVFigRoutingContextSendConfigureDeviceCommandOperation *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVFigRoutingContextSendConfigureDeviceCommandOperation;
  v6 = -[AVOperation init](&v12, sel_init);
  v7 = v6;
  if (a3)
  {
    v8 = (OpaqueFigRoutingContext *)CFRetain(a3);
    v7->_routingContext = v8;
    if (v8 && (v9 = objc_msgSend(a4, "copy"), (v7->_configuratorBlock = (id)v9) != 0))
      v10 = v7;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
    v6->_routingContext = 0;
  }

  return v10;
}

- (void)dealloc
{
  OpaqueFigRoutingContext *routingContext;
  objc_super v4;

  routingContext = self->_routingContext;
  if (routingContext)
    CFRelease(routingContext);

  v4.receiver = self;
  v4.super_class = (Class)AVFigRoutingContextSendConfigureDeviceCommandOperation;
  -[AVOperation dealloc](&v4, sel_dealloc);
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  AVFigRoutingContextCommandOutputDeviceConfigurationModification *v3;
  const __CFDictionary *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVFigRoutingContextSendConfigureDeviceCommandOperation *v6;
  OpaqueFigRoutingContext *routingContext;
  void (*v8)(OpaqueFigRoutingContext *, _QWORD, const __CFDictionary *, void (*)(uint64_t, const __CFDictionary *, signed int, void *), AVFigRoutingContextSendConfigureDeviceCommandOperation *);

  if (-[AVOperation evaluateDependenciesAndMarkAsExecuting](self, "evaluateDependenciesAndMarkAsExecuting"))
  {
    v3 = objc_alloc_init(AVFigRoutingContextCommandOutputDeviceConfigurationModification);
    (*((void (**)(void))self->_configuratorBlock + 2))();
    v4 = -[AVFigRoutingContextCommandOutputDeviceConfigurationModification routingContextCommandPayload](v3, "routingContextCommandPayload");
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA3920]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA3938]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA3928]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA3930]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA3908]);
    CFDictionaryGetValue(v4, (const void *)*MEMORY[0x1E0CA3910]);
    if (dword_1EE2B0190)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v6 = self;
    routingContext = self->_routingContext;
    v8 = *(void (**)(OpaqueFigRoutingContext *, _QWORD, const __CFDictionary *, void (*)(uint64_t, const __CFDictionary *, signed int, void *), AVFigRoutingContextSendConfigureDeviceCommandOperation *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 136);
    if (v8)
      v8(routingContext, *MEMORY[0x1E0CA4648], v4, AVSendCommandCompletion, v6);

  }
}

- (AVOutputDeviceConfigurationRetrieval)finalConfiguration
{
  return self->_finalConfiguration;
}

- (void)setFinalConfiguration:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

@end
