@implementation NPKSupportedBarcodeFromDataAccessor

BOOL __NPKSupportedBarcodeFromDataAccessor_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  _BOOL8 v5;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BE6F4D8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = _PKEnumValueFromString();

    v5 = v4 == 4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __NPKSupportedBarcodeFromDataAccessor_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
