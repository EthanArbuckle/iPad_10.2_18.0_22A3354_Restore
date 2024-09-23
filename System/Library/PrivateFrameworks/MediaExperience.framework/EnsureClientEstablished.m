@implementation EnsureClientEstablished

void __figRouteDiscovererRemoteXPC_EnsureClientEstablished_block_invoke()
{
  id v0;
  id v1;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = (id)objc_msgSend(v0, "initWithObjectsAndKeys:", CFSTR("RouteDiscoverer_ServerConnectionDied"), *MEMORY[0x1E0CA54A0], 0);
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  figRouteDiscovererRemoteXPC_EnsureClientEstablished_err = FigXPCRemoteClientCreate();

}

void __routingContextRemoteXPC_EnsureClientEstablished_block_invoke()
{
  NSObject *v0;

  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  gFigRoutingContextRemoteObject_1 = (uint64_t)dispatch_queue_create("com.apple.coremedia.remoteRoutingContext.contextWeakRef", v0);
  if (gFigRoutingContextRemoteObject_1
    && (routingContextRemoteXPC_EnsureClientEstablished_sFigRoutingContextRemoteClientMutex = FigSimpleMutexCreate()) != 0
    && (gFigRoutingContextRemoteObject_0 = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) != 0)
  {
    if (!routingContextRemoteXPC_EnsureClientEstablished_err)
      return;
  }
  else
  {
    routingContextRemoteXPC_EnsureClientEstablished_err = FigSignalErrorAt();
    if (!routingContextRemoteXPC_EnsureClientEstablished_err)
      return;
  }
  if (gFigRoutingContextRemoteObject_1)
  {
    dispatch_release((dispatch_object_t)gFigRoutingContextRemoteObject_1);
    gFigRoutingContextRemoteObject_1 = 0;
  }
  if (routingContextRemoteXPC_EnsureClientEstablished_sFigRoutingContextRemoteClientMutex)
  {
    FigSimpleMutexDestroy();
    routingContextRemoteXPC_EnsureClientEstablished_sFigRoutingContextRemoteClientMutex = 0;
  }
  if (gFigRoutingContextRemoteObject_0)
  {
    CFRelease((CFTypeRef)gFigRoutingContextRemoteObject_0);
    gFigRoutingContextRemoteObject_0 = 0;
  }
}

uint64_t __remoteSTS_EnsureClientEstablished_block_invoke()
{
  uint64_t result;

  result = FigXPCRemoteClientCreate();
  remoteSTS_EnsureClientEstablished_err = result;
  return result;
}

@end
