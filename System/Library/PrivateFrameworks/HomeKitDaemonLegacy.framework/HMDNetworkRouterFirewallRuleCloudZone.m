@implementation HMDNetworkRouterFirewallRuleCloudZone

- (id)decodeModelFrom:(id)a3 recordSource:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  HMDCloudPairedMetadata *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v38;
  void *v39;
  void *v40;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id *v69;
  id *v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  id v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[HMDNetworkRouterFirewallRuleCloudZone signatureVerificationPublicKeys](self, "signatureVerificationPublicKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0;
  v82 = 0;
  LODWORD(v8) = objc_msgSend(v8, "verifyNetworkDeclarationsFromRecord:signatureVerificationPublicKeys:baseAccessoryIdentifier:data:error:", v7, v9, &v82, &v81, a5);
  v10 = v82;
  v11 = (unint64_t)v81;

  if (!(_DWORD)v8)
  {
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    objc_opt_class();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v64 = v10;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordID");
      v71 = v7;
      v75 = v11;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "zoneID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "zoneName");
      v19 = a5;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "recordID");
      v67 = v13;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *v19;
      *(_DWORD *)buf = 138544130;
      v84 = v16;
      v85 = 2112;
      v86 = v20;
      v87 = 2112;
      v88 = v22;
      v89 = 2112;
      v90 = v23;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Signature verification of fetched network declarations failed for record %@/%@ with error %@", buf, 0x2Au);

      v13 = v67;
      a5 = v19;

      v7 = v71;
      v11 = v75;

      v10 = v64;
    }

    objc_autoreleasePoolPop(v13);
LABEL_7:
    v24 = (void *)objc_opt_class();
    -[HMDNetworkRouterFirewallRuleCloudZone signatureVerificationPublicKeys](self, "signatureVerificationPublicKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend((id)objc_opt_class(), "__maxSizeForCKRecordPairedMetadata");
    v79 = 0;
    v80 = v10;
    LODWORD(v24) = objc_msgSend(v24, "__verifyDataFromRecord:signatureVerificationPublicKeys:dataKey:dataAssetKey:maxDataSize:signatureKey:signatureAssetKey:maxSignatureSize:baseAccessoryIdentifier:data:error:", v7, v25, CFSTR("CD_pairedMetadata"), CFSTR("CD_pairedMetadata_ckAsset"), v26, CFSTR("CD_pairedMetadataSignature"), CFSTR("CD_pairedMetadataSignature_ckAsset"), objc_msgSend((id)objc_opt_class(), "__maxSizeForCKRecordPairedMetadataSignature"), &v80, &v79, a5);
    v27 = v80;

    v28 = (unint64_t)v79;
    if ((_DWORD)v24)
    {
      v29 = -[HMDCloudPairedMetadata initWithBaseAccessoryIdentifier:data:]([HMDCloudPairedMetadata alloc], "initWithBaseAccessoryIdentifier:data:", v27, v28);
      if (!v29)
      {
        v52 = (void *)MEMORY[0x1D17BA0A0]();
        objc_opt_class();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        HMFGetOSLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v78 = v11;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "recordID");
          v66 = v52;
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "zoneID");
          v74 = v27;
          v57 = v7;
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "zoneName");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "recordID");
          v70 = a5;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "recordName");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v84 = v55;
          v85 = 2112;
          v86 = v59;
          v87 = 2112;
          v88 = v61;
          _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_ERROR, "%{public}@Fetched Paired metadata failed to parse for record %@/%@", buf, 0x20u);

          a5 = v70;
          v7 = v57;
          v27 = v74;

          v52 = v66;
          v11 = v78;
        }

        objc_autoreleasePoolPop(v52);
        if (a5)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
          v41 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_24;
        }
LABEL_23:
        v41 = 0;
        goto LABEL_24;
      }

    }
    else
    {
      v76 = v11;
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      objc_opt_class();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "recordID");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "zoneID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "zoneName");
        v68 = v30;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "recordID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "recordName");
        v72 = v27;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *a5;
        *(_DWORD *)buf = 138544130;
        v84 = v63;
        v85 = 2112;
        v86 = v34;
        v87 = 2112;
        v88 = v36;
        v89 = 2112;
        v90 = v37;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Signature verification of fetched Paired metadata failed for record %@/%@ with error %@", buf, 0x2Au);

        v27 = v72;
        v30 = v68;

      }
      objc_autoreleasePoolPop(v30);
      v11 = v76;
    }
    if (v11 | v28)
    {
      v38 = [HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel alloc];
      -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "recordID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel initWithCloudZoneID:recordID:networkDeclarationsData:pairedMetadataData:](v38, "initWithCloudZoneID:recordID:networkDeclarationsData:pairedMetadataData:", v39, v40, v11, v28);

LABEL_24:
      goto LABEL_25;
    }
    goto LABEL_23;
  }
  v12 = -[HMDNetworkRouterFirewallRuleCloudNetworkDeclarations initWithBaseAccessoryIdentifier:data:]([HMDNetworkRouterFirewallRuleCloudNetworkDeclarations alloc], "initWithBaseAccessoryIdentifier:data:", v10, v11);
  if (v12)
  {

    goto LABEL_7;
  }
  v42 = (void *)MEMORY[0x1D17BA0A0]();
  objc_opt_class();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  HMFGetOSLogHandle();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordID");
    v73 = v42;
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "zoneID");
    v69 = a5;
    v77 = v11;
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "zoneName");
    v48 = v7;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "recordID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "recordName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v84 = v45;
    v85 = 2112;
    v86 = v49;
    v87 = 2112;
    v88 = v51;
    _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Fetched network declarations failed to parse for record %@/%@", buf, 0x20u);

    v7 = v48;
    v11 = v77;
    a5 = v69;

    v42 = v73;
  }

  objc_autoreleasePoolPop(v42);
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 43);
    v41 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = 0;
  }
  v27 = v10;
LABEL_25:

  return v41;
}

+ (unint64_t)__maxSizeFromPreferenceWithKey:(id)a3 defaultValue:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (isInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "numberValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "numberValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      a4 = objc_msgSend(v9, "unsignedIntegerValue");

    }
  }

  return a4;
}

+ (unint64_t)__maxSizeForCKRecordNetworkDeclarations
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleCloudZoneNetworkDeclarationsMaxSize"), 10485760);
}

+ (unint64_t)__maxSizeForCKRecordNetworkDeclarationsSignature
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleCloudZoneNetworkDeclarationsSignatureMaxSize"), 1024);
}

+ (unint64_t)__maxSizeForCKRecordPairedMetadata
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleCloudZonePairedMetadataMaxSize"), 10485760);
}

+ (unint64_t)__maxSizeForCKRecordPairedMetadataSignature
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleCloudZonePairedMetadataSignatureMaxSize"), 1024);
}

