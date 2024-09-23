@implementation DMCReturnToServiceHelper

+ (id)preseveReturnToServiceDataWithMDMProfileData:(id)a3 wifiProfileData:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v28;
  uint8_t buf[16];

  v7 = (objc_class *)MEMORY[0x24BE2A830];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "clear");
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLanguageStrings:", v11);

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocaleString:", v13);

  objc_msgSend(v10, "setWifiProfileData:", v8);
  objc_msgSend(v10, "setMdmProfileData:", v9);

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsSupervised:", objc_msgSend(v14, "isSupervised"));

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isSupervised") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isTeslaEnrolled");

    if ((v17 & 1) == 0)
    {
      v18 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219D1D000, v18, OS_LOG_TYPE_DEFAULT, "Doing RRTS on non-ADE enrolled device, need to preserve the cloud config", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "details");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "mutableCopy");

      v22 = MEMORY[0x24BDBD1C0];
      objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE60DD8]);
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE60DE0]);
      v23 = (void *)objc_msgSend(v21, "copy");
      objc_msgSend(v10, "setCloudConfigurationDetails:", v23);

    }
  }
  else
  {

  }
  v28 = 0;
  objc_msgSend(v10, "preserveWithError:", &v28);
  v24 = v28;
  v25 = v24;
  if (v24)
  {
    v26 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v24);
  }
  else
  {
    v26 = v10;
  }

  return v26;
}

@end
