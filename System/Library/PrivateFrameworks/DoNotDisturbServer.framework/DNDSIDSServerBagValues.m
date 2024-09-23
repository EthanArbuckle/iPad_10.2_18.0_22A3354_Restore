@implementation DNDSIDSServerBagValues

+ (id)_numberForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0D34350];
  v4 = a3;
  objc_msgSend(v3, "sharedInstanceForBagType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

+ (unint64_t)resolvedScheduledActivityUpdateFuzzMilliseconds
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(a1, "_numberForKey:", CFSTR("act-update-fuzz-floor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_numberForKey:", CFSTR("act-update-fuzz-ceiling"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    v6 = 1000 * objc_msgSend(v3, "unsignedIntValue");
    if (v5)
    {
LABEL_3:
      v7 = 1000 * objc_msgSend(v5, "unsignedIntValue");
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 5000;
    if (v4)
      goto LABEL_3;
  }
  v7 = 20000;
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    +[DNDSIDSServerBagValues resolvedScheduledActivityUpdateFuzzMilliseconds].cold.1(v6, v7);
  v8 = arc4random_uniform((v7 - v6) | 1) + v6;

  return v8;
}

+ (BOOL)resolvedActivityUpdateDisabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "_numberForKey:", CFSTR("act-update-disabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

+ (unint64_t)resolvedActivityUpdateCoalescingSeconds
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "_numberForKey:", CFSTR("act-update-coalescing-interval"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 1;

  return v4;
}

+ (void)resolvedScheduledActivityUpdateFuzzMilliseconds
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_1CB895000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "generating fuzzable %@ - %@ ms", (uint8_t *)&v5, 0x16u);

}

@end
