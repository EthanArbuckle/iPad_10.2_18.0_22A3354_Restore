@implementation CRPearlController

- (id)decompressPearlFrames
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  int v18;
  id v19;
  id v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  size_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v45;
  id v46;
  id v47;
  uint8_t buf[4];
  const char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[CRPearlController decompressPearlFrames]";
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_fileExistsAtPath_(v7, v8, (uint64_t)CFSTR("/var/hardware/Pearl"), v9);

  if (v10)
  {
    handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = CFSTR("/var/hardware/Pearl");
      _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v18 = objc_msgSend_removeItemAtPath_error_(v16, v17, (uint64_t)CFSTR("/var/hardware/Pearl"), (uint64_t)&v47);
    v19 = v47;

    if (!v18 || v19)
    {
      handleForCategory(0);
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        sub_21456D744((uint64_t)v19, v43);

      sub_214512470((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Failed to delete existing Pearl Data"), v19);
      v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  v46 = 0;
  v19 = (id)objc_msgSend__copyCombinedFDRData_withError_(self, v11, (uint64_t)CFSTR("prf1"), (uint64_t)&v46);
  v20 = v46;
  v21 = v20;
  if (!v19 || v20)
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFD6, CFSTR("Found no prf1 data"), v20);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v41;
LABEL_16:
    v40 = v42;
    goto LABEL_17;
  }
  v19 = objc_retainAutorelease(v19);
  v25 = (const void *)objc_msgSend_bytes(v19, v22, v23, v24);
  v29 = objc_msgSend_length(v19, v26, v27, v28);
  v32 = objc_msgSend_cStringUsingEncoding_(CFSTR("/private/var/hardware/Pearl"), v30, 4, v31);
  v33 = sub_2145642D0(v25, v29, v32);
  if ((_DWORD)v33)
  {
    v35 = v33;
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v34, (uint64_t)CFSTR("BiometricError"), (int)v33, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v37, (uint64_t)CFSTR("Failed to decompress Pearl frames, error: 0x%x"), v38, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    sub_214512470((void *)0xFFFFFFFFFFFFFFF7, v39, v36);
    v40 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    handleForCategory(0);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v45, OS_LOG_TYPE_DEFAULT, "Decompress Pearl frames successfully", buf, 2u);
    }

    v40 = 0;
  }
LABEL_17:

  return v40;
}

- (id)_copyCombinedFDRData:(id)a3 withError:(id *)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[3];
  id buf[4];

  buf[3] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = a3;
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(id *)((char *)buf + 4) = "-[CRPearlController _copyCombinedFDRData:withError:]";
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)buf, 0xCu);
  }

  buf[0] = 0;
  v11[0] = CFSTR("GetCombined");
  v11[1] = CFSTR("StripImg4");
  v12[0] = MEMORY[0x24BDBD1C8];
  v12[1] = MEMORY[0x24BDBD1C0];
  v11[2] = CFSTR("VerifyData");
  v12[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v7, (uint64_t)v12, (uint64_t)v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)AMFDRSealingManifestCopyLocalDataForClass();

  if (a4 && buf[0])
    *a4 = buf[0];

  return v9;
}

