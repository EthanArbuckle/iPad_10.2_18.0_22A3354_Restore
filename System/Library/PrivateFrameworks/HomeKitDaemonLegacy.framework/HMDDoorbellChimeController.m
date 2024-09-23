@implementation HMDDoorbellChimeController

- (HMDDoorbellChimeController)initWithWorkQueue:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDDoorbellChimeControllerContext *v9;
  HMDDoorbellChimeController *v10;
  HMDDoorbellChimeController *v12;
  SEL v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    if (v7)
    {
      v9 = -[HMDDoorbellChimeControllerContext initWithWorkQueue:accessory:]([HMDDoorbellChimeControllerContext alloc], "initWithWorkQueue:accessory:", v6, v7);
      v10 = -[HMDDoorbellChimeController initWithContext:](self, "initWithContext:", v9);

      return v10;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v12 = (HMDDoorbellChimeController *)_HMFPreconditionFailure();
  return -[HMDDoorbellChimeController initWithContext:](v12, v13, v14);
}

- (HMDDoorbellChimeController)initWithContext:(id)a3
{
  id v5;
  void *v6;
  HMDDoorbellChimeController *v7;
  HMDDoorbellChimeController *v8;
  NSSet *v9;
  NSSet *availableCharacteristics;
  HMDDoorbellChimeController *result;
  HMDDoorbellChimeController *v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)HMDDoorbellChimeController;
    v7 = -[HMDDoorbellChimeController init](&v14, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_context, a3);
      v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      availableCharacteristics = v8->_availableCharacteristics;
      v8->_availableCharacteristics = v9;

    }
    return v8;
  }
  else
  {
    v12 = (HMDDoorbellChimeController *)_HMFPreconditionFailure();
    -[HMDDoorbellChimeController dealloc](v12, v13);
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[HMDDoorbellChimeController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDoorbellChimeController availableCharacteristics](self, "availableCharacteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDoorbellChimeController clientIdentifier](self, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 0, v6, v7);

  v8.receiver = self;
  v8.super_class = (Class)HMDDoorbellChimeController;
  -[HMDDoorbellChimeController dealloc](&v8, sel_dealloc);
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDDoorbellChimeController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[HMDDoorbellChimeController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");

  -[HMDDoorbellChimeController context](self, "context");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDDoorbellChimeController context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_handleCharacteristicsValueUpdatedNotification_, CFSTR("HMDNotificationCharacteristicValueUpdated"), v9);

}

- (void)handleUpdatedPersonIdentificationInformation
{
  void *v3;
  char v4;
  void *v5;
  NSObject *v6;
  void *v7;
  HMDDoorbellChimeController *v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HMDDoorbellChimeController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentDevicePrimaryResident");

  if ((v4 & 1) != 0)
  {
    -[HMDDoorbellChimeController context](self, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__HMDDoorbellChimeController_handleUpdatedPersonIdentificationInformation__block_invoke;
    block[3] = &unk_1E89C2730;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Ignoring new significant event since we are not the primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

- (id)clientIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDDoorbellChimeController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), CFSTR("HMDDoorbellChimeControllerIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  HMDDoorbellChimeController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDoorbellChimeController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v22 = v4;
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMDNotificationCharacteristicValueUpdatedChangedCharacteristicsKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  v21 = v10;
  objc_msgSend(v10, "na_filter:", &__block_literal_global_95590);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1D17BA0A0]();
        v18 = self;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v28 = v20;
          v29 = 2112;
          v30 = v16;
          _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Handling doorbell input event characteristic: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v17);
        -[HMDDoorbellChimeController _notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:attemptCloudPullIfNoPersonsFound:](v18, "_notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:attemptCloudPullIfNoPersonsFound:", 1, 1);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

}

- (void)_notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:(BOOL)a3 attemptCloudPullIfNoPersonsFound:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v7;
  NSObject *v8;
  void *v9;
  HMDDoorbellChimeController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  HMDDoorbellChimeController *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  HMDDoorbellChimeController *v29;
  NSObject *v30;
  void *v31;
  HMDDoorbellChimeNotificationLogEvent *v32;
  void *v33;
  void *v34;
  HMDDoorbellChimeController *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
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
  HMDDoorbellChimeController *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  HMDDoorbellChimeController *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  HMDDoorbellChimeController *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  HMDDoorbellChimeController *v80;
  NSObject *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  HMDDoorbellChimeController *v86;
  NSObject *v87;
  _BOOL4 v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  HMDDoorbellChimeNotificationLogEvent *v104;
  void *v105;
  void *v106;
  void *v107;
  _QWORD v108[5];
  id v109;
  id v110;
  id v111;
  HMDDoorbellChimeNotificationLogEvent *v112;
  BOOL v113;
  _QWORD v114[5];
  id v115;
  id v116;
  HMDDoorbellChimeNotificationLogEvent *v117;
  id v118;
  BOOL v119;
  _QWORD v120[5];
  uint8_t buf[4];
  void *v122;
  __int16 v123;
  double v124;
  __int16 v125;
  void *v126;
  uint64_t v127;

  v4 = a4;
  v5 = a3;
  v127 = *MEMORY[0x1E0C80C00];
  -[HMDDoorbellChimeController context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)MEMORY[0x1D17BA0A0]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v122 = v12;
    v123 = 2112;
    v124 = *(double *)&v13;
    v125 = 2112;
    v126 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying accessories for doorbell press with shouldPlayChime: %@, attemptCloudPullIfNoPersonsFound: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v9);
  if (v5)
  {
LABEL_11:
    v32 = objc_alloc_init(HMDDoorbellChimeNotificationLogEvent);
    -[HMDDoorbellChimeController _destinationIDsToNotifyForDoorbellChimeUsingCoreUtilAction](v10, "_destinationIDsToNotifyForDoorbellChimeUsingCoreUtilAction");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDoorbellChimeNotificationLogEvent setCoreUtilsDestinationCount:](v32, "setCoreUtilsDestinationCount:", objc_msgSend(v33, "count"));
    v34 = (void *)MEMORY[0x1D17BA0A0](-[HMDDoorbellChimeNotificationLogEvent setNumHomePodsWithDoorbellChimeEnabled:](v32, "setNumHomePodsWithDoorbellChimeEnabled:", -[HMDDoorbellChimeController _numHomePodsWithDoorbellChimeEnabled](v10, "_numHomePodsWithDoorbellChimeEnabled")));
    v35 = v10;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v122 = v37;
      v123 = 2112;
      v124 = *(double *)&v33;
      _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_INFO, "%{public}@Determined destinations for CoreUtils to notify for doorbell chime: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v34);
    if (v5)
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
    else
      -[HMDDoorbellChimeController lastUnidentifiedChimeDate](v35, "lastUnidentifiedChimeDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](v35, "setLastUnidentifiedChimeDate:", v38);

    -[HMDDoorbellChimeController context](v35, "context");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "accessory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "cameraProfiles");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "anyObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v107 = v42;
    if (v42)
    {
      v104 = v32;
      -[HMDDoorbellChimeController context](v35, "context");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "doorbellBulletinUtilities");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDoorbellChimeController lastUnidentifiedChimeDate](v35, "lastUnidentifiedChimeDate");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "significantEventsRelevantToDoorbellPress:forCameraProfile:", v45, v42);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDDoorbellChimeController context](v35, "context");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "doorbellBulletinUtilities");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedAudioAccessoryAnnounceMessageForSignificantEvents:", v46);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v42 && v4)
      {
        objc_msgSend(v107, "clipManager");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v99 = v40;
          v101 = v33;
          v50 = (void *)MEMORY[0x1D17BA0A0]();
          v51 = v35;
          HMFGetOSLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v122 = v53;
            _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Did not find person identification text, so performing cloud pull", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v50);
          objc_msgSend(v49, "performCloudPull");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)MEMORY[0x1E0D519E8];
          -[HMDDoorbellChimeController context](v51, "context");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "workQueue");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "schedulerWithDispatchQueue:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "reschedule:", v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v120[0] = MEMORY[0x1E0C809B0];
          v120[1] = 3221225472;
          v120[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke;
          v120[3] = &unk_1E89C21E8;
          v120[4] = v51;
          v60 = (id)objc_msgSend(v59, "addSuccessBlock:", v120);

          v40 = v99;
          v33 = v101;
          v42 = 0;
        }

      }
      v32 = v104;
    }
    if (v5 || v42)
    {
      v106 = v42;
      -[HMDDoorbellChimeController context](v35, "context");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = objc_msgSend(v65, "isCoordinationPathEnabled");

      if (v66)
      {
        v102 = v33;
        v67 = (void *)MEMORY[0x1D17BA0A0]();
        v68 = v35;
        HMFGetOSLogHandle();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v122 = v70;
          _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_INFO, "%{public}@Coordination path is enabled so taking coordination route for eligible accessories", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v67);
        -[HMDDoorbellChimeController context](v68, "context");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "fetchDoorbellDelay");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = (void *)MEMORY[0x1E0D519E8];
        -[HMDDoorbellChimeController context](v68, "context");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "workQueue");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "schedulerWithDispatchQueue:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "reschedule:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_38;
        v114[3] = &unk_1E89B1AB8;
        v114[4] = v68;
        v115 = v40;
        v119 = v5;
        v116 = v106;
        v117 = v32;
        v118 = v102;
        v78 = (id)objc_msgSend(v77, "addCompletionBlock:", v114);

        v42 = v106;
        v33 = v102;

      }
      else
      {
        -[HMDDoorbellChimeController context](v35, "context");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v83, "isCoordinationFreePathEnabled");

        v85 = (void *)MEMORY[0x1D17BA0A0]();
        v86 = v35;
        HMFGetOSLogHandle();
        v87 = objc_claimAutoreleasedReturnValue();
        v88 = os_log_type_enabled(v87, OS_LOG_TYPE_INFO);
        if (v84)
        {
          v103 = v33;
          if (v88)
          {
            HMFGetLogIdentifier();
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v122 = v89;
            _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_INFO, "%{public}@Taking HomeKit path as coordination path is disabled", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v85);
          objc_msgSend(v40, "home");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDDoorbellChimeController context](v86, "context");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "fetchDoorbellDelay");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = (void *)MEMORY[0x1E0D519E8];
          -[HMDDoorbellChimeController context](v86, "context");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "workQueue");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "schedulerWithDispatchQueue:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "reschedule:", v94);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v108[0] = MEMORY[0x1E0C809B0];
          v108[1] = 3221225472;
          v108[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_50;
          v108[3] = &unk_1E89B1AB8;
          v108[4] = v86;
          v109 = v90;
          v113 = v5;
          v110 = v106;
          v111 = v103;
          v112 = v32;
          v96 = v90;
          v97 = (id)objc_msgSend(v95, "addCompletionBlock:", v108);

          v42 = v106;
          v33 = v103;

        }
        else
        {
          if (v88)
          {
            HMFGetLogIdentifier();
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v122 = v98;
            _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_INFO, "%{public}@Coordination path is disabled so not taking coordination route for any accessories", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v85);
          v42 = v106;
          -[HMDDoorbellChimeController _chimeCoreUtilDoorbellWithDestination:shouldPlayChime:logEvent:personIdentificationText:](v86, "_chimeCoreUtilDoorbellWithDestination:shouldPlayChime:logEvent:personIdentificationText:", v33, v5, v32, v106);
        }
      }
    }
    else
    {
      v61 = (void *)MEMORY[0x1D17BA0A0]();
      v62 = v35;
      HMFGetOSLogHandle();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v122 = v64;
        _os_log_impl(&dword_1CD062000, v63, OS_LOG_TYPE_INFO, "%{public}@Not playing chime and found no persons to announce, so doing nothing", buf, 0xCu);

        v42 = 0;
      }

      objc_autoreleasePoolPop(v61);
    }

    return;
  }
  -[HMDDoorbellChimeController lastUnidentifiedChimeDate](v10, "lastUnidentifiedChimeDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[HMDDoorbellChimeController lastUnidentifiedChimeDate](v10, "lastUnidentifiedChimeDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceNow");
    v18 = -v17;

    v19 = (void *)MEMORY[0x1D17BA0A0]();
    v20 = v10;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDoorbellChimeController context](v20, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doorbellChimeMaximumAnnounceDelay");
      *(_DWORD *)buf = 138543874;
      v122 = v22;
      v123 = 2048;
      v124 = v18;
      v125 = 2048;
      v126 = v24;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@It has been %lfs since the last unidentified chime, and our maximum allowed announce delay is %lfs", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
    -[HMDDoorbellChimeController context](v20, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "doorbellChimeMaximumAnnounceDelay");
    v27 = v26;

    if (v27 < v18)
    {
      v28 = (void *)MEMORY[0x1D17BA0A0]();
      v29 = v20;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v122 = v31;
        _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Not notifying accessories since we have exceeded our maximum allowed announce delay", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](v29, "setLastUnidentifiedChimeDate:", 0);
      return;
    }
    goto LABEL_11;
  }
  v79 = (void *)MEMORY[0x1D17BA0A0]();
  v80 = v10;
  HMFGetOSLogHandle();
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v122 = v82;
    _os_log_impl(&dword_1CD062000, v81, OS_LOG_TYPE_INFO, "%{public}@Ignoring updated person information because there was not a recent doorbell press", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v79);
}

