@implementation CRFDRiPad1DeviceHandler

+ (BOOL)isiPad1ProductType:(int)a3
{
  BOOL result;
  uint64_t v4;

  result = 1;
  if (*(uint64_t *)&a3 > 2622433983)
  {
    if (*(uint64_t *)&a3 > 3241053351)
    {
      if (*(_QWORD *)&a3 == 3241053352)
        return result;
      v4 = 3677894691;
    }
    else
    {
      if (*(_QWORD *)&a3 == 2622433984)
        return result;
      v4 = 2634105757;
    }
  }
  else if (*(uint64_t *)&a3 > 2487868871)
  {
    if (*(_QWORD *)&a3 == 2487868872)
      return result;
    v4 = 2619317134;
  }
  else
  {
    if (*(_QWORD *)&a3 == 555503454)
      return result;
    v4 = 810906663;
  }
  if (*(_QWORD *)&a3 != v4)
    return 0;
  return result;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  uint64_t v3;
  CRFDRiPad1DeviceHandler *v4;

  if (objc_msgSend_isiPad1ProductType_(CRFDRiPad1DeviceHandler, a2, *(uint64_t *)&a3, v3))
    v4 = objc_alloc_init(CRFDRiPad1DeviceHandler);
  else
    v4 = 0;
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init(CRFDRiPad1DeviceHandler);
}

- (BOOL)supportPatch
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134)
      return v2;
    v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454)
      return v2;
    v4 = 2487868872;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (BOOL)supportMesaRepair
{
  MGGetProductType();
  return 0;
}

- (id)getPatchInfoPerSPC
{
  return &unk_24D1B8AC8;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v10 = objc_msgSend_containsObject_(v6, v8, (uint64_t)CFSTR("IPAD COMP DISPLAY"), v9);

  if (v10)
  {
    if (!objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, (uint64_t)CFSTR("tcrt"), v12))
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = CFSTR("tcrt");
        _os_log_impl(&dword_214503000, v18, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be claimed", buf, 0xCu);
      }
      v16 = 0;
LABEL_14:

      v17 = v16;
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
    v20 = 0;
    v14 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v13, (uint64_t)v7, (uint64_t)CFSTR("tcrt"), &v20);
    v15 = v20;
    v16 = v15;
    if (!v14 || (v17 = 0, v15))
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_21456B91C();
      goto LABEL_14;
    }
  }
  else
  {
    v17 = 0;
  }
  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v17);
LABEL_10:

  return v7;
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  int v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v10 = objc_msgSend_containsObject_(v6, v8, (uint64_t)CFSTR("IPAD FRONT CAMERA"), v9);

  if (v10)
  {
    if (!objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, (uint64_t)CFSTR("psd2"), v12))
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = CFSTR("psd2");
        _os_log_impl(&dword_214503000, v18, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be updated", buf, 0xCu);
      }
      v16 = 0;
LABEL_14:

      v17 = v16;
      if (!a4)
        goto LABEL_10;
      goto LABEL_9;
    }
    v20 = 0;
    v14 = objc_msgSend__addDataClassAndInstanceToMutableDictionary_dataClass_withError_(self, v13, (uint64_t)v7, (uint64_t)CFSTR("psd2"), &v20);
    v15 = v20;
    v16 = v15;
    if (!v14 || (v17 = 0, v15))
    {
      handleForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_21456B8BC();
      goto LABEL_14;
    }
  }
  else
  {
    v17 = 0;
  }
  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v17);
