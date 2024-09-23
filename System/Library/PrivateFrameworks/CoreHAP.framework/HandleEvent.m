@implementation HandleEvent

void ___HandleEvent_f_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "httpClient:didReceiveEvent:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