- (void)notifyAccessoriesViaCoordinationFreePathWithDelay:(double)a3 home:(id)a4 shouldPlayChime:(BOOL)a5 personIdentificationText:(id)a6 nexusNotificationDestinationIDs:(id)a7 logEvent:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDDoorbellChimeController *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  HMDDoorbellChimeController *v29;
  id v30;
  double v31;
  BOOL v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v11 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = (void *)MEMORY[0x1D17BA0A0]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v34 = v21;
    _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Taking HomeKit path as coordination path is disabled", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
  objc_msgSend(v14, "appleMediaAccessories");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __167__HMDDoorbellChimeController_notifyAccessoriesViaCoordinationFreePathWithDelay_home_shouldPlayChime_personIdentificationText_nexusNotificationDestinationIDs_logEvent___block_invoke;
  v28 = &unk_1E89B1AE0;
  v29 = v19;
  v32 = v11;
  v23 = v15;
  v30 = v23;
  v31 = a3;
  objc_msgSend(v22, "na_each:", &v25);

  if (v23)
  {
    -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](v19, "setLastUnidentifiedChimeDate:", 0, v25, v26, v27, v28, v29);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v25, v26, v27, v28, v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](v19, "setLastUnidentifiedChimeDate:", v24);

  }
  -[HMDDoorbellChimeController _chimeCoreUtilDoorbellWithDestination:shouldPlayChime:logEvent:personIdentificationText:](v19, "_chimeCoreUtilDoorbellWithDestination:shouldPlayChime:logEvent:personIdentificationText:", v16, v11, v17, v23);

}

