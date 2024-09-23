@implementation FCKeyedOperation

void __60__FCKeyedOperation_executeForQueue_delegate_key_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
    objc_msgSend(*(id *)(a1 + 40), "cancel");
  else
    objc_storeStrong((id *)(v1 + 16), *(id *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelHandler, 0);
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __26__FCKeyedOperation_cancel__block_invoke;
  v2[3] = &unk_1E463AB18;
  v2[4] = self;
  FCPerformBlockOnMainThread(v2);
}

uint64_t __26__FCKeyedOperation_cancel__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancel");
}

@end
