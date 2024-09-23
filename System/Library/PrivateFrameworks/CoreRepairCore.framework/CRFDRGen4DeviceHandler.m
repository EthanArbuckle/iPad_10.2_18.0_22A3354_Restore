@implementation CRFDRGen4DeviceHandler

+ (BOOL)isGen4ProductType:(int)a3
{
  return *(_QWORD *)&a3 == 2078329141;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRGen4DeviceHandler *v4;

  if (objc_msgSend_isGen4ProductType_(CRFDRGen4DeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRGen4DeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRGen4DeviceHandler);
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v10)
  {
    v13 = v10;
    v27 = a4;
    v14 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v8);
        if (objc_msgSend_isEqualToString_(*(void **)(*((_QWORD *)&v29 + 1) + 8 * i), v11, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v12, v27))
        {
          v28 = 0;
          v16 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v11, (uint64_t)v7, (uint64_t)CFSTR("vcrt"), &v28);
          v17 = v28;
          v18 = v17;
          if (!v16 || v17)
          {
            handleForCategory(0);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              sub_21456DCA0((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);

            goto LABEL_15;
          }
        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v13)
        continue;
      break;
    }
    v18 = 0;
LABEL_15:
    a4 = v27;
  }
  else
  {
    v18 = 0;
  }

  if (a4)
    *a4 = objc_retainAutorelease(v18);

  return v7;
}

- (id)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makePropertiesDict:(id *)a5 fdrError:(id *)a6
{
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  const char *v63;
  int v64;
  id v65;
  BOOL v66;
  NSObject *v67;
  CRFDRGen4DeviceHandler *v68;
  void *v69;
  int v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v80;
  NSObject *v81;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id *v89;
  id v90;
  uint64_t v91;
  void *v92;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t v99[128];
  uint8_t buf[4];
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend_currentProperties(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend_mutableCopy(v14, v15, v16, v17);

  AMFDRGetOptions();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  v92 = v18;
  if (v18)
  {
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("Metadata"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend_mutableCopy(v22, v23, v24, v25);
    if (v29)
    {
      objc_msgSend_currentProperties(self, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)CFSTR("mlb#"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend_currentProperties(self, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v37, v38, (uint64_t)CFSTR("mlb#"), v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v29, v41, (uint64_t)v40, (uint64_t)CFSTR("MLBNumber"));

      }
      objc_msgSend_currentProperties(self, v34, v35, v36);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)CFSTR("SrNm"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend_currentProperties(self, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)CFSTR("SrNm"), v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v29, v53, (uint64_t)v52, (uint64_t)CFSTR("SerialNumber"));

      }
      AMFDRSetOption();
    }
    handleForCategory(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v101 = (uint64_t)v29;
      _os_log_impl(&dword_214503000, v54, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }

    v21 = v92;
  }
  if (!objc_msgSend_containsObject_(v9, v19, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v20))
  {
    v72 = 0;
    v69 = (void *)v91;
    goto LABEL_33;
  }
  v89 = a5;
  v90 = v9;
  v97 = 0u;
  v98 = 0u;
  v95 = 0u;
  v96 = 0u;
  v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8998, v55, (uint64_t)&v95, (uint64_t)v99, 16);
  if (v56)
  {
    v59 = v56;
    v60 = *(_QWORD *)v96;
    while (2)
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v96 != v60)
          objc_enumerationMutation(&unk_24D1B8998);
        v62 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
        if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v57, v62, v58) & 1) != 0)
        {
          v94 = 0;
          v64 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v63, (uint64_t)v10, v62, &v94);
          v65 = v94;
          if (v64)
            v66 = v65 == 0;
          else
            v66 = 0;
          if (!v66)
          {
            v80 = (uint64_t)v65;
            handleForCategory(0);
            v81 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
              sub_21456B0A0(v80, v81, v83, v84, v85, v86, v87, v88);
            a5 = v89;
            v9 = v90;
            v69 = (void *)v91;
            v21 = v92;
            goto LABEL_41;
          }
        }
        else
        {
          handleForCategory(0);
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v101 = v62;
            _os_log_impl(&dword_214503000, v67, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
          }

        }
      }
      v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8998, v57, (uint64_t)&v95, (uint64_t)v99, 16);
      if (v59)
        continue;
      break;
    }
  }
  v93 = 0;
  v68 = self;
  v69 = (void *)v91;
  v70 = objc_msgSend__addPropertyToMutableDictionary_property_withError_(v68, v57, v91, (uint64_t)CFSTR("drp#"), &v93);
  v71 = v93;
  v80 = (uint64_t)v71;
  a5 = v89;
  v9 = v90;
  v21 = v92;
  if (v70)
  {
    v72 = 0;
    if (!v71)
    {
LABEL_33:
      if (!a6)
        goto LABEL_35;
      goto LABEL_34;
    }
  }
  handleForCategory(0);
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
    sub_21456DD04(v80, v81, v73, v74, v75, v76, v77, v78);