- (void)_chimeCoreUtilDoorbellWithDestination:(id)a3 shouldPlayChime:(BOOL)a4 logEvent:(id)a5 personIdentificationText:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  HMDDoorbellChimeController *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDDoorbellChimeController *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v8 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HMDDoorbellChimeController context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logEventSubmitter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0D1B390]);
    v16 = v15;
    if (v8)
      objc_msgSend(v15, "setAlertType:", 1);
    objc_msgSend(v16, "setDestinationIDs:", v10);
    objc_msgSend(v16, "setSpeakText:", v12);
    if (v12)
    {
      -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](self, "setLastUnidentifiedChimeDate:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](self, "setLastUnidentifiedChimeDate:", v21);

    }
    v38 = v14;
    v22 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v49 = v26;
      v50 = 2112;
      v51 = v16;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Posting action: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    -[HMDDoorbellChimeController context](v24, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postCULiveAction:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __118__HMDDoorbellChimeController__chimeCoreUtilDoorbellWithDestination_shouldPlayChime_logEvent_personIdentificationText___block_invoke;
    v46[3] = &unk_1E89C2210;
    v46[4] = v24;
    v30 = v16;
    v47 = v30;
    objc_msgSend(v28, "addSuccessBlock:", v46);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v29;
    v44[1] = 3221225472;
    v44[2] = __118__HMDDoorbellChimeController__chimeCoreUtilDoorbellWithDestination_shouldPlayChime_logEvent_personIdentificationText___block_invoke_53;
    v44[3] = &unk_1E89C21C0;
    v44[4] = v24;
    v32 = v30;
    v45 = v32;
    objc_msgSend(v31, "addFailureBlock:", v44);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v29;
    v39[1] = 3221225472;
    v39[2] = __118__HMDDoorbellChimeController__chimeCoreUtilDoorbellWithDestination_shouldPlayChime_logEvent_personIdentificationText___block_invoke_54;
    v39[3] = &unk_1E89B1B08;
    v11 = v22;
    v40 = v22;
    v34 = v37;
    v41 = v34;
    v42 = v10;
    v43 = v38;
    v35 = (id)objc_msgSend(v33, "addCompletionBlock:", v39);

    if (v12)
    {
      -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](v24, "setLastUnidentifiedChimeDate:", 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDDoorbellChimeController setLastUnidentifiedChimeDate:](v24, "setLastUnidentifiedChimeDate:", v36);

    }
    v14 = v38;
  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@Destination count is 0", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(v14, "submitLogEvent:", v11);
  }

}

