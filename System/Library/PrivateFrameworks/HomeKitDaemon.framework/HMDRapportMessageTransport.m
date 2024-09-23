@implementation HMDRapportMessageTransport

- (HMDRapportMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDRapportMessageTransport *v8;

  v4 = a3;
  +[HMDRapportMessaging sharedInstance](HMDRapportMessaging, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDRapportMessageTransport initWithAccountRegistry:rapportMessaging:logEventSubmitter:appleAccountManager:](self, "initWithAccountRegistry:rapportMessaging:logEventSubmitter:appleAccountManager:", v4, v5, v6, v7);

  return v8;
}

- (HMDRapportMessageTransport)initWithAccountRegistry:(id)a3 rapportMessaging:(id)a4 logEventSubmitter:(id)a5 appleAccountManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  HMDRapportMessageTransport *v14;
  HMDRapportMessageTransport *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HMDRapportMessageTransport;
  v14 = -[HMDRemoteMessageTransport initWithAccountRegistry:](&v17, sel_initWithAccountRegistry_, a3);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_rapportMessaging, a4);
    objc_storeStrong((id *)&v15->_logEventSubmitter, a5);
    objc_storeStrong((id *)&v15->_appleAccountManager, a6);
  }

  return v15;
}

- (BOOL)isSecure
{
  return 1;
}

- (int)transportType
{
  return 6;
}

