@implementation PostalAddressByAddingCountry

uint64_t __PostalAddressByAddingCountry_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqual:", objc_msgSend(a2, "isoCountryCode"));
}

@end
