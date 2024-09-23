@implementation InjectModifiers

uint64_t ____InjectModifiers_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = __DefineForShaderModifierStandardUniformPerNode(a2);
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", &stru_1EA5A6480, result);
  return result;
}

@end
