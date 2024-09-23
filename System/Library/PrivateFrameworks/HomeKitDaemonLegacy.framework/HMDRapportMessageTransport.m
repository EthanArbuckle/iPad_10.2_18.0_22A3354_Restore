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

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Starting", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDRapportMessageTransport _configureRapport](v4, "_configureRapport");
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

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HMDRapportMessageTransport isValidMessage:](self, "isValidMessage:", v4))
  {
    -[HMDRapportMessageTransport _IDSIdentifiersForMessage:](self, "_IDSIdentifiersForMessage:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    v7 = v6 != 0;
    if (!v6)
    {
      v8 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Not sending message %{public}@ because no destination devices have an IDS DeviceID", (uint8_t *)&v14, 0x16u);

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
  char isKindOfClass;
  unint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v6 = ((unint64_t)objc_msgSend(v3, "restriction") >> 3) & 1;
  else
    LOBYTE(v6) = 0;

  return v6;
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
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke;
  v9[3] = &unk_1E89C2730;
  v9[4] = self;
  objc_msgSend(v3, "configureDiscoveryClientWithCompletion:", v9);

  objc_initWeak(&location, self);
  -[HMDRapportMessageTransport rapportMessaging](self, "rapportMessaging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __47__HMDRapportMessageTransport__configureRapport__block_invoke_2;
  v6[3] = &unk_1E89BA078;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "registerRequestHandler:", v6);

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
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  objc_msgSend(a3, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      v6 = v4;
    else
      v6 = 0;
    v7 = v6;
    v8 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      -[HMDRapportMessageTransport _IDSIdentifierForDestination:](self, "_IDSIdentifierForDestination:", v4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
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

  v21 = *MEMORY[0x1E0C80C00];
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

  v11 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Not updating IDS device identifier for device because it belongs to the current account: %@", (uint8_t *)&v17, 0x16u);

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
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Setting shared user's IDS device identifier for device: %@", (uint8_t *)&v17, 0x16u);

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

  v58 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v38 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke;
  aBlock[3] = &unk_1E89BFC88;
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
        v20 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "timeout");
        objc_msgSend(v20, "numberWithDouble:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0D839E0]);

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

      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_18;
      v39[3] = &unk_1E89B5EE0;
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
      v47 = v13;
      v48 = v12;
      objc_msgSend(v47, "na_each:", v39);

      _Block_object_dispose(v51, 8);
      _Block_object_dispose(buf, 8);

      v11 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_ERROR, "%{public}@Could not send message: failed to serialize message %{public}@ with error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      (*((void (**)(void *, id))v12 + 2))(v12, v37);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Could not send message %{public}@: No valid destinations", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter."), CFSTR("No destinations have a valid IDS DeviceID."), 0);
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
  +[HMDRemoteMessageSerialization dictionaryForMessage:error:](HMDRemoteMessageSerialization, "dictionaryForMessage:error:", v7, a5);
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
  void (**v12)(void *, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  HMDRapportMessageTransport *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDRemoteDeviceMessageDestination *v31;
  void *v32;
  void *v33;
  void *v34;
  HMDRemoteMessageSenderContext *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HMDRapportMessageTransport *v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void (**v47)(void *, _QWORD);
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
  void (**v58)(_QWORD, void *);
  id v59;
  void *v60;
  HMDRapportMessageTransport *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  HMDRapportMessageTransport *v65;
  NSObject *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  void (**v72)(void *, _QWORD);
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
  HMDRemoteDeviceMessageDestination *v85;
  void *v86;
  void *v87;
  id v88;
  void *context;
  void *contexta;
  void *v91;
  void *v92;
  id v93;
  id v94;
  _QWORD aBlock[4];
  id v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  void *v104;
  __int16 v105;
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HMDRapportMessageTransport__didReceiveRequest_options_responseHandler___block_invoke;
  aBlock[3] = &unk_1E89C1A48;
  v11 = v10;
  v96 = v11;
  v12 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  -[HMDRapportMessageTransport _rpOptions:stringForKey:](self, "_rpOptions:stringForKey:", v9, *MEMORY[0x1E0D839C8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v13);
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v98 = v18;
    v99 = 2112;
    v100 = (uint64_t)v8;
    v101 = 2160;
    v102 = 1752392040;
    v103 = 2112;
    v104 = v14;
    v105 = 2112;
    v106 = v9;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Received message: %@, from: %{mask.hash}@, with options: %@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v15);
  v94 = 0;
  +[HMDRemoteMessageSerialization remoteMessageWithDictionary:error:](HMDRemoteMessageSerialization, "remoteMessageWithDictionary:error:", v8, &v94);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v94;
  if (v19)
  {
    if (v13)
    {
      if (v14)
      {
        -[HMDRapportMessageTransport _rpOptions:stringForKey:](v16, "_rpOptions:stringForKey:", v9, *MEMORY[0x1E0D839B8]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v88 = v11;
          -[HMDRemoteMessageTransport accountRegistry](v16, "accountRegistry");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "deviceForIDSIdentifier:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          context = v22;
          v91 = v20;
          if (v22)
          {
            objc_msgSend(v22, "remoteDestinationString");
            v23 = objc_claimAutoreleasedReturnValue();
            v87 = (void *)v23;
            if (v23)
            {
              v24 = v23;
              v12[2](v12, 0);
              objc_msgSend(v19, "userInfo");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = (void *)objc_msgSend(v25, "mutableCopy");

              objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, CFSTR("kIDSMessageSourceIDKey"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HMDRapportMessageTransport transportType](v16, "transportType"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = v26;
              objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("kRemoteMessageTransportAttributionKey"));

              objc_msgSend(v8, "hmf_dataForKey:", CFSTR("kIDSMessageResponseErrorDataKey"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v86 = v28;
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("kIDSMessageResponseErrorDataKey"));

              objc_msgSend(v19, "internal");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "setUserInfo:", v28);

              v31 = [HMDRemoteDeviceMessageDestination alloc];
              objc_msgSend(v19, "destination");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "target");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v85 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v31, "initWithTarget:device:", v33, context);

              objc_msgSend(v19, "setDestination:", v85);
              objc_msgSend(v19, "setRestriction:", objc_msgSend((id)objc_opt_class(), "restriction"));
              objc_msgSend(v19, "setSecure:", -[HMDRapportMessageTransport isSecure](v16, "isSecure"));
              +[HMDDeviceHandle deviceHandleForDeviceIdentifier:](HMDDeviceHandle, "deviceHandleForDeviceIdentifier:", v14);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[HMDRemoteMessageSenderContext initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:]([HMDRemoteMessageSenderContext alloc], "initWithDeviceHandle:accountHandle:accountIdentifier:deviceVersion:pairingIdentityIdentifier:", v34, 0, 0, 0, v91);
              objc_msgSend(v19, "setSenderContext:", v35);

              -[HMDRapportMessageTransport logEventSubmitter](v16, "logEventSubmitter");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDRemoteMessageLogEvent receivedRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "receivedRemoteMessage:transportType:", v19, 6);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "submitLogEvent:", v37);

              -[HMFMessageTransport delegate](v16, "delegate");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "messageTransport:didReceiveMessage:", v16, v19);

              v39 = v86;
            }
            else
            {
              v81 = (void *)MEMORY[0x1D17BA0A0]();
              v82 = v16;
              HMFGetOSLogHandle();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v98 = v84;
                v99 = 2112;
                v100 = (uint64_t)v19;
                _os_log_impl(&dword_1CD062000, v83, OS_LOG_TYPE_ERROR, "%{public}@Could not find remote destination for incoming message: %@", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v81);
              objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(void *, void *))v12)[2](v12, v39);
            }

            v11 = v88;
            v75 = context;
            v20 = v91;
            v80 = v87;
          }
          else
          {
            v76 = (void *)MEMORY[0x1D17BA0A0]();
            v77 = v16;
            HMFGetOSLogHandle();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v98 = v79;
              v99 = 2160;
              v100 = 1752392040;
              v101 = 2112;
              v102 = (uint64_t)v13;
              v103 = 2112;
              v104 = v19;
              _os_log_impl(&dword_1CD062000, v78, OS_LOG_TYPE_ERROR, "%{public}@Could not find source device for sender IDS DeviceID: %{mask.hash}@ message: %@", buf, 0x2Au);

            }
            objc_autoreleasePoolPop(v76);
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(void *, void *))v12)[2](v12, v80);
            v11 = v88;
            v75 = 0;
            v20 = v91;
          }

        }
        else
        {
          contexta = (void *)MEMORY[0x1D17BA0A0]();
          v65 = v16;
          HMFGetOSLogHandle();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v67 = v19;
            v68 = v9;
            v69 = v13;
            v70 = v8;
            v71 = v14;
            v72 = v12;
            v73 = v11;
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v98 = v74;
            v99 = 2112;
            v100 = (uint64_t)v67;
            v101 = 2112;
            v102 = (uint64_t)v68;
            _os_log_impl(&dword_1CD062000, v66, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because pairing identity identifier is missing in options: %@", buf, 0x20u);

            v11 = v73;
            v12 = v72;
            v14 = v71;
            v8 = v70;
            v13 = v69;
            v9 = v68;
            v19 = v67;
            v20 = 0;
          }

          objc_autoreleasePoolPop(contexta);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(void *, void *))v12)[2](v12, v75);
        }

        goto LABEL_32;
      }
      v92 = v13;
      v50 = v8;
      v51 = 0;
      v58 = (void (**)(_QWORD, void *))v12;
      v59 = v11;
      v60 = (void *)MEMORY[0x1D17BA0A0]();
      v61 = v16;
      HMFGetOSLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v63;
        v99 = 2112;
        v100 = (uint64_t)v19;
        v101 = 2112;
        v102 = (uint64_t)v9;
        _os_log_impl(&dword_1CD062000, v62, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is an invalid UUID in options: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v60);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v58[2](v58, v64);

      v11 = v59;
      v12 = (void (**)(void *, _QWORD))v58;
    }
    else
    {
      v92 = 0;
      v50 = v8;
      v51 = v14;
      v52 = v11;
      v53 = (void *)MEMORY[0x1D17BA0A0]();
      v54 = v16;
      HMFGetOSLogHandle();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v98 = v56;
        v99 = 2112;
        v100 = (uint64_t)v19;
        v101 = 2112;
        v102 = (uint64_t)v9;
        _os_log_impl(&dword_1CD062000, v55, OS_LOG_TYPE_ERROR, "%{public}@Rejecting incoming message, %@, because IDS Device ID is missing in options: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v53);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(void *, void *))v12)[2](v12, v57);

      v11 = v52;
    }
    v14 = v51;
    v8 = v50;
    v13 = v92;
    goto LABEL_32;
  }
  v40 = (void *)MEMORY[0x1D17BA0A0]();
  v41 = v16;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v43 = v9;
    v44 = v13;
    v45 = v8;
    v46 = v14;
    v47 = v12;
    v48 = v11;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v98 = v49;
    v99 = 2112;
    v100 = (uint64_t)v45;
    v101 = 2160;
    v102 = 1752392040;
    v103 = 2112;
    v104 = v46;
    v105 = 2112;
    v106 = v93;
    _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Dropping invalid message, %@, from: %{mask.hash}@, error: %@", buf, 0x34u);

    v11 = v48;
    v12 = v47;
    v14 = v46;
    v8 = v45;
    v13 = v44;
    v9 = v43;
    v19 = 0;
  }

  objc_autoreleasePoolPop(v40);
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

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_18(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
    v26 = v7;
    v27 = 2114;
    v28 = v8;
    v29 = 2160;
    v30 = 1752392040;
    v31 = 2112;
    v32 = v3;
    v33 = 2114;
    v34 = v9;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Sending message %{public}@ to IDS DeviceID: %{mask.hash}@, with options: %{public}@", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(*(id *)(a1 + 32), "logEventSubmitter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessageLogEvent sentRemoteMessage:transportType:](HMDRemoteMessageLogEvent, "sentRemoteMessage:transportType:", *(_QWORD *)(a1 + 56), 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitLogEvent:", v11);

  objc_msgSend(*(id *)(a1 + 32), "rapportMessaging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(*(id *)(a1 + 64), "copy");
  v14 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v3, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_20;
  v18[3] = &unk_1E89B5EB8;
  v18[4] = *(_QWORD *)(a1 + 32);
  v19 = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 88);
  v21 = v3;
  v24 = *(_OWORD *)(a1 + 112);
  v22 = *(id *)(a1 + 96);
  v23 = *(id *)(a1 + 104);
  v17 = v3;
  objc_msgSend(v12, "sendRequest:requestID:destinationID:options:responseHandler:", v13, v14, v15, v16, v18);

}

