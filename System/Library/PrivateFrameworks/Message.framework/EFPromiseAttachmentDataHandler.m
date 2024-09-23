@implementation EFPromiseAttachmentDataHandler

void __EFPromiseAttachmentDataHandler_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v5);
  }

}

@end