LABEL_10:

  return v7;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  void *v27;
  int v28;
  id *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id *v41;
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
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  id *v79;
  int v80;
  NSObject *v81;
  id v82;
  BOOL v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  uint64_t v90;
  const char *v91;
  id v92;
  BOOL v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  void *v98;
  NSObject *v99;
  NSObject *v102;
  NSObject *v103;
  id *v105;
  void *v106;
  id *v107;
  id v108;
  void *v109;
  __AMFDR *v111;
  id v112;
  id obj;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  uint8_t v126[128];
  uint8_t buf[24];
  uint64_t v128;

  v128 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  objc_msgSend_currentProperties(self, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend_mutableCopy(v17, v18, v19, v20);

  v22 = objc_opt_new();
  v23 = objc_opt_new();
  v112 = (id)v23;
  obj = (id)v22;
  if (v22)
    v24 = v23 == 0;
  else
    v24 = 1;
  if (v24)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456C6D4(v25);

    v26 = 0;
    v27 = 0;
    LOBYTE(v28) = 0;
    v29 = a7;
    if (a7)
      goto LABEL_80;
    goto LABEL_81;
  }
  AMFDRGetOptions();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = v30;
  v111 = a4;
  if (v30)
  {
    objc_msgSend_objectForKeyedSubscript_(v30, v31, (uint64_t)CFSTR("Metadata"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend_mutableCopy(v33, v34, v35, v36);
    if (v40)
    {
      v41 = a5;
      objc_msgSend_currentProperties(self, v37, v38, v39);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v42, v43, (uint64_t)CFSTR("mlb#"), v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        objc_msgSend_currentProperties(self, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v49, v50, (uint64_t)CFSTR("mlb#"), v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v40, v53, (uint64_t)v52, (uint64_t)CFSTR("MLBNumber"));

      }
      objc_msgSend_currentProperties(self, v46, v47, v48);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v54, v55, (uint64_t)CFSTR("SrNm"), v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (v57)
      {
        objc_msgSend_currentProperties(self, v58, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v61, v62, (uint64_t)CFSTR("SrNm"), v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v40, v65, (uint64_t)v64, (uint64_t)CFSTR("SerialNumber"));

      }
      AMFDRSetOption();
      a5 = v41;
    }
    handleForCategory(0);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl(&dword_214503000, v66, OS_LOG_TYPE_DEFAULT, "Meta-data = %@", buf, 0xCu);
    }

  }
  v107 = a8;
  v108 = v13;
  v106 = v21;
  if (!objc_msgSend_containsObject_(v13, v31, (uint64_t)CFSTR("IPAD COMP DISPLAY"), v32, a5)
    || (v123 = 0u,
        v124 = 0u,
        v121 = 0u,
        v122 = 0u,
        (v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B87E8, v67, (uint64_t)&v121, (uint64_t)v126, 16)) == 0))
  {
    LOBYTE(v28) = 0;
    goto LABEL_43;
  }
  v70 = v69;
  LOBYTE(v28) = 0;
  v71 = *(_QWORD *)v122;
  while (2)
  {
    for (i = 0; i != v70; ++i)
    {
      if (*(_QWORD *)v122 != v71)
        objc_enumerationMutation(&unk_24D1B87E8);
      v73 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
      if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v67, (uint64_t)v73, v68) & 1) != 0)
      {
        if (objc_msgSend_isEqualToString_(v73, v74, (uint64_t)CFSTR("HmCA"), v75))
        {
          if (!objc_msgSend__hasALSOnDisplay(self, v76, v77, v78))
            continue;
          v120 = 0;
          v79 = (id *)&v120;
          v80 = objc_msgSend__addHmCAToMutableArrayWithFdrRemote_dataClasses_dataInstances_error_(self, v67, (uint64_t)v111, (uint64_t)obj, v112, &v120);
        }
        else
        {
          v119 = 0;
          v79 = (id *)&v119;
          v80 = objc_msgSend__addDataClassAndInstancesToMutableArray_dataClasses_dataInstances_withError_(self, v76, (uint64_t)v73, (uint64_t)obj, v112, &v119);
        }
        v28 = v80;
        v82 = *v79;
        if (v28)
          v83 = v82 == 0;
        else
          v83 = 0;
        if (!v83)
        {
          v26 = v82;
          handleForCategory(0);
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            sub_21456C674();
LABEL_70:

          v13 = v108;
          goto LABEL_71;
        }
      }
      else
      {
        handleForCategory(0);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v73;
          _os_log_impl(&dword_214503000, v81, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
        }

      }
    }
    v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B87E8, v67, (uint64_t)&v121, (uint64_t)v126, 16);
    if (v70)
      continue;
    break;
  }
