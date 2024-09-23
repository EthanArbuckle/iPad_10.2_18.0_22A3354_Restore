@implementation HUHomePodServiceDetails

+ (id)homePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4 cornerRadius:(double)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  double v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v25 = "+[HUHomePodServiceDetails homePodCardWithQuickControlsForDeviceUUID:inHomeWithUUID:cornerRadius:]";
    v26 = 2112;
    v27 = v8;
    v28 = 2112;
    v29 = v9;
    v30 = 2048;
    v31 = a5;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "(%s) Setting up HMMutableHomeManagerConfiguration to HMHomeManagerOptionsAppleMediaAccessories. homePodUUID %@. homeUUID %@. cornerRadius %f.", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v12, "setOptions:", 105);
  objc_msgSend(MEMORY[0x1E0D31430], "setConfiguration:", v12);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allHomesFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__HUHomePodServiceDetails_homePodCardWithQuickControlsForDeviceUUID_inHomeWithUUID_cornerRadius___block_invoke;
  v19[3] = &unk_1E6F57A90;
  v21 = v9;
  v22 = a1;
  v20 = v8;
  v23 = a5;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v14, "flatMap:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __97__HUHomePodServiceDetails_homePodCardWithQuickControlsForDeviceUUID_inHomeWithUUID_cornerRadius___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "_homePodDetailsViewControllerForHomePodWithUUID:inHomeWithUUID:fromHomes:cornerRadius:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, *(double *)(a1 + 56));
}

+ (id)homePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4
{
  return (id)objc_msgSend(a1, "homePodCardWithQuickControlsForDeviceUUID:inHomeWithUUID:cornerRadius:", a3, a4, 20.0);
}

+ (id)SAHomePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4
{
  return (id)objc_msgSend(a1, "SAHomePodCardWithQuickControlsForDeviceUUID:inHomeWithUUID:cornerRadius:", a3, a4, 20.0);
}

+ (id)SAHomePodCardWithQuickControlsForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4 cornerRadius:(double)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D316B8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUseSAConfig:", 1);
  objc_msgSend(a1, "homePodCardWithQuickControlsForDeviceUUID:inHomeWithUUID:cornerRadius:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)SAHomePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5
{
  return (id)objc_msgSend(a1, "SAHomePodCardForMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:cornerRadius:", a3, a4, a5, 20.0);
}

+ (id)SAHomePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0D316B8];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUseSAConfig:", 1);
  objc_msgSend(a1, "homePodCardForMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:cornerRadius:", v12, v11, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)homePodCardForDeviceUUID:(id)a3 inHomeWithUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Setting up HMMutableHomeManagerConfiguration to HMHomeManagerOptionsAppleMediaAccessories", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "setOptions:", 105);
  objc_msgSend(MEMORY[0x1E0D31430], "setConfiguration:", v10);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allHomesFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__HUHomePodServiceDetails_homePodCardForDeviceUUID_inHomeWithUUID___block_invoke;
  v17[3] = &unk_1E6F57AB8;
  v19 = v7;
  v20 = a1;
  v18 = v6;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v12, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __67__HUHomePodServiceDetails_homePodCardForDeviceUUID_inHomeWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 48), "_homePodSettingsViewControllerForHomePodWithUUID:inHomeWithUUID:fromHomes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2);
}

+ (id)homePodCardForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5
{
  return (id)objc_msgSend(a1, "homePodCardForMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:cornerRadius:", a3, a4, a5, 20.0);
}

+ (id)_homePodSettingsViewControllerForHomePodWithUUID:(id)a3 inHomeWithUUID:(id)a4 fromHomes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __101__HUHomePodServiceDetails__homePodSettingsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes___block_invoke;
  v17[3] = &unk_1E6F57AE0;
  v18 = v10;
  v19 = v9;
  v20 = v8;
  v21 = a1;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  objc_msgSend(v11, "futureWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __101__HUHomePodServiceDetails__homePodSettingsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40));

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_20;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v12, "accessories", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
LABEL_13:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_msgSend(v18, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 48));

        if ((v20 & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
            goto LABEL_13;
          goto LABEL_19;
        }
      }
      v21 = v18;

      if (!v21)
        goto LABEL_23;
      objc_msgSend(*(id *)(a1 + 56), "_homePodSettingsViewControllerForAccessory:inHome:", v21, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:", v22);

    }
    else
    {
LABEL_19:

LABEL_23:
      objc_msgSend(v3, "finishWithNoResult");
    }

  }
  else
  {
LABEL_9:

LABEL_20:
    objc_msgSend(v3, "finishWithNoResult");
  }

}

