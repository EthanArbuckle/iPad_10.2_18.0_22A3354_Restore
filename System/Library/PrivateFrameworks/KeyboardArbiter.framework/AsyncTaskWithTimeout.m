@implementation AsyncTaskWithTimeout

uint64_t __AsyncTaskWithTimeout_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __AsyncTaskWithTimeout_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void __AsyncTaskWithTimeout_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __AsyncTaskWithTimeout_block_invoke_3;
  v7[3] = &unk_24DAA0220;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __AsyncTaskWithTimeout_block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
