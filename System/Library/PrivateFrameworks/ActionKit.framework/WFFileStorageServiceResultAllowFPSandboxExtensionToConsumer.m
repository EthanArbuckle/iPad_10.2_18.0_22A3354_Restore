@implementation WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer

void __WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(getFPItemManagerClass(), "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer_block_invoke_2;
    v6[3] = &unk_24F8B72E0;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v4, "extendBookmarkForItem:receivingBundleID:completionHandler:", v3, v5, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