- (id)_destinationIDsToNotifyForDoorbellChimeUsingCoreUtilAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id obj;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  -[HMDDoorbellChimeController context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appleMediaAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __88__HMDDoorbellChimeController__destinationIDsToNotifyForDoorbellChimeUsingCoreUtilAction__block_invoke;
  v49[3] = &unk_1E89C1088;
  v49[4] = self;
  objc_msgSend(v6, "na_filter:", v49);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v27 = v5;
  objc_msgSend(v5, "mediaSystems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v31)
  {
    v29 = *(_QWORD *)v46;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(obj);
        v32 = v8;
        v9 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v8);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v33 = v30;
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v35)
        {
          v34 = *(_QWORD *)v42;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v42 != v34)
                objc_enumerationMutation(v33);
              v36 = v10;
              v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v10);
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              objc_msgSend(v9, "accessories");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
              if (v13)
              {
                v14 = v13;
                v15 = *(_QWORD *)v38;
                do
                {
                  v16 = 0;
                  do
                  {
                    if (*(_QWORD *)v38 != v15)
                      objc_enumerationMutation(v12);
                    objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v16), "uuid");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "uuid");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = objc_msgSend(v17, "hmf_isEqualToUUID:", v18);

                    if (v19)
                    {
                      objc_msgSend(v9, "accessories");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v7, "addObjectsFromArray:", v20);

                    }
                    ++v16;
                  }
                  while (v14 != v16);
                  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
                }
                while (v14);
              }

              v10 = v36 + 1;
            }
            while (v36 + 1 != v35);
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
          }
          while (v35);
        }

        v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v31);
  }

  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v21, "na_map:", &__block_literal_global_60_95553);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (unint64_t)_numHomePodsWithDoorbellChimeEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[HMDDoorbellChimeController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_63_95550);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_filter:", &__block_literal_global_64);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (void)handleCharacteristicsValueUpdatedNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMDDoorbellChimeController *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDDoorbellChimeController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCurrentDevicePrimaryResident");

  if ((v6 & 1) != 0)
  {
    -[HMDDoorbellChimeController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "workQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __76__HMDDoorbellChimeController_handleCharacteristicsValueUpdatedNotification___block_invoke;
    v13[3] = &unk_1E89C2328;
    v13[4] = self;
    v14 = v4;
    dispatch_async(v8, v13);

  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring characteristic value updated notification since we are not the primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDDoorbellChimeController context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[HMDDoorbellChimeController setAvailableCharacteristics:](self, "setAvailableCharacteristics:", v5);
  -[HMDDoorbellChimeController context](self, "context");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDDoorbellChimeController clientIdentifier](self, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNotificationsEnabled:forCharacteristics:clientIdentifier:", 1, v7, v8);

}

- (HMDDoorbellChimeControllerContext)context
{
  return (HMDDoorbellChimeControllerContext *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)availableCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvailableCharacteristics:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDate)lastUnidentifiedChimeDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastUnidentifiedChimeDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUnidentifiedChimeDate, 0);
  objc_storeStrong((id *)&self->_availableCharacteristics, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __76__HMDDoorbellChimeController_handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCharacteristicsValueUpdatedNotification:", *(_QWORD *)(a1 + 40));
}

