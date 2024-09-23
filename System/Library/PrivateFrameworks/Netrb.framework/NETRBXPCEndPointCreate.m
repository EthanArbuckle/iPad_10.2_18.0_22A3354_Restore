@implementation NETRBXPCEndPointCreate

void __NETRBXPCEndPointCreate_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  _QWORD handler[5];

  v4 = MEMORY[0x20BD2C430](a2);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 && (v5 == __netrbReceiverConnection ? (v6 = v4 == MEMORY[0x24BDACFB8]) : (v6 = 0), v6))
  {
    if (a2 == (void *)MEMORY[0x24BDACF48] || a2 == (void *)MEMORY[0x24BDACF38])
      NETRBInfoLog();
  }
  else if (v4 == MEMORY[0x24BDACF88])
  {
    v7 = *(NSObject **)(a1 + 40);
    NETRBInfoLog();
    if (__netrbNotificationConnection)
    {
      xpc_connection_cancel((xpc_connection_t)__netrbNotificationConnection);
      xpc_release((xpc_object_t)__netrbNotificationConnection);
      __netrbNotificationConnection = 0;
    }
    __netrbNotificationConnection = (uint64_t)xpc_retain(a2);
    xpc_connection_set_target_queue((xpc_connection_t)a2, v7);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = ____NETRBXPCNewNotificationConnection_block_invoke;
    handler[3] = &__block_descriptor_tmp_75;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
}

@end
