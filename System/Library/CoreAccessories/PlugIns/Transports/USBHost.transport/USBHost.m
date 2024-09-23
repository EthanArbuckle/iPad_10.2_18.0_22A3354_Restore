uint64_t usbUtil_getInterfaceAndNameString(io_service_t a1, const __CFUUID *a2, io_service_t a3, const __CFUUID *a4, _QWORD *a5)
{
  const __CFUUID *v10;
  const __CFUUID *v11;
  kern_return_t v12;
  uint64_t v13;
  IOCFPlugInInterface **v14;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDBytes v16;
  int v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  const __CFUUID *v28;
  const __CFUUID *v29;
  IOCFPlugInInterface **v30;
  HRESULT (__cdecl *v31)(void *, REFIID, LPVOID *);
  CFUUIDBytes v32;
  int v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BOOL8 v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _WORD v89[2];
  int v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  IOCFPlugInInterface **v94;
  unsigned __int8 v95;
  uint64_t v96;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint8_t v99[4];
  const char *v100;
  __int16 v101;
  int v102;
  __int16 v103;
  io_service_t v104;
  __int16 v105;
  _BYTE v106[14];
  __int16 v107;
  int v108;
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;
  __int16 v113;
  int v114;
  uint8_t buf[32];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  theInterface = 0;
  theScore = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "usbUtil_getInterfaceAndNameString";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a3;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = a1;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = a5 != 0;
    _os_log_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: interface %d, device %d, out provided %d", buf, 0x1Eu);
  }
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Du, 0xC7u, 0xB7u, 0x80u, 0x9Eu, 0xC0u, 0x11u, 0xD4u, 0xA5u, 0x4Fu, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v12 = IOCreatePlugInInterfaceForService(a1, v10, v11, &theInterface, &theScore);
  v13 = 0;
  if (!v12)
  {
    v14 = theInterface;
    if (theInterface)
    {
      v96 = 0;
      QueryInterface = (*theInterface)->QueryInterface;
      v16 = CFUUIDGetUUIDBytes(a2);
      v17 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v14, *(_QWORD *)&v16.byte0, *(_QWORD *)&v16.byte8, &v96);
      if (((unsigned int (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface))
      {
        v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v18)
          usbUtil_getInterfaceAndNameString_cold_7(v18, v19, v20, v21, v22, v23, v24, v25);
      }
      if (v17)
        v26 = 1;
      else
        v26 = v96 == 0;
      if (v26)
        return 0;
      v95 = 0;
      v93 = 0;
      v94 = 0;
      v28 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
      v29 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      if (IOCreatePlugInInterfaceForService(a3, v28, v29, &v94, &theScore))
        return 0;
      v30 = v94;
      if (!v94)
        return 0;
      v31 = (*v94)->QueryInterface;
      v32 = CFUUIDGetUUIDBytes(a4);
      v33 = ((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))v31)(v30, *(_QWORD *)&v32.byte0, *(_QWORD *)&v32.byte8, &v93);
      if (((unsigned int (*)(IOCFPlugInInterface **))(*v94)->Release)(v94)
        && (v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR)))
      {
        usbUtil_getInterfaceAndNameString_cold_3(v34, v35, v36, v37, v38, v39, v40, v41);
        if (v33)
          return 0;
      }
      else if (v33)
      {
        return 0;
      }
      if (v93)
      {
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v96 + 64))(v96))
        {
          v42 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v42)
            usbUtil_getInterfaceAndNameString_cold_5(v42, v43, v44, v45, v46, v47, v48, v49);
          v13 = 0;
