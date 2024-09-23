@implementation WFDictateTextAction

void __41__WFDictateTextAction_UIKit__keyCommands__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "finishRunningWithError:", 0);

}

@end