+ (unint64_t)__maxSizeForCKRecordString
{
  return objc_msgSend(a1, "__maxSizeFromPreferenceWithKey:defaultValue:", CFSTR("HMDNetworkRouterFirewallRuleCloudZoneStringMaxSize"), 256);
}

+ (id)__createBaseAccessoryIdentifierFromRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  HMDNetworkRouterFirewallRuleAccessoryIdentifier *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  stringFromCKRecord(v6, CFSTR("CD_productGroup"), CFSTR("CD_productGroup_ckAsset"), objc_msgSend(a1, "__maxSizeForCKRecordString"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    stringFromCKRecord(v6, CFSTR("CD_productNumber"), CFSTR("CD_productNumber_ckAsset"), objc_msgSend(a1, "__maxSizeForCKRecordString"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v19 = 0;
LABEL_19:

      goto LABEL_20;
    }
    v33 = a4;
    v34 = v8;
    v9 = -[HMDNetworkRouterFirewallRuleAccessoryIdentifier initWithProductGroup:productNumber:firmwareVersion:]([HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc], "initWithProductGroup:productNumber:firmwareVersion:", v7, v8, 0);
    -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitZoneName](v9, "cloudKitZoneName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "zoneName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v10, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      -[HMDNetworkRouterFirewallRuleAccessoryIdentifier cloudKitRecordName](v9, "cloudKitRecordName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "recordName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v15, "isEqualToString:", v17);

      if ((v18 & 1) == 0)
      {
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = a1;
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        v8 = v34;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "recordID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "hmbDescription");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v36 = v29;
          v37 = 2112;
          v38 = CFSTR("CD_productNumber");
          v39 = 2112;
          v40 = v34;
          v41 = 2112;
          v42 = v31;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_ERROR, "%{public}@'%@' field value '%@' does not match record name on %@", buf, 0x2Au);

        }
        objc_autoreleasePoolPop(v26);
        if (v33)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
          v19 = 0;
          *v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = 0;
        }
        goto LABEL_18;
      }
      v19 = v9;
    }
    else
    {
      v20 = (void *)MEMORY[0x1D17BA0A0]();
      v21 = a1;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "hmbDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v23;
        v37 = 2112;
        v38 = CFSTR("CD_productGroup");
        v39 = 2112;
        v40 = v7;
        v41 = 2112;
        v42 = v25;
        _os_log_impl(&dword_1CD062000, v22, OS_LOG_TYPE_ERROR, "%{public}@'%@' field value '%@' does not match zone name on %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v20);
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
        v19 = 0;
        *v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v19 = 0;
      }
    }
    v8 = v34;
LABEL_18:

    goto LABEL_19;
  }
  v19 = 0;
LABEL_20:

  return v19;
}

+ (id)__calculateDigestDataFromRecord:(id)a3 dataKey:(id)a4 dataAssetKey:(id)a5 maxDataSize:(unint64_t)a6 error:(id *)a7
{
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  id v44;
  uint64_t v45;
  unint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD *v61;
  void *v62;
  void *v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD *v82;
  _QWORD *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CC_SHA256_CTX c;
  uint8_t v89[4];
  void *v90;
  __int16 v91;
  uint64_t v92;
  __int16 v93;
  void *v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  _BYTE v99[128];
  _QWORD v100[5];

  v7 = MEMORY[0x1E0C80A78](a1);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)v7;
  v100[2] = *MEMORY[0x1E0C80C00];
  v18 = v17;
  v19 = v15;
  v20 = v13;
  v21 = v18;
  v22 = v19;
  v23 = v20;
  if (v23)
  {
    filePathFromCKRecordOptionalAssetField(v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      createInputStreamWithFilePath(v24, v9);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        goto LABEL_15;
      }
    }

  }
  dataFromCKRecordRequiredField(v21, v22, v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithData:", v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v28;
    if (v28)
    {
      v29 = v28;
    }
    else
    {
      v78 = v16;
      v82 = v9;
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      objc_opt_class();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v96 = v33;
        v97 = 2112;
        v98 = v25;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_ERROR, "%{public}@Failed to create input stream with data: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v16 = v78;
      v9 = v82;
      if (v82)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 52);
        *v82 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    v27 = 0;
  }
LABEL_15:

  if (v27)
  {
    v79 = v16;
    v83 = v9;
    v77 = v22;
    objc_msgSend(v21, "recordID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "zoneID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "zoneName");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = v36;
    v76 = v34;
    objc_msgSend(v34, "recordName");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v100[1] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v85;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v85 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "dataUsingEncoding:", 4);
          v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          CC_SHA256_Update(&c, (const void *)objc_msgSend(v44, "bytes"), objc_msgSend(v44, "length"));

        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v84, v99, 16);
      }
      while (v41);
    }

    objc_msgSend(v27, "open");
    v45 = objc_msgSend(v27, "read:maxLength:", buf, 4096);
    if (v45 < 1)
    {
LABEL_32:
      v50 = objc_msgSend(v27, "close");
      if ((v45 & 0x8000000000000000) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v51;
        v22 = v77;
        if (v51)
        {
          v53 = objc_retainAutorelease(v51);
          CC_SHA256_Final((unsigned __int8 *)objc_msgSend(v53, "mutableBytes"), &c);
          v54 = (void *)objc_msgSend(v53, "copy");
        }
        else
        {
          v70 = (void *)MEMORY[0x1D17BA0A0]();
          v71 = v79;
          HMFGetOSLogHandle();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v89 = 138543618;
            v90 = v73;
            v91 = 2048;
            v92 = 32;
            _os_log_impl(&dword_1CD062000, v72, OS_LOG_TYPE_ERROR, "%{public}@Failed to allocate %lu bytes to hold digest", v89, 0x16u);

          }
          objc_autoreleasePoolPop(v70);
          if (v83)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
            v54 = 0;
            *v83 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v54 = 0;
          }
        }
        v69 = v76;

        goto LABEL_53;
      }
      v63 = (void *)MEMORY[0x1D17BA0A0](v50);
      v64 = v79;
      HMFGetOSLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      v22 = v77;
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "recordID");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "hmbDescription");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "streamError");
        v81 = v63;
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v89 = 138543874;
        v90 = v66;
        v91 = 2112;
        v92 = (uint64_t)v67;
        v93 = 2112;
        v94 = v68;
        _os_log_impl(&dword_1CD062000, v65, OS_LOG_TYPE_ERROR, "%{public}@Error reading data from record %@: %@", v89, 0x20u);

        v63 = v81;
      }

      objc_autoreleasePoolPop(v63);
      v61 = v83;
      if (v83)
      {
        objc_msgSend(v27, "streamError");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_44;
      }
    }
    else
    {
      v46 = 0;
      while (1)
      {
        v47 = __CFADD__(v45, v46);
        v46 += v45;
        v48 = v47;
        v49 = v48 << 63 >> 63;
        if (v49 != v48 || v49 < 0 || v46 > v11)
          break;
        CC_SHA256_Update(&c, buf, v45);
        v45 = objc_msgSend(v27, "read:maxLength:", buf, 4096);
        if (v45 <= 0)
          goto LABEL_32;
      }
      v55 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v27, "close"));
      v56 = v79;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v80 = v55;
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "recordID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "hmbDescription");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v89 = 138543874;
        v90 = v58;
        v91 = 2048;
        v92 = v11;
        v93 = 2112;
        v94 = v60;
        _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@Data size is bigger than maximum %ld bytes on record %@", v89, 0x20u);

        v55 = v80;
      }

      objc_autoreleasePoolPop(v55);
      v22 = v77;
      v61 = v83;
      if (v83)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:
        v54 = 0;
        *v61 = v62;
