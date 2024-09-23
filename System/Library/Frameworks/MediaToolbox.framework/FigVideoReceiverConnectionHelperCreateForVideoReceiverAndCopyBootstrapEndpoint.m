@implementation FigVideoReceiverConnectionHelperCreateForVideoReceiverAndCopyBootstrapEndpoint

dispatch_queue_t __FigVideoReceiverConnectionHelperCreateForVideoReceiverAndCopyBootstrapEndpoint_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.coremedia.videoreceiver.bootstrap", 0);
  FigVideoReceiverConnectionHelperCreateForVideoReceiverAndCopyBootstrapEndpoint_sharedBootstrapQueue = (uint64_t)result;
  return result;
}

void __FigVideoReceiverConnectionHelperCreateForVideoReceiverAndCopyBootstrapEndpoint_block_invoke_2(uint64_t a1, _xpc_connection_s *a2)
{
  void *context;
  _QWORD *v5;
  void *v6;
  _QWORD handler[5];

  if (MEMORY[0x194031C7C](a2) == MEMORY[0x1E0C812E0])
  {
    context = xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
    v5 = (_QWORD *)FigCFWeakReferenceHolderCopyReferencedObject();
    xpc_connection_set_context(a2, context);
    if (context)
      CFRetain(context);
    xpc_connection_set_finalizer_f(a2, (xpc_finalizer_t)sharedConnectionFinalize);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __connectionHelper_handleNewBootstrapConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_19_6;
    handler[4] = a2;
    xpc_connection_set_event_handler(a2, handler);
    v6 = (void *)v5[4];
    if (v6)
    {
      v5[4] = 0;
      xpc_release(v6);
    }
    v5[4] = FigXPCRetain();
    xpc_connection_activate(a2);
    CFRelease(v5);
  }
}

@end
