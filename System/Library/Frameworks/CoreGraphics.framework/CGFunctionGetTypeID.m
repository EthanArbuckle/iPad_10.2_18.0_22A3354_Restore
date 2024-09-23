@implementation CGFunctionGetTypeID

uint64_t __CGFunctionGetTypeID_block_invoke_2()
{
  uint64_t result;

  result = __CGTypeRegisterInternal(CGFunctionGetTypeID_runtime_class);
  CGFunctionGetTypeID_function_type_id = result;
  return result;
}

@end
