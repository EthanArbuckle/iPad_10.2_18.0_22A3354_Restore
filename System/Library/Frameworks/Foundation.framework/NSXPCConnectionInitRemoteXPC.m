@implementation NSXPCConnectionInitRemoteXPC

void *___NSXPCConnectionInitRemoteXPC_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/RemoteXPC.framework/RemoteXPC", 256);
  qword_1ECD09FC0 = (uint64_t)result;
  if (result)
  {
    _xpc_remote_connection_activate = (uint64_t (*)(_QWORD))dlsym(result, "xpc_remote_connection_activate");
    _xpc_remote_connection_cancel = (uint64_t (*)(_QWORD))dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_cancel");
    _xpc_remote_connection_create_remote_service_listener = dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_create_remote_service_listener");
    off_1ECD09FC8 = dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_create_with_remote_service");
    off_1ECD09FD0 = (uint64_t (*)(_QWORD, _QWORD))dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_send_barrier");
    off_1ECD09FD8 = (uint64_t (*)(_QWORD, _QWORD))dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_send_message");
    off_1ECD09FE0 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_send_message_with_reply");
    off_1ECD09FE8 = (uint64_t (*)(void))dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_send_message_with_reply_sync");
    _xpc_remote_connection_set_event_handler = dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_set_event_handler");
    _xpc_remote_connection_set_target_queue = (uint64_t (*)(_QWORD, _QWORD))dlsym((void *)qword_1ECD09FC0, "xpc_remote_connection_set_target_queue");
    result = dlsym((void *)qword_1ECD09FC0, "_xpc_type_remote_connection");
    _XPC_TYPE_REMOTE_CONNECTION = (uint64_t)result;
  }
  return result;
}

@end
