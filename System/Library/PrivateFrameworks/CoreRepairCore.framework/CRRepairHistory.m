@implementation CRRepairHistory

- (CRRepairHistory)init
{
  const char *v2;
  uint64_t v3;
  CRRepairHistory *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  NSDictionary *repairHistoryMap;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  NSSet *useCountExceptionKeys;
  void *v37;
  objc_super v38;
  _QWORD v39[9];
  _QWORD v40[11];

  v40[9] = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)CRRepairHistory;
  v4 = -[CRRepairHistory init](&v38, sel_init);
  if (v4)
  {
    v39[0] = CFSTR("Battery");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v2, (uint64_t)&unk_24D1B8590, v3);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v37;
    v39[1] = CFSTR("Display");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v5, (uint64_t)&unk_24D1B85A8, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v7;
    v39[2] = CFSTR("Camera");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v8, (uint64_t)&unk_24D1B85C0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v10;
    v39[3] = CFSTR("FaceID");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v11, (uint64_t)&unk_24D1B85D8, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v13;
    v39[4] = CFSTR("Enclosure");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v14, (uint64_t)&unk_24D1B85F0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[4] = v16;
    v39[5] = CFSTR("BackGlass");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v17, (uint64_t)&unk_24D1B8608, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v40[5] = v19;
    v39[6] = CFSTR("MTUB");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v20, (uint64_t)&unk_24D1B8620, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40[6] = v22;
    v39[7] = CFSTR("TouchID");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v23, (uint64_t)&unk_24D1B8638, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[7] = v25;
    v39[8] = CFSTR("System");
    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v26, (uint64_t)&unk_24D1B8650, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v40[8] = v28;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v40, (uint64_t)v39, 9);
    v30 = objc_claimAutoreleasedReturnValue();
    repairHistoryMap = v4->repairHistoryMap;
    v4->repairHistoryMap = (NSDictionary *)v30;

    objc_msgSend_setWithArray_(MEMORY[0x24BDBCF20], v32, (uint64_t)&unk_24D1B8668, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    useCountExceptionKeys = v4->useCountExceptionKeys;
    v4->useCountExceptionKeys = (NSSet *)v34;

  }
  return v4;
}

