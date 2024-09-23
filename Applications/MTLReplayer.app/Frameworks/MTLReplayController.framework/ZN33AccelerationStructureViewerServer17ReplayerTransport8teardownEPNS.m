@implementation ZN33AccelerationStructureViewerServer17ReplayerTransport8teardownEPNS

void *___ZN33AccelerationStructureViewerServer17ReplayerTransport8teardownEPNS_8EndpointEP7NSError_block_invoke(_QWORD *a1)
{
  void *result;
  uint64_t v3;

  result = (void *)a1[4];
  if (result)
  {
    v3 = a1[6];
    if (!*(_QWORD *)(v3 + 32))
      return (void *)(*(uint64_t (**)(_QWORD, id, _QWORD, _QWORD))(*(_QWORD *)(v3 + 48) + 16))(*(_QWORD *)(v3 + 48), objc_msgSend(result, "requestID"), 0, a1[5]);
  }
  return result;
}

@end
