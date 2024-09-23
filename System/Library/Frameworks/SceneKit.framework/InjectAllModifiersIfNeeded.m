@implementation InjectAllModifiersIfNeeded

uint64_t ____InjectAllModifiersIfNeeded_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "appendFormat:", CFSTR("%@ %@;\n"), a3, a2);
}

uint64_t ____InjectAllModifiersIfNeeded_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", a2);
}

uint64_t ____InjectAllModifiersIfNeeded_block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = __DefineForShaderModifierStandardUniformPerNode(a2);
  if (result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", result);
  return result;
}

@end