- (id)getRCHLComponentWithType:(int)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[8];
  _QWORD v13[9];

  v3 = *(_QWORD *)&a3;
  v13[8] = *MEMORY[0x24BDAC8D0];
  v12[0] = &unk_24D1B7BD8;
  v12[1] = &unk_24D1B7BF0;
  v13[0] = CFSTR("Battery");
  v13[1] = CFSTR("Display");
  v12[2] = &unk_24D1B7C08;
  v12[3] = &unk_24D1B7C20;
  v13[2] = CFSTR("Camera");
  v13[3] = CFSTR("FaceID");
  v12[4] = &unk_24D1B7C38;
  v12[5] = &unk_24D1B7C50;
  v13[4] = CFSTR("TouchID");
  v13[5] = CFSTR("MTUB");
  v12[6] = &unk_24D1B7C68;
  v12[7] = &unk_24D1B7C80;
  v13[6] = CFSTR("BackGlass");
  v13[7] = CFSTR("Enclosure");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v13, (uint64_t)v12, 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v5, v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v8, (uint64_t)v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isSupportedIPad
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v2 = (void *)MGCopyAnswer();
  if (objc_msgSend_intValue(v2, v3, v4, v5) == 3)
  {
    v6 = (void *)MGCopyAnswer();
    v10 = objc_msgSend_BOOLValue(v6, v7, v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isRCHLRepairHistoryDevice
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  char isEqualToString;
  int isSubsetOfSet;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  NSDictionary *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  NSObject *v89;
  NSObject *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v99;
  NSObject *obj;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint8_t v109[128];
  uint8_t buf[4];
  NSObject *v111;
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v3 = MGGetProductType();
  v4 = (void *)MGCopyAnswer();
  v8 = objc_msgSend_intValue(v4, v5, v6, v7);

  if (v8 == 1)
  {
    if ((objc_msgSend_isLegacyProductType_(CRFDRLegacyDeviceHandler, v9, v3, v11) & 1) == 0
      && (objc_msgSend_isGen1ProductType_(CRFDRGen1DeviceHandler, v42, v3, v43) & 1) == 0
      && (objc_msgSend_isGen2ProductType_(CRFDRGen2DeviceHandler, v44, v3, v45) & 1) == 0
      && (objc_msgSend_isGen3ProductType_(CRFDRGen3DeviceHandler, v46, v3, v47) & 1) == 0
      && (objc_msgSend_isGen4ProductType_(CRFDRGen4DeviceHandler, v48, v3, v49) & 1) == 0)
    {
LABEL_7:
      objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(self, v13, 0, v14);
      v105 = 0u;
      v106 = 0u;
      v107 = 0u;
      v108 = 0u;
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v105, (uint64_t)v112, 16);
      if (v17)
      {
        v21 = v17;
        v22 = *(_QWORD *)v106;
        obj = v15;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v106 != v22)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
            objc_msgSend_dataClasses(v24, v18, v19, v20);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend_containsObject_(v25, v26, (uint64_t)CFSTR("FFFF"), v27) & 1) != 0)
              goto LABEL_29;
            objc_msgSend_properties(v24, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_containsObject_(v31, v32, (uint64_t)CFSTR("FFFF"), v33))
            {

LABEL_29:
LABEL_30:
              v15 = obj;
              objc_msgSend_extractRepairsAfterACRZWithHistory_(self, v18, (uint64_t)obj, v20);
              v50 = objc_claimAutoreleasedReturnValue();
              handleForCategory(0);
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v111 = v50;
                _os_log_impl(&dword_214503000, v51, OS_LOG_TYPE_DEFAULT, "post Repair keys:%@", buf, 0xCu);
              }

              if (v50 && objc_msgSend_count(v50, v52, v53, v54))
              {
                v55 = objc_opt_new();
                objc_msgSend__populateSealingMapProperties(CRFDRBaseDeviceHandler, v56, v57, v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend__populateSealingMapForCurrentDevice(CRFDRBaseDeviceHandler, v60, v61, v62);
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setWithSet_(MEMORY[0x24BDBCEF0], v64, (uint64_t)v63, v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = v59;
                objc_msgSend_allKeys(v59, v67, v68, v69);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObjectsFromArray_(v66, v71, (uint64_t)v70, v72);

                v103 = 0u;
                v104 = 0u;
                v101 = 0u;
                v102 = 0u;
                v73 = self->repairHistoryMap;
                v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v101, (uint64_t)v109, 16);
                if (v75)
                {
                  v78 = v75;
                  v79 = *(_QWORD *)v102;
                  do
                  {
                    for (j = 0; j != v78; ++j)
                    {
                      if (*(_QWORD *)v102 != v79)
                        objc_enumerationMutation(v73);
                      objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v76, *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j), v77);
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_unionSet_(v55, v82, (uint64_t)v81, v83);

                    }
                    v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v76, (uint64_t)&v101, (uint64_t)v109, 16);
                  }
                  while (v78);
                }

                objc_msgSend_intersectSet_(v55, v84, (uint64_t)v66, v85);
                handleForCategory(0);
                v86 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v111 = v55;
                  _os_log_impl(&dword_214503000, v86, OS_LOG_TYPE_DEFAULT, "Intersection keys:%@", buf, 0xCu);
                }

                isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v55, v87, (uint64_t)v50, v88);
                handleForCategory(0);
                v89 = objc_claimAutoreleasedReturnValue();
                v90 = v89;
                v15 = obj;
                if (isSubsetOfSet)
                {
                  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_214503000, v90, OS_LOG_TYPE_DEFAULT, "Device RCHL is valid after ACRZ", buf, 2u);
                  }
                }
                else if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
                {
                  sub_21456AEFC(v90, v91, v92, v93, v94, v95, v96, v97);
                }

              }
              else
              {
                handleForCategory(0);
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_214503000, v55, OS_LOG_TYPE_DEFAULT, "No Repairs post ACRZ", buf, 2u);
                }
                LOBYTE(isSubsetOfSet) = 0;
              }

              goto LABEL_53;
            }
            objc_msgSend_repairCenter(v24, v34, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v37, v38, (uint64_t)CFSTR("ACRZ"), v39);

            if ((isEqualToString & 1) != 0)
              goto LABEL_30;
          }
          v15 = obj;
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v105, (uint64_t)v112, 16);
          LOBYTE(isSubsetOfSet) = 1;
          if (v21)
            continue;
          break;
        }
      }
      else
      {
        LOBYTE(isSubsetOfSet) = 1;
      }
LABEL_53:

      goto LABEL_54;
    }
  }
  else
  {
    if (v8 != 3)
    {
      handleForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_21456AE78(v8, v3, v15);
      LOBYTE(isSubsetOfSet) = 0;
LABEL_54:

      return isSubsetOfSet;
    }
    if (objc_msgSend_isSupportedIPad(self, v9, v10, v11))
    {
      handleForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "Supported iPad", buf, 2u);
      }

      goto LABEL_7;
    }
  }
  LOBYTE(isSubsetOfSet) = 0;
  return isSubsetOfSet;
}

