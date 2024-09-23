@implementation HMDRemoteMessageSerialization

+ (id)remoteMessageWithDictionary:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "remoteMessageWithDictionary:isHH2Payload:error:", a3, 0, a4);
}

+ (id)remoteMessageWithDictionary:(id)a3 isHH2Payload:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HMDRemoteMessage *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  HMDRemoteMessage *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  HMDHomeKitVersion *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v6 = a4;
  v76 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "hmf_stringForKey:", CFSTR("kIDSMessageNameKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), CFSTR("The message name is missing"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_53;
  }
  objc_opt_self();
  if (v6)
    v9 = CFSTR("id");
  else
    v9 = CFSTR("kIDSMessageIdentifierKey");
  objc_msgSend(v7, "hmf_UUIDForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("kIDSMessageTargetKey"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("kIDSMessagePayloadKey"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("kIDSMessageRequiresResponseKey")))
    {
      objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v12 = (void *)v11;
        v60 = 0;
        goto LABEL_17;
      }
      v22 = (void *)MEMORY[0x24BDD1540];
      v23 = CFSTR("The transaction identifier is required for requests");
LABEL_50:
      objc_msgSend(v22, "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), v23, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
LABEL_51:

      goto LABEL_52;
    }
    if (objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("kIDSMessageIsResponseToRequest")))
    {
      objc_msgSend(v7, "hmf_UUIDForKey:", CFSTR("kIDSMessageRequestTransactionIDKey"));
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v22 = (void *)MEMORY[0x24BDD1540];
        v23 = CFSTR("The transaction identifier is required for request-responses");
        goto LABEL_50;
      }
      v12 = (void *)v15;
      v16 = 1;
    }
    else
    {
      v17 = objc_msgSend(v7, "hmf_BOOLForKey:", CFSTR("kIDSMessageIsNotificationKey"));
      v12 = 0;
      v16 = 2;
      if (!v17)
        v16 = 3;
    }
    v60 = v16;
LABEL_17:
    objc_msgSend(v7, "hmf_dictionaryForKey:", CFSTR("kRemoteMessageHeadersKey"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __80__HMDRemoteMessageSerialization_remoteMessageWithDictionary_isHH2Payload_error___block_invoke;
      v64[3] = &unk_24E79B060;
      v20 = v19;
      v65 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v64);
      if (objc_msgSend(v20, "count"))
        v21 = (void *)objc_msgSend(v20, "copy");
      else
        v21 = 0;

    }
    else
    {
      v21 = 0;
    }
    v61 = v10;

    if (v63)
    {
      v24 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F1B8]), "initWithTarget:", v63);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE3F1B8], "allMessageDestinations");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v24;
    objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kRemoteMessageQoSKey"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v27 = v26;
      objc_msgSend(v26, "integerValue");
      if (HMFQualityOfServiceCompare() == 1)
      {
        v28 = &unk_24E96D5F8;
      }
      else
      {
        objc_msgSend(v27, "integerValue");
        if (HMFQualityOfServiceCompare()
          || ((v52 = (void *)MEMORY[0x24BDD16E0], v53 = objc_msgSend(v27, "integerValue"), v53 <= 17)
            ? (v54 = 17)
            : (v54 = v53),
              v54 != 21 ? (v55 = v54) : (v55 = 17),
              objc_msgSend(v52, "numberWithInteger:", v55),
              (v28 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v36 = [HMDRemoteMessage alloc];
          goto LABEL_38;
        }
      }
      v29 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v58 = v21;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "integerValue");
        HMFQualityOfServiceToString();
        v57 = v29;
        v32 = v25;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "integerValue");
        HMFQualityOfServiceToString();
        v59 = v12;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v67 = v31;
        v68 = 2112;
        v69 = v33;
        v70 = 2112;
        v71 = v34;
        v72 = 2112;
        v73 = v8;
        v74 = 2112;
        v75 = v61;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Changing the QoS (%@ -> %@) of remote message: %@ (%@)", buf, 0x34u);

        v12 = v59;
        v25 = v32;
        v29 = v57;

        v21 = v58;
      }

      objc_autoreleasePoolPop(v29);
      v35 = v28;

      v36 = [HMDRemoteMessage alloc];
      if (v35)
      {
        v27 = v35;
LABEL_38:
        v37 = objc_msgSend(v27, "integerValue");

        goto LABEL_39;
      }
    }
    else
    {
      v36 = [HMDRemoteMessage alloc];
    }
    v37 = 17;
