@implementation LSDisplayData

uint64_t ___LSDisplayData_block_invoke(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format((CSStore2::AttributedStringWriter *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), 0, CFSTR("Failed to display Launch Services data: %@"), *(_QWORD *)(a1 + 32));
}

@end
