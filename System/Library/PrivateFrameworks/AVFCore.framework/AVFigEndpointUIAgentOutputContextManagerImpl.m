@implementation AVFigEndpointUIAgentOutputContextManagerImpl

+ (OpaqueFigEndpointUIAgent)copySharedEndpointUIAgent
{
  if (copySharedEndpointUIAgent_onceToken != -1)
    dispatch_once(&copySharedEndpointUIAgent_onceToken, &__block_literal_global_323);
  dispatch_sync((dispatch_queue_t)sSharedAgentQueue, &__block_literal_global_325);
  return (OpaqueFigEndpointUIAgent *)sSharedAgent;
}

dispatch_queue_t __73__AVFigEndpointUIAgentOutputContextManagerImpl_copySharedEndpointUIAgent__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  result = dispatch_queue_create("com.apple.avfoundation.avoutputcontext.uiagentqueue", v0);
  sSharedAgentQueue = (uint64_t)result;
  return result;
}

CFTypeRef __73__AVFigEndpointUIAgentOutputContextManagerImpl_copySharedEndpointUIAgent__block_invoke_2()
{
  CFTypeRef result;

  result = (CFTypeRef)sSharedAgent;
  if (sSharedAgent)
    return CFRetain(result);
  result = (CFTypeRef)FigEndpointUIAgentXPCRemoteCreate();
  if (sSharedAgent)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    result = (CFTypeRef)sSharedAgent;
    if (sSharedAgent)
      return CFRetain(result);
  }
  return result;
}

- (AVFigEndpointUIAgentOutputContextManagerImpl)initWithEndpointUIAgent:(OpaqueFigEndpointUIAgent *)a3
{
  id v5;
  AVFigEndpointUIAgentOutputContextManagerImpl *v6;
  AVFigEndpointUIAgentOutputContextManagerImpl *v7;
  OpaqueFigEndpointUIAgent *v8;
  AVWeakReference *v9;
  OpaqueFigEndpointUIAgent *agent;
  void (*v11)(OpaqueFigEndpointUIAgent *, uint64_t);
  AVFigEndpointUIAgentOutputContextManagerImpl *v12;
  objc_super v14;

  v5 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v14.receiver = self;
  v14.super_class = (Class)AVFigEndpointUIAgentOutputContextManagerImpl;
  v6 = -[AVFigEndpointUIAgentOutputContextManagerImpl init](&v14, sel_init);
  v7 = v6;
  if (!v6)
    goto LABEL_9;
  if (!a3)
  {
    v12 = 0;
    v6->_agent = 0;
    goto LABEL_8;
  }
  v8 = (OpaqueFigEndpointUIAgent *)CFRetain(a3);
  v7->_agent = v8;
  if (!v8)
  {
LABEL_9:
    v12 = 0;
    goto LABEL_8;
  }
  v9 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v7);
  v7->_weakObserver = v9;
  objc_msgSend(v5, "addListenerWithWeakReference:callback:name:object:flags:", v9, AVOutputContextManagerShowErrorPrompt, *MEMORY[0x1E0D48AE8], v7->_agent, 0);
  agent = v7->_agent;
  v11 = *(void (**)(OpaqueFigEndpointUIAgent *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v11)
    v11(agent, 1);
  v12 = v7;
LABEL_8:

  return v12;
}

- (void)dealloc
{
  OpaqueFigEndpointUIAgent *agent;
  objc_super v4;

  if (self->_weakObserver)
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakObserver, AVOutputContextManagerShowErrorPrompt, *MEMORY[0x1E0D48AE8], self->_agent);
  agent = self->_agent;
  if (agent)
    CFRelease(agent);

  v4.receiver = self;
  v4.super_class = (Class)AVFigEndpointUIAgentOutputContextManagerImpl;
  -[AVFigEndpointUIAgentOutputContextManagerImpl dealloc](&v4, sel_dealloc);
}

- (void)_showErrorPromptForRouteDescriptor:(__CFDictionary *)a3 reason:(__CFString *)a4 didFailToConnectToOutputDeviceDictionary:(__CFDictionary *)a5
{
  AVOutputDevice *v7;
  __CFString **v8;
  const __CFString *v9;

  v7 = +[AVOutputDevice outputDeviceWithRouteDescriptor:withRoutingContext:](AVOutputDevice, "outputDeviceWithRouteDescriptor:withRoutingContext:", a3, 0);
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceInUse;
LABEL_13:
    v9 = *v8;
    goto LABEL_14;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceOutOfRange;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonNotAPeerInHomeGroup;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceNotConnectedToInternet;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonDeviceNotMFiCertified;
    goto LABEL_13;
  }
  if (FigCFEqual())
  {
    v8 = AVOutputContextDeviceConnectionFailureReasonInfraRelayFailed2GHzNetwork;
    goto LABEL_13;
  }
  if (FigCFEqual())
    v9 = CFSTR("AVOutputContextDeviceConnectionFailureReasonInfraRelayFailedMultiDFSNetwork");
  else
    v9 = 0;
LABEL_14:
  -[AVOutputContextManager outputContextManagerImpl:observedFailureToConnectToOutputDevice:reason:didFailToConnectToOutputDeviceDictionary:](-[AVFigEndpointUIAgentOutputContextManagerImpl parentOutputContextManager](self, "parentOutputContextManager"), "outputContextManagerImpl:observedFailureToConnectToOutputDevice:reason:didFailToConnectToOutputDeviceDictionary:", self, v7, v9, a5);
}

- (AVOutputContextManager)parentOutputContextManager
{
  return (AVOutputContextManager *)objc_loadWeak((id *)&self->_parentManager);
}

- (void)setParentOutputContextManager:(id)a3
{
  objc_storeWeak((id *)&self->_parentManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentManager);
}

@end
