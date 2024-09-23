@implementation BWStillImageProcessorController

- (BWStillImageProcessorController)initWithName:(id)a3 type:(unint64_t)a4 configuration:(id)a5
{
  BWStillImageProcessorController *v8;
  char v9;
  FigStateMachine *v10;
  FigStateMachine *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWStillImageProcessorController;
  v8 = -[BWStillImageProcessorController init](&v13, sel_init);
  if (v8)
  {
    v8->_name = (NSString *)a3;
    v8->_type = a4;
    v8->_configuration = (BWStillImageProcessorControllerConfiguration *)a5;
    if ((objc_msgSend((id)objc_opt_class(), "usesCustomProcessingFlow") & 1) == 0)
    {
      v9 = +[FigStateMachine indexForState:](FigStateMachine, "indexForState:", 16);
      v10 = [FigStateMachine alloc];
      v11 = -[FigStateMachine initWithLabel:stateCount:initialState:owner:](v10, "initWithLabel:stateCount:initialState:owner:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ state machine"), -[BWStillImageProcessorController name](v8, "name")), v9, 1, v8);
      -[FigStateMachine setPerformsAtomicStateTransitions:](v11, "setPerformsAtomicStateTransitions:", 0);
      -[FigStateMachine setLabel:forState:](v11, "setLabel:forState:", CFSTR("Idle"), 1);
      -[FigStateMachine setLabel:forState:](v11, "setLabel:forState:", CFSTR("Ready"), 2);
      -[FigStateMachine setLabel:forState:](v11, "setLabel:forState:", CFSTR("Waiting"), 4);
      -[FigStateMachine setLabel:forState:](v11, "setLabel:forState:", CFSTR("Processing"), 8);
      -[FigStateMachine whenTransitioningToStates:callHandler:](v11, "whenTransitioningToStates:callHandler:", 1, &__block_literal_global_0);
      -[FigStateMachine whenTransitioningToStates:callHandler:](v11, "whenTransitioningToStates:callHandler:", 2, &__block_literal_global_284);
      -[FigStateMachine whenTransitioningToState:callHandler:](v11, "whenTransitioningToState:callHandler:", 4, &__block_literal_global_285);
      -[FigStateMachine whenTransitioningToState:callHandler:](v11, "whenTransitioningToState:callHandler:", 8, &__block_literal_global_286);
      v8->_stateMachine = v11;
      v8->_requestQueue = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStillImageProcessorControllerConfiguration)configuration
{
  return self->_configuration;
}

+ (BOOL)usesCustomProcessingFlow
{
  return 1;
}

- (BWStillImageProcessorController)initWithConfiguration:(id)a3
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[BWStillImageProcessorController initWithConfiguration:] Must be implemented by subclasses."), 0));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorController;
  -[BWStillImageProcessorController dealloc](&v3, sel_dealloc);
}

