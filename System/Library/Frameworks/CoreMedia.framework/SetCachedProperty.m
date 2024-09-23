@implementation SetCachedProperty

void __remoteXPCEndpointManager_SetCachedProperty_block_invoke(_QWORD *a1)
{
  const void *v2;
  __CFDictionary *v3;
  const void *v4;

  v2 = (const void *)a1[4];
  v3 = *(__CFDictionary **)(a1[5] + 24);
  v4 = (const void *)a1[6];
  if (v2)
    CFDictionarySetValue(v3, v4, v2);
  else
    CFDictionaryRemoveValue(v3, v4);
}

@end
