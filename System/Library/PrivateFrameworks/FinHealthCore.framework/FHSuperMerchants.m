@implementation FHSuperMerchants

void __FHSuperMerchants_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Uber"), CFSTR("Uber Eats"), CFSTR("Nike"), CFSTR("Panera"), CFSTR("Exxon"), CFSTR("Mobil"), CFSTR("Ace Hardware"), CFSTR("Walgreens"), CFSTR("Duane Reade"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHSuperMerchants_fhSuperMerchants;
  FHSuperMerchants_fhSuperMerchants = v0;

}

@end