- (id)start
{
  void *v3;
  HMDRapportMessageTransport *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDRapportMessageTransport _configureRapport](v4, "_configureRapport");
  -[HMDRemoteMessageTransport startFuture](v4, "startFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)startHMMM
{
  void *v3;
  HMDRapportMessageTransport *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting HMMM", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDRapportMessageTransport _configureHMMMRapport](v4, "_configureHMMMRapport");
  -[HMDRemoteMessageTransport startFuture](v4, "startFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)startHMMMEnergy
{
  void *v3;
  HMDRapportMessageTransport *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting Energy HMMM", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDRapportMessageTransport _configureHMMMEnergyRapport](v4, "_configureHMMMEnergyRapport");
  -[HMDRemoteMessageTransport startFuture](v4, "startFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  HMDRapportMessageTransport *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDRapportMessageTransport isValidMessage:](self, "isValidMessage:", v4))
  {
    -[HMDRapportMessageTransport _IDSIdentifiersForMessage:](self, "_IDSIdentifiersForMessage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = v6 != 0;
    if (!v6)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v11;
        v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@ because no destination devices have an IDS DeviceID", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isValidMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  unint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

  }
  else
  {
    objc_msgSend(v3, "destination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      LOBYTE(v7) = 0;
      goto LABEL_6;
    }
  }
  v7 = ((unint64_t)objc_msgSend(v3, "restriction") >> 3) & 1;
LABEL_6:

  return v7;
}

- (void)sendHMMMMessage:(id)a3 completionHandler:(id)a4
{
  -[HMDRapportMessageTransport _sendMessage:completionHandler:requestID:](self, "_sendMessage:completionHandler:requestID:", a3, a4, CFSTR("com.apple.home.hh2.hmmm.rid"));
}

- (void)sendHMMMEnergyMessage:(id)a3 completionHandler:(id)a4
{
  -[HMDRapportMessageTransport _sendMessage:completionHandler:requestID:](self, "_sendMessage:completionHandler:requestID:", a3, a4, CFSTR("hmmm.client.rid.prefix_com.apple.private.alloy.energykit"));
}

- (void)rapportMessaging:(id)a3 idsIdentifier:(id)a4 didAppearReachable:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v7 = a4;
  -[HMDRemoteMessageTransport reachabilityDelegate](self, "reachabilityDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transport:idsIdentifier:didAppearReachable:", self, v7, v5);

}

- (void)_configureRapport
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[5];

  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke;
  v9[3] = &unk_24E79C240;
  v9[4] = self;
  objc_msgSend(v3, "configureDiscoveryClientWithCompletion:", v9);

  objc_initWeak(&location, self);
  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke_2;
  v6[3] = &unk_24E78CCA8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "registerRequestHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_configureHMMMRapport
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[5];

  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke;
  v9[3] = &unk_24E79C240;
  v9[4] = self;
  objc_msgSend(v3, "configureDiscoveryClientWithCompletion:", v9);

  objc_initWeak(&location, self);
  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke_2;
  v6[3] = &unk_24E78CCA8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "registerHMMMRequestHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_configureHMMMEnergyRapport
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;
  _QWORD v9[5];

  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke;
  v9[3] = &unk_24E79C240;
  v9[4] = self;
  objc_msgSend(v3, "configureDiscoveryClientWithCompletion:", v9);

  objc_initWeak(&location, self);
  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke_2;
  v6[3] = &unk_24E78CCA8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "registerHMMMEnergyRequestHandler:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (id)_IDSIdentifierForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "idsIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "sharedUserIDSIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_IDSIdentifiersForMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "destination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v8 = v6;
      else
        v8 = 0;
      v9 = v8;
      if ((isKindOfClass & 1) != 0)
      {
        -[HMDRapportMessageTransport _IDSIdentifierForDestination:](self, "_IDSIdentifierForDestination:", v6);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
        {
          v22[0] = v10;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = (void *)MEMORY[0x24BDBD1A8];
        }

      }
      else
      {
        v13 = v6;
        objc_opt_class();
        v14 = objc_opt_isKindOfClass();
        if ((v14 & 1) != 0)
          v15 = v13;
        else
          v15 = 0;
        v16 = v15;

        v12 = 0;
        if ((v14 & 1) != 0)
        {
          objc_msgSend(v13, "devices");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = MEMORY[0x24BDAC760];
          v19[1] = 3221225472;
          v19[2] = __56__HMDRapportMessageTransport__IDSIdentifiersForMessage___block_invoke;
          v19[3] = &unk_24E78CCD0;
          v19[4] = self;
          v20 = v5;
          v21 = v13;
          objc_msgSend(v17, "na_map:", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_IDSIdentifierForDestination:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if (v3)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v5 = v3;
    else
      v5 = 0;
    v6 = v5;
    v7 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v3, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "idsIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        v7 = v9;
      }
      else
      {
        objc_msgSend(v3, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sharedUserIDSIdentifier");
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setSharedUserIDSIdentifierForDevice:(id)a3 idsIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMDRapportMessageTransport *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
LABEL_12:
    _HMFPreconditionFailure();
  }
  v8 = v7;
  if (!v7)
    goto LABEL_12;
  objc_msgSend(v6, "account");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCurrentAccount");

  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating IDS device identifier for device because it belongs to the current account: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Setting shared user's IDS device identifier for device: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v6, "setSharedUserIDSIdentifier:", v8);
  }

}

- (void)_sendMessage:(id)a3 completionHandler:(id)a4
{
  -[HMDRapportMessageTransport _sendMessage:completionHandler:requestID:](self, "_sendMessage:completionHandler:requestID:", a3, a4, 0);
}

- (void)_sendMessage:(id)a3 completionHandler:(id)a4 requestID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
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
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  HMDRapportMessageTransport *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDRapportMessageTransport *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *context;
  id v37;
  id v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _BYTE *v49;
  _QWORD *v50;
  _QWORD v51[4];
  id v52;
  _QWORD aBlock[4];
  id v54;
  id v55;
  _BYTE buf[24];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v38 = a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke;
  aBlock[3] = &unk_24E79B3A0;
  v10 = v9;
  v55 = v10;
  v11 = v8;
  v54 = v11;
  v12 = _Block_copy(aBlock);
  -[HMDRapportMessageTransport _IDSIdentifiersForMessage:](self, "_IDSIdentifiersForMessage:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "remoteMessageFromMessage:secure:accountRegistry:", v11, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    -[HMDRapportMessageTransport _serializeRemoteMessage:withResponseErrorData:serializationError:](self, "_serializeRemoteMessage:withResponseErrorData:serializationError:", v14, v16, &v52);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v52;

    if (v17)
    {
      v18 = (void *)objc_opt_new();
      objc_msgSend(v11, "timeout");
      if (v19 > 0.0)
      {
        v20 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v11, "timeout");
        objc_msgSend(v20, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE7CD18]);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v51[0] = 0;
      v51[1] = v51;
      v51[2] = 0x2020000000;
      v51[3] = 0;
      v57 = 0;
      objc_msgSend(v11, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_20;
      v39[3] = &unk_24E78CD48;
      v39[4] = self;
      v40 = 0;
      v24 = v18;
      v41 = v24;
      v42 = v14;
      v43 = v17;
      v44 = v38;
      v25 = v22;
      v45 = v25;
      v26 = v23;
      v46 = v26;
      v49 = buf;
      v50 = v51;
      v48 = v12;
      v47 = v13;
      objc_msgSend(v47, "na_each:", v39);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(buf, 8);

      v11 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v32 = self;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier", context);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2112;
        v57 = v37;
        _os_log_impl(&dword_2218F0000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not send message: failed to serialize message %{public}@ with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      (*((void (**)(void *, id))v12 + 2))(v12, v37);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x227676638]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v31;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not send message %{public}@: No valid destinations", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), CFSTR("No destinations have a valid IDS DeviceID."), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v12 + 2))(v12, v14);
  }

}

- (id)_serializeRemoteMessage:(id)a3 withResponseErrorData:(id)a4 serializationError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  +[HMDRemoteMessageSerialization dictionaryForMessage:isHH2Payload:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:isHH2Payload:error:", v7, 1, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    v11 = objc_msgSend(v7, "type");
    if (v8 && v11 == 1)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("kIDSMessageResponseErrorDataKey"));
    v12 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_didReceiveRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDRapportMessageTransport *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDRemoteDeviceMessageDestination *v34;
  void *v35;
  void *v36;
  HMDRemoteMessageSenderContext *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  HMDRapportMessageTransport *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  HMDRapportMessageTransport *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  HMDRapportMessageTransport *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  HMDRapportMessageTransport *v65;
  NSObject *v66;
  void *v67;
  void (**v68)(_QWORD, _QWORD);
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  HMDRapportMessageTransport *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  HMDRapportMessageTransport *v82;
  NSObject *v83;
  void *v84;
  void *v85;
  HMDRemoteDeviceMessageDestination *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD aBlock[4];
  id v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  uint64_t v104;
  __int16 v105;
  uint64_t v106;
  __int16 v107;
  void *v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HMDRapportMessageTransport__didReceiveRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_24E79A050;
  v11 = v10;
  v100 = v11;
  v12 = _Block_copy(aBlock);
  -[HMDRapportMessageTransport _rpOptions:stringForKey:](self, "_rpOptions:stringForKey:", v9, *MEMORY[0x24BE7CD00]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
  v15 = (void *)MEMORY[0x227676638]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v102 = v18;
    v103 = 2112;
    v104 = (uint64_t)v8;
    v105 = 2160;
    v106 = 1752392040;
    v107 = 2112;
    v108 = v14;
    v109 = 2112;
    v110 = v9;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Received message: %@, from: %{mask.hash}@, with options: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v15);
  v98 = 0;
  +[HMDRemoteMessageSerialization remoteMessageWithDictionary:isHH2Payload:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:isHH2Payload:error:", v8, 1, &v98);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v98;
  v21 = v20;
  v97 = (void *)v19;
  if (v19)
  {
    if (v13)
    {
      v22 = (void (**)(_QWORD, _QWORD))v12;
      if (v14)
      {
        -[HMDRapportMessageTransport _rpOptions:stringForKey:](v16, "_rpOptions:stringForKey:", v9, *MEMORY[0x24BE7CCD0]);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        if (v91)
        {
          v89 = v11;
          -[HMDRemoteMessageTransport accountRegistry](v16, "accountRegistry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "deviceForIDSIdentifier:", v14);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v90 = v24;
          if (v24)
          {
            objc_msgSend(v24, "remoteDestinationString");
            v25 = objc_claimAutoreleasedReturnValue();
            v88 = (void *)v25;
            if (v25)
            {
              v26 = v25;
              v22[2](v22, 0);
              objc_msgSend(v97, "userInfo");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)objc_msgSend(v27, "mutableCopy");

              v29 = v26;
              v30 = v28;
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("kIDSMessageSourceIDKey"));
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[HMDRapportMessageTransport transportType](v16, "transportType"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("kRemoteMessageTransportAttributionKey"));

              objc_msgSend(v8, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setObject:forKeyedSubscript:", v32, CFSTR("kIDSMessageResponseErrorDataKey"));

              objc_msgSend(v97, "internal");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v87 = v30;
              objc_msgSend(v33, "setUserInfo:", v30);

              v34 = [HMDRemoteDeviceMessageDestination alloc];
              objc_msgSend(v97, "destination");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "target");
              v93 = v21;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v34, "initWithTarget:device:", v36, v90);

              objc_msgSend(v97, "setDestination:", v86);
              objc_msgSend(v97, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
              objc_msgSend(v97, "setSecure:", -[HMDRapportMessageTransport isSecure](v16, "isSecure"));
              +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", v14);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v85, 0, 0, 0, v91);
              objc_msgSend(v97, "setSenderContext:", v37);

              -[HMDRapportMessageTransport logEventSubmitter](v16, "logEventSubmitter");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDRemoteMessageLogEvent receivedRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "receivedRemoteMessage:transportType:", v97, 6);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "submitLogEvent:", v39);

              -[HMDRapportMessageTransport remoteMessageListener](v16, "remoteMessageListener");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = -[HMDRapportMessageTransport transportType](v16, "transportType");
              objc_msgSend(v97, "senderContext");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "receivedRemoteMessageOverTransportType:remoteMessageSenderContext:", v41, v42);

              v21 = v93;
              -[HMFMessageTransport delegate](v16, "delegate");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "messageTransport:didReceiveMessage:", v16, v97);

            }
            else
            {
              v81 = (void *)MEMORY[0x227676638]();
              v82 = v16;
              HMFGetOSLogHandle();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v102 = v84;
                v103 = 2112;
                v104 = (uint64_t)v97;
                _os_log_impl(&dword_2218F0000, v83, OS_LOG_TYPE_ERROR, "%{public}@Could not find remote destination for incoming message: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v81);
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (*)(void (**)(_QWORD, _QWORD)))v22[2])(v22);
            }

            v11 = v89;
            v75 = v90;
            v80 = v88;
          }
          else
          {
            v76 = (void *)MEMORY[0x227676638]();
            v77 = v16;
            HMFGetOSLogHandle();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v102 = v79;
              v103 = 2160;
              v104 = 1752392040;
              v105 = 2112;
              v106 = (uint64_t)v13;
              v107 = 2112;
              v108 = v97;
              _os_log_impl(&dword_2218F0000, v78, OS_LOG_TYPE_ERROR, "%{public}@Could not find source device for sender IDS DeviceID: %{mask.hash}@ message: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v76);
            objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v22)[2](v22, v80);
            v11 = v89;
            v75 = 0;
          }

        }
        else
        {
          v64 = (void *)MEMORY[0x227676638]();
          v65 = v16;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v96 = v21;
            v67 = v64;
            v68 = v22;
            v69 = v9;
            v70 = v13;
            v71 = v8;
            v72 = v14;
            v73 = v11;
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v102 = v74;
            v103 = 2112;
            v104 = (uint64_t)v97;
            v105 = 2112;
            v106 = (uint64_t)v69;
            _os_log_impl(&dword_2218F0000, v66, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because pairing identity identifier is missing in options: %@", buf, 0x20u);

            v11 = v73;
            v14 = v72;
            v8 = v71;
            v13 = v70;
            v9 = v69;
            v22 = v68;
            v64 = v67;
            v21 = v96;
          }

          objc_autoreleasePoolPop(v64);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *))v22)[2](v22, v75);
        }

        goto LABEL_32;
      }
      v92 = v13;
      v95 = v20;
      v58 = v11;
      v59 = (void *)MEMORY[0x227676638]();
      v60 = v16;
      HMFGetOSLogHandle();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v102 = v62;
        v103 = 2112;
        v104 = (uint64_t)v97;
        v105 = 2112;
        v106 = (uint64_t)v9;
        _os_log_impl(&dword_2218F0000, v61, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is an invalid UUID in options: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v59);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, void *))v12 + 2))(v12, v63);

      v11 = v58;
      v22 = (void (**)(_QWORD, _QWORD))v12;
    }
    else
    {
      v92 = 0;
      v95 = v20;
      v22 = (void (**)(_QWORD, _QWORD))v12;
      v52 = v11;
      v53 = (void *)MEMORY[0x227676638]();
      v54 = v16;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v102 = v56;
        v103 = 2112;
        v104 = (uint64_t)v97;
        v105 = 2112;
        v106 = (uint64_t)v9;
        _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is missing in options: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v53);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v22)[2](v22, v57);

      v11 = v52;
    }
    v13 = v92;
    v21 = v95;
    goto LABEL_32;
  }
  v44 = (void *)MEMORY[0x227676638]();
  v45 = v16;
  HMFGetOSLogHandle();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v94 = v9;
    v47 = v13;
    v48 = v8;
    v49 = v14;
    v50 = v11;
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v102 = v51;
    v103 = 2112;
    v104 = (uint64_t)v48;
    v105 = 2160;
    v106 = 1752392040;
    v107 = 2112;
    v108 = v49;
    v109 = 2112;
    v110 = v21;
    _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid message, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

    v11 = v50;
    v14 = v49;
    v8 = v48;
    v13 = v47;
    v9 = v94;
  }

  objc_autoreleasePoolPop(v44);
  v22 = (void (**)(_QWORD, _QWORD))v12;
