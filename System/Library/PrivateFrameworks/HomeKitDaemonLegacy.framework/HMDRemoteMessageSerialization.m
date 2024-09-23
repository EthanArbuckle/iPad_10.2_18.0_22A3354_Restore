@implementation HMDRemoteMessageSerialization

+ (BOOL)legacyNotificationMessage:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("kCharacteristicValueUpdatedNotificationKey")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("kMultipleCharacteristicValuesUpdatedNotificationKey"));

  return v4;
}

+ (id)remoteMessageWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDRemoteMessage *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  HMDRemoteMessage *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  HMDHomeKitVersion *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  void *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hmf_stringForKey:", CFSTR("kIDSMessageNameKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), CFSTR("The message name is missing"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_52;
  }
  objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kIDSMessageIdentifierKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kIDSMessageTargetKey"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kIDSMessagePayloadKey"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kIDSMessageRequiresResponseKey")))
    {
      objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v57 = 0;
        goto LABEL_19;
      }
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("The transaction identifier is required for requests");
LABEL_16:
      objc_msgSend(v15, "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), v16, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
LABEL_50:

      goto LABEL_51;
    }
    if (objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kIDSMessageIsResponseToRequest")))
    {
      objc_msgSend(v6, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = CFSTR("The transaction identifier is required for request-responses");
        goto LABEL_16;
      }
      v10 = (void *)v13;
      v14 = 1;
    }
    else if ((objc_msgSend(v6, "hmf_BOOLForKey:", CFSTR("kIDSMessageIsNotificationKey")) & 1) != 0
           || objc_msgSend(a1, "legacyNotificationMessage:", v7))
    {
      v10 = 0;
      v14 = 2;
    }
    else
    {
      v10 = 0;
      v14 = 3;
    }
    v57 = v14;
LABEL_19:
    objc_msgSend(v6, "hmf_dictionaryForKey:", CFSTR("kRemoteMessageHeadersKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __67__HMDRemoteMessageSerialization_remoteMessageWithDictionary_error___block_invoke;
      v61[3] = &unk_1E89C1C10;
      v19 = v18;
      v62 = v19;
      objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v61);
      if (objc_msgSend(v19, "count"))
        v20 = (void *)objc_msgSend(v19, "copy");
      else
        v20 = 0;

    }
    else
    {
      v20 = 0;
    }
    v58 = v8;

    if (v60)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0D285D8]), "initWithTarget:", v60);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D285D8], "allMessageDestinations");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kRemoteMessageQoSKey"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v23, "integerValue");
      if (HMFQualityOfServiceCompare() == 1)
      {
        v25 = &unk_1E8B35250;
      }
      else
      {
        objc_msgSend(v24, "integerValue");
        if (HMFQualityOfServiceCompare()
          || ((v49 = (void *)MEMORY[0x1E0CB37E8], v50 = objc_msgSend(v24, "integerValue"), v50 <= 17)
            ? (v51 = 17)
            : (v51 = v50),
              v51 != 21 ? (v52 = v51) : (v52 = 17),
              objc_msgSend(v49, "numberWithInteger:", v52),
              (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v33 = [HMDRemoteMessage alloc];
          goto LABEL_39;
        }
      }
      v26 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v55 = v20;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "integerValue");
        HMFQualityOfServiceToString();
        v54 = v26;
        v29 = v22;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "integerValue");
        HMFQualityOfServiceToString();
        v56 = v10;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v64 = v28;
        v65 = 2112;
        v66 = v30;
        v67 = 2112;
        v68 = v31;
        v69 = 2112;
        v70 = v7;
        v71 = 2112;
        v72 = v58;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Changing the QoS (%@ -> %@) of remote message: %@ (%@)", buf, 0x34u);

        v10 = v56;
        v22 = v29;
        v26 = v54;

        v20 = v55;
      }

      objc_autoreleasePoolPop(v26);
      v32 = v25;

      v33 = [HMDRemoteMessage alloc];
      if (v32)
      {
        v24 = v32;
LABEL_39:
        v34 = objc_msgSend(v24, "integerValue");

        goto LABEL_40;
      }
    }
    else
    {
      v33 = [HMDRemoteMessage alloc];
    }
    v34 = 17;
