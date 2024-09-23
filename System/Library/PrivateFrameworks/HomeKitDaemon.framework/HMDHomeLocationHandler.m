@implementation HMDHomeLocationHandler

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[HMDHomeLocationHandler location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  locationAsString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_localTimeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMDHomeLocationSourceToString(-[HMDHomeLocationHandler locationSource](self, "locationSource"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Loc: %@, Timestamp: %@, Source: %@"), v5, v7, v8);

  return (NSString *)v9;
}

- (HMDHomeLocationHandler)init
{
  HMDHomeLocationHandler *v2;
  HMDHomeLocationHandler *v3;
  uint64_t v4;
  NSDate *lastArrival;
  uint64_t v6;
  NSDate *lastExit;
  uint64_t v8;
  NSDate *lastAttemptedLocationUpdate;
  uint64_t v10;
  NSDate *homeLocationUpdateRequestTime;
  uint64_t v12;
  HMMLogEventSubmitting *logEventSubmitter;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDHomeLocationHandler;
  v2 = -[HMDHomeLocationHandler init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_locationAuthorization = 0;
    v2->_coalesceRegionUpdateIntervalInSeconds = 3.0;
    v2->_firstAccessoryReachable = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v4 = objc_claimAutoreleasedReturnValue();
    lastArrival = v3->_lastArrival;
    v3->_lastArrival = (NSDate *)v4;

    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v6 = objc_claimAutoreleasedReturnValue();
    lastExit = v3->_lastExit;
    v3->_lastExit = (NSDate *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithTimeIntervalSinceReferenceDate:", 0.0);
    lastAttemptedLocationUpdate = v3->_lastAttemptedLocationUpdate;
    v3->_lastAttemptedLocationUpdate = (NSDate *)v8;

    v3->_resendOnce = 0;
    v3->_shouldUpdateHomeLocation = 0;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    homeLocationUpdateRequestTime = v3->_homeLocationUpdateRequestTime;
    v3->_homeLocationUpdateRequestTime = (NSDate *)v10;

    v3->_regionStateAtHome = 0;
    v3->_regionStateNearbyHome = 0;
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v12 = objc_claimAutoreleasedReturnValue();
    logEventSubmitter = v3->_logEventSubmitter;
    v3->_logEventSubmitter = (HMMLogEventSubmitting *)v12;

    v3->_pairingHomeLocationOverride = 0;
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HMDHomeLocationHandler msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterReceiver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HMDHomeLocationHandler;
  -[HMDHomeLocationHandler dealloc](&v4, sel_dealloc);
}

- (void)configure:(id)a3 queue:(id)a4 messageDispatcher:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  HMDHomeLocationHandler *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  CLLocation *location;
  void *v18;
  void *v19;
  const char *v20;
  CLLocation *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  CLLocation *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMDHomeLocationHandler setHome:](self, "setHome:", v8);
  -[HMDHomeLocationHandler setWorkQueue:](self, "setWorkQueue:", v9);
  -[HMDHomeLocationHandler setMsgDispatcher:](self, "setMsgDispatcher:", v10);
  v11 = isInternalBuild();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      location = v13->_location;
      -[NSDate hmf_localTimeDescription](v13->_locationUpdateTimestamp, "hmf_localTimeDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HMDHomeLocationSourceToString(v13->_locationSource);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138544386;
      v24 = v16;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = location;
      v29 = 2112;
      v30 = v18;
      v31 = 2112;
      v32 = v19;
      v20 = "%{public}@Configured location handler for home %@, with: %@, and timestamp with: %@, and source: %@";
LABEL_6:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, v20, (uint8_t *)&v23, 0x34u);

    }
  }
  else if (v15)
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v13->_location;
    -[NSDate hmf_localTimeDescription](v13->_locationUpdateTimestamp, "hmf_localTimeDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMDHomeLocationSourceToString(v13->_locationSource);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544387;
    v24 = v16;
    v25 = 2112;
    v26 = v8;
    v27 = 2117;
    v28 = v21;
    v29 = 2112;
    v30 = v18;
    v31 = 2112;
    v32 = v19;
    v20 = "%{public}@Configured location handler for home %@, with: %{sensitive}@, and timestamp with: %@, and source: %@";
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v12);
  -[HMDHomeLocationHandler _updateTimeZone:](v13, "_updateTimeZone:", v13->_location);
  -[HMDHomeLocationHandler _registerForMessages](v13, "_registerForMessages");
  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationHandler _handleLocationAuthorization:](v13, "_handleLocationAuthorization:", objc_msgSend(v22, "locationAuthorized"));

}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", CFSTR("kRetrieveHomeLocationRequestKey"), self, v5, sel__handleRetrieveLocation_);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__handleLocationAuthorizationChangedNotification_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

}

- (void)_registerForRegionUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDHomeLocationHandler *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeLocationHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMDHomeLocationHandler *v23;
  NSObject *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  HMDHomeLocationHandler *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  HMDHomeLocationHandler *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  id v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[5];
  _QWORD v75[5];
  _QWORD v76[2];
  uint8_t buf[4];
  void *v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
    -[HMDHomeLocationHandler regionAtHome](self, "regionAtHome");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v78 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Deregistering for old location at home region updates", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      -[HMDHomeLocationHandler regionAtHome](v7, "regionAtHome");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    -[HMDHomeLocationHandler regionNearbyHome](self, "regionNearbyHome");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v78 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Deregistering for old location nearby home region updates", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDHomeLocationHandler regionNearbyHome](v13, "regionNearbyHome");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v16);

    }
    v17 = objc_msgSend(v4, "count");
    v18 = MEMORY[0x24BDAC760];
    if (v17)
    {
      +[HMDLocation sharedManager](HMDLocation, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v4, "copy");
      v75[0] = v18;
      v75[1] = 3221225472;
      v75[2] = __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke;
      v75[3] = &unk_24E79BD80;
      v75[4] = self;
      objc_msgSend(v19, "deregisterForRegionUpdate:completionHandler:", v20, v75);

      -[HMDHomeLocationHandler setRegionAtHome:](self, "setRegionAtHome:", 0);
      -[HMDHomeLocationHandler setRegionNearbyHome:](self, "setRegionNearbyHome:", 0);
    }
    -[HMDHomeLocationHandler location](self, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v78 = v25;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Registering for new location at home region and nearby home region updates", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v22);
      v26 = -[HMDHomeLocationHandler _shouldRegisterForSignificantRegion](v23, "_shouldRegisterForSignificantRegion");
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v23;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
      if (v26)
      {
        if (v30)
        {
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v78 = v31;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Using significant region for atHome GeoFence", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
        v32 = objc_alloc(MEMORY[0x24BDBFAF8]);
        -[HMDHomeLocationHandler location](v28, "location");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "coordinate");
        v35 = v34;
        v37 = v36;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "UUIDString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v32, "initWithCenter:radius:identifier:", v39, v35, v37, 100.0);
      }
      else
      {
        if (v30)
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v78 = v45;
          _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@Using circular region for atHome GeoFence", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
        v46 = objc_alloc(MEMORY[0x24BDBFA50]);
        -[HMDHomeLocationHandler location](v28, "location");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "coordinate");
        v48 = v47;
        v50 = v49;
        objc_msgSend(MEMORY[0x24BDD1880], "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "UUIDString");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v46, "initWithCenter:radius:identifier:nearbyAllowed:", v39, 1, v48, v50, 100.0);
      }
      v51 = (void *)v40;
      -[HMDHomeLocationHandler setRegionAtHome:](v28, "setRegionAtHome:", v40);

      -[HMDHomeLocationHandler regionAtHome](v28, "regionAtHome");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setNotifyOnExit:", 1);

      -[HMDHomeLocationHandler regionAtHome](v28, "regionAtHome");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setNotifyOnEntry:", 1);

      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "preferenceForKey:", CFSTR("homeNearbyRegionRadius"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "numberValue");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v56, "doubleValue");
      v58 = v57;

      v59 = objc_alloc(MEMORY[0x24BDBFA50]);
      -[HMDHomeLocationHandler location](v28, "location");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "coordinate");
      v62 = v61;
      v64 = v63;
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "UUIDString");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = (void *)objc_msgSend(v59, "initWithCenter:radius:identifier:nearbyAllowed:", v66, 1, v62, v64, v58);
      -[HMDHomeLocationHandler setRegionNearbyHome:](v28, "setRegionNearbyHome:", v67);

      -[HMDHomeLocationHandler regionNearbyHome](v28, "regionNearbyHome");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "setNotifyOnExit:", 1);

      -[HMDHomeLocationHandler regionNearbyHome](v28, "regionNearbyHome");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setNotifyOnEntry:", 1);

      +[HMDLocation sharedManager](HMDLocation, "sharedManager");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler regionAtHome](v28, "regionAtHome");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v71;
      -[HMDHomeLocationHandler regionNearbyHome](v28, "regionNearbyHome");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v72;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 2);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v18;
      v74[1] = 3221225472;
      v74[2] = __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke_40;
      v74[3] = &unk_24E79BD80;
      v74[4] = v28;
      objc_msgSend(v70, "registerForRegionUpdate:withDelegate:completionHandler:", v73, v28, v74);

    }
  }
  else
  {
    v41 = (void *)MEMORY[0x227676638]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v78 = v44;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Home reference is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
  }

}

- (void)_registerForPrimaryResidentGenerationIDNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomeLocationHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__HMDHomeLocationHandler__registerForPrimaryResidentGenerationIDNotification__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_unregisterForPrimaryResidentGenerationIDNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHomeLocationHandler workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDHomeLocationHandler__unregisterForPrimaryResidentGenerationIDNotification__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)_shouldRegisterForSignificantRegion
{
  return isiOSDevice() || isMac();
}

