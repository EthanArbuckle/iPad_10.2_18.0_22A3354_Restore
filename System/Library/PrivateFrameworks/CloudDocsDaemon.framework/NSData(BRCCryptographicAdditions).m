@implementation NSData(BRCCryptographicAdditions)

- (uint64_t)brc_hexadecimalString
{
  void *v1;
  id v2;

  v1 = (void *)MEMORY[0x1E0CB3940];
  v2 = objc_retainAutorelease(a1);
  return objc_msgSend(v1, "brc_hexadecimalStringWithBytes:length:", objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"));
}

- (id)brc_truncatedSHA256
{
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  _OWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "validationKeyTruncationLength");

  memset(v7, 0, sizeof(v7));
  v4 = objc_retainAutorelease(a1);
  CC_SHA256((const void *)objc_msgSend(v4, "bytes", 0, 0, 0, 0), objc_msgSend(v4, "length"), (unsigned __int8 *)v7);
  if (v3 >= 0x20)
    v5 = 32;
  else
    v5 = v3;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)brc_generateSaltingKey
{
  void *v0;
  const __SecRandom *v1;
  id v2;
  int v3;
  void *v4;
  NSObject *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v2 = objc_retainAutorelease(v0);
  if (SecRandomCopyBytes(v1, 0x20uLL, (void *)objc_msgSend(v2, "mutableBytes")))
  {
    v3 = *__error();
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
      +[NSData(BRCCryptographicAdditions) brc_generateSaltingKey].cold.1((uint64_t)v4, v3, v5);

    v6 = 0;
    *__error() = v3;
  }
  else
  {
    v6 = v2;
  }

  return v6;
}

+ (id)brc_generateBogusKey
{
  if (brc_generateBogusKey_onceToken != -1)
    dispatch_once(&brc_generateBogusKey_onceToken, &__block_literal_global_40);
  return (id)brc_generateBogusKey_key;
}

+ (void)brc_generateSaltingKey
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] Can't generate salting key %{errno}d%@", (uint8_t *)v3, 0x12u);
}

@end
