@implementation SGThrottle

uint64_t __SGThrottle_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 16));
  v5 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)v5 = v4;
  *(_DWORD *)(v5 + 8) = 0;
  *(_BYTE *)(v5 + 12) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 16));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __SGThrottle_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
