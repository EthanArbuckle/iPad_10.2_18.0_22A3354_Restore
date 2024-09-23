@implementation CRRepairStatus

+ (BOOL)hasHadAuthorizedRepair
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  objc_msgSend__wasRepaired(CRRepairStatus, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4)
    v9 = objc_msgSend_intValue(v4, v5, v6, v7) != 0;
  else
    v9 = 0;

  return v9;
}

+ (BOOL)hasHadAuthorizedRepairForComponent:(unint64_t)a3
{
  uint64_t v3;
  __CFString *v5;
  const char *v6;
  uint64_t v7;
  char isFDRDataClassSupported;
  int isEqualToString;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t isEqual;
  const char *v32;
  uint64_t v33;

  switch(a3)
  {
    case 0uLL:
      v5 = CFSTR("vcrt");
      if ((objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("vcrt"), v3) & 1) != 0)
        goto LABEL_14;
      v5 = CFSTR("bcrt");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], v6, (uint64_t)CFSTR("bcrt"), v7);
      goto LABEL_13;
    case 1uLL:
      v5 = CFSTR("tcrt");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("tcrt"), v3);
      goto LABEL_13;
    case 2uLL:
      v5 = CFSTR("CmCl");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("CmCl"), v3);
      goto LABEL_13;
    case 5uLL:
      v5 = CFSTR("psd2");
      if ((objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("psd2"), v3) & 1) != 0)
        goto LABEL_14;
      v5 = CFSTR("prpc");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], v6, (uint64_t)CFSTR("prpc"), v7);
LABEL_13:
      if ((isFDRDataClassSupported & 1) == 0)
      {
LABEL_17:
        handleForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          sub_1D140D614(a3, v16, v17, v18, v19, v20, v21, v22);
        v23 = 0;
        goto LABEL_26;
      }
LABEL_14:
      isEqualToString = objc_msgSend_isEqualToString_(v5, v6, (uint64_t)CFSTR("CmCl"), v7);
LABEL_15:
      if (isEqualToString)
      {
        objc_msgSend__wasRepairedWithCombinedDataClass_(CRRepairStatus, v10, (uint64_t)v5, v11);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend_isEqualToString_(v5, v10, (uint64_t)CFSTR("SrvP"), v11))
        {
          objc_msgSend_isServicePartWithError_(CRRepairStatus, v24, 0, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v26;
          v30 = (void *)MEMORY[0x1E0CB37E8];
          if (v26)
          {
            isEqual = objc_msgSend_isEqual_(v26, v27, (uint64_t)CFSTR("0"), v28);
            objc_msgSend_numberWithBool_(v30, v32, isEqual, v33);
          }
          else
          {
            objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v27, 0, v28);
          }
          v16 = objc_claimAutoreleasedReturnValue();

          if (v16)
            goto LABEL_25;
          return 0;
        }
        objc_msgSend__wasRepairedWithDataClass_(CRRepairStatus, v24, (uint64_t)v5, v25);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v16 = v12;
      if (v12)
      {
LABEL_25:
        v23 = objc_msgSend_intValue(v16, v13, v14, v15) != 0;
LABEL_26:

        return v23;
      }
      return 0;
    case 6uLL:
      v5 = CFSTR("hop0");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("hop0"), v3);
      goto LABEL_13;
    case 9uLL:
      v5 = CFSTR("bCfg");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("bCfg"), v3);
      goto LABEL_13;
    case 0xBuLL:
      v5 = CFSTR("NBCl");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("NBCl"), v3);
      goto LABEL_13;
    default:
      if (a3 - 7 > 1)
        goto LABEL_17;
      v5 = CFSTR("SrvP");
      isEqualToString = objc_msgSend_isEqualToString_(CFSTR("SrvP"), a2, (uint64_t)CFSTR("CmCl"), v3);
      goto LABEL_15;
  }
}

+ (id)getLocalSealingManifest
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_getLocalSealingManifest(CRFDRUtils, a2, v2, v3);
}

+ (id)_wasRepairedWithSysCfg:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t isEqual;
  void *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t v52[16];
  id v53;
  CFTypeRef cf;

  v3 = a3;
  cf = 0;
  v5 = (void *)ZhuGeCopyValue();
  if (v5)
    v6 = cf == 0;
  else
    v6 = 0;
  if (!v6)
  {
    handleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1D140D678((uint64_t)&cf, v7, v8, v9, v10, v11, v12, v13);
    isEqual = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_20;
  }
  v53 = 0;
  objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E0CB36D8], v4, (uint64_t)v5, 4, &v53);
  v7 = objc_claimAutoreleasedReturnValue();
  v17 = v53;
  if (!v7)
  {
    handleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1D140D6E0(v7, v38, v39, v40, v41, v42, v43, v44);
    goto LABEL_28;
  }
  objc_msgSend_objectForKeyedSubscript_(v7, v18, (uint64_t)v3, v19);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    handleForCategory();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_1D140D710((uint64_t)v3, v45, v46, v47, v48, v49, v50, v51);