- (id)extractRepairsAfterACRZWithHistory:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  char isEqualToString;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v43 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = v3;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v44, (uint64_t)v48, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v45 != v11)
          objc_enumerationMutation(v4);
        v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend_dataClasses(v13, v7, v8, v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_containsObject_(v14, v15, (uint64_t)CFSTR("FFFF"), v16) & 1) == 0)
        {
          objc_msgSend_properties(v13, v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_containsObject_(v20, v21, (uint64_t)CFSTR("FFFF"), v22))
          {

          }
          else
          {
            objc_msgSend_repairCenter(v13, v23, v24, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v26, v27, (uint64_t)CFSTR("ACRZ"), v28);

            if ((isEqualToString & 1) != 0)
              continue;
            objc_msgSend_dataClasses(v13, v7, v8, v9);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_unionSet_(v43, v31, (uint64_t)v30, v32);

            objc_msgSend_properties(v13, v33, v34, v35);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_unionSet_(v43, v36, (uint64_t)v14, v37);
          }
        }

      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v44, (uint64_t)v48, 16);
    }
    while (v10);
  }

  v41 = (void *)objc_msgSend_copy(v43, v38, v39, v40);
  return v41;
}

- (BOOL)hasHadRCHLBasedRepairForComponent:(id)a3 withHistory:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  char v35;
  BOOL v36;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = a4;
  if (v6
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = v9;
    obj = v9;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v12)
    {
      v16 = v12;
      v17 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend_dataClasses(v19, v13, v14, v15, v38);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v21, (uint64_t)v6, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_intersectsSet_(v20, v24, (uint64_t)v23, v25))
          {

LABEL_16:
            v36 = 1;
            goto LABEL_17;
          }
          objc_msgSend_properties(v19, v26, v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v30, (uint64_t)v6, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend_intersectsSet_(v29, v33, (uint64_t)v32, v34);

          if ((v35 & 1) != 0)
            goto LABEL_16;
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, (uint64_t)v44, 16);
        v36 = 0;
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v36 = 0;
    }
LABEL_17:

    v9 = v38;
  }
  else
  {
    v36 = 0;
  }

  return v36;
}

- (id)RCHLBasedRepairDateForComponent:(id)a3 withHistory:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  void *v35;
  id v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = a4;
  if (v6
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v9;
    obj = v9;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v12)
    {
      v16 = v12;
      v39 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v39)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend_dataClasses(v18, v13, v14, v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v20, (uint64_t)v6, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_intersectsSet_(v19, v23, (uint64_t)v22, v24))
          {

LABEL_16:
            objc_msgSend_repairDateStr(v18, v13, v14, v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          objc_msgSend_properties(v18, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v29, (uint64_t)v6, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend_intersectsSet_(v28, v32, (uint64_t)v31, v33);

          if (v34)
            goto LABEL_16;
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, (uint64_t)v44, 16);
        v35 = 0;
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v35 = 0;
    }
LABEL_17:

    v9 = v37;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)CAABasedRepairDateForComponent:(id)a3 withHistory:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = a4;
  if (!v6)
    goto LABEL_15;
  objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10;
  if (!v9 || !v10)
  {

    goto LABEL_15;
  }
  v15 = objc_msgSend_count(v9, v11, v12, v13);

  if (!v15)
  {
LABEL_15:
    v22 = 0;
    goto LABEL_16;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v16, (uint64_t)v6, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v18);
        v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_msgSend_objectForKeyedSubscript_(v9, v20, v25, v21);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend_objectForKeyedSubscript_(v9, v20, v25, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_18;
        }
      }
      v22 = (void *)objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v28, (uint64_t)v32, 16);
      if (v22)
        continue;
      break;
    }
  }
LABEL_18:

LABEL_16:
  return v22;
}

