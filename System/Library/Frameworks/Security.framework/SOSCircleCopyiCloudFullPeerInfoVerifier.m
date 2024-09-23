@implementation SOSCircleCopyiCloudFullPeerInfoVerifier

_QWORD *__SOSCircleCopyiCloudFullPeerInfoVerifier_block_invoke(_QWORD *result, CFDictionaryRef *a2)
{
  _QWORD *v3;

  if (!*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24))
  {
    v3 = result;
    result = (_QWORD *)SOSPeerInfoIsCloudIdentity((uint64_t)a2);
    if ((_DWORD)result)
    {
      result = (_QWORD *)SOSCircleVerifyPeerSignatureExists(v3[6], a2);
      if ((_DWORD)result)
      {
        result = SOSFullPeerInfoCreateCloudIdentity(*MEMORY[0x1E0C9AE00], a2, (CFTypeRef *)(*(_QWORD *)(v3[5] + 8) + 24));
        *(_QWORD *)(*(_QWORD *)(v3[4] + 8) + 24) = result;
      }
    }
  }
  return result;
}

@end
