@implementation SetEventHandler

void __ids_SetEventHandler_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    _Block_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  }
}

void __usb_SetEventHandler_block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v2)
  {
    _Block_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  }
}

@end
