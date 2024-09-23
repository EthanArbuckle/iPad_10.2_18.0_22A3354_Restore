@implementation BBSectionInfo(PBConversions)

- (void)setDisplayName:()PBConversions
{
  objc_storeStrong((id *)(a1 + (int)*MEMORY[0x24BE0FEB8]), obj);
}

- (void)setIcon:()PBConversions
{
  objc_storeStrong((id *)(a1 + (int)*MEMORY[0x24BE0FEC8]), obj);
}

- (void)setSubsections:()PBConversions
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  v5 = (int)*MEMORY[0x24BE0FED8];
  v6 = *(void **)(a1 + v5);
  *(_QWORD *)(a1 + v5) = v4;

}

- (void)setFactorySectionID:()PBConversions
{
  objc_storeStrong((id *)(a1 + (int)*MEMORY[0x24BE0FEC0]), obj);
}

- (id)factorySectionID
{
  return *(id *)(a1 + (int)*MEMORY[0x24BE0FEC0]);
}

- (void)setDataProviderIDs:()PBConversions
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(a3, "copy");
  v5 = (int)*MEMORY[0x24BE0FEB0];
  v6 = *(void **)(a1 + v5);
  *(_QWORD *)(a1 + v5) = v4;

}

- (id)dataProviderIDs
{
  return *(id *)(a1 + (int)*MEMORY[0x24BE0FEB0]);
}

- (uint64_t)enableAlertsForGizmo:()PBConversions
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = objc_msgSend(a1, "pushSettings");
  if ((_DWORD)a3)
  {
    v6 = 2;
    objc_msgSend(a1, "setAlertType:", 2);
    v7 = v5 | 0x20;
  }
  else
  {
    objc_msgSend(a1, "setAlertType:", 0);
    v7 = v5 & 0xFFFFFFFFFFFFFFDFLL;
    v6 = 1;
  }
  objc_msgSend(a1, "setPushSettings:", v7);
  objc_msgSend(a1, "setLockScreenSetting:", v6);
  result = objc_msgSend(a1, "setShowsOnExternalDevices:", a3);
  if ((_DWORD)a3)
    return objc_msgSend(a1, "setNotificationCenterSetting:", 2);
  return result;
}

- (uint64_t)updateAlertingStatusForGizmoWithAlertsEnabled:()PBConversions NCEnabled:
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
    v5 = 2;
  else
    v5 = 1;
  if (a3)
    v6 = 2;
  else
    v6 = v5;
  objc_msgSend(a1, "enableAlertsForGizmo:");
  objc_msgSend(a1, "setNotificationCenterSetting:", v5);
  return objc_msgSend(a1, "setAuthorizationStatus:", v6);
}

- (unint64_t)blt_overrideShowsAlerts
{
  unint64_t result;

  result = objc_msgSend(a1, "allowsNotifications");
  if ((_DWORD)result)
  {
    if (objc_msgSend(a1, "alertType"))
      return 1;
    else
      return ((unint64_t)objc_msgSend(a1, "suppressedSettings") >> 5) & 1;
  }
  return result;
}

- (uint64_t)blt_overrideSendToNotificationCenter
{
  uint64_t result;

  result = objc_msgSend(a1, "allowsNotifications");
  if ((_DWORD)result)
    return (objc_msgSend(a1, "blt_overrideShowsAlerts") & 1) == 0 && objc_msgSend(a1, "notificationCenterSetting") == 2;
  return result;
}

- (void)applyKeypaths:()PBConversions from:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24D786518);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v14, (_QWORD)v16))
        {
          objc_msgSend(v7, "valueForKeyPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "setValue:forKeyPath:", v15, v14);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

}

@end