uint64_t __66__HMDDoorbellChimeController__numHomePodsWithDoorbellChimeEnabled__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isHomePod"))
    v3 = objc_msgSend(v2, "isDoorbellChimeSettingEnabled");
  else
    v3 = 0;

  return v3;
}

id __66__HMDDoorbellChimeController__numHomePodsWithDoorbellChimeEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __88__HMDDoorbellChimeController__destinationIDsToNotifyForDoorbellChimeUsingCoreUtilAction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "isHomePod"))
    goto LABEL_12;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessorySupportsCoordinationFreeDoorbellChime:", v3);

  if (!v5
    || (objc_msgSend(*(id *)(a1 + 32), "context"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isCoordinationFreePathEnabled"),
        v6,
        !v7))
  {
    objc_msgSend(*(id *)(a1 + 32), "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "accessorySupportsCoordinationDoorbellChime:", v3);

    if (!v17
      || (objc_msgSend(*(id *)(a1 + 32), "context"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isCoordinationPathEnabled"),
          v18,
          !v19))
    {
      v20 = objc_msgSend(v3, "isDoorbellChimeSettingEnabled");
      goto LABEL_14;
    }
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isCoordinationPathEnabled");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v11;
    v24 = 2112;
    v25 = v3;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v14;
    v15 = "%{public}@Accessory: %@ supportsCoordinationDoorbellChime: %@ coordination enabled: %@";
    goto LABEL_10;
  }
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isCoordinationFreePathEnabled");
    HMFBooleanToString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138544130;
    v23 = v11;
    v24 = 2112;
    v25 = v3;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v14;
    v15 = "%{public}@Accessory: %@ supportsCoordinationFreeDoorbellChime: %@ coordination free enabled: %@";
LABEL_10:
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, 0x2Au);

  }
LABEL_11:

  objc_autoreleasePoolPop(v8);
LABEL_12:
  v20 = 0;
LABEL_14:

  return v20;
}

