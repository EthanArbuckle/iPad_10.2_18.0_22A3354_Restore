@implementation BMEventTimestampSQLColumn

uint64_t __BMEventTimestampSQLColumn_block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a2, "timestamp");
  return objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

@end
