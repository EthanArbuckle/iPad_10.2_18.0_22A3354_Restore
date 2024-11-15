@implementation IMAPFSUtils

+ (id)stringForPurgableFlags:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a3 - 1) <= 0xAu)
  {
    objc_msgSend(v4, "addObject:", off_1E3FB8370[(char)(a3 - 1)]);
    if ((a3 & 0x100) == 0)
    {
LABEL_3:
      if ((a3 & 0x200) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((a3 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v5, "addObject:", CFSTR("APFS_PURGEABLE_FAULT"));
  if ((a3 & 0x200) == 0)
  {
LABEL_4:
    if ((a3 & 0x400) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v5, "addObject:", CFSTR("APFS_PURGEABLE_LOW_URGENCY"));
  if ((a3 & 0x400) == 0)
  {
LABEL_5:
    if ((a3 & 0x800) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_12:
  objc_msgSend(v5, "addObject:", CFSTR("APFS_PURGEABLE_MED_URGENCY"));
  if ((a3 & 0x800) != 0)
LABEL_6:
    objc_msgSend(v5, "addObject:", CFSTR("APFS_PURGEABLE_HIGH_URGENCY"));
LABEL_7:
  v6 = CFSTR("NO");
  if ((a3 & 0x1000) != 0)
  {
    objc_msgSend(v5, "addObject:", CFSTR("APFS_PURGEABLE_IGNORE_ME"));
    v7 = CFSTR("NO");
  }
  else
  {
    v7 = CFSTR("YES");
  }
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" | "));
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = (void *)MEMORY[0x1E0CB3940];
  if (a3)
    v6 = v7;
  v11 = -[__CFString length](v8, "length");
  v12 = CFSTR("NONE");
  if (v11)
    v12 = v9;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ (0x%llx = %@)"), v6, a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (unint64_t)purgableFlagsForPath:(id)a3 error:(int *)a4
{
  id v5;
  int v6;
  int v7;
  int *v8;
  unint64_t v9;
  unint64_t v11;

  v11 = 0;
  v5 = objc_retainAutorelease(a3);
  v6 = fsctl((const char *)objc_msgSend(v5, "UTF8String"), 0x40084A47uLL, &v11, 0);
  if (v6)
  {
    v7 = v6;
    v8 = __error();
    strerror(*v8);
    _IMWarn();
    if (a4)
      *a4 = v7;
  }
  v9 = v11;

  return v9;
}

@end
