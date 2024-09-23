@implementation NSString(NSFileProviderDomainIdentifier)

- (uint64_t)fp_isValidDomainIdentifierWithError:()NSFileProviderDomainIdentifier
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t result;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v5);

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = CFSTR("/:");
      _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Domain identifier '%@' may not contain any of the characters '%@'", buf, 0x16u);
    }

    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("Domain identifier '%@' may not contain any of the characters '%@'"), a1, CFSTR("/:"));
      goto LABEL_12;
    }
    return 0;
  }
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR(".")) & 1) != 0
    || objc_msgSend(a1, "isEqualToString:", CFSTR("..")))
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a1;
    }

    if (a3)
    {
LABEL_12:
      v9 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v9;
      return result;
    }
    return 0;
  }
  return 1;
}

@end
