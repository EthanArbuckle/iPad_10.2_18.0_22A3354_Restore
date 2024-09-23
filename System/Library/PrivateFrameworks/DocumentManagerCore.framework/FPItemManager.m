@implementation FPItemManager

void __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isDataSeparatedDomain"))
    objc_msgSend(MEMORY[0x24BE2BEB0], "dataSeparatedICloudDefaultContainer");
  else
    objc_msgSend(MEMORY[0x24BE2BEB0], "iCloudDefaultContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC81B0], -2001, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke_2;
  v4[3] = &unk_24C0FE2F0;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "fetchFPItem:", v4);

}

uint64_t __80__FPItemManager_DOCUtils__doc_fetchRootItemForProviderDomain_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
