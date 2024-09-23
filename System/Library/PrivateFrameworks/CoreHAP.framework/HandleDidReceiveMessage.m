@implementation HandleDidReceiveMessage

void ___HandleDidReceiveMessage_f_block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "debugDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "httpClient:didReceiveHTTPMessageWithHeaders:body:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