LABEL_43:
  if (objc_msgSend_containsObject_(v13, v67, (uint64_t)CFSTR("IPAD FRONT CAMERA"), v68))
  {
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8800, v84, (uint64_t)&v115, (uint64_t)v125, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v116;
      while (2)
      {
        for (j = 0; j != v87; ++j)
        {
          if (*(_QWORD *)v116 != v88)
            objc_enumerationMutation(&unk_24D1B8800);
          v90 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j);
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v84, v90, v85) & 1) != 0)
          {
            v114 = 0;
            v28 = objc_msgSend__addDataClassAndInstancesToMutableArray_dataClasses_dataInstances_withError_(self, v91, v90, (uint64_t)obj, v112, &v114);
            v92 = v114;
            if (v28)
              v93 = v92 == 0;
            else
              v93 = 0;
            if (!v93)
            {
              v26 = v92;
              handleForCategory(0);
              v99 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
                sub_21456C674();
              goto LABEL_70;
            }
          }
          else
          {
            handleForCategory(0);
            v94 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v90;
              _os_log_impl(&dword_214503000, v94, OS_LOG_TYPE_DEFAULT, "The device doesn't support class %@, so the class won't be added", buf, 0xCu);
            }

          }
        }
        v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8800, v84, (uint64_t)&v115, (uint64_t)v125, 16);
        v13 = v108;
        if (v87)
          continue;
        break;
      }
    }
  }
  if (objc_msgSend_containsObject_(v13, v84, (uint64_t)CFSTR("IPAD REAR CAMERA"), v85))
  {
    v21 = v106;
    a8 = v107;
    a5 = v105;
    if ((objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v95, (uint64_t)CFSTR("RCSn"), v96) & 1) != 0)
    {
      *(_QWORD *)buf = 0;
      v98 = (void *)AMFDRSealingMapCopyPropertyWithTag();
      v26 = *(void **)buf;
      if (v98 && !*(_QWORD *)buf)
      {
        objc_msgSend_setObject_forKeyedSubscript_(v106, v97, (uint64_t)v98, (uint64_t)CFSTR("RCSn"));

        goto LABEL_75;
      }
      handleForCategory(0);
      v103 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
        sub_21456C5F0((uint64_t)v26, v103);

      LOBYTE(v28) = v28 & 1;
    }
    else
    {
      handleForCategory(0);
      v102 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("RCSn");
        _os_log_impl(&dword_214503000, v102, OS_LOG_TYPE_DEFAULT, "The device doesn't support property %@, so the property won't be added", buf, 0xCu);
      }

      v26 = 0;
LABEL_75:
      LOBYTE(v28) = 1;
    }
  }
  else
  {
    v26 = 0;
    LOBYTE(v28) = 1;
LABEL_71:
    v21 = v106;
    a8 = v107;
    a5 = v105;
  }
  v27 = v109;
  v29 = a7;
  if (a7)
LABEL_80:
    objc_storeStrong(v29, v21);
LABEL_81:
  if (a5)
    objc_storeStrong(a5, obj);
  if (a6)
    objc_storeStrong(a6, v112);
  if (a8)
    *a8 = objc_retainAutorelease(v26);

  return v28;
}

