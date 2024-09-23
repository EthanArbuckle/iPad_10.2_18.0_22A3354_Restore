@implementation CRFDRGen1DeviceHandler

+ (BOOL)isGen1ProductType:(int)a3
{
  int64x2_t v3;

  v3 = vdupq_n_s64(*(unint64_t *)&a3);
  return vmaxv_u16((uint16x4_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575E50), (int32x4_t)vceqq_s64(v3, (int64x2_t)xmmword_214575E60)))) & 1 | (*(_QWORD *)&a3 == 1234705395);
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRGen1DeviceHandler *v4;

  if (objc_msgSend_isGen1ProductType_(CRFDRGen1DeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRGen1DeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen1DeviceHandler);
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  int v12;
  id v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v10 = objc_msgSend_containsObject_(v6, v8, (uint64_t)CFSTR("IPHONE COMP FACEID"), v9);

  if (v10)
  {
    v25 = 0;
    v12 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v11, (uint64_t)v7, (uint64_t)CFSTR("psd2"), &v25);
    v13 = v25;
    v14 = 0;
    if (v12)
      v15 = v13 == 0;
    else
      v15 = 0;
    if (!v15)
    {
      v16 = (uint64_t)v13;
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_21456B0A0(v16, v17, v18, v19, v20, v21, v22, v23);

      v14 = (void *)v16;
    }
  }
  else
  {
    v14 = 0;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v7;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  uint64_t v59;
  const char *v60;
  int v61;
  id v62;
  BOOL v63;
  NSObject *v64;
  void *v65;
  NSObject *v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v12 = (void *)objc_opt_new();
  if (a5)
  {
    objc_msgSend_currentProperties(self, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a5;
    *a5 = v13;

  }
  AMFDRGetOptions();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v15;
  if (v15)
  {
    objc_msgSend_objectForKeyedSubscript_(v15, v16, (uint64_t)CFSTR("Metadata"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_mutableCopy(v19, v20, v21, v22);
    if (v26)
    {
      objc_msgSend_currentProperties(self, v23, v24, v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v27, v28, (uint64_t)CFSTR("mlb#"), v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend_currentProperties(self, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v34, v35, (uint64_t)CFSTR("mlb#"), v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v26, v38, (uint64_t)v37, (uint64_t)CFSTR("MLBNumber"));

      }
      objc_msgSend_currentProperties(self, v31, v32, v33);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v39, v40, (uint64_t)CFSTR("SrNm"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend_currentProperties(self, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v46, v47, (uint64_t)CFSTR("SrNm"), v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v26, v50, (uint64_t)v49, (uint64_t)CFSTR("SerialNumber"));

      }
      AMFDRSetOption();
    }
    handleForCategory(0);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v84 = (uint64_t)v26;
      _os_log_impl(&dword_214503000, v51, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }

  }
  v76 = v8;
  if (objc_msgSend_containsObject_(v8, v16, (uint64_t)CFSTR("IPHONE COMP FACEID"), v17)
    && (v80 = 0u,
        v81 = 0u,
        v78 = 0u,
        v79 = 0u,
        (v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8698, v52, (uint64_t)&v78, (uint64_t)v82, 16)) != 0))
  {
    v56 = v53;
    v57 = *(_QWORD *)v79;
    while (2)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v79 != v57)
          objc_enumerationMutation(&unk_24D1B8698);
        v59 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
        if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v54, v59, v55) & 1) != 0)
        {
          v77 = 0;
          v61 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v60, (uint64_t)v12, v59, &v77);
          v62 = v77;
          if (v61)
            v63 = v62 == 0;
          else
            v63 = 0;
          if (!v63)
          {
            v65 = v62;
            handleForCategory(0);
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
              sub_21456B104((uint64_t)v65, v66, v68, v69, v70, v71, v72, v73);

            goto LABEL_35;
          }
        }
        else
        {
          handleForCategory(0);
          v64 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v59;
            _os_log_impl(&dword_214503000, v64, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
          }

        }
      }
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8698, v54, (uint64_t)&v78, (uint64_t)v82, 16);
      v65 = 0;
      if (v56)
        continue;
      break;
    }
  }
  else
  {
    v65 = 0;
  }
LABEL_35:
  if (a6)
    *a6 = objc_retainAutorelease(v65);

  return v12;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  id v7;
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
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id *v30;
  id v31;
  uint8_t v32;
  _BYTE v33[7];
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31 = (id)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v6;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v36;
    v30 = a4;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend_isEqualToString_(v15, v10, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v11))
        {
          v34 = 0;
          v18 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v16, (uint64_t)v31, (uint64_t)CFSTR("bcrt"), &v34);
          v19 = v34;
          v20 = v19;
          if (!v18 || v19)
          {
            handleForCategory(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              sub_21456B19C((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);

            goto LABEL_19;
          }
        }
        if (objc_msgSend_isEqualToString_(v15, v16, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v17))
        {
          handleForCategory(0);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            sub_21456B168(&v32, v33, v21);

        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v35, (uint64_t)v39, 16);
      if (v12)
        continue;
      break;
    }
    v20 = 0;
LABEL_19:
    a4 = v30;
  }
  else
  {
    v20 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v20);

  return v31;
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
  id *v43;
  id *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v49 = 0;
  objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v49, a8);
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
        sub_21456B200(v39, v40, v41);
    }
    else
    {
      v43 = a6;
      v44 = a7;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v24 = v12;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v45, (uint64_t)v50, 16);
      if (v26)
      {
        v29 = v26;
        v30 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v46 != v30)
              objc_enumerationMutation(v24);
            v32 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v27, v32, v28, v43, v44, (_QWORD)v45);
            objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v22, v36, (uint64_t)v35, v37);

          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v45, (uint64_t)v50, 16);
        }
        while (v29);
      }

      if (a5)
        objc_storeStrong(a5, v13);
      if (v43)
        objc_storeStrong(v43, v22);
      if (!v44)
        goto LABEL_29;
      v38 = v49;
      v39 = *v44;
      *v44 = v38;
    }

LABEL_29:
    goto LABEL_30;
  }
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_214569794((uint64_t)a8, v13, v14, v15, v16, v17, v18, v19);
  v20 = 0;
LABEL_30:

  return v20;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend_isEqual_(CFSTR("bcrt"), v7, (uint64_t)v6, v8)
    || (v11 = CFSTR("IPHONE COMP BATTERY"),
        (objc_msgSend_containsObject_(v5, v9, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v10) & 1) == 0))
  {
    if (objc_msgSend_containsObject_(&unk_24D1B8698, v9, (uint64_t)v6, v10))
    {
      v11 = CFSTR("IPHONE COMP FACEID");
      if (!objc_msgSend_containsObject_(v5, v12, (uint64_t)CFSTR("IPHONE COMP FACEID"), v13))
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
  }

  return (id)v11;
}

@end