- (void)_handleLocationAuthorizationChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_numberForKey:", CFSTR("HMDLocationAuthorizationKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMDHomeLocationHandler _handleLocationAuthorization:](self, "_handleLocationAuthorization:", objc_msgSend(v6, "integerValue"));
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@No location authorization", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)_handlePrimaryResidentResidentGenerationIDNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDHomeLocationHandler *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLocationHandler _unregisterForPrimaryResidentGenerationIDNotification](self, "_unregisterForPrimaryResidentGenerationIDNotification");
  -[HMDHomeLocationHandler cachedLocation](self, "cachedLocation");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = -[HMDHomeLocationHandler cachedSource](self, "cachedSource"), v6, v7))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler cachedLocation](v9, "cachedLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HMDHomeLocationSourceToString(-[HMDHomeLocationHandler cachedSource](v9, "cachedSource"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@We are not allowed to run any cloud operation on this device. Asking primary to update the home location: %@ from source: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDHomeLocationHandler cachedLocation](v9, "cachedLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler sendHomeLocationUpdateToResident:source:](v9, "sendHomeLocationUpdateToResident:source:", v14, -[HMDHomeLocationHandler cachedSource](v9, "cachedSource"));

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Not sending home location update as location or source is nil.", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)_handleLocationAuthorization:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  HMDHomeLocationHandler *v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[HMDHomeLocationHandler locationAuthorization](self, "locationAuthorization") != a3)
  {
    v5 = -[HMDHomeLocationHandler setLocationAuthorization:](self, "setLocationAuthorization:", a3);
    if (a3 == 1)
    {
      -[HMDHomeLocationHandler _registerForRegionUpdate](self, "_registerForRegionUpdate");
      +[HMDLocation sharedManager](HMDLocation, "sharedManager");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "startExtractingSingleLocationForDelegate:", self);

    }
    else if (a3 == 2)
    {
      v6 = (void *)MEMORY[0x227676638](v5);
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v12 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Received a call back that the location is not allowed for homed", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
    }
  }
}

- (void)_handleRetrieveLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(v4, "isAuthorizedForLocationAccess") & 1) != 0)
  {
    objc_msgSend(v4, "proxyConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationAuthorization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mark");

    LODWORD(v7) = isInternalBuild();
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if ((_DWORD)v7)
    {
      if (v11)
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler location](v9, "location");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler home](v9, "home");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v25 = v12;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v14;
        v15 = "%{public}@Sending location %@ for home %@";
LABEL_10:
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, v15, buf, 0x20u);

      }
    }
    else if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler location](v9, "location");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler home](v9, "home");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v25 = v12;
      v26 = 2117;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v15 = "%{public}@Sending location %{sensitive}@ for home %@";
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v8);
    -[HMDHomeLocationHandler location](v9, "location", CFSTR("kHomeLocationKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithPayload:", v21);

    goto LABEL_12;
  }
  v16 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Client does not have authorization to location", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  objc_msgSend(v4, "respondWithPayload:", 0);
LABEL_12:

}

- (void)updateHomeLocation
{
  void *v3;
  int v4;
  void *v5;
  HMDHomeLocationHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (-[HMDHomeLocationHandler locationAuthorization](self, "locationAuthorization") == 1)
  {
    -[HMDHomeLocationHandler home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isAdminUser");

    if (v4)
    {
      v5 = (void *)MEMORY[0x227676638]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Extracting home location", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
      +[HMDLocation sharedManager](HMDLocation, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startExtractingSingleLocationForDelegate:", v6);

    }
  }
}

- (void)accessoryReachabilityChanged:(int)a3 previousReachableAccessoriesCount:(int)a4 reachableAppleMediaAccessoriesCount:(int)a5 previousReachableAppleMediaAccessoriesCount:(int)a6
{
  HMDHomeLocationHandler *v10;
  void *v11;
  _BOOL4 v13;
  int v14;
  _BOOL4 v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v10 = self;
  v24 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a5 > 0 && a6 == 0;
  v14 = a6 + a4;
  if ((a6 + a4 < 0) ^ __OFADD__(a6, a4) | (a6 + a4 == 0))
    v15 = 0;
  else
    v15 = a5 + a3 < 1;
  if (a5 + a3 >= 1 && v14 <= 0)
  {
    -[HMDHomeLocationHandler location](v10, "location");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16 || (v17 = (void *)v16, v18 = objc_msgSend(v11, "hasAnyResident"), v17, (v18 & 1) == 0))
    {
LABEL_18:
      -[HMDHomeLocationHandler accessoriesBecomeReachable](v10, "accessoriesBecomeReachable");
      goto LABEL_19;
    }
  }
  if (v13)
  {
    v19 = (void *)MEMORY[0x227676638]();
    v10 = v10;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@The first media accessory becomes reachable, evaluating to extract location", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v19);
    goto LABEL_18;
  }
  if (v15)
    -[HMDHomeLocationHandler accessoriesBecomeUnreachable](v10, "accessoriesBecomeUnreachable");
LABEL_19:

}

- (void)updateHomeLocationForPairing
{
  BOOL v3;
  void *v4;
  HMDHomeLocationHandler *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = -[HMDHomeLocationHandler _canExtractLocation](self, "_canExtractLocation");
  v4 = (void *)MEMORY[0x227676638]();
  v5 = self;
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Using Single Core Routine API to update home location for pairing.", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    -[HMDHomeLocationHandler setPairingHomeLocationOverride:](v5, "setPairingHomeLocationOverride:", 1);
    -[HMDHomeLocationHandler updateHomeLocationFromCoreRoutine](v5, "updateHomeLocationFromCoreRoutine");
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Cannot extract location", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
}

- (void)matterAccessoryBecameReachable
{
  void *v3;
  HMDHomeLocationHandler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeLocationHandler *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[HMDHomeLocationHandler _hasReachableAccessoriesExcludingMatter](self, "_hasReachableAccessoriesExcludingMatter"))
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Already have reachable accessories, not extracting location.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  else if (-[HMDHomeLocationHandler _shouldUpdateHomeLocation](self, "_shouldUpdateHomeLocation"))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating home location for Matter reachability.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDHomeLocationHandler updateHomeLocationFromSingleOrCoreRoutine](v8, "updateHomeLocationFromSingleOrCoreRoutine");
  }
}

- (void)accessoriesBecomeReachable
{
  void *v3;
  HMDHomeLocationHandler *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHomeLocationHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeLocationHandler *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@The first accessory becomes reachable, evaluating to extract location.", (uint8_t *)&v18, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHomeLocationHandler setFirstAccessoryReachable:](v4, "setFirstAccessoryReachable:", 1);
  if (-[HMDHomeLocationHandler _hasReachableAccessoriesExcludingMatter](v4, "_hasReachableAccessoriesExcludingMatter"))
  {
    if (-[HMDHomeLocationHandler _shouldUpdateHomeLocation](v4, "_shouldUpdateHomeLocation"))
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = v4;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler home](v8, "home");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543618;
        v19 = v10;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Accessories are reachable, extracting location for home %@", (uint8_t *)&v18, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      +[HMDRegionStateCorrectnessLogEvent updateWithFirstAccessory:nearbyHome:](HMDRegionStateCorrectnessLogEvent, "updateWithFirstAccessory:nearbyHome:", -[HMDHomeLocationHandler regionStateAtHome](v8, "regionStateAtHome"), -[HMDHomeLocationHandler regionStateNearbyHome](v8, "regionStateNearbyHome"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler logEventSubmitter](v8, "logEventSubmitter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "submitLogEvent:", v12);

      -[HMDHomeLocationHandler updateHomeLocationFromSingleOrCoreRoutine](v8, "updateHomeLocationFromSingleOrCoreRoutine");
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v4;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@No reachable accessories, not extracting location.", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
  }
}

- (void)accessoriesBecomeUnreachable
{
  void *v3;
  HMDHomeLocationHandler *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@The last accessory becomes unreachable, trying to stop extracting location.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHomeLocationHandler setFirstAccessoryReachable:](v4, "setFirstAccessoryReachable:", 0);
}

- (BOOL)_hasReachableAccessoriesExcludingMatter
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  NSObject *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v8 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v9 = (HMDHomeLocationHandler *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v9->super.super, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      objc_autoreleasePoolPop(v8);
      v7 = 0;
      goto LABEL_10;
    }
    HMFGetLogIdentifier();
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v10;
    _os_log_impl(&dword_2218F0000, &v9->super.super, OS_LOG_TYPE_ERROR, "%{public}@No home reference?", (uint8_t *)&v13, 0xCu);
LABEL_8:

    goto LABEL_9;
  }
  v5 = objc_msgSend(v3, "reachableAccessoriesCountExcludingMatter");
  v6 = objc_msgSend(v4, "reachableAppleMediaAccessoriesCount");
  if ((v6 + v5 < 0) ^ __OFADD__(v6, v5) | (v6 + v5 == 0))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Home %@ does not have any reachable accessories, no need to extract location", (uint8_t *)&v13, 0x16u);

    }
    goto LABEL_8;
  }
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)_canExtractLocation
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  HMDHomeLocationHandler *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v7 = (HMDHomeLocationHandler *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      objc_autoreleasePoolPop(v6);
      v5 = 0;
      goto LABEL_14;
    }
    HMFGetLogIdentifier();
    v8 = objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v8;
    _os_log_impl(&dword_2218F0000, &v7->super.super, OS_LOG_TYPE_ERROR, "%{public}@No home reference?", (uint8_t *)&v14, 0xCu);
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "isAdminUser") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      v10 = "%{public}@Not evaluating home location as user is not Admin.";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
LABEL_11:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v14, 0xCu);

    }
LABEL_12:

    goto LABEL_13;
  }
  if (-[HMDHomeLocationHandler locationAuthorization](self, "locationAuthorization") != 1)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v9;
      v10 = "%{public}@homed is not authorized for location services";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v5 = 1;
LABEL_14:

  return v5;
}