LABEL_46:
        v69 = v76;
LABEL_53:

        goto LABEL_54;
      }
    }
    v54 = 0;
    goto LABEL_46;
  }
  v54 = 0;
LABEL_54:

  return v54;
}

+ (id)__getSignatureDataFromRecord:(id)a3 signatureKey:(id)a4 signatureAssetKey:(id)a5 maxSignatureSize:(unint64_t)a6 error:(id *)a7
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  stringFromCKRecord(a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)__verifyDigestDataAgainstSignatureFromRecord:(id)a3 digestData:(id)a4 signatureData:(id)a5 signatureVerificationPublicKeys:(id)a6 error:(id *)a7
{
  const __CFData *v10;
  const __CFData *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  __SecKey *v20;
  int v21;
  BOOL v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE error[12];
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v10 = (const __CFData *)a4;
  v11 = (const __CFData *)a5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = a6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v34;
    v17 = (const __CFString *)*MEMORY[0x1E0CD6DB0];
    while (2)
    {
      v18 = 0;
      v19 = v15;
      do
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v12);
        v20 = *(__SecKey **)(*((_QWORD *)&v33 + 1) + 8 * v18);
        *(_QWORD *)error = 0;
        v21 = SecKeyVerifySignature(v20, v17, v10, v11, (CFErrorRef *)error);
        v15 = *(void **)error;

        if (v21)
        {

          v22 = 1;
          goto LABEL_17;
        }
        ++v18;
        v19 = v15;
      }
      while (v14 != v18);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }

  v23 = (void *)MEMORY[0x1D17BA0A0]();
  v24 = a1;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "recordID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hmbDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)error = 138543874;
    *(_QWORD *)&error[4] = v26;
    v38 = 2112;
    v39 = v28;
    v40 = 2112;
    v41 = v15;
    _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_ERROR, "%{public}@Digest does not match signature on record %@: %@", error, 0x20u);

  }
  objc_autoreleasePoolPop(v23);
  if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 53);
    v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
LABEL_17:

  return v22;
}

+ (id)__getDataFromRecord:(id)a3 dataKey:(id)a4 dataAssetKey:(id)a5 maxDataSize:(unint64_t)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v12
    || (readDataFromCKRecordOptionalAssetField((uint64_t)v10), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    dataFromCKRecordRequiredField(v10, v11, a7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (BOOL)__verifyDataFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 dataKey:(id)a5 dataAssetKey:(id)a6 maxDataSize:(unint64_t)a7 signatureKey:(id)a8 signatureAssetKey:(id)a9 maxSignatureSize:(unint64_t)a10 baseAccessoryIdentifier:(id *)a11 data:(id *)a12 error:(id *)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  BOOL v28;
  id v30;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  objc_msgSend(a1, "__createBaseAccessoryIdentifierFromRecord:error:", v18, a13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(a1, "__calculateDigestDataFromRecord:dataKey:dataAssetKey:maxDataSize:error:", v18, v20, v21, a7, a13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v30 = v19;
      objc_msgSend(a1, "__getSignatureDataFromRecord:signatureKey:signatureAssetKey:maxSignatureSize:error:", v18, v22, v23, a10, a13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26
        && objc_msgSend(a1, "__verifyDigestDataAgainstSignatureFromRecord:digestData:signatureData:signatureVerificationPublicKeys:error:", v18, v25, v26, v30, a13))
      {
        objc_msgSend(a1, "__getDataFromRecord:dataKey:dataAssetKey:maxDataSize:error:", v18, v20, v21, a7, a13);
        v27 = (id)objc_claimAutoreleasedReturnValue();
        *a12 = v27;
        if (v27)
        {
          *a11 = objc_retainAutorelease(v24);
          v28 = 1;
        }
        else
        {
          v28 = 0;
        }
      }
      else
      {
        v28 = 0;
      }

      v19 = v30;
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

+ (BOOL)verifyNetworkDeclarationsFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 baseAccessoryIdentifier:(id *)a5 data:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;

  v12 = a4;
  v13 = a3;
  LOBYTE(a7) = objc_msgSend(a1, "__verifyDataFromRecord:signatureVerificationPublicKeys:dataKey:dataAssetKey:maxDataSize:signatureKey:signatureAssetKey:maxSignatureSize:baseAccessoryIdentifier:data:error:", v13, v12, CFSTR("CD_networkDeclarations"), CFSTR("CD_networkDeclarations_ckAsset"), objc_msgSend(a1, "__maxSizeForCKRecordNetworkDeclarations"), CFSTR("CD_networkDeclarationsSignature"), CFSTR("CD_networkDeclarationsSignature_ckAsset"), objc_msgSend(a1, "__maxSizeForCKRecordNetworkDeclarationsSignature"), a5, a6, a7);

  return (char)a7;
}

+ (BOOL)verifyNetworkDeclarationsFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 error:(id *)a5
{
  char v5;
  uint64_t v7;
  id v8;

  v7 = 0;
  v8 = 0;
  v5 = objc_msgSend(a1, "verifyNetworkDeclarationsFromRecord:signatureVerificationPublicKeys:baseAccessoryIdentifier:data:error:", a3, a4, &v8, &v7, a5);

  return v5;
}

+ (BOOL)verifyPairedMetadataFromRecord:(id)a3 signatureVerificationPublicKeys:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v11;
  id v12;

  v8 = a4;
  v9 = a3;
  v11 = 0;
  v12 = 0;
  LOBYTE(a5) = objc_msgSend(a1, "__verifyDataFromRecord:signatureVerificationPublicKeys:dataKey:dataAssetKey:maxDataSize:signatureKey:signatureAssetKey:maxSignatureSize:baseAccessoryIdentifier:data:error:", v9, v8, CFSTR("CD_pairedMetadata"), CFSTR("CD_pairedMetadata_ckAsset"), objc_msgSend(a1, "__maxSizeForCKRecordPairedMetadata"), CFSTR("CD_pairedMetadataSignature"), CFSTR("CD_pairedMetadataSignature_ckAsset"), objc_msgSend(a1, "__maxSizeForCKRecordPairedMetadataSignature"), &v12, &v11, a5);

  return (char)a5;
}

- (HMDNetworkRouterFirewallRuleCloudZone)initWithCloudDatabase:(id)a3 state:(id)a4 useAnonymousRequests:(BOOL)a5 watchedRecordIDs:(id)a6 signatureVerificationPublicKeys:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDNetworkRouterFirewallRuleCloudZone *v17;
  HMDNetworkRouterFirewallRuleCloudZone *v18;
  HMDNetworkRouterFirewallRuleCloudZone *v20;
  NSObject *v21;
  HMDAssertionLogEvent *v22;
  void *v23;
  void *v24;
  void *context;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (!objc_msgSend(v15, "count"))
  {
    context = (void *)MEMORY[0x1D17BA0A0]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Must have verification keys", buf, 0xCu);

    }
    objc_autoreleasePoolPop(context);
    v22 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Must have verification keys"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitLogEvent:", v22);

  }
  v16 = objc_alloc_init(MEMORY[0x1E0D32C38]);
  v26.receiver = self;
  v26.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZone;
  v17 = -[HMBCloudZone initWithCloudDatabase:configuration:state:](&v26, sel_initWithCloudDatabase_configuration_state_, v12, v16, v13);

  if (v17)
  {
    *(&v17->_useAnonymousRequests + 4) = a5;
    objc_storeStrong((id *)&v17->_watchedRecordIDs, a6);
    objc_storeStrong((id *)&v17->_signatureVerificationPublicKeys, a7);
    v18 = v17;
  }

  return v17;
}

