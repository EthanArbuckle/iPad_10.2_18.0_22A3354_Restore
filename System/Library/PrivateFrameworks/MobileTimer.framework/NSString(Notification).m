@implementation NSString(Notification)

- (id)mtStringByRemovingNotificationPrefixes
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[MTUserNotificationCenter notificationPrefixes](MTUserNotificationCenter, "notificationPrefixes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      v7 = v1;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), &stru_1E39CF258);
        v1 = (id)objc_claimAutoreleasedReturnValue();

        ++v6;
        v7 = v1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(v1, "mtStringByRemovingNotificationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mtStringByRemovingNotificationDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("_"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)mtStringByAppendingNotificationDate:()Notification
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = mtStringByAppendingNotificationDate__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&mtStringByAppendingNotificationDate__onceToken, &__block_literal_global_35);
  objc_msgSend((id)mtStringByAppendingNotificationDate____dateFormatter, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stringByAppendingFormat:", CFSTR("%@%@"), CFSTR("_"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
