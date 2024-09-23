@implementation HMDDoorbellBulletinUtilities

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_68329 != -1)
    dispatch_once(&logCategory__hmf_once_t9_68329, &__block_literal_global_31_68330);
  return (id)logCategory__hmf_once_v10_68331;
}

void __43__HMDDoorbellBulletinUtilities_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_68331;
  logCategory__hmf_once_v10_68331 = v0;

}

- (id)localizedDoorbellMessageForSignificantEvents:(id)a3
{
  return -[HMDDoorbellBulletinUtilities _localizedDoorbellMessageForSignificantEvents:forAudioAccessory:](self, "_localizedDoorbellMessageForSignificantEvents:forAudioAccessory:", a3, 0);
}

- (id)localizedAudioAccessoryAnnounceMessageForSignificantEvents:(id)a3
{
  return -[HMDDoorbellBulletinUtilities _localizedDoorbellMessageForSignificantEvents:forAudioAccessory:](self, "_localizedDoorbellMessageForSignificantEvents:forAudioAccessory:", a3, 1);
}

- (id)_localizedDoorbellMessageForSignificantEvents:(id)a3 forAudioAccessory:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  void *v7;
  HMDDoorbellBulletinUtilities *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  id v24;
  __CFString *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  id v35;
  __CFString *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  __CFString *v40;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v4 = a4;
  v54 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v10;
    v48 = 2112;
    v49 = v6;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Determining localized camera doorbell message from significant events: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[__CFString na_map:](v6, "na_map:", &__block_literal_global_68369);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString na_filter:](v6, "na_filter:", &__block_literal_global_2_68370);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v16 == 1)
  {
    v42 = v12;
    v18 = CFSTR("NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR");
    if (v4)
      v18 = CFSTR("NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR_AUDIO_ACCESSORY");
    v19 = v18;
    v20 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    objc_msgSend(v15, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v21, CFSTR("%@"), &v45, v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v24 = v45;

    v25 = v23;
    if (!v23)
    {
      v26 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v28;
        v48 = 2112;
        v49 = v19;
        v50 = 2112;
        v51 = CFSTR("%@");
        v52 = 2112;
        v53 = v24;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v26);
      v25 = v19;
    }
    v17 = v25;

    v12 = v42;
  }
  else if (v16)
  {
    v43 = v11;
    v29 = CFSTR("NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR_MULTIPLE");
    if (v4)
      v29 = CFSTR("NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_FAMILIAR_MULTIPLE_AUDIO_ACCESSORY");
    v30 = v29;
    v31 = (void *)MEMORY[0x24BDD17C8];
    HMDLocalizedStringForKey(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v15, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v32, CFSTR("%@"), &v44, v33);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v35 = v44;

    v36 = v34;
    if (!v34)
    {
      v37 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v47 = v39;
        v48 = 2112;
        v49 = v30;
        v50 = 2112;
        v51 = CFSTR("%@");
        v52 = 2112;
        v53 = v35;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v37);
      v36 = v30;
    }
    v17 = v36;

    v11 = v43;
  }
  else if (v4)
  {
    v17 = 0;
  }
  else
  {
    if ((unint64_t)objc_msgSend(v12, "count") < 2)
      v40 = CFSTR("NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_UNFAMILIAR");
    else
      v40 = CFSTR("NOTIFICATION_MESSAGE_CAMERA_DOORBELL_EVENT_UNFAMILIAR_MULTIPLE");
    HMDLocalizedStringForKey(v40);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)localizedMessageForCharacteristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDD17C8];
  HMDLocalizedStringForKey(CFSTR("NOTIFICATION_MESSAGE_DOORBELL_EVENT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v3, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBulletinCategory trimLeadingAndTailingSpacesInName:](HMDBulletinCategory, "trimLeadingAndTailingSpacesInName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v5, CFSTR("%@"), &v18, v9);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  v12 = v10;
  if (!v10)
  {
    v13 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v20 = v15;
      v21 = 2112;
      v22 = CFSTR("NOTIFICATION_MESSAGE_DOORBELL_EVENT");
      v23 = 2112;
      v24 = CFSTR("%@");
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to determined localized string for format key %@ and valid format specifiers %@: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v13);
    v12 = CFSTR("NOTIFICATION_MESSAGE_DOORBELL_EVENT");
  }
  v16 = v12;

  return v16;
}

- (id)_significantEventsWithinTimeWindowOfDoorbellPress:(id)a3 forCameraProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDDoorbellBulletinUtilities *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDDoorbellBulletinUtilities *v19;
  NSObject *v20;
  void *v21;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "clipManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v6, -30.0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v6, 30.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)v9;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v10);
    objc_msgSend(v8, "significantEventsWithDateInterval:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v25 = v16;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v7;
      v30 = 2112;
      v31 = v11;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Found recent significant events: %@ for camera profile: %@, with date interval: %@, dateOfDoorbellPress: %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Clip Manager is nil, returning empty set for significant events in time window", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)significantEventsRelevantToDoorbellPress:(id)a3 forCameraProfile:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMDDoorbellBulletinUtilities *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDDoorbellBulletinUtilities *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDDoorbellBulletinUtilities *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "clipManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[HMDDoorbellBulletinUtilities _significantEventsWithinTimeWindowOfDoorbellPress:forCameraProfile:](self, "_significantEventsWithinTimeWindowOfDoorbellPress:forCameraProfile:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_map:", &__block_literal_global_25_68354);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "hmf_isEmpty") & 1) != 0)
    {
      objc_msgSend(v8, "significantEventsForClipContainingDate:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v15;
        v27 = 2112;
        v28 = v11;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@The following significant events were found for the clip containing the doorbell press: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v9;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@The following significant events were found within the time window: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      v11 = v9;
    }

  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@Clip Manager is nil, returning empty set for significant events relevant to doorbell press", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)faceClassificationsNearDateOfDoorbellPress:(id)a3 forCameraProfile:(id)a4
{
  void *v4;
  void *v5;

  -[HMDDoorbellBulletinUtilities significantEventsRelevantToDoorbellPress:forCameraProfile:](self, "significantEventsRelevantToDoorbellPress:forCameraProfile:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_26_68350);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)clipUUIDsForCoalesceableSignificantEvents:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "na_map:", &__block_literal_global_28_68347);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_29_68348);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __74__HMDDoorbellBulletinUtilities_clipUUIDsForCoalesceableSignificantEvents___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "reason") == 1 || objc_msgSend(v2, "reason") == 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "clipUUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __74__HMDDoorbellBulletinUtilities_clipUUIDsForCoalesceableSignificantEvents___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clipUUID");
}

uint64_t __92__HMDDoorbellBulletinUtilities_faceClassificationsNearDateOfDoorbellPress_forCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceClassification");
}

uint64_t __90__HMDDoorbellBulletinUtilities_significantEventsRelevantToDoorbellPress_forCameraProfile___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceClassification");
}

id __96__HMDDoorbellBulletinUtilities__localizedDoorbellMessageForSignificantEvents_forAudioAccessory___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "person");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __96__HMDDoorbellBulletinUtilities__localizedDoorbellMessageForSignificantEvents_forAudioAccessory___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reason") == 2;
}

uint64_t __96__HMDDoorbellBulletinUtilities__localizedDoorbellMessageForSignificantEvents_forAudioAccessory___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "faceClassification");
}

@end