LABEL_40:
    LOBYTE(v53) = 0;
    v12 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:](v33, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:", v7, v34, v22, v59, v20, v57, 0.0, v53);
    if (v12)
    {
      v35 = v22;
      v36 = v20;
      objc_msgSend(v6, "hmf_stringForKey:", CFSTR("dv"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
      {
        v38 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v37);
        -[HMDRemoteMessage setSourceVersion:](v12, "setSourceVersion:", v38);

      }
      -[HMDRemoteMessage setIdentifier:](v12, "setIdentifier:", v58);
      v39 = v10;
      -[HMDRemoteMessage setTransactionIdentifier:](v12, "setTransactionIdentifier:", v10);
      objc_msgSend(v6, "hmf_numberForKey:", CFSTR("kRemoteMessageResponseRestrictionKey"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "unsignedIntegerValue");

      if (v41)
        -[HMDRemoteMessage setResponseRestriction:](v12, "setResponseRestriction:", v41);

      v11 = 0;
      v10 = v39;
      v20 = v36;
      v22 = v35;
    }
    else
    {
      v42 = (void *)MEMORY[0x1D17BA0A0]();
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = v22;
        v45 = v20;
        v46 = v10;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v64 = v47;
        v65 = 2112;
        v66 = v6;
        _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to create message with message dictionary: %@", buf, 0x16u);

        v10 = v46;
        v20 = v45;
        v22 = v44;
      }

      objc_autoreleasePoolPop(v42);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v8 = v58;
    goto LABEL_50;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), CFSTR("The message identifier is missing"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
LABEL_51:

LABEL_52:
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v12;
}

+ (id)dictionaryForMessage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  char isKindOfClass;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  int v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("kIDSMessageNameKey"));

    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("kIDSMessageIdentifierKey"));

    objc_msgSend(v6, "destination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("kIDSMessageTargetKey"));

    objc_msgSend(v6, "messagePayload");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v6, "messagePayload");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v15) = objc_msgSend(v15, "propertyList:isValidForFormat:", v16, 200);

      if ((v15 & 1) == 0)
      {
        v41 = MEMORY[0x1D17BA0A0]();
        HMFGetOSLogHandle();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "messagePayload");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = 138543618;
          v53 = v43;
          v54 = 2112;
          v55 = v44;
          _os_log_impl(&dword_1CD062000, v42, OS_LOG_TYPE_ERROR, "%{public}@Invalid message payload: %@", (uint8_t *)&v52, 0x16u);

        }
        v45 = (void *)v41;
        goto LABEL_33;
      }
      objc_msgSend(v6, "messagePayload");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("kIDSMessagePayloadKey"));

    }
    objc_msgSend(v6, "headers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (!v19)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "qualityOfService"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v23, CFSTR("kRemoteMessageQoSKey"));

      v24 = v6;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v26 = v24;
      else
        v26 = 0;
      v27 = v26;

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v24, "transactionIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          objc_msgSend(v24, "transactionIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "UUIDString");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("kIDSMessageRequestTransactionIDKey"));

        }
        v31 = objc_msgSend(v24, "type");
        if (v31 <= 2)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *off_1E89C1CC8[v31]);
        if (objc_msgSend(v24, "isSecure"))
        {
          +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "versionString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("dv"));

        }
        v34 = objc_msgSend(v24, "remoteResponseRestriction");
        if (v34 != -1)
        {
          v35 = v34;
          if (!objc_msgSend(v24, "type"))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v36, CFSTR("kRemoteMessageResponseRestrictionKey"));

          }
        }
      }
      v37 = v7;

      goto LABEL_36;
    }
    v20 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v6, "headers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = objc_msgSend(v20, "propertyList:isValidForFormat:", v21, 200);

    if ((v20 & 1) != 0)
    {
      objc_msgSend(v6, "headers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("kRemoteMessageHeadersKey"));

      goto LABEL_8;
    }
    v46 = MEMORY[0x1D17BA0A0]();
    v47 = a1;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "headers");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543618;
      v53 = v49;
      v54 = 2112;
      v55 = v50;
      _os_log_impl(&dword_1CD062000, v48, OS_LOG_TYPE_ERROR, "%{public}@Invalid message headers: %@", (uint8_t *)&v52, 0x16u);

    }
    v45 = (void *)v46;
LABEL_33:
    objc_autoreleasePoolPop(v45);
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 22);
      v37 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }
LABEL_36:

    goto LABEL_37;
  }
  v38 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 138543362;
    v53 = v40;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Message parameter is required", (uint8_t *)&v52, 0xCu);

  }
  objc_autoreleasePoolPop(v38);
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v37 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v37 = 0;
  }
LABEL_37:

  return v37;
}

void __67__HMDRemoteMessageSerialization_remoteMessageWithDictionary_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v8;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

@end
