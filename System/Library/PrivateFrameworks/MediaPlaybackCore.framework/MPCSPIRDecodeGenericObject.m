@implementation MPCSPIRDecodeGenericObject

void ___MPCSPIRDecodeGenericObject_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD1880];
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaqueID:", v4);

}

@end