- (id)attributeDescriptions
{
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E0D32D08]);
  os_unfair_lock_lock_with_options();
  -[HMDNetworkRouterFirewallRuleCloudZone uncommittedModifiedRecordIDsFromLastPull](self, "uncommittedModifiedRecordIDsFromLastPull");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(v3);
  v23.receiver = self;
  v23.super_class = (Class)HMDNetworkRouterFirewallRuleCloudZone;
  -[HMBCloudZone attributeDescriptions](&v23, sel_attributeDescriptions);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDNetworkRouterFirewallRuleCloudZone useAnonymousRequests](self, "useAnonymousRequests"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("UseAnonymousRequests"), v22);
  v24[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudZone watchedRecordIDs](self, "watchedRecordIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("WatchedRecordIDs"), v8);
  v24[1] = v9;
  v10 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudZone signatureVerificationPublicKeys](self, "signatureVerificationPublicKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("SignatureVerificationPublicKeys"), v11);
  v24[2] = v12;
  v13 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDNetworkRouterFirewallRuleCloudZone modifiedRecordIDsFromLastPull](self, "modifiedRecordIDsFromLastPull");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("ModifiedRecordIDsFromLastPull"), v14);
  v24[3] = v15;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28548]), "initWithName:value:", CFSTR("UncommittedModifiedRecordIDsFromLastPull"), v21);
  v24[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSSet)modifiedRecordIDsFromLastPull
{
  os_unfair_lock_s *v3;
  NSSet *v4;

  v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E0D32D08]);
  os_unfair_lock_lock_with_options();
  v4 = self->_modifiedRecordIDsFromLastPull;
  os_unfair_lock_unlock(v3);
  return v4;
}

- (void)setModifiedRecordIDsFromLastPull:(id)a3
{
  NSSet *v4;
  NSSet *modifiedRecordIDsFromLastPull;

  v4 = (NSSet *)a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)((char *)self + (int)*MEMORY[0x1E0D32D08]));
  modifiedRecordIDsFromLastPull = self->_modifiedRecordIDsFromLastPull;
  self->_modifiedRecordIDsFromLastPull = v4;

}

- (NSMutableSet)uncommittedModifiedRecordIDsFromLastPull
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)((char *)self + (int)*MEMORY[0x1E0D32D08]));
  return self->_uncommittedModifiedRecordIDsFromLastPull;
}

- (void)setUncommittedModifiedRecordIDsFromLastPull:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *uncommittedModifiedRecordIDsFromLastPull;

  v4 = (NSMutableSet *)a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)((char *)self + (int)*MEMORY[0x1E0D32D08]));
  uncommittedModifiedRecordIDsFromLastPull = self->_uncommittedModifiedRecordIDsFromLastPull;
  self->_uncommittedModifiedRecordIDsFromLastPull = v4;

}

- (void)startUpWithLocalZone:(id)a3
{
  id v4;

  -[HMBCloudZone setLocalZone:](self, "setLocalZone:", a3);
  -[HMBCloudZone startUp](self, "startUp");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishWithNoResult");

}

- (id)fetchChangesWithToken:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __71__HMDNetworkRouterFirewallRuleCloudZone_fetchChangesWithToken_options___block_invoke;
  v18 = &unk_1E89B7868;
  objc_copyWeak(&v21, &location);
  v8 = v7;
  v19 = v8;
  v9 = v6;
  v20 = v9;
  v10 = _Block_copy(&v15);
  v11 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lazyFutureWithBlock:scheduler:", v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v13;
}

- (void)__fetchZoneChangesWithFetchInfo:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  HMDNetworkRouterFirewallRuleCloudZone *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  void *v41;
  void *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C94DD8]);
  objc_msgSend(v4, "changeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreviousServerChangeToken:", v6);

  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v8;
  v43[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc(MEMORY[0x1E0C94DE8]);
  -[HMBCloudZone cloudZoneID](self, "cloudZoneID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "zoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v10, "initWithRecordZoneIDs:configurationsByRecordZoneID:", v13, v9);

  objc_msgSend(v14, "setFetchAllChanges:", 1);
  objc_initWeak(&location, self);
  v15 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke;
  v37[3] = &unk_1E89B7890;
  v16 = v4;
  v38 = v16;
  objc_copyWeak(&v39, &location);
  objc_msgSend(v14, "setRecordChangedBlock:", v37);
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_3;
  v34[3] = &unk_1E89B78B8;
  v17 = v16;
  v35 = v17;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v14, "setRecordWithIDWasDeletedBlock:", v34);
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_5;
  v31[3] = &unk_1E89B78E0;
  v18 = v17;
  v32 = v18;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v14, "setRecordZoneChangeTokensUpdatedBlock:", v31);
  v28[0] = v15;
  v28[1] = 3221225472;
  v28[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_140;
  v28[3] = &unk_1E89B7930;
  v19 = v18;
  v29 = v19;
  objc_copyWeak(&v30, &location);
  objc_msgSend(v14, "setRecordZoneFetchCompletionBlock:", v28);
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_145;
  v24[3] = &unk_1E89BCB20;
  v20 = v19;
  v25 = v20;
  v26 = self;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v14, "setFetchRecordZoneChangesCompletionBlock:", v24);
  -[HMBCloudZone database](self, "database");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addOperation:", v14);

  objc_msgSend(v20, "operationStartTime");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v22 == 0;

  if ((_DWORD)v21)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setOperationStartTime:", v23);

  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v33);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v39);

  objc_destroyWeak(&location);
}

