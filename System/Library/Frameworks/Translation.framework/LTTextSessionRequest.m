@implementation LTTextSessionRequest

uint64_t __95___LTTextSessionRequest_initForDownloadRequestWithSourceLocale_targetLocale_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TranslationErrorDomain"), 13, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke_cold_1((uint64_t)v2, v3);
    objc_msgSend(WeakRetained, "didReceiveError:forInput:", v2, 0);

  }
}

void __59___LTTextSessionRequest_didReceiveInterruptionFromHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
    (uint8_t *)&v2,
    0xCu);
}

@end
