@implementation NSAttributedString(HKAdditions)

+ (id)hk_attributedStringForSpacing:()HKAdditions nonBreaking:
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (hk_attributedStringForSpacing_nonBreaking__onceToken != -1)
    dispatch_once(&hk_attributedStringForSpacing_nonBreaking__onceToken, &__block_literal_global_49);
  if (a4)
    v6 = -a3;
  else
    v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
  objc_msgSend((id)hk_attributedStringForSpacing_nonBreaking____spacerCache, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
  if (v8)
  {
    v9 = v8;
  }
  else
  {
    switch(a3)
    {
      case 0:
        v10 = objc_alloc_init(MEMORY[0x1E0CB3498]);
        goto LABEL_16;
      case 1:
        v12 = objc_alloc(MEMORY[0x1E0CB3498]);
        v13 = CFSTR(" ");
        goto LABEL_15;
      case 2:
        v12 = objc_alloc(MEMORY[0x1E0CB3498]);
        v13 = CFSTR(" ");
        goto LABEL_15;
      case 3:
        goto LABEL_12;
      default:
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB5378];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
          +[NSAttributedString(HKAdditions) hk_attributedStringForSpacing:nonBreaking:].cold.1(a3, v11);
LABEL_12:
        v12 = objc_alloc(MEMORY[0x1E0CB3498]);
        v13 = CFSTR(" ");
LABEL_15:
        v10 = (id)objc_msgSend(v12, "initWithString:", v13);
LABEL_16:
        v9 = v10;
        if (a4)
        {
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("⁠"));
          v15 = (void *)objc_msgSend(v14, "mutableCopy");
          objc_msgSend(v15, "appendAttributedString:", v9);
          objc_msgSend(v15, "appendAttributedString:", v14);
          v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithAttributedString:", v15);

          v9 = (id)v16;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
        objc_msgSend((id)hk_attributedStringForSpacing_nonBreaking____spacerCache, "setObject:forKeyedSubscript:", v9, v7);
        os_unfair_lock_unlock((os_unfair_lock_t)&hk_attributedStringForSpacing_nonBreaking__lock);
        break;
    }
  }

  return v9;
}

+ (uint64_t)hk_attributedStringForSpacing:()HKAdditions
{
  return objc_msgSend(a1, "hk_attributedStringForSpacing:nonBreaking:", a3, 0);
}

+ (void)hk_attributedStringForSpacing:()HKAdditions nonBreaking:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Unknown HKAttributedStringSpacer: %ld, falling back to standard space", (uint8_t *)&v2, 0xCu);
}

@end
