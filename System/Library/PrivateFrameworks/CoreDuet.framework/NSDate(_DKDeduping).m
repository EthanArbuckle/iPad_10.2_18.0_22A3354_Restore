@implementation NSDate(_DKDeduping)

- (id)dk_dedup
{
  void *v2;
  double v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  if (dk_dedup_onceToken_7 != -1)
    dispatch_once(&dk_dedup_onceToken_7, &__block_literal_global_10_0);
  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:", floor(v3));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&dk_dedup_lock_9);
  objc_msgSend((id)dk_dedup_set_8, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;

  }
  else
  {
    if ((unint64_t)objc_msgSend((id)dk_dedup_set_8, "count") >= 0x80)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)dk_dedup_set_8;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __31__NSDate__DKDeduping__dk_dedup__block_invoke_2;
      v12[3] = &unk_1E26E5D20;
      v13 = v8;
      v10 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
      objc_msgSend((id)dk_dedup_set_8, "minusSet:", v10);

    }
    v7 = v4;
    if ((unint64_t)objc_msgSend((id)dk_dedup_set_8, "count") <= 0x7F)
    {
      objc_msgSend((id)dk_dedup_set_8, "addObject:", v4);
      v7 = v4;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dk_dedup_lock_9);

  return v7;
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

@end
