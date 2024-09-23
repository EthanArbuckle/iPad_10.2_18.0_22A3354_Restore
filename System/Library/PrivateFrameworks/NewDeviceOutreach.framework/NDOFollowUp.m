@implementation NDOFollowUp

- (NDOFollowUp)init
{
  void *v3;
  NDOFollowUp *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[NDOFollowUp initWithFollowUpProvider:](self, "initWithFollowUpProvider:", v3);

  return v4;
}

- (NDOFollowUp)initWithFollowUpProvider:(id)a3
{
  id v4;
  NDOFollowUp *v5;
  NDOFollowUp *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NDOFollowUp;
  v5 = -[NDOFollowUp init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NDOFollowUp setFollowUpProvider:](v5, "setFollowUpProvider:", v4);

  return v6;
}

+ (id)uniqueIdentfierForSerialNumber:(id)a3
{
  void *v3;
  __CFString *v4;

  if (a3)
  {
    objc_msgSend(a3, "sha256Hash");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.NewDeviceOutreach"), "stringByAppendingFormat:", CFSTR(".%@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("com.apple.NewDeviceOutreach");
  }
  return v4;
}

- (BOOL)postFollowUpWithDevicesInfo:(id)a3
{
  return -[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:](self, "_postFollowUpWithDevicesInfo:repostAllowed:", a3, 0);
}

- (BOOL)_postFollowUpWithDevicesInfo:(id)a3 repostAllowed:(BOOL)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;
  BOOL v15;

  v6 = (void *)MEMORY[0x24BDBCEB8];
  v7 = a3;
  objc_msgSend(v6, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke;
  v13[3] = &unk_24F81D498;
  v15 = a4;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke_57;
  v12[3] = &unk_24F81D4C0;
  v12[4] = self;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);
  LOBYTE(self) = objc_msgSend(v10, "count") != 0;

  return (char)self;
}

void __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  double v31;
  double v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  int v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "warranty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _NDOLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    objc_msgSend(v3, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: No warranty downloaded for device. Don't post a followup for %{private}@";