LABEL_52:
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v96 + 24))(v96))
          {
            v81 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v81)
              usbUtil_getInterfaceAndNameString_cold_1(v81, v82, v83, v84, v85, v86, v87, v88);
          }
          return v13;
        }
        if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v93 + 344))(v93, &v95))
        {
          v13 = 0;
LABEL_49:
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v96 + 72))(v96))
          {
            v73 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v73)
              usbUtil_getInterfaceAndNameString_cold_2(v73, v74, v75, v76, v77, v78, v79, v80);
          }
          goto LABEL_52;
        }
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v120 = 0u;
        v121 = 0u;
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        memset(buf, 0, sizeof(buf));
        v89[0] = 1664;
        v89[1] = v95 | 0x300;
        v90 = 16778249;
        v91 = buf;
        v92 = 0;
        v13 = 0;
        if ((*(unsigned int (**)(uint64_t, _WORD *))(*(_QWORD *)v96 + 208))(v96, v89))
          goto LABEL_49;
        v50 = v92;
        v51 = v91;
        if (v92 < 4)
        {
          LODWORD(v52) = v92;
        }
        else
        {
          v52 = (v92 - 2);
          if (v91[v52])
            goto LABEL_38;
          v53 = (v92 - 1);
          if (v91[v53])
            goto LABEL_38;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v54 = v51[v52];
            v55 = v51[v53];
            *(_DWORD *)v99 = 136317186;
            v100 = "usbUtil_getInterfaceAndNameString";
            v101 = 1024;
            v102 = 107;
            v103 = 1024;
            v104 = a3;
            v105 = 1024;
            *(_DWORD *)v106 = v95;
            *(_WORD *)&v106[4] = 2048;
            *(_QWORD *)&v106[6] = v51;
            v107 = 1024;
            v108 = v54;
            v109 = 1024;
            v110 = v55;
            v111 = 1024;
            v112 = v50;
            v113 = 1024;
            v114 = v50 - 2;
            _os_log_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s:%d interface %d, stringIndex %d, pData[end] %p [%02x %02x], Adjust wLenDone %d -> %d", v99, 0x40u);
          }
        }
        if (v52 < 3)
          goto LABEL_43;
        v52 = (v52 - 2);
LABEL_38:
        v56 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v51 + 2, v52, 2483028224);
        if (v56)
        {
          v13 = v56;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v99 = 136315906;
            v100 = "usbUtil_getInterfaceAndNameString";
            v101 = 1024;
            v102 = a3;
            v103 = 1024;
            v104 = v95;
            v105 = 2112;
            *(_QWORD *)v106 = v13;
            _os_log_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: interface %d, stringIndex %d, name '%@'", v99, 0x22u);
          }
          if (a5)
          {
            *a5 = v93;
            goto LABEL_49;
          }
LABEL_46:
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v93 + 24))(v93))
          {
            v65 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v65)
              usbUtil_getInterfaceAndNameString_cold_3(v65, v66, v67, v68, v69, v70, v71, v72);
          }
          goto LABEL_49;
        }
LABEL_43:
        v57 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v57)
          usbUtil_getInterfaceAndNameString_cold_4(v57, v58, v59, v60, v61, v62, v63, v64);
        v13 = 0;
        goto LABEL_46;
      }
      return 0;
    }
  }
  return v13;
}

uint64_t usbUtil_findParentOfClass(io_object_t a1, const char *a2, const char *a3)
{
  kern_return_t ParentEntry;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  io_registry_entry_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    usbUtil_findParentOfClass_cold_3();
  parent = 0;
  IOObjectRetain(a1);
  if (a1)
  {
    while (1)
    {
      ParentEntry = IORegistryEntryGetParentEntry(a1, a3, &parent);
      IOObjectRelease(a1);
      if (ParentEntry)
        break;
      if (IOObjectConformsTo(parent, a2))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
          usbUtil_findParentOfClass_cold_1();
        goto LABEL_12;
      }
      a1 = parent;
      parent = 0;
      if (!a1)
        goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      usbUtil_findParentOfClass_cold_2((uint64_t)a2);
  }
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v10 = "usbUtil_findParentOfClass";
    v11 = 1024;
    v12 = 194;
    v13 = 1024;
    v14 = parent;
    v15 = 2080;
    v16 = a2;
    v17 = 2080;
    v18 = a3;
    _os_log_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%s:%d parent %d after Looking for match for %s in plane %s", buf, 0x2Cu);
  }
  return parent;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id acc_userNotifications_generateIdentifier(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = 0;
  if (a1 && a2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), a1, a2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

ACCUserNotification *acc_userNotifications_accessoryNotSupported()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Accessory Not Supported"), &stru_24D706EB8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  acc_strings_bundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("This accessory is not supported by this device."), &stru_24D706EB8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v4);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  -[ACCUserNotification setPresentViaSystemAperture:](v0, "setPresentViaSystemAperture:", 1);
  return v0;
}

ACCUserNotification *acc_userNotifications_chargingNotSupported()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Charging Not Supported"), &stru_24D706EB8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  acc_strings_bundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Charging with this accessory is not supported by Apple Device."), &stru_24D706EB8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v4);

  acc_strings_bundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Dismiss"), &stru_24D706EB8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setDefaultButtonName:](v0, "setDefaultButtonName:", v6);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  return v0;
}

