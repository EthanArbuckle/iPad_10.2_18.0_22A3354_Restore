@implementation AXMFiHearingDevicePairedUUIDs

void __AXMFiHearingDevicePairedUUIDs_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);

}

void __AXMFiHearingDevicePairedUUIDs_block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v3);

}

void __AXMFiHearingDevicePairedUUIDs_block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v6 = (id)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
    v5 = v6;
  }

}

@end
