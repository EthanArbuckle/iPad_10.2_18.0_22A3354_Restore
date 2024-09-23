@implementation ZN8CSStore210Dictionary27

Unit *___ZN8CSStore210Dictionary27_RelinquishOwnershipOfValueERNS_5StoreEjh_block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  Unit *result;
  Unit v4[4];
  char v5;

  result = (Unit *)CSStore2::String::Get(v4, *(CSStore2::Store **)(a1 + 32), *a3);
  if (v5)
    return CSStore2::String::release(v4);
  return result;
}

@end
