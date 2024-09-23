@implementation NSString(_DKDeduping)

- (id)dk_dedup
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  if (dk_dedup_onceToken != -1)
    dispatch_once(&dk_dedup_onceToken, &__block_literal_global_54);
  v2 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&dk_dedup_lock);
  objc_msgSend((id)dk_dedup_set, "member:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;

    v2 = v5;
  }
  else if ((unint64_t)objc_msgSend((id)dk_dedup_set, "count") <= 0x7F)
  {
    objc_msgSend((id)dk_dedup_set, "addObject:", v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dk_dedup_lock);

  return v2;
}

- (id)dedup
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    -[NSString(_DKDeduping) dedup].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(a1, "dk_dedup");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dedup
{
  OUTLINED_FUNCTION_1_7(&dword_18DDBE000, a1, a3, "-dedup is deprecated in favor of properly-namspaced -dk_deup.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
