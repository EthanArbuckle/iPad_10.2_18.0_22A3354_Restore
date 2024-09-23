@implementation C3DEnginePipelineGetTypeID

uint64_t __C3DEnginePipelineGetTypeID_block_invoke()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  C3DEnginePipelineGetTypeID_typeID = result;
  return result;
}

@end
