@implementation CRRepairReport

+ (id)generateReport:(id)a3 error:(id *)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  _QWORD v42[7];

  v42[6] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend_populateRCHLHistory(a1, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_populateDCSignedComponents(a1, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_populateUnsealedComponents(a1, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_populateIssueComponents(a1, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_determineRepairStatus_repairHistory_(a1, v22, (uint64_t)v5, (uint64_t)v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = CFSTR("0.2");
  v36 = CFSTR("Version");
  v37 = CFSTR("Status");
  v27 = (uint64_t)v23;
  if (!v23)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
  }
  v34 = v27;
  v42[1] = v27;
  v38 = CFSTR("RepairHistory");
  v28 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v24, v25, v26, v27, v36, v37, v38);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[2] = v28;
  v39 = CFSTR("UnsealedComponents");
  v29 = v17;
  if (!v17)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v24, v25, v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[3] = v29;
  v40 = CFSTR("DCSignedComponents");
  v30 = v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v24, v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[4] = v30;
  v41 = CFSTR("IssueComponents");
  v31 = v21;
  if (!v21)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v24, v25, v26);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v42[5] = v31;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v24, (uint64_t)v42, (uint64_t)&v36, 6, v34);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (v13)
      goto LABEL_13;
  }
  else
  {

    if (v13)
    {
LABEL_13:
      if (v17)
        goto LABEL_14;
      goto LABEL_19;
    }
  }

  if (v17)
  {
LABEL_14:
    if (v9)
      goto LABEL_15;
LABEL_20:

    if (v23)
      goto LABEL_16;
LABEL_21:

    goto LABEL_16;
  }
LABEL_19:

  if (!v9)
    goto LABEL_20;
LABEL_15:
  if (!v23)
    goto LABEL_21;
LABEL_16:

  return v32;
}

+ (int)getComponentState:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  char v15;
  id v16;
  const char *v17;
  id v18;
  int v19;
  char v21;
  id v22;
  const char *v23;
  int v24;
  id v25;
  const char *v26;
  char v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  char v34;

  v5 = *(_QWORD *)&a3;
  v34 = 0;
  objc_msgSend_getSupportedComponents(a1, a2, *(uint64_t *)&a3, (uint64_t)a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v8, v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_containsObject_(v7, v11, (uint64_t)v10, v12);

  if (!v13)
  {
    v18 = 0;
    v19 = -1;
    goto LABEL_5;
  }
  v33 = 0;
  v15 = objc_msgSend_checkComponentFailed_error_(a1, v14, v5, (uint64_t)&v33);
  v16 = v33;
  v18 = v16;
  if ((v15 & 1) != 0)
  {
    v19 = 1;
    goto LABEL_5;
  }
  if (v16)
    goto LABEL_25;
  v32 = 0;
  v21 = objc_msgSend_checkComponentUnsealed_error_(a1, v17, v5, (uint64_t)&v32);
  v22 = v32;
  v18 = v22;
  if ((v21 & 1) != 0)
  {
    v19 = 2;
    goto LABEL_5;
  }
  if (v22)
    goto LABEL_25;
  v31 = 0;
  v24 = objc_msgSend_checkComponentResealed_usedPart_error_(a1, v23, v5, (uint64_t)&v34, &v31);
  v25 = v31;
  v18 = v25;
  if (v24)
  {
    if (v34)
      v19 = 4;
    else
      v19 = 3;
    goto LABEL_5;
  }
  if (v25)
  {
LABEL_25:
    v19 = -1;
LABEL_21:
    handleForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_21456DD68((uint64_t)v18, v29);

    if (a4)
    {
      v18 = objc_retainAutorelease(v18);
      *a4 = v18;
    }
    goto LABEL_5;
  }
  v30 = 0;
  v27 = objc_msgSend_checkNonSecureRepair_error_(a1, v26, v5, (uint64_t)&v30);
  v28 = v30;
  v18 = v28;
  if ((v27 & 1) != 0)
  {
    v19 = 3;
    goto LABEL_5;
  }
  if (v28)
    v19 = -1;
  else
    v19 = 0;
  if (v28)
    goto LABEL_21;
LABEL_5:

  return v19;
}