void __71__HMDRapportMessageTransport__sendMessage_completionHandler_requestID___block_invoke_20(uint64_t a1, void *a2, void *a3, void *a4)
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
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "hmf_numberForKey:", *MEMORY[0x1E0D839E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D17BA0A0]();
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
      v30 = 138544642;
      v31 = v15;
      v32 = 2114;
      v33 = v16;
      v34 = 2112;
      v35 = v17;
      v36 = 2112;
      v37 = v10;
      v38 = 2112;
      v39 = v18;
      v40 = 2112;
      v41 = v9;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Message failed over rapport, %{public}@ / %@ with rapport xid %@, to IDS DeviceID: %@ with error: %@", (uint8_t *)&v30, 0x3Eu);

    }
    objc_autoreleasePoolPop(v11);
    v19 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 + 1, v19));
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 40);
      v23 = *(void **)(a1 + 56);
      v30 = 138544130;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v23;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Message succeeded over rapport, %{public}@ with rapport xid %@, to IDS DeviceID: %@", (uint8_t *)&v30, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
  }
  v24 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  do
    v25 = __ldaxr(v24);
  while (__stlxr(v25 + 1, v24));
  if (v25 + 1 == objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v26 = atomic_load((unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    if (v26 >= objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:underlyingError:", 3203, v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "hmErrorWithCode:description:reason:suggestion:underlyingError:", 54, CFSTR("Communication failure."), 0, 0, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    }
  }

}

void __47__HMDRapportMessageTransport__configureRapport__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "startPromise");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D28588], "futureWithNoValue");
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
  if (logCategory__hmf_once_t19_127373 != -1)
    dispatch_once(&logCategory__hmf_once_t19_127373, &__block_literal_global_127374);
  return (id)logCategory__hmf_once_v20_127375;
}

void __41__HMDRapportMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_127375;
  logCategory__hmf_once_v20_127375 = v0;

}

@end
