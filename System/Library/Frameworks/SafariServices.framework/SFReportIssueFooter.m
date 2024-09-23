@implementation SFReportIssueFooter

void __75___SFReportIssueFooter_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