- (id)extractRCHLRepairHistoryAndClaimCount:(id *)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id *v84;
  void *v86;
  id v87;
  const char *v88;
  void *v89;
  void *v90;
  id v91;
  const char *v92;
  uint64_t v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  id v99;
  const char *v100;
  void *v101;
  NSObject *v102;
  unint64_t v103;
  void *v104;
  id v105;
  const char *v106;
  NSObject *v107;
  id v108;
  const char *v109;
  void *v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  uint64_t v122;
  id v123;
  const char *v124;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  id v131;
  const char *v132;
  id v133;
  const char *v134;
  void *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  id v150;
  const char *v151;
  void *v152;
  id v153;
  const char *v154;
  uint64_t v155;
  NSObject *v156;
  id v157;
  const char *v158;
  const char *v159;
  BOOL v160;
  void *v161;
  const char *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  CRFDRRCHL *v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  void *inited;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  unsigned int v186;
  unint64_t v187[2];
  unint64_t v188[2];
  unint64_t v189[2];
  unint64_t v190[2];
  unint64_t v191[2];
  unint64_t v192[2];
  unint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  uint8_t v199[4];
  uint64_t v200;
  uint8_t buf[24];
  uint64_t v202;

  v202 = *MEMORY[0x24BDAC8D0];
  v197 = 0;
  v198 = 0;
  v195 = 0;
  v196 = 0;
  v193 = 0;
  v194 = 0;
  v192[0] = 0;
  v192[1] = 0;
  v191[0] = 0;
  v191[1] = 0;
  v190[0] = 0;
  v190[1] = 0;
  v189[0] = 0;
  v189[1] = 0;
  v176 = (id)objc_opt_new();
  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v4 = objc_alloc(MEMORY[0x24BDBCEA0]);
  v7 = (void *)objc_msgSend_initWithLocaleIdentifier_(v4, v5, (uint64_t)CFSTR("en_US_POSIX"), v6);
  objc_msgSend_setLocale_(v3, v8, (uint64_t)v7, v9);

  objc_msgSend_timeZoneWithName_(MEMORY[0x24BDBCF38], v10, (uint64_t)CFSTR("GMT"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v3, v13, (uint64_t)v12, v14);

  v181 = v3;
  objc_msgSend_setDateFormat_(v3, v15, (uint64_t)CFSTR("yyyyMMddHHmmssZ"), v16);
  v17 = (void *)objc_opt_new();
  v18 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_currentLocale(MEMORY[0x24BDBCEA0], v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_(v18, v23, (uint64_t)v22, v24);

  objc_msgSend_localTimeZone(MEMORY[0x24BDBCF38], v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v18, v29, (uint64_t)v28, v30);

  objc_msgSend_setDateStyle_(v18, v31, 3, v32);
  objc_msgSend_setTimeStyle_(v18, v33, 0, v34);
  v180 = v18;
  objc_msgSend_setFormattingContext_(v18, v35, 5, v36);
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD1690], v37, (uint64_t)CFSTR("#"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alphanumericCharacterSet(MEMORY[0x24BDD14A8], v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_formUnionWithCharacterSet_(v39, v44, (uint64_t)v43, v45);

  v174 = v39;
  objc_msgSend_invertedSet(v39, v46, v47, v48);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getLocalSealingManifest(CRFDRUtils, v49, v50, v51);
  v52 = objc_claimAutoreleasedReturnValue();
  v172 = AMFDRCreateTypeWithOptions();
  v173 = (void *)v52;
  if (!v172)
  {
    handleForCategory(0);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_21456AF30(v70, v71, v72, v73, v74, v75, v76, v77);

    v78 = 0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
    v82 = 0;
    v184 = 0;
    v177 = 0;
    v83 = 0;
    v84 = a3;
    if (a3)
      goto LABEL_17;
    goto LABEL_18;
  }
  AMFDRSetOption();
  AMFDRDataCopySealingManifestProperty();
  handleForCategory(0);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_base64EncodedStringWithOptions_(v198, v54, 0, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = objc_msgSend_length(v198, v57, v58, v59);
    _os_log_impl(&dword_214503000, v53, OS_LOG_TYPE_DEFAULT, "fetched RCHL successfully: %{public}@ length = %{public}ld", buf, 0x16u);

  }
  v60 = objc_retainAutorelease(v198);
  v196 = objc_msgSend_bytes(v60, v61, v62, v63);
  v171 = v60;
  v197 = objc_msgSend_length(v60, v64, v65, v66);
  if (sub_21455E5DC((unint64_t *)&v196, v192))
    goto LABEL_15;
  if (sub_21455E608(v192, &v193))
    goto LABEL_15;
  v196 = v194;
  v197 = v195;
  sub_21455E5DC((unint64_t *)&v196, v192);
  while (!sub_21455E608(v192, &v193))
  {
    v196 = v194;
    v197 = v195;
  }
  if (sub_21455E5DC((unint64_t *)&v196, v192) || sub_21455E608(v192, &v193))
  {
LABEL_15:
    v78 = 0;
    v79 = 0;
    v80 = 0;
    v81 = 0;
    v82 = 0;
    v184 = 0;
    v177 = 0;
    goto LABEL_16;
  }
  v177 = 0;
  v184 = 0;
  v82 = 0;
  v81 = 0;
  v80 = 0;
  v79 = 0;
  v86 = 0;
  v178 = v17;
  do
  {
    v196 = v194;
    v197 = v195;
    if (!sub_21455E5DC((unint64_t *)&v196, v190))
    {
      while (1)
      {
        if (sub_21455E608(v190, &v193))
          goto LABEL_89;
        v196 = v194;
        v197 = v195;
        v87 = objc_alloc(MEMORY[0x24BDBCE50]);
        v89 = (void *)objc_msgSend_initWithBytes_length_(v87, v88, v194, v195);
        if (v193 == 22)
        {
          v90 = v86;
          v91 = objc_alloc(MEMORY[0x24BDD17C8]);
          v93 = objc_msgSend_initWithData_encoding_(v91, v92, (uint64_t)v89, 1);

          handleForCategory(0);
          v94 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v93;
            _os_log_impl(&dword_214503000, v94, OS_LOG_TYPE_DEFAULT, "repairCenter str:%@", buf, 0xCu);
          }

          v177 = (void *)v93;
          v86 = v90;
        }
        if (!sub_21455E608(v190, &v193))
          break;
LABEL_87:

      }
      v185 = v89;
      while (1)
      {
        v196 = v194;
        v197 = v195;

        if (!sub_21455E5DC((unint64_t *)&v196, v191))
          break;
        v86 = 0;
        v79 = 0;
        v82 = 0;
        v184 = 0;
LABEL_86:
        if (sub_21455E608(v190, &v193))
          goto LABEL_87;
      }
      if (sub_21455E608(v191, &v193))
      {
        v182 = 0;
        v183 = 0;
        v82 = 0;
        v184 = 0;
LABEL_81:
        v79 = v183;
        v86 = v182;
        if (objc_msgSend_count(v183, v95, v96, v97) || objc_msgSend_count(v182, v163, v164, v165))
        {
          v166 = [CRFDRRCHL alloc];
          inited = (void *)objc_msgSend_initWithrepairDateStr_repairDate_repairCenter_dataClasses_properties_(v166, v167, (uint64_t)v184, (uint64_t)v82, v177, v183, v182);
          if (inited)
            objc_msgSend_addObject_(v176, v168, (uint64_t)inited, v169);

          v86 = v182;
          v79 = v183;
        }
        goto LABEL_86;
      }
      v184 = 0;
      v82 = 0;
      v182 = 0;
      v183 = 0;
      v98 = 0x24BDBC000uLL;
      while (1)
      {
        v196 = v194;
        v197 = v195;
        v99 = objc_alloc(*(Class *)(v98 + 3664));
        v101 = (void *)objc_msgSend_initWithBytes_length_(v99, v100, v194, v195);
        handleForCategory(0);
        v102 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v193;
          _os_log_impl(&dword_214503000, v102, OS_LOG_TYPE_DEFAULT, "tag is:%llu", buf, 0xCu);
        }

        if (v193 > 1u)
        {
          if (v193 == 2)
          {
            if (!sub_21455E5DC((unint64_t *)&v196, v189))
            {
              do
              {
LABEL_75:
                if (sub_21455E608(v189, &v193))
                  goto LABEL_76;
                v188[0] = v194;
                v188[1] = v195;
                v187[0] = 0;
                v187[1] = 0;
                memset(buf, 0, sizeof(buf));
                v186 = 0;
              }
              while (sub_21455E5DC(v188, v187)
                   || sub_21455E608(v187, (unint64_t *)buf));
              v149 = 0;
              while (2)
              {
                if (buf[0] != 2)
                {
                  if (buf[0] == 4)
                  {
                    v150 = objc_alloc(*(Class *)(v98 + 3664));
                    v152 = (void *)objc_msgSend_initWithBytes_length_(v150, v151, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16]);
                    v153 = objc_alloc(MEMORY[0x24BDD17C8]);
                    v155 = objc_msgSend_initWithData_encoding_(v153, v154, (uint64_t)v152, 1);

                    handleForCategory(0);
                    v156 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v199 = 138412290;
                      v200 = v155;
                      _os_log_impl(&dword_214503000, v156, OS_LOG_TYPE_DEFAULT, "claimDataClass str:%@", v199, 0xCu);
                    }

                    v149 = (void *)v155;
                    v89 = v185;
LABEL_67:

                  }
                  if (v186)
                    v160 = v149 == 0;
                  else
                    v160 = 1;
                  if (!v160)
                  {
                    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v147, v186, v148);
                    v161 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setObject_forKeyedSubscript_(v17, v162, (uint64_t)v161, (uint64_t)v149);

                  }
                  if (sub_21455E608(v187, (unint64_t *)buf))
                  {

                    goto LABEL_75;
                  }
                  continue;
                }
                break;
              }
              v157 = objc_alloc(*(Class *)(v98 + 3664));
              v152 = (void *)objc_msgSend_initWithBytes_length_(v157, v158, *(uint64_t *)&buf[8], *(uint64_t *)&buf[16]);
              objc_msgSend_getBytes_length_(v152, v159, (uint64_t)&v186, 4);
              goto LABEL_67;
            }
LABEL_76:
            handleForCategory(0);
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v17;
              _os_log_impl(&dword_214503000, v107, OS_LOG_TYPE_DEFAULT, "claim count:%@", buf, 0xCu);
            }
            v122 = (uint64_t)v82;
            goto LABEL_79;
          }
          if (v193 == 24)
          {
            v123 = objc_alloc(MEMORY[0x24BDD17C8]);
            v107 = objc_msgSend_initWithData_encoding_(v123, v124, (uint64_t)v101, 1);

            handleForCategory(0);
            v125 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v107;
              _os_log_impl(&dword_214503000, v125, OS_LOG_TYPE_DEFAULT, "generalizedTime str:%@", buf, 0xCu);
            }

            objc_msgSend_dateFromString_(v181, v126, (uint64_t)v107, v127);
            v122 = objc_claimAutoreleasedReturnValue();

            handleForCategory(0);
            v128 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v122;
              _os_log_impl(&dword_214503000, v128, OS_LOG_TYPE_DEFAULT, "date is:%@", buf, 0xCu);
            }

            objc_msgSend_stringFromDate_(v180, v129, v122, v130);
            v184 = (void *)objc_claimAutoreleasedReturnValue();
            v98 = 0x24BDBC000;
            goto LABEL_79;
          }
        }
        else
        {
          if ((_BYTE)v193)
          {
            if (v193 != 1 || sub_21455E2C0((uint64_t)&v196, &v193))
              goto LABEL_80;
            v103 = v98;
            v104 = v80;
            v105 = objc_alloc(*(Class *)(v103 + 3664));
            v107 = objc_msgSend_initWithBytes_length_(v105, v106, v194, v195);
            v108 = objc_alloc(MEMORY[0x24BDD17C8]);
            v110 = (void *)objc_msgSend_initWithData_encoding_(v108, v109, (uint64_t)v107, 1);

            v111 = (void *)MEMORY[0x24BDBCF20];
            objc_msgSend_stringByTrimmingCharactersInSet_(v110, v112, (uint64_t)v179, v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_componentsSeparatedByString_(v114, v115, (uint64_t)CFSTR(","), v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setWithArray_(v111, v118, (uint64_t)v117, v119);
            v120 = objc_claimAutoreleasedReturnValue();

            handleForCategory(0);
            v121 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v120;
              _os_log_impl(&dword_214503000, v121, OS_LOG_TYPE_DEFAULT, "dataClasses str:%@", buf, 0xCu);
            }

            v183 = (void *)v120;
            v81 = v110;
            v122 = (uint64_t)v82;
            v17 = v178;
            v80 = v104;
            v98 = 0x24BDBC000;
LABEL_55:
            v89 = v185;
LABEL_79:

            v82 = (void *)v122;
            goto LABEL_80;
          }
          if (!sub_21455E2C0((uint64_t)&v196, &v193))
          {
            v131 = objc_alloc(*(Class *)(v98 + 3664));
            v107 = objc_msgSend_initWithBytes_length_(v131, v132, v194, v195);
            v133 = objc_alloc(MEMORY[0x24BDD17C8]);
            v135 = (void *)objc_msgSend_initWithData_encoding_(v133, v134, (uint64_t)v107, 1);

            v136 = (void *)MEMORY[0x24BDBCF20];
            objc_msgSend_stringByTrimmingCharactersInSet_(v135, v137, (uint64_t)v179, v138);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_componentsSeparatedByString_(v139, v140, (uint64_t)CFSTR(","), v141);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setWithArray_(v136, v143, (uint64_t)v142, v144);
            v145 = objc_claimAutoreleasedReturnValue();

            handleForCategory(0);
            v146 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v145;
              _os_log_impl(&dword_214503000, v146, OS_LOG_TYPE_DEFAULT, "properties str:%@", buf, 0xCu);
            }

            v182 = (void *)v145;
            v80 = v135;
            v122 = (uint64_t)v82;
            v17 = v178;
            goto LABEL_55;
          }
        }
