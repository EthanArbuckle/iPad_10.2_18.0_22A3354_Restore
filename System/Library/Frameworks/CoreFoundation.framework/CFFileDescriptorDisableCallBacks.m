@implementation CFFileDescriptorDisableCallBacks

void __CFFileDescriptorDisableCallBacks_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 16))
  {
    v3 = *(_QWORD *)(a1 + 40);
    if ((v3 & 1) != 0)
    {
      v4 = *(NSObject **)(v1 + 32);
      if (v4)
      {
        if (!*(_BYTE *)(v1 + 48))
        {
          dispatch_suspend(v4);
          v1 = *(_QWORD *)(a1 + 32);
          v3 = *(_QWORD *)(a1 + 40);
          *(_BYTE *)(v1 + 48) = 1;
        }
      }
    }
    if ((v3 & 2) != 0)
    {
      v5 = *(NSObject **)(v1 + 40);
      if (v5)
      {
        if (!*(_BYTE *)(v1 + 49))
        {
          dispatch_suspend(v5);
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
        }
      }
    }
  }
}

@end
