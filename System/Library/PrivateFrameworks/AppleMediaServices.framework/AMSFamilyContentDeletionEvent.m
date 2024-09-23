@implementation AMSFamilyContentDeletionEvent

+ (void)postDistributedNotificationWithAccountPairs:(id)a3
{
  __CFNotificationCenter *DistributedCenter;
  const __CFDictionary *userInfo;

  objc_msgSend(a1, "_notificationPayloadWithAccountPairs:", a3);
  userInfo = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  if (userInfo)
  {
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, CFSTR("com.apple.StoreServices.SSVFamilyContentDeletionNotification"), 0, userInfo, 0);
  }

}

+ (id)_notificationPayloadWithAccountPairs:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v21[0] = CFSTR("did");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "downloaderAccountID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v22[0] = v10;
        v21[1] = CFSTR("fid");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "familyID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22[1] = v11;
        v21[2] = CFSTR("pid");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "purchaserAccountID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "addObject:", v13);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("pairs"), 0);
  else
    v14 = 0;

  return v14;
}

@end
