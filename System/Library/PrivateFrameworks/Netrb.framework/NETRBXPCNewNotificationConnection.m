@implementation NETRBXPCNewNotificationConnection

void ____NETRBXPCNewNotificationConnection_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v10;

  v4 = MEMORY[0x20BD2C430](a2);
  v5 = MEMORY[0x20BD2C388](a2);
  if (v5)
  {
    v6 = (void *)v5;
    NETRBInfoLog();
    free(v6);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = v7 == __netrbNotificationConnection;
  else
    v8 = 0;
  if (v8 && v4 == MEMORY[0x24BDACFB8])
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    NETRBInfoLog();
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
    __netrbNotificationConnection = 0;
  }
  else
  {
    if (__netrbNotificationConnection)
      v10 = v4 == MEMORY[0x24BDACFA0];
    else
      v10 = 0;
    if (v10)
      NETRBClientSendNotification(a2);
    else
      NETRBNoticeLog();
  }
}

@end