+ (id)_homePodDetailsViewControllerForHomePodWithUUID:(id)a3 inHomeWithUUID:(id)a4 fromHomes:(id)a5 cornerRadius:(double)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "startMonitoringUpdatesForAccessoryID:homeID:", v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v30 = a1;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    v39 = 2048;
    v40 = a6;
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@:%@ homePodUUID = %@, homeUUID = %@, homes = %@ cornerRadius = %f", buf, 0x3Eu);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke;
  v23[3] = &unk_1E6F57B08;
  v24 = v13;
  v25 = v12;
  v26 = v11;
  v27 = a1;
  v28 = a6;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  objc_msgSend(v15, "flatMap:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v3 = objc_msgSend(a2, "BOOLValue");
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke_2;
    v11[3] = &unk_1E6F574B0;
    v12 = *(id *)(a1 + 32);
    v13 = *(id *)(a1 + 40);
    v5 = *(id *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v14 = v5;
    v15 = v6;
    v16 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v4, "futureWithBlock:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reschedule:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __113__HUHomePodServiceDetails__homePodDetailsViewControllerForHomePodWithUUID_inHomeWithUUID_fromHomes_cornerRadius___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v8);
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40));

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_20;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v12, "accessories", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
LABEL_13:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
        objc_msgSend(v18, "uniqueIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 48));

        if ((v20 & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v15)
            goto LABEL_13;
          goto LABEL_19;
        }
      }
      v21 = v18;

      if (!v21)
        goto LABEL_23;
      objc_msgSend(*(id *)(a1 + 56), "_homePodDetailsViewControllerForAccessory:inHome:cornerRadius:", v21, v12, *(double *)(a1 + 64));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:", v22);

    }
    else
    {
LABEL_19:

LABEL_23:
      objc_msgSend(v3, "finishWithNoResult");
    }

  }
  else
  {
LABEL_9:

LABEL_20:
    objc_msgSend(v3, "finishWithNoResult");
  }

}

