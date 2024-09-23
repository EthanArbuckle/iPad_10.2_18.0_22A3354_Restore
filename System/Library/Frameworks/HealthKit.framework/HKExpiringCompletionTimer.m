@implementation HKExpiringCompletionTimer

uint64_t __36___HKExpiringCompletionTimer__start__block_invoke(uint64_t a1)
{
  void *v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isExpired") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("_HKExpiringCompletionTimer.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self isExpired]"));

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
}

@end
