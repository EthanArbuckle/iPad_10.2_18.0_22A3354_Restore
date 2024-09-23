@implementation CRFDRGen6DeviceHandler

+ (BOOL)isGen6ProductType:(int)a3
{
  BOOL result;
  uint64_t v4;

  result = 1;
  if (*(uint64_t *)&a3 > 2793418700)
  {
    if (*(uint64_t *)&a3 > 2941181570)
    {
      if (*(_QWORD *)&a3 == 2941181571)
        return result;
      v4 = 3825599860;
    }
    else
    {
      if (*(_QWORD *)&a3 == 2793418701)
        return result;
      v4 = 2795618603;
    }
  }
  else if (*(uint64_t *)&a3 > 574536382)
  {
    if (*(_QWORD *)&a3 == 574536383)
      return result;
    v4 = 851437781;
  }
  else
  {
    if (*(_QWORD *)&a3 == 133314240)
      return result;
    v4 = 330877086;
  }
  if (*(_QWORD *)&a3 != v4)
    return 0;
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRGen6DeviceHandler *v4;

  if (objc_msgSend_isGen6ProductType_(CRFDRGen6DeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRGen6DeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen6DeviceHandler);
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  int v19;
  id v20;
  id v22;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend_supportHarvestPearl(self, v8, v9, v10))
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "No update only data classes, skipping.", buf, 2u);
    }
    v14 = 0;
LABEL_5:

    v15 = v14;
    goto LABEL_13;
  }
  if (objc_msgSend_containsObject_(v6, v11, (uint64_t)CFSTR("IPHONE COMP FACEID"), v12)
    && objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v16, (uint64_t)CFSTR("psd2"), v17))
  {
    v22 = 0;
    v19 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v18, (uint64_t)v7, (uint64_t)CFSTR("psd2"), &v22);
    v20 = v22;
    v14 = v20;
    if (!v19 || (v15 = 0, v20))
    {
      handleForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_21456B8BC();
      goto LABEL_5;
    }
  }
  else
  {
    v15 = 0;
  }
LABEL_13:
  if (a4)
    *a4 = objc_retainAutorelease(v15);

  return v7;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  int v18;
  id v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  id v24;
  int v25;
  id v26;
  NSObject *v27;
  id *v29;
  id obj;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v34, (uint64_t)v38, 16);
  if (!v9)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v12 = v9;
  v29 = a4;
  v13 = *(_QWORD *)v35;
  while (2)
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v35 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      if (objc_msgSend_isEqualToString_(v15, v10, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v11))
      {
        v33 = 0;
        v18 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v16, (uint64_t)v7, (uint64_t)CFSTR("vcrt"), &v33);
        v19 = v33;
        v20 = v19;
        if (!v18 || v19)
        {
          handleForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_25;
          goto LABEL_26;
        }
      }
      if (objc_msgSend_isEqualToString_(v15, v16, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v17))
      {
        v32 = 0;
        v23 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v21, (uint64_t)v7, (uint64_t)CFSTR("tcrt"), &v32);
        v24 = v32;
        v20 = v24;
        if (!v23 || v24)
        {
          handleForCategory(0);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
LABEL_25:
            sub_21456B91C();
LABEL_26:
          a4 = v29;

          goto LABEL_27;
        }
      }
      if (objc_msgSend_isEqualToString_(v15, v21, (uint64_t)CFSTR("IPHONE COMP FACEID"), v22))
      {
        if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v10, (uint64_t)CFSTR("prpc"), v11))
        {
          v31 = 0;
          v25 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v10, (uint64_t)v7, (uint64_t)CFSTR("prpc"), &v31);
          v26 = v31;
          v20 = v26;
          if (!v25 || v26)
          {
            handleForCategory(0);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              goto LABEL_25;
            goto LABEL_26;
          }
        }
      }
    }
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v34, (uint64_t)v38, 16);
    if (v12)
      continue;
    break;
  }
  v20 = 0;
  a4 = v29;
LABEL_27:

  if (a4)
    *a4 = objc_retainAutorelease(v20);

  return v7;
}

- (BOOL)supportPatch
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 2795618602)
  {
    if (v3 == 2795618603)
      return v2;
    v4 = 2941181571;
  }
  else
  {
    if (v3 == 133314240)
      return v2;
    v4 = 330877086;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (BOOL)supportCameraDepth
{
  uint64_t v2;

  v2 = MGGetProductType();
  return v2 == 2795618603 || v2 == 330877086;
}

- (BOOL)supportMctubMinus
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 851437780)
  {
    if (v3 == 851437781)
      return v2;
    v4 = 2795618603;
  }
  else
  {
    if (v3 == 330877086)
      return v2;
    v4 = 574536383;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (id)getPatchInfoPerSPC
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  v3 = MGGetProductType();
  if (v3 <= 2795618602)
  {
    if (v3 != 133314240)
    {
      v4 = 330877086;
      goto LABEL_6;
    }
    return &unk_24D1B8A78;
  }
  if (v3 == 2941181571)
    return &unk_24D1B8A78;
  v4 = 2795618603;
LABEL_6:
  if (v3 == v4)
    return &unk_24D1B8A00;
  return v2;
}

