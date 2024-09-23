@implementation BBSectionInfoSettings(protobuf)

- (void)applySectionInfoSettingsFromProtobuf:()protobuf
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hasAnnounceSetting"))
    objc_msgSend(a1, "setAnnounceSetting:", (int)objc_msgSend(v4, "announceSetting"));
  if (objc_msgSend(v4, "hasScheduledDeliverySetting"))
    objc_msgSend(a1, "setScheduledDeliverySetting:", (int)objc_msgSend(v4, "scheduledDeliverySetting"));
  if (!objc_msgSend(v4, "hasMuteAssertion"))
  {
    objc_msgSend(a1, "setMuteAssertion:", 0);
    goto LABEL_19;
  }
  objc_msgSend(v4, "muteAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasExpirationDate");

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "muteAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expirationDate");
    objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE0FE88], "sectionMuteAssertionUntilDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setMuteAssertion:", v10);

  }
  else
  {
    objc_msgSend(v4, "muteAssertion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionBulletinLists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (!v13)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x24BE0FEA8], "threadsMuteAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v4, "muteAssertion", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sectionBulletinLists");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v20, "expirationDate");
          objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "threadID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setMutedUntilDate:forThreadIdentifier:", v22, v23);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    objc_msgSend(a1, "setMuteAssertion:", v9);
  }

LABEL_19:
  if (objc_msgSend(v4, "hasTimeSensitiveSetting"))
    objc_msgSend(a1, "setTimeSensitiveSetting:", (int)objc_msgSend(v4, "timeSensitiveSetting"));
  if (objc_msgSend(v4, "hasUserConfiguredTimeSensitiveSetting"))
    objc_msgSend(a1, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(v4, "userConfiguredTimeSensitiveSetting"));

}

- (id)blt_protobuf
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setAnnounceSetting:", objc_msgSend(a1, "announceSetting"));
  objc_msgSend(v2, "setTimeSensitiveSetting:", objc_msgSend(a1, "timeSensitiveSetting"));
  objc_msgSend(v2, "setScheduledDeliverySetting:", objc_msgSend(a1, "scheduledDeliverySetting"));
  objc_msgSend(a1, "muteAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v2, "setMuteAssertion:", v4);

    objc_msgSend(a1, "muteAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(a1, "muteAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "expirationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "timeIntervalSinceReferenceDate");
      v11 = v10;
      objc_msgSend(v2, "muteAssertion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setExpirationDate:", v11);

    }
    else
    {
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(a1, "muteAssertion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "expirationDateByThreadID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v27;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v27 != v19)
                objc_enumerationMutation(v16);
              v21 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v20);
              v22 = (void *)objc_opt_new();
              objc_msgSend(v22, "setThreadID:", v21, (_QWORD)v26);
              objc_msgSend(v16, "objectForKeyedSubscript:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "timeIntervalSinceReferenceDate");
              objc_msgSend(v22, "setExpirationDate:");

              objc_msgSend(v2, "muteAssertion");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addSectionBulletinList:", v22);

              ++v20;
            }
            while (v18 != v20);
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v18);
        }

      }
    }
  }
  if (objc_msgSend(a1, "hasUserConfiguredTimeSensitiveSetting", (_QWORD)v26))
    objc_msgSend(v2, "setUserConfiguredTimeSensitiveSetting:", objc_msgSend(a1, "hasUserConfiguredTimeSensitiveSetting"));
  return v2;
}

@end
