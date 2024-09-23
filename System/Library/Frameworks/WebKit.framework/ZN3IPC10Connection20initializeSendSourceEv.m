@implementation ZN3IPC10Connection20initializeSendSourceEv

IPC::Connection *___ZN3IPC10Connection20initializeSendSourceEv_block_invoke(uint64_t a1, void *a2)
{
  IPC::Connection *result;

  result = *(IPC::Connection **)(a1 + 32);
  if (*((_QWORD *)result + 40))
    return (IPC::Connection *)IPC::Connection::resumeSendSource(result, a2);
  return result;
}

@end