LABEL_15:
    _os_log_impl(&dword_22D064000, v18, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v37, 0x16u);

    goto LABEL_31;
  }
  objc_msgSend(v3, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "acOfferDisplay");

  if (!v6)
  {
    _NDOLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    objc_msgSend(v3, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: Device NOT eligible. Don't post a followup for %{private}@";
    goto LABEL_15;
  }
  objc_msgSend(v3, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acOfferEligibleUntil");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  v10 = v9;

  if (v10 <= 0.0)
  {
    _NDOLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    objc_msgSend(v3, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: Device no longer eligible. Don't post a followup for %{private}@";
    goto LABEL_15;
  }
  objc_msgSend(v3, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[NDOFollowUpDismissalTracker followUpIsDismissedForSerial:](NDOFollowUpDismissalTracker, "followUpIsDismissedForSerial:", v12);

  if (v13
    && !*(_BYTE *)(a1 + 48)
    && !objc_msgSend(*(id *)(a1 + 32), "_checkConversionEligibilityForDevice:", v3))
  {
    _NDOLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    objc_msgSend(v3, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 136446467;
    v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
    v39 = 2113;
    v40 = v19;
    v20 = "%{public}s: Followup already dismissed for %{private}@, leaving unposted";
    goto LABEL_15;
  }
  objc_msgSend(v3, "warranty");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "acOfferFollowupDisplayDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "warranty");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    objc_msgSend(v16, "acOfferFollowupDisplayDate");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "acOfferEligibleUntil");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "warranty");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "acOfferDurationBeforeEndDate");
    objc_msgSend(v21, "dateByAddingTimeInterval:", -v23);
    v18 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "activationDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "timeIntervalSinceNow");
    v27 = v26;
    -[NSObject timeIntervalSinceNow](v18, "timeIntervalSinceNow");
    if (v27 > v28)
    {
      _NDOLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 136446210;
        v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
        _os_log_impl(&dword_22D064000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s: Using initial postdate as it is later than FollowupDisplay Date", (uint8_t *)&v37, 0xCu);
      }

      v30 = v25;
      v18 = v30;
    }
  }
  -[NSObject timeIntervalSinceNow](v18, "timeIntervalSinceNow");
  if (v31 <= 0.0)
  {
    _NDOLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "device");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 136446467;
      v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
      v39 = 2113;
      v40 = v36;
      _os_log_impl(&dword_22D064000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible. Post new  followup for %{private}@", (uint8_t *)&v37, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
  else
  {
    -[NSObject timeIntervalSinceNow](v18, "timeIntervalSinceNow");
    if (v32 > 0.0)
    {
      _NDOLogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "device");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 136446723;
        v38 = "-[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:]_block_invoke";
        v39 = 2113;
        v40 = v34;
        v41 = 2112;
        v42 = v18;
        _os_log_impl(&dword_22D064000, v33, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible with future post date. Cannot post followup for %{private}@ on: %@", (uint8_t *)&v37, 0x20u);

      }
    }
  }

LABEL_31:
}

uint64_t __58__NDOFollowUp__postFollowUpWithDevicesInfo_repostAllowed___block_invoke_57(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "postFollowUpWithDeviceInfo:", a2);
}

- (void)postFollowUpWithDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  int v14;
  __CFString *v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  id v61;
  const __CFString *v62;
  void *v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  const __CFString *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "acOfferDisplay") && v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE1B3B0]);
    +[NDOFollowUp uniqueIdentfierForSerialNumber:](NDOFollowUp, "uniqueIdentfierForSerialNumber:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setUniqueIdentifier:](v8, "setUniqueIdentifier:", v9);
    -[NSObject setGroupIdentifier:](v8, "setGroupIdentifier:", *MEMORY[0x24BE1B2F0]);
    objc_msgSend(v4, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "deviceType");

    v12 = (_QWORD *)MEMORY[0x24BE1B2B0];
    if (v11 && v11 != 3)
    {
      if (v11 != 1)
        goto LABEL_9;
      v12 = (_QWORD *)MEMORY[0x24BE1B290];
    }
    -[NSObject setTargetBundleIdentifier:](v8, "setTargetBundleIdentifier:", *v12);
LABEL_9:
    -[NSObject setExtensionIdentifier:](v8, "setExtensionIdentifier:", CFSTR("com.apple.NewDeviceOutreach.Extension"));
    -[NDOFollowUp _setupFollowUpItem:withDeviceInfo:](self, "_setupFollowUpItem:withDeviceInfo:", v8, v4);
    -[NDOFollowUp followUpProvider](self, "followUpProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    v14 = objc_msgSend(v13, "postFollowUpItem:error:", v8, &v61);
    v15 = (__CFString *)v61;

    _NDOLogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = CFSTR("success");
      if (!v14)
        v17 = v15;
      *(_DWORD *)buf = 138412546;
      v65 = v7;
      v66 = 2112;
      v67 = v17;
      _os_log_impl(&dword_22D064000, v16, OS_LOG_TYPE_DEFAULT, "Posted follow-up: serialNumber:%@ -> %@", buf, 0x16u);
    }

    if (!v14)
      goto LABEL_38;
    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("FollowupPostedSerialNumberHashes"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = v20;
    else
      v22 = MEMORY[0x24BDBD1A8];
    objc_msgSend(v18, "arrayWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "sha256Hash");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "containsObject:", v24);

    if ((v25 & 1) == 0)
    {
      objc_msgSend(v7, "sha256Hash");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v26);

      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKey:", v23, CFSTR("FollowupPostedSerialNumberHashes"));

      v62 = CFSTR("devicetype");
      objc_msgSend(v4, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "deviceTypeString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = v30;
      AnalyticsSendEventLazy();

    }
    v59 = v9;
    v60 = v23;
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "dictionaryForKey:", CFSTR("FollowupDisplayedSerialNumberHashesWithEvents"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v33, "mutableCopy");

    v35 = 0x24BDBC000uLL;
    if (v34
      && (objc_msgSend(v34, "allKeys"),
          v36 = (void *)objc_claimAutoreleasedReturnValue(),
          v37 = objc_msgSend(v36, "count"),
          v36,
          v37))
    {
      v38 = (void *)MEMORY[0x24BDBCEF0];
      objc_msgSend(v4, "device");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "serialNumber");
      v57 = v15;
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "sha256Hash");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", v41);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = (void *)v42;
      if (v42)
        v44 = v42;
      else
        v44 = MEMORY[0x24BDBD1A8];
      objc_msgSend(v38, "setWithArray:", v44);
      v45 = objc_claimAutoreleasedReturnValue();

      v46 = (void *)v45;
      v35 = 0x24BDBC000;

      v15 = v57;
      if (v45)
        goto LABEL_30;
    }
    else
    {
      v47 = objc_opt_new();

      v34 = (void *)v47;
    }
    objc_msgSend(*(id *)(v35 + 3824), "set");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    objc_msgSend(v4, "warranty");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "eligibilityEventId");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49 && (objc_msgSend(v49, "isEqualToString:", &stru_24F81DDD8) & 1) == 0)
    {
      v58 = v15;
      objc_msgSend(v46, "addObject:", v49);
      v56 = (uint64_t)v46;
      objc_msgSend(v46, "allObjects");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "device");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "serialNumber");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "sha256Hash");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setObject:forKeyedSubscript:", v51, v54);

      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setObject:forKey:", v34, CFSTR("FollowupDisplayedSerialNumberHashesWithEvents"));

      _NDOLogSystem();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        v46 = (void *)v56;
        -[NDOFollowUp postFollowUpWithDeviceInfo:].cold.3((uint64_t)v49, v56, v50);
        v15 = v58;
        v9 = v59;
      }
      else
      {
        v15 = v58;
        v9 = v59;
        v46 = (void *)v56;
      }
    }
    else
    {
      _NDOLogSystem();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[NDOFollowUp postFollowUpWithDeviceInfo:].cold.2();
      v9 = v59;
    }