- (BOOL)_needToExtractLocations
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  HMDHomeLocationHandler *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double LocationUpdateTimeInterval;
  void *v22;
  HMDHomeLocationHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v38;
  HMDHomeLocationHandler *v39;
  NSObject *v40;
  void *v41;
  int v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v34 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543362;
      v43 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Location is not known, need to extract location", (uint8_t *)&v42, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
    return 1;
  }
  -[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_9;
  -[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceNow");
  v7 = fabs(v6);

  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler home](v9, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HMFTimeIntervalDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    getLocationUpdateTimeInterval();
    HMFTimeIntervalDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138544130;
    v43 = v11;
    v44 = 2112;
    v45 = v12;
    v46 = 2112;
    v47 = v13;
    v48 = 2112;
    v49 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Time since last location update for home %@ is %@. Update interval is %@", (uint8_t *)&v42, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  if (v7 >= getLocationUpdateTimeInterval())
  {
LABEL_9:
    -[HMDHomeLocationHandler lastAttemptedLocationUpdate](self, "lastAttemptedLocationUpdate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      LocationUpdateTimeInterval = getLocationUpdateTimeInterval();
      v22 = (void *)MEMORY[0x227676638]();
      v23 = self;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler home](v23, "home");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler lastAttemptedLocationUpdate](v23, "lastAttemptedLocationUpdate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        HMFTimeIntervalDescription();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 138544130;
        v43 = v25;
        v44 = 2112;
        v45 = v26;
        v46 = 2112;
        v47 = v27;
        v48 = 2112;
        v49 = v28;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Last location attempt for home %@ is %@. Update interval is %@", (uint8_t *)&v42, 0x2Au);

      }
      objc_autoreleasePoolPop(v22);
      -[HMDHomeLocationHandler lastAttemptedLocationUpdate](v23, "lastAttemptedLocationUpdate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v30);
      v32 = fabs(v31);

      if (v32 < LocationUpdateTimeInterval || vabdd_f64(v32, LocationUpdateTimeInterval) < 2.22044605e-16)
      {
        v38 = MEMORY[0x227676638]();
        v39 = v23;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = 138543362;
          v43 = v41;
          _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Not evalutating home location as last attempted time is below threshold.", (uint8_t *)&v42, 0xCu);

        }
        v19 = (void *)v38;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler setLastAttemptedLocationUpdate:](v23, "setLastAttemptedLocationUpdate:", v33);

    }
    return 1;
  }
  v15 = MEMORY[0x227676638]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 138543362;
    v43 = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Not extracting location as not enough time has passed.", (uint8_t *)&v42, 0xCu);

  }
  v19 = (void *)v15;
LABEL_22:
  objc_autoreleasePoolPop(v19);
  return 0;
}

- (BOOL)_shouldUpdateHomeLocation
{
  _BOOL4 v3;

  v3 = -[HMDHomeLocationHandler _canExtractLocation](self, "_canExtractLocation");
  if (v3)
    LOBYTE(v3) = -[HMDHomeLocationHandler _needToExtractLocations](self, "_needToExtractLocations");
  return v3;
}

- (void)_evaluateHomeRegionStateForCurrentDeviceLocation:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLocationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHomeLocationHandler home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = isInternalBuild();
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v11)
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "UUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler location](v9, "location");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v12;
      v26 = 2112;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating current device region state for home %@ using home location %@ and device location %@", buf, 0x2Au);

    }
  }
  else if (v11)
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler location](v9, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544131;
    v25 = v16;
    v26 = 2112;
    v27 = v18;
    v28 = 2117;
    v29 = v19;
    v30 = 2117;
    v31 = v4;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Evaluating current device region state for home %@ using home location %{sensitive}@ and device location %{sensitive}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeLocationHandler location](v9, "location");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v4 != 0 && v21)
  {
    objc_initWeak((id *)buf, v9);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __75__HMDHomeLocationHandler__evaluateHomeRegionStateForCurrentDeviceLocation___block_invoke;
    v22[3] = &unk_24E795990;
    objc_copyWeak(&v23, (id *)buf);
    +[HMDLocation timeZoneISOCountryCodeForCLLocationAsync:withCompletion:](HMDLocation, "timeZoneISOCountryCodeForCLLocationAsync:withCompletion:", v4, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_updateTimeZone:(id)a3
{
  id v4;
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3042000000;
  v6[3] = __Block_byref_object_copy__224954;
  v6[4] = __Block_byref_object_dispose__224955;
  objc_initWeak(&v7, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__HMDHomeLocationHandler__updateTimeZone___block_invoke;
  v5[3] = &unk_24E7959B8;
  v5[4] = self;
  v5[5] = v6;
  +[HMDLocation timeZoneISOCountryCodeForCLLocationAsync:withCompletion:](HMDLocation, "timeZoneISOCountryCodeForCLLocationAsync:withCompletion:", v4, v5);
  _Block_object_dispose(v6, 8);
  objc_destroyWeak(&v7);

}

- (id)_handleHomeLocationData:(id)a3 message:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (objc_class *)MEMORY[0x24BDD1620];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "homeLocationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v9, "initForReadingFromData:error:", v10, 0);
  objc_msgSend(v11, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationHandler _handleHomeLocationDataForHH2:fromMessage:](self, "_handleHomeLocationDataForHH2:fromMessage:", v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_handleHomeLocationDataForHH2:(id)a3 fromMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int64_t v18;
  void *v19;
  HMDHomeLocationHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  HMDHomeLocationHandler *v24;
  NSObject *v25;
  void *v26;
  int v27;
  void *v28;
  HMDHomeLocationHandler *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  void *v50;
  HMDHomeLocationHandler *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeLocationHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDHomeLocationHandler location](self, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)(int)objc_msgSend(v11, "intValue");

    if (v10)
    {
      v13 = v7;
      objc_msgSend(v6, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMDHomeLocationHandler isNewHomeLocationTooCloseToPreviousLocation:newLocation:](self, "isNewHomeLocationTooCloseToPreviousLocation:newLocation:", v10, v14)&& (-[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp"), v15 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v6, "locationUpdateTimestamp"), v16 = (void *)objc_claimAutoreleasedReturnValue(), v17 = HMFEqualObjects(), v16, v15, (v17 & 1) != 0))
      {
        v18 = -[HMDHomeLocationHandler locationSource](self, "locationSource");

        v7 = v13;
        if ((void *)v18 == v12)
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v62 = v22;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Not updating the home location as current location is too close to previous one", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v19);
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {

        v7 = v13;
      }
    }
    v27 = isInternalBuild();
    v28 = (void *)MEMORY[0x227676638]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    v60 = v8;
    if (v27)
    {
      if (!v31)
        goto LABEL_19;
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler location](v29, "location");
      v59 = v12;
      v33 = v7;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v62 = v32;
      v63 = 2112;
      v64 = v60;
      v65 = 2112;
      v66 = v34;
      v67 = 2112;
      v68 = v35;
      v69 = 2112;
      v70 = v36;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating location for home %@ from: %@ to %@, message: %@", buf, 0x34u);

      v7 = v33;
      v12 = v59;
    }
    else
    {
      if (!v31)
        goto LABEL_19;
      HMFGetLogIdentifier();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler location](v29, "location");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "location");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v59 = v10;
      v39 = v12;
      v40 = v7;
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544387;
      v62 = v32;
      v63 = 2112;
      v64 = v60;
      v65 = 2117;
      v66 = v37;
      v67 = 2117;
      v68 = v38;
      v69 = 2112;
      v70 = v41;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Updating location for home %@ from: %{sensitive}@ to %{sensitive}@, message: %@", buf, 0x34u);

      v7 = v40;
      v12 = v39;
      v10 = v59;

    }
LABEL_19:

    objc_autoreleasePoolPop(v28);
    objc_msgSend(v6, "location");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler setLocation:](v29, "setLocation:", v42);

    objc_msgSend(v6, "locationUpdateTimestamp");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler setLocationUpdateTimestamp:](v29, "setLocationUpdateTimestamp:", v43);

    -[HMDHomeLocationHandler setLocationSource:](v29, "setLocationSource:", v12);
    -[HMDHomeLocationHandler location](v29, "location");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler _updateTimeZone:](v29, "_updateTimeZone:", v44);

    -[HMDHomeLocationHandler regionAtHome](v29, "regionAtHome");
    v45 = objc_claimAutoreleasedReturnValue();
    if (!v45)
      goto LABEL_23;
    v46 = (void *)v45;
    -[HMDHomeLocationHandler regionNearbyHome](v29, "regionNearbyHome");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v47
      || v10
      && (objc_msgSend(v6, "location"),
          v48 = (void *)objc_claimAutoreleasedReturnValue(),
          v49 = -[HMDHomeLocationHandler isNewHomeLocationTooCloseToPreviousLocation:newLocation:](v29, "isNewHomeLocationTooCloseToPreviousLocation:newLocation:", v10, v48), v48, !v49))
    {
LABEL_23:
      -[HMDHomeLocationHandler _registerForRegionUpdate](v29, "_registerForRegionUpdate", v59);
    }
    v50 = (void *)MEMORY[0x227676638](-[HMDHomeLocationHandler _sendLocationUpdateToClients](v29, "_sendLocationUpdateToClients", v59));
    v51 = v29;
    HMFGetOSLogHandle();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler locationUpdateTimestamp](v51, "locationUpdateTimestamp");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationUpdateTimestamp");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      HMDHomeLocationSourceToString(-[HMDHomeLocationHandler locationSource](v51, "locationSource"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v62 = v53;
      v63 = 2112;
      v64 = v60;
      v65 = 2112;
      v66 = v54;
      v67 = 2112;
      v68 = v55;
      v69 = 2112;
      v70 = v56;
      _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Updating last home location update for home %@ from: %@ to %@ with source %@", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v50);
    objc_msgSend(v7, "transactionResult");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "markChanged");

    v8 = v60;
    goto LABEL_27;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = self;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v62 = v26;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@New location is nil. Will not register for region updates.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v23);