ACCUserNotification *acc_userNotifications_unlockToUseAccessories()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 2);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Accessory Connected"), &stru_24D706EB8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  v3 = (void *)MEMORY[0x24BDD17C8];
  acc_strings_bundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Unlock %@ to use accessories"), &stru_24D706EB8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, systemInfo_copyDeviceClass());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v6);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  -[ACCUserNotification setDismissOnUnlock:](v0, "setDismissOnUnlock:", 1);
  -[ACCUserNotification setIgnoreQuietMode:](v0, "setIgnoreQuietMode:", 1);
  -[ACCUserNotification setSystemSoundID:](v0, "setSystemSoundID:", &unk_24D70B5C8);
  return v0;
}

ACCUserNotification *acc_userNotifications_disabledHSAID()
{
  ACCUserNotification *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(ACCUserNotification);
  -[ACCUserNotification setType:](v0, "setType:", 1);
  acc_strings_bundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Serial Boot-Arg Detected"), &stru_24D706EB8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setTitle:](v0, "setTitle:", v2);

  acc_strings_bundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("There are known compatibility issues with the 'serial' boot-arg and Smart Connector accessories, even for those not using HSAID. Please disable the 'serial' boot-arg when using Smart Connector accessories."), &stru_24D706EB8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACCUserNotification setMessage:](v0, "setMessage:", v4);

  -[ACCUserNotification setIsModal:](v0, "setIsModal:", 0);
  return v0;
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", a2, a1);

}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a2, a1);

}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", a1, a2);

}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsLogging](ACCUserDefaults, "sharedDefaultsLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

void sub_2171C4060(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

id logObjectForModule()
{
  BOOL v0;
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  if (gLogObjects)
    v0 = gNumLogObjects < 1;
  else
    v0 = 1;
  if (v0)
  {
    v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v1)
      logObjectForModule_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);
    v10 = (id)MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  return v10;
}

void __AppleUSBHostBillboardDeviceAdded(void *a1, io_iterator_t a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "__AppleUSBHostBillboardDeviceAdded";
    v19 = 1024;
    v20 = objc_msgSend(v3, "accessoryUSBBillboardDeviceVIDPID");
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "%s: listener(0x%X) = %@", buf, 0x1Cu);
  }

  v7 = IOIteratorNext(a2);
  if ((_DWORD)v7)
  {
    v8 = v7;
    v9 = MEMORY[0x24BDACB70];
    do
    {
      v10 = gLogObjects;
      v11 = gNumLogObjects;
      if (gLogObjects)
        v12 = gNumLogObjects < 1;
      else
        v12 = 1;
      if (v12)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v18 = (const char *)v10;
          v19 = 1024;
          v20 = v11;
          _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v13 = v9;
        v14 = v9;
      }
      else
      {
        v14 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "__AppleUSBHostBillboardDeviceAdded";
        v19 = 1024;
        v20 = v8;
        _os_log_impl(&dword_2171C1000, v14, OS_LOG_TYPE_DEFAULT, "%s: Connected BillboardDevice service with service %d", buf, 0x12u);
      }

      objc_msgSend(v3, "AppleUSBHostBillboardDeviceServiceArrived:", v8);
      IOObjectRelease(v8);
      v8 = IOIteratorNext(a2);
    }
    while ((_DWORD)v8);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __AppleUSBHostBillboardDeviceAdded_cold_1(v3);

}

void __AppleUSBHostBillboardDeviceTerminated(void *a1, io_iterator_t a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "__AppleUSBHostBillboardDeviceTerminated";
    v19 = 1024;
    v20 = objc_msgSend(v3, "accessoryUSBBillboardDeviceVIDPID");
    v21 = 2112;
    v22 = v3;
    _os_log_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEFAULT, "%s: listener(0x%X) = %@", buf, 0x1Cu);
  }

  v7 = IOIteratorNext(a2);
  if ((_DWORD)v7)
  {
    v8 = v7;
    v9 = MEMORY[0x24BDACB70];
    do
    {
      v10 = gLogObjects;
      v11 = gNumLogObjects;
      if (gLogObjects)
        v12 = gNumLogObjects < 1;
      else
        v12 = 1;
      if (v12)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v18 = (const char *)v10;
          v19 = 1024;
          v20 = v11;
          _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v13 = v9;
        v14 = v9;
      }
      else
      {
        v14 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "__AppleUSBHostBillboardDeviceTerminated";
        v19 = 1024;
        v20 = v8;
        _os_log_impl(&dword_2171C1000, v14, OS_LOG_TYPE_DEFAULT, "%s: Terminated BillboardDevice service with service %d", buf, 0x12u);
      }

      objc_msgSend(v3, "AppleUSBHostBillboardDeviceServiceTerminated:", v8);
      IOObjectRelease(v8);
      v8 = IOIteratorNext(a2);
    }
    while ((_DWORD)v8);
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v15 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    __AppleUSBHostBillboardDeviceTerminated_cold_1(v3);

}

