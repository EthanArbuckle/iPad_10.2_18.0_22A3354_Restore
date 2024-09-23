@implementation CNScanListFilterHandleCommand

void __CNScanListFilterHandleCommand_block_invoke(uint64_t a1)
{
  NSObject *Queue;
  NSObject *v3;
  _QWORD v4[6];
  __int128 v5;

  Queue = CNMonitorGetQueue(*(_QWORD *)(a1 + 32));
  if (Queue)
  {
    v3 = Queue;
    dispatch_retain(Queue);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 0x40000000;
    v4[2] = __CNScanListFilterHandleCommand_block_invoke_2;
    v4[3] = &__block_descriptor_tmp_6_0;
    v4[4] = *(_QWORD *)(a1 + 32);
    v4[5] = v3;
    v5 = *(_OWORD *)(a1 + 40);
    dispatch_async(v3, v4);
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 40));
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
}

void __CNScanListFilterHandleCommand_block_invoke_2(uint64_t a1)
{
  uint64_t Handler;
  uint64_t v3;

  Handler = CNMonitorGetHandler(*(_QWORD *)(a1 + 32));
  if (Handler)
  {
    v3 = Handler;
    if (CNMonitorGetQueue(*(_QWORD *)(a1 + 32)) == *(_QWORD *)(a1 + 40))
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  CFRelease(*(CFTypeRef *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

@end
