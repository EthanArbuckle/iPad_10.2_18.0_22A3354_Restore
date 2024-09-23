@implementation _ASAccountManagerTipManager

+ (void)fetchTipToShow:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46___ASAccountManagerTipManager_fetchTipToShow___block_invoke;
  v6[3] = &unk_24C94FAA8;
  v7 = v4;
  v8 = a1;
  v5 = v4;
  objc_msgSend(a1, "_checkEligibilityForImportPasswordsTipWithCompletionHandler:", v6);

}

+ (void)userDidAcknowledgeTip:(int64_t)a3
{
  if (a3 != 1 && a3 != 3)
  {
    if (a3 != 2)
      return;
    objc_msgSend(a1, "_acknowledgeTip:");
    a3 = 3;
  }
  objc_msgSend(a1, "_acknowledgeTip:", a3);
}

+ (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE30A88]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __74___ASAccountManagerTipManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke;
  v6[3] = &unk_24C94FB78;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "startRequestWithCompletionHandler:", v6);

}

+ (BOOL)_hasAcknowledgedTip:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "_refreshDateForTip:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_defaultKeyForTipType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safari_dateForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11 != 0;

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  if (v8 == -1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);
    v9 = 0;
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

+ (id)_refreshDateForTip:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safari_dateForKey:", CFSTR("iCloudKeychainTipAcknowledgementDate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 90, v4, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)_defaultKeyForTipType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  else
    return off_24C94FC50[a3 - 1];
}

+ (void)_acknowledgeTip:(int64_t)a3
{
  void *v3;
  const __CFString *v4;
  id v5;

  switch(a3)
  {
    case 3:
      objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("generalSharingTipAcknowledgementDate");
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("familySharingTipAcknowledgementDate");
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("iCloudKeychainTipAcknowledgementDate");
      break;
    default:
      return;
  }
  objc_msgSend(v5, "safari_setDate:forKey:", v3, v4);

}

+ (void)_checkEligibilityForImportPasswordsTipWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

+ (void)_checkEligibilityForiCloudKeychainTipWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BE82D70], "sharedObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUsingICloud");

  if ((v6 & 1) == 0)
  {
    v11 = WBS_LOG_CHANNEL_PREFIXPasswordManager();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20E4D9000, v11, OS_LOG_TYPE_INFO, "Skipping iCloud Keychain tip because no primary iCloud account is present", v13, 2u);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canKeychainSyncBeEnabled");

  if ((v8 & 1) == 0)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BE82CF0], "sharedMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "keychainSyncSettingValue");

  if (v10 == 2)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", CFSTR("iCloudKeychainTipAcknowledgementDate"));

    goto LABEL_9;
  }
  if (!v10)
  {
LABEL_9:
    v4[2](v4, 0);
    goto LABEL_10;
  }
  v4[2](v4, objc_msgSend(a1, "_hasAcknowledgedTip:", 1) ^ 1);
LABEL_10:

}

+ (void)_checkEligibilityForFamilySharingTipWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  id v5;
  _QWORD v6[4];
  void (**v7)(id, _QWORD);
  id v8;

  v4 = (void (**)(id, _QWORD))a3;
  if (objc_msgSend(a1, "_hasAcknowledgedTip:", 2))
  {
    v4[2](v4, 0);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BE30A88]);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __89___ASAccountManagerTipManager__checkEligibilityForFamilySharingTipWithCompletionHandler___block_invoke;
    v6[3] = &unk_24C94FC30;
    v7 = v4;
    v8 = a1;
    objc_msgSend(v5, "startRequestWithCompletionHandler:", v6);

  }
}

+ (void)_checkEligibilityForGeneralSharingTipWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v8 = (void (**)(id, uint64_t))a3;
  if ((objc_msgSend(a1, "_hasAcknowledgedTip:", 3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE82D00], "sharedProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedGroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (!v6)
    {
      v7 = 1;
      goto LABEL_6;
    }
    objc_msgSend(a1, "_acknowledgeTip:", 3);
  }
  v7 = 0;
LABEL_6:
  v8[2](v8, v7);

}

@end
