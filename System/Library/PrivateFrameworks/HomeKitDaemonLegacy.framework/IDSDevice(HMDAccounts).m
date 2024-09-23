@implementation IDSDevice(HMDAccounts)

- (id)hmd_productInfo
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE v23[24];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "productName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFProductPlatformFromString();

  objc_msgSend(a1, "modelIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = HMFProductClassFromString();
  if (v3)
  {
    if (v6)
      goto LABEL_10;
    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Could not determine product platform from product name '%@' for device: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (!v6)
  {
LABEL_7:
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modelIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Could not determine product class from model identifier '%@' for device: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }
LABEL_10:
  v17 = objc_alloc(MEMORY[0x1E0D28690]);
  v18 = (void *)MEMORY[0x1E0D286A0];
  objc_msgSend(a1, "operatingSystemVersion");
  objc_msgSend(v18, "versionFromOperatingSystemVersion:", v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "modelIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithPlatform:class:softwareVersion:modelIdentifier:", v3, v6, v19, v20);

  return v21;
}

- (HMDHomeKitVersion)hmd_version
{
  void *v2;
  __CFString **v3;
  HMDHomeKitVersion *v4;

  objc_msgSend(a1, "hmd_productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "operatingSystemVersion");
  switch(objc_msgSend(v2, "productPlatform"))
  {
    case 1:
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_3;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_65;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_72;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_77;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_81;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_85;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_89;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_93;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_97;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_101;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_106;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_113;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_115;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_117;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_119;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_144;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_148;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_160;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_162;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_164;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_5;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_63;
      goto LABEL_68;
    case 2:
      if (objc_msgSend(v2, "productClass") == 4 && !HMFOperatingSystemVersionCompare())
      {
        v3 = HMDHomeKitVersion2_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_61:
        v3 = HMDHomeKitVersion1_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_67:
        v3 = HMDHomeKitVersion2_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_74:
        v3 = HMDHomeKitVersion2_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_79:
        v3 = HMDHomeKitVersion3_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_83:
        v3 = HMDHomeKitVersion3_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_87:
        v3 = HMDHomeKitVersion3_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_91:
        v3 = HMDHomeKitVersion4_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_95:
        v3 = HMDHomeKitVersion4_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_99:
        v3 = HMDHomeKitVersion4_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_103:
        v3 = HMDHomeKitVersion4_3String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_3:
        v3 = HMDHomeKitVersion5_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_65:
        v3 = HMDHomeKitVersion5_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_72:
        v3 = HMDHomeKitVersion5_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_111:
        v3 = HMDHomeKitVersion6_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_77:
        v3 = HMDHomeKitVersion6_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_81:
        v3 = HMDHomeKitVersion6_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_85:
        v3 = HMDHomeKitVersion6_3String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_57:
        v3 = HMDHomeKitVersion7_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_146:
        v3 = HMDHomeKitVersion7_0_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_89:
        v3 = HMDHomeKitVersion7_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_93:
        v3 = HMDHomeKitVersion7_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_97:
        v3 = HMDHomeKitVersion7_3String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_101:
        v3 = HMDHomeKitVersion8_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_106:
        v3 = HMDHomeKitVersion8_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_113:
        v3 = HMDHomeKitVersion8_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_115:
        v3 = HMDHomeKitVersion9_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_117:
        v3 = HMDHomeKitVersion9_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_158:
        v3 = HMDHomeKitVersion10_0String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_119:
        v3 = HMDHomeKitVersion10_1String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_144:
        v3 = HMDHomeKitVersion10_2String;
        goto LABEL_104;
      }
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_148;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_160;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_162;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_164;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_5;
      if (HMFOperatingSystemVersionCompare() != 1)
        goto LABEL_68;
      goto LABEL_63;
    case 3:
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_61;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_67;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_74;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_79;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_83;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_87;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_91;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_95;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_99;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_103;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_3;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_65;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_72;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_111;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_81;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_85;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_57;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_89;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_93;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_97;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_101;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_106;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_113;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_115;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_117;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_158;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_119;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_144;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_148;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_160;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_162;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_164;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_5;
      if (HMFOperatingSystemVersionCompare() != 1)
        goto LABEL_68;
      goto LABEL_63;
    case 4:
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_67;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_74;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_79;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_83;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_87;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_91;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_95;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_99;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_103;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_3;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_65;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_72;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_77;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_81;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_85;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_57;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_146;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_89;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_93;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_97;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_101;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_106;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_113;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_115;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_117;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_158;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_119;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_144;
      if (HMFOperatingSystemVersionCompare() == 1)
      {
        v3 = HMDHomeKitVersion10_3String;
      }
      else if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_148:
        v3 = HMDHomeKitVersion10_3_1String;
      }
      else if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_160:
        v3 = HMDHomeKitVersion10_4String;
      }
      else if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_162:
        v3 = HMDHomeKitVersion10_5String;
      }
      else if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_164:
        v3 = HMDHomeKitVersion10_6String;
      }
      else if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_5:
        v3 = HMDHomeKitVersion11_1String;
      }
      else if (HMFOperatingSystemVersionCompare() == 1)
      {
LABEL_63:
        v3 = HMDHomeKitVersion11_2String;
      }
      else
      {
LABEL_68:
        if (HMFOperatingSystemVersionCompare() == 1)
          v3 = HMDHomeKitVersion11_4String;
        else
LABEL_70:
          v3 = HMDHomeKitVersion12_0String;
      }
