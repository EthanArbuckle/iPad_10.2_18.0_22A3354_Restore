@implementation CNPluginMonitorHandleCommand

void __CNPluginMonitorHandleCommand_block_invoke(uint64_t a1)
{
  NSObject *Queue;
  NSObject *v3;
  uint64_t v4;
  const void *v5;
  _QWORD v6[7];
  int v7;

  Queue = CNMonitorGetQueue(*(_QWORD *)(a1 + 32));
  if (Queue)
  {
    v3 = Queue;
    dispatch_retain(Queue);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = __CNPluginMonitorHandleCommand_block_invoke_2;
    v6[3] = &__block_descriptor_tmp_4;
    v4 = *(_QWORD *)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    v6[5] = v3;
    v7 = *(_DWORD *)(a1 + 48);
    v6[6] = v4;
    dispatch_async(v3, v6);
  }
  else
  {
    v5 = *(const void **)(a1 + 40);
    if (v5)
      CFRelease(v5);
  }
}

void __CNPluginMonitorHandleCommand_block_invoke_2(uint64_t a1)
{
  uint64_t Handler;
  uint64_t v3;
  const void *v4;

  Handler = CNMonitorGetHandler(*(_QWORD *)(a1 + 32));
  if (Handler)
  {
    v3 = Handler;
    if (CNMonitorGetQueue(*(_QWORD *)(a1 + 32)) == *(_QWORD *)(a1 + 40))
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  v4 = *(const void **)(a1 + 48);
  if (v4)
    CFRelease(v4);
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

@end