LABEL_28:
    isEqual = 0;
    v15 = 0;
    v16 = 0;
    goto LABEL_20;
  }
  v16 = (void *)v20;
  v21 = (void *)MGCopyAnswer();
  v25 = v21;
  if (v21)
  {
    objc_msgSend_SHA256DigestString(v21, v22, v23, v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v22, (uint64_t)&stru_1E9220F10, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_SHA256DigestString(v26, v27, v28, v29);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  handleForCategory();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    sub_1D140D774((uint64_t)v15, (uint64_t)v16, v30);

  isEqual = objc_msgSend_isEqual_(v15, v31, (uint64_t)v16, v32);
  if ((_DWORD)isEqual)
  {
    handleForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl(&dword_1D1401000, v33, OS_LOG_TYPE_DEFAULT, "Repair status exist and digest match current", v52, 2u);
    }

  }
LABEL_20:

  if (cf)
    CFRelease(cf);
  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v34, isEqual, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

+ (id)_wasRepairedWithCombinedDataClass:(id)a3
{
  const char *v3;
  uint64_t isDcSignedCombinedDataClass_error;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  isDcSignedCombinedDataClass_error = objc_msgSend_isDcSignedCombinedDataClass_error_(CRFDRUtils, a2, (uint64_t)a3, (uint64_t)&v8);
  v6 = 0;
  if (!v8)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v3, isDcSignedCombinedDataClass_error, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_wasRepairedWithDataClass:(id)a3
{
  const char *v3;
  uint64_t isDcSignedDataClass_error;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  isDcSignedDataClass_error = objc_msgSend_isDcSignedDataClass_error_(CRFDRUtils, a2, (uint64_t)a3, (uint64_t)&v8);
  v6 = 0;
  if (!v8)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v3, isDcSignedDataClass_error, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_wasRepaired
{
  uint64_t v2;
  const char *v3;
  uint64_t isDcSignedSealingManifest;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v8 = 0;
  isDcSignedSealingManifest = objc_msgSend_isDcSignedSealingManifest_(CRFDRUtils, a2, (uint64_t)&v8, v2);
  v6 = 0;
  if (!v8)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v3, isDcSignedSealingManifest, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (BOOL)isVeridianFWUpdateRequired
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(CRRepairStatusLite, sel_isVeridianFWUpdateRequired);
}

+ (BOOL)isVeridianFWUpdateRequiredLite
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(CRRepairStatusLite, sel_isVeridianFWUpdateRequiredLite);
}

+ (id)isServicePartWithError:(id *)a3
{
  uint64_t v3;

  return (id)objc_msgSend_isServicePartWithError_(CRFDRUtils, a2, (uint64_t)a3, v3);
}

+ (id)getVeridianFWVersionInfo
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  if (!MEMORY[0x1E0DF2300] || BC__getInfo())
  {
    handleForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1D140D7F4(v19, v20, v21, v22, v23, v24, v25, v26);
    v2 = 0;
  }
  else
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v3, v30, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v5, (uint64_t)CFSTR("Firmware"));

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v7, DWORD1(v30), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v2, v10, (uint64_t)v9, (uint64_t)CFSTR("Configuration"));

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v11, DWORD2(v30), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v2, v14, (uint64_t)v13, (uint64_t)CFSTR("DNVDSector1"));

    objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v15, HIDWORD(v30), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v2, v18, (uint64_t)v17, (uint64_t)CFSTR("DNVDSector2"));

    handleForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 138412290;
      v29 = v2;
      _os_log_impl(&dword_1D1401000, v19, OS_LOG_TYPE_DEFAULT, " versiondict is:%@", (uint8_t *)&v28, 0xCu);
    }
  }

  return v2;
}

+ (id)getSsrBootIntentWithError:(id *)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id *))MEMORY[0x1E0DE7D20])(CRRepairStatusLite, sel_getSsrBootIntentWithError_, a3);
}

+ (BOOL)isDeviceStagedSealed
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(CRRepairStatusLite, sel_isDeviceStagedSealed);
}

@end