void sub_2171C4734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C5734(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C5B84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C5ECC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C62A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C6694(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C67CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2171C688C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_2171C6F5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t serviceAdded(void *a1, const char *a2)
{
  return objc_msgSend(a1, "serviceAdded:", a2);
}

uint64_t serviceRemoved(void *a1, const char *a2)
{
  return objc_msgSend(a1, "serviceRemoved:", a2);
}

void sub_2171CA70C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2171CBE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_2171CC190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t VIDPIDServiceAdded(void *a1, const char *a2)
{
  return objc_msgSend(a1, "VIDPIDServiceAdded:", a2);
}

uint64_t VIDPIDServiceRemoved(void *a1, const char *a2)
{
  return objc_msgSend(a1, "VIDPIDServiceRemoved:", a2);
}

void sub_2171CD7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Unwind_Resume(exception_object);
}

void sub_2171CDA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2171CDB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2171CDCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2171CDE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2171CE1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_9(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1)
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_0);
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1)
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_2);
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_7);
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_10);
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("AudioAccessory"));

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  CFTypeID v0;
  uint64_t result;

  if (systemInfo_copyRegionCode_onceToken != -1)
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_15);
  if (systemInfo_copyRegionCode_regionCode)
  {
    v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID())
      return systemInfo_copyRegionCode_regionCode;
  }
  result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result;

  result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t (*__ptr32 *v2)();
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_2171DE000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_2171C1000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_2171C1000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_2171DE000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 54);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

uint64_t findPipe(uint64_t a1, unsigned int a2, int a3, int a4, unsigned __int8 *a5, _WORD *a6)
{
  int v8;
  NSObject *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v17;
  NSObject *v18;
  _WORD *v19;
  unsigned __int8 *v20;
  id v21;
  char v27;
  __int16 v28;
  unsigned __int8 v29;
  __int16 v30;
  uint8_t buf[4];
  _BYTE v32[10];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (!a2)
    return 3758097084;
  v8 = 1;
  v9 = MEMORY[0x24BDACB70];
  v10 = 1;
  while (1)
  {
    v30 = 0;
    v29 = 0;
    v28 = 0;
    v27 = 0;
    v11 = (*(uint64_t (**)(uint64_t, _QWORD, char *, __int16 *, unsigned __int8 *, __int16 *, char *))(*(_QWORD *)a1 + 208))(a1, v10, (char *)&v30 + 1, &v30, &v29, &v28, &v27);
    if ((_DWORD)v11)
    {
      v12 = gLogObjects;
      v13 = gNumLogObjects;
      if (gLogObjects)
        v14 = gNumLogObjects < 1;
      else
        v14 = 1;
      if (v14)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)v32 = v12;
          *(_WORD *)&v32[8] = 1024;
          v33 = v13;
          _os_log_error_impl(&dword_2171C1000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
        }
        v15 = v9;
        v17 = v9;
      }
      else
      {
        v17 = *(id *)gLogObjects;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v32 = v11;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v8;
        _os_log_error_impl(&dword_2171C1000, v17, OS_LOG_TYPE_ERROR, "GetPipeProperties failed with error: %08x for currentPipeRef: %d", buf, 0xEu);
      }

      goto LABEL_25;
    }
    if (HIBYTE(v30) == a3 && v29 == a4)
      break;
LABEL_25:
    v8 = ++v10;
    if (v10 > a2)
      return v11;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
    v20 = a5;
    v19 = a6;
  }
  else
  {
    v20 = a5;
    v19 = a6;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v32 = a3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = a4;
    _os_log_impl(&dword_2171C1000, v18, OS_LOG_TYPE_INFO, "found USB pipe successfully for direction %d and type %d", buf, 0xEu);
  }

  if (v20)
    *v20 = v10;
  if (v19)
    *v19 = v28;
  return 0;
}

