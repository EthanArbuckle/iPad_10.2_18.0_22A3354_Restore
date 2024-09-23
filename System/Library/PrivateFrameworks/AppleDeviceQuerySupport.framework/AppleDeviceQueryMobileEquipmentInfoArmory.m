@implementation AppleDeviceQueryMobileEquipmentInfoArmory

+ (id)query:(id)a3 ofSlot:(int64_t)a4 isCachable:(BOOL)a5 withError:(id *)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v9 = a3;
  +[AppleDeviceQuerySingletonArmory sharedInstance](AppleDeviceQueryMobileEquipmentInfoArmory, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "query:ofSlot:isCachable:withError:", v9, a4, v7, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)query:(id)a3 isCachable:(BOOL)a4 withError:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[AppleDeviceQuerySingletonArmory sharedInstance](AppleDeviceQueryMobileEquipmentInfoArmory, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "query:ofSlot:isCachable:withError:", v7, 0, v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)getMobileEquipInfoIn:(id)a3 ofSlot:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "meInfoList", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10 && objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "slotId") == a4)
        {
          v11 = v10;
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (id)queryMobileEquipInfo:(id)a3 byKey:(id)a4 withError:(id *)a5
{
  void *v6;

  objc_msgSend(a3, "valueForKey:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (BOOL)loadMobileEquipInfoList:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;

  +[AppleDeviceQueryBasebandConnectionArmory getCoreTelephonyClient](AppleDeviceQueryBasebandConnectionArmory, "getCoreTelephonyClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    v19 = 0;
    objc_msgSend(v5, "getMobileEquipmentInfo:", &v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    -[AppleDeviceQueryMobileEquipmentInfoArmory setMobileEquipInfoList:](self, "setMobileEquipInfoList:", v10);

    -[AppleDeviceQueryMobileEquipmentInfoArmory mobileEquipInfoList](self, "mobileEquipInfoList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

    if (v12)
    {
      ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:]", 353, CFSTR("mobileEquipInfoList is reloaded"), v14, v15, v16, v18);
    }
    else
    {
      ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:]", 348, CFSTR("Failed to get MobileEquipmentInfo: %@"), v14, v15, v16, (uint64_t)v11);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 4, v11);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:]", 340, CFSTR("Failed to get CoreTelephonyClient instance"), v6, v7, v8, v18);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 39, 0);
    v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)query:(id)a3 ofSlot:(int64_t)a4 isCachable:(BOOL)a5 withError:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  -[AppleDeviceQueryMobileEquipmentInfoArmory mobileEquipInfoList](self, "mobileEquipInfoList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && a5
    || -[AppleDeviceQueryMobileEquipmentInfoArmory loadMobileEquipInfoList:](self, "loadMobileEquipInfoList:", a6))
  {
    if ((unint64_t)(a4 - 1) > 1)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[AppleDeviceQueryMobileEquipmentInfoArmory mobileEquipInfoList](self, "mobileEquipInfoList");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "meInfoList");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (!v20)
      {
LABEL_17:
        v18 = 0;
        goto LABEL_22;
      }
      v21 = v20;
      v22 = *(_QWORD *)v28;
LABEL_10:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v22)
          objc_enumerationMutation(v13);
        v24 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23);
        if (v24)
        {
          +[AppleDeviceQueryMobileEquipmentInfoArmory queryMobileEquipInfo:byKey:withError:](AppleDeviceQueryMobileEquipmentInfoArmory, "queryMobileEquipInfo:byKey:withError:", v24, v10, a6);
          v17 = objc_claimAutoreleasedReturnValue();
          if (v17)
            break;
        }
        if (v21 == ++v23)
        {
          v21 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v21)
            goto LABEL_10;
          goto LABEL_17;
        }
      }
    }
    else
    {
      -[AppleDeviceQueryMobileEquipmentInfoArmory mobileEquipInfoList](self, "mobileEquipInfoList");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[AppleDeviceQueryMobileEquipmentInfoArmory getMobileEquipInfoIn:ofSlot:](AppleDeviceQueryMobileEquipmentInfoArmory, "getMobileEquipInfoIn:ofSlot:", v12, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v25 = 1;
        if (a4 != 1)
          v25 = 2;
        ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "-[AppleDeviceQueryMobileEquipmentInfoArmory query:ofSlot:isCachable:withError:]", 373, CFSTR("no mobile equipment information of slot%d"), v14, v15, v16, v25);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithZhuGeErrorCode:underlyingError:", 29, 0);
        v18 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_22;
      }
      +[AppleDeviceQueryMobileEquipmentInfoArmory queryMobileEquipInfo:byKey:withError:](AppleDeviceQueryMobileEquipmentInfoArmory, "queryMobileEquipInfo:byKey:withError:", v13, v10, a6);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = (void *)v17;
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (CTMobileEquipmentInfoList)mobileEquipInfoList
{
  return (CTMobileEquipmentInfoList *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMobileEquipInfoList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileEquipInfoList, 0);
}

@end
