@implementation CRComponentSigning

- (void)tcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
  sub_214507690(a3, a4, a5, a6, 1);
}

- (void)bcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
  sub_214507690(a3, a4, a5, a6, 0);
}

- (void)vcrtSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  dispatch_time_t v16;
  uint64_t *v17;
  const __CFData *v18;
  char *BytePtr;
  unsigned int v20;
  const __CFData *v21;
  const UInt8 *v22;
  CFIndex v23;
  const __CFData *v24;
  const void *v25;
  const void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[8];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  dispatch_semaphore_t v41;
  _DWORD length[3];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = -1;
  memset(length, 0, sizeof(length));
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_214507C24;
  v40 = sub_214507C34;
  v41 = dispatch_semaphore_create(0);
  if (a4)
  {
    if (a5)
    {
      objc_msgSend_sharedManager(MEMORY[0x24BE1A0C8], v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = sub_214507CFC;
      v35[3] = &unk_24D1A9EE8;
      v35[4] = &v43;
      v35[5] = &v51;
      v35[6] = &v47;
      v35[7] = &v36;
      objc_msgSend_signVeridianChallenge_completionHandler_(v13, v14, (uint64_t)a3, (uint64_t)v35);

      v15 = v37[5];
      v16 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(v15, v16))
      {
        handleForCategory(0);
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_214566830();
      }
      else
      {
        v17 = v44;
        if (a6)
          *a6 = *((_DWORD *)v44 + 6);
        if (*((_DWORD *)v17 + 6))
        {
          handleForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            sub_214566804();
        }
        else
        {
          v18 = (const __CFData *)v52[3];
          if (v18)
          {
            if (v48[3])
            {
              BytePtr = (char *)CFDataGetBytePtr(v18);
              v20 = CFDataGetLength((CFDataRef)v52[3]);
              if (sub_2145072C0(BytePtr, v20, &length[1], length))
              {
                handleForCategory(0);
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                  sub_214566794(v27, v28, v29, v30, v31, v32, v33, v34);
              }
              else
              {
                v21 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x24BDBD248]);
                *a4 = v21;
                if (v21)
                {
                  *(_QWORD *)&length[1] = 0;
                  v22 = CFDataGetBytePtr((CFDataRef)v48[3]);
                  v23 = CFDataGetLength((CFDataRef)v48[3]);
                  v24 = CFDataCreate(0, v22, v23);
                  *a5 = v24;
                  if (v24)
                    goto LABEL_12;
                  handleForCategory(0);
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    sub_214566768();
                }
                else
                {
                  handleForCategory(0);
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    sub_21456673C();
                }
              }
            }
            else
            {
              handleForCategory(0);
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                sub_214566710();
            }
          }
          else
          {
            handleForCategory(0);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              sub_2145666B8();
          }
        }
      }
    }
    else
    {
      handleForCategory(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_2145666E4();
    }
  }
  else
  {
    handleForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_2145666B8();
  }

LABEL_12:
  v25 = (const void *)v52[3];
  if (v25)
    CFRelease(v25);
  v26 = (const void *)v48[3];
  if (v26)
    CFRelease(v26);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
}

