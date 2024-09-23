@implementation NSProgress(BRCAdditions)

- (uint64_t)brc_publish
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NSProgress(BRCAdditions) brc_publish].cold.1();

  return objc_msgSend(a1, "_publish");
}

- (uint64_t)brc_unpublish
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_notifications_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[NSProgress(BRCAdditions) brc_unpublish].cold.1();

  return objc_msgSend(a1, "_unpublish");
}

- (id)brc_dumpDescription
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "isFinished"))
    objc_msgSend(v2, "addObject:", CFSTR("finished"));
  if (objc_msgSend(a1, "isIndeterminate"))
    objc_msgSend(v2, "addObject:", CFSTR("indeterminate"));
  if (objc_msgSend(a1, "isCancelled"))
    objc_msgSend(v2, "addObject:", CFSTR("cancelled"));
  if (objc_msgSend(a1, "isPaused"))
    objc_msgSend(v2, "addObject:", CFSTR("paused"));
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR("|"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("s:%@ "), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E8769030;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "fractionCompleted");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@f:%.4f uc:%lld/%lld"), v5, v7, objc_msgSend(a1, "completedUnitCount"), objc_msgSend(a1, "totalUnitCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)brc_publish
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] published progress for %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)brc_unpublish
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[NOTIF] unpublished progress for %@%@");
  OUTLINED_FUNCTION_2();
}

@end
