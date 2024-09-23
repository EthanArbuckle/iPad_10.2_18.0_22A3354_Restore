@implementation ML3KindsPassingTest

void __ML3KindsPassingTest_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __ML3KindsPassingTest_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

@end