- (BOOL)_hasRearALS
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 2619317133)
  {
    if (v3 == 2619317134)
      return v2;
    v4 = 3241053352;
  }
  else
  {
    if (v3 == 555503454)
      return v2;
    v4 = 2487868872;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (BOOL)_hasALSOnDisplay
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 2622433983)
  {
    if (v3 > 3241053351)
    {
      if (v3 == 3241053352)
        return v2;
      v4 = 3677894691;
    }
    else
    {
      if (v3 == 2622433984)
        return v2;
      v4 = 2634105757;
    }
  }
  else if (v3 > 2487868871)
  {
    if (v3 == 2487868872)
      return v2;
    v4 = 2619317134;
  }
  else
  {
    if (v3 == 555503454)
      return v2;
    v4 = 810906663;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (BOOL)_addHmCAToMutableArrayWithFdrRemote:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 error:(id *)a6
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  void *v30;
  const char *v31;
  id v32;
  void *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  const char *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  int isEqualToString;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  const char *v60;
  uint64_t v61;
  BOOL v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  id v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t j;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  NSObject *v120;
  void *v121;
  void *v122;
  const char *v123;
  CRFDRiPad1DeviceHandler *v124;
  id *v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  objc_super v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  const __CFString *v145;
  uint8_t v146[128];
  uint8_t buf[4];
  uint64_t v148;
  __int16 v149;
  id v150;
  _BYTE v151[128];
  uint64_t v152;
  _QWORD v153[4];

  v153[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v129 = a5;
  v142 = 0;
  v143 = 0;
  v141 = 0;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v15, v16, v17);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v10, v22, (uint64_t)CFSTR("HmCA"), v23))
  {
    v27 = (void *)MEMORY[0x24BDD1540];
    v152 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v24, (uint64_t)CFSTR("MTUB combo repair not supported"), v26);
    v28 = objc_claimAutoreleasedReturnValue();
    v153[0] = v28;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v153, (uint64_t)&v152, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v27, v31, (uint64_t)CFSTR("com.apple.corerepair"), -26, v30);
    v32 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    v38 = 0;
    goto LABEL_7;
  }
  objc_msgSend_set(MEMORY[0x24BDBCF20], v24, v25, v26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v139.receiver = self;
  v139.super_class = (Class)CRFDRiPad1DeviceHandler;
  v140 = 0;
  v34 = -[CRFDRBaseDeviceHandler getCurrentManifestDataClassesAndInstancesWithPartSPC:fdr:currentClasses:currentInstances:currentProperties:fdrError:](&v139, sel_getCurrentManifestDataClassesAndInstancesWithPartSPC_fdr_currentClasses_currentInstances_currentProperties_fdrError_, v33, a3, &v142, &v141, 0, &v140);
  v32 = v140;

  if (v32)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_21456C714();
    goto LABEL_6;
  }
  v124 = self;
  v126 = v10;
  v127 = v21;
  if (objc_msgSend_count(v142, v35, v36, v37))
  {
    v42 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v142, v40, v42, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v43, v44, (uint64_t)CFSTR("HmCA"), v45);

      if (isEqualToString)
      {
        objc_msgSend_objectAtIndexedSubscript_(v141, v47, v42, v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v51, (uint64_t)v50, v52);

      }
      ++v42;
    }
    while (objc_msgSend_count(v142, v47, v48, v49) > v42);
  }
  v128 = v14;
  v125 = a6;
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8830, v40, (uint64_t)&v135, (uint64_t)v151, 16);
  if (v53)
  {
    v56 = v53;
    v57 = *(_QWORD *)v136;
    while (2)
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v136 != v57)
          objc_enumerationMutation(&unk_24D1B8830);
        v59 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        v143 = 0;
        v28 = ZhuGeCopyValue();
        v32 = v143;
        if (v28)
          v62 = v143 == 0;
        else
          v62 = 0;
        if (!v62)
        {
          handleForCategory(0);
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v148 = (uint64_t)v59;
            v149 = 2112;
            v150 = v32;
            _os_log_impl(&dword_214503000, v63, OS_LOG_TYPE_DEFAULT, "Failed to read live serial number of %@ failed, error: %@", buf, 0x16u);
          }

          if ((objc_msgSend_isEqualToString_(v59, v64, (uint64_t)CFSTR("AmbientLightSensorFrontLandSerialNumber"), v65) & 1) != 0)
          {
            v38 = 0;
            v10 = v126;
            goto LABEL_55;
          }

          v28 = &stru_24D1AB488;
        }
        objc_msgSend_addObject_(v130, v60, (uint64_t)v28, v61);

      }
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_24D1B8830, v66, (uint64_t)&v135, (uint64_t)v151, 16);
      if (v56)
        continue;
      break;
    }
  }
  v10 = v126;
  objc_msgSend_addObject_(v126, v54, (uint64_t)CFSTR("HmCA"), v55);
  objc_msgSend_objectAtIndexedSubscript_(v130, v67, 0, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v129, v70, (uint64_t)v69, v71);

  objc_msgSend_setWithArray_(MEMORY[0x24BDBCEF0], v72, (uint64_t)v14, v73);
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v74, (uint64_t)v130, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_minusSet_(v28, v77, (uint64_t)v76, v78);

  objc_msgSend_objectAtIndexedSubscript_(v130, v79, 1, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v127, v82, (uint64_t)v81, v83);

  if (objc_msgSend__hasRearALS(v124, v84, v85, v86))
  {
    objc_msgSend_objectAtIndexedSubscript_(v130, v87, 2, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v127, v90, (uint64_t)v89, v91);

  }
  handleForCategory(0);
  v92 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v148 = (uint64_t)v14;
    _os_log_impl(&dword_214503000, v92, OS_LOG_TYPE_DEFAULT, "Sealed ALS instances: %@", buf, 0xCu);
  }

  handleForCategory(0);
  v93 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v148 = (uint64_t)v130;
    _os_log_impl(&dword_214503000, v93, OS_LOG_TYPE_DEFAULT, "Live ALS instances: %@", buf, 0xCu);
  }

  handleForCategory(0);
  v94 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v148 = (uint64_t)v28;
    _os_log_impl(&dword_214503000, v94, OS_LOG_TYPE_DEFAULT, "Missing ALS instances: %@", buf, 0xCu);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v95 = v127;
  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v131, (uint64_t)v146, 16);
  if (v97)
  {
    v100 = v97;
    v101 = *(_QWORD *)v132;
    while (2)
    {
      for (j = 0; j != v100; ++j)
      {
        if (*(_QWORD *)v132 != v101)
          objc_enumerationMutation(v95);
        v103 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * j);
        if (objc_msgSend_containsObject_(v128, v98, v103, v99))
        {
          objc_msgSend_addObject_(v129, v104, v103, v106);
        }
        else
        {
          if (!objc_msgSend_count(v28, v104, v105, v106))
          {
            v121 = (void *)MEMORY[0x24BDD1540];
            v144 = *MEMORY[0x24BDD0FC8];
            v145 = CFSTR("No candidate instance to use");
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v109, (uint64_t)&v145, (uint64_t)&v144, 1);
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_errorWithDomain_code_userInfo_(v121, v123, (uint64_t)CFSTR("com.apple.corerepair"), -42, v122);
            v32 = (id)objc_claimAutoreleasedReturnValue();

            v38 = 0;
            goto LABEL_54;
          }
          objc_msgSend_allObjects(v28, v109, v110, v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v112, v113, 0, v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_removeObject_(v28, v116, (uint64_t)v115, v117);
          objc_msgSend_addObject_(v129, v118, (uint64_t)v115, v119);
          handleForCategory(0);
          v120 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v148 = v103;
            v149 = 2112;
            v150 = v115;
            _os_log_impl(&dword_214503000, v120, OS_LOG_TYPE_DEFAULT, "Found unsealed non-repairable instance: %@. Seal with instance: %@", buf, 0x16u);
          }

        }
        objc_msgSend_addObject_(v126, v107, (uint64_t)CFSTR("HmCA"), v108);
      }
      v100 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v131, (uint64_t)v146, 16);
      if (v100)
        continue;
      break;
    }
  }
  v32 = 0;
  v38 = 1;
