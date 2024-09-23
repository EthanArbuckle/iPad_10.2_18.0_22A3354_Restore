@implementation EFPromiseAttachmentDataHandler

uint64_t __EFPromiseAttachmentDataHandler_block_invoke(uint64_t a1, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", objc_msgSend(*(id *)(a1 + 32), "data"));
  else
    return objc_msgSend(*(id *)(a1 + 40), "finishWithError:");
}

@end