- (id)updateSavageDATFirmware
{
  NSObject *v2;
  const char *CStringPtr;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  CFURLRef v12;
  const char *v13;
  uint64_t v14;
  CFURLRef v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const void *DefaultAMAuthInstallRef;
  const char *v25;
  uint64_t v26;
  CFMutableDictionaryRef v27;
  __CFDictionary *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  __CFString *v32;
  int v33;
  const void *v34;
  const void *v35;
  void *v36;
  int v37;
  const void *v38;
  NSObject *v39;
  const __CFString *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  id *v46;
  unsigned int YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error;
  unsigned int v48;
  id v49;
  const char *v50;
  uint64_t v51;
  __CFString *v52;
  const void *v53;
  NSObject *v54;
  int v55;
  const char *v56;
  uint64_t v57;
  NSObject *v58;
  const __CFString *v59;
  NSObject *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  char v78;
  id v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  int v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  char v97;
  id v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  __CFString *v108;
  __CFString *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  CFURLRef cf;
  void *v115;
  __CFDictionary *v116;
  const void *v117;
  const void *v118;
  uint64_t v119;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  void *value;
  id v125;
  uint64_t v126;
  const void *v127;
  void *v128;
  uint8_t buf[4];
  const char *v130;
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v130 = "-[CRPearlController updateSavageDATFirmware]";
    _os_log_impl(&dword_214503000, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v127 = 0;
  v128 = 0;
  v126 = 0;
  CStringPtr = CFStringGetCStringPtr(CFSTR("Savage"), 0x8000100u);
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v125 = 0;
  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], v6, (uint64_t)CFSTR("/private/preboot/active"), 1, &v125);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v125;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("%s/%@/"), v10, "/private/preboot/", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFURLCreateWithFileSystemPath(0, CFSTR("/tmp/"), kCFURLPOSIXPathStyle, 1u);
  v115 = v11;
  v116 = Mutable;
  cf = v12;
  if (!CStringPtr || (v15 = v12) == 0 || (Mutable ? (v16 = v11 == 0) : (v16 = 1), v16))
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("Failed to allocate resources"), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
LABEL_83:
    v49 = 0;
    DefaultAMAuthInstallRef = 0;
    goto LABEL_50;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v13, (uint64_t)CFSTR("Faild to read OS Boot hash from %@, error: %@"), v14, CFSTR("/private/preboot/active"), v8);
  v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, v20, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_83;
  }
  DefaultAMAuthInstallRef = (const void *)objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v17, v18, v19);
  if (!DefaultAMAuthInstallRef)
  {
    v109 = CFSTR("Failed to get default AMAuthInstallRef");
LABEL_88:
    sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, v109, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    goto LABEL_50;
  }
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v21, v22, v23)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v25, (uint64_t)DefaultAMAuthInstallRef, v26))
  {
    v109 = CFSTR("Failed to enable SSO");
    goto LABEL_88;
  }
  v119 = (uint64_t)DefaultAMAuthInstallRef;
  v113 = v7;
  v112 = (void *)MEMORY[0x2199D19CC]();
  v27 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v27)
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("Failed to allocate updater options"), 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0;
    v32 = v20;
    goto LABEL_49;
  }
  v28 = v27;
  CFDictionarySetValue(Mutable, CFSTR("RestoreSystemPartition"), v11);
  CFDictionarySetValue(Mutable, CFSTR("PostFDRSealing"), (const void *)*MEMORY[0x24BDBD268]);
  CFDictionarySetValue(Mutable, CFSTR("PreflightContext"), CFSTR("Limited"));
  CFDictionaryAddValue(v28, CFSTR("Options"), Mutable);
  CFDictionarySetValue(v28, CFSTR("BundlePath"), v15);
  v29 = SavageUpdaterCreate();
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v30, (uint64_t)CFSTR("Failed to create SavageUpdater: %s, error: %@"), v31, CStringPtr, 0);
  v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v29 || v128)
  {
    AMSupportSafeRelease();
    v110 = v128;
    sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, v32, v128);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0;
    goto LABEL_49;
  }
  v111 = v8;
  if (SavageUpdaterIsDone())
  {
LABEL_45:
    handleForCategory(0);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v60, OS_LOG_TYPE_DEFAULT, "Savage Updater done", buf, 2u);
    }

    AMSupportSafeRelease();
    AMSupportSafeRelease();
    v49 = 0;
    v61 = 0;
    goto LABEL_48;
  }
  v33 = 3;
  v34 = (const void *)*MEMORY[0x24BEDA8C8];
  v35 = (const void *)*MEMORY[0x24BEE7A50];
  v117 = (const void *)*MEMORY[0x24BEE7B50];
  v118 = (const void *)*MEMORY[0x24BEE7C10];
  while (1)
  {
    value = 0;
    v36 = v128;
    if (v128)
    {
      v108 = CFSTR("SavageUpdaterIsDone failed");
      goto LABEL_75;
    }
    if (!--v33)
    {
      sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("updater not done after 2 iterations"), 0);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_76;
    }
    v37 = SavageUpdaterExecCommand();
    v36 = v128;
    if (!v37 || v128 || !v127)
    {
      v108 = CFSTR("Failed to run SavageUpdaterExecCommand");
LABEL_75:
      sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, v108, v36);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_76:
      v49 = 0;
      goto LABEL_77;
    }
    CFDictionarySetValue(v28, v34, v127);
    CFDictionarySetValue(v28, v35, v127);
    v38 = CFDictionaryGetValue((CFDictionaryRef)v127, CFSTR("YonkersDeviceInfo"));
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = CFSTR("Savage");
      if (v38)
        v40 = CFSTR("Yonkers");
      *(_DWORD *)buf = 138412290;
      v130 = (const char *)v40;
      _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "Patch type: %@", buf, 0xCu);
    }

    objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v41, v119, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v43;
    if (v38)
    {
      v123 = 0;
      v46 = (id *)&v123;
      YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error = objc_msgSend_getYonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error_(v43, v44, (uint64_t)v28, (uint64_t)&value, &v123);
    }
    else
    {
      v122 = 0;
      v46 = (id *)&v122;
      YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error = objc_msgSend_getSavageTicketForZenithSavageFWUpdateWithOptions_SavageTicket_error_(v43, v44, (uint64_t)v28, (uint64_t)&value, &v122);
    }
    v48 = YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error;
    v49 = *v46;

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v50, (uint64_t)CFSTR("Failed to personalize Savage FW, status: %d, error: %@"), v51, v48, v49);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v49 || !v48 || !value)
      break;
    if (v38)
      v53 = v118;
    else
      v53 = v117;
    CFDictionaryAddValue(v28, v53, value);
    handleForCategory(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v130 = (const char *)v28;
      _os_log_impl(&dword_214503000, v54, OS_LOG_TYPE_DEFAULT, "Perform next stage, updaterOptions: %@", buf, 0xCu);
    }

    v55 = SavageUpdaterExecCommand();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v56, (uint64_t)CFSTR("Failed to exec SavageUpdater command, result: %@"), v57, v126);
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v36 = v128;
    if (!v55 || v128)
    {
      v108 = v32;
      goto LABEL_75;
    }
    handleForCategory(0);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      v59 = CFSTR("Savage");
      if (v38)
        v59 = CFSTR("Yonkers");
      *(_DWORD *)buf = 138412290;
      v130 = (const char *)v59;
      _os_log_impl(&dword_214503000, v58, OS_LOG_TYPE_DEFAULT, "Update %@ FW Successfully", buf, 0xCu);
    }

    AMSupportSafeRelease();
    AMSupportSafeRelease();
    v126 = 0;
    v127 = 0;

    if (SavageUpdaterIsDone())
      goto LABEL_45;
  }
  sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, v52, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v52;
