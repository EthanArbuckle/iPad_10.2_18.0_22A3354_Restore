@implementation CGDataConsumerGetTypeID

uint64_t __CGDataConsumerGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGDataConsumerGetTypeID_class);
  CGDataConsumerGetTypeID_data_consumer_type_id = result;
  return result;
}

@end