- (void)__noteUpdatedRecordID:(id)a3
{
  os_unfair_lock_s *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E0D32D08]);
  os_unfair_lock_lock_with_options();
  -[HMDNetworkRouterFirewallRuleCloudZone uncommittedModifiedRecordIDsFromLastPull](self, "uncommittedModifiedRecordIDsFromLastPull");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDNetworkRouterFirewallRuleCloudZone uncommittedModifiedRecordIDsFromLastPull](self, "uncommittedModifiedRecordIDsFromLastPull");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkRouterFirewallRuleCloudZone setUncommittedModifiedRecordIDsFromLastPull:](self, "setUncommittedModifiedRecordIDsFromLastPull:", v6);
  }

  os_unfair_lock_unlock(v4);
}

- (void)__finalizeUpdatedRecordIDs
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (os_unfair_lock_s *)((char *)self + (int)*MEMORY[0x1E0D32D08]);
  os_unfair_lock_lock_with_options();
  if (self->_modifiedRecordIDsFromLastPull)
  {
    -[HMDNetworkRouterFirewallRuleCloudZone uncommittedModifiedRecordIDsFromLastPull](self, "uncommittedModifiedRecordIDsFromLastPull");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[HMDNetworkRouterFirewallRuleCloudZone uncommittedModifiedRecordIDsFromLastPull](self, "uncommittedModifiedRecordIDsFromLastPull");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unionSet:", self->_modifiedRecordIDsFromLastPull);

    }
  }
  -[HMDNetworkRouterFirewallRuleCloudZone uncommittedModifiedRecordIDsFromLastPull](self, "uncommittedModifiedRecordIDsFromLastPull");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[HMDNetworkRouterFirewallRuleCloudZone setModifiedRecordIDsFromLastPull:](self, "setModifiedRecordIDsFromLastPull:", v7);

  -[HMDNetworkRouterFirewallRuleCloudZone setUncommittedModifiedRecordIDsFromLastPull:](self, "setUncommittedModifiedRecordIDsFromLastPull:", 0);
  os_unfair_lock_unlock(v3);
}

- (void)__recordChanged:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDNetworkRouterFirewallRuleCloudZone *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  HMDNetworkRouterFirewallRuleCloudZone *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  HMDNetworkRouterFirewallRuleCloudZone *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  HMDNetworkRouterFirewallRuleCloudZone *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  HMDNetworkRouterFirewallRuleCloudZone *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "recordID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmbDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markWithFormat:", CFSTR("Fetched changed record %@ (%@)"), v10, v11);

  v12 = (void *)MEMORY[0x1D17BA0A0]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmbDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v57 = v15;
    v58 = 2112;
    v59 = v16;
    v60 = 2112;
    v61 = v17;
    _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched changed record %@ (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v55 = 0;
  -[HMDNetworkRouterFirewallRuleCloudZone decodeModelFrom:recordSource:error:](v13, "decodeModelFrom:recordSource:error:", v6, 4, &v55);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v55;
  v20 = v19;
  if (v18)
  {
    v54 = v19;
    objc_msgSend(v6, "externalID:", &v54);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v54;

    if (v21)
    {
      v53 = v22;
      objc_msgSend(v6, "externalData:", &v53);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v53;

      if (v23)
      {
        objc_msgSend(v7, "mirrorInput");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v24;
        v26 = objc_msgSend(v25, "stageAdditionForModel:externalID:externalData:error:", v18, v21, v23, &v52);
        v50 = v52;

        if ((v26 & 1) != 0)
        {
          -[HMDNetworkRouterFirewallRuleCloudZone __noteUpdatedRecordID:](v13, "__noteUpdatedRecordID:", v8);
        }
        else
        {
          objc_msgSend(v7, "activity");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "hmbDescription");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "markWithFormat:", CFSTR("Failed to update model for %@: %@"), v43, v50);

          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v13;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "hmbDescription");
            v49 = v44;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v57 = v47;
            v58 = 2112;
            v59 = v48;
            v60 = 2112;
            v61 = v50;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_ERROR, "%{public}@Failed to update model for %@: %@", buf, 0x20u);

            v44 = v49;
          }

          objc_autoreleasePoolPop(v44);
        }
        v24 = v50;
      }
      else
      {
        objc_msgSend(v7, "activity");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "markWithFormat:", CFSTR("Failed to determine externalData: %@"), v24);

        v38 = (void *)MEMORY[0x1D17BA0A0]();
        v39 = v13;
        HMFGetOSLogHandle();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v51 = v38;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v57 = v41;
          v58 = 2112;
          v59 = v24;
          _os_log_impl(&dword_1CD062000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalData: %@", buf, 0x16u);

          v38 = v51;
        }

        objc_autoreleasePoolPop(v38);
      }

      v22 = v24;
    }
    else
    {
      objc_msgSend(v7, "activity");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "markWithFormat:", CFSTR("Failed to determine externalID: %@"), v22);

      v33 = (void *)MEMORY[0x1D17BA0A0]();
      v34 = v13;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v36;
        v58 = 2112;
        v59 = v22;
        _os_log_impl(&dword_1CD062000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalID: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
    }

    v20 = v22;
  }
  else
  {
    objc_msgSend(v7, "activity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "markWithFormat:", CFSTR("Failed to decode model: %@"), v20);

    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = v13;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v31;
      v58 = 2112;
      v59 = v20;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode model: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
  }

}

- (void)__recordDeleted:(id)a3 recordType:(id)a4 fetchInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDNetworkRouterFirewallRuleCloudZone *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  HMDNetworkRouterFirewallRuleCloudZone *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDNetworkRouterFirewallRuleCloudZone *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "activity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hmbDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markWithFormat:", CFSTR("Fetched deleted recordID: %@ (%@)"), v12, v9);

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hmbDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v36 = v16;
    v37 = 2112;
    v38 = v17;
    v39 = 2112;
    v40 = v9;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Fetched deleted recordID: %@ (%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  v34 = 0;
  objc_msgSend(v8, "externalID:", &v34);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v34;
  if (v18)
  {
    objc_msgSend(v10, "mirrorInput");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v19;
    v21 = objc_msgSend(v20, "stageRemovalForModelWithExternalID:error:", v18, &v33);
    v22 = v33;

    if ((v21 & 1) != 0)
    {
      -[HMDNetworkRouterFirewallRuleCloudZone __noteUpdatedRecordID:](v14, "__noteUpdatedRecordID:", v8);
    }
    else
    {
      objc_msgSend(v10, "activity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "markWithFormat:", CFSTR("Failed to remove model: %@"), v22);

      v29 = (void *)MEMORY[0x1D17BA0A0]();
      v30 = v14;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v32;
        v37 = 2112;
        v38 = v22;
        _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove model: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
    }
    v19 = v22;
  }
  else
  {
    objc_msgSend(v10, "activity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "markWithFormat:", CFSTR("Failed to determine externalID: %@"), v19);

    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v14;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v19;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine externalID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)__zoneChangeTokensUpdated:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDNetworkRouterFirewallRuleCloudZone *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hmbDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "markWithFormat:", CFSTR("Change token updated: %@"), v10);

  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changeToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hmbDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v14;
    v19 = 2112;
    v20 = v16;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Change token updated: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v7, "setChangeToken:", v6);

}

