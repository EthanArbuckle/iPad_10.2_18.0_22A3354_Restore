@implementation LSDatabaseDisplayHeader

uint64_t ___LSDatabaseDisplayHeader_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (*(_DWORD *)(a3 + 12))
  {
    result = CSStoreGetUnit();
    if (!result)
      return CSStore2::AttributedStringWriter::withWarningColors();
  }
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_2(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("ERROR"), CFSTR("*** Container V%08lu has invalid alias reference A%08lu"), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 12));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_3()
{
  uint64_t result;

  if (!CSStoreGetUnit())
    CSStore2::AttributedStringWriter::withWarningColors();
  result = CSStoreGetUnit();
  if (!result)
    return CSStore2::AttributedStringWriter::withWarningColors();
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_4(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("ERROR"), CFSTR("*** Bundle B%08lu has invalid alias reference A%08lu"), *(unsigned int *)(a1 + 48), **(unsigned int **)(a1 + 40));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_5(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("ERROR"), CFSTR("*** Bundle B%08lu has invalid container reference V%08lu"), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 4));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_6()
{
  uint64_t result;

  result = CSStoreGetUnit();
  if (!result)
    return CSStore2::AttributedStringWriter::withWarningColors();
  return result;
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_7(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::format(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("ERROR"), CFSTR("*** Claim C%08lu has invalid bundle reference B%08lu"), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(a1 + 40) + 16));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_8(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("Seeding is in progress."));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_9(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("Database is seeded."));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_10(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("Database seeding is incomplete."));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_11(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("CacheGUID"), CFSTR("NOT FOUND!"));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_12(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("CacheSequenceNum"), CFSTR("NOT FOUND!"));
}

uint64_t ___LSDatabaseDisplayHeader_block_invoke_13(uint64_t a1)
{
  return CSStore2::AttributedStringWriter::string(*(CSStore2::AttributedStringWriter **)(a1 + 32), CFSTR("Path"), CFSTR("NOT FOUND!"));
}

@end