LABEL_28:

  return 0;
}

- (BOOL)shouldUpdateLocationFromLocationData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  HMDHomeLocationHandler *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[HMDLocation isAccurateLocation:](HMDLocation, "isAccurateLocation:", v6))
    {
      objc_msgSend(v4, "locationUpdateTimestamp");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HMDHomeLocationHandler isDate:laterThanDate:](self, "isDate:laterThanDate:", v7, v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Location data has nil location. Will not update location from location data", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return v9;
}

- (void)runTransactionWithLocation:(id)a3 updatedTime:(id)a4 source:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  HMDHomeLocationHandler *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMDHomeLocationSourceToString(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v13;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Determined Location: %@, Source : %@", (uint8_t *)&v15, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDHomeLocationHandler handleHomeLocationForHH2:updatedTime:source:](v11, "handleHomeLocationForHH2:updatedTime:source:", v8, v9, a5);

}

- (void)handleHomeLocationForHH2:(id)a3 updatedTime:(id)a4 source:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  HMDHomeLocationHandler *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  uint64_t v22;
  HMDHomeLocationHandler *v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDHomeLocationHandler *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  HMDHomeLocationHandler *v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDHomeLocationHandler home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isAdminUser") & 1) == 0)
  {
    v21 = isInternalBuild();
    v22 = MEMORY[0x227676638]();
    v23 = self;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v25)
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v26;
        v44 = 2112;
        v45 = v8;
        v27 = "%{public}@Not going to save the home location as this is not an admin user : %@";
LABEL_13:
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, v27, buf, 0x16u);

      }
    }
    else if (v25)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543619;
      v43 = v26;
      v44 = 2117;
      v45 = v8;
      v27 = "%{public}@Not going to save the home location as this is not an admin user : %{sensitive}@";
      goto LABEL_13;
    }

    v28 = (void *)v22;
    goto LABEL_18;
  }
  if (!objc_msgSend(v10, "hasAnyResident")
    || (objc_msgSend(v10, "isCurrentDeviceConfirmedPrimaryResident") & 1) != 0)
  {
    v11 = -[HMDHomeLocationHandler shouldAllowHomeLocationUpdateWithSource:newLocation:](self, "shouldAllowHomeLocationUpdateWithSource:newLocation:", a5, v8);
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v43 = v16;
        v44 = 2112;
        v45 = v10;
        v46 = 2112;
        v47 = v8;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@We are allowed to run the cloud operation : %@. Updating home location: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      -[HMDHomeLocationHandler logHomeLocationEventWithLocation:](v13, "logHomeLocationEventWithLocation:", v8);
      +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contextWithHomeUUID:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __70__HMDHomeLocationHandler_handleHomeLocationForHH2_updatedTime_source___block_invoke;
      v35[3] = &unk_24E7959E0;
      v36 = v10;
      v37 = v13;
      v38 = v8;
      v40 = v19;
      v41 = a5;
      v39 = v9;
      v20 = v19;
      objc_msgSend(v20, "performBlock:", v35);

      goto LABEL_19;
    }
    if (v15)
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v29;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not saving non-LOI home location.", buf, 0xCu);

    }
    v28 = v12;
LABEL_18:
    objc_autoreleasePoolPop(v28);
    goto LABEL_19;
  }
  v30 = (void *)MEMORY[0x227676638]();
  v31 = self;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    HMDHomeLocationSourceToString(a5);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v43 = v33;
    v44 = 2112;
    v45 = v8;
    v46 = 2112;
    v47 = v34;
    _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@We are not allowed to run any cloud operation on this device. Asking primary to update the home location: %@ from source: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v30);
  -[HMDHomeLocationHandler sendHomeLocationUpdateToResident:source:](v31, "sendHomeLocationUpdateToResident:source:", v8, a5);
LABEL_19:

}

- (void)sendHomeLocationUpdateToResident:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  HMDHomeLocationHandler *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  const char *v15;
  HMDRemoteHomeMessageDestination *v16;
  void *v17;
  void *v18;
  HMDRemoteHomeMessageDestination *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDHomeLocationHandler *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  int64_t v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeLocationHandler home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isAdminUser") & 1) == 0)
    _HMFPreconditionFailure();
  v8 = isInternalBuild();
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (!v12)
      goto LABEL_8;
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMDHomeLocationSourceToString(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v37 = v13;
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v14;
    v15 = "%{public}@Sending home location updated message to the primary resident: %@, source: %@";
  }
  else
  {
    if (!v12)
      goto LABEL_8;
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HMDHomeLocationSourceToString(a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v37 = v13;
    v38 = 2117;
    v39 = v6;
    v40 = 2112;
    v41 = v14;
    v15 = "%{public}@Sending home location updated message to the primary resident: %{sensitive}@, source: %@";
  }
  _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, v15, buf, 0x20u);

LABEL_8:
  objc_autoreleasePoolPop(v9);
  v16 = [HMDRemoteHomeMessageDestination alloc];
  -[HMDHomeLocationHandler messageTargetUUID](v10, "messageTargetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:](v16, "initWithTarget:homeUUID:", v17, v18);

  v20 = (void *)MEMORY[0x24BE3F1D0];
  v34[0] = CFSTR("kHomeLocationDataKey");
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = CFSTR("HMD.LOC.SRC");
  v35[0] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v22;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "messageWithName:destination:payload:", CFSTR("kHomeLocationUpdatedNotificationKey"), v19, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (_os_feature_enabled_impl())
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = v10;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v37 = v28;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEBUG, "%{public}@Restricting to local transport to update home location to ensure we are on the same network.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(v24, "setRemoteRestriction:", 14);
  }
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __66__HMDHomeLocationHandler_sendHomeLocationUpdateToResident_source___block_invoke;
  v31[3] = &unk_24E795A08;
  v31[4] = v10;
  v32 = v6;
  v33 = a4;
  v29 = v6;
  objc_msgSend(v24, "setResponseHandler:", v31);
  objc_msgSend(v7, "msgDispatcher");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sendMessage:completionHandler:", v24, 0);

}

- (void)_resendHomeLocationOnce:(id)a3 newSource:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[HMDHomeLocationHandler resendOnce](self, "resendOnce"))
  {
    -[HMDHomeLocationHandler location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[HMDHomeLocationHandler setResendOnce:](self, "setResendOnce:", 1);
      -[HMDHomeLocationHandler setCachedLocation:](self, "setCachedLocation:", v6);
      v8 = (void *)MEMORY[0x227676638](-[HMDHomeLocationHandler setCachedSource:](self, "setCachedSource:", a4));
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Registering for Primary Resident Generation ID notification to resend home location.", (uint8_t *)&v12, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      -[HMDHomeLocationHandler _registerForPrimaryResidentGenerationIDNotification](v9, "_registerForPrimaryResidentGenerationIDNotification");
    }
  }

}

- (BOOL)shouldAllowHomeLocationUpdateWithSource:(int64_t)a3 newLocation:(id)a4
{
  id v6;
  int64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  void *v12;
  HMDHomeLocationHandler *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  const char *v18;
  HMDHomeLocationHandler *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  BOOL v24;
  HMDHomeLocationHandler *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543362;
      v28 = v20;
      v21 = "%{public}@New location is nil, rejecting home location update.";
      v22 = v14;
      v23 = OS_LOG_TYPE_DEBUG;
LABEL_17:
      _os_log_impl(&dword_2218F0000, v22, v23, v21, (uint8_t *)&v27, 0xCu);

    }
LABEL_18:
    v24 = 0;
    goto LABEL_19;
  }
  v7 = -[HMDHomeLocationHandler locationSource](self, "locationSource");
  if (a3 != 2 && v7 == 2)
  {
    -[HMDHomeLocationHandler location](self, "location");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = -[HMDHomeLocationHandler pairingHomeLocationOverride](self, "pairingHomeLocationOverride");

      if (!v10)
      {
        v12 = (void *)MEMORY[0x227676638]();
        v25 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138543362;
          v28 = v20;
          v21 = "%{public}@Home location update is not LOI.";
          v22 = v14;
          v23 = OS_LOG_TYPE_INFO;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
  }
  -[HMDHomeLocationHandler setPairingHomeLocationOverride:](self, "setPairingHomeLocationOverride:", 0);
  v11 = isInternalBuild();
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v15)
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HMDHomeLocationSourceToString(a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v16;
      v29 = 2112;
      v30 = v6;
      v31 = 2112;
      v32 = v17;
      v18 = "%{public}@Updating home location to %@ and source %@";
LABEL_13:
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v27, 0x20u);

    }
  }
  else if (v15)
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMDHomeLocationSourceToString(a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543875;
    v28 = v16;
    v29 = 2117;
    v30 = v6;
    v31 = 2112;
    v32 = v17;
    v18 = "%{public}@Updating home location to %{sensitive}@ and source %@";
    goto LABEL_13;
  }
  v24 = 1;
LABEL_19:

  objc_autoreleasePoolPop(v12);
  return v24;
}

- (BOOL)isNewHomeLocationTooCloseToPreviousLocation:(id)a3 newLocation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  HMDHomeLocationHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "distanceFromLocation:", v7);
  v10 = v9;
  v11 = (void *)MEMORY[0x227676638](v8);
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v14;
    v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@The distance between new & previous location is : %@", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v16 = fabs(v10 + -10.0) < 2.22044605e-16 || v10 < 10.0;

  return v16;
}

