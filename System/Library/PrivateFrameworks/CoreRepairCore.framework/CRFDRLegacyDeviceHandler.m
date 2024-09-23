@implementation CRFDRLegacyDeviceHandler

+ (BOOL)isLegacyProductType:(int)a3
{
  return *(_QWORD *)&a3 == 1721691077 || *(_QWORD *)&a3 == 1429914406;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRLegacyDeviceHandler *v4;

  if (objc_msgSend_isLegacyProductType_(CRFDRLegacyDeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRLegacyDeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRLegacyDeviceHandler);
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  int v19;
  id v20;
  BOOL v21;
  NSObject *v22;
  void *v24;
  NSObject *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v34 = v6;
  if (objc_msgSend_containsObject_(v6, v8, (uint64_t)CFSTR("IPHONE COMP FACEID"), v9))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8680, v10, (uint64_t)&v36, (uint64_t)v42, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v37;
      v33 = a4;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v15)
          objc_enumerationMutation(&unk_24D1B8680);
        v17 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v16);
        if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v12, v17, v13, v33) & 1) != 0)
        {
          v35 = 0;
          v19 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v18, (uint64_t)v7, v17, &v35);
          v20 = v35;
          if (v19)
            v21 = v20 == 0;
          else
            v21 = 0;
          if (!v21)
          {
            v24 = v20;
            handleForCategory(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              sub_21456AF64((uint64_t)v24, v25, v27, v28, v29, v30, v31, v32);

            a4 = v33;
            if (v33)
              goto LABEL_21;
            goto LABEL_22;
          }
        }
        else
        {
          handleForCategory(0);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = v17;
            _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
          }

        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8680, v12, (uint64_t)&v36, (uint64_t)v42, 16);
          v24 = 0;
          a4 = v33;
          if (v14)
            goto LABEL_4;
          goto LABEL_20;
        }
      }
    }
  }
  v24 = 0;
LABEL_20:
  if (a4)
LABEL_21:
    *a4 = objc_retainAutorelease(v24);
LABEL_22:

  return v7;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  NSObject *v50;
  int v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  if (a5)
  {
    objc_msgSend_currentProperties(self, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *a5;
    *a5 = v12;

  }
  AMFDRGetOptions();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  if (v14)
  {
    objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("Metadata"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend_mutableCopy(v18, v19, v20, v21);
    if (v25)
    {
      objc_msgSend_currentProperties(self, v22, v23, v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)CFSTR("mlb#"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend_currentProperties(self, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v33, v34, (uint64_t)CFSTR("mlb#"), v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v25, v37, (uint64_t)v36, (uint64_t)CFSTR("MLBNumber"));

      }
      objc_msgSend_currentProperties(self, v30, v31, v32);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v38, v39, (uint64_t)CFSTR("SrNm"), v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        objc_msgSend_currentProperties(self, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)CFSTR("SrNm"), v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v25, v49, (uint64_t)v48, (uint64_t)CFSTR("SerialNumber"));

      }
      AMFDRSetOption();
    }
    handleForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v52 = 138412290;
      v53 = v25;
      _os_log_impl(&dword_214503000, v50, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", (uint8_t *)&v52, 0xCu);
    }

  }
  return 0;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (void *)objc_opt_new();
  handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_21456AFCC(v5, v6, v7, v8, v9, v10, v11, v12);

  return v4;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id *v48;
  id *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v54 = 0;
  objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v54, a8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a8 || !*a8)
  {
    v13 = objc_opt_new();
    v21 = objc_opt_new();
    v22 = (void *)v21;
    if (v13)
      v23 = v21 == 0;
    else
      v23 = 1;
    v20 = !v23;
    if (v23)
    {
      handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        sub_21456B000(v39, v40, v41, v42, v43, v44, v45, v46);
    }
    else
    {
      v48 = a6;
      v49 = a7;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v24 = v12;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v50, (uint64_t)v55, 16);
      if (v26)
      {
        v29 = v26;
        v30 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v51 != v30)
              objc_enumerationMutation(v24);
            v32 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v27, v32, v28, v48, v49, (_QWORD)v50);
            objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v22, v36, (uint64_t)v35, v37);

          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v50, (uint64_t)v55, 16);
        }
        while (v29);
      }

      if (a5)
        objc_storeStrong(a5, v13);
      if (v48)
        objc_storeStrong(v48, v22);
      if (!v49)
        goto LABEL_29;
      v38 = v54;
      v39 = *v49;
      *v49 = v38;
    }

LABEL_29:
    goto LABEL_30;
  }
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_21456B034((uint64_t)a8, v13, v14, v15, v16, v17, v18, v19);
  v20 = 0;
LABEL_30:

  return v20;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const __CFString *v10;

  v5 = a3;
  if (objc_msgSend_containsObject_(&unk_24D1B8680, v6, (uint64_t)a4, v7))
  {
    v10 = CFSTR("IPHONE COMP FACEID");
    if (!objc_msgSend_containsObject_(v5, v8, (uint64_t)CFSTR("IPHONE COMP FACEID"), v9))
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }

  return (id)v10;
}

@end