void InterruptReadCompletion(void *a1, int a2, int a3)
{
  id v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  IAPDataBuffer *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  int v19;
  IAPDataBuffer *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  id v28;
  int v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v29 = 67109888;
    v30 = a2;
    v31 = 1024;
    v32 = a3;
    v33 = 1024;
    v34 = objc_msgSend(v5, "interruptBulkReadAllocCount");
    v35 = 1024;
    v36 = objc_msgSend(v5, "interruptBulkReadReleaseCount");
    _os_log_debug_impl(&dword_2171C1000, v8, OS_LOG_TYPE_DEBUG, "InterruptReadCompletion: result=%d numBytesRead=%u, counts %d : %d", (uint8_t *)&v29, 0x1Au);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v9 = MEMORY[0x24BDACB70];
      v10 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      InterruptReadCompletion_cold_10();

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v11 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    InterruptReadCompletion_cold_8();

  v13 = objc_msgSend(v5, "hasReadInterruptPipe");
  if (!a2 && v13)
  {
    v14 = -[IAPDataBuffer initWithiAPInterface:]([IAPDataBuffer alloc], "initWithiAPInterface:", v5);
    objc_msgSend(v5, "interruptBulkReadList");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v14);

    objc_msgSend(v5, "setInterruptBulkReadAllocCount:", objc_msgSend(v5, "interruptBulkReadAllocCount") + 1);
    LODWORD(v15) = objc_msgSend(v5, "interruptBulkReadAllocCount");
    if (v15 - objc_msgSend(v5, "interruptBulkReadReleaseCount") >= 2)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v16 = MEMORY[0x24BDACB70];
        v17 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v5, "interruptBulkReadAllocCount");
        v19 = objc_msgSend(v5, "interruptBulkReadReleaseCount");
        v29 = 67109376;
        v30 = v18;
        v31 = 1024;
        v32 = v19;
        _os_log_impl(&dword_2171C1000, v16, OS_LOG_TYPE_DEFAULT, "InterruptReadCompletion: mismatched interrupt and read? counts %d : %d   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<", (uint8_t *)&v29, 0xEu);
      }

    }
    v20 = v14;
    -[IAPDataBuffer parentiAPInterface](v20, "parentiAPInterface");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21
      && *(_QWORD *)objc_msgSend(v21, "interface")
      && (*(unsigned int (**)(uint64_t, uint64_t, char *, _QWORD, void (*)(void *, int, unsigned int), IAPDataBuffer *))(*(_QWORD *)objc_msgSend(v22, "interface") + 264))(objc_msgSend(v22, "interface"), objc_msgSend(v22, "bulkInPipeRef"), v20->_dataBufferIn, LODWORD(v20->_dataBufferInLen), ReadCompletion, v20))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v23 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
        v23 = MEMORY[0x24BDACB70];
        v24 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        InterruptReadCompletion_cold_5();

    }
  }
  if (!v5 || !*(_QWORD *)objc_msgSend(v5, "interface"))
    goto LABEL_70;
  if (!objc_msgSend(v5, "interruptInPipeBuffer"))
    objc_msgSend(v5, "setInterruptInPipeBuffer:", malloc_type_calloc(1uLL, objc_msgSend(v5, "interruptInPipeMaxPacketSize"), 0x7C262143uLL));
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v25 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v25 = MEMORY[0x24BDACB70];
    v26 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    InterruptReadCompletion_cold_3();

  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(), id))(*(_QWORD *)objc_msgSend(v5, "interface") + 264))(objc_msgSend(v5, "interface"), objc_msgSend(v5, "interruptInPipeRef"), objc_msgSend(v5, "interruptInPipeBuffer"), objc_msgSend(v5, "interruptInPipeMaxPacketSize"), InterruptReadCompletion, v5))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v27 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v27 = MEMORY[0x24BDACB70];
      v28 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      InterruptReadCompletion_cold_1();

  }
  else
  {
LABEL_70:
    objc_msgSend(v5, "setHasReadInterruptPipe:", 1);
  }

}