- (int)enqueueInputForProcessing:(id)a3 delegate:(id)a4
{
  id v7;
  int v9;

  v9 = 0;
  if ((objc_msgSend((id)objc_opt_class(), "usesCustomProcessingFlow") & 1) == 0)
  {
    if (-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType")&& !-[NSDictionary objectForKeyedSubscript:](-[BWStillImageProcessorControllerConfiguration sensorConfigurationsByPortType](self->_configuration, "sensorConfigurationsByPortType"), "objectForKeyedSubscript:", objc_msgSend(a3, "portType")))
    {
      return -12780;
    }
    else
    {
      v7 = -[BWStillImageProcessorController requestForInput:delegate:errOut:](self, "requestForInput:delegate:errOut:", a3, a4, &v9);
      if (!v9)
      {
        -[NSMutableArray addObject:](self->_requestQueue, "addObject:", v7);
        if (-[FigStateMachine currentState](self->_stateMachine, "currentState") == 1)
          -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", 2);
      }
    }
  }
  return v9;
}

- (void)cancelProcessing
{
  if ((objc_msgSend((id)objc_opt_class(), "usesCustomProcessingFlow") & 1) == 0)
  {
    -[NSMutableArray removeAllObjects](self->_requestQueue, "removeAllObjects");
    if (-[FigStateMachine currentState](self->_stateMachine, "currentState") != 8)
    {
      -[BWStillImageProcessorControllerRequest setErr:](self->_currentRequest, "setErr:", 4294950490);
      -[BWStillImageProcessorController _completeCurrentRequestAndInitiateNextRequest](self, "_completeCurrentRequestAndInitiateNextRequest");
      -[BWStillImageProcessorController _updateStateIfNeeded](self, "_updateStateIfNeeded");
    }
  }
}

- (void)purgeResources
{
  objc_msgSend((id)objc_opt_class(), "usesCustomProcessingFlow");
}

- (BOOL)supportsExternalMemoryResource
{
  -[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MetalImageBufferProcessor supportsExternalMemoryResource](-[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor"), "supportsExternalMemoryResource");
  else
    return 0;
}

- (CMIExternalMemoryDescriptor)externalMemoryDescriptor
{
  -[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (CMIExternalMemoryDescriptor *)-[MetalImageBufferProcessor externalMemoryDescriptorForConfiguration:](-[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor"), "externalMemoryDescriptorForConfiguration:", 0);
  else
    return 0;
}

- (void)setExternalMemoryResource:(id)a3
{
  -[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MetalImageBufferProcessor setExternalMemoryResource:](-[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor"), "setExternalMemoryResource:", a3);
}

- (CMIExternalMemoryResource)externalMemoryResource
{
  -[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (CMIExternalMemoryResource *)-[MetalImageBufferProcessor externalMemoryResource](-[BWStillImageProcessorController metalImageBufferProcessor](self, "metalImageBufferProcessor"), "externalMemoryResource");
  else
    return 0;
}

- (void)reset
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[BWStillImageProcessorController reset] Must be implemented by subclasses."), 0));
}

- (id)requestForInput:(id)a3 delegate:(id)a4 errOut:(int *)a5
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[BWStillImageProcessorController requestForInput:delegate:errOut:] Must be implemented by subclasses."), 0));
}

- (int)prepare
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[BWStillImageProcessorController prepare] Must be implemented by subclasses."), 0));
}

- (int)process
{
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("-[BWStillImageProcessorController process] Must be implemented by subclasses."), 0));
}

- (MetalImageBufferProcessor)metalImageBufferProcessor
{
  return 0;
}

- (void)_updateStateIfNeeded
{
  BWStillImageProcessorControllerRequest *currentRequest;
  unsigned int v4;
  uint64_t v5;

  currentRequest = self->_currentRequest;
  v4 = -[FigStateMachine currentState](self->_stateMachine, "currentState");
  if (currentRequest)
  {
    if (v4 == 2)
    {
      v5 = 4;
    }
    else if (v4 == 4)
    {
      if (-[BWStillImageProcessorControllerRequest readyForProcessing](currentRequest, "readyForProcessing"))
        v5 = 8;
      else
        v5 = 4;
    }
    else
    {
      v5 = 2;
    }
  }
  else
  {
    v5 = 1;
  }
  if ((_DWORD)v5 != -[FigStateMachine currentState](self->_stateMachine, "currentState"))
    -[FigStateMachine transitionToState:](self->_stateMachine, "transitionToState:", v5);
}

- (void)_completeCurrentRequestAndInitiateNextRequest
{
  BWStillImageProcessorControllerDelegate *v3;
  BWStillImageProcessorControllerInput *v4;
  uint64_t v5;
  unint64_t v6;
  opaqueCMSampleBuffer *v7;
  CFTypeRef v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWStillImageProcessorControllerRequest *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[BWStillImageProcessorControllerRequest delegate](self->_currentRequest, "delegate");
  v4 = -[BWStillImageProcessorControllerRequest input](self->_currentRequest, "input");
  v5 = -[BWStillImageProcessorControllerRequest err](self->_currentRequest, "err");
  v6 = -[BWStillImageProcessorControllerRequest outputType](self->_currentRequest, "outputType");
  v7 = -[BWStillImageProcessorControllerRequest outputFrame](self->_currentRequest, "outputFrame");
  if (v7)
  {
    v8 = CFRetain(v7);
    if (!v6)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
    if (!v6)
      goto LABEL_8;
  }
  if (!(_DWORD)v5 && !v8)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    self->_currentRequest = 0;
    goto LABEL_14;
  }
LABEL_8:

  self->_currentRequest = 0;
  if (!v6)
  {
    if (!v8)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_14:
  -[BWStillImageProcessorController _updateStateIfNeeded](self, "_updateStateIfNeeded", v11, v12);
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingSampleBuffer:type:processorInput:err:](v3, "processorController:didFinishProcessingSampleBuffer:type:processorInput:err:", self, v8, v6, v4, v5);
  if (v8)
LABEL_10:
    CFRelease(v8);
LABEL_11:
  -[BWStillImageProcessorControllerDelegate processorController:didFinishProcessingInput:err:](v3, "processorController:didFinishProcessingInput:err:", self, v4, v5);

  v10 = (BWStillImageProcessorControllerRequest *)(id)-[NSMutableArray firstObject](self->_requestQueue, "firstObject");
  self->_currentRequest = v10;
  if (v10)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_requestQueue, "removeObjectAtIndex:", 0);
    -[BWStillImageProcessorControllerInput setDelegate:](-[BWStillImageProcessorControllerRequest input](self->_currentRequest, "input"), "setDelegate:", self);
  }
}

- (void)_prepare
{
  -[BWStillImageProcessorControllerRequest setErr:](self->_currentRequest, "setErr:", -[BWStillImageProcessorController prepare](self, "prepare"));
  if (-[BWStillImageProcessorControllerRequest err](self->_currentRequest, "err"))
    -[BWStillImageProcessorController reset](self, "reset");
}

- (void)_process
{
  void *v3;

  if (!-[BWStillImageProcessorControllerRequest err](self->_currentRequest, "err"))
  {
    v3 = (void *)MEMORY[0x1A858DD40]();
    -[BWStillImageProcessorControllerRequest setErr:](self->_currentRequest, "setErr:", -[BWStillImageProcessorController process](self, "process"));
    objc_autoreleasePoolPop(v3);
    -[BWStillImageProcessorControllerRequest err](self->_currentRequest, "err");
  }
}

- (unint64_t)type
{
  return self->_type;
}

- (BWStillImageProcessorControllerRequest)currentRequest
{
  return self->_currentRequest;
}

@end