LABEL_80:

        if (sub_21455E608(v191, &v193))
          goto LABEL_81;
      }
    }
LABEL_89:
    ;
  }
  while (!sub_21455E608(v192, &v193));
  v78 = v86;
LABEL_16:
  v84 = a3;
  v83 = v171;
  if (a3)
LABEL_17:
    *v84 = (id)objc_msgSend_copy(v17, v67, v68, v69);
LABEL_18:
  if (v172)
    AMSupportSafeRelease();

  return v176;
}

- (id)extractRCHLRepairHistory
{
  uint64_t v2;

  return (id)objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(self, a2, 0, v2);
}

- (id)extractRepairHistoryAsDictionary
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  void *v73;
  void *v74;
  id obj;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  _QWORD v88[4];
  _QWORD v89[4];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v87 = 0;
  objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v4, v5, (uint64_t)&v87, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v87;

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  v73 = v12;
  v74 = v8;
  if (v8)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v12, v13, (uint64_t)v8, (uint64_t)CFSTR("claimCount"));
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v13, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v21, (uint64_t)v20, (uint64_t)CFSTR("claimCount"));

  }
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v17, v18, v19);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v7;
  v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v83, (uint64_t)v90, 16);
  if (v81)
  {
    v79 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v81; ++i)
      {
        if (*(_QWORD *)v84 != v79)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        v88[0] = CFSTR("dataclasses");
        objc_msgSend_dataClasses(v27, v23, v24, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allObjects(v28, v29, v30, v31);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (!v35)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v32, v33, v34);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v78;
        }
        v89[0] = v36;
        v88[1] = CFSTR("properties");
        objc_msgSend_properties(v27, v32, v33, v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_allObjects(v37, v38, v39, v40);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v44;
        if (!v44)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v41, v42, v43);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = v77;
        }
        v89[1] = v45;
        v88[2] = CFSTR("repairDate");
        objc_msgSend_repairDate(v27, v41, v42, v43);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v50 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_repairDate(v27, v46, v47, v48);
          v3 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v50, v51, (uint64_t)CFSTR("%@"), v52, v3);
          v53 = objc_claimAutoreleasedReturnValue();
          v82 = (void *)v53;
        }
        else
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v46, v47, v48);
          v53 = objc_claimAutoreleasedReturnValue();
          v2 = (void *)v53;
        }
        v89[2] = v53;
        v88[3] = CFSTR("repairCenter");
        objc_msgSend_repairCenter(v27, v54, v55, v56);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if (!v60)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v57, v58, v59);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v76;
        }
        v89[3] = v61;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)v89, (uint64_t)v88, 4);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v80, v63, (uint64_t)v62, v64);

        if (!v60)
        v65 = v2;
        if (v49)
        {

          v65 = (void *)v3;
        }

        if (!v44)
        if (!v35)

      }
      v81 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v83, (uint64_t)v90, 16);
    }
    while (v81);
  }

  if (v80)
  {
    v69 = v73;
    objc_msgSend_setObject_forKeyedSubscript_(v73, v66, (uint64_t)v80, (uint64_t)CFSTR("changedData"));
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v66, v67, v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v73;
    objc_msgSend_setObject_forKeyedSubscript_(v73, v71, (uint64_t)v70, (uint64_t)CFSTR("changedData"));

  }
  return v69;
}

