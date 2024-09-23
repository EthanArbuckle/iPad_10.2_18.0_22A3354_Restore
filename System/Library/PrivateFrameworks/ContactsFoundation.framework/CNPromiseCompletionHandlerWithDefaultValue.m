@implementation CNPromiseCompletionHandlerWithDefaultValue

void __CNPromiseCompletionHandlerWithDefaultValue_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v5);
  else
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:");

}

@end
