@implementation SFDownloadActivityItemProvider

void __82___SFDownloadActivityItemProvider_activityViewControllerApplicationExtensionItem___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, id, _QWORD);
  id v5;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  v4 = a2;
  objc_msgSend(v3, "saveToFileIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "savedURLWithProperExtension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5, 0);

}

@end
