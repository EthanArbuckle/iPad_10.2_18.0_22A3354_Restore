@implementation LSCopyRationalizedEnvironmentVariablesDict

void ___LSCopyRationalizedEnvironmentVariablesDict_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (_NSIsNSString() && (objc_msgSend(v6, "hasPrefix:", CFSTR("DYLD")) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

@end
