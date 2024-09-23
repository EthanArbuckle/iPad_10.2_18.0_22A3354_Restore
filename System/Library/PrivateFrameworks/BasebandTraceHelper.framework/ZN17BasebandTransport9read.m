@implementation ZN17BasebandTransport9read

BasebandTransport *___ZN17BasebandTransport9read_syncEN8dispatch13group_sessionE_block_invoke_81(uint64_t a1)
{
  BasebandTransport *result;

  result = *(BasebandTransport **)(a1 + 32);
  if (*((_BYTE *)result + 292))
    return (BasebandTransport *)BasebandTransport::queueRead_sync(result);
  return result;
}

@end