- (BOOL)getMinimalManifestsClassesAndInstancesWithPartSPC:(id)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5 minimalSealingDataInstances:(id *)a6 minimalSealedDataClasses:(id *)a7 minimalSealedDataInstances:(id *)a8 error:(id *)a9
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFDictionary *Mutable;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  BOOL v31;
  int v32;
  NSObject *v33;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if ((objc_msgSend_supportHarvestPearl(self, v11, v12, v13) & 1) != 0)
  {
    v35 = v10;
    if (objc_msgSend_isServicePart(self, v14, v15, v16)
      && objc_msgSend_containsObject_(v10, v17, (uint64_t)CFSTR("IPHONE MCTUB"), v18))
    {
      objc_msgSend_kbbSealingManifest(self, v17, v19, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        handleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_21456B97C();
        v31 = 0;
        goto LABEL_20;
      }
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, CFSTR("DataStore"), CFSTR("Local"));
      AMFDRCreateWithOptions();
      objc_msgSend_kbbSealingManifest(self, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = AMFDRDataDecodeAndSetSealingManifest();

      if ((v26 & 1) == 0)
      {
        handleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_21456BA94();
        v31 = 0;
        goto LABEL_20;
      }
      v27 = AMFDRSealingManifestCopyMinimalManifestClassesAndInstances();

      handleForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_21456BA34();
        v31 = 0;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v37 = 0;
        v38 = 2112;
        v39 = 0;
        v40 = 2112;
        v41 = 0;
        _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "KBB MinimalManifests: %@, %@, %@", buf, 0x20u);
      }

      v10 = v35;
    }
    if (!objc_msgSend_containsObject_(v10, v17, (uint64_t)CFSTR("IPHONE COMP FACEID"), v18))
    {
      v30 = 0;
LABEL_19:
      v31 = 1;
LABEL_21:
      AMSupportSafeRelease();
      AMSupportSafeRelease();

      goto LABEL_22;
    }
    v32 = AMFDRSealingMapCopyMinimalManifestClassesAndInstances();
    v30 = 0;

    handleForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    v29 = v33;
    if (v32)
    {
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v37 = 0;
        v38 = 2112;
        v39 = 0;
        v40 = 2112;
        v41 = 0;
        _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "Current MinimalManifests: %@, %@, %@", buf, 0x20u);
      }

      v10 = v35;
      goto LABEL_19;
    }
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_21456B9D4();
    v31 = 0;
LABEL_20:

    v30 = 0;
    v10 = v35;
    goto LABEL_21;
  }
  handleForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "Minimal manifests not supported.", buf, 2u);
  }
  v31 = 1;
LABEL_22:

  return v31;
}

- (BOOL)setBrunorMinimalSealingMeta:(__AMFDR *)a3 instances:(id)a4
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *SikInstanceString;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  NSObject *v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v33;
  id v34;
  id obj;
  uint64_t v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  NSObject *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  v5 = objc_opt_new();
  if (!v5)
  {
    handleForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_21456BAF4();

LABEL_32:
    v30 = 0;
    goto LABEL_33;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v38, (uint64_t)v44, 16);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  v34 = v4;
  v37 = v5;
  v9 = 0;
  v10 = 0;
  SikInstanceString = 0;
  v12 = 0;
  v36 = *(_QWORD *)v39;
  while (2)
  {
    v13 = 0;
    v14 = v9;
    v15 = v10;
    v16 = SikInstanceString;
    v17 = v12;
    do
    {
      if (*(_QWORD *)v39 != v36)
        objc_enumerationMutation(obj);
      v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13);
      v12 = (void *)objc_opt_new();

      if (!v12)
      {
        handleForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_21456BB20();

        v22 = v14;
        v14 = v15;
        goto LABEL_31;
      }
      SikInstanceString = AMFDRDataCreateSikInstanceString();

      if (!SikInstanceString)
      {
        handleForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_21456BB4C();
        v16 = v15;
        goto LABEL_31;
      }
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, (uint64_t)CFSTR("%@:%@"), v20, CFSTR("pspc"), SikInstanceString);
      v10 = objc_claimAutoreleasedReturnValue();

      handleForCategory(0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v10)
      {
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          sub_21456BB78();
LABEL_30:
        v16 = SikInstanceString;
LABEL_31:
        v4 = v34;
        v5 = v37;

        goto LABEL_32;
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v10;
        _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "instance full string: %@", buf, 0xCu);
      }

      objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)v10, (uint64_t)CFSTR("x-fdr-manifest-prop-mpub-key"));
      objc_msgSend_setObject_forKeyedSubscript_(v12, v24, (uint64_t)CFSTR("mpub"), (uint64_t)CFSTR("x-fdr-add-manifest-props"));
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("%@-%@"), v26, CFSTR("minimal-manifest"), v18);
      v9 = objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        handleForCategory(0);
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          sub_21456BBA4();
        v14 = v10;
        goto LABEL_30;
      }
      objc_msgSend_setObject_forKeyedSubscript_(v37, v27, (uint64_t)v12, (uint64_t)v9);
      ++v13;
      v14 = v9;
      v15 = v10;
      v16 = SikInstanceString;
      v17 = v12;
    }
    while (v8 != v13);
    v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v38, (uint64_t)v44, 16);
    if (v8)
      continue;
    break;
  }

  v4 = v34;
  v5 = v37;
LABEL_16:

  handleForCategory(0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v43 = v5;
    _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "MultiSealingMetadata: %@", buf, 0xCu);
  }

  AMFDRSetOption();
  v30 = 1;
LABEL_33:

  return v30;
}

@end
