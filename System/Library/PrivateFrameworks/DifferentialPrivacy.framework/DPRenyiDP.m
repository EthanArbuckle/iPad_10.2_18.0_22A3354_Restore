@implementation DPRenyiDP

void __27___DPRenyiDP_defaultAlphas__block_invoke()
{
  uint64_t i;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 49);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  for (i = 2; i != 51; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v1);

  }
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)kDefaultAlphas;
  kDefaultAlphas = v2;

}

@end
