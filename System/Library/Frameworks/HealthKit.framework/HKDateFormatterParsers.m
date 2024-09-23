@implementation HKDateFormatterParsers

void ___HKDateFormatterParsers_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  _HKDateFormatterFromPattern(CFSTR("yyyyMMddHHmmssZZZZZ"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  _HKDateFormatterFromPattern(CFSTR("yyyyMMddHHmmss"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  _HKDateFormatterFromPattern(CFSTR("yyyyMMddHHmm"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  _HKDateFormatterFromPattern(CFSTR("yyyyMMdd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_HKDateFormatterParsers__formatters;
  _HKDateFormatterParsers__formatters = v4;

}

@end
