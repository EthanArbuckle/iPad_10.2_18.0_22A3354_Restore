@implementation CloseAllCommChannels

uint64_t __endpointAggregate_CloseAllCommChannels_block_invoke(uint64_t a1, const void *a2)
{
  uint64_t result;

  result = endpointAggregate_CloseCommChannel(*(_QWORD *)(a1 + 32), a2);
  if ((_DWORD)result)
  {
    if (gLogCategory_APEndpointAggregate <= 60)
    {
      if (gLogCategory_APEndpointAggregate != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

@end
