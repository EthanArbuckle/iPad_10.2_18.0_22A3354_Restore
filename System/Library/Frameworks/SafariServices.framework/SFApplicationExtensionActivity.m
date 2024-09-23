@implementation SFApplicationExtensionActivity

void __65___SFApplicationExtensionActivity_activityDidFinish_items_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  objc_msgSend(*(id *)(a1 + 32), "customCompletionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