LABEL_77:

LABEL_48:
  v8 = v111;
LABEL_49:
  v7 = v113;
  DefaultAMAuthInstallRef = (const void *)v119;
  objc_autoreleasePoolPop(v112);
  v20 = v32;
LABEL_50:
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_fileExistsAtPath_(v65, v66, (uint64_t)CFSTR("/tmp/Savage.fw"), v67);

  if (v68)
  {
    handleForCategory(0);
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v72, OS_LOG_TYPE_DEFAULT, "Find Savage.fw, deleting...", buf, 2u);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = 0;
    v78 = objc_msgSend_removeItemAtPath_error_(v76, v77, (uint64_t)CFSTR("/tmp/Savage.fw"), (uint64_t)&v121);
    v79 = v121;

    if ((v78 & 1) == 0)
    {
      handleForCategory(0);
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        sub_21456D82C((uint64_t)v79, v80, v81, v82, v83, v84, v85, v86);

    }
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v69, v70, v71);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend_fileExistsAtPath_(v87, v88, (uint64_t)CFSTR("/tmp/Yonkers.fw"), v89);

  if (v90)
  {
    handleForCategory(0);
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v91, OS_LOG_TYPE_DEFAULT, "Find Yonkers.fw, deleting...", buf, 2u);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = 0;
    v97 = objc_msgSend_removeItemAtPath_error_(v95, v96, (uint64_t)CFSTR("/tmp/Yonkers.fw"), (uint64_t)&v120);
    v98 = v120;

    if ((v97 & 1) == 0)
    {
      handleForCategory(0);
      v99 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
        sub_21456D7C8((uint64_t)v98, v99, v100, v101, v102, v103, v104, v105);

    }
  }
  if (cf)
    CFRelease(cf);
  if (v116)
    CFRelease(v116);
  if (DefaultAMAuthInstallRef)
    CFRelease(DefaultAMAuthInstallRef);
  v106 = v61;

  return v106;
}

