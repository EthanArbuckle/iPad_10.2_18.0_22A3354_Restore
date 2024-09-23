@implementation CLKDeviceEntitlementWithPrefix

uint64_t ___CLKDeviceEntitlementWithPrefix_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;

  v5 = a3;
  v6 = 1;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", a1[4]);
  if (v5 && v8)
  {
    if (MEMORY[0x212BDC1C4](v5) == MEMORY[0x24BDACF80])
    {
      v6 = 1;
      if (xpc_BOOL_get_value(v5))
      {
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
        objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v7);
        v6 = 0;
      }
    }
    else
    {
      v6 = 1;
    }
  }

  return v6;
}

@end
