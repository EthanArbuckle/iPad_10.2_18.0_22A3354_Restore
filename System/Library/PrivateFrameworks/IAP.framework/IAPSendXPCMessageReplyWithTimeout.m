@implementation IAPSendXPCMessageReplyWithTimeout

intptr_t ___IAPSendXPCMessageReplyWithTimeout_block_invoke(uint64_t a1, uint64_t a2)
{
  const char *string;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "requestType");
  v5 = "unknown";
  if (string)
    v6 = string;
  else
    v6 = "unknown";
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 == __iapd_connection)
  {
    v5 = "iapd";
  }
  else if (v7 == __iap2d_connection)
  {
    v5 = "iap2d";
  }
  else if (v7 == __iaptransportd_connection)
  {
    v5 = "iaptransportd";
  }
  NSLog(CFSTR("%s: Got reply for xpc message '%s' to %s server \n"), "_IAPSendXPCMessageReplyWithTimeout_block_invoke", v6, v5);
  v8 = *(_QWORD *)(a1 + 56);
  if (v8)
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
