@implementation CSMapCopyDebugDescription

void ___CSMapCopyDebugDescription_block_invoke(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("empty marker"), CFSTR("%llx"), **(unsigned int **)(a1 + 40));
}

void ___CSMapCopyDebugDescription_block_invoke_22(uint64_t a1)
{
  CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("deleted marker"), CFSTR("%llx"), **(unsigned int **)(a1 + 40));
}

@end