- (id)repairDateForComponent:(id)a3 withRCHLHistory:(id)a4 withCAAHistory:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if ((objc_msgSend_isRCHLRepairHistoryDevice(self, v11, v12, v13) & 1) != 0)
    objc_msgSend_RCHLBasedRepairDateForComponent_withHistory_(self, v14, (uint64_t)v10, (uint64_t)v8);
  else
    objc_msgSend_CAABasedRepairDateForComponent_withHistory_(self, v14, (uint64_t)v10, (uint64_t)v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)repairCenterForComponent:(id)a3 withRCHLHistory:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  int v34;
  void *v35;
  id v37;
  id obj;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v9 = a4;
  if (v6
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v7, (uint64_t)v6, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v9;
    obj = v9;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v12)
    {
      v16 = v12;
      v39 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v39)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend_dataClasses(v18, v13, v14, v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v20, (uint64_t)v6, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_intersectsSet_(v19, v23, (uint64_t)v22, v24))
          {

LABEL_16:
            objc_msgSend_repairCenter(v18, v13, v14, v15);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          objc_msgSend_properties(v18, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v29, (uint64_t)v6, v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend_intersectsSet_(v28, v32, (uint64_t)v31, v33);

          if (v34)
            goto LABEL_16;
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v40, (uint64_t)v44, 16);
        v35 = 0;
        if (v16)
          continue;
        break;
      }
    }
    else
    {
      v35 = 0;
    }
