@implementation NSString(_OSDeduping)

- (id)_os_dedup
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  if (_os_dedup_onceToken != -1)
    dispatch_once(&_os_dedup_onceToken, &__block_literal_global);
  v2 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&_os_dedup_lock);
  objc_msgSend((id)_os_dedup_set, "member:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;

    v2 = v5;
  }
  else
  {
    if ((unint64_t)objc_msgSend((id)_os_dedup_set, "count") >= 0x80)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)_os_dedup_set;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __34__NSString__OSDeduping___os_dedup__block_invoke_2;
      v10[3] = &unk_24E477750;
      v11 = v6;
      v8 = v6;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
      objc_msgSend((id)_os_dedup_set, "minusSet:", v8);

    }
    if ((unint64_t)objc_msgSend((id)_os_dedup_set, "count") <= 0x7F)
      objc_msgSend((id)_os_dedup_set, "addObject:", v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_dedup_lock);

  return v2;
}

@end