LABEL_54:

LABEL_55:
  a6 = v125;
  v14 = v128;
  v21 = v127;
LABEL_7:

  if (a6)
    *a6 = objc_retainAutorelease(v32);

  return v38;
}

- (id)spcWithComponent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  const char *v12;
  uint64_t v13;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  if ((objc_msgSend_isEqual_(CFSTR("tcrt"), v5, (uint64_t)v4, v6) & 1) != 0)
    goto LABEL_5;
  if ((objc_msgSend_isEqual_(CFSTR("RCSn"), v7, (uint64_t)v4, v8) & 1) != 0)
  {
    v11 = CFSTR("IPAD REAR CAMERA");
    goto LABEL_6;
  }
  if ((objc_msgSend_containsObject_(&unk_24D1B87E8, v9, (uint64_t)v4, v10) & 1) != 0)
  {
LABEL_5:
    v11 = CFSTR("IPAD COMP DISPLAY");
    goto LABEL_6;
  }
  if ((objc_msgSend_containsObject_(&unk_24D1B8800, v12, (uint64_t)v4, v13) & 1) != 0
    || (objc_msgSend_isEqual_(CFSTR("psd2"), v15, (uint64_t)v4, v16) & 1) != 0)
  {
    v11 = CFSTR("IPAD FRONT CAMERA");
  }
  else
  {
    if (objc_msgSend_isEqual_(CFSTR("MSRk"), v17, (uint64_t)v4, v18))
      objc_msgSend_supportMesaRepair(self, v19, v20, v21);
    v11 = 0;
  }
LABEL_6:

  return (id)v11;
}

@end