LABEL_39:
    LOBYTE(v56) = 0;
    v14 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:](v36, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:", v8, v37, v25, v62, v21, v60, 0.0, v56);
    if (v14)
    {
      v38 = v25;
      v39 = v21;
      objc_msgSend(v7, "hmf_stringForKey:", CFSTR("dv"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        v41 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", v40);
        -[HMDRemoteMessage setSourceVersion:](v14, "setSourceVersion:", v41);

      }
      -[HMDRemoteMessage setIdentifier:](v14, "setIdentifier:", v61);
      v42 = v12;
      -[HMDRemoteMessage setTransactionIdentifier:](v14, "setTransactionIdentifier:", v12);
      objc_msgSend(v7, "hmf_numberForKey:", CFSTR("kRemoteMessageResponseRestrictionKey"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "unsignedIntegerValue");

      if (v44)
        -[HMDRemoteMessage setResponseRestriction:](v14, "setResponseRestriction:", v44);

      v13 = 0;
      v12 = v42;
      v21 = v39;
      v25 = v38;
    }
    else
    {
      v45 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = v25;
        v48 = v21;
        v49 = v12;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v50;
        v68 = 2112;
        v69 = v7;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to create message with message dictionary: %@", buf, 0x16u);

        v12 = v49;
        v21 = v48;
        v25 = v47;
      }

      objc_autoreleasePoolPop(v45);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v10 = v61;
    goto LABEL_51;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 3, CFSTR("Invalid parameter"), CFSTR("The message identifier is missing"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
LABEL_52:

LABEL_53:
  if (a5)
    *a5 = objc_retainAutorelease(v13);

  return v14;
}

+ (id)dictionaryForMessage:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "dictionaryForMessage:isHH2Payload:error:", a3, 0, a4);
}

+ (id)dictionaryForMessage:(id)a3 isHH2Payload:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
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
  void *v25;
  void *v26;
  id v27;
  char isKindOfClass;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  int v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v6 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("kIDSMessageNameKey"));

    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    if (v6)
      v13 = CFSTR("id");
    else
      v13 = CFSTR("kIDSMessageIdentifierKey");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v13);

    objc_msgSend(v8, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "target");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("kIDSMessageTargetKey"));

    objc_msgSend(v8, "messagePayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = (void *)MEMORY[0x24BDD1770];
      objc_msgSend(v8, "messagePayload");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v18) = objc_msgSend(v18, "propertyList:isValidForFormat:", v19, 200);

      if ((v18 & 1) == 0)
      {
        v44 = MEMORY[0x227676638]();
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "messagePayload");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 138543618;
          v56 = v46;
          v57 = 2112;
          v58 = v47;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_ERROR, "%{public}@Invalid message payload: %@", (uint8_t *)&v55, 0x16u);

        }
        v48 = (void *)v44;
        goto LABEL_36;
      }
      objc_msgSend(v8, "messagePayload");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("kIDSMessagePayloadKey"));

    }
    objc_msgSend(v8, "headers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "qualityOfService"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("kRemoteMessageQoSKey"));

      v27 = v8;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v29 = v27;
      else
        v29 = 0;
      v30 = v29;

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v27, "transactionIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          objc_msgSend(v27, "transactionIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "UUIDString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v33, CFSTR("kIDSMessageRequestTransactionIDKey"));

        }
        v34 = objc_msgSend(v27, "type");
        if (v34 <= 2)
          objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *off_24E79B118[v34]);
        if (objc_msgSend(v27, "isSecure"))
        {
          +[HMDHomeKitVersion currentVersion](HMDHomeKitVersion, "currentVersion");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "versionString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, CFSTR("dv"));

        }
        v37 = objc_msgSend(v27, "remoteResponseRestriction");
        if (v37 != -1)
        {
          v38 = v37;
          if (!objc_msgSend(v27, "type"))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v39, CFSTR("kRemoteMessageResponseRestrictionKey"));

          }
        }
      }
      v40 = v9;

      goto LABEL_39;
    }
    v23 = (void *)MEMORY[0x24BDD1770];
    objc_msgSend(v8, "headers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_msgSend(v23, "propertyList:isValidForFormat:", v24, 200);

    if ((v23 & 1) != 0)
    {
      objc_msgSend(v8, "headers");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("kRemoteMessageHeadersKey"));

      goto LABEL_11;
    }
    v49 = MEMORY[0x227676638]();
    v50 = a1;
    HMFGetOSLogHandle();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "headers");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 138543618;
      v56 = v52;
      v57 = 2112;
      v58 = v53;
      _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@Invalid message headers: %@", (uint8_t *)&v55, 0x16u);

    }
    v48 = (void *)v49;
LABEL_36:
    objc_autoreleasePoolPop(v48);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
      v40 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v40 = 0;
    }
LABEL_39:

    goto LABEL_40;
  }
  v41 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 138543362;
    v56 = v43;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_ERROR, "%{public}@Message parameter is required", (uint8_t *)&v55, 0xCu);

  }
  objc_autoreleasePoolPop(v41);
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
    v40 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
LABEL_40:

  return v40;
}

void __80__HMDRemoteMessageSerialization_remoteMessageWithDictionary_isHH2Payload_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
