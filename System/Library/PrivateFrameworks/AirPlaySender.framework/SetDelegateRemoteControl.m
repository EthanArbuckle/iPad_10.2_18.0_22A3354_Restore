@implementation SetDelegateRemoteControl

double __carEndpoint_SetDelegateRemoteControl_block_invoke(uint64_t a1)
{
  const void *v2;
  _OWORD *v3;
  _OWORD *v4;
  __int128 v5;
  double result;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 192);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = 0;
  }
  v3 = *(_OWORD **)(a1 + 40);
  v4 = (_OWORD *)(*(_QWORD *)(a1 + 32) + 156);
  if (v3)
  {
    v5 = v3[1];
    *v4 = *v3;
    v4[1] = v5;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  }
  else
  {
    result = 0.0;
    *v4 = 0u;
    v4[1] = 0u;
  }
  return result;
}

@end
