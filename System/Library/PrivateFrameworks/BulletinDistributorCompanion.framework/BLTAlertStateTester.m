@implementation BLTAlertStateTester

- (unint64_t)willNanoPresentNotificationForSectionInfo:(id)a3 subsectionIDs:(id)a4 isWristDetectDisabled:(BOOL)a5 hasSectionIDOptedOutOfCoordination:(BOOL)a6 hasSectionIDOptedForwardOnly:(BOOL)a7 ignoresDowntime:(BOOL)a8 isCritical:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  BLTAlertStateTester *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  unint64_t v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  void (**v38)(_QWORD, _QWORD);
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v44;
  unint64_t v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v59 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  objc_msgSend(v15, "sectionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = -[BLTAlertStateTester isScreenTimeBlockedForBundleIdentifier:ignoresDowntime:](self, "isScreenTimeBlockedForBundleIdentifier:ignoresDowntime:", v17, v9);

  v18 = 512;
  if (!v9)
    v18 = 0;
  if (v12)
    v18 |= 0x80uLL;
  if (v11)
    v18 |= 0x40uLL;
  if (v10)
    v19 = v18 | 0x100;
  else
    v19 = v18;
  objc_msgSend(v15, "subsections");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v16;
  if (objc_msgSend(v16, "count") && objc_msgSend(v20, "count"))
  {
    v45 = v19;
    v46 = v15;
    v21 = self;
    -[BLTAlertStateTester setTestCheckedSubsections:](self, "setTestCheckedSubsections:", 1);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v44 = v20;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = 0;
      v27 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v49 != v27)
            objc_enumerationMutation(v22);
          v29 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v29, "subsectionID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v47, "containsObject:", v30);

          if (v31)
          {
            v32 = -[BLTAlertStateTester _blockingReasonForSectionInfo:isCritical:](v21, "_blockingReasonForSectionInfo:isCritical:", v29, a9);
            if (!v32)
              goto LABEL_38;
            v26 = v32;
            v25 |= v32;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v24);

      if (v26)
      {
        v33 = v25 | v45;
        v15 = v46;
LABEL_40:
        v20 = v44;
        goto LABEL_41;
      }
    }
    else
    {
LABEL_38:

    }
    v33 = v45;
    v15 = v46;
    goto LABEL_40;
  }
  -[BLTAlertStateTester setTestCheckedSubsections:](self, "setTestCheckedSubsections:", 0);
  if (objc_msgSend(v16, "count") && !objc_msgSend(v20, "count"))
  {
    blt_general_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "sectionID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = v35;
      v55 = 2112;
      v56 = v16;
      v57 = 2112;
      v58 = v15;
      _os_log_impl(&dword_2173D9000, v34, OS_LOG_TYPE_DEFAULT, "Checking if notification with subsections will present in sectionInfo that has no subsections! Falling back to checking against sectionInfo. sectionID:%@ subsectionIDs:%@ sectionInfo:%@", buf, 0x20u);

    }
  }
  objc_msgSend(v15, "factorySectionID");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (!v36 || !objc_msgSend(v15, "suppressFromSettings"))
    goto LABEL_36;
  -[BLTAlertStateTester sectionInfoRetriever](self, "sectionInfoRetriever");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[BLTAlertStateTester sectionInfoRetriever](self, "sectionInfoRetriever");
    v38 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "factorySectionID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v38)[2](v38, v39);
    v36 = (id)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      blt_general_log();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v15, "sectionID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "factorySectionID");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v54 = v41;
        v55 = 2112;
        v56 = v42;
        _os_log_impl(&dword_2173D9000, v40, OS_LOG_TYPE_DEFAULT, "Section settings for %@ overridden by factory section %@", buf, 0x16u);

      }
      v36 = v36;

      v15 = v36;
    }
LABEL_36:

  }
  v33 = -[BLTAlertStateTester _blockingReasonForSectionInfo:isCritical:](self, "_blockingReasonForSectionInfo:isCritical:", v15, a9) | v19;
LABEL_41:

  return v33;
}

- (unint64_t)_blockingReasonForSectionInfo:(id)a3 isCritical:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  unint64_t v7;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = 32 * (objc_msgSend(v5, "criticalAlertSetting") != 2);
  }
  else
  {
    if (objc_msgSend(v5, "alertType"))
    {
      v7 = 0;
    }
    else if (objc_msgSend(v6, "lockScreenSetting") == 2)
    {
      v7 = 0;
    }
    else
    {
      v7 = 3;
    }
    if (!objc_msgSend(v6, "showsOnExternalDevices"))
      v7 |= 0x10uLL;
    if (!objc_msgSend(v6, "allowsNotifications"))
      v7 |= 0x20uLL;
  }

  return v7;
}

- (BOOL)isScreenTimeBlockedForBundleIdentifier:(id)a3 ignoresDowntime:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deviceManagementPolicy");
  if (v7)
    v8 = !v4;
  else
    v8 = 0;
  if (v8)
  {
    v14 = 1;
  }
  else
  {
    v9 = v7;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2C7D8]), "initWithPolicyChangeHandler:", 0);
    v18 = 0;
    objc_msgSend(v10, "requestPoliciesByBundleIdentifierWithError:", &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v18)
    {
      v13 = 1;
    }
    else
    {
      objc_msgSend(v11, "objectForKey:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      v13 = v16 == 0;
    }
    if (v9)
      v13 = 0;
    v14 = !v13 && !v4;

  }
  return v14;
}

- (id)sectionInfoRetriever
{
  return self->_sectionInfoRetriever;
}

- (void)setSectionInfoRetriever:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)testCheckedSubsections
{
  return self->_testCheckedSubsections;
}

- (void)setTestCheckedSubsections:(BOOL)a3
{
  self->_testCheckedSubsections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sectionInfoRetriever, 0);
}

@end