LABEL_17:

    v9 = v37;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)extractRepairCentersWithRCHLHistory:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  id obj;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v3;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v54, (uint64_t)v60, 16);
  if (v9)
  {
    v13 = v9;
    v45 = *(_QWORD *)v55;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v55 != v45)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v14);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend_dataClasses(v15, v10, v11, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v50, (uint64_t)v59, 16);
        if (v18)
        {
          v22 = v18;
          v23 = *(_QWORD *)v51;
          do
          {
            v24 = 0;
            do
            {
              if (*(_QWORD *)v51 != v23)
                objc_enumerationMutation(v16);
              v25 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v24);
              objc_msgSend_repairCenter(v15, v19, v20, v21);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v7, v27, (uint64_t)v26, v25);

              ++v24;
            }
            while (v22 != v24);
            v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v50, (uint64_t)v59, 16);
          }
          while (v22);
        }

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        objc_msgSend_properties(v15, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v46, (uint64_t)v58, 16);
        if (v33)
        {
          v37 = v33;
          v38 = *(_QWORD *)v47;
          do
          {
            v39 = 0;
            do
            {
              if (*(_QWORD *)v47 != v38)
                objc_enumerationMutation(v31);
              v40 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v39);
              objc_msgSend_repairCenter(v15, v34, v35, v36);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v7, v42, (uint64_t)v41, v40);

              ++v39;
            }
            while (v37 != v39);
            v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v46, (uint64_t)v58, 16);
          }
          while (v37);
        }

        ++v14;
      }
      while (v14 != v13);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v54, (uint64_t)v60, 16);
    }
    while (v13);
  }

  return v7;
}

