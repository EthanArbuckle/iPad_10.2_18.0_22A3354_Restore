@implementation UIAlertController

uint64_t __69__UIAlertController_AppleAccountUI___handlerWithSingleActionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__UIAlertController_AppleAccountUI___handlerWithMultiActionHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "style") == 1);
}

@end