LABEL_41:

  v72 = (void *)v80;
  if (a6)
LABEL_34:
    *a6 = objc_retainAutorelease(v72);
LABEL_35:
  if (a5)
    objc_storeStrong(a5, v69);

  return v10;
}

- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  int64_t v14;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  int isServicePart;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  char v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  int v53;
  uint8_t v54[16];
  uint8_t v55[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v10 = v7;
  if (!v7 || objc_msgSend_isEqual_(v7, v8, (uint64_t)&unk_24D1B7CC8, v9))
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "No requirement for display swapped duration check", buf, 2u);
    }
    v14 = 0;
    goto LABEL_6;
  }
  if (!objc_msgSend_containsObject_(v6, v11, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v12))
  {
    v14 = 0;
    goto LABEL_7;
  }
  v13 = MGCopyAnswer();
  objc_msgSend_convertToHexString(v13, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isServicePart = objc_msgSend_isServicePart(self, v20, v21, v22);
  handleForCategory(0);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!isServicePart)
  {
    if (v25)
    {
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "Validate CG serial number with original MLB", v54, 2u);
    }

    v43 = (int)objc_msgSend_intValue(v10, v40, v41, v42);
    objc_msgSend_previousCGSN(self, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sealDate(self, v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_validateSwappedForDays_currentSN_previousSN_sealDate_(self, v52, v43, (uint64_t)v19, v47, v51);

    if (!v53)
    {
      v14 = -44;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v25)
  {
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, "Validate CG serial number with service MLB", v55, 2u);
  }

  v29 = (int)objc_msgSend_intValue(v10, v26, v27, v28);
  objc_msgSend_kbbCGSN(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_kbbSealDate(self, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_validateSwappedForDays_currentSN_previousSN_sealDate_(self, v38, v29, (uint64_t)v19, v33, v37);

  if ((v39 & 1) != 0)
  {
LABEL_18:
    v14 = 0;
    goto LABEL_20;
  }
  v14 = -51;
LABEL_20:

LABEL_6:
LABEL_7:

  return v14;
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
  id *v41;
  id *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v47 = 0;
  objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makePropertiesDict_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v47, a8);
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
        sub_21456C6D4(v39);
    }
    else
    {
      v41 = a6;
      v42 = a7;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v24 = v12;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v43, (uint64_t)v48, 16);
      if (v26)
      {
        v29 = v26;
        v30 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v44 != v30)
              objc_enumerationMutation(v24);
            v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend_addObject_(v13, v27, v32, v28, v41, v42, (_QWORD)v43);
            objc_msgSend_objectForKeyedSubscript_(v24, v33, v32, v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v22, v36, (uint64_t)v35, v37);

          }
          v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v43, (uint64_t)v48, 16);
        }
        while (v29);
      }

      if (a5)
        objc_storeStrong(a5, v13);
      if (v41)
        objc_storeStrong(v41, v22);
      if (!v42)
        goto LABEL_29;
      v38 = v47;
      v39 = *v42;
      *v42 = v38;
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
  if (!objc_msgSend_isEqual_(CFSTR("vcrt"), v7, (uint64_t)v6, v8)
    || (v11 = CFSTR("IPHONE COMP BATTERY"),
        (objc_msgSend_containsObject_(v5, v9, (uint64_t)CFSTR("IPHONE COMP BATTERY"), v10) & 1) == 0))
  {
    if (objc_msgSend_containsObject_(&unk_24D1B8998, v9, (uint64_t)v6, v10))
    {
      v11 = CFSTR("IPHONE COMP DISPLAY");
      if (!objc_msgSend_containsObject_(v5, v12, (uint64_t)CFSTR("IPHONE COMP DISPLAY"), v13))
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
  }

  return (id)v11;
}

- (id)spcWithComponent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const __CFString *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  if ((objc_msgSend_isEqual_(CFSTR("vcrt"), v4, (uint64_t)v3, v5) & 1) != 0)
  {
    v8 = CFSTR("IPHONE COMP BATTERY");
  }
  else if ((objc_msgSend_isEqual_(CFSTR("drp#"), v6, (uint64_t)v3, v7) & 1) != 0)
  {
    v8 = CFSTR("IPHONE COMP DISPLAY");
  }
  else
  {
    v8 = CFSTR("IPHONE COMP DISPLAY");
    if ((objc_msgSend_containsObject_(&unk_24D1B8998, v9, (uint64_t)v3, v10) & 1) == 0
      && !objc_msgSend_isEqual_(CFSTR("MSRk"), v11, (uint64_t)v3, v12))
    {
      v8 = 0;
    }
  }

  return (id)v8;
}

@end
