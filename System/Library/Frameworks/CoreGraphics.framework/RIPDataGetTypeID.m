@implementation RIPDataGetTypeID

uint64_t __RIPDataGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(kRIPDataClass);
  RIPDataGetTypeID_data_type_id = result;
  return result;
}

@end
