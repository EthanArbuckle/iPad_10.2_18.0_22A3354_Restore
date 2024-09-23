@implementation AppleDeviceQueryBasebandFirmwareUpdateInfoArmory

+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[AppleDeviceQuerySingletonArmory sharedInstance](AppleDeviceQueryBasebandFirmwareUpdateInfoArmory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "query:isCachable:withError:", v7, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)loadFirmwareUpdateInfo:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  +[AppleDeviceQueryBasebandConnectionArmory getCoreTelephonyClient](AppleDeviceQueryBasebandConnectionArmory, "getCoreTelephonyClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    v10 = (void *)v35[5];
    v35[5] = (uint64_t)v9;

    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __75__AppleDeviceQueryBasebandFirmwareUpdateInfoArmory_loadFirmwareUpdateInfo___block_invoke;
    v21[3] = &unk_2507BED58;
    v21[4] = &v28;
    v21[5] = &v22;
    v21[6] = &v34;
    objc_msgSend(v8, "getEuiccData:", v21);
    dispatch_semaphore_wait((dispatch_semaphore_t)v35[5], 0xFFFFFFFFFFFFFFFFLL);
    if (v29[5] && !v23[5])
    {
      -[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory setFirmwareUpdateInfo:](self, "setFirmwareUpdateInfo:");
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:]", 565, CFSTR("firmwareUpdateInfo is reloaded"), v17, v18, v19, v20);
      v15 = 1;
      goto LABEL_7;
    }
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:]", 558, CFSTR("Failed to get eUICC firmware info!"), v11, v12, v13, v20);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, v23[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:]", 542, CFSTR("%@"), v5, v6, v7, (uint64_t)CFSTR("Failed to get CoreTelephonyClient instance"));
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, CFSTR("Failed to get CoreTelephonyClient instance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = 0;
  *a3 = v14;
LABEL_7:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v15;
}

void __75__AppleDeviceQueryBasebandFirmwareUpdateInfoArmory_loadFirmwareUpdateInfo___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1[4] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1[6] + 8) + 40));
}

- (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a3;
  -[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory firmwareUpdateInfo](self, "firmwareUpdateInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && a4
    || -[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory loadFirmwareUpdateInfo:](self, "loadFirmwareUpdateInfo:", a5))
  {
    -[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory firmwareUpdateInfo](self, "firmwareUpdateInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryBasebandFirmwareUpdateInfoArmory query:isCachable:withError:]", 587, CFSTR("key %@ does not exist in firmwareUpdateInfo"), v12, v13, v14, (uint64_t)v8);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSDictionary)firmwareUpdateInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFirmwareUpdateInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareUpdateInfo, 0);
}

@end