- (void)_sendLocationUpdateToClients
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[HMDHomeLocationHandler location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v12 = CFSTR("kHomeLocationKey");
    v4 = (void *)MEMORY[0x24BDD1618];
    -[HMDHomeLocationHandler location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE3F1B0], "locationAuthorizedMessageWithName:messagePayload:", CFSTR("kHomeLocationUpdatedNotificationKey"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F1B0], "messageWithName:messagePayload:", CFSTR("kHomeLocationUpdatedNotificationKey"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  logAndPostNotification(CFSTR("HMDLocationForHomeChanged"), self, 0);
  -[HMDHomeLocationHandler home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDHomeLocationHandler msgDispatcher](self, "msgDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendMessage:target:", v8, v11);

  }
}

- (HMDHomeLocationData)locationData
{
  HMDHomeLocationData *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDHomeLocationData *v7;

  v3 = [HMDHomeLocationData alloc];
  -[HMDHomeLocationHandler location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomeLocationHandler locationSource](self, "locationSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDHomeLocationData initWithLocation:locationUpdateTimestamp:locationSource:](v3, "initWithLocation:locationUpdateTimestamp:locationSource:", v4, v5, v6);

  return v7;
}

- (BOOL)isLocation:(id)a3 closeToLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  int v15;
  void *v16;
  HMDHomeLocationHandler *v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  const char *v21;
  void *v22;
  HMDHomeLocationHandler *v23;
  NSObject *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to check if location1 %@ is close to location2 %@", (uint8_t *)&v27, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = 1;
  if (v6 && v7)
  {
    objc_msgSend(v6, "distanceFromLocation:", v7);
    v14 = v13;
    v15 = isInternalBuild();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v15)
    {
      if (v19)
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138544130;
        v28 = v20;
        v29 = 2112;
        v30 = v6;
        v31 = 2112;
        v32 = v7;
        v33 = 2048;
        v34 = v14;
        v21 = "%{public}@Distance between location1 %@ and location2 %@: %lf";
LABEL_10:
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v27, 0x2Au);

      }
    }
    else if (v19)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138544131;
      v28 = v20;
      v29 = 2117;
      v30 = v6;
      v31 = 2117;
      v32 = v7;
      v33 = 2048;
      v34 = v14;
      v21 = "%{public}@Distance between location1 %{sensitive}@ and location2 %{sensitive}@: %lf";
      goto LABEL_10;
    }

    objc_autoreleasePoolPop(v16);
    v12 = 0;
    if (v14 > 0.0 && v14 <= 30.0)
    {
      v22 = (void *)MEMORY[0x227676638]();
      v23 = v17;
      HMFGetOSLogHandle();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138543618;
        v28 = v25;
        v29 = 2112;
        v30 = &unk_24E9714F8;
        _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@The two locations are within %@ meter range.", (uint8_t *)&v27, 0x16u);

      }
      objc_autoreleasePoolPop(v22);
      v12 = 1;
    }
  }

  return v12;
}

- (BOOL)isDate:(id)a3 laterThanDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeLocationHandler *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v13 = v12;
    objc_msgSend(v7, "timeIntervalSince1970");
    v17 = 138544386;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    v21 = 2048;
    v22 = v13;
    v23 = 2112;
    v24 = v7;
    v25 = 2048;
    v26 = v14;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to check if date1 %@ (%lf) is later than date2 %@ (%lf)", (uint8_t *)&v17, 0x34u);

  }
  objc_autoreleasePoolPop(v8);
  if (v6)
  {
    if (v7)
      v15 = objc_msgSend(v6, "compare:", v7) == 1;
    else
      v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)updateHomeLocationFromCoreRoutine
{
  void *v3;
  _QWORD v4[5];

  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__HMDHomeLocationHandler_updateHomeLocationFromCoreRoutine__block_invoke;
  v4[3] = &unk_24E795A30;
  v4[4] = self;
  objc_msgSend(v3, "getCoreRoutineLOIForCurrentLocationWithCompletionHandler:", v4);

}

- (void)updateHomeLocationFromSingleOrCoreRoutine
{
  void *v3;
  HMDHomeLocationHandler *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Using Single Core Routine API for HomeKit Home location", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHomeLocationHandler updateHomeLocationFromCoreRoutine](v4, "updateHomeLocationFromCoreRoutine");
}

- (void)didDetermineLocation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHomeLocationHandler workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDHomeLocationHandler_didDetermineLocation___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didDetermineState:(int64_t)a3 forRegion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HMDHomeLocationHandler workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDHomeLocationHandler_didDetermineState_forRegion___block_invoke;
  block[3] = &unk_24E796490;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)getReachableIPAccessory:(unint64_t *)a3 btleAccessory:(unint64_t *)a4 mediaAccessory:(unint64_t *)a5
{
  id v8;

  -[HMDHomeLocationHandler home](self, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getReachableIPAccessories:btleAccessories:mediaAccessories:", a3, a4, a5);

}

- (void)coalesceRegionUpdateState:(int64_t)a3 forRegion:(id)a4
{
  id v6;
  _HMDPendingRegionUpdate *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMDHomeLocationHandler *v12;
  NSObject *v13;
  id v14;
  void *v15;
  int *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  HMDHomeLocationHandler *v21;
  NSObject *v22;
  id v23;
  void *v24;
  HMFTimer *homeRegionUpdateTimer;
  id v26;
  HMFTimer *v27;
  HMFTimer *v28;
  NSObject *v29;
  id v30;
  void *v31;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  os_unfair_recursive_lock_lock_with_options();
  v7 = objc_alloc_init(_HMDPendingRegionUpdate);
  -[_HMDPendingRegionUpdate setState:](v7, "setState:", a3);
  -[CLRegion identifier](self->_regionAtHome, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      HMDRegionStateString();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v14;
      v34 = 2112;
      v35 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@atHome region updated (100m) : %@", (uint8_t *)&v32, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v16 = &OBJC_IVAR___HMDHomeLocationHandler__pendingAtHomeRegionUpdate;
LABEL_9:
    objc_storeStrong((id *)((char *)&self->super.super.isa + *v16), v7);
    homeRegionUpdateTimer = self->_homeRegionUpdateTimer;
    if (homeRegionUpdateTimer)
    {
      -[HMFTimer kick](homeRegionUpdateTimer, "kick");
    }
    else
    {
      v26 = objc_alloc(MEMORY[0x24BE3F298]);
      -[HMDHomeLocationHandler coalesceRegionUpdateIntervalInSeconds](self, "coalesceRegionUpdateIntervalInSeconds");
      v27 = (HMFTimer *)objc_msgSend(v26, "initWithTimeInterval:options:", 8);
      v28 = self->_homeRegionUpdateTimer;
      self->_homeRegionUpdateTimer = v27;

      -[HMFTimer setDelegateQueue:](self->_homeRegionUpdateTimer, "setDelegateQueue:", self->_workQueue);
      -[HMFTimer setDelegate:](self->_homeRegionUpdateTimer, "setDelegate:", self);
      -[HMFTimer resume](self->_homeRegionUpdateTimer, "resume");
    }
    goto LABEL_15;
  }
  -[CLRegion identifier](self->_regionNearbyHome, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  v20 = (void *)MEMORY[0x227676638]();
  v21 = self;
  if (v19)
  {
    HMFGetOSLogHandle();
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (id)objc_claimAutoreleasedReturnValue();
      HMDRegionStateString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v23;
      v34 = 2112;
      v35 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@nearByHome region updated (500m) : %@", (uint8_t *)&v32, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    v16 = &OBJC_IVAR___HMDHomeLocationHandler__pendingNearbyHomeRegionUpdate;
    goto LABEL_9;
  }
  HMFGetOSLogHandle();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    HMDRegionStateString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543874;
    v33 = v30;
    v34 = 2112;
    v35 = v6;
    v36 = 2112;
    v37 = v31;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unknown region update found for region : %@ [new state: %@]", (uint8_t *)&v32, 0x20u);

  }
  objc_autoreleasePoolPop(v20);
LABEL_15:

  os_unfair_recursive_lock_unlock();
}

- (void)timerDidFire:(id)a3
{
  HMFTimer *v4;
  void *v5;
  HMDHomeLocationHandler *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (HMFTimer *)a3;
  if (self->_homeRegionUpdateTimer == v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Region update timer fired : Processing pending region state updates", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDHomeLocationHandler _processPendingRegionStateUpdates](v6, "_processPendingRegionStateUpdates");
  }

}

- (void)_processPendingRegionStateUpdates
{
  uint64_t v3;
  _HMDPendingRegionUpdate *pendingAtHomeRegionUpdate;
  _HMDPendingRegionUpdate *pendingNearbyHomeRegionUpdate;
  void *v6;
  HMDHomeLocationHandler *v7;
  NSObject *v8;
  void *v9;
  _HMDPendingRegionUpdate *v10;
  _HMDPendingRegionUpdate *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _HMDPendingRegionUpdate *v15;
  HMDHomeLocationHandler *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _HMDPendingRegionUpdate *v21;
  uint64_t v22;
  void *v23;
  int v24;
  HMDHomeLocationHandler *v25;
  void *v26;
  _HMDPendingRegionUpdate *v27;
  _HMDPendingRegionUpdate *v28;
  HMDHomeLocationHandler *v29;
  void *v30;
  _HMDPendingRegionUpdate *v31;
  HMDHomeLocationHandler *v32;
  void *v33;
  _HMDPendingRegionUpdate *v34;
  _BOOL4 v35;
  HMDHomeLocationHandler *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  _HMDPendingRegionUpdate *v40;
  _HMDPendingRegionUpdate *v41;
  HMFTimer *homeRegionUpdateTimer;
  void *v43;
  char v44;
  void *v45;
  HMDHomeLocationHandler *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  HMDHomeLocationHandler *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  _HMDPendingRegionUpdate *v57;
  _HMDPendingRegionUpdate *v58;
  void *v59;
  int v60;
  void *v61;
  __int16 v62;
  _HMDPendingRegionUpdate *v63;
  __int16 v64;
  _HMDPendingRegionUpdate *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v3 = os_unfair_recursive_lock_lock_with_options();
  pendingAtHomeRegionUpdate = self->_pendingAtHomeRegionUpdate;
  pendingNearbyHomeRegionUpdate = self->_pendingNearbyHomeRegionUpdate;
  v6 = (void *)MEMORY[0x227676638](v3);
  v7 = self;
  if (!pendingAtHomeRegionUpdate)
  {
    if (!pendingNearbyHomeRegionUpdate)
    {
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 138543362;
        v61 = v23;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Dropping region state update. How are we even here?", (uint8_t *)&v60, 0xCu);

      }
      goto LABEL_42;
    }
    HMFGetOSLogHandle();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_pendingNearbyHomeRegionUpdate;
      v60 = 138543618;
      v61 = v14;
      v62 = 2112;
      v63 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@processing pending nearByHome region update : %@", (uint8_t *)&v60, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if (-[_HMDPendingRegionUpdate state](self->_pendingNearbyHomeRegionUpdate, "state") == 1)
    {
      -[HMDHomeLocationHandler setRegionStateNearbyHome:](v7, "setRegionStateNearbyHome:", 1);
      if (-[HMDHomeLocationHandler regionStateAtHome](v7, "regionStateAtHome") == 1)
      {
        v6 = (void *)MEMORY[0x227676638]();
        v16 = v7;
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 138543362;
          v61 = v18;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@atHome region is inside, not notifying.", (uint8_t *)&v60, 0xCu);

        }
      }
      else
      {
        v35 = -[HMDHomeLocationHandler regionStateAtHome](v7, "regionStateAtHome") == 0;
        v6 = (void *)MEMORY[0x227676638]();
        v36 = v7;
        if (!v35)
        {
          HMFGetOSLogHandle();
          v37 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = 138543362;
            v61 = v38;
            _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@notifying of entry into nearByHome.", (uint8_t *)&v60, 0xCu);

          }
          objc_autoreleasePoolPop(v6);
          goto LABEL_27;
        }
        HMFGetOSLogHandle();
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 138543362;
          v61 = v39;
          _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@atHome region is still unknown, waiting for initial state before notifying.", (uint8_t *)&v60, 0xCu);

        }
      }
      goto LABEL_42;
    }
    if (-[_HMDPendingRegionUpdate state](self->_pendingNearbyHomeRegionUpdate, "state") != 2)
    {
      v6 = (void *)MEMORY[0x227676638]();
      v29 = v7;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = self->_pendingNearbyHomeRegionUpdate;
        v60 = 138543618;
        v61 = v30;
        v62 = 2112;
        v63 = v31;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropping nearByHome region state update. nearByHome region state is set to Unknown. [%@]", (uint8_t *)&v60, 0x16u);

      }
      goto LABEL_42;
    }
