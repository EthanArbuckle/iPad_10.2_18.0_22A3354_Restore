@implementation WFConfiguredViewControllerForShareExtension

void __WFConfiguredViewControllerForShareExtension_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v2 + 16))(v2, 0, v3);

  }
}

@end