+ (id)populateRCHLHistory
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2, v3);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v5, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v12, v13, (uint64_t)CFSTR("System"), v14);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v53 = a1;
  objc_msgSend_getSupportedComponents(a1, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v59, (uint64_t)v64, 16);
  if (v20)
  {
    v24 = v20;
    v25 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v60 != v25)
          objc_enumerationMutation(v18);
        v27 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v59 + 1) + 8 * i), v21, v22, v23);
        objc_msgSend_getRCHLComponentWithType_(v5, v28, v27, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend_addObject_(v12, v30, (uint64_t)v32, v31);

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v59, (uint64_t)v64, 16);
    }
    while (v24);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v33 = v12;
  v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v55, (uint64_t)v63, 16);
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v37; ++j)
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(v33);
        v40 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * j);
        if (objc_msgSend_hasHadRCHLBasedRepairForComponent_withHistory_(v5, v36, v40, (uint64_t)v8))
        {
          objc_msgSend_RCHLBasedRepairDateForComponent_withHistory_(v5, v36, v40, (uint64_t)v8);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            objc_msgSend_itemWithName_(CRRepairReportItem, v41, v40, v42);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_withStatus_(v44, v45, 2, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_withDate_(v47, v48, (uint64_t)v43, v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_insertItem_item_(v53, v51, (uint64_t)v54, (uint64_t)v50);

          }
        }
      }
      v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v55, (uint64_t)v63, 16);
    }
    while (v37);
  }

  return v54;
}

+ (id)populateDCSignedComponents
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isDcSignedSealingManifest_(CRFDRUtils, v6, 0, v7))
  {
    objc_msgSend_itemWithName_(CRRepairReportItem, v8, (uint64_t)CFSTR("System"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_withStatus_(v11, v12, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_insertItem_item_(a1, v15, (uint64_t)v5, (uint64_t)v14);

  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend_getSupportedComponentTypes(CRDeviceMap, v8, v9, v10, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v18)
  {
    v22 = v18;
    v23 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v40 != v23)
          objc_enumerationMutation(v16);
        v25 = objc_msgSend_intValue(*(void **)(*((_QWORD *)&v39 + 1) + 8 * i), v19, v20, v21);
        if (objc_msgSend_isDcSignedComponent_error_(CRFDRUtils, v26, v25, 0))
        {
          objc_msgSend_getComponentName_(CRDeviceMap, v19, v25, v21);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          if (v27)
            v29 = (__CFString *)v27;
          else
            v29 = CFSTR("UNKNOWN");
          v30 = v29;

          objc_msgSend_itemWithName_(CRRepairReportItem, v31, (uint64_t)v30, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_withStatus_(v33, v34, 1, v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_insertItem_item_(a1, v37, (uint64_t)v5, (uint64_t)v36);

        }
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v22);
  }

  return v5;
}

+ (id)populateUnsealedComponents
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_findUnsealedDataWithError_(CRFDRUtils, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  if (v8 && objc_msgSend_count(v8, v9, v10, v11))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = v12;
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v28;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v13);
          objc_msgSend_itemWithName_(CRRepairReportItem, v16, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v20), v17, (_QWORD)v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_withStatus_(v21, v22, 4, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_insertItem_item_(a1, v25, (uint64_t)v5, (uint64_t)v24);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v18);
    }

  }
  return v5;
}

