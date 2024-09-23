Class EAWeakLinkClass(NSString *a1, const void *a2)
{
  Class result;

  result = (Class)__HandleForSource(a2);
  if (result)
    return NSClassFromString(a1);
  return result;
}

const void *__HandleForSource(const void *a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v12;

  pthread_mutex_lock(&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    v4 = CPSystemRootDirectory();
    switch((unint64_t)a1)
    {
      case 0uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("UIKit");
        v7 = CFSTR("UIKit.framework");
        goto LABEL_7;
      case 1uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("MobileCoreServices");
        v7 = CFSTR("MobileCoreServices.framework");
LABEL_7:
        v8 = CFSTR("Frameworks");
        goto LABEL_14;
      case 2uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("SpringBoardServices");
        v7 = CFSTR("SpringBoardServices.framework");
        goto LABEL_13;
      case 3uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("FrontBoardServices");
        v7 = CFSTR("FrontBoardServices.framework");
        goto LABEL_13;
      case 4uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("CarKit");
        v7 = CFSTR("CarKit.framework");
        goto LABEL_13;
      case 5uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("VisualVoicemail");
        v7 = CFSTR("VisualVoicemail.framework");
        goto LABEL_13;
      case 6uLL:
        v5 = (void *)MEMORY[0x1E0CB3940];
        v6 = (void *)MEMORY[0x1E0C99D20];
        v12 = CFSTR("CoreAccessories");
        v7 = CFSTR("CoreAccessories.framework");
LABEL_13:
        v8 = CFSTR("PrivateFrameworks");
LABEL_14:
        v9 = (void *)objc_msgSend(v5, "pathWithComponents:", objc_msgSend(v6, "arrayWithObjects:", v4, CFSTR("System"), CFSTR("Library"), v8, v7, v12, 0));
        if (!v9)
          goto LABEL_17;
        v10 = dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1);
        if (!v10)
          goto LABEL_17;
        Value = v10;
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, a1, v10);
        break;
      default:
LABEL_17:
        NSLog(CFSTR("Could not load source: %ld"), a1);
        Value = 0;
        break;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

EAAccessoryManager *GetEAAccesoryManager()
{
  return +[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager");
}

id __EAAuthDataGetterCB(uint64_t a1)
{
  id Accessory;

  NSLog(CFSTR("[#ExternalAccessory] __EAAuthDataGetterCB: %u"), a1);
  Accessory = __findAccessory(a1, -[EAAccessoryManager connectedAccessories](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "connectedAccessories"));
  if (Accessory)
    return (id)objc_msgSend(Accessory, "certData");
  NSLog(CFSTR("[#ExternalAccessory] __EAAuthDataGetterCB: falied to get accessory for %u, connectedAccessories=%@"), a1, -[EAAccessoryManager connectedAccessories](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "connectedAccessories"));
  return 0;
}

id __EAAuthSerialStringGetterCB(uint64_t a1)
{
  id Accessory;
  void *v3;
  uint64_t v4;
  id v5;
  unint64_t v6;

  NSLog(CFSTR("[#ExternalAccessory] __EAAuthSerialStringGetterCB: %u"), a1);
  Accessory = __findAccessory(a1, -[EAAccessoryManager connectedAccessories](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "connectedAccessories"));
  if (Accessory)
  {
    v3 = Accessory;
    v4 = objc_msgSend((id)objc_msgSend(Accessory, "certSerial"), "bytes");
    v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend((id)objc_msgSend(v3, "certSerial"), "length"))
    {
      v6 = 0;
      do
        objc_msgSend(v5, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v4 + v6++));
      while (v6 < objc_msgSend((id)objc_msgSend(v3, "certSerial"), "length"));
    }
    return v5;
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] __EAAuthSerialStringGetterCB: falied to get accessory for %u, connectedAccessories=%@"), a1, -[EAAccessoryManager connectedAccessories](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "connectedAccessories"));
    return 0;
  }
}

