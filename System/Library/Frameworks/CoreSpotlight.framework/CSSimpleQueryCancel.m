@implementation CSSimpleQueryCancel

void __CSSimpleQueryCancel_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  if (!sConnection)
    sConnection = (uint64_t)xpc_connection_create_mach_service("com.apple.spotlight.SearchAgent", (dispatch_queue_t)sConnectionQueue, 0);
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "command", "simpleCancel");
  xpc_dictionary_set_uint64(v2, "qid", *(_QWORD *)(a1 + 32));
  xpc_connection_send_message((xpc_connection_t)sConnection, v2);
  xpc_release(v2);
}

@end