void ReadCompletion(void *a1, int a2, unsigned int a3)
{
  unsigned int *v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  _BOOL4 v18;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  __int16 v31;
  _BYTE v32[10];
  _DWORD v33[5];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(v5, "parentiAPInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogObjects)
    v7 = gNumLogObjects < 1;
  else
    v7 = 1;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v9 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  else
  {
    v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v29 = 67109888;
    v30 = a2;
    v31 = 1024;
    *(_DWORD *)v32 = a3;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = objc_msgSend(v6, "interruptBulkReadAllocCount");
    LOWORD(v33[0]) = 1024;
    *(_DWORD *)((char *)v33 + 2) = objc_msgSend(v6, "interruptBulkReadReleaseCount");
    _os_log_debug_impl(&dword_2171C1000, v9, OS_LOG_TYPE_DEBUG, "ReadCompletion: result=%d numBytesRead=%u, counts %d : %d", (uint8_t *)&v29, 0x1Au);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v10 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ReadCompletion_cold_9();

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v12 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v12 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    ReadCompletion_cold_7();

  if (a3)
  {
    if (v6)
    {
      objc_msgSend(v6, "dataInHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *((_QWORD *)v5 + 1), a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dataInHandler");
        v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, void *))v16)[2](v16, v6, v15);

LABEL_36:
        v18 = objc_msgSend(v6, "interruptInPipeRef") != 0;
        goto LABEL_55;
      }
    }
  }
  objc_msgSend(v6, "dataInHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v19 = MEMORY[0x24BDACB70];
      v20 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      ReadCompletion_cold_4();
LABEL_53:

    if (v5)
      goto LABEL_36;
    goto LABEL_54;
  }
  if (!a3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v19 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v19 = MEMORY[0x24BDACB70];
      v21 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_2171C1000, v19, OS_LOG_TYPE_DEFAULT, "no bytes read!", (uint8_t *)&v29, 2u);
    }
    goto LABEL_53;
  }
  if (v5)
    goto LABEL_36;
LABEL_54:
  v18 = 0;
LABEL_55:
  if (!objc_msgSend(v6, "interruptInPipeRef")
    || objc_msgSend(v6, "interruptInPipeRef") && *((_QWORD *)v5 + 2) <= (unint64_t)a3)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v22 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v22 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v27 = objc_msgSend(v6, "interruptInPipeRef");
      v28 = *((_QWORD *)v5 + 1);
      v29 = 67109634;
      v30 = v27;
      v31 = 2080;
      *(_QWORD *)v32 = v28;
      *(_WORD *)&v32[8] = 1024;
      v33[0] = a3;
      _os_log_debug_impl(&dword_2171C1000, v22, OS_LOG_TYPE_DEBUG, "interruptInPipeRef = %d, dataBufferInLen = %s, numBytesRead = %d", (uint8_t *)&v29, 0x18u);
    }

    if (v6)
    {
      if (*(_QWORD *)objc_msgSend(v6, "interface"))
      {
        if (!(*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t (*)(), unsigned int *))(*(_QWORD *)objc_msgSend(v6, "interface") + 264))(objc_msgSend(v6, "interface"), objc_msgSend(v6, "bulkInPipeRef"), *((_QWORD *)v5 + 1), v5[4], ReadCompletion, v5))goto LABEL_80;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v24 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
          v24 = MEMORY[0x24BDACB70];
          v25 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          ReadCompletion_cold_1();

      }
    }
  }
  if (v18)
  {
    objc_msgSend(v6, "setInterruptBulkReadReleaseCount:", objc_msgSend(v6, "interruptBulkReadReleaseCount") + 1);
    objc_msgSend(v6, "interruptBulkReadList");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeObject:", v5);

  }
LABEL_80:

}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void __61__iAP2EASession_initWithProtocol_endpointUUID_eaSessionUUID___block_invoke()
{
  if (EANativeSessionStatus == -1)
    EANativeSessionStatus = 0;
}

void _StaticSockCallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, void *a5)
{
  id v8;
  id v9;

  v8 = a5;
  switch(a2)
  {
    case 1:
      v9 = v8;
      objc_msgSend(v8, "_readSocketCB:", a1);
      goto LABEL_7;
    case 8:
      v9 = v8;
      objc_msgSend(v8, "_writeSocketCB:", a1);
      goto LABEL_7;
    case 2:
      v9 = v8;
      objc_msgSend(v8, "_acceptSocketCB:acceptedSock:", a1, *a4);
LABEL_7:
      v8 = v9;
      break;
  }

}

