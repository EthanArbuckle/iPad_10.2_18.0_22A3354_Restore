@implementation CPLCurrentUniverseName

void __CPLCurrentUniverseName_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("CPLUniverseName"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CPLCurrentUniverseName_result;
  CPLCurrentUniverseName_result = v0;

}

@end
