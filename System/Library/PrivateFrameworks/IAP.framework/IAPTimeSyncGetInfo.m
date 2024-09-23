@implementation IAPTimeSyncGetInfo

void __IAPTimeSyncGetInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _QWORD block[5];

  v4 = MEMORY[0x1B5E4DB38](a2);
  if (a2 == (void *)MEMORY[0x1E0C81260] && v4 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("IAPTimeSyncGetInfo received an XPC_ERROR_CONNECTION_INVALID error.\n"));
  }
  else if (a2 == (void *)MEMORY[0x1E0C81258] && v4 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("IAPTimeSyncGetInfo received an XPC_ERROR_CONNECTION_INTERRUPTED error.\n"));
  }
  else if (v4 == MEMORY[0x1E0C812F8])
  {
    if (xpc_dictionary_get_BOOL(a2, "result"))
    {
      xpc_retain(a2);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __IAPTimeSyncGetInfo_block_invoke_2;
      block[3] = &unk_1E69312B8;
      block[4] = a2;
      dispatch_async(*(dispatch_queue_t *)(a1 + 32), block);
    }
  }
  else if (v4 == MEMORY[0x1E0C81310])
  {
    NSLog(CFSTR("%s:%d Unhandled reply error!"), "IAPTimeSyncGetInfo_block_invoke", 113);
  }
  else
  {
    NSLog(CFSTR("%s:%d Unknown reply type %p!"), "IAPTimeSyncGetInfo_block_invoke", 117, v4);
  }
}

void __IAPTimeSyncGetInfo_block_invoke_2(uint64_t a1)
{
  const void *v2;
  uint64_t v3;

  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "timeSyncInfoDictionaryStr");
  v2 = (const void *)_CFXPCCreateCFObjectFromXPCMessage();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, const void *))(v3 + 16))(v3, v2);
  if (v2)
    CFRelease(v2);
  xpc_release(*(xpc_object_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

@end