- (id)updateBrunorDATFirmware
{
  const char *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t DefaultAMAuthInstallRef;
  const char *v15;
  uint64_t v16;
  const __CFAllocator *v17;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v19;
  CFMutableDictionaryRef v20;
  __CFDictionary *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  const void *v33;
  const void *v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  const void *v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  int YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error;
  void *v48;
  __CFDictionary *v49;
  const void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  int BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *key;
  id v66;
  id v67;
  id v68[2];
  void *value;
  void *v70;
  uint64_t v71;
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  int v75;
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  CFStringGetCStringPtr(CFSTR("Savage"), 0x8000100u);
  v71 = 0;
  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], v2, (uint64_t)CFSTR("/private/preboot/active"), 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456D890();
    goto LABEL_59;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v3, (uint64_t)CFSTR("%s/%@/"), v4, "/private/preboot/", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456D8BC();
LABEL_59:
    v30 = 0;
    v10 = 0;
    goto LABEL_54;
  }
  v10 = (void *)v6;
  DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v7, v8, v9);
  if (!DefaultAMAuthInstallRef)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v30 = 0;
      goto LABEL_54;
    }
    sub_21456D8E8();
    goto LABEL_77;
  }
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v11, v12, v13)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v15, DefaultAMAuthInstallRef, v16))
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_21456DA28();
      goto LABEL_77;
    }
LABEL_74:
    v30 = 0;
    goto LABEL_54;
  }
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_21456D914();
LABEL_77:
      v30 = 0;
      goto LABEL_54;
    }
    goto LABEL_74;
  }
  v19 = Mutable;
  v20 = CFDictionaryCreateMutable(v17, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v20)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456D940();
    v30 = 0;
    goto LABEL_54;
  }
  v21 = v20;
  CFDictionarySetValue(v19, CFSTR("RestoreSystemPartition"), v10);
  CFDictionarySetValue(v19, CFSTR("PostFDRSealing"), (const void *)*MEMORY[0x24BDBD268]);
  CFDictionarySetValue(v19, CFSTR("PreflightContext"), CFSTR("Limited"));
  CFDictionaryAddValue(v21, CFSTR("Options"), v19);
  if (!SavageUpdaterCreate())
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_214566990();
    goto LABEL_53;
  }
  v63 = v10;
  v64 = v5;
  v22 = 0;
  if (SavageUpdaterIsDone())
  {
LABEL_10:
    v23 = v71;
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      v10 = v63;
      v5 = v64;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_214566B44();
      goto LABEL_53;
    }
    v10 = v63;
    v5 = v64;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v73) = v22;
      _os_log_impl(&dword_214503000, v25, OS_LOG_TYPE_DEFAULT, "SavageUpdater work done. LoopCounter = %d.", buf, 8u);
    }

    v66 = 0;
    v28 = objc_msgSend_powerCycleSensor_(CRUtils, v26, (uint64_t)&v66, v27);
    v29 = v66;
    v30 = v29;
    if (!v28 || v29)
    {
      handleForCategory(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_21456D998((uint64_t)v30, v25, v57, v58, v59, v60, v61, v62);
      goto LABEL_54;
    }
    v31 = 0;
    goto LABEL_16;
  }
  v33 = (const void *)*MEMORY[0x24BEDA8C8];
  v34 = (const void *)*MEMORY[0x24BEE7C10];
  key = (void *)*MEMORY[0x24BEE79F0];
  while (1)
  {
    value = 0;
    v70 = 0;
    v68[1] = 0;
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v73 = v21;
      v74 = 1024;
      v75 = v22 + 1;
      _os_log_debug_impl(&dword_214503000, v35, OS_LOG_TYPE_DEBUG, "updaterOptions: %@ updaterLoopCount: %d", buf, 0x12u);
    }

    v36 = SavageUpdaterExecCommand();
    v37 = v71;
    handleForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (!v36 || v37)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      goto LABEL_47;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = value;
      _os_log_debug_impl(&dword_214503000, v39, OS_LOG_TYPE_DEBUG, "deviceInfoDict: %@", buf, 0xCu);
    }

    CFDictionarySetValue(v21, v33, value);
    v40 = CFDictionaryGetValue((CFDictionaryRef)value, CFSTR("YonkersDeviceInfo"));
    handleForCategory(0);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
    if (!v40)
      break;
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Updating Yonkers ...", buf, 2u);
    }

    objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v43, DefaultAMAuthInstallRef, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = 0;
    YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error = objc_msgSend_getYonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error_(v45, v46, (uint64_t)v21, (uint64_t)&v70, v68);
    v25 = v68[0];

    if (!YonkersTicketForZenithYonkersFWUpdateWithOptions_YonkersTicket_error || (v48 = v70) == 0 || v25)
    {
      handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_21456D9FC();
      goto LABEL_52;
    }
    v49 = v21;
    v50 = v34;
