@implementation WFGetClipboardAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[objc_class generalPasteboard](getUIPasteboardClass_37804(), "generalPasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__WFGetClipboardAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_24F8BAFA8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BE19438], "generateCollectionFromPasteboard:completionHandler:", v4, v5);

}

void __51__WFGetClipboardAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
