@implementation OSLogInstallProfilePayload

void __OSLogInstallProfilePayload_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Locked"));
    _OSLogInstallPreferences(2u, v6, (uint64_t)v5);

  }
}

void __OSLogInstallProfilePayload_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("Locked"));
    _OSLogInstallPreferences(3u, v6, (uint64_t)v5);

  }
}

@end