- (void)__zoneFetchCompletedWithChangeToken:(id)a3 error:(id)a4 moreComing:(BOOL)a5 fetchInfo:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HMDNetworkRouterFirewallRuleCloudZone *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDNetworkRouterFirewallRuleCloudZone *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v12, "activity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmbDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v11)
  {
    objc_msgSend(v13, "markWithFormat:", CFSTR("Zone fetch completed successfully, token: %@, moreComing: %@"), v14, v15);

    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hmbDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = v28;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@Zone fetch completed successfully, token: %@, moreComing: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v23);
LABEL_11:
    objc_msgSend(v12, "setChangeToken:", v10);
    if (!v7)
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v13, "markWithFormat:", CFSTR("Zone fetch completed unsuccessfully, token: %@, error: %@, moreComing: %@"), v14, v11, v15);

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hmbDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v30 = v20;
    v31 = 2112;
    v32 = v21;
    v33 = 2112;
    v34 = v11;
    v35 = 2112;
    v36 = v22;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Zone fetch completed unsuccessfully, token: %@, error: %@, moreComing: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v17);
  if (v10)
    goto LABEL_11;
  if (v7)
LABEL_6:
    objc_msgSend(v12, "setShouldRetry:", 1);
LABEL_7:

}

- (void)__zoneChangesCompleted:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDNetworkRouterFirewallRuleCloudZone *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  HMDNetworkRouterFirewallRuleCloudZone *v16;
  NSObject *v17;
  void *v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "activity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "markWithFormat:", CFSTR("Zone change operation completed unsuccessfully: %@"), v6);

    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Zone change operation completed unsuccessfully: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = v6;
    -[HMDNetworkRouterFirewallRuleCloudZone __finalizeUpdatedRecordIDs](v11, "__finalizeUpdatedRecordIDs");
  }
  else
  {
    objc_msgSend(v8, "markWithFormat:", CFSTR("Zone change operation completed successfully"));

    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Zone change operation completed successfully", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v23 = 0;
    v19 = -[HMDNetworkRouterFirewallRuleCloudZone __commitLocalChanges:error:](v16, "__commitLocalChanges:error:", v7, &v23);
    v20 = v23;
    v21 = v20;
    v14 = 0;
    if (!v19)
      v14 = v20;

    -[HMDNetworkRouterFirewallRuleCloudZone __finalizeUpdatedRecordIDs](v16, "__finalizeUpdatedRecordIDs");
    if (!v14)
      goto LABEL_11;
  }
  if (!-[HMDNetworkRouterFirewallRuleCloudZone __canRecoverFromError:fetchInfo:](self, "__canRecoverFromError:fetchInfo:", v14, v7))
  {
    objc_msgSend(v7, "finishWithError:", v14);
    goto LABEL_15;
  }
LABEL_11:
  if (objc_msgSend(v7, "shouldRetry"))
  {
    -[HMDNetworkRouterFirewallRuleCloudZone __retryFetchWithFetchInfo:](self, "__retryFetchWithFetchInfo:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v22);

  }
LABEL_15:

}

- (BOOL)__commitLocalChanges:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDNetworkRouterFirewallRuleCloudZone *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  HMDNetworkRouterFirewallRuleCloudZone *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  HMDNetworkRouterFirewallRuleCloudZone *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  void *v37;
  HMDNetworkRouterFirewallRuleCloudZone *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  HMDNetworkRouterFirewallRuleCloudZone *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  HMDNetworkRouterFirewallRuleCloudZone *v55;
  void *v56;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markWithFormat:", CFSTR("Committing local changes"));

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v59 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Committing local changes", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "mirrorInput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "frmSyncCommitWithOptions:error:", v13, a4);

  objc_msgSend(v6, "activity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    objc_msgSend(v15, "markWithFormat:", CFSTR("Failed to commit: %@"), *a4);

    v37 = (void *)MEMORY[0x1D17BA0A0]();
    v38 = v9;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *a4;
      *(_DWORD *)buf = 138543618;
      v59 = v40;
      v60 = 2112;
      v61 = v41;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to commit: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v37);
    LOBYTE(v42) = 0;
    goto LABEL_21;
  }
  objc_msgSend(v15, "markWithFormat:", CFSTR("Committed successfully"));

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = v9;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v59 = v20;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Committed successfully", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v6, "originalChangeToken");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeToken");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = HMFEqualObjects();

  objc_msgSend(v6, "activity");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeToken");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "hmbDescription");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (!v23)
  {
    objc_msgSend(v24, "markWithFormat:", CFSTR("Updating change token: %@"), v26);

    v43 = (void *)MEMORY[0x1D17BA0A0]();
    v44 = v18;
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "changeToken");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "hmbDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v59 = v46;
      v60 = 2112;
      v61 = v48;
      _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_INFO, "%{public}@Updating change token: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    -[HMBCloudZone cloudDatabase](v44, "cloudDatabase");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeToken");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBCloudZone cloudZoneID](v44, "cloudZoneID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "updateServerChangeToken:forZoneWithID:", v50, v51);

    objc_msgSend(v6, "activity");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeToken");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "hmbDescription");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "markWithFormat:", CFSTR("Updated change token successfully: %@"), v54);

    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v55 = v44;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      goto LABEL_17;
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeToken");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hmbDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v31;
    v60 = 2112;
    v61 = v33;
    v34 = "%{public}@Updated change token successfully: %@";
    v35 = v30;
    v36 = OS_LOG_TYPE_INFO;
    goto LABEL_16;
  }
  objc_msgSend(v24, "markWithFormat:", CFSTR("Change token does not need to be updated: %@"), v26);

  v28 = (void *)MEMORY[0x1D17BA0A0]();
  v29 = v18;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeToken");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hmbDescription");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v59 = v31;
    v60 = 2112;
    v61 = v33;
    v34 = "%{public}@Change token does not need to be updated: %@";
    v35 = v30;
    v36 = OS_LOG_TYPE_DEFAULT;
LABEL_16:
    _os_log_impl(&dword_1CD062000, v35, v36, v34, buf, 0x16u);

  }