LABEL_38:
    goto LABEL_39;
  }
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[NDOFollowUp postFollowUpWithDeviceInfo:].cold.1(v5 == 0, (uint64_t)v7, v8);
LABEL_39:

}

id __42__NDOFollowUp_postFollowUpWithDeviceInfo___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = CFSTR("com.apple.newdeviceoutreach.followupDisplayCount");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "Posting for event: %@ with value: %@", (uint8_t *)&v5, 0x16u);
  }

  return *(id *)(a1 + 32);
}

- (BOOL)_checkConversionEligibilityForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sha256Hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".dismissed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9
    || (objc_msgSend(v3, "warranty"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "acOfferFollowupDisplayDate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "warranty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "acOfferFollowupDisplayDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "compare:", v13);

  if (v14 != -1)
  {
    _NDOLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[NDOFollowUp _checkConversionEligibilityForDevice:].cold.1(v3, (uint64_t)v9, v15);

    goto LABEL_7;
  }
  v18 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("FollowupPostedSerialNumberHashes"));
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = v20;
  else
    v22 = MEMORY[0x24BDBD1A8];
  objc_msgSend(v18, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "device");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "serialNumber");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "sha256Hash");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v23, "containsObject:", v26);

  if (v27)
  {
    objc_msgSend(v3, "device");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "serialNumber");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sha256Hash");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObject:", v30);

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v23, CFSTR("FollowupPostedSerialNumberHashes"));

  }
  v16 = 1;
LABEL_8:

  return v16;
}

- (void)_clearFollowUpWithDevices:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __41__NDOFollowUp__clearFollowUpWithDevices___block_invoke;
  v14[3] = &unk_24F81D510;
  v7 = v6;
  v15 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  -[NDOFollowUp followUpProvider](self, "followUpProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v9 = objc_msgSend(v8, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v7, &v13);
  v10 = (__CFString *)v13;

  _NDOLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("success");
    if (!v9)
      v12 = v10;
    *(_DWORD *)buf = 138412290;
    v17 = v12;
    _os_log_impl(&dword_22D064000, v11, OS_LOG_TYPE_DEFAULT, "Cleared follow-up: %@", buf, 0xCu);
  }

}

void __41__NDOFollowUp__clearFollowUpWithDevices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "serialNumber");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[NDOFollowUp uniqueIdentfierForSerialNumber:](NDOFollowUp, "uniqueIdentfierForSerialNumber:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_clearFollowUpForSerialNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NDOFollowUp followUpProvider](self, "followUpProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "uniqueIdentfierForSerialNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v5, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v7, &v12);
  v9 = (__CFString *)v12;

  _NDOLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("success");
    if (!v8)
      v11 = v9;
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_22D064000, v10, OS_LOG_TYPE_DEFAULT, "Cleared follow-up: %@", buf, 0xCu);
  }

}

- (void)dismissFollowUpForSerialNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NDOFollowUp followUpProvider](self, "followUpProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "uniqueIdentfierForSerialNumber:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v5, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v7, &v12);
  v9 = (__CFString *)v12;

  _NDOLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("success");
    if (!v8)
      v11 = v9;
    *(_DWORD *)buf = 138412290;
    v14 = v11;
    _os_log_impl(&dword_22D064000, v10, OS_LOG_TYPE_DEFAULT, "Dismissed follow-up: %@", buf, 0xCu);
  }

}

