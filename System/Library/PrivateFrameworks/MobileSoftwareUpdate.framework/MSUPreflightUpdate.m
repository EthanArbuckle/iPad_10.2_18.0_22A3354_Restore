@implementation MSUPreflightUpdate

uint64_t __MSUPreflightUpdate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 32);
  if (v2)
    return v2(a2, *(_QWORD *)(a1 + 40));
  else
    return 0;
}

@end