LABEL_17:

  objc_autoreleasePoolPop(v28);
  if (!objc_msgSend(v6, "shouldRetry"))
  {
LABEL_20:
    LOBYTE(v42) = 1;
    goto LABEL_21;
  }
  -[HMBCloudZone localZone](v18, "localZone");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "createMirrorInputWithError:", a4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v6, "setMirrorInput:", v42);

    goto LABEL_20;
  }
LABEL_21:

  return (char)v42;
}

- (BOOL)__canRecoverFromError:(id)a3 fetchInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleCloudZone *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDNetworkRouterFirewallRuleCloudZone *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDNetworkRouterFirewallRuleCloudZone *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[6];
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hmbIsCKPartialFailureError"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__136612;
    v35 = __Block_byref_object_dispose__136613;
    v36 = 0;
    objc_msgSend(v6, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___canRecoverFromError_fetchInfo___block_invoke;
    v32[3] = &unk_1E89B7958;
    v32[4] = self;
    v32[5] = buf;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v32);

    v10 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (v10)
    {
      v11 = v10;

      v6 = v11;
    }
    _Block_object_dispose(buf, 8);

    if (!v10)
      goto LABEL_7;
  }
  if (!objc_msgSend(v6, "hmd_isCKError") || (objc_msgSend(v6, "hmd_isNonRecoverableCKError") & 1) != 0)
    goto LABEL_7;
  v14 = objc_msgSend(v6, "code");
  switch(v14)
  {
    case 21:
      objc_msgSend(v7, "activity");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "markWithFormat:", CFSTR("Change token has expired: %@"), v6);

      v21 = (void *)MEMORY[0x1D17BA0A0]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v24;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Change token has expired: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(v7, "setChangeToken:", 0);
      objc_msgSend(v7, "setShouldRetry:", 1);
      goto LABEL_25;
    case 28:
      objc_msgSend(v7, "activity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "markWithFormat:", CFSTR("Zone was deleted: %@"), v6);

      v26 = (void *)MEMORY[0x1D17BA0A0]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v29;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@Zone was deleted: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      -[HMBCloudZone handleDeletion](v27, "handleDeletion");
      goto LABEL_25;
    case 26:
      objc_msgSend(v7, "activity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "markWithFormat:", CFSTR("Zone does not exist: %@"), v6);

      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Zone does not exist: %@", buf, 0x16u);

      }
LABEL_24:

      objc_autoreleasePoolPop(v16);
LABEL_25:
      v12 = 1;
      goto LABEL_8;
  }
  objc_msgSend(v6, "hmbCloudKitRetryDelay");
  objc_msgSend(v7, "setRetryIntervalSeconds:");
  if (objc_msgSend(v7, "shouldRetry"))
  {
    objc_msgSend(v7, "activity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "markWithFormat:", CFSTR("Ignoring non-fatal error: %@"), v6);

    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@Ignoring non-fatal error: %@", buf, 0x16u);

    }
    goto LABEL_24;
  }
LABEL_7:
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)__retryFetchWithFetchInfo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  dispatch_time_t v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  HMDNetworkRouterFirewallRuleCloudZone *v14;
  NSObject *v15;
  void *v16;
  double v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "retryIntervalSeconds");
  v6 = v5;
  objc_msgSend(v4, "retryIntervalSeconds");
  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 <= 0.0)
    v11 = "fetch the next batch of records";
  else
    v11 = "retry the fetch";
  objc_msgSend(v4, "retryIntervalSeconds");
  objc_msgSend(v10, "markWithFormat:", CFSTR("Will %s in %lu seconds"), v11, (unint64_t)v12);

  v13 = (void *)MEMORY[0x1D17BA0A0]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "retryIntervalSeconds");
    *(_DWORD *)buf = 138543874;
    v24 = v16;
    v25 = 2080;
    v26 = v11;
    v27 = 2048;
    v28 = (unint64_t)v17;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Will %s in %lu seconds", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v13);
  objc_msgSend(v4, "setShouldRetry:", 0);
  objc_msgSend(v4, "setRetryCount:", objc_msgSend(v4, "retryCount") + 1);
  objc_initWeak((id *)buf, v14);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke;
  block[3] = &unk_1E89B90E8;
  v20 = v4;
  v18 = v4;
  objc_copyWeak(&v21, (id *)buf);
  v22 = v6 > 0.0;
  dispatch_after(v8, v9, block);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
}

- (BOOL)useAnonymousRequests
{
  return *(&self->_useAnonymousRequests + 4);
}

- (NSSet)watchedRecordIDs
{
  return self->_watchedRecordIDs;
}

- (NSArray)signatureVerificationPublicKeys
{
  return self->_signatureVerificationPublicKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatureVerificationPublicKeys, 0);
  objc_storeStrong((id *)&self->_watchedRecordIDs, 0);
  objc_storeStrong((id *)&self->_uncommittedModifiedRecordIDsFromLastPull, 0);
  objc_storeStrong((id *)&self->_modifiedRecordIDsFromLastPull, 0);
}

void __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke_2;
  v3[3] = &unk_1E89B90E8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v3);

  objc_destroyWeak(&v5);
}

