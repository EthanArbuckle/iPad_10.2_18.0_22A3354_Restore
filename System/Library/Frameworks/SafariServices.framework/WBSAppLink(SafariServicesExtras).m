@implementation WBSAppLink(SafariServicesExtras)

- (void)_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:()SafariServicesExtras
{
  id v4;
  _QWORD v5[5];
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__11;
  v6[4] = __Block_byref_object_dispose__11;
  v7 = (id)MEMORY[0x1A8598C40]();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__WBSAppLink_SafariServicesExtras___sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread___block_invoke;
  v5[3] = &unk_1E4AC66B0;
  v5[4] = v6;
  objc_msgSend(a1, "decideOpenStrategyWithCompletionHandler:", v5);
  _Block_object_dispose(v6, 8);

}

@end