void _StaticUSBWriteComplete(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a1;
  objc_msgSend(v5, "setUsbError:", a2);
  objc_msgSend(v5, "eaInterface");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_writeComplete:writeLength:", v5, a3);

}

void _StaticUSBReadComplete(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a1;
  objc_msgSend(v5, "setUsbError:", a2);
  objc_msgSend(v5, "eaInterface");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_readComplete:readLength:", v5, a3);

}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_2171D733C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t (*__ptr32 *v2)();
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_2171DE000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_2171C1000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_2171C1000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_2171C1000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_2171DE000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 54);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

const void *platform_systemInfo_copySystemName()
{
  const void *v0;

  v0 = (const void *)MGGetStringAnswer();
  CFRetain(v0);
  return v0;
}

const void *platform_systemInfo_copyBluetoothMACAddress()
{
  const void *v0;

  v0 = (const void *)MGGetStringAnswer();
  CFRetain(v0);
  return v0;
}

uint64_t platform_systemInfo_copyBluetoothMACAddressData()
{
  return MGCopyAnswer();
}

uint64_t platform_systemInfo_copyUniqueDeviceID()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  void *CFProperty;
  void *v4;
  uint64_t v5;

  v0 = IOServiceMatching("IOUSBDeviceController");
  if (!v0)
    return 0;
  MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v0);
  if (!MatchingService)
    return 0;
  v2 = MatchingService;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("DeviceDescription"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v4 = CFProperty;
  if (CFProperty)
  {
    objc_msgSend(CFProperty, "objectForKeyedSubscript:", CFSTR("serialNumber"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  IOObjectRelease(v2);

  return v5;
}

uint64_t platform_systemInfo_isIPad()
{
  return _isDeviceClass(CFSTR("iPad"));
}

uint64_t _isDeviceClass(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = (void *)systemInfo_copyDeviceClass();
  v3 = objc_msgSend(v2, "isEqualToString:", v1);

  return v3;
}

uint64_t platform_systemInfo_isIPod()
{
  return _isDeviceClass(CFSTR("iPod"));
}

uint64_t platform_systemInfo_isIPhone()
{
  return _isDeviceClass(CFSTR("iPhone"));
}

uint64_t platform_systemInfo_isATV()
{
  return _isDeviceClass(CFSTR("AppleTV"));
}

uint64_t platform_systemInfo_isWatch()
{
  return _isDeviceClass(CFSTR("Watch"));
}

uint64_t platform_systemInfo_isFPGA()
{
  return _isDeviceClass(CFSTR("iFPGA"));
}

uint64_t platform_systemInfo_isRealityDevice()
{
  return 0;
}

uint64_t platform_systemInfo_isApplePencilSupported()
{
  return MGGetBoolAnswer();
}

BOOL platform_systemInfo_isApplePencilGen1Supported()
{
  const __CFString *v0;
  _BOOL8 result;

  result = 0;
  if (MGGetBoolAnswer())
  {
    v0 = (const __CFString *)MGCopyAnswer();
    if ((MGGetBoolAnswer() & 1) != 0
      || CFStringCompare(v0, CFSTR("iPad13,18"), 0) == kCFCompareEqualTo
      || CFStringCompare(v0, CFSTR("iPad13,19"), 0) == kCFCompareEqualTo)
    {
      return 1;
    }
  }
  return result;
}

uint64_t platform_systemInfo_supportsBatteryAuthentication()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_supportsQiAuth()
{
  return 1;
}

uint64_t platform_systemInfo_isLightning()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_supportsUSBC()
{
  return MGGetBoolAnswer();
}

uint64_t platform_systemInfo_deviceType()
{
  if ((_isDeviceClass(CFSTR("Watch")) & 1) != 0)
    return 4;
  if ((_isDeviceClass(CFSTR("iPod")) & 1) != 0)
    return 2;
  if ((_isDeviceClass(CFSTR("iPad")) & 1) != 0)
    return 3;
  if ((_isDeviceClass(CFSTR("iPhone")) & 1) != 0)
    return 1;
  if (_isDeviceClass(CFSTR("AppleTV")))
    return 5;
  return 0;
}

void _asyncCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218752;
    v17 = a1;
    v18 = 1024;
    v19 = a2;
    v20 = 2048;
    v21 = a3;
    v22 = 2048;
    v23 = a4;
    _os_log_impl(&dword_2171C1000, v10, OS_LOG_TYPE_DEFAULT, "_asyncReadCallback %p %x %llx %llx\n", (uint8_t *)&v16, 0x26u);
  }

  v11 = a1;
  if ((a3 & 1) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2171C1000, v12, OS_LOG_TYPE_DEFAULT, "POLLIN", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(v11, "_handleReadDataCallback:revent:t_look:", a2, a3, a4);
  }
  if ((a3 & 0x10) != 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2171C1000, v14, OS_LOG_TYPE_DEFAULT, "POLLHUP", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(v11, "closeCDCInterface");
  }

}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)&_kLoggingModuleEntries);
  init_logging_signposts();
}

