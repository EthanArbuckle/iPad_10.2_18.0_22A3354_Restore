@implementation _DASLimitsUtilities

+ (int64_t)bitmaskForLimitationName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("Configuration");
  v9[1] = CFSTR("ActivityRate");
  v10[0] = &unk_1E6259670;
  v10[1] = &unk_1E6259688;
  v9[2] = CFSTR("ProcessRate");
  v9[3] = CFSTR("Runtime");
  v10[2] = &unk_1E62596A0;
  v10[3] = &unk_1E62596B8;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 1 << objc_msgSend(v6, "unsignedIntegerValue");
  else
    v7 = -1;

  return v7;
}

@end
