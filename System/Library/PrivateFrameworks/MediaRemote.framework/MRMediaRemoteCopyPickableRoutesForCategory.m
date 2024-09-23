@implementation MRMediaRemoteCopyPickableRoutesForCategory

intptr_t __MRMediaRemoteCopyPickableRoutesForCategory_block_invoke(uint64_t a1, const __CFArray *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke(uint64_t a1, const __CFArray *a2)
{
  CFArrayRef Copy;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  CFArrayRef v7;

  Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke_2;
  v5[3] = &unk_1E30D0218;
  v4 = *(NSObject **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = Copy;
  dispatch_async(v4, v5);

}

uint64_t __MRMediaRemoteCopyPickableRoutesForCategory_Async_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