+ (id)populateIssueComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _QWORD v49[18];

  v49[16] = *MEMORY[0x24BDAC8D0];
  v43 = (void *)objc_opt_new();
  v49[0] = v43;
  v42 = (void *)objc_opt_new();
  v49[1] = v42;
  v41 = (void *)objc_opt_new();
  v49[2] = v41;
  v40 = (void *)objc_opt_new();
  v49[3] = v40;
  v39 = (void *)objc_opt_new();
  v49[4] = v39;
  v38 = (void *)objc_opt_new();
  v49[5] = v38;
  v37 = (void *)objc_opt_new();
  v49[6] = v37;
  v3 = (void *)objc_opt_new();
  v49[7] = v3;
  v4 = (void *)objc_opt_new();
  v49[8] = v4;
  v5 = (void *)objc_opt_new();
  v49[9] = v5;
  v6 = (void *)objc_opt_new();
  v49[10] = v6;
  v7 = (void *)objc_opt_new();
  v49[11] = v7;
  v8 = (void *)objc_opt_new();
  v49[12] = v8;
  v9 = (void *)objc_opt_new();
  v49[13] = v9;
  v10 = (void *)objc_opt_new();
  v49[14] = v10;
  v11 = (void *)objc_opt_new();
  v49[15] = v11;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v49, 16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x24BDBCEB8], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v17 = v36;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v44, (uint64_t)v48, 16);
  if (v19)
  {
    v23 = v19;
    v24 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v45 != v24)
          objc_enumerationMutation(v17);
        v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        if (objc_msgSend_isComponentFailed(v26, v20, v21, v22, v36))
        {
          objc_msgSend_componentName(v26, v20, v21, v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_itemWithName_(CRRepairReportItem, v28, (uint64_t)v27, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_withStatus_(v30, v31, 3, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_insertItem_item_(a1, v34, (uint64_t)v16, (uint64_t)v33);

        }
      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v44, (uint64_t)v48, 16);
    }
    while (v23);
  }

  return v16;
}

+ (id)determineRepairStatus:(id)a3 repairHistory:(id)a4
{
  void *v4;
  _BOOL8 v5;
  const char *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = objc_msgSend_count(a4, a2, (uint64_t)a3, (uint64_t)a4) != 0;
  return (id)objc_msgSend_numberWithInt_(v4, v6, v5, v7);
}

+ (id)translateToExternalName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend_objectForKeyedSubscript_(&unk_24D1B8B18, v4, (uint64_t)v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v3;
  v8 = v6;

  return v8;
}

+ (void)insertItem:(id)a3 item:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  id v37;

  v37 = a3;
  v6 = a4;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v6, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend_error(v6, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedDescription(v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -1;
  }
  else
  {
    v25 = objc_msgSend_statusCode(v6, v15, v16, v17);
  }
  objc_msgSend_name(v6, v22, v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_translateToExternalName_(a1, v27, (uint64_t)v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v10, v30, (uint64_t)v29, (uint64_t)CFSTR("Name"));

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v31, v25, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v10, v34, (uint64_t)v33, (uint64_t)CFSTR("State"));

  if (v14)
    objc_msgSend_setValue_forKey_(v10, v35, (uint64_t)v14, (uint64_t)CFSTR("Reason"));
  objc_msgSend_addObject_(v37, v35, (uint64_t)v10, v36);

}

+ (BOOL)checkComponentUnsealed:(int)a3 error:(id *)a4
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getKeysInComponent_(CRDeviceMap, a2, *(uint64_t *)&a3, (uint64_t)a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  if (v4 && objc_msgSend_count(v4, v5, v6, v7))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v8;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend_findUnsealedDataWithKey_error_(CRFDRUtils, v11, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), 0, (_QWORD)v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v15;
          if (v15 && objc_msgSend_count(v15, v16, v17, v18))
          {

            LOBYTE(v12) = 1;
            goto LABEL_15;
          }

        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v21, (uint64_t)v25, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

+ (BOOL)_checkComponentResealedWithRCHL:(int)a3 usedPart:(BOOL *)a4 error:(id *)a5
{
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  const char *v16;
  const char *v17;
  char hasHadRCHLBasedRepairForComponent_withHistory;
  id v20;

  v7 = *(_QWORD *)&a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend_getRCHLComponentWithType_(v8, v9, v7, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v20 = 0;
    objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v8, v11, (uint64_t)&v20, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v20;
    hasHadRCHLBasedRepairForComponent_withHistory = objc_msgSend_hasHadRCHLBasedRepairForComponent_withHistory_(v8, v16, (uint64_t)v13, (uint64_t)v14);
    if (a4)
      *a4 = objc_msgSend_checkUsedStatusFor_withHistory_withClaimCount_(v8, v17, (uint64_t)v13, (uint64_t)v14, v15);

  }
  else if (a5)
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFB8, CFSTR("Invalid component type"), 0);
    hasHadRCHLBasedRepairForComponent_withHistory = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    hasHadRCHLBasedRepairForComponent_withHistory = 0;
  }

  return hasHadRCHLBasedRepairForComponent_withHistory;
}

