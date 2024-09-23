@implementation WFWaitForReadingListCompletionActionOperation

- (void)addCompletionHandlerIfRunning:(id)a3
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__WFWaitForReadingListCompletionActionOperation_addCompletionHandlerIfRunning___block_invoke;
  block[3] = &unk_24F8BB608;
  v7 = v3;
  v5 = v3;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);

}

uint64_t __79__WFWaitForReadingListCompletionActionOperation_addCompletionHandlerIfRunning___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