LABEL_37:
    CFDictionaryAddValue(v49, v50, v48);
    handleForCategory(0);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v73 = v21;
      _os_log_debug_impl(&dword_214503000, v56, OS_LOG_TYPE_DEBUG, "perform next stage: %@", buf, 0xCu);
    }

    if (!SavageUpdaterExecCommand() || v71)
    {
      handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
LABEL_46:
        sub_2145669F0();
LABEL_47:
      v25 = 0;
      goto LABEL_52;
    }
    AMSupportSafeRelease();
    AMSupportSafeRelease();

    ++v22;
    if (SavageUpdaterIsDone())
      goto LABEL_10;
  }
  if (v42)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Updating Brunor ...", buf, 2u);
  }

  objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v51, DefaultAMAuthInstallRef, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error = objc_msgSend_getBrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error_(v53, v54, (uint64_t)v21, (uint64_t)&v70, 0, &v67);
  v25 = v67;

  if (BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error)
  {
    v48 = v70;
    if (v70)
    {
      if (!v25)
      {
        v49 = v21;
        v50 = key;
        goto LABEL_37;
      }
    }
  }
  handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    sub_21456D96C();
LABEL_52:
  v10 = v63;
  v5 = v64;

LABEL_53:
  v30 = 0;
LABEL_54:

  sub_214512470((void *)0xFFFFFFFFFFFFFFFBLL, CFSTR("Update streaming DAT file failed"), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v31;
}

- (id)verifyPSD3
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v19;
  uint8_t v21[16];
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v23 = CFSTR("VerifyData");
  v24[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v24, (uint64_t)&v23, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)AMFDRSealingManifestCopyLocalDataForClass();
  v4 = v3;
  if (v3)
    v5 = v22 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_21456DA54();
LABEL_15:

    sub_214512470((void *)0xFFFFFFFFFFFFFFF5, CFSTR("Verify PSD3 failed"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v3);
  v10 = (const char *)objc_msgSend_bytes(v6, v7, v8, v9);
  v14 = objc_msgSend_length(v6, v11, v12, v13);
  v15 = sub_214563800(v10, v14);
  handleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  v19 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456DAB4(v15, v19);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "Verify psd3 successfully", v21, 2u);
  }

  v17 = 0;
LABEL_10:
  AMSupportSafeRelease();

  return v17;
}

@end