void usbUtil_getInterfaceAndNameString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "%s: error releasing device interface", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void usbUtil_getInterfaceAndNameString_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "%s: error closing USB Device", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void usbUtil_getInterfaceAndNameString_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "%s: error releasing plugin interface", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void usbUtil_getInterfaceAndNameString_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "%s: Empty interfaceNameString", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void usbUtil_getInterfaceAndNameString_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "%s: error opening USB Device", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void usbUtil_getInterfaceAndNameString_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "%s: error releasing plugin device", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void usbUtil_findParentOfClass_cold_1()
{
  int v0;
  const char *v1;
  __int16 v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 136315650;
  v1 = "usbUtil_findParentOfClass";
  v2 = 1024;
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d Found match for %s!", (uint8_t *)&v0, 0x1Cu);
}

void usbUtil_findParentOfClass_cold_2(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = a1;
  _os_log_debug_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Couldn't find parent matching class: %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void usbUtil_findParentOfClass_cold_3()
{
  __int16 v0;
  uint64_t v1;
  int v2;
  const char *v3;
  __int16 v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = 136315906;
  v3 = "usbUtil_findParentOfClass";
  v4 = 1024;
  OUTLINED_FUNCTION_2();
  v5 = v0;
  v6 = v1;
  _os_log_debug_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "%s:%d Looking for match for %s in plane %s", (uint8_t *)&v2, 0x26u);
}

void logObjectForModule_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2171C1000, MEMORY[0x24BDACB70], a3, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __AppleUSBHostBillboardDeviceAdded_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "accessoryUSBBillboardDeviceVIDPID");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2171C1000, v1, v2, "%s: EXIT listener(0x%X) = %@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void __AppleUSBHostBillboardDeviceTerminated_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "accessoryUSBBillboardDeviceVIDPID");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_2171C1000, v1, v2, "%s: EXIT listener(0x%X) = %@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_5();
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void InterruptReadCompletion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to perform asynchronous interrupt read (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void InterruptReadCompletion_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_0(&dword_2171C1000, v0, v1, "InterruptReadCompletion: queue read for interruptInPipe", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void InterruptReadCompletion_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to queue asynchronous bulk read (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void InterruptReadCompletion_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7_0(&dword_2171C1000, v0, v1, "Read %u bytes from interrupt in endpoint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void InterruptReadCompletion_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error from async interrupt read (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ReadCompletion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Unable to perform asynchronous bulk read (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ReadCompletion_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "No USB Host Data In Handler, numBytesRead: %d!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ReadCompletion_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_7_0(&dword_2171C1000, v0, v1, "Read %u bytes from bulk endpoint", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void ReadCompletion_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_1(&dword_2171C1000, v0, v1, "Error from async bulk read (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_2171C1000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC450](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x24BDBC458](allocator, *(_QWORD *)&sock, callBackTypes, callout, context);
}

void CFSocketDisableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
  MEMORY[0x24BDBC460](s, callBackTypes);
}

void CFSocketEnableCallBacks(CFSocketRef s, CFOptionFlags callBackTypes)
{
  MEMORY[0x24BDBC468](s, callBackTypes);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x24BDBC480](s);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x24BDD86C8](*(_QWORD *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x24BDD8930](*(_QWORD *)&entry, properties);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetBusyState(io_service_t service, uint32_t *busyState)
{
  return MEMORY[0x24BDD8978](*(_QWORD *)&service, busyState);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x24BDD89C8](*(_QWORD *)&service, waitTime);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t acc_strings_bundle()
{
  return MEMORY[0x24BE1A0E0]();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int cfsetispeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD960](a1, a2);
}

int cfsetospeed(termios *a1, speed_t a2)
{
  return MEMORY[0x24BDAD968](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