- (void)dismissNotificationForSerialNumber:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  int v15;
  const __CFString *v16;
  NSObject *v17;
  const __CFString *v18;
  id v19;
  __CFString *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  +[NDOFollowUp uniqueIdentfierForSerialNumber:](NDOFollowUp, "uniqueIdentfierForSerialNumber:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE1B3A8]), "initWithClientIdentifier:", CFSTR("com.apple.NewDeviceOutreach"));
  v25 = 0;
  objc_msgSend(v4, "pendingFollowUpItems:", &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFString *)v25;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        if (v3)
        {
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v12, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v3);

          if (v14)
          {
            v20 = v6;
            v15 = objc_msgSend(v4, "clearNotificationForItem:error:", v12, &v20);
            v16 = v20;

            _NDOLogSystem();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v18 = CFSTR("success");
              if (!v15)
                v18 = v16;
              v27 = v18;
              v28 = 2112;
              v29 = v12;
              _os_log_impl(&dword_22D064000, v17, OS_LOG_TYPE_DEFAULT, "Cleared follow-up notification: %@ for item: %@", buf, 0x16u);
            }

            v6 = (__CFString *)v16;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
    }
    while (v9);
  }

}

- (id)refreshFollowupWithDeviceInfo:(id)a3 andForcePostFollowup:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:](self, "refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:", v8, 0, v4, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)refreshALLFollowupsWithDeviceInfos:(id)a3 andForcePostFollowup:(BOOL)a4
{
  return -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:](self, "refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:", a3, 1, a4);
}

- (id)refreshFollowupWithDeviceInfos:(id)a3 andForcePostFollowup:(BOOL)a4
{
  return -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:](self, "refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:", a3, 0, a4);
}

- (id)refreshFollowupWithDeviceInfos:(id)a3 clearUntrackedDeviceFollowups:(BOOL)a4 andForcePostFollowup:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  __CFString *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  _BOOL4 v35;
  NSObject *v36;
  const __CFString *v37;
  void *v38;
  id v40;
  void *v41;
  id v42;
  id v43;
  NDOFollowUp *v44;
  void *v45;
  void *v46;
  id obj;
  _QWORD v48[4];
  id v49;
  NDOFollowUp *v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  uint8_t buf[4];
  const __CFString *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v5 = a4;
  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v44 = self;
  -[NDOFollowUp followUpProvider](self, "followUpProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v8, "pendingFollowUpItems:", &v66);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v66;

  if (v10)
  {
    _NDOLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:].cold.1();

  }
  v45 = v10;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "userInfo");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("FollowupSerialNumber"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
          objc_msgSend(v12, "addObject:", v18);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    }
    while (v14);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __97__NDOFollowUp_refreshFollowupWithDeviceInfos_clearUntrackedDeviceFollowups_andForcePostFollowup___block_invoke;
  v56[3] = &unk_24F81D538;
  v23 = v22;
  v57 = v23;
  v43 = v12;
  v58 = v43;
  v42 = v19;
  v59 = v42;
  v40 = v20;
  v60 = v40;
  v24 = v21;
  v61 = v24;
  v46 = v7;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v56);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v25 = v23;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v53 != v28)
          objc_enumerationMutation(v25);
        +[NDODevice deviceWithName:serialNumber:activationDate:deviceType:](NDODevice, "deviceWithName:serialNumber:activationDate:deviceType:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j), 0, 0, v40);
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        _NDOLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v68 = v30;
          _os_log_impl(&dword_22D064000, v31, OS_LOG_TYPE_DEFAULT, "No longer tracking device %{private}@, clearing", buf, 0xCu);
        }

        objc_msgSend(v24, "addObject:", v30);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
    }
    while (v27);
  }

  if (v24 && objc_msgSend(v24, "count"))
    -[NDOFollowUp _clearFollowUpWithDevices:](v44, "_clearFollowUpWithDevices:", v24);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", v40);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __97__NDOFollowUp_refreshFollowupWithDeviceInfos_clearUntrackedDeviceFollowups_andForcePostFollowup___block_invoke_90;
  v48[3] = &unk_24F81D560;
  v49 = obj;
  v50 = v44;
  v33 = v32;
  v51 = v33;
  v34 = obj;
  objc_msgSend(v42, "enumerateObjectsUsingBlock:", v48);
  if (v41 && objc_msgSend(v41, "count"))
  {
    v35 = -[NDOFollowUp _postFollowUpWithDevicesInfo:repostAllowed:](v44, "_postFollowUpWithDevicesInfo:repostAllowed:", v41, 1);
    _NDOLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = CFSTR("NO");
      if (v35)
        v37 = CFSTR("success");
      *(_DWORD *)buf = 138412290;
      v68 = v37;
      _os_log_impl(&dword_22D064000, v36, OS_LOG_TYPE_DEFAULT, "Reposted follow-up: %@", buf, 0xCu);
    }

    if (v35)
      objc_msgSend(v33, "addObjectsFromArray:", v41);
  }
  v38 = (void *)objc_msgSend(v33, "copy");

  return v38;
}