LABEL_25:
    v22 = 2;
    -[HMDHomeLocationHandler setRegionStateAtHome:](v7, "setRegionStateAtHome:", 2);
    goto LABEL_26;
  }
  if (!pendingNearbyHomeRegionUpdate)
  {
    HMFGetOSLogHandle();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = self->_pendingAtHomeRegionUpdate;
      v60 = 138543618;
      v61 = v20;
      v62 = 2112;
      v63 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@processing pending atHome region update : %@", (uint8_t *)&v60, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    if (-[_HMDPendingRegionUpdate state](self->_pendingAtHomeRegionUpdate, "state") != 1)
    {
      if (-[_HMDPendingRegionUpdate state](self->_pendingAtHomeRegionUpdate, "state") == 2)
      {
        -[HMDHomeLocationHandler setRegionStateAtHome:](v7, "setRegionStateAtHome:", 2);
        goto LABEL_27;
      }
      v6 = (void *)MEMORY[0x227676638]();
      v32 = v7;
      HMFGetOSLogHandle();
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = self->_pendingAtHomeRegionUpdate;
        v60 = 138543618;
        v61 = v33;
        v62 = 2112;
        v63 = v34;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropping atHome region state update. atHome region state is set to Unknown. [%@]", (uint8_t *)&v60, 0x16u);

      }
      goto LABEL_42;
    }
LABEL_20:
    v12 = 1;
    goto LABEL_21;
  }
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_pendingAtHomeRegionUpdate;
    v11 = self->_pendingNearbyHomeRegionUpdate;
    v60 = 138543874;
    v61 = v9;
    v62 = 2112;
    v63 = v10;
    v64 = 2112;
    v65 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@atHome & nearByHome regions are updated to new states: [atHome : %@] , [nearByHome : %@]", (uint8_t *)&v60, 0x20u);

  }
  objc_autoreleasePoolPop(v6);
  if (-[_HMDPendingRegionUpdate state](self->_pendingAtHomeRegionUpdate, "state") == 1)
    goto LABEL_20;
  if (-[_HMDPendingRegionUpdate state](self->_pendingNearbyHomeRegionUpdate, "state") == 2)
    goto LABEL_25;
  if (-[_HMDPendingRegionUpdate state](self->_pendingAtHomeRegionUpdate, "state") == 2
    && -[_HMDPendingRegionUpdate state](self->_pendingNearbyHomeRegionUpdate, "state") == 1)
  {
    v12 = 2;
LABEL_21:
    -[HMDHomeLocationHandler setRegionStateAtHome:](v7, "setRegionStateAtHome:", v12);
    v22 = 1;
LABEL_26:
    -[HMDHomeLocationHandler setRegionStateNearbyHome:](v7, "setRegionStateNearbyHome:", v22);
LABEL_27:
    v24 = 1;
    goto LABEL_43;
  }
  v6 = (void *)MEMORY[0x227676638]();
  v25 = v7;
  HMFGetOSLogHandle();
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = self->_pendingAtHomeRegionUpdate;
    v28 = self->_pendingNearbyHomeRegionUpdate;
    v60 = 138543874;
    v61 = v26;
    v62 = 2112;
    v63 = v27;
    v64 = 2112;
    v65 = v28;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Dropping region state updates. User cannot be inside atHome & outside nearByHome at the same time. [atHome=%@][nearByHome=%@]", (uint8_t *)&v60, 0x20u);

  }
LABEL_42:

  objc_autoreleasePoolPop(v6);
  v24 = 0;
LABEL_43:
  v40 = self->_pendingAtHomeRegionUpdate;
  self->_pendingAtHomeRegionUpdate = 0;

  v41 = self->_pendingNearbyHomeRegionUpdate;
  self->_pendingNearbyHomeRegionUpdate = 0;

  homeRegionUpdateTimer = v7->_homeRegionUpdateTimer;
  v7->_homeRegionUpdateTimer = 0;

  os_unfair_recursive_lock_unlock();
  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "isCurrentLocationSimulated");

  if ((v44 & 1) != 0)
  {
    v45 = (void *)MEMORY[0x227676638]();
    v46 = v7;
    HMFGetOSLogHandle();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138543362;
      v61 = v48;
      _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_INFO, "%{public}@Current location is simulated. Hence marking the user Away from home.", (uint8_t *)&v60, 0xCu);

    }
    objc_autoreleasePoolPop(v45);
    -[HMDHomeLocationHandler setRegionStateAtHome:](v46, "setRegionStateAtHome:", 2);
    -[HMDHomeLocationHandler setRegionStateNearbyHome:](v46, "setRegionStateNearbyHome:", 2);
  }
  +[HMDRegionStateCorrectnessLogEvent updateWithRegion:nearbyHome:accessoryReachable:](HMDRegionStateCorrectnessLogEvent, "updateWithRegion:nearbyHome:accessoryReachable:", -[HMDHomeLocationHandler regionStateAtHome](v7, "regionStateAtHome"), -[HMDHomeLocationHandler regionStateNearbyHome](v7, "regionStateNearbyHome"), -[HMDHomeLocationHandler firstAccessoryReachable](v7, "firstAccessoryReachable"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeLocationHandler logEventSubmitter](v7, "logEventSubmitter");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "submitLogEvent:", v49);

  if (v24)
  {
    -[HMDHomeLocationHandler home](v7, "home");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x227676638]();
    v53 = v7;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "uuid");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "UUIDString");
      v57 = (_HMDPendingRegionUpdate *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler regionStateAtHome](v53, "regionStateAtHome");
      HMDRegionStateString();
      v58 = (_HMDPendingRegionUpdate *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler regionStateNearbyHome](v53, "regionStateNearbyHome");
      HMDRegionStateString();
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = 138544130;
      v61 = v55;
      v62 = 2112;
      v63 = v57;
      v64 = 2112;
      v65 = v58;
      v66 = 2112;
      v67 = v59;
      _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_INFO, "%{public}@Region state for home [%@] is determined using GeoFence. atHome: %@, nearbyHome: %@", (uint8_t *)&v60, 0x2Au);

    }
    objc_autoreleasePoolPop(v52);
    objc_msgSend(v51, "regionStateUpdated");
    -[HMDHomeLocationHandler checkFalsePresence](v53, "checkFalsePresence");

  }
}