LABEL_32:

}

- (id)_rpOptions:(id)a3 stringForKey:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "hmf_stringForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (HMDRemoteMessageListener)remoteMessageListener
{
  return self->_remoteMessageListener;
}

- (void)setRemoteMessageListener:(id)a3
{
  objc_storeStrong((id *)&self->_remoteMessageListener, a3);
}

- (HMDRapportMessaging)rapportMessaging
{
  return self->_rapportMessaging;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_rapportMessaging, 0);
  objc_storeStrong((id *)&self->_remoteMessageListener, 0);
}

uint64_t __73__HMDRapportMessageTransport__didReceiveRequest_options_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = _Block_copy(*(const void **)(a1 + 40));
  v4 = v3;
  if (v3)
    (*((void (**)(void *, id))v3 + 2))(v3, v5);

  objc_msgSend(*(id *)(a1 + 32), "respondWithPayload:error:", 0, v5);
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138544386;
    v38 = v7;
    v39 = 2114;
    v40 = v8;
    v41 = 2160;
    v42 = 1752392040;
    v43 = 2112;
    v44 = v3;
    v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ to IDS DeviceID: %{mask.hash}@, with options: %{public}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 56), "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    objc_msgSend(v12, "devices");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v13;
    v35[1] = 3221225472;
    v35[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_21;
    v35[3] = &unk_24E78CCF8;
    v35[4] = *(_QWORD *)(a1 + 32);
    v36 = v3;
    objc_msgSend(v14, "na_firstObjectPassingTest:", v35);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDRemoteMessageLogEvent sentRemoteMessage:device:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:device:transportType:", *(_QWORD *)(a1 + 56), v15, 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "submitLogEvent:", v17);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", *(_QWORD *)(a1 + 56), 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "submitLogEvent:", v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "rapportMessaging");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
  v22 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "UUIDString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_2;
  v28[3] = &unk_24E78CD20;
  v28[4] = *(_QWORD *)(a1 + 32);
  v29 = *(id *)(a1 + 80);
  v30 = *(id *)(a1 + 88);
  v31 = v3;
  v34 = *(_QWORD *)(a1 + 120);
  v27 = *(_OWORD *)(a1 + 104);
  v25 = (id)v27;
  v33 = v27;
  v32 = *(id *)(a1 + 96);
  v26 = v3;
  objc_msgSend(v20, "sendRequest:requestID:destinationID:options:responseHandler:", v21, v22, v23, v24, v28);

}

