@implementation CMErrorUtils

+ (id)CMErrorWithCode:(int)a3 userInfo:(id)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  uint64_t *v17;
  const __CFString *v18;
  uint64_t *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, *(uint64_t *)&a3, (uint64_t)a4, v4);
  v11 = (void *)objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E0CB34D0], v8, (uint64_t)CFSTR("com.apple.coremotion"), v9, v10);
  if ((a3 - 104) >= 8)
  {
    v16 = v11;
    v17 = (uint64_t *)MEMORY[0x1E0CB2D68];
    v18 = CFSTR("Failure reason unknown.");
    v19 = (uint64_t *)MEMORY[0x1E0CB2D50];
    v20 = CFSTR("Unknown failure.");
    v21 = CFSTR("Rotate the device around to calibrate.");
    v22 = CFSTR("Unable to calibrate device until it is rotated.");
    v23 = CFSTR("Device needs to be moved.");
    switch(a3)
    {
      case 'd':
        return 0;
      case 'e':
        goto LABEL_8;
      case 'f':
        v21 = CFSTR("Location Services must be available and enabled for System Services > Compass Calibration.");
        v22 = CFSTR("Unable to access location.");
        v23 = CFSTR("Failed to get true north.");
LABEL_8:
        v24 = objc_msgSend_localizedStringForKey_value_table_(v11, v12, (uint64_t)v23, (uint64_t)&stru_1E295ADC8, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v7, v25, v24, *v19, v26);
        v17 = (uint64_t *)MEMORY[0x1E0CB2D80];
        v19 = (uint64_t *)MEMORY[0x1E0CB2D68];
        v20 = v22;
        v18 = v21;
        goto LABEL_9;
      case 'g':
LABEL_9:
        v27 = objc_msgSend_localizedStringForKey_value_table_(v16, v12, (uint64_t)v20, (uint64_t)&stru_1E295ADC8, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v7, v28, v27, *v19, v29);
        v31 = objc_msgSend_localizedStringForKey_value_table_(v16, v30, (uint64_t)v18, (uint64_t)&stru_1E295ADC8, 0);
        objc_msgSend_setObject_forKeyedSubscript_(v7, v32, v31, *v17, v33);
        if (!a4)
          return (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("CMErrorDomain"), a3, (uint64_t)v7);
        goto LABEL_3;
      default:
        if (qword_1ECEDEE98 == -1)
          goto LABEL_12;
        while (1)
        {
          dispatch_once(&qword_1ECEDEE98, &unk_1E2953488);
LABEL_12:
          v34 = off_1ECEDEE90;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 68289539;
            v38 = 0;
            v39 = 2082;
            v40 = "";
            v41 = 2082;
            v42 = "assert";
            v43 = 2081;
            v44 = "0";
            _os_log_impl(&dword_18F1DC000, v34, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"CMError must be defined\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (qword_1ECEDEE98 != -1)
              dispatch_once(&qword_1ECEDEE98, &unk_1E2953488);
          }
          v35 = off_1ECEDEE90;
          if (os_signpost_enabled((os_log_t)off_1ECEDEE90))
          {
            *(_DWORD *)buf = 68289539;
            v38 = 0;
            v39 = 2082;
            v40 = "";
            v41 = 2082;
            v42 = "assert";
            v43 = 2081;
            v44 = "0";
            _os_signpost_emit_with_name_impl(&dword_18F1DC000, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CMError must be defined", "{\"msg%{public}.0s\":\"CMError must be defined\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
            if (qword_1ECEDEE98 != -1)
              dispatch_once(&qword_1ECEDEE98, &unk_1E2953488);
          }
          v36 = off_1ECEDEE90;
          if (os_log_type_enabled((os_log_t)off_1ECEDEE90, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68289539;
            v38 = 0;
            v39 = 2082;
            v40 = "";
            v41 = 2082;
            v42 = "assert";
            v43 = 2081;
            v44 = "0";
            _os_log_impl(&dword_18F1DC000, v36, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"CMError must be defined\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
          }
          abort_report_np();
        }
    }
  }
  if (a4)
LABEL_3:
    objc_msgSend_addEntriesFromDictionary_(v7, v12, (uint64_t)a4, v13, v14);
  return (id)objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v12, (uint64_t)CFSTR("CMErrorDomain"), a3, (uint64_t)v7);
}

+ (id)CMErrorWithCode:(int)a3
{
  uint64_t v3;

  return (id)objc_msgSend_CMErrorWithCode_userInfo_(CMErrorUtils, a2, *(uint64_t *)&a3, 0, v3);
}

@end
