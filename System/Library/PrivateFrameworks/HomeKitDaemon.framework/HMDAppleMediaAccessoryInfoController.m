@implementation HMDAppleMediaAccessoryInfoController

- (HMDAppleMediaAccessoryInfoController)initWithQueue:(id)a3 dataSource:(id)a4 delegate:(id)a5 notificationCenter:(id)a6 wifiManager:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDAppleMediaAccessoryInfoController *v18;
  HMDAppleMediaAccessoryInfoController *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDAppleMediaAccessoryInfoController;
  v18 = -[HMDAppleMediaAccessoryInfoController init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeWeak((id *)&v19->_dataSource, v14);
    objc_storeWeak((id *)&v19->_delegate, v15);
    objc_storeStrong((id *)&v19->_notificationCenter, a6);
    objc_storeStrong((id *)&v19->_wifiManager, a7);
  }

  return v19;
}

- (void)configure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id v10;

  -[HMDAppleMediaAccessoryInfoController currentWifiNetworkInfo](self, "currentWifiNetworkInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryInfoController setLastWifiNetworkInfo:](self, "setLastWifiNetworkInfo:", v3);

  -[HMDAppleMediaAccessoryInfoController lastWifiNetworkInfo](self, "lastWifiNetworkInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryInfoController _notifyDelegateWifiInfoUpdated:](self, "_notifyDelegateWifiInfoUpdated:", v4);

  -[HMDAppleMediaAccessoryInfoController lastWifiNetworkInfo](self, "lastWifiNetworkInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryInfoController _postUpdateWifiNetworkInfoIfDifferent:](self, "_postUpdateWifiNetworkInfoIfDifferent:", v5);

  -[HMDAppleMediaAccessoryInfoController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAccessorySoftwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryInfoController _postUpdateSoftwareVersionIfDifferent:](self, "_postUpdateSoftwareVersionIfDifferent:", v7);

  -[HMDAppleMediaAccessoryInfoController notificationCenter](self, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)MEMORY[0x24BE3F130];
  objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x24BE3F130], 0);

  -[HMDAppleMediaAccessoryInfoController notificationCenter](self, "notificationCenter");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_handleCurrentNetworkChangedNotification_, *v9, 0);

}

- (void)handleCurrentNetworkChangedNotification:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaAccessoryInfoController *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Received current network changed notification: %@", (uint8_t *)&v19, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAppleMediaAccessoryInfoController lastWifiNetworkInfo](v6, "lastWifiNetworkInfo");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[HMDAppleMediaAccessoryInfoController lastWifiNetworkInfo](v6, "lastWifiNetworkInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "SSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAppleMediaAccessoryInfoController wifiManager](v6, "wifiManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentNetworkSSID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      -[HMDAppleMediaAccessoryInfoController currentWifiNetworkInfo](v6, "currentWifiNetworkInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessoryInfoController setLastWifiNetworkInfo:](v6, "setLastWifiNetworkInfo:", v16);

      -[HMDAppleMediaAccessoryInfoController lastWifiNetworkInfo](v6, "lastWifiNetworkInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessoryInfoController _notifyDelegateWifiInfoUpdated:](v6, "_notifyDelegateWifiInfoUpdated:", v17);

      -[HMDAppleMediaAccessoryInfoController lastWifiNetworkInfo](v6, "lastWifiNetworkInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaAccessoryInfoController _postUpdateWifiNetworkInfoIfDifferent:](v6, "_postUpdateWifiNetworkInfoIfDifferent:", v18);

    }
  }

}

- (id)currentWifiNetworkInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[HMDAppleMediaAccessoryInfoController wifiManager](self, "wifiManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MACAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessoryInfoController wifiManager](self, "wifiManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentNetworkSSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessoryInfoController wifiManager](self, "wifiManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentNetworkAssociation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x24BE3F2C0]);
  objc_msgSend(v8, "BSSID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formattedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gatewayIPAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gatewayMACAddress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "formattedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v9, "initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:", v4, v6, v11, v12, v14);

  return v15;
}

- (void)_postUpdateWifiNetworkInfoIfDifferent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMDAppleMediaAccessoryInfoController *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "SSID"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    -[HMDAppleMediaAccessoryInfoController queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke;
    v12[3] = &unk_24E79C268;
    v12[4] = self;
    v13 = v5;
    dispatch_async(v7, v12);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Trying to post invalid WiFi info: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)_postUpdateSoftwareVersionIfDifferent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDAppleMediaAccessoryInfoController *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[HMDAppleMediaAccessoryInfoController queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke;
    v10[3] = &unk_24E79C268;
    v10[4] = self;
    v11 = v4;
    dispatch_async(v5, v10);

  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error posting software version update: object is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

}

- (void)_notifyDelegateWifiInfoUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  HMDAppleMediaAccessoryInfoController *v10;
  NSObject *v11;
  void *v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "SSID"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    -[HMDAppleMediaAccessoryInfoController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HMDAppleMediaAccessoryInfoController queue](self, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__HMDAppleMediaAccessoryInfoController__notifyDelegateWifiInfoUpdated___block_invoke;
      block[3] = &unk_24E79BBD0;
      block[4] = self;
      v14 = v5;
      v15 = v7;
      dispatch_async(v8, block);

    }
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Trying to notify with invalid WiFi info: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAppleMediaAccessoryInfoControllerDataSource)dataSource
{
  return (HMDAppleMediaAccessoryInfoControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMDAppleMediaAccessoryInfoControllerDelegate)delegate
{
  return (HMDAppleMediaAccessoryInfoControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationCenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (HMFWiFiNetworkInfo)lastWifiNetworkInfo
{
  return (HMFWiFiNetworkInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastWifiNetworkInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWifiManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_lastWifiNetworkInfo, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __71__HMDAppleMediaAccessoryInfoController__notifyDelegateWifiInfoUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Notifying delegate to update WiFi info: %@ ", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 48), "accessoryInfoController:didUpdateWifiInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v6, "buildVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v38 = v5;
    v39 = 2112;
    v40 = v6;
    v41 = 2112;
    v42 = v7;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting updated software version: %@ (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessoryInfoControllerSoftwareVersionTopicForController:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventStoreReadHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastEventForTopic:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v34 = v10;
LABEL_13:
    v14 = 0;
LABEL_15:
    objc_msgSend(v8, "eventSourceIdentifierNameForAccessoryInfoController:", *(_QWORD *)(a1 + 32), v34);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v27 = v26;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD73E8]), "initWithSoftwareVersion:", *(_QWORD *)(a1 + 40));
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ED90]), "initWithSource:cachePolicy:combineType:timestamp:", v25, 2, 2, v27);
    v30 = objc_alloc(MEMORY[0x24BE4ED80]);
    objc_msgSend(v28, "protoData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithEventData:metadata:", v31, v29);

    objc_msgSend(v8, "eventForwarder");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke_10;
    v36[3] = &unk_24E79BD80;
    v36[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v33, "forwardEvent:topic:completion:", v32, v9, v36);

    v10 = v35;
    goto LABEL_16;
  }
  v12 = objc_alloc(MEMORY[0x24BDD73E8]);
  objc_msgSend(v11, "encodedData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithProtoData:", v13);

  if (!v14)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v38 = v24;
      v39 = 2112;
      v40 = v9;
      v41 = 2112;
      v42 = 0;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Error reading stored software version for topic %@, error: %@", buf, 0x20u);

    }
    v34 = v10;

    objc_autoreleasePoolPop(v21);
    goto LABEL_13;
  }
  objc_msgSend(v14, "softwareVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqual:", *(_QWORD *)(a1 + 40));

  if (!v16)
  {
    v34 = v10;
    goto LABEL_15;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v20;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Skip sending event update for software version as it matches stored", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
LABEL_16:

}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateSoftwareVersionIfDifferent___block_invoke_10(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the software version info event: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "SSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "MACAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formattedString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v5;
    v41 = 2112;
    v42 = v6;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Posting updated WiFi: SSID: %@, MAC: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryInfoControllerTopicForWifiInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventStoreReadHandle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastEventForTopic:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v36 = v11;
LABEL_13:
    v15 = 0;
LABEL_15:
    objc_msgSend(v9, "eventSourceIdentifierNameForAccessoryInfoController:", *(_QWORD *)(a1 + 32), v36);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v29 = v28;
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD73F0]), "initWithWifiNetworkInfo:", *(_QWORD *)(a1 + 40));
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4ED90]), "initWithSource:cachePolicy:combineType:timestamp:", v27, 2, 2, v29);
    v32 = objc_alloc(MEMORY[0x24BE4ED80]);
    objc_msgSend(v30, "protoData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v32, "initWithEventData:metadata:", v33, v31);

    objc_msgSend(v9, "eventForwarder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke_7;
    v38[3] = &unk_24E79BD80;
    v38[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v35, "forwardEvent:topic:completion:", v34, v10, v38);

    v11 = v37;
    goto LABEL_16;
  }
  v13 = objc_alloc(MEMORY[0x24BDD73F0]);
  objc_msgSend(v12, "encodedData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithProtoData:", v14);

  if (!v15)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v40 = v26;
      v41 = 2112;
      v42 = v10;
      v43 = 2112;
      v44 = 0;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_INFO, "%{public}@Error reading stored setting for topic %@, error: %@", buf, 0x20u);

    }
    v36 = v11;

    objc_autoreleasePoolPop(v23);
    goto LABEL_13;
  }
  objc_msgSend(v15, "networkSSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "SSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToString:", v17);

  if (!v18)
  {
    v36 = v11;
    goto LABEL_15;
  }
  v19 = (void *)MEMORY[0x227676638]();
  v20 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v22;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Skip sending event update for WiFi as it matches stored", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v19);
LABEL_16:

}

void __78__HMDAppleMediaAccessoryInfoController__postUpdateWifiNetworkInfoIfDifferent___block_invoke_7(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Error in forwarding the WiFi network info event: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t13_113014 != -1)
    dispatch_once(&logCategory__hmf_once_t13_113014, &__block_literal_global_113015);
  return (id)logCategory__hmf_once_v14_113016;
}

void __51__HMDAppleMediaAccessoryInfoController_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v14_113016;
  logCategory__hmf_once_v14_113016 = v0;

}

@end