id __88__HMDDoorbellChimeController__destinationIDsToNotifyForDoorbellChimeUsingCoreUtilAction__block_invoke_58(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "idsIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __118__HMDDoorbellChimeController__chimeCoreUtilDoorbellWithDestination_shouldPlayChime_logEvent_personIdentificationText___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully posted action %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __118__HMDDoorbellChimeController__chimeCoreUtilDoorbellWithDestination_shouldPlayChime_logEvent_personIdentificationText___block_invoke_53(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v9 = 138543874;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to post action %@: %@", (uint8_t *)&v9, 0x20u);

  }
  objc_autoreleasePoolPop(v4);

}

void __118__HMDDoorbellChimeController__chimeCoreUtilDoorbellWithDestination_shouldPlayChime_logEvent_personIdentificationText___block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  id v6;

  v4 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v4, "timeIntervalSinceNow");
  objc_msgSend(*(id *)(a1 + 32), "setCoreUtilsLatency:", (unint64_t)(v5 * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setCoreUtilsDestinationCount:", objc_msgSend(*(id *)(a1 + 48), "count"));
  objc_msgSend(*(id *)(a1 + 56), "submitLogEvent:error:", *(_QWORD *)(a1 + 32), v6);

}

void __167__HMDDoorbellChimeController_notifyAccessoriesViaCoordinationFreePathWithDelay_home_shouldPlayChime_personIdentificationText_nexusNotificationDestinationIDs_logEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessorySupportsCoordinationFreeDoorbellChime:", v10);

  v5 = v10;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
    {
      if (v6)
        v7 = 3;
      else
        v7 = 1;
      goto LABEL_8;
    }
    if (v6)
    {
      v7 = 2;
LABEL_8:
      objc_msgSend(v10, "doorbellChimeProfile");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", *(double *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendDoorbellChimeMessageWithChimeMode:chimeDate:personIdentificationText:", v7, v9, *(_QWORD *)(a1 + 40));

      v5 = v10;
    }
  }

}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Cloud pull succeeded; attempting to announce without playing chime",
      (uint8_t *)&v8,
      0xCu);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "_notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:attemptCloudPullIfNoPersonsFound:", 0, 0);

}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  _QWORD v76[5];
  id v77;
  id v78;
  _QWORD v79[5];
  id v80;
  id v81;
  _QWORD v82[3];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v71 = a3;
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v84 = v9;
    v85 = 2112;
    v86 = v5;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Coordinating doorbell chime with delay of %@s", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentAccessoryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v14)
  {
    v82[0] = CFSTR("Doorbell");
    v82[1] = v12;
    v82[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v16, "dateWithTimeIntervalSinceNow:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", CFSTR("mode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "keyPathFromComponents:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "arrayByAddingObject:", CFSTR("at"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "keyPathFromComponents:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v23;
    if (!v20 || !v23)
    {
      v37 = v17;
      v38 = v24;
      v39 = (void *)MEMORY[0x1D17BA0A0]();
      v40 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v68 = v5;
        v42 = v12;
        v43 = v14;
        v44 = v15;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v45;
        _os_log_impl(&dword_1CD062000, v41, OS_LOG_TYPE_ERROR, "%{public}@Nil chime mode keyPath or chime date keyPath", buf, 0xCu);

        v15 = v44;
        v14 = v43;
        v12 = v42;
        v5 = v68;
      }

      objc_autoreleasePoolPop(v39);
      v25 = v69;
      v24 = v38;
      v17 = v37;
      goto LABEL_32;
    }
    objc_msgSend(v70, "setObject:forKey:", v17, v23);
    v25 = v69;
    objc_msgSend(v69, "addObject:", v23);
    objc_msgSend(v69, "addObject:", v20);
    v26 = *(_QWORD *)(a1 + 48);
    if (*(_BYTE *)(a1 + 72))
    {
      v65 = v15;
      v66 = (void *)v23;
      if (!v26)
      {
        v64 = v17;
        v67 = v5;
        objc_msgSend(v70, "setObject:forKey:", &unk_1E8B33588, v20);
        goto LABEL_22;
      }
      objc_msgSend(*(id *)(a1 + 32), "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayByAddingObject:", CFSTR("personId"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "keyPathFromComponents:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v64 = v17;
        v67 = v5;
        objc_msgSend(v70, "setObject:forKey:", &unk_1E8B335B8, v20);
        v30 = *(void **)(a1 + 48);
        v31 = v70;
        v32 = v29;
LABEL_20:
        objc_msgSend(v31, "setObject:forKey:", v30, v32);
        v25 = v69;
        objc_msgSend(v69, "addObject:", v29);

LABEL_22:
        v48 = (void *)objc_msgSend(v70, "copy");
        objc_msgSend(*(id *)(a1 + 32), "context");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "postCoordinationState:", v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = MEMORY[0x1E0C809B0];
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_43;
        v79[3] = &unk_1E89B2C88;
        v79[4] = *(_QWORD *)(a1 + 32);
        v52 = v48;
        v80 = v52;
        v53 = v25;
        v81 = v53;
        objc_msgSend(v50, "addSuccessBlock:", v79);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v76[0] = v51;
        v76[1] = 3221225472;
        v76[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_44;
        v76[3] = &unk_1E89C0DA8;
        v76[4] = *(_QWORD *)(a1 + 32);
        v55 = v52;
        v77 = v55;
        v78 = v53;
        objc_msgSend(v54, "addFailureBlock:", v76);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v72[0] = v51;
        v72[1] = 3221225472;
        v72[2] = __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_46;
        v72[3] = &unk_1E89BF480;
        v73 = *(id *)(a1 + 56);
        v57 = v55;
        v74 = v57;
        v75 = v20;
        v58 = (id)objc_msgSend(v56, "addCompletionBlock:", v72);

        if (*(_QWORD *)(a1 + 48))
        {
          objc_msgSend(*(id *)(a1 + 32), "setLastUnidentifiedChimeDate:", 0);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setLastUnidentifiedChimeDate:", v59);

        }
        v5 = v67;
        v15 = v65;
        v17 = v64;
        objc_msgSend(*(id *)(a1 + 32), "_chimeCoreUtilDoorbellWithDestination:shouldPlayChime:logEvent:personIdentificationText:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

        v25 = v69;
        goto LABEL_31;
      }
      v60 = (void *)MEMORY[0x1D17BA0A0]();
      v61 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v63;
        _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@KeyPaths for chime are nil, or this is not an ATV build", buf, 0xCu);

      }
    }
    else
    {
      if (!v26)
      {
LABEL_32:

        goto LABEL_33;
      }
      v66 = (void *)v23;
      objc_msgSend(*(id *)(a1 + 32), "context");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v15;
      objc_msgSend(v15, "arrayByAddingObject:", CFSTR("personId"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "keyPathFromComponents:", v47);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        v64 = v17;
        v67 = v5;
        objc_msgSend(v70, "setObject:forKey:", *(_QWORD *)(a1 + 48), v29);
        v30 = &unk_1E8B335A0;
        v31 = v70;
        v32 = v20;
        goto LABEL_20;
      }
      v60 = (void *)MEMORY[0x1D17BA0A0]();
      v61 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
    }

    objc_autoreleasePoolPop(v60);
    v15 = v65;
    v25 = v69;
LABEL_31:
    v24 = v66;
    goto LABEL_32;
  }
  v33 = (void *)MEMORY[0x1D17BA0A0]();
  v34 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v84 = v36;
    v85 = 2112;
    v86 = v12;
    v87 = 2112;
    v88 = v14;
    _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Cannot chime using coordination with currentAccessoryUUID: %@ accessoryUUID: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v33);
LABEL_33:

}

uint64_t __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_50(uint64_t a1, void *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(v3, "notifyAccessoriesViaCoordinationFreePathWithDelay:home:shouldPlayChime:personIdentificationText:nexusNotificationDestinationIDs:logEvent:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_43(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v12 = 138543618;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully posted state:%@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v11 = (id)objc_msgSend(v9, "clearCoordinationStateForKeyPaths:", v10);

}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to post state %@: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v11 = (id)objc_msgSend(v9, "clearCoordinationStateForKeyPaths:", v10);

}

void __118__HMDDoorbellChimeController__notifyAllAccessoriesForDoorbellPressAndPlayChimeSound_attemptCloudPullIfNoPersonsFound___block_invoke_46(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D33490];
  v5 = a3;
  objc_msgSend(v4, "currentTime");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "startTime");
  objc_msgSend(*(id *)(a1 + 32), "setCoordinationLatency:", (unint64_t)((v7 - v8) * 1000.0));
  objc_msgSend(*(id *)(a1 + 32), "setCoordinationPathTriggered:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCoordinationError:", v5);

  objc_msgSend(*(id *)(a1 + 40), "hmf_numberForKey:", *(_QWORD *)(a1 + 48));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCoordinationMode:", objc_msgSend(v9, "integerValue"));

}

uint64_t __77__HMDDoorbellChimeController__handleCharacteristicsValueUpdatedNotification___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB8908]))
  {
    objc_msgSend(v2, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9A08]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __74__HMDDoorbellChimeController_handleUpdatedPersonIdentificationInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAllAccessoriesForDoorbellPressAndPlayChimeSound:attemptCloudPullIfNoPersonsFound:", 0, 1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_95605 != -1)
    dispatch_once(&logCategory__hmf_once_t31_95605, &__block_literal_global_65_95606);
  return (id)logCategory__hmf_once_v32_95607;
}

void __41__HMDDoorbellChimeController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v32_95607;
  logCategory__hmf_once_v32_95607 = v0;

}

@end
