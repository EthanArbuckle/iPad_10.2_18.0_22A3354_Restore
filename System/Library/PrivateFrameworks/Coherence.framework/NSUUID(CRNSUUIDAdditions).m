@implementation NSUUID(CRNSUUIDAdditions)

+ (id)CRTTZero
{
  if (CRTTZero_once != -1)
    dispatch_once(&CRTTZero_once, &__block_literal_global);
  return (id)CRTTZero_zero;
}

- (id)CRTTxorWith:()CRNSUUIDAdditions
{
  id v4;
  void *v5;
  int8x16_t v7;
  int8x16_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = 0uLL;
  v7 = 0uLL;
  objc_msgSend(a1, "getUUIDBytes:", &v8);
  objc_msgSend(v4, "getUUIDBytes:", &v7);
  v8 = veorq_s8(v7, v8);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v8);

  return v5;
}

- (uint64_t)CRTTCompare:()CRNSUUIDAdditions
{
  id v4;
  unsigned __int8 uu2[8];
  uint64_t v7;
  unsigned __int8 uu1[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu1 = 0;
  v9 = 0;
  *(_QWORD *)uu2 = 0;
  v7 = 0;
  v4 = a3;
  objc_msgSend(a1, "getUUIDBytes:", uu1);
  objc_msgSend(v4, "getUUIDBytes:", uu2);

  return uuid_compare(uu1, uu2);
}

- (id)CRTTShortDescription
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X"), LOBYTE(v2[0]), BYTE1(v2[0]));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