+ (BOOL)checkComponentResealed:(int)a3 usedPart:(BOOL *)a4 error:(id *)a5
{
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int isRCHLRepairHistoryDevice;
  const char *v14;
  char isDcSignedComponent_error;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;

  v7 = *(_QWORD *)&a3;
  v9 = (void *)objc_opt_new();
  isRCHLRepairHistoryDevice = objc_msgSend_isRCHLRepairHistoryDevice(v9, v10, v11, v12);

  if (isRCHLRepairHistoryDevice)
    isDcSignedComponent_error = objc_msgSend__checkComponentResealedWithRCHL_usedPart_error_(a1, v14, v7, (uint64_t)a4, a5);
  else
    isDcSignedComponent_error = objc_msgSend_isDcSignedComponent_error_(CRFDRUtils, v14, v7, (uint64_t)a5);
  v19 = isDcSignedComponent_error;
  if (a5 && *a5 && objc_msgSend_code(*a5, v16, v17, v18) == -72)
    *a5 = 0;
  return v19;
}

+ (BOOL)checkComponentFailed:(int)a3 error:(id *)a4
{
  char isComponentFailed;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  switch(a3)
  {
    case 1024:
    case 1025:
    case 1027:
    case 1028:
      v5 = (void *)objc_opt_new();
      isComponentFailed = objc_msgSend_isComponentFailed(v5, v9, v10, v11);
      goto LABEL_6;
    case 1026:
      v5 = (void *)objc_opt_new();
      if ((objc_msgSend_isComponentFailed(v5, v6, v7, v8) & 1) != 0)
      {
        isComponentFailed = 1;
      }
      else
      {
        v13 = (void *)objc_opt_new();
        isComponentFailed = objc_msgSend_isComponentFailed(v13, v14, v15, v16);

      }
LABEL_6:

      break;
    default:
      isComponentFailed = 0;
      break;
  }
  return isComponentFailed;
}

+ (BOOL)checkNonSecureRepair:(int)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  int v10;

  if (a3 == 1031)
  {
    v5 = (void *)ZhuGeCopyValue();
    v6 = (void *)ZhuGeCopyValue();
    v7 = 0;
    v10 = objc_msgSend_isEqualToData_(v5, v8, (uint64_t)v6, v9) ^ 1;

  }
  else
  {
    v7 = 0;
    if (a4)
    {
      v7 = objc_retainAutorelease(0);
      LOBYTE(v10) = 0;
      *a4 = v7;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }

  return v10;
}

+ (id)getSupportedComponents
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_getSupportedComponentTypes(CRDeviceMap, a2, v2, v3);
}

+ (BOOL)isSelfRepairedComponent:(int)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isSelfServiceSalesDistrict;
  NSObject *v16;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_getRCHLComponentWithType_(v4, v5, v3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v4, v7, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_repairCenterForComponent_withRCHLHistory_(v4, v11, (uint64_t)v9, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    isSelfServiceSalesDistrict = objc_msgSend_isSelfServiceSalesDistrict_(v4, v13, (uint64_t)v12, v14);

  }
  else
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456DDDC(v3, v16);

    isSelfServiceSalesDistrict = 0;
  }

  return isSelfServiceSalesDistrict;
}

@end
