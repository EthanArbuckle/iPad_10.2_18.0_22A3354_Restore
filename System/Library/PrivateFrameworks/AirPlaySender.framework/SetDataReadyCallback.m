@implementation SetDataReadyCallback

void __carplaySource_SetDataReadyCallback_block_invoke(uint64_t a1)
{
  NSObject *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = 0;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 200);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = 0;
  }
}

void __carplaySource_SetDataReadyCallback_block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = *(_QWORD *)(a1 + 40);
  dispatch_retain(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 200));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = *(_QWORD *)(a1 + 56);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) = *(_DWORD *)(a1 + 64);
}

@end
