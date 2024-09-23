@implementation IOGCFastPathInputQueueActivate

void __IOGCFastPathInputQueueActivate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (a2 == 8)
  {
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 72));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
    if (v3)
    {
      (*(void (**)(void))(v3 + 16))();
      _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 48));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    }
  }
  else if (a2 == 2)
  {
    dispatch_mach_msg_get_msg();
    kdebug_trace();
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 56))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    kdebug_trace();
  }
}

@end
