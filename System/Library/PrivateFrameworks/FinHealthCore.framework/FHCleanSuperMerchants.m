@implementation FHCleanSuperMerchants

void __FHCleanSuperMerchants_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("uber"), CFSTR("ubereats"), CFSTR("nike"), CFSTR("panera"), CFSTR("exxon"), CFSTR("mobil"), CFSTR("acehardware"), CFSTR("walgreens"), CFSTR("duanereade"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHCleanSuperMerchants_fhSuperMerchants;
  FHCleanSuperMerchants_fhSuperMerchants = v0;

}

@end