void __convertIAPAccessoryToEAAccessory(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id obj;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v3 = a1;
  v93 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0D33B78];
  v5 = objc_msgSend(a1, "objectForKey:", *MEMORY[0x1E0D33B78]);
  if (v5)
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 0;
    else
      v7 = v6;
    objc_msgSend(a2, "setName:", v7);
  }
  v8 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B68]);
  if (v8)
  {
    v9 = v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = 0;
    else
      v10 = v9;
    objc_msgSend(a2, "setManufacturer:", v10);
  }
  v11 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B70]);
  if (v11)
  {
    v12 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = 0;
    else
      v13 = v12;
    objc_msgSend(a2, "setModelNumber:", v13);
  }
  v14 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33BE0]);
  if (v14)
  {
    v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = 0;
    else
      v16 = v15;
    objc_msgSend(a2, "setSerialNumber:", v16);
  }
  v17 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B40]);
  if (v17)
  {
    v18 = v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = 0;
    else
      v19 = v18;
    objc_msgSend(a2, "setFirmwareRevisionActive:", v19);
  }
  v20 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B48]);
  if (v20)
  {
    v21 = v20;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = 0;
    else
      v22 = v21;
    objc_msgSend(a2, "setFirmwareRevisionPending:", v22);
  }
  v23 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B50]);
  if (v23)
  {
    v24 = v23;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = 0;
    else
      v25 = v24;
    objc_msgSend(a2, "setHardwareRevision:", v25);
  }
  v26 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B38]);
  if (v26)
  {
    v27 = v26;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v28 = 0;
    else
      v28 = v27;
    objc_msgSend(a2, "setDockType:", v28);
  }
  v29 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B60]);
  if (v29)
  {
    v30 = (void *)v29;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v30, "isEqualToString:", &stru_1E6B07EE0))
      v30 = 0;
    objc_msgSend(a2, "setMacAddress:", v30);
  }
  v31 = EAWeakLinkStringConstant("kACCExternalAccessoryPPIDKey", (const void *)6);
  if (v31)
  {
    v32 = objc_msgSend(v3, "objectForKey:", v31);
    if (v32)
    {
      v33 = (void *)v32;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v33, "isEqualToString:", &stru_1E6B07EE0))
        v33 = 0;
      objc_msgSend(a2, "setPpid:", v33);
    }
  }
  v34 = EAWeakLinkStringConstant("kACCExternalAccessoryRegionCodeKey", (const void *)6);
  if (v34)
  {
    v35 = objc_msgSend(v3, "objectForKey:", v34);
    if (v35)
    {
      v36 = (void *)v35;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v36, "isEqualToString:", &stru_1E6B07EE0))
        v36 = 0;
      objc_msgSend(a2, "setRegionCode:", v36);
    }
  }
  v37 = EAWeakLinkStringConstant("kACCExternalAccessoryTransportType", (const void *)6);
  if (v37)
  {
    v38 = objc_msgSend(v3, "objectForKey:", v37);
    if (v38)
    {
      v39 = (void *)v38;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a2, "setTransportType:", objc_msgSend(v39, "unsignedIntegerValue"));
    }
  }
  objc_msgSend(a2, "setProtocolDetails:", objc_msgSend(v3, "objectForKey:", CFSTR("ACCExternalAccessoryProtocolDetailsKey")));
  v40 = *MEMORY[0x1E0D33C20];
  if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33C20]))
    objc_msgSend(a2, "setConnectionID:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v40), "unsignedIntValue"));
  v41 = *MEMORY[0x1E0D33BD8];
  if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33BD8]))
    objc_msgSend(a2, "setProtocols:", objc_msgSend(v3, "objectForKey:", v41));
  v42 = *MEMORY[0x1E0D33BD0];
  if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33BD0]))
    objc_msgSend(a2, "setPreferredApp:", objc_msgSend(v3, "objectForKey:", v42));
  if (objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey")))
    objc_msgSend(a2, "setCertSerial:", objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertSerialNumberKey")));
  if (objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey")))
    objc_msgSend(a2, "setCertData:", objc_msgSend(v3, "objectForKey:", CFSTR("IAPAppAccessoryCertDataKey")));
  v43 = *MEMORY[0x1E0D33B10];
  if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B10]))
    v44 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v43), "intValue");
  else
    v44 = 0;
  objc_msgSend(a2, "setClassType:", v44);
  if (objc_msgSend(v3, "objectForKey:", CFSTR("EAAccessorySpeakerMenuEQNamesKey"))
    && objc_msgSend(v3, "objectForKey:", CFSTR("EAAccessorySpeakerMenuEQIndexKey")))
  {
    objc_msgSend(a2, "setEqNames:", objc_msgSend(v3, "objectForKey:", CFSTR("EAAccessorySpeakerMenuEQNamesKey")));
    objc_msgSend(a2, "setEqIndex:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", CFSTR("EAAccessorySpeakerMenuEQIndexKey")), "unsignedIntValue"));
  }
  objc_msgSend(a2, "setCapabilities:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B08]), "intValue"));
  objc_msgSend(a2, "setLocationSentenceTypesMask:", objc_msgSend((id)objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B58]), "unsignedIntValue"));
  objc_msgSend(a2, "setVehicleInfoSupportedTypes:", objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33C00]));
  v45 = *MEMORY[0x1E0D33BF8];
  v46 = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33BF8]);
  v47 = objc_msgSend(v3, "objectForKey:", v4);
  v48 = objc_msgSend(v3, "objectForKey:", v40);
  v49 = objc_msgSend(v3, "objectForKey:", v37);
  if (v46)
  {
    NSLog(CFSTR("[#VehicleInfoStatus] For %@ - %@ (transport %@), Found initialVehicleInfoDictionary %@"), v47, v48, v49, v46);
    objc_msgSend(a2, "setVehicleInfoInitialData:", objc_msgSend(v3, "objectForKey:", v45));
  }
  else
  {
    NSLog(CFSTR("[#VehicleInfoStatus] For %@ - %@ (transport %@), No vehicle information found when converting iAP accessory to EA accessory"), v47, v48, v49);
  }
  objc_msgSend(a2, "setCameraComponents:", objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33B00]));
  v50 = *MEMORY[0x1E0D33BC8];
  if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33BC8]))
  {
    v68 = v3;
    v69 = a2;
    v51 = (void *)objc_msgSend(v3, "objectForKey:", v50);
    v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    obj = v51;
    v72 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
    if (v72)
    {
      v70 = *(_QWORD *)v87;
      do
      {
        v52 = 0;
        do
        {
          if (*(_QWORD *)v87 != v70)
            objc_enumerationMutation(obj);
          v74 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v52);
          v75 = v52;
          v53 = (void *)objc_msgSend(obj, "objectForKey:");
          v77 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
          if (v54)
          {
            v55 = v54;
            v76 = *(_QWORD *)v83;
            do
            {
              for (i = 0; i != v55; ++i)
              {
                if (*(_QWORD *)v83 != v76)
                  objc_enumerationMutation(v53);
                v57 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
                v58 = (void *)objc_msgSend(v53, "objectForKey:", v57);
                v59 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v78 = 0u;
                v79 = 0u;
                v80 = 0u;
                v81 = 0u;
                v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
                if (v60)
                {
                  v61 = v60;
                  v62 = *(_QWORD *)v79;
                  do
                  {
                    for (j = 0; j != v61; ++j)
                    {
                      if (*(_QWORD *)v79 != v62)
                        objc_enumerationMutation(v58);
                      objc_msgSend(v59, "setObject:forKey:", objc_msgSend(v58, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j));
                    }
                    v61 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v90, 16);
                  }
                  while (v61);
                }
                objc_msgSend(v77, "setObject:forKey:", v59, v57);

              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
            }
            while (v55);
          }
          objc_msgSend(v71, "setObject:forKey:", v77, v74);

          v52 = v75 + 1;
        }
        while (v75 + 1 != v72);
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
      }
      while (v72);
    }
    a2 = v69;
    objc_msgSend(v69, "setAudioPorts:", v71);

    v3 = v68;
  }
  v64 = *MEMORY[0x1E0D33BA0];
  if (objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D33BA0]))
    v65 = objc_msgSend((id)objc_msgSend(v3, "objectForKey:", v64), "BOOLValue");
  else
    v65 = 0;
  objc_msgSend(a2, "setPointOfInterestHandoffEnabled:", v65);
  v66 = EAWeakLinkStringConstant("kACCExternalAccessoryPrimaryUUID", (const void *)6);
  if (v66)
  {
    v67 = v66;
    if (objc_msgSend(v3, "objectForKey:", v66))
    {
      objc_msgSend(a2, "setCoreAccessoryPrimaryUUID:", objc_msgSend(v3, "objectForKey:", v67));
      NSLog(CFSTR("[#ExternalAccessory] eaAccessory CoreAccessoryPrimaryUUID = %@"), objc_msgSend(a2, "coreAccessoryPrimaryUUID"));
      objc_msgSend(a2, "setCreatedByCoreAccessories:", 1);
    }
    else
    {
      NSLog(CFSTR("[#ExternalAccessory] EAAccessory not created by CoreAccessories, no value for key kACCExternalAccessoryPrimaryUUID"));
    }
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] No CoreAccessories kACCExternalAccessoryPrimaryUUID"));
  }
}

