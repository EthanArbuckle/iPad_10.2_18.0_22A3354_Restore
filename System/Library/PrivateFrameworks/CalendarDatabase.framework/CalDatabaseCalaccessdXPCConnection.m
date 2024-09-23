@implementation CalDatabaseCalaccessdXPCConnection

uint64_t ___CalDatabaseCalaccessdXPCConnection_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;

  if (a2 == MEMORY[0x1E0C81258] || a2 == MEMORY[0x1E0C81260])
  {
    pthread_mutex_lock(&_CalDatabaseCalaccessdXPCConnection___CalaccessdXPCConnectionLock);
    v3 = (void *)_CalDatabaseCalaccessdXPCConnection___CalaccessdXPCConnection;
    if (_CalDatabaseCalaccessdXPCConnection___CalaccessdXPCConnection)
    {
      _CalDatabaseCalaccessdXPCConnection___CalaccessdXPCConnection = 0;

    }
    return pthread_mutex_unlock(&_CalDatabaseCalaccessdXPCConnection___CalaccessdXPCConnectionLock);
  }
  return result;
}

@end
