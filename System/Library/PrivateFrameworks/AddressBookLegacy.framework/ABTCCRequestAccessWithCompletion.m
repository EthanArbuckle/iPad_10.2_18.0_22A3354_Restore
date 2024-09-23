@implementation ABTCCRequestAccessWithCompletion

uint64_t __ABTCCRequestAccessWithCompletion_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "isAccessGranted"), a3);
}

@end
