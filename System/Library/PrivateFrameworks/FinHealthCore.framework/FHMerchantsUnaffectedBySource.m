@implementation FHMerchantsUnaffectedBySource

void __FHMerchantsUnaffectedBySource_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("apple"), CFSTR("appleservices"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)FHMerchantsUnaffectedBySource_fhMerchantsUnaffectedBySource;
  FHMerchantsUnaffectedBySource_fhMerchantsUnaffectedBySource = v0;

}

@end