void __97__NDOFollowUp_refreshFollowupWithDeviceInfos_clearUntrackedDeviceFollowups_andForcePostFollowup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  BOOL v57;
  NSObject *v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  int v62;
  const char *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _NDOLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __97__NDOFollowUp_refreshFollowupWithDeviceInfos_clearUntrackedDeviceFollowups_andForcePostFollowup___block_invoke_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_13;
  }
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v3, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v8);

  }
  objc_msgSend(v3, "warranty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    _NDOLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    objc_msgSend(v3, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 136446467;
    v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
    v64 = 2113;
    v65 = v30;
    v31 = "%{public}s: No warranty downloaded for device. Remove the followup for %{private}@";
LABEL_20:
    _os_log_impl(&dword_22D064000, v29, OS_LOG_TYPE_DEFAULT, v31, (uint8_t *)&v62, 0x16u);

    goto LABEL_21;
  }
  objc_msgSend(v3, "warranty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "acOfferDisplay");

  if (!v11)
  {
    _NDOLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    objc_msgSend(v3, "device");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 136446467;
    v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
    v64 = 2113;
    v65 = v30;
    v31 = "%{public}s: Device NOT eligible. Remove the followup for %{private}@";
    goto LABEL_20;
  }
  objc_msgSend(v3, "warranty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "acOfferEligibleUntil");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceNow");
  v15 = v14;

  if (v15 <= 0.0)
  {
    _NDOLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "device");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 136446467;
      v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
      v64 = 2113;
      v65 = v30;
      v31 = "%{public}s: Device no longer eligible. Remove the followup for %{private}@";
      goto LABEL_20;
    }
LABEL_21:

    v32 = *(void **)(a1 + 64);
    objc_msgSend(v3, "device");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v33);

    goto LABEL_22;
  }
  v16 = *(void **)(a1 + 40);
  objc_msgSend(v3, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serialNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v16, "containsObject:", v18);

  if ((_DWORD)v16)
  {
    _NDOLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 136446467;
      v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
      v64 = 2113;
      v65 = v20;
      _os_log_impl(&dword_22D064000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible. Update the followup for %{private}@", (uint8_t *)&v62, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
    goto LABEL_22;
  }
  objc_msgSend(v3, "warranty");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v34, "scIntervalFollowupEligible"))
    goto LABEL_30;
  objc_msgSend(v3, "warranty");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "eligibilityEventId");
  v36 = objc_claimAutoreleasedReturnValue();
  if (!v36)
  {

LABEL_30:
LABEL_31:
    _NDOLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "device");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 136446467;
      v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
      v64 = 2113;
      v65 = v51;
      _os_log_impl(&dword_22D064000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s: Followup already dismissed/not present for %{private}@, leaving unposted", (uint8_t *)&v62, 0x16u);

    }
