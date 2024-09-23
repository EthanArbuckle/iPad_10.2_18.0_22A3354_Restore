@implementation IOAccelMemoryInfoRegisterAPICollectionBlock

uint64_t __IOAccelMemoryInfoRegisterAPICollectionBlock_block_invoke()
{
  NSObject *global_queue;
  pthread_mutexattr_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2.__sig = 0;
  *(_QWORD *)v2.__opaque = 0;
  pthread_mutexattr_init(&v2);
  pthread_mutexattr_settype(&v2, 1);
  pthread_mutex_init(&ioaccel_collection_block_mutex, &v2);
  pthread_mutexattr_destroy(&v2);
  global_queue = dispatch_get_global_queue(0, 0);
  return notify_register_dispatch("com.apple.gpumemd.check_in_request", (int *)&ioaccel_memlist_notify_token, global_queue, &__block_literal_global_4);
}

uint64_t __IOAccelMemoryInfoRegisterAPICollectionBlock_block_invoke_2()
{
  xpc_object_t v0;

  pthread_mutex_lock(&ioaccel_collection_block_mutex);
  if (!ioaccel_memlist_connection)
  {
    ioaccel_memlist_connection = (uint64_t)xpc_connection_create_mach_service("com.apple.gpumemd.source", 0, 2uLL);
    xpc_connection_set_event_handler((xpc_connection_t)ioaccel_memlist_connection, &__block_literal_global_8);
    xpc_connection_resume((xpc_connection_t)ioaccel_memlist_connection);
    v0 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v0, "CheckIn", 1);
    xpc_connection_send_message((xpc_connection_t)ioaccel_memlist_connection, v0);
    xpc_release(v0);
  }
  return pthread_mutex_unlock(&ioaccel_collection_block_mutex);
}

@end
