@implementation IAPAppStartAccessibility

void __IAPAppStartAccessibility_block_invoke()
{
  BOOL v0;
  const char *v1;
  _xpc_connection_s *mach_service;

  if ((__eaClientCapabilities & 2) != 0)
  {
    if (__eaClientListener)
      v0 = 0;
    else
      v0 = __eaClientListenerQueue == 0;
    if (v0)
    {
      __eaClientListenerQueue = (uint64_t)dispatch_queue_create("IAPAppListenerQueue", 0);
      v1 = (const char *)objc_msgSend(CFSTR("com.apple.VoiceOverTouch.xpc"), "UTF8String");
      mach_service = xpc_connection_create_mach_service(v1, (dispatch_queue_t)__eaClientListenerQueue, 1uLL);
      __eaClientListener = (uint64_t)mach_service;
      if (mach_service)
      {
        xpc_connection_set_event_handler(mach_service, &__block_literal_global_221);
        xpc_connection_resume((xpc_connection_t)__eaClientListener);
      }
      else
      {
        NSLog(CFSTR("ERROR - %s:%s - %d IAPAppStartAccessibility _xpc_listener is not valid!\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppStartAccessibility_block_invoke", 1009);
      }
    }
  }
}

void __IAPAppStartAccessibility_block_invoke_2(uint64_t a1, _xpc_connection_s *a2)
{
  NSObject *v3;
  _QWORD handler[5];

  v3 = __eaClientListenerQueue;
  if (MEMORY[0x1B5E4DB38](a2) == MEMORY[0x1E0C812E0])
  {
    xpc_connection_set_target_queue(a2, v3);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = ___ZL28_xpc_handle_outgoing_requestPU24objcproto13OS_xpc_object8NSObjectPU28objcproto17OS_dispatch_queueS__block_invoke;
    handler[3] = &unk_1E69310E0;
    handler[4] = a2;
    xpc_connection_set_event_handler(a2, handler);
    xpc_connection_resume(a2);
  }
  else
  {
    NSLog(CFSTR("%s:%s-%d ERROR - _xpc_handle_outgoing_request received unhandled xpc type\n"), "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request", 1378);
  }
}

@end
