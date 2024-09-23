@implementation CGSRegionEnumeratorGetTypeID

uint64_t __CGSRegionEnumeratorGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGSRegionEnumeratorGetTypeID_region_enumerator_class);
  CGSRegionEnumeratorGetTypeID_region_enumerator_type_id = result;
  return result;
}

@end
