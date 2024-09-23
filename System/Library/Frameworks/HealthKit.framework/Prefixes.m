@implementation Prefixes

void ___Prefixes_block_invoke()
{
  id v0;
  void *v1;
  uint64_t i;
  char *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_Prefixes_prefixes;
  _Prefixes_prefixes = (uint64_t)v0;

  for (i = 0; i != 28; i += 2)
  {
    v3 = (&__PrefixDefinitions)[i + 1];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (&__PrefixDefinitions)[i]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_Prefixes_prefixes, "setObject:forKeyedSubscript:", v5, v4);

  }
}

@end