- (BOOL)deviceSupportsRepairBootIntent
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  int64x2_t v13;

  v2 = (void *)MGCopyAnswer();
  v6 = objc_msgSend_BOOLValue(v2, v3, v4, v5);

  v7 = (void *)MGCopyAnswer();
  v11 = objc_msgSend_intValue(v7, v8, v9, v10);

  if ((v6 & 1) != 0)
  {
    v12 = 1;
  }
  else if (v11 == 1)
  {
    v13 = vdupq_n_s64(MGGetProductType());
    v12 = vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_214575E50), (int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_214575E60)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_214575E70), (int32x4_t)vceqq_s64(v13, (int64x2_t)xmmword_214575E80))))) ^ 1;
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

- (id)_getClaimCountEnforceDate
{
  id v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_setDateFormat_(v2, v3, (uint64_t)CFSTR("yyyy-MM-dd"), v4);
  objc_msgSend_dateFromString_(v2, v5, (uint64_t)CFSTR("2024-09-16"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)checkUsedStatusFor:(id)a3 withHistory:(id)a4 withClaimCount:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  void *v59;
  id v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t v66[128];
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend__getClaimCountEnforceDate(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend_currentLocale(MEMORY[0x24BDBCEA0], v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocale_(v15, v20, (uint64_t)v19, v21);

  objc_msgSend_localTimeZone(MEMORY[0x24BDBCF38], v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTimeZone_(v15, v26, (uint64_t)v25, v27);

  objc_msgSend_setDateStyle_(v15, v28, 3, v29);
  objc_msgSend_setTimeStyle_(v15, v30, 0, v31);
  objc_msgSend_setFormattingContext_(v15, v32, 5, v33);
  if (v8
    && (objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v34, (uint64_t)v8, v35),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        v36,
        v36)
    && (objc_msgSend_RCHLBasedRepairDateForComponent_withHistory_(self, v37, (uint64_t)v8, (uint64_t)v9),
        (v38 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v41 = (void *)v38;
    objc_msgSend_dateFromString_(v15, v39, v38, v40);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_compare_(v61, v42, (uint64_t)v14, v43) == -1)
    {
      handleForCategory(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v61;
        v69 = 2112;
        v70 = v14;
        _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "repairDate:%@ in the past:%@", buf, 0x16u);
      }
      LOBYTE(v50) = 0;
    }
    else
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      objc_msgSend_objectForKeyedSubscript_(self->repairHistoryMap, v44, (uint64_t)v8, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v62, (uint64_t)v66, 16);
      if (v50)
      {
        v59 = v41;
        v60 = v9;
        v51 = *(_QWORD *)v63;
        while (2)
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v63 != v51)
              objc_enumerationMutation(v46);
            objc_msgSend_objectForKeyedSubscript_(v10, v48, *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i), v49);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend_intValue(v53, v54, v55, v56);

            if (v57 > 1)
            {
              LOBYTE(v50) = 1;
              goto LABEL_16;
            }
          }
          v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v62, (uint64_t)v66, 16);
          if (v50)
            continue;
          break;
        }
LABEL_16:
        v41 = v59;
        v9 = v60;
      }
    }

  }
  else
  {
    LOBYTE(v50) = 0;
  }

  return v50;
}

- (id)getUseCountExceptionsWith:(id)a3
{
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = v4;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v30;
    *(_QWORD *)&v11 = 138412290;
    v28 = v11;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v6);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v6, v9, v15, v10, v28, (_QWORD)v29);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((int)objc_msgSend_intValue(v16, v17, v18, v19) >= 2)
        {
          v22 = objc_msgSend_containsObject_(self->useCountExceptionKeys, v20, v15, v21);

          if (!v22)
            continue;
          handleForCategory(0);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            v34 = v15;
            _os_log_error_impl(&dword_214503000, v23, OS_LOG_TYPE_ERROR, "%@ has usedCount", buf, 0xCu);
          }

          objc_msgSend_objectForKeyedSubscript_(v6, v24, v15, v25);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v5, v26, (uint64_t)v16, v15);
        }

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v29, (uint64_t)v35, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isSelfServiceSalesDistrict:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  char isEqualToString;

  v3 = a3;
  if ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("SS04"), v5) & 1) != 0)
    isEqualToString = 1;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v3, v6, (uint64_t)CFSTR("SSR999"), v7);

  return isEqualToString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->useCountExceptionKeys, 0);
  objc_storeStrong((id *)&self->repairHistoryMap, 0);
}

@end
