@implementation NSProcessInfo

void __44__NSProcessInfo_GEOExtras__processStartTime__block_invoke()
{
  void *v0;
  int v1;
  uint64_t v2;
  void *v3;
  size_t v4;
  _OWORD v5[40];
  int v6[2];
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "processIdentifier");

  *(_QWORD *)v6 = 0xE00000001;
  v7 = 1;
  v8 = v1;
  memset(v5, 0, 512);
  v4 = 648;
  sysctl(v6, 4u, v5, &v4, 0, 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)*(uint64_t *)&v5[0]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_214;
  _MergedGlobals_214 = v2;

}

void __43__NSProcessInfo_GEOExtras__systemStartTime__block_invoke()
{
  void *v0;
  double v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "systemUptime");
  objc_msgSend(v4, "dateByAddingTimeInterval:", -v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECDBBCB0;
  qword_1ECDBBCB0 = v2;

}

@end