id __findAccessoryByUUID(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__accessoryListLock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(a2);
        if (a1)
        {
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v8, "coreAccessoriesPrimaryUUID"), "isEqualToString:", a1))
          {
            v9 = v8;
            if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
              NSLog(CFSTR("[#ExternalAccessory] Found ea accessory %@ for accessoryUUID %@"), v9, a1);
            goto LABEL_13;
          }
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
    NSLog(CFSTR("[#ExternalAccessory] accessoryUUID %@ not found in ea accessories list"), a1);
  objc_msgSend((id)__accessoryListLock, "unlock");
  return v9;
}

void __notificationCleanup(const void *a1)
{
  if ((const void *)_BTPickerUnsupportedNotificationRef == a1)
  {
    CFRelease(a1);
    _BTPickerUnsupportedNotificationRef = 0;
  }
}

id __findAccessory(unsigned int a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)__accessoryListLock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(a2);
        if (a1)
        {
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v8, "connectionID") == a1)
          {
            v9 = v8;
            if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
              NSLog(CFSTR("[#ExternalAccessory] Found ea accessory %@ for connection id %lu"), v9, a1);
            goto LABEL_13;
          }
        }
      }
      v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
    NSLog(CFSTR("[#ExternalAccessory] connection ID %lu not found in ea accessories list"), a1);
  objc_msgSend((id)__accessoryListLock, "unlock");
  return v9;
}