- (void)logHomeLocationEventWithLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  HMDHomeLocationHandler *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  void *v16;
  HMDHomeLocationHandler *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeLocationHandler location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v5)
  {
    -[HMDHomeLocationHandler location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "distanceFromLocation:", v4);
    v8 = v7;

    if (v8 >= 10.0 && fabs(v8 + -10.0) >= 2.22044605e-16)
    {
      v9 = isInternalBuild();
      v10 = (void *)MEMORY[0x227676638]();
      v11 = self;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138543874;
          v23 = v14;
          v24 = 2112;
          v25 = v4;
          v26 = 2048;
          v27 = v8;
          v15 = "%{public}@Submitting event updated home location [%@] & distance %f";
LABEL_14:
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, 0x20u);

        }
      }
      else if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543875;
        v23 = v14;
        v24 = 2117;
        v25 = v4;
        v26 = 2048;
        v27 = v8;
        v15 = "%{public}@Submitting event updated home location [%{sensitive}@] & distance %f";
        goto LABEL_14;
      }

      objc_autoreleasePoolPop(v10);
      +[HMDHomeLocationLogEvent updateWithHomeDistance:](HMDHomeLocationLogEvent, "updateWithHomeDistance:", v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler logEventSubmitter](v11, "logEventSubmitter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "submitLogEvent:", v20);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v19;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Home location is nil, not submitting event.", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)checkFalsePresence
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHomeLocationHandler *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  HMDHomeLocationHandler *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDHomeLocationHandler *v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HMDHomeLocationHandler regionStateAtHome](self, "regionStateAtHome") == 2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler lastArrival](self, "lastArrival");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    -[HMDHomeLocationHandler lastArrival](self, "lastArrival");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToDate:", v3);

    if (v7 >= 30.0)
    {
      +[HMDEntryExitLogEvent exitLogEvent:isFalse:isInitial:](HMDEntryExitLogEvent, "exitLogEvent:isFalse:isInitial:", 0, v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler logEventSubmitter](self, "logEventSubmitter");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "submitLogEvent:", v10);

    }
    else
    {
      +[HMDEntryExitLogEvent exitLogEvent:isFalse:isInitial:](HMDEntryExitLogEvent, "exitLogEvent:isFalse:isInitial:", 1, v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler logEventSubmitter](self, "logEventSubmitter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "submitLogEvent:", v10);

      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler lastArrival](v13, "lastArrival");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543874;
        v39 = v15;
        v40 = 2048;
        v41 = v7;
        v42 = 2112;
        v43 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@False exit. Seconds since last entry: %f with last entry: %@", (uint8_t *)&v38, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler setLastExit:](self, "setLastExit:", v31);

    if ((v9 & 1) == 0)
      goto LABEL_19;
LABEL_16:
    v34 = (void *)MEMORY[0x227676638]();
    v35 = self;
    HMFGetOSLogHandle();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 138543362;
      v39 = v37;
      _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Setting isInitial to YES as this is the first exit or arrival.", (uint8_t *)&v38, 0xCu);

    }
    objc_autoreleasePoolPop(v34);
    goto LABEL_19;
  }
  if (-[HMDHomeLocationHandler regionStateAtHome](self, "regionStateAtHome") == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler lastExit](self, "lastExit");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v18);
    v20 = v19;

    -[HMDHomeLocationHandler lastExit](self, "lastExit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToDate:", v3);

    if (v20 >= 30.0)
    {
      +[HMDEntryExitLogEvent entryLogEvent:isFalse:isInitial:](HMDEntryExitLogEvent, "entryLogEvent:isFalse:isInitial:", 0, v22, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler logEventSubmitter](self, "logEventSubmitter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "submitLogEvent:", v23);

    }
    else
    {
      +[HMDEntryExitLogEvent entryLogEvent:isFalse:isInitial:](HMDEntryExitLogEvent, "entryLogEvent:isFalse:isInitial:", 1, v22, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHomeLocationHandler logEventSubmitter](self, "logEventSubmitter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "submitLogEvent:", v23);

      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeLocationHandler lastExit](v26, "lastExit");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138543874;
        v39 = v28;
        v40 = 2048;
        v41 = v20;
        v42 = 2112;
        v43 = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEBUG, "%{public}@False entry. Seconds since last exit: %f with last exit: %@", (uint8_t *)&v38, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler setLastArrival:](self, "setLastArrival:", v33);

    if ((_DWORD)v22)
      goto LABEL_16;
  }
LABEL_19:

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDHomeLocationHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDHomeLocationHandler messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (HMDHomeLocationHandler)initWithCoder:(id)a3
{
  id v4;
  HMDHomeLocationHandler *v5;
  uint64_t v6;
  CLLocation *location;
  uint64_t v8;
  NSDate *locationUpdateTimestamp;
  void *v10;
  uint64_t v11;
  NSTimeZone *timeZone;
  uint64_t v13;
  NSString *isoCountryCode;

  v4 = a3;
  v5 = -[HMDHomeLocationHandler init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeLocation"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (CLLocation *)v6;

    if (v5->_location)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeLocationNextUpdate"));
      v8 = objc_claimAutoreleasedReturnValue();
      locationUpdateTimestamp = v5->_locationUpdateTimestamp;
      v5->_locationUpdateTimestamp = (NSDate *)v8;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeLocationSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_locationSource = objc_msgSend(v10, "unsignedIntValue");

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.homeLocTZ"));
    v11 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMD.homeLocCC"));
    v13 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDHomeLocationHandler location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("homeLocation"));

  -[HMDHomeLocationHandler locationUpdateTimestamp](self, "locationUpdateTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("homeLocationNextUpdate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDHomeLocationHandler locationSource](self, "locationSource"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("homeLocationSource"));
  -[HMDHomeLocationHandler timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMD.homeLocTZ"));

  -[HMDHomeLocationHandler isoCountryCode](self, "isoCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMD.homeLocCC"));

}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HMDHomeLocationHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)__initForUnitTesting:(double)a3 home:(id)a4 queue:(id)a5 messageDispatcher:(id)a6 location:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HMDHomeLocationHandler *v16;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = -[HMDHomeLocationHandler init](self, "init");
  -[HMDHomeLocationHandler setLocation:](v16, "setLocation:", v12);

  -[HMDHomeLocationHandler setCoalesceRegionUpdateIntervalInSeconds:](v16, "setCoalesceRegionUpdateIntervalInSeconds:", a3);
  -[HMDHomeLocationHandler setHome:](v16, "setHome:", v15);

  -[HMDHomeLocationHandler setWorkQueue:](v16, "setWorkQueue:", v14);
  -[HMDHomeLocationHandler setMsgDispatcher:](v16, "setMsgDispatcher:", v13);

  -[HMDHomeLocationHandler _registerForRegionUpdate](v16, "_registerForRegionUpdate");
  return v16;
}

- (void)__simulateAtHomeRegionState:(int64_t)a3
{
  id v5;

  if (a3)
  {
    -[HMDHomeLocationHandler regionAtHome](self, "regionAtHome");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler didDetermineState:forRegion:](self, "didDetermineState:forRegion:", a3, v5);

  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    -[HMDHomeLocationHandler setRegionStateAtHome:](self, "setRegionStateAtHome:", 0);
    os_unfair_recursive_lock_unlock();
  }
}

- (void)__simulateNearByHomeRegionState:(int64_t)a3
{
  id v5;

  if (a3)
  {
    -[HMDHomeLocationHandler regionNearbyHome](self, "regionNearbyHome");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDHomeLocationHandler didDetermineState:forRegion:](self, "didDetermineState:forRegion:", a3, v5);

  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    -[HMDHomeLocationHandler setRegionStateNearbyHome:](self, "setRegionStateNearbyHome:", 0);
    os_unfair_recursive_lock_unlock();
  }
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSDate)locationUpdateTimestamp
{
  return self->_locationUpdateTimestamp;
}

- (void)setLocationUpdateTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_locationUpdateTimestamp, a3);
}

- (int64_t)locationSource
{
  return self->_locationSource;
}

- (void)setLocationSource:(int64_t)a3
{
  self->_locationSource = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (int64_t)regionStateAtHome
{
  return self->_regionStateAtHome;
}

- (void)setRegionStateAtHome:(int64_t)a3
{
  self->_regionStateAtHome = a3;
}

- (int64_t)regionStateNearbyHome
{
  return self->_regionStateNearbyHome;
}

- (void)setRegionStateNearbyHome:(int64_t)a3
{
  self->_regionStateNearbyHome = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMFMessageDispatcher)msgDispatcher
{
  return self->_msgDispatcher;
}

- (void)setMsgDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_msgDispatcher, a3);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (int64_t)locationAuthorization
{
  return self->_locationAuthorization;
}

- (void)setLocationAuthorization:(int64_t)a3
{
  self->_locationAuthorization = a3;
}

- (CLRegion)regionAtHome
{
  return self->_regionAtHome;
}

- (void)setRegionAtHome:(id)a3
{
  objc_storeStrong((id *)&self->_regionAtHome, a3);
}

- (CLRegion)regionNearbyHome
{
  return self->_regionNearbyHome;
}

- (void)setRegionNearbyHome:(id)a3
{
  objc_storeStrong((id *)&self->_regionNearbyHome, a3);
}

- (BOOL)firstAccessoryReachable
{
  return self->_firstAccessoryReachable;
}

- (void)setFirstAccessoryReachable:(BOOL)a3
{
  self->_firstAccessoryReachable = a3;
}

- (BOOL)pairingHomeLocationOverride
{
  return self->_pairingHomeLocationOverride;
}

- (void)setPairingHomeLocationOverride:(BOOL)a3
{
  self->_pairingHomeLocationOverride = a3;
}

- (HMFTimer)homeRegionUpdateTimer
{
  return self->_homeRegionUpdateTimer;
}

- (void)setHomeRegionUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_homeRegionUpdateTimer, a3);
}

- (_HMDPendingRegionUpdate)pendingAtHomeRegionUpdate
{
  return self->_pendingAtHomeRegionUpdate;
}

- (void)setPendingAtHomeRegionUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAtHomeRegionUpdate, a3);
}

- (_HMDPendingRegionUpdate)pendingNearbyHomeRegionUpdate
{
  return self->_pendingNearbyHomeRegionUpdate;
}

- (void)setPendingNearbyHomeRegionUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNearbyHomeRegionUpdate, a3);
}

- (double)coalesceRegionUpdateIntervalInSeconds
{
  return self->_coalesceRegionUpdateIntervalInSeconds;
}

- (void)setCoalesceRegionUpdateIntervalInSeconds:(double)a3
{
  self->_coalesceRegionUpdateIntervalInSeconds = a3;
}

- (NSDate)lastArrival
{
  return self->_lastArrival;
}