LABEL_13:

    goto LABEL_22;
  }
  v37 = (void *)v36;
  objc_msgSend(v3, "warranty");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "eligibilityEventId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "isEqualToString:", &stru_24F81DDD8);

  if ((v40 & 1) != 0)
    goto LABEL_31;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "dictionaryForKey:", CFSTR("FollowupDisplayedSerialNumberHashesWithEvents"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
    goto LABEL_33;
  objc_msgSend(v3, "device");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "serialNumber");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "sha256Hash");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    objc_msgSend(v3, "device");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "serialNumber");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "sha256Hash");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_33:
    v50 = 0;
  }
  objc_msgSend(v3, "warranty");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "eligibilityEventId");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v50, "containsObject:", v53);

  objc_msgSend(v3, "device");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "serialNumber");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = +[NDOFollowUpDismissalTracker followUpIsDismissedForSerial:](NDOFollowUpDismissalTracker, "followUpIsDismissedForSerial:", v56);

  _NDOLogSystem();
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT);
  if (v54 && v57)
  {
    if (v59)
    {
      objc_msgSend(v3, "device");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 136446467;
      v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
      v64 = 2113;
      v65 = v60;
      _os_log_impl(&dword_22D064000, v58, OS_LOG_TYPE_DEFAULT, "%{public}s: Followup already dismissed/not present/no eligible events found for %{private}@, leaving unposted", (uint8_t *)&v62, 0x16u);

    }
  }
  else
  {
    if (v59)
    {
      objc_msgSend(v3, "device");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 136446467;
      v63 = "-[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:]_block_invoke";
      v64 = 2113;
      v65 = v61;
      _os_log_impl(&dword_22D064000, v58, OS_LOG_TYPE_DEFAULT, "%{public}s: Device eligible for re-post due to eligible event. Re-post the followup for %{private}@", (uint8_t *)&v62, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
  }

LABEL_22:
}

void __97__NDOFollowUp_refreshFollowupWithDeviceInfos_clearUntrackedDeviceFollowups_andForcePostFollowup___block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  __CFString *v16;
  NSObject *v17;
  const __CFString *v18;
  uint64_t v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const __CFString *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = a1;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v3, "device");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "serialNumber");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("FollowupSerialNumber"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isEqualToString:", v12);

        if (v13)
        {
          objc_msgSend(*(id *)(v19 + 40), "_setupFollowUpItem:withDeviceInfo:", v8, v3);
          objc_msgSend(*(id *)(v19 + 40), "followUpProvider");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 0;
          v15 = objc_msgSend(v14, "postFollowUpItem:error:", v8, &v21);
          v16 = (__CFString *)v21;

          _NDOLogSystem();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = CFSTR("success");
            if (!v15)
              v18 = v16;
            *(_DWORD *)buf = 138412290;
            v27 = v18;
            _os_log_impl(&dword_22D064000, v17, OS_LOG_TYPE_DEFAULT, "Updated follow-up: %@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(v19 + 48), "addObject:", v3);
          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

}

- (unint64_t)pendingFollowUpCount
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  id v8;

  -[NDOFollowUp followUpProvider](self, "followUpProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "pendingFollowUpItems:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = objc_msgSend(v3, "count");

  if (v4)
  {
    _NDOLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:].cold.1();

  }
  return v5;
}

- (void)_setupFollowUpItem:(id)a3 withDeviceInfo:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  void *v79;
  void *v80;
  _QWORD v81[4];
  _QWORD v82[4];
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  _NDOLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446467;
    v84 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
    v85 = 2113;
    v86 = v6;
    _os_log_impl(&dword_22D064000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: %{private}@", buf, 0x16u);
  }

  objc_msgSend(v6, "warranty");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "acLocalizedOfferLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v9);

  objc_msgSend(v6, "warranty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "acLocalizedOfferDesc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInformativeFooterText:", v11);

  objc_msgSend(v6, "warranty");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "acOfferEligibleUntil");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", -0.001);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpirationDate:", v14);

  objc_msgSend(v6, "warranty");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v15, "acOfferSettingsRowBadge");

  if ((_DWORD)v13)
  {
    objc_msgSend(v6, "warranty");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "acOfferEligibleUntil");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warranty");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "acOfferBadgeDurationBeforeEndDate");
    objc_msgSend(v17, "dateByAddingTimeInterval:", -v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "compare:", v21) == -1)
    {
      objc_msgSend(v6, "warranty");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "acOfferEligibleUntil");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v24, "compare:", v25) == 1;

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
  _NDOLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v84 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
    v85 = 1024;
    LODWORD(v86) = v22;
    _os_log_impl(&dword_22D064000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: shouldShowRowBadge: %d", buf, 0x12u);
  }

  if (v22)
    v27 = 2;
  else
    v27 = 18;
  v79 = v5;
  objc_msgSend(v5, "setDisplayStyle:", v27);
  v28 = objc_alloc(MEMORY[0x24BDBCED8]);
  v81[0] = CFSTR("FollowupWarranty");
  objc_msgSend(v6, "warranty");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dictionaryRepresentation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
    v31 = (void *)objc_opt_new();
  v82[0] = v31;
  v81[1] = CFSTR("FollowupSerialNumber");
  objc_msgSend(v6, "device");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "serialNumber");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x24BE1B2A8];
  v35 = *MEMORY[0x24BE1B2A0];
  v82[1] = v33;
  v82[2] = v35;
  v36 = *MEMORY[0x24BE1B378];
  v81[2] = v34;
  v81[3] = v36;
  v82[3] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v28, "initWithDictionary:", v37);

  if (!v30)
  objc_msgSend(v6, "warranty");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "acLocalizedGroupedOfferFooterLabel");
  v40 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v40;
  if (v40)
    v42 = (const __CFString *)v40;
  else
    v42 = &stru_24F81DDD8;
  objc_msgSend(v38, "setObject:forKey:", v42, *MEMORY[0x24BE1B360]);

  objc_msgSend(v6, "device");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "name");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    goto LABEL_22;
  objc_msgSend(v6, "warranty");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "acLocalizedOfferLongLabel");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
  {
    objc_msgSend(v6, "warranty");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "acLocalizedOfferLongLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
LABEL_22:
      objc_msgSend(v38, "setObject:forKey:", v44, *MEMORY[0x24BE1B368]);

    }
  }
  objc_msgSend(v6, "warranty");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "acLocalizedOfferSingularDesc");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = v5;
  if (v46)
  {
    objc_msgSend(v6, "warranty");
    v48 = objc_claimAutoreleasedReturnValue();
    -[NSObject acLocalizedOfferSingularDesc](v48, "acLocalizedOfferSingularDesc");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v49, *MEMORY[0x24BE1B388]);

  }
  else
  {
    _NDOLogSystem();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp _setupFollowUpItem:withDeviceInfo:].cold.2();
  }

  objc_msgSend(v6, "warranty");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "acLocalizedOfferPluralDescFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    objc_msgSend(v6, "warranty");
    v55 = objc_claimAutoreleasedReturnValue();
    -[NSObject acLocalizedOfferPluralDescFormat](v55, "acLocalizedOfferPluralDescFormat");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v56, *MEMORY[0x24BE1B380]);

  }
  else
  {
    _NDOLogSystem();
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp _setupFollowUpItem:withDeviceInfo:].cold.1();
  }

  objc_msgSend(v5, "setUserInfo:", v38);
  objc_msgSend(v6, "warranty");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "acLocalizedGroupedOfferCTA");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
    goto LABEL_35;
  objc_msgSend(v6, "warranty");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "acLocalizedOfferCTA");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v59)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("FUP_ACTION_LABEL"), &stru_24F81DDD8, CFSTR("Localizable"));
    v58 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v59 = (void *)v58;

  }
  objc_msgSend(MEMORY[0x24BE1B3A0], "actionWithLabel:url:", v59, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setIdentifier:", CFSTR("com.followup.ndo_followup_open_action"));
  v80 = v61;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v80, 1);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActions:", v62);

  objc_msgSend(v6, "warranty");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "showNotificationToggle");

  if (v64)
  {
    objc_msgSend(v6, "warranty");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "acOfferEligibleUntil");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "warranty");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "showNotificationBeforeEndDate");
    objc_msgSend(v66, "dateByAddingTimeInterval:", -v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v69, "compare:", v70) == -1)
    {
      objc_msgSend(v6, "warranty");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "acOfferEligibleUntil");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v73, "compare:", v74) == 1;

    }
    else
    {
      v71 = 0;
    }

    _NDOLogSystem();
    v75 = objc_claimAutoreleasedReturnValue();
    v47 = v79;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v84 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
      v85 = 2112;
      v86 = v69;
      _os_log_impl(&dword_22D064000, v75, OS_LOG_TYPE_DEFAULT, "%{public}s: NotificationDate: %@", buf, 0x16u);
    }

    if (v71)
    {
      -[NDOFollowUp _setupFollowUpNotificationWithDeviceInfo:](self, "_setupFollowUpNotificationWithDeviceInfo:", v6);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setNotification:", v76);

      v71 = 1;
    }
  }
  else
  {
    v71 = 0;
  }
  _NDOLogSystem();
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v84 = "-[NDOFollowUp _setupFollowUpItem:withDeviceInfo:]";
    v85 = 1024;
    LODWORD(v86) = v71;
    _os_log_impl(&dword_22D064000, v77, OS_LOG_TYPE_DEFAULT, "%{public}s: shouldShowNotification: %d", buf, 0x12u);
  }

}

- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[8];
  id v25;

  v4 = a3;
  -[NDOFollowUp followUpProvider](self, "followUpProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v5, "pendingFollowUpItems:", &v25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v25;

  if (v7)
  {
    _NDOLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:].cold.1();

  }
  if (objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NewDeviceOutreach"));

    if (!v11)
    {
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v4, "warranty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    _NDOLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D064000, v13, OS_LOG_TYPE_DEFAULT, "Migrating legacy followup..", buf, 2u);
      }

      objc_msgSend(v4, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "serialNumber");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NDOFollowUp uniqueIdentfierForSerialNumber:](NDOFollowUp, "uniqueIdentfierForSerialNumber:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setUniqueIdentifier:", v17);

      -[NDOFollowUp _setupFollowUpItem:withDeviceInfo:](self, "_setupFollowUpItem:withDeviceInfo:", v9, v4);
      -[NDOFollowUp followUpProvider](self, "followUpProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v7;
      objc_msgSend(v18, "postFollowUpItem:error:", v9, &v23);
      v19 = v23;

      if (!v19)
        goto LABEL_17;
      _NDOLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[NDOFollowUp migrateLegacyFollowUpIfNeededWithDeviceInfo:].cold.2();
    }
    else
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D064000, v13, OS_LOG_TYPE_DEFAULT, "Clearing legacy followup, no legacy warranty was found..", buf, 2u);
      }
      v19 = v7;
    }