void sub_1B6C32FB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __outputSocketCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "_streamWriteable");
}

void sub_1B6C372DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B6C380FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t getBTDevicePickerClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getBTDevicePickerClass_softClass;
  v8 = getBTDevicePickerClass_softClass;
  if (!getBTDevicePickerClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getBTDevicePickerClass_block_invoke;
    v2[3] = &unk_1E6B07D38;
    v2[4] = &v3;
    __getBTDevicePickerClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B6C3A220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getBTDevicePickerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!CoreBluetoothUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E6B07D58;
    v5 = 0;
    CoreBluetoothUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreBluetoothUILibraryCore_frameworkLibrary)
    __getBTDevicePickerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BTDevicePicker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getBTDevicePickerClass_block_invoke_cold_2();
  getBTDevicePickerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

_QWORD *EAUIApplicationDidEnterBackgroundNotification()
{
  _QWORD *v0;

  v0 = (_QWORD *)uikitFramework_0;
  if (uikitFramework_0)
  {
    v0 = dlsym((void *)uikitFramework_0, "UIApplicationDidEnterBackgroundNotification");
    if (v0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", *v0);
      v0 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v0;
}

void *EAWeakLinkSymbol(const char *a1, const void *a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

void *EAWeakLinkStringConstant(const char *a1, const void *a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
  {
    result = dlsym(result, a1);
    if (result)
      return *(void **)result;
  }
  return result;
}

void __getBTDevicePickerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreBluetoothUILibrary(void)"), CFSTR("EABluetoothAccessoryPicker.m"), 20, CFSTR("%s"), *a1);
  __break(1u);
}

void __getBTDevicePickerClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBTDevicePickerClass(void)_block_invoke"), CFSTR("EABluetoothAccessoryPicker.m"), 22, CFSTR("Unable to find class %s"), "BTDevicePicker");
  __break(1u);
  CFBooleanGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98E18](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1E0C98E20](allocator, *(_QWORD *)&sock, callBackTypes, callout, context);
}

void CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
  MEMORY[0x1E0C98E30](s, callBackTypes);
}

CFOptionFlags CFSocketGetSocketFlags(CFSocketRef s)
{
  return MEMORY[0x1E0C98E40](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x1E0C98E50](s);
}

void CFSocketSetSocketFlags(CFSocketRef s, CFOptionFlags flags)
{
  MEMORY[0x1E0C98E68](s, flags);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1E0CFA908]();
}

uint64_t IAP2DHasLaunched()
{
  return MEMORY[0x1E0D33AE8]();
}

uint64_t IAPAccessoryEQSelectEqualizerAtIndex()
{
  return MEMORY[0x1E0D33AF0]();
}

