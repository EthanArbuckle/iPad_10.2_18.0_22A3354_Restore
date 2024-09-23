@implementation HandleClearScreen

void ___HandleClearScreen_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 27))
  {
    *(_BYTE *)(v1 + 27) = 1;
    v2 = *(_QWORD **)(a1 + 32);
    v3 = v2[20];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___HandleClearScreen_block_invoke_2;
    block[3] = &unk_24FA1BC70;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void ___HandleClearScreen_block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoStreamIsCleared:forRenderer:", 1, *(_QWORD *)(a1 + 32));

  }
}

@end
