@implementation AFProductAndBuildVersion

void __AFProductAndBuildVersion_block_invoke()
{
  void *v0;
  uint64_t v1;
  const __CFString *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = (void *)MEMORY[0x1E0CB3940];
  v1 = MGCopyAnswer();
  v8 = (id)v1;
  if (v1)
    v2 = (const __CFString *)v1;
  else
    v2 = CFSTR("???");
  v3 = MGCopyAnswer();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = CFSTR("???");
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@/%@"), v2, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)AFProductAndBuildVersion_systemVersionString;
  AFProductAndBuildVersion_systemVersionString = v6;

}

@end