+ (id)_homePodSettingsViewControllerForAccessory:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  HUServiceDetailsViewController *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  int v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 138413058;
    v34 = a1;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v7;
    v39 = 2112;
    v40 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ accessory = %@, home = %@", (uint8_t *)&v33, 0x2Au);

  }
  objc_msgSend(v8, "hf_characteristicValueManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0D31508]);
  objc_msgSend(v7, "mediaProfile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithValueSource:mediaProfileContainer:", v11, v13);

  objc_msgSend(v14, "mediaProfileContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    v17 = v11;
    if (objc_msgSend(v17, "conformsToProtocol:", &unk_1EF3481B0))
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19)
    {
      v20 = v17;
    }
    else
    {
      objc_msgSend(v14, "mediaProfileContainer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hf_mediaValueSource");
      v20 = (id)objc_claimAutoreleasedReturnValue();

    }
    v23 = objc_alloc(MEMORY[0x1E0D31520]);
    objc_msgSend(v14, "mediaProfileContainer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:", v20, v24, objc_msgSend(v14, "mediaAccessoryItemType"), 0);

    if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
    {
      v26 = objc_alloc(MEMORY[0x1E0D31448]);
      objc_msgSend(v14, "mediaProfileContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v26, "initWithMediaProfileContainer:displayResults:", v27, 0);

      objc_msgSend(v16, "addObject:", v28);
      if (_os_feature_enabled_impl())
      {
        v29 = objc_alloc(MEMORY[0x1E0D31458]);
        objc_msgSend(v14, "mediaProfileContainer");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)objc_msgSend(v29, "initWithMediaProfileContainer:displayResults:", v30, 0);

        objc_msgSend(v16, "addObject:", v31);
      }

    }
    objc_msgSend(v16, "addObject:", v25);
    v21 = -[HUServiceDetailsViewController initWithServiceLikeItem:]([HUServiceDetailsViewController alloc], "initWithServiceLikeItem:", v14);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)_homePodDetailsViewControllerForAccessory:(id)a3 inHome:(id)a4 cornerRadius:(double)a5
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  HUQuickControlPresentationCoordinator *v41;
  HUQuickControlPresentationContext *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  const char *aSelector;
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  double v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "hf_characteristicValueManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v52 = a1;
    v53 = 2112;
    v54 = v13;
    v55 = 2112;
    v56 = v9;
    v57 = 2112;
    v58 = v10;
    v59 = 2048;
    v60 = a5;
    v61 = 2112;
    v62 = v11;
    _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ accessory = %@, home = %@, cornerRadius = %f, valueSource = %@", buf, 0x3Eu);

  }
  objc_msgSend(v10, "hf_mediaSystemForAccessory:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0D31508]);
  v16 = v15;
  if (v14)
  {
    v17 = (void *)objc_msgSend(v15, "initWithValueSource:mediaProfileContainer:", v11, v14);
  }
  else
  {
    objc_msgSend(v9, "mediaProfile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "initWithValueSource:mediaProfileContainer:", v11, v18);

  }
  objc_msgSend(v17, "mediaProfileContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v47 = v14;
    aSelector = a2;
    v50 = a1;
    v20 = (void *)objc_opt_new();
    v48 = v11;
    v21 = v11;
    v22 = &unk_1EF3481B0;
    if (objc_msgSend(v21, "conformsToProtocol:", v22))
      v23 = v21;
    else
      v23 = 0;
    v24 = v23;

    v25 = v9;
    if (v24)
    {
      v26 = v21;
    }
    else
    {
      objc_msgSend(v17, "mediaProfileContainer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hf_mediaValueSource");
      v26 = (id)objc_claimAutoreleasedReturnValue();

    }
    v28 = objc_alloc(MEMORY[0x1E0D31520]);
    objc_msgSend(v17, "mediaProfileContainer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:", v26, v29, objc_msgSend(v17, "mediaAccessoryItemType"), 0);

    HFLogForCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mediaProfileContainer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "hf_mediaValueSource");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v52 = v50;
      v53 = 2112;
      v54 = v32;
      v55 = 2112;
      v56 = v26;
      v57 = 2112;
      v58 = v34;
      v59 = 2112;
      v60 = *(double *)&v30;
      _os_log_impl(&dword_1B8E1E000, v31, OS_LOG_TYPE_DEFAULT, "%@:%@ mediaValueSource = %@, hf_mediaValueSource = %@, mediaControlItem = %@", buf, 0x34u);

    }
    v9 = v25;
    v14 = v47;
    if (objc_msgSend(v10, "hf_currentUserIsAdministrator"))
    {
      v35 = objc_alloc(MEMORY[0x1E0D31448]);
      objc_msgSend(v17, "mediaProfileContainer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)objc_msgSend(v35, "initWithMediaProfileContainer:displayResults:", v36, 0);

      objc_msgSend(v20, "addObject:", v37);
      if (_os_feature_enabled_impl())
      {
        v38 = objc_alloc(MEMORY[0x1E0D31458]);
        objc_msgSend(v17, "mediaProfileContainer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)objc_msgSend(v38, "initWithMediaProfileContainer:displayResults:", v39, 0);

        objc_msgSend(v20, "addObject:", v40);
      }

    }
    objc_msgSend(v20, "addObject:", v30, v47);
    v41 = -[HUQuickControlPresentationCoordinator initWithCornerRadius:]([HUQuickControlPresentationCoordinator alloc], "initWithCornerRadius:", a5);
    v42 = objc_alloc_init(HUQuickControlPresentationContext);
    -[HUQuickControlPresentationContext setControlItems:](v42, "setControlItems:", v20);
    -[HUQuickControlPresentationContext setItem:](v42, "setItem:", v17);
    -[HUQuickControlPresentationContext setHome:](v42, "setHome:", v10);
    -[HUQuickControlPresentationContext setPrefersSystemTransitions:](v42, "setPrefersSystemTransitions:", 1);
    -[HUQuickControlPresentationCoordinator createNavigationControllerForPresentationContext:](v41, "createNavigationControllerForPresentationContext:", v42);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v48;
    a2 = aSelector;
    a1 = v50;
  }
  HFLogForCategory();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "mediaProfileContainer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v52 = a1;
    v53 = 2112;
    v54 = v44;
    v55 = 2112;
    v56 = v19;
    v57 = 2112;
    v58 = v45;
    _os_log_impl(&dword_1B8E1E000, v43, OS_LOG_TYPE_DEFAULT, "%@:%@ Returning Nav Controller = %@, for mediaProfileContainer = %@", buf, 0x2Au);

  }
  return v19;
}

+ (id)_homePodDetailsViewControllerForMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6
{
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  double v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  double v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v28 = a1;
    v29 = 2112;
    v30 = v14;
    v31 = 2112;
    v32 = v11;
    v33 = 2112;
    v34 = v12;
    v35 = 2048;
    v36 = a5;
    v37 = 2048;
    v38 = a6;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ mediaRoutingIdentifier = %@, deviceName = %@, mediaAccessoryItemType = %ld cornerRadius = %lf", buf, 0x3Eu);

  }
  objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startMonitoringUpdatesForMediaRemoteIdentifier:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke;
  v21[3] = &unk_1E6F57B58;
  v22 = v11;
  v23 = v12;
  v24 = a1;
  v25 = a5;
  v26 = a6;
  v17 = v12;
  v18 = v11;
  objc_msgSend(v16, "flatMap:", v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke_2;
  v16 = &unk_1E6F57B30;
  v5 = *(_QWORD *)(a1 + 48);
  v17 = v3;
  v20 = v5;
  v18 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 56);
  v19 = v6;
  v21 = v7;
  v22 = *(_QWORD *)(a1 + 64);
  v8 = v3;
  objc_msgSend(v4, "futureWithBlock:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reschedule:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __129__HUHomePodServiceDetails__homePodDetailsViewControllerForMediaRoutingIdentifier_deviceName_mediaAccessoryItemType_cornerRadius___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  v3 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (objc_msgSend(v5, "BOOLValue"))
  {
    objc_msgSend(*(id *)(a1 + 56), "_homePodDetailsViewControllerForAccessoryWithMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:cornerRadius:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(double *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v6);

  }
  else
  {
    objc_msgSend(v7, "finishWithNoResult");
  }

}

+ (id)_homePodDetailsViewControllerForAccessoryWithMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5 cornerRadius:(double)a6
{
  id v11;
  HUQuickControlPresentationContext *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HUQuickControlPresentationCoordinator *v17;
  HUQuickControlPresentationContext *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  HUQuickControlPresentationContext *v31;
  __int16 v32;
  int64_t v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (HUQuickControlPresentationContext *)a4;
  v13 = (void *)objc_opt_new();
  HFLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413570;
    v25 = a1;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    v32 = 2048;
    v33 = a5;
    v34 = 2048;
    v35 = a6;
    _os_log_impl(&dword_1B8E1E000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@ mediaRoutingIdentifier = %@, deviceName = %@, mediaAccessoryItemType = %ld, cornerRadius = %lf", (uint8_t *)&v24, 0x3Eu);

  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31520]), "initWithMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:", v11, v12, a5);
  objc_msgSend(v13, "addObject:", v16);
  v17 = -[HUQuickControlPresentationCoordinator initWithCornerRadius:]([HUQuickControlPresentationCoordinator alloc], "initWithCornerRadius:", a6);
  v18 = objc_alloc_init(HUQuickControlPresentationContext);
  -[HUQuickControlPresentationContext setControlItems:](v18, "setControlItems:", v13);
  -[HUQuickControlPresentationContext setPrefersSystemTransitions:](v18, "setPrefersSystemTransitions:", 1);
  -[HUQuickControlPresentationContext setIsConfiguredForNonHomeUser:](v18, "setIsConfiguredForNonHomeUser:", 1);
  -[HUQuickControlPresentationCoordinator createNavigationControllerForPresentationContext:](v17, "createNavigationControllerForPresentationContext:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0D316B8], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "invalidateProxClient");

  }
  HFLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413058;
    v25 = a1;
    v26 = 2112;
    v27 = v22;
    v28 = 2112;
    v29 = v19;
    v30 = 2112;
    v31 = v18;
    _os_log_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEFAULT, "%@:%@ Returning Nav Controller = %@, for  presentationContext = %@, ", (uint8_t *)&v24, 0x2Au);

  }
  return v19;
}

@end