uint64_t __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_21(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_IDSIdentifierForDevice:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 40));

  return v4;
}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x24BE7CD20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x227676638]();
  v12 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      v17 = *(void **)(a1 + 48);
      v18 = *(_QWORD *)(a1 + 56);
      v34 = 138544642;
      v35 = v15;
      v36 = 2114;
      v37 = v16;
      v38 = 2112;
      v39 = v17;
      v40 = 2112;
      v41 = v10;
      v42 = 2112;
      v43 = v18;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Message failed over rapport, %{public}@ / %@ with rapport xid %@, to IDS DeviceID: %@ with error: %@", (uint8_t *)&v34, 0x3Eu);

    }
    objc_autoreleasePoolPop(v11);
    v19 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 + 1, v19));
    v21 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 + 1, v21));
    v23 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(*(id *)(a1 + 56), "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "hmInternalErrorWithCode:description:reason:suggestion:underlyingError:", 3204, CFSTR("Partial communication failure"), v24, 0, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(void **)(a1 + 56);
      v34 = 138544130;
      v35 = v26;
      v36 = 2114;
      v37 = v27;
      v38 = 2112;
      v39 = v10;
      v40 = 2112;
      v41 = v28;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Message succeeded over rapport, %{public}@ with rapport xid %@, to IDS DeviceID: %@", (uint8_t *)&v34, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    v29 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    do
      v22 = __ldaxr(v29);
    while (__stlxr(v22 + 1, v29));
  }
  if (v22 + 1 == objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v30 = atomic_load((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    if (v30 >= objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      v31 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:underlyingError:", 3203, v9);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), 0, 0, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
  }

}

id __56__HMDRapportMessageTransport__IDSIdentifiersForMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_IDSIdentifierForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      v14 = 138543874;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not send message %{public}@ to destination %{public}@: invalid destination or device does not have an IDS DeviceID", (uint8_t *)&v14, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

void __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startPromise");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveWithFuture:", v1);

}

void __57__HMDRapportMessageTransport__configureHMMMEnergyRapport__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_didReceiveRequest:options:responseHandler:", v9, v8, v7);

}

void __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startPromise");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveWithFuture:", v1);

}

void __51__HMDRapportMessageTransport__configureHMMMRapport__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_didReceiveRequest:options:responseHandler:", v9, v8, v7);

}

void __47__HMDRapportMessageTransport__configureRapport__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startPromise");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F180], "futureWithNoValue");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveWithFuture:", v1);

}

void __47__HMDRapportMessageTransport__configureRapport__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_didReceiveRequest:options:responseHandler:", v9, v8, v7);

}

+ (unint64_t)restriction
{
  return 8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_175398 != -1)
    dispatch_once(&logCategory__hmf_once_t24_175398, &__block_literal_global_175399);
  return (id)logCategory__hmf_once_v25_175400;
}

void __41__HMDRapportMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_175400;
  logCategory__hmf_once_v25_175400 = v0;

}

@end