LABEL_17:
    -[NDOFollowUp followUpProvider](self, "followUpProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v19;
    objc_msgSend(v20, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", &unk_24F824710, &v22);
    v7 = v22;

    if (v7)
    {
      _NDOLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[NDOFollowUp migrateLegacyFollowUpIfNeededWithDeviceInfo:].cold.1();

    }
    goto LABEL_21;
  }
LABEL_22:

}

- (id)_setupFollowUpNotificationWithDeviceInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE1B3B8]);
  objc_msgSend(v3, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "acNotificationLocalizedOfferLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "acNotificationLocalizedOfferLabel");
  else
    objc_msgSend(v7, "acLocalizedOfferLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v9);

  objc_msgSend(v3, "warranty");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "acLocalizedNotificationOfferDesc");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "warranty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "acLocalizedNotificationOfferDesc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setInformativeText:", v13);

  }
  v14 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setIdentifier:", CFSTR("com.followup.ndo_notification_open_action"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DETAILS"), &stru_24F81DDD8, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLabel:", v17);

    objc_msgSend(v4, "setActivateAction:", v15);
  }
  else
  {
    _NDOLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp _setupFollowUpNotificationWithDeviceInfo:].cold.2();

  }
  v19 = objc_alloc_init(MEMORY[0x24BE1B3A0]);
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "setIdentifier:", CFSTR("com.followup.ndo_notification_clear_action"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NewDeviceOutreachUI.framework"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CLEAR_NOTIFICATION"), &stru_24F81DDD8, CFSTR("Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLabel:", v22);

    objc_msgSend(v4, "setClearAction:", v20);
  }
  else
  {
    _NDOLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[NDOFollowUp _setupFollowUpNotificationWithDeviceInfo:].cold.1();

  }
  objc_msgSend(v4, "setFrequency:", 0.0);
  objc_msgSend(v4, "options");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BE1B350];
  v30[0] = *MEMORY[0x24BE1B348];
  v30[1] = v25;
  v26 = *MEMORY[0x24BE1B330];
  v30[2] = *MEMORY[0x24BE1B328];
  v30[3] = v26;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setByAddingObjectsFromArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOptions:", v28);

  return v4;
}

- (NDOFollowUpProvider)followUpProvider
{
  return (NDOFollowUpProvider *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFollowUpProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followUpProvider, 0);
}

- (void)postFollowUpWithDeviceInfo:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = &stru_24F81DDD8;
  v4 = CFSTR("<Missing warranty>");
  if ((a1 & 1) == 0)
    v4 = &stru_24F81DDD8;
  if (!a2)
    v3 = CFSTR("<Missing serial number>");
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  _os_log_error_impl(&dword_22D064000, log, OS_LOG_TYPE_ERROR, "Failed to post follow-up:%@%@", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)postFollowUpWithDeviceInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Missing eventID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)postFollowUpWithDeviceInfo:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136446722;
  v4 = "-[NDOFollowUp postFollowUpWithDeviceInfo:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_6(&dword_22D064000, a3, (uint64_t)a3, "%{public}s: saving for event: %@ with events: %@", (uint8_t *)&v3);
}

- (void)_checkConversionEligibilityForDevice:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acOfferFollowupDisplayDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138478339;
  v11 = v6;
  v12 = 2112;
  v13 = a2;
  v14 = 2112;
  v15 = v8;
  OUTLINED_FUNCTION_6(&dword_22D064000, a3, v9, "Device not eligible for conversion. %{private}@, followup dismissed date: %@, fup display date: %@", (uint8_t *)&v10);

}

- (void)refreshFollowupWithDeviceInfos:clearUntrackedDeviceFollowups:andForcePostFollowup:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22D064000, v0, v1, "Error loading pending follow-ups: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __97__NDOFollowUp_refreshFollowupWithDeviceInfos_clearUntrackedDeviceFollowups_andForcePostFollowup___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D064000, a1, a3, "%{public}s: Serial number is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupFollowUpItem:withDeviceInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Missing acLocalizedOfferPluralDescFormat value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupFollowUpItem:withDeviceInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Missing acLocalizedOfferSingularDesc value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22D064000, v0, v1, "Error clearing legacy follow-up: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)migrateLegacyFollowUpIfNeededWithDeviceInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_22D064000, v0, v1, "Error posting migrated follow-up: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_setupFollowUpNotificationWithDeviceInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Failed to alloc clear action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupFollowUpNotificationWithDeviceInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_22D064000, v0, v1, "Failed to alloc open action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
