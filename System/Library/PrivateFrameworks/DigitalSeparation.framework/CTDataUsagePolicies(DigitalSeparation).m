@implementation CTDataUsagePolicies(DigitalSeparation)

+ (id)ds_DataUsagePolicyWithPolicy:()DigitalSeparation sourceName:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[DSSourceDescriptor sourceDescriptorForSource:](DSSourceDescriptor, "sourceDescriptorForSource:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsageBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (objc_msgSend(v7, "requiresWifi") & 1) != 0 || objc_msgSend(v5, "wifi") != 0;
      v13 = (objc_msgSend(v7, "requiresCellular") & 1) != 0 || objc_msgSend(v5, "cellular") != 0;
      objc_msgSend(v5, "bundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", v8) && objc_msgSend(v5, "wifi") == v9)
      {
        v15 = objc_msgSend(v5, "cellular");

        if (v15 == v13)
        {
          DSLogCTDataUsagePolicies();
          v11 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            goto LABEL_9;
          v17 = 138543362;
          v18 = v8;
          v12 = "Data usage policy for %{public}@ is already configured";
          goto LABEL_8;
        }
      }
      else
      {

      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2730]), "init:withCellularPolicy:wifiPolicy:isManaged:andIsRestricted:", v8, v13, v9, objc_msgSend(v5, "isManaged"), objc_msgSend(v5, "isRestricted"));
      goto LABEL_21;
    }
    DSLogCTDataUsagePolicies();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v10 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v17 = 138543362;
    v18 = v6;
    v12 = "No data usage policy found for %{public}@";
LABEL_8:
    _os_log_impl(&dword_227D24000, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 0xCu);
    goto LABEL_9;
  }
  v10 = 0;
LABEL_22:

  return v10;
}

@end