void __67__HMDNetworkRouterFirewallRuleCloudZone___retryFetchWithFetchInfo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  const char *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "activity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
      v4 = "Retrying";
    else
      v4 = "Fetching the next batch of records";
    objc_msgSend(*(id *)(a1 + 32), "changeToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hmbDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markWithFormat:", CFSTR("%s, token: %@"), v4, v6);

    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = WeakRetained;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 48))
        v11 = "Retrying";
      else
        v11 = "Fetching the next batch of records";
      objc_msgSend(*(id *)(a1 + 32), "changeToken");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hmbDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v10;
      v17 = 2080;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@%s, token: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v8, "__fetchZoneChangesWithFetchInfo:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v14);

  }
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___canRecoverFromError_fetchInfo___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v19;
  else
    v8 = 0;
  v9 = v8;
  v10 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v9)
    v13 = v12 == 0;
  else
    v13 = 1;
  if (v13
    || (objc_msgSend(*(id *)(a1 + 32), "cloudZoneID"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "zoneID"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v9, "isEqual:", v15),
        v15,
        v14,
        (v16 & 1) == 0))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = 0;

    *a4 = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v11);
  }

}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2;
  v6[3] = &unk_1E89BD988;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "performBlock:", v6);

  objc_destroyWeak(&v9);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_4;
  v10[3] = &unk_1E89BF278;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v11 = *(id *)(a1 + 32);
  v8 = v5;
  v12 = v8;
  v9 = v6;
  v13 = v9;
  objc_msgSend(v7, "performBlock:", v10);

  objc_destroyWeak(&v14);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_6;
  v13[3] = &unk_1E89BF278;
  objc_copyWeak(&v17, (id *)(a1 + 40));
  v11 = v7;
  v14 = v11;
  v12 = v8;
  v15 = v12;
  v16 = *(id *)(a1 + 32);
  objc_msgSend(v10, "performBlock:", v13);

  objc_destroyWeak(&v17);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_140(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_141;
  v19[3] = &unk_1E89B7908;
  objc_copyWeak(&v24, (id *)(a1 + 40));
  v16 = v11;
  v20 = v16;
  v17 = v12;
  v21 = v17;
  v18 = v14;
  v22 = v18;
  v25 = a5;
  v23 = *(id *)(a1 + 32);
  objc_msgSend(v15, "performBlock:", v19);

  objc_destroyWeak(&v24);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_145(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_146;
  v8[3] = &unk_1E89BF278;
  v5 = v3;
  v9 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  objc_msgSend(v4, "performBlock:", v8);

  objc_destroyWeak(&v12);
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_146(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "markWithFormat:", CFSTR("Fetch zone changes operation completed with error: %@"), *(_QWORD *)(a1 + 32));

    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v10 = "%{public}@Fetch zone changes operation completed with error: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 22;
  }
  else
  {
    objc_msgSend(v3, "markWithFormat:", CFSTR("Fetch zone changes operation completed successfully"));

    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v8;
    v10 = "%{public}@Fetch zone changes operation completed successfully";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 12;
  }
  _os_log_impl(&dword_1CD062000, v11, v12, v10, buf, v13);

LABEL_7:
  objc_autoreleasePoolPop(v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v15 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "__zoneChangesCompleted:fetchInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "activity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "markWithFormat:", CFSTR("CloudZone has been deallocated"));

    v17 = (void *)MEMORY[0x1D17BA0A0]();
    objc_opt_class();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_INFO, "%{public}@CloudZone has been deallocated", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = *(void **)(a1 + 32);
    if (v21)
    {
      v22 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v22);

  }
}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2_141(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAssertionLogEvent *v12;
  void *v13;
  HMDAssertionLogEvent *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cloudZoneID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HMFEqualObjects();

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = v3;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v10;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: recordZoneFetchCompletionBlock called with unknown zone: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      v12 = [HMDAssertionLogEvent alloc];
      objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAssertionLogEvent initWithReason:](v12, "initWithReason:", CFSTR("recordZoneFetchCompletionBlock called with unknown zone: %@"), v13);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "submitLogEvent:", v14);

    }
    objc_msgSend(v3, "__zoneFetchCompletedWithChangeToken:error:moreComing:fetchInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56));
  }

}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  HMDAssertionLogEvent *v12;
  void *v13;
  HMDAssertionLogEvent *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "cloudZoneID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoneID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = HMFEqualObjects();

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = v3;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v10;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: recordZoneChangeTokensUpdatedBlock called with unknown zone: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v7);
      v12 = [HMDAssertionLogEvent alloc];
      objc_msgSend(*(id *)(a1 + 32), "hmbDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMDAssertionLogEvent initWithReason:](v12, "initWithReason:", CFSTR("recordZoneChangeTokensUpdatedBlock called with unknown zone: %@"), v13);

      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "submitLogEvent:", v14);

    }
    objc_msgSend(v3, "__zoneChangeTokensUpdated:fetchInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  int v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "interestedRecordIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40));

    WeakRetained = v5;
    if (v4)
    {
      objc_msgSend(v5, "__recordDeleted:recordType:fetchInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      WeakRetained = v5;
    }
  }

}

void __73__HMDNetworkRouterFirewallRuleCloudZone___fetchZoneChangesWithFetchInfo___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  id v6;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(a1[4], "interestedRecordIDs");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "recordID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "containsObject:", v4);

    WeakRetained = v6;
    if (v5)
    {
      objc_msgSend(v6, "__recordChanged:fetchInfo:", a1[5], a1[4]);
      WeakRetained = v6;
    }
  }

}

void __71__HMDNetworkRouterFirewallRuleCloudZone_fetchChangesWithToken_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char *WeakRetained;
  void *v5;
  os_unfair_lock_s *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  HMDNetworkRouterFirewallRuleCloudZoneFetchInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *context;
  id v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (os_unfair_lock_s *)&WeakRetained[*MEMORY[0x1E0D32D08]];
    os_unfair_lock_lock_with_options();
    objc_msgSend(v5, "setModifiedRecordIDsFromLastPull:", 0);
    objc_msgSend(v5, "setUncommittedModifiedRecordIDsFromLastPull:", 0);
    os_unfair_lock_unlock(v6);
    objc_msgSend(v5, "watchedRecordIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      objc_msgSend(v5, "localZone");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      objc_msgSend(v9, "createMirrorInputWithError:", &v41);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v41;

      if (v40)
      {
        v10 = [HMDNetworkRouterFirewallRuleCloudZoneFetchInfo alloc];
        v12 = *(_QWORD *)(a1 + 32);
        v11 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v5, "database");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "useAnonymousRequests");
        objc_msgSend(v5, "watchedRecordIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[HMDNetworkRouterFirewallRuleCloudZoneFetchInfo initWithOptions:changeToken:promise:database:useAnonymousRequests:interestedRecordIDs:mirrorInput:](v10, "initWithOptions:changeToken:promise:database:useAnonymousRequests:interestedRecordIDs:mirrorInput:", v12, v11, v3, v13, v14, v15, v40);

        -[HMDNetworkRouterFirewallRuleManagerBackingStoreFetchHelper activity](v16, "activity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "zoneID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleCloudZoneFetchInfo changeToken](v16, "changeToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "hmbDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "markWithFormat:", CFSTR("Fetching all changes for zone: %@, token: %@"), v19, v21);

        context = (void *)MEMORY[0x1D17BA0A0]();
        v22 = v5;
        HMFGetOSLogHandle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "zoneID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDNetworkRouterFirewallRuleCloudZoneFetchInfo changeToken](v16, "changeToken");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "hmbDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v24;
          v44 = 2112;
          v45 = v26;
          v46 = 2112;
          v47 = v28;
          _os_log_impl(&dword_1CD062000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Fetching all changes for zone: %@, token: %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(context);
        objc_msgSend(v22, "__fetchZoneChangesWithFetchInfo:", v16);

      }
      else
      {
        v34 = (void *)MEMORY[0x1D17BA0A0]();
        v35 = v5;
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v43 = v37;
          v44 = 2112;
          v45 = v39;
          _os_log_impl(&dword_1CD062000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create mirror input: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v34);
        objc_msgSend(v3, "finishWithError:", v39);
      }

    }
    else
    {
      v30 = (void *)MEMORY[0x1D17BA0A0]();
      v31 = v5;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v33;
        _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_DEBUG, "%{public}@Not watching any records", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(v3, "finishWithNoResult");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v29);

  }
}

@end
