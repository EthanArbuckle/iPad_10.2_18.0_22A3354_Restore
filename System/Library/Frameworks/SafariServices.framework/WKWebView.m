@implementation WKWebView

uint64_t __78__WKWebView_SafariServicesExtras__webui_preventNavigationDuringAutoFillPrompt__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