- (void)prpcSign:(__CFData *)a3 outSignature:(const __CFData *)a4 outDeviceNonce:(const __CFData *)a5 outError:(int *)a6
{
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const __CFAllocator *v41;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v43;
  CFMutableDictionaryRef v44;
  __CFDictionary *v45;
  CFMutableDictionaryRef v46;
  __CFDictionary *v47;
  NSObject *v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  const __CFData *v53;
  const __CFData *v54;
  const __CFData *v55;
  char *BytePtr;
  unsigned int Length;
  CFDataRef v58;
  const UInt8 *v59;
  CFIndex v60;
  const __CFData *v61;
  int v62;
  const void *v63;
  const void *v64;
  NSObject *v65;
  int v66;
  uint64_t v67;
  NSObject *v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  void *v74;
  int BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const __CFData **v94;
  void *v95;
  int *v96;
  uint64_t DefaultAMAuthInstallRef;
  id v98[2];
  void *value;
  void *v100;
  uint64_t v101;
  unsigned int v102;
  const UInt8 *v103;
  uint8_t buf[4];
  void *v105;
  __int16 v106;
  int v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_214566C34(v10, v11, v12, v13, v14, v15, v16, v17);

  CFStringGetCStringPtr(CFSTR("Savage"), 0x8000100u);
  v103 = 0;
  v102 = 0;
  v101 = 0;
  if (!a4)
  {
    handleForCategory(0);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      sub_2145666B8();
    goto LABEL_69;
  }
  if (!a5)
  {
    handleForCategory(0);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      sub_2145666E4();
    goto LABEL_69;
  }
  handleForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!a3)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_21456685C();

    goto LABEL_70;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    sub_214566BD0((uint64_t)a3, v19, v20, v21, v22, v23, v24, v25);

  objc_msgSend_stringWithContentsOfFile_encoding_error_(MEMORY[0x24BDD17C8], v26, (uint64_t)CFSTR("/private/preboot/active"), 1, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    handleForCategory(0);
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      sub_214566888();
LABEL_69:

LABEL_70:
    v35 = 0;
    v30 = 0;
LABEL_107:
    v62 = 1;
    goto LABEL_29;
  }
  v30 = (void *)v27;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v28, (uint64_t)CFSTR("%s/%@/"), v29, "/private/preboot/", v27);
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    handleForCategory(0);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      sub_2145668B4();

    v35 = 0;
    goto LABEL_107;
  }
  v35 = (void *)v31;
  DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v32, v33, v34);
  if (!DefaultAMAuthInstallRef)
  {
    handleForCategory(0);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_2145668E0();
    goto LABEL_106;
  }
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v36, v37, v38)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v39, DefaultAMAuthInstallRef, v40))
  {
    handleForCategory(0);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_214566BA4();
    goto LABEL_106;
  }
  v41 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    handleForCategory(0);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_21456690C();
    goto LABEL_106;
  }
  v43 = Mutable;
  v44 = CFDictionaryCreateMutable(v41, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v44)
  {
    handleForCategory(0);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_214566938();
    goto LABEL_106;
  }
  v45 = v44;
  v94 = a4;
  v46 = CFDictionaryCreateMutable(v41, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v46)
  {
    handleForCategory(0);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      sub_214566964();
LABEL_106:

    goto LABEL_107;
  }
  v47 = v46;
  CFDictionarySetValue(v43, (const void *)*MEMORY[0x24BEE7A80], v35);
  CFDictionarySetValue(v43, (const void *)*MEMORY[0x24BEE7A58], (const void *)*MEMORY[0x24BDBD268]);
  CFDictionarySetValue(v43, CFSTR("PreflightContext"), CFSTR("Limited"));
  CFDictionarySetValue(v43, CFSTR("AuthChallengeOption"), a3);
  CFDictionarySetValue(v43, CFSTR("PersonalizedFirmwareRootPath"), CFSTR("/private/var/tmp/usr/standalone/firmware/Savage/"));
  CFDictionarySetValue(v45, (const void *)*MEMORY[0x24BEE7BA8], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(v43, (const void *)*MEMORY[0x24BEE7B90], v45);
  CFDictionaryAddValue(v47, (const void *)*MEMORY[0x24BEE7A48], v43);
  CFDictionarySetValue(v47, CFSTR("BundlePath"), v35);
  handleForCategory(0);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "Creating Savage Updater", buf, 2u);
  }

  if (!SavageUpdaterCreate())
  {
    handleForCategory(0);
    v83 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      sub_214566990();

    goto LABEL_107;
  }
  v96 = a6;
  v95 = v30;
  v49 = 0;
  if (SavageUpdaterIsDone())
  {
LABEL_20:
    v50 = v101;
    handleForCategory(0);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (!v50)
    {
      v30 = v95;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v105) = v49;
        _os_log_impl(&dword_214503000, v52, OS_LOG_TYPE_DEFAULT, "SavageUpdater work done. LoopCounter = %d.", buf, 8u);
      }

      v53 = (const __CFData *)sub_214507108(CFSTR("SavageAuthResponse"));
      v54 = (const __CFData *)sub_214507108(CFSTR("SavageAuthSalt"));
      v55 = v54;
      a6 = v96;
      if (v53)
      {
        if (v54)
        {
          BytePtr = (char *)CFDataGetBytePtr(v53);
          Length = CFDataGetLength(v53);
          if (sub_2145072C0(BytePtr, Length, &v103, &v102))
          {
            handleForCategory(0);
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
              sub_214566AD4(v86, v87, v88, v89, v90, v91, v92, v93);
          }
          else
          {
            v58 = CFDataCreateWithBytesNoCopy(0, v103, v102, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
            *v94 = v58;
            if (v58)
            {
              v59 = CFDataGetBytePtr(v55);
              v60 = CFDataGetLength(v55);
              v61 = CFDataCreate(0, v59, v60);
              *a5 = v61;
              if (v61)
              {
                v62 = 0;
                goto LABEL_29;
              }
              handleForCategory(0);
              v86 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                sub_214566768();
            }
            else
            {
              handleForCategory(0);
              v86 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                sub_21456673C();
            }
          }

        }
        else
        {
          handleForCategory(0);
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            sub_214566710();

        }
      }
      else
      {
        handleForCategory(0);
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          sub_214566AA8();

      }
      goto LABEL_107;
    }
    v30 = v95;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      sub_214566B44();

    v62 = 1;
    a6 = v96;
  }
  else
  {
    v63 = (const void *)*MEMORY[0x24BEDA8C8];
    v64 = (const void *)*MEMORY[0x24BEE79F0];
    while (1)
    {
      value = 0;
      v100 = 0;
      v98[1] = 0;
      handleForCategory(0);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v105 = v47;
        v106 = 1024;
        v107 = v49 + 1;
        _os_log_debug_impl(&dword_214503000, v65, OS_LOG_TYPE_DEBUG, "updaterOptions: %@ updaterLoopCount: %d", buf, 0x12u);
      }

      v66 = SavageUpdaterExecCommand();
      v67 = v101;
      handleForCategory(0);
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v68;
      if (!v66 || v67)
        break;
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v105 = value;
        _os_log_debug_impl(&dword_214503000, v69, OS_LOG_TYPE_DEBUG, "deviceInfoDict: %@", buf, 0xCu);
      }

      CFDictionarySetValue(v47, v63, value);
      objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v70, DefaultAMAuthInstallRef, v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v72;
      if (!v72)
      {
        handleForCategory(0);
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          sub_214566A50();
        goto LABEL_59;
      }
      v98[0] = 0;
      BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error = objc_msgSend_getBrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error_(v72, v73, (uint64_t)v47, (uint64_t)&v100, 1, v98);
      v76 = v98[0];
      v77 = v76;
      if (!BrunorTicketForBrunorFWUpdateWithOptions_BrunorTicket_auth_error || !v100 || v76)
      {
        handleForCategory(0);
        v79 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          sub_214566A7C();

        goto LABEL_59;
      }
      CFDictionarySetValue(v47, v64, v100);
      handleForCategory(0);
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v105 = v47;
        _os_log_debug_impl(&dword_214503000, v78, OS_LOG_TYPE_DEBUG, "perform next stage: %@", buf, 0xCu);
      }

      if (!SavageUpdaterExecCommand() || v101)
      {
        handleForCategory(0);
        v77 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
          sub_2145669F0();
LABEL_59:
        v30 = v95;
        a6 = v96;

        v62 = 1;
        goto LABEL_29;
      }
      AMSupportSafeRelease();
      AMSupportSafeRelease();

      ++v49;
      if (SavageUpdaterIsDone())
        goto LABEL_20;
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_2145669F0();

    v62 = 1;
    v30 = v95;
    a6 = v96;
  }
LABEL_29:
  if (a6)
    *a6 = v62;
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

}

@end
