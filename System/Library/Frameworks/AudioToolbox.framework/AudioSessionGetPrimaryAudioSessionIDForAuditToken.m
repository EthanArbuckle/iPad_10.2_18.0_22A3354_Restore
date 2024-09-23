@implementation AudioSessionGetPrimaryAudioSessionIDForAuditToken

void *__AudioSessionGetPrimaryAudioSessionIDForAuditToken_block_invoke(_QWORD *a1)
{
  void *result;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = (void *)a1[4];
  if (result)
  {
    result = (void *)objc_msgSend(result, "getPrimarySession:createIfNecessary:", a1[6], 1);
    v3 = v6;
  }
  else
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
  }
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  return result;
}

@end
