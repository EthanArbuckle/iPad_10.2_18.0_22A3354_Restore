@implementation NSDate(_DKDeduping)

- (id)_os_dedup
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

  if (_os_dedup_onceToken_8 != -1)
    dispatch_once(&_os_dedup_onceToken_8, &__block_literal_global_11);
  v2 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:", floor(v3));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_os_dedup_lock_10);
  objc_msgSend((id)_os_dedup_set_9, "member:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;

  }
  else
  {
    if ((unint64_t)objc_msgSend((id)_os_dedup_set_9, "count") >= 0x80)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)_os_dedup_set_9;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __32__NSDate__DKDeduping___os_dedup__block_invoke_2;
      v12[3] = &unk_24E477750;
      v13 = v8;
      v10 = v8;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
      objc_msgSend((id)_os_dedup_set_9, "minusSet:", v10);

    }
    v7 = v4;
    if ((unint64_t)objc_msgSend((id)_os_dedup_set_9, "count") <= 0x7F)
    {
      objc_msgSend((id)_os_dedup_set_9, "addObject:", v4);
      v7 = v4;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_dedup_lock_10);

  return v7;
}

@end