LABEL_104:
      v4 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", *v3);

      return v4;
    case 5:
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_5;
      if (HMFOperatingSystemVersionCompare() == 1)
        goto LABEL_63;
      goto LABEL_68;
    default:
      goto LABEL_70;
  }
}

- (HMDDeviceCapabilities)hmd_capabilities
{
  HMDDeviceCapabilities *v2;
  void *v3;
  HMDDeviceCapabilities *v4;

  v2 = [HMDDeviceCapabilities alloc];
  objc_msgSend(a1, "hmd_productInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDDeviceCapabilities initWithProductInfo:](v2, "initWithProductInfo:", v3);

  return v4;
}

- (id)hmd_handlesForService:()HMDAccounts
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _HMDLocalDeviceHandle *v9;
  HMDDeviceHandle *v10;
  void *v11;
  void *v12;
  _HMDGlobalDeviceHandle *v13;
  HMDDeviceHandle *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(a1, "uniqueIDOverride");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUUIDString:", v7);

  if (v8)
  {
    v9 = -[_HMDLocalDeviceHandle initWithDeviceIdentifier:]([_HMDLocalDeviceHandle alloc], "initWithDeviceIdentifier:", v8);
    if (v9)
    {
      v10 = -[HMDDeviceHandle initWithInternal:]([HMDDeviceHandle alloc], "initWithInternal:", v9);
      objc_msgSend(v5, "addObject:", v10);

    }
    objc_msgSend(a1, "pushToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hmd_preferredHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_msgSend(v11, "hmf_isZeroed") & 1) == 0 && v12)
    {
      v13 = -[_HMDGlobalDeviceHandle initWithPushToken:accountHandle:]([_HMDGlobalDeviceHandle alloc], "initWithPushToken:accountHandle:", v11, v12);
      if (!v13)
      {
LABEL_12:

        v16 = (void *)objc_msgSend(v5, "copy");
        goto LABEL_16;
      }
      v14 = -[HMDDeviceHandle initWithInternal:]([HMDDeviceHandle alloc], "initWithInternal:", v13);
    }
    else
    {
      v15 = (void *)IDSCopyIDForDevice();
      v13 = (_HMDGlobalDeviceHandle *)objc_msgSend(v15, "mutableCopy");

      -[_HMDGlobalDeviceHandle replaceOccurrencesOfString:withString:options:range:](v13, "replaceOccurrencesOfString:withString:options:range:", CFSTR("self-token"), CFSTR("token"), 1, 0, -[_HMDGlobalDeviceHandle length](v13, "length"));
      +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v13);
      v14 = (HMDDeviceHandle *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    objc_msgSend(v5, "addObject:", v14);
    goto LABEL_11;
  }
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = a1;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543362;
    v23 = v20;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to create device identifier", (uint8_t *)&v22, 0xCu);

  }
  objc_autoreleasePoolPop(v17);
  v16 = (void *)MEMORY[0x1E0C9AA60];
LABEL_16:

  return v16;
}

- (id)hmd_preferredHandleForService:()HMDAccounts
{
  void *v1;
  id v2;
  uint64_t v3;
  void *i;
  void *v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "hmd_handlesForService:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v5, "isGlobal") & 1) != 0)
        {
          v2 = v5;
          goto LABEL_11;
        }
      }
      v2 = (id)objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

@end