- (void)setLastArrival:(id)a3
{
  objc_storeStrong((id *)&self->_lastArrival, a3);
}

- (NSDate)lastExit
{
  return self->_lastExit;
}

- (void)setLastExit:(id)a3
{
  objc_storeStrong((id *)&self->_lastExit, a3);
}

- (NSDate)lastAttemptedLocationUpdate
{
  return self->_lastAttemptedLocationUpdate;
}

- (void)setLastAttemptedLocationUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_lastAttemptedLocationUpdate, a3);
}

- (BOOL)resendOnce
{
  return self->_resendOnce;
}

- (void)setResendOnce:(BOOL)a3
{
  self->_resendOnce = a3;
}

- (int64_t)cachedSource
{
  return self->_cachedSource;
}

- (void)setCachedSource:(int64_t)a3
{
  self->_cachedSource = a3;
}

- (CLLocation)cachedLocation
{
  return self->_cachedLocation;
}

- (void)setCachedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedLocation, a3);
}

- (BOOL)shouldUpdateHomeLocation
{
  return self->_shouldUpdateHomeLocation;
}

- (void)setShouldUpdateHomeLocation:(BOOL)a3
{
  self->_shouldUpdateHomeLocation = a3;
}

- (NSDate)homeLocationUpdateRequestTime
{
  return self->_homeLocationUpdateRequestTime;
}

- (void)setHomeLocationUpdateRequestTime:(id)a3
{
  objc_storeStrong((id *)&self->_homeLocationUpdateRequestTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeLocationUpdateRequestTime, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong((id *)&self->_lastAttemptedLocationUpdate, 0);
  objc_storeStrong((id *)&self->_lastExit, 0);
  objc_storeStrong((id *)&self->_lastArrival, 0);
  objc_storeStrong((id *)&self->_pendingNearbyHomeRegionUpdate, 0);
  objc_storeStrong((id *)&self->_pendingAtHomeRegionUpdate, 0);
  objc_storeStrong((id *)&self->_homeRegionUpdateTimer, 0);
  objc_storeStrong((id *)&self->_regionNearbyHome, 0);
  objc_storeStrong((id *)&self->_regionAtHome, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locationUpdateTimestamp, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

void __54__HMDHomeLocationHandler_didDetermineState_forRegion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      v10 = "%{public}@Home reference is nil";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
LABEL_10:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v13, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v6);
    goto LABEL_12;
  }
  v3 = objc_msgSend(MEMORY[0x24BDBFA88], "hm_hmdRegionStateFromCLRegionState:", *(_QWORD *)(a1 + 48));
  if (!v3)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      v10 = "%{public}@Not updating the region state because it is currently unknown";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v4 = v3;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldRegisterForSignificantRegion"))
  {
    +[HMDLocation sharedManager](HMDLocation, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startExtractingSingleLocationForDelegate:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "coalesceRegionUpdateState:forRegion:", v4, *(_QWORD *)(a1 + 40));
LABEL_12:

}

uint64_t __47__HMDHomeLocationHandler_didDetermineLocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateHomeRegionStateForCurrentDeviceLocation:", *(_QWORD *)(a1 + 40));
}

void __59__HMDHomeLocationHandler_updateHomeLocationFromCoreRoutine__block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  void *v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  const char *v29;
  _BYTE v30[24];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  v9 = isInternalBuild();
  v10 = (void *)MEMORY[0x227676638]();
  v11 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543874;
      *(_QWORD *)&v30[4] = v14;
      *(_WORD *)&v30[12] = 2112;
      *(_QWORD *)&v30[14] = v7;
      *(_WORD *)&v30[22] = 2112;
      v31 = v8;
      v15 = "%{public}@Fetching LOI at current location finished with location [%@], error: %@";
LABEL_6:
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v15, v30, 0x20u);

    }
  }
  else if (v13)
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v30 = 138543875;
    *(_QWORD *)&v30[4] = v14;
    *(_WORD *)&v30[12] = 2117;
    *(_QWORD *)&v30[14] = v7;
    *(_WORD *)&v30[22] = 2112;
    v31 = v8;
    v15 = "%{public}@Fetching LOI at current location finished with location [%{sensitive}@], error: %@";
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v10);
  if (!v7 || v8)
  {
    v19 = isInternalBuild();
    v20 = v19;
    v24 = (void *)MEMORY[0x227676638](v19, v21, v22, v23);
    v25 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (v20)
    {
      if (v27)
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v30 = 138543874;
        *(_QWORD *)&v30[4] = v28;
        *(_WORD *)&v30[12] = 2112;
        *(_QWORD *)&v30[14] = v7;
        *(_WORD *)&v30[22] = 2112;
        v31 = v8;
        v29 = "%{public}@Unable to get LOI at current location: %@ / %@";
LABEL_18:
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, v29, v30, 0x20u);

      }
    }
    else if (v27)
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v30 = 138543875;
      *(_QWORD *)&v30[4] = v28;
      *(_WORD *)&v30[12] = 2117;
      *(_QWORD *)&v30[14] = v7;
      *(_WORD *)&v30[22] = 2112;
      v31 = v8;
      v29 = "%{public}@Unable to get LOI at current location: %{sensitive}@ / %@";
      goto LABEL_18;
    }

    objc_autoreleasePoolPop(v24);
    goto LABEL_20;
  }
  if (a3)
    v16 = 2;
  else
    v16 = 4;
  v17 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE60], "date", *(_OWORD *)v30, *(_QWORD *)&v30[16], v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "runTransactionWithLocation:updatedTime:source:", v7, v18, v16);

LABEL_20:
}

void __66__HMDHomeLocationHandler_sendHomeLocationUpdateToResident_source___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to send the location update to primary with an error %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "_resendHomeLocationOnce:newSource:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(void **)(a1 + 40);
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully sent the location update to primary : %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

void __70__HMDHomeLocationHandler_handleHomeLocationForHH2_updatedTime_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMCContext findHomeWithModelID:](HMCContext, "findHomeWithModelID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "setLocation:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v3, "setLocationUpdateTimeStamp:", *(_QWORD *)(a1 + 56));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(int *)(a1 + 72));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocationSource:", v4);

    v5 = *(void **)(a1 + 64);
    v32 = 0;
    v6 = objc_msgSend(v5, "save:", &v32);
    v7 = v32;
    v8 = isInternalBuild();
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6 && !v7)
    {
      v13 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v13)
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 48);
          v16 = *(_QWORD *)(a1 + 56);
          HMDHomeLocationSourceToString(*(_QWORD *)(a1 + 72));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v34 = v14;
          v35 = 2112;
          v36 = v15;
          v37 = 2112;
          v38 = v16;
          v39 = 2112;
          v40 = v17;
          v18 = "%{public}@Successfully updated home location [%@] & time stamp [%@] & source [%@] to the working store";
LABEL_18:
          _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, v18, buf, 0x2Au);

          goto LABEL_19;
        }
      }
      else if (v13)
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(void **)(a1 + 48);
        v31 = *(_QWORD *)(a1 + 56);
        HMDHomeLocationSourceToString(*(_QWORD *)(a1 + 72));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544131;
        v34 = v14;
        v35 = 2117;
        v36 = v30;
        v37 = 2112;
        v38 = v31;
        v39 = 2112;
        v40 = v17;
        v18 = "%{public}@Successfully updated home location [%{sensitive}@] & time stamp [%@] & source [%@] to the working store";
        goto LABEL_18;
      }
LABEL_20:

      objc_autoreleasePoolPop(v9);
      goto LABEL_21;
    }
    v24 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (!v24)
        goto LABEL_20;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 48);
      v26 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543874;
      v34 = v14;
      v35 = 2112;
      v36 = v25;
      v37 = 2112;
      v38 = v26;
      v27 = "%{public}@Unable to save the home location & time stamp : %@ / %@";
    }
    else
    {
      if (!v24)
        goto LABEL_20;
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(void **)(a1 + 48);
      v29 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543875;
      v34 = v14;
      v35 = 2117;
      v36 = v28;
      v37 = 2112;
      v38 = v29;
      v27 = "%{public}@Unable to save the home location & time stamp : %{sensitive}@ / %@";
    }
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, v27, buf, 0x20u);
LABEL_19:

    goto LABEL_20;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v22;
    v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Did not find the home with model id : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
LABEL_21:

}

void __42__HMDHomeLocationHandler__updateTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    objc_msgSend(WeakRetained, "setTimeZone:", v5);
    v9 = (void *)MEMORY[0x227676638](objc_msgSend(v8, "setIsoCountryCode:", v6));
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "isoCountryCode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating timezone %@, country: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __75__HMDHomeLocationHandler__evaluateHomeRegionStateForCurrentDeviceLocation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (v5 && WeakRetained)
  {
    v9 = (void *)MEMORY[0x227676638](objc_msgSend(WeakRetained, "setIsoCountryCode:", v6));
    v10 = v8;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "isoCountryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating device isoCountry code: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __79__HMDHomeLocationHandler__unregisterForPrimaryResidentGenerationIDNotification__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing observer for Primary Resident Generation ID notifications.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification"), 0);

}

void __77__HMDHomeLocationHandler__registerForPrimaryResidentGenerationIDNotification__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Registering for Primary Resident Generation ID notifications.", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__handlePrimaryResidentResidentGenerationIDNotification_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification"), 0);

}

void __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Region update deregistered with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __50__HMDHomeLocationHandler__registerForRegionUpdate__block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Region update registered with error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

+ (BOOL)hasMessageReceiverChildren
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t107_225024 != -1)
    dispatch_once(&logCategory__hmf_once_t107_225024, &__block_literal_global_225025);
  return (id)logCategory__hmf_once_v108_225026;
}

void __37__HMDHomeLocationHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v108_225026;
  logCategory__hmf_once_v108_225026 = v0;

}

@end