uint64_t IAPAppBeginOOBBTPairingForConnection()
{
  return MEMORY[0x1E0D33C08]();
}

uint64_t IAPAppCloseSessionToAccessory()
{
  return MEMORY[0x1E0D33C10]();
}

uint64_t IAPAppConnectedAccessories()
{
  return MEMORY[0x1E0D33C18]();
}

uint64_t IAPAppCreateSessionForAccessory()
{
  return MEMORY[0x1E0D33C28]();
}

uint64_t IAPAppOpenSessionFromAccessoryToApp()
{
  return MEMORY[0x1E0D33C38]();
}

uint64_t IAPAppOpenSessionFromAppToAccessory()
{
  return MEMORY[0x1E0D33C40]();
}

uint64_t IAPAppRegisterClient()
{
  return MEMORY[0x1E0D33C50]();
}

uint64_t IAPAppRequestAccessoryWiFiCredentials()
{
  return MEMORY[0x1E0D33C58]();
}

uint64_t IAPAppSendAccessibilityResponse()
{
  return MEMORY[0x1E0D33C60]();
}

uint64_t IAPAppSendDeviceIdentifierNotification()
{
  return MEMORY[0x1E0D33C68]();
}

uint64_t IAPAppSendPointOfInterestInformation()
{
  return MEMORY[0x1E0D33C70]();
}

uint64_t IAPAppStartAccessibility()
{
  return MEMORY[0x1E0D33C78]();
}

uint64_t IAPAppStopAccessibility()
{
  return MEMORY[0x1E0D33C80]();
}

uint64_t IAPAppToAppSocketPath()
{
  return MEMORY[0x1E0D33C88]();
}

uint64_t IAPCameraSendCameraControlMessage()
{
  return MEMORY[0x1E0D33CA0]();
}

uint64_t IAPCameraSendSetCameraProperties()
{
  return MEMORY[0x1E0D33CA8]();
}

uint64_t IAPCameraSendStartCameraUpdates()
{
  return MEMORY[0x1E0D33CB0]();
}

uint64_t IAPCameraSendStartLivePreview()
{
  return MEMORY[0x1E0D33CB8]();
}

uint64_t IAPDHasLaunched()
{
  return MEMORY[0x1E0D33CC0]();
}

uint64_t IAPLocationActivate()
{
  return MEMORY[0x1E0D33CF0]();
}

uint64_t IAPLocationCopyEphemerisURL()
{
  return MEMORY[0x1E0D33CF8]();
}

uint64_t IAPLocationCopyNMEAData()
{
  return MEMORY[0x1E0D33D00]();
}

uint64_t IAPLocationDeactivate()
{
  return MEMORY[0x1E0D33D08]();
}

uint64_t IAPLocationGetEphemerisMaxInterval()
{
  return MEMORY[0x1E0D33D30]();
}

uint64_t IAPLocationGetEphemerisRecommendedRefreshInterval()
{
  return MEMORY[0x1E0D33D38]();
}

uint64_t IAPLocationIsNMEADataAvailable()
{
  return MEMORY[0x1E0D33D40]();
}

uint64_t IAPLocationSendEphemeris()
{
  return MEMORY[0x1E0D33D48]();
}

uint64_t IAPLocationSendEphemerisPointData()
{
  return MEMORY[0x1E0D33D50]();
}

uint64_t IAPLocationSendGPSTime()
{
  return MEMORY[0x1E0D33D58]();
}

uint64_t IAPRegisterEAAuthGetters()
{
  return MEMORY[0x1E0D33D60]();
}

uint64_t IAPTimeSyncGetInfo()
{
  return MEMORY[0x1E0D33D68]();
}

uint64_t IAPTimeSyncResetKalmanFilter()
{
  return MEMORY[0x1E0D33D78]();
}

uint64_t IAPTimeSyncSetParams()
{
  return MEMORY[0x1E0D33D80]();
}

uint64_t IAPlocationSendGPRMCDataStatusValues()
{
  return MEMORY[0x1E0D33D90]();
}

uint64_t IAPlocationSetAccessoryNMEAFilter()
{
  return MEMORY[0x1E0D33D98]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t RetainConnectionToIAPDaemonByCheckingConnectionID()
{
  return MEMORY[0x1E0D33DA0]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1E0C9A178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1E0C80BE0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

