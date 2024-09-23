@implementation FHApplications

void __FHApplications_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("Search"), CFSTR("Payment Ring"), CFSTR("Messaging"), CFSTR("Test Client"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHApplications_fhApplications;
  FHApplications_fhApplications = v0;

}

@end
