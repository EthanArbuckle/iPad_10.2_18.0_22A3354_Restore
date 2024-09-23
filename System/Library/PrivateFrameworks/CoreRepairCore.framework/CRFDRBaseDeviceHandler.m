@implementation CRFDRBaseDeviceHandler

+ (void)initSealingMap
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if (!qword_253E797C0 || !objc_msgSend_count((void *)qword_253E797C0, v2, v3, v4))
  {
    objc_msgSend__populateSealingMapForCurrentDevice(CRFDRBaseDeviceHandler, v2, v3, v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_253E797C0;
    qword_253E797C0 = v5;

  }
  if (!qword_253E797C8 || !objc_msgSend_count((void *)qword_253E797C8, v2, v3, v4))
  {
    objc_msgSend__populateSealingMapProperties(CRFDRBaseDeviceHandler, v2, v3, v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)qword_253E797C8;
    qword_253E797C8 = v7;

  }
  objc_sync_exit(obj);

}

- (CRFDRBaseDeviceHandler)init
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  CRFDRBaseDeviceHandler *v5;
  uint64_t v6;
  NSMutableArray *warnings;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRFDRBaseDeviceHandler;
  v5 = -[CRFDRBaseDeviceHandler init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend_initSealingMap(CRFDRBaseDeviceHandler, v2, v3, v4);
    *(_WORD *)&v5->isServicePart = 0;
    v6 = objc_opt_new();
    warnings = v5->warnings;
    v5->warnings = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (id)getClaimDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  return 0;
}

+ (id)_populateSealingMapForCurrentDevice
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  AMFDRSealingMapGetEntriesForDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x24BDBCEF0], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v2;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("Tag"), v15, (_QWORD)v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_addObject_(v6, v17, (uint64_t)v16, v18);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v14, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }

  return v6;
}

+ (id)_populateSealingMapProperties
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getSealingMap(CRFDRBaseDeviceHandler, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getPropertyArrayFrom_(CRFDRBaseDeviceHandler, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v8, v9, v10);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v27 = v7;
    v28 = v4;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v11 = v7;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v30, (uint64_t)v34, 16);
    if (v13)
    {
      v15 = v13;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v11);
          v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (v20)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_objectForKey_(v20, v14, (uint64_t)CFSTR("Tag"), v21);
              v22 = objc_claimAutoreleasedReturnValue();

              if (v22)
              {
                objc_msgSend_objectForKey_(v20, v14, (uint64_t)CFSTR("PropertyIdentifier"), v23);
                v24 = objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  objc_msgSend_setObject_forKey_(v29, v14, v24, v22);
                  v16 = (void *)v24;
                }
                else
                {
                  v16 = 0;
                }
                v17 = (void *)v22;
              }
              else
              {
                v17 = 0;
              }
            }
          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v30, (uint64_t)v34, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }

    v7 = v27;
    v4 = v28;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  v25 = v29;

  return v25;
}

+ (id)getDeviceHandlerForProductType:(int)a3
{
  return 0;
}

- (BOOL)_addDataClassAndInstanceToMutableDictionary:(id)a3 dataClass:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  void *v10;
  NSObject *v11;

  v7 = a3;
  v8 = a4;
  v10 = (void *)AMFDRSealingMapCopyInstanceForClass();
  if (v10)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v7, v9, (uint64_t)v10, (uint64_t)v8);
  }
  else
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_21456F028();

  }
  if (a5)
    *a5 = objc_retainAutorelease(0);

  return v10 != 0;
}

- (BOOL)_addDataClassAndInstancesToMutableArray:(id)a3 dataClasses:(id)a4 dataInstances:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  int isEqual;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  NSObject *v57;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15 = v11;
  if (!v10 || !v11 || (v16 = objc_msgSend_count(v10, v12, v13, v14), v16 != objc_msgSend_count(v15, v17, v18, v19)))
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("Malformed dataClasses or dataInstances: %@ %@"), v14, v10, v15);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    sub_214512470((void *)0xFFFFFFFFFFFFFFD6, v55, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0;
    v41 = 0;
    goto LABEL_16;
  }
  objc_msgSend_indexSet(MEMORY[0x24BDD1698], v12, v20, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v10, v22, v23, v24))
  {
    v27 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v10, v25, v27, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v9, v29, (uint64_t)v28, v30);

      if (isEqual)
        objc_msgSend_addIndex_(v21, v32, v27, v34);
      ++v27;
    }
    while (objc_msgSend_count(v10, v32, v33, v34) > v27);
  }
  objc_msgSend_removeObjectsAtIndexes_(v10, v25, (uint64_t)v21, v26);
  objc_msgSend_removeObjectsAtIndexes_(v15, v35, (uint64_t)v21, v36);
  v37 = (void *)AMFDRSealingMapCopyMultiInstanceForClass();
  v41 = v37;
  v42 = 0;
  if (!v37)
  {
    handleForCategory(0);
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      sub_21456F098();

LABEL_16:
    v54 = 0;
    if (!a6)
      goto LABEL_18;
LABEL_17:
    *a6 = objc_retainAutorelease(v42);
    goto LABEL_18;
  }
  if (objc_msgSend_count(v37, v38, v39, v40))
  {
    v45 = 0;
    do
    {
      objc_msgSend_addObject_(v10, v43, (uint64_t)v9, v44);
      objc_msgSend_objectAtIndexedSubscript_(v41, v46, v45, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v15, v49, (uint64_t)v48, v50);

      ++v45;
    }
    while (objc_msgSend_count(v41, v51, v52, v53) > v45);
  }
  v42 = 0;
  v54 = 1;
  if (a6)
    goto LABEL_17;
LABEL_18:

  return v54;
}

- (BOOL)_addPropertyToMutableDictionary:(id)a3 property:(id)a4 withError:(id *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  CFTypeID v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  id v21;
  BOOL v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v10 = a4;
  if (!qword_253E797C8)
  {
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend_objectForKeyedSubscript_((void *)qword_253E797C8, v8, (uint64_t)v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_10;
  v12 = (void *)AMFDRSealingMapCallMGCopyAnswer();
  if (!v12)
    goto LABEL_10;
  v13 = v12;
  v14 = CFGetTypeID(v12);
  if (v14 != CFDataGetTypeID())
  {
    CFRelease(v13);
LABEL_10:
    v23 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Unable to fetch property:%@"), v9, v10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v24;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v30, (uint64_t)&v29, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v23, v27, (uint64_t)CFSTR("com.apple.corerepair"), -26, v26);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v21 = objc_retainAutorelease(v21);
      v22 = 0;
      *a5 = v21;
    }
    else
    {
      v22 = 0;
    }
    goto LABEL_13;
  }
  objc_msgSend_convertToHexString(v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v7, v19, (uint64_t)v18, (uint64_t)v10);

  handleForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v7;
    _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, "copied property:%@", buf, 0xCu);
  }

  v21 = 0;
  v22 = 1;
LABEL_13:

  return v22;
}

+ (BOOL)isFDRDataClassSupported:(id)a3
{
  uint64_t v3;

  return objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)a3, v3);
}

+ (BOOL)isFDRPropertySupported:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  objc_msgSend_initSealingMap(a1, v5, v6, v7);
  objc_msgSend_allKeys((void *)qword_253E797C8, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_containsObject_(v11, v12, (uint64_t)v4, v13);

  return v14;
}

+ (id)getRegisterChangeDictUsingComponentAuthName:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  void *v10;

  objc_msgSend__getDataClassUsingComponentAuthName_(a1, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v10 = 0;
  if (v4)
  {
    v7 = (void *)AMFDRSealingMapCopyInstanceForClass();
    if (v7)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v5, v6, (uint64_t)v7, (uint64_t)v4);
    }
    else
    {
      handleForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_21456F0F8((uint64_t)v4, &v10, v8);

    }
  }

  return v5;
}

+ (id)_getDataClassUsingComponentAuthName:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const __CFString *v21;
  const char *v22;
  uint64_t v23;
  int isFDRDataClassSupported;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;

  v3 = a3;
  v6 = v3;
  if (!v3)
    goto LABEL_9;
  if (objc_msgSend_compare_(v3, v4, (uint64_t)CFSTR("Battery"), v5))
  {
    if (objc_msgSend_compare_(v6, v7, (uint64_t)CFSTR("TouchController"), v8))
    {
      if (objc_msgSend_compare_(v6, v9, (uint64_t)CFSTR("Camera"), v10))
      {
        if (objc_msgSend_compare_(v6, v11, (uint64_t)CFSTR("FaceID"), v12))
        {
          if (objc_msgSend_compare_(v6, v13, (uint64_t)CFSTR("TouchID"), v14))
          {
            if (objc_msgSend_compare_(v6, v15, (uint64_t)CFSTR("BackGlass"), v16))
            {
              if (objc_msgSend_compare_(v6, v17, (uint64_t)CFSTR("Enclosure"), v18))
              {
LABEL_9:
                v21 = 0;
                goto LABEL_24;
              }
              v21 = CFSTR("NBCl");
              isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v19, (uint64_t)CFSTR("NBCl"), v20);
            }
            else
            {
              v21 = CFSTR("bCfg");
              if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v17, (uint64_t)CFSTR("bCfg"), v18) & 1) != 0)goto LABEL_24;
              v21 = CFSTR("LCfg");
              isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v31, (uint64_t)CFSTR("LCfg"), v32);
            }
          }
          else
          {
            v21 = CFSTR("FSCl");
            isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v15, (uint64_t)CFSTR("FSCl"), v16);
          }
        }
        else
        {
          v21 = CFSTR("psd2");
          if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v13, (uint64_t)CFSTR("psd2"), v14) & 1) != 0)goto LABEL_24;
          v21 = CFSTR("prpc");
          isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v29, (uint64_t)CFSTR("prpc"), v30);
        }
      }
      else
      {
        v21 = CFSTR("CmCl");
        if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v11, (uint64_t)CFSTR("CmCl"), v12) & 1) != 0)goto LABEL_24;
        v21 = CFSTR("RCSn");
        isFDRDataClassSupported = objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v27, (uint64_t)CFSTR("RCSn"), v28);
      }
    }
    else
    {
      v21 = CFSTR("tcrt");
      if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v9, (uint64_t)CFSTR("tcrt"), v10) & 1) != 0)
        goto LABEL_24;
      v21 = CFSTR("dCfg");
      isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v25, (uint64_t)CFSTR("dCfg"), v26);
    }
  }
  else
  {
    v21 = CFSTR("vcrt");
    if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v7, (uint64_t)CFSTR("vcrt"), v8) & 1) != 0)
      goto LABEL_24;
    v21 = CFSTR("bcrt");
    isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v22, (uint64_t)CFSTR("bcrt"), v23);
  }
  if (!isFDRDataClassSupported)
    v21 = 0;
LABEL_24:

  return (id)v21;
}

+ (id)copySealingManifestDataInstanceForComponent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend__getDataClassUsingComponentAuthName_(a1, v5, (uint64_t)v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (!v7)
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456F17C();
    goto LABEL_10;
  }
  if (objc_msgSend_compare_(v7, v8, (uint64_t)CFSTR("RCSn"), v9))
  {
    v12 = (void *)AMFDRSealingManifestCopyInstanceForClass();
    if (!v12)
    {
LABEL_8:
      handleForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_21456F1DC((uint64_t)&v23, v15, v16, v17, v18, v19, v20, v21);
LABEL_10:

      v12 = 0;
    }
  }
  else
  {
    v24 = CFSTR("DataStore");
    v25[0] = CFSTR("Local");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, (uint64_t)v25, (uint64_t)&v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = AMFDRCreateWithOptions();
    v12 = (void *)AMFDRSealingMapCopyPropertyWithTag();
    if (v14)
      AMSupportSafeRelease();

    if (!v12)
      goto LABEL_8;
  }
  AMSupportSafeRelease();

  return v12;
}

+ (id)getPropertyArrayFrom:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v34;

  v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    handleForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_21456F244();
    goto LABEL_15;
  }
  objc_msgSend_objectForKey_(v3, v4, (uint64_t)CFSTR("ManifestProperties"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_9;
  v7 = MGCopyAnswer();
  if (!v7)
  {
    handleForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_21456F270();
LABEL_15:

    v32 = 0;
    v6 = 0;
    goto LABEL_10;
  }
  v6 = (void *)v7;
  objc_msgSend_objectForKeyedSubscript_(v3, v8, (uint64_t)CFSTR("ManifestProperties"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v10, v11, (uint64_t)v6, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

    goto LABEL_9;
  }
  v16 = (void *)v13;
  objc_msgSend_objectForKeyedSubscript_(v3, v14, (uint64_t)CFSTR("ManifestProperties"), v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v17, v18, (uint64_t)v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v20, v21, (uint64_t)CFSTR("Properties"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_9:
    v32 = 0;
    goto LABEL_10;
  }
  objc_msgSend_objectForKeyedSubscript_(v3, v24, (uint64_t)CFSTR("ManifestProperties"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)v6, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v29, v30, (uint64_t)CFSTR("Properties"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v32;
}

- (id)getDataClassesAndInstancesOfKBBWith:(__AMFDR *)a3 propertiesDict:(id *)a4 fdrError:(id *)a5
{
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  id v53;
  __CFString *v55;
  uint64_t v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = objc_opt_new();
  v7 = (void *)qword_254D7B078;
  qword_254D7B078 = 0;

  objc_msgSend_KBBSerialNumber(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFDELL, CFSTR("No KBB Serial Number"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v29 = 0;
LABEL_29:
    v21 = 0;
    goto LABEL_30;
  }
  AMSupportLogSetHandler();
  objc_msgSend_KBBSerialNumber(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = AMFDRCreatePermissionsString();

  if (!v16)
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFACLL, CFSTR("Unable to Create Persmission String for KBB sealingManifest copy"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_28:
    v40 = 0;
    v29 = 0;
    goto LABEL_29;
  }
  AMFDRSetOption();
  AMFDRSetOption();
  if (!AMFDRPermissionsRequest())
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFADLL, CFSTR("Failed to request FDRSNMAP Permissions"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  objc_msgSend_KBBSerialNumber(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)AMFDRDataCopy();

  if (!v21)
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFDELL, CFSTR("Failed to copy FDRSNMAP of KBBSrNM"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
    v40 = 0;
    v29 = 0;
    goto LABEL_30;
  }
  if (!qword_254D7B078)
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFE6, CFSTR("Unable to extract SealHeader"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  handleForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = qword_254D7B078;
    _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "SealHeader:(%@)", buf, 0xCu);
  }

  AMSupportLogSetHandler();
  v23 = (void *)qword_254D7B078;
  objc_msgSend_characterSetWithCharactersInString_(MEMORY[0x24BDD14A8], v24, (uint64_t)CFSTR(":"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v23, v27, (uint64_t)v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  handleForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v60 = (uint64_t)v29;
    _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "sealHeaderArray:%@", buf, 0xCu);
  }

  if (!v29 || objc_msgSend_count(v29, v31, v32, v33) != 2)
  {
    v42 = (void *)v6;
    v55 = CFSTR("Unable to extract SealHeader");
    v56 = -26;
LABEL_35:
    sub_214512470((void *)v56, v55, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:
    v40 = 0;
    goto LABEL_30;
  }
  objc_msgSend_lastObject(v29, v34, v35, v36);
  if ((AMFDRDataAppendPermissionsString() & 1) == 0)
  {
    v42 = (void *)v6;
    v55 = CFSTR("Unable to Create Persmission String using KBBB sealheaders");
    v56 = -84;
    goto LABEL_35;
  }
  AMFDRSetOption();
  if (!AMFDRPermissionsRequest())
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFADLL, CFSTR("Failed to request SEAL-SIK KBB Permissions"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_36;
  }
  objc_msgSend_lastObject(v29, v37, v38, v39);
  v40 = (void *)AMFDRDataCopy();
  if (v40)
  {
    handleForCategory(0);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (uint64_t)v40;
      _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "oldSealingManifest:%@", buf, 0xCu);
    }
    v42 = (void *)v6;

    objc_msgSend_setKbbSealingManifest_(self, v43, (uint64_t)v40, v44);
    objc_msgSend_getSealDateFromSealingManifestData_(self, v45, (uint64_t)v40, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setKbbSealDate_(self, v48, (uint64_t)v47, v49);

    if (AMFDRSealingManifestCopyDataClassesInstancesAndProperties())
    {
      handleForCategory(0);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = 0;
        _os_log_impl(&dword_214503000, v50, OS_LOG_TYPE_DEFAULT, "old data classes:%@", buf, 0xCu);
      }

      handleForCategory(0);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = 0;
        _os_log_impl(&dword_214503000, v51, OS_LOG_TYPE_DEFAULT, "old data instances:%@", buf, 0xCu);
      }

      handleForCategory(0);
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v60 = 0;
        _os_log_impl(&dword_214503000, v52, OS_LOG_TYPE_DEFAULT, "old properties:%@", buf, 0xCu);
      }

      sub_214512470((void *)0xFFFFFFFFFFFFFFE6, CFSTR("DataInstances and Classes count mismatch"), 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_214512470((void *)0xFFFFFFFFFFFFFFE6, CFSTR("old SealingManifestCopyDataClassesInstancesAndProperties failed"), 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v42 = (void *)v6;
    sub_214512470((void *)0xFFFFFFFFFFFFFFDELL, CFSTR("AMFDRSealingMapCopyManifestProperties failed"), 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_30:
  AMFDRSetOption();
  if (a5)
    *a5 = objc_retainAutorelease(v57);
  AMSupportSafeRelease();
  v53 = v42;

  return v53;
}

- (id)getCurrentManifestDataClassesAndInstancesWithPartSPC:(id)a3 fdr:(__AMFDR *)a4 currentClasses:(id *)a5 currentInstances:(id *)a6 currentProperties:(id *)a7 fdrError:(id *)a8
{
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  CFTypeRef cf;

  v31 = 0;
  cf = 0;
  v29 = 0;
  v30 = 0;
  v28 = 0;
  v9 = (void *)objc_opt_new();
  if ((AMFDRSealingMapPopulateSealingManifest() & 1) != 0)
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_21456F29C(v11, v21, v22, v23, v24, v25, v26, v27);

    v19 = 0;
    if (!a8)
      goto LABEL_10;
LABEL_9:
    *a8 = objc_retainAutorelease(v19);
    goto LABEL_10;
  }
  handleForCategory(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    sub_21456F3C4((uint64_t)&v31, v12, v13, v14, v15, v16, v17, v18);

  if (v31)
    v19 = v31;
  else
    v19 = 0;
  if (a8)
    goto LABEL_9;
LABEL_10:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }

  return v9;
}

- (id)getUpdateDataClassesAndInstancesWithPartSPC:(id)a3 withError:(id *)a4
{
  NSObject *v4;
  uint8_t v6[16];

  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "No update only data classes, skipping.", v6, 2u);
  }

  return 0;
}

- (BOOL)getMakeDataClassesAndInstancesWithPartSPC:(id)a3 fdrRemote:(__AMFDR *)a4 makeClasses:(id *)a5 makeInstances:(id *)a6 makePropertiesDict:(id *)a7 fdrError:(id *)a8
{
  if (a7)
    objc_storeStrong(a7, self->currentProperties);
  return 1;
}

- (BOOL)getMinimalManifestsClassesAndInstancesWithPartSPC:(id)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5 minimalSealingDataInstances:(id *)a6 minimalSealedDataClasses:(id *)a7 minimalSealedDataInstances:(id *)a8 error:(id *)a9
{
  NSObject *v9;
  uint8_t v11[16];

  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "Minimal manifests not supported.", v11, 2u);
  }

  return 1;
}

- (BOOL)supportMSRk
{
  uint64_t v2;

  return objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("MSRk"), v2);
}

- (BOOL)supportHarvestPearl
{
  uint64_t v2;

  return objc_msgSend_isDataClassSupported_(CRFDRUtils, a2, (uint64_t)CFSTR("psd3"), v2);
}

- (BOOL)supportCameraDepth
{
  return 0;
}

- (BOOL)supportMctubMinus
{
  return 0;
}

- (BOOL)supportPatch
{
  return 0;
}

- (id)getPatchInfoPerSPC
{
  return 0;
}

- (id)getExpectedPatchInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_getPatchInfoPerSPC(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  if (v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v8;
    v10 = v8;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v12)
    {
      v15 = v12;
      v16 = *(_QWORD *)v28;
      v17 = MEMORY[0x24BDAC760];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v10);
          v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(v4, v13, v19, v14, v24))
          {
            objc_msgSend_objectForKeyedSubscript_(v10, v13, v19, v14);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v25[0] = v17;
            v25[1] = 3221225472;
            v25[2] = sub_21454C640;
            v25[3] = &unk_24D1AA838;
            v26 = v9;
            objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v20, v21, (uint64_t)v25, v22);

          }
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v15);
    }

    v8 = v24;
  }

  return v9;
}

- (BOOL)validatePatchWithPartSPC:(id)a3 originalClasses:(id)a4 originalInstances:(id)a5 originalValues:(id)a6 validClasses:(id)a7 validInstances:(id)a8
{
  id v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  char isEqual;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  BOOL v102;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  uint64_t v107;
  unint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  id obj;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint8_t buf[16];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = (unint64_t)a4;
  v16 = (unint64_t)a5;
  v17 = (unint64_t)a6;
  v18 = a7;
  v19 = a8;
  if ((objc_msgSend_supportPatch(self, v20, v21, v22) & 1) == 0)
  {
    if (!(v15 | v16 | v17))
    {
      v102 = 1;
      goto LABEL_56;
    }
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456F63C();
LABEL_54:
    v102 = 0;
    goto LABEL_55;
  }
  if (!(v15 | v16 | v17))
  {
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "No patch info for validation, skipping.", buf, 2u);
    }
    v102 = 1;
    goto LABEL_55;
  }
  if (!v15 || !v16 || !v17)
  {
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456F610();
    goto LABEL_54;
  }
  v26 = objc_msgSend_count((void *)v15, v23, v24, v25);
  if (v26 != objc_msgSend_count((void *)v16, v27, v28, v29))
  {
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456F5E4();
    goto LABEL_54;
  }
  v33 = objc_msgSend_count((void *)v15, v30, v31, v32);
  if (v33 != objc_msgSend_count((void *)v17, v34, v35, v36))
  {
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456F5B8();
    goto LABEL_54;
  }
  v111 = v19;
  v112 = v14;
  objc_msgSend_getExpectedPatchInfo_(self, v37, (uint64_t)v14, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  handleForCategory(0);
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    sub_21456F54C();

  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v41 = (id)v15;
  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v120, (uint64_t)v126, 16);
  obj = v41;
  if (!v43)
    goto LABEL_18;
  v46 = v43;
  v47 = *(_QWORD *)v121;
  do
  {
    for (i = 0; i != v46; ++i)
    {
      if (*(_QWORD *)v121 != v47)
        objc_enumerationMutation(obj);
      objc_msgSend_objectForKey_(v39, v44, *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i), v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        handleForCategory(0);
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
          sub_21456F4EC();

LABEL_63:
        v102 = 0;
LABEL_64:
        v19 = v111;
        v14 = v112;
        goto LABEL_55;
      }
    }
    v41 = obj;
    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v120, (uint64_t)v126, 16);
  }
  while (v46);
LABEL_18:

  if (!objc_msgSend_count(v41, v50, v51, v52))
    goto LABEL_29;
  v56 = 0;
  do
  {
    objc_msgSend_objectAtIndexedSubscript_(v41, v53, v56, v55);
    v57 = objc_claimAutoreleasedReturnValue();
    v107 = v56;
    objc_msgSend_objectAtIndexedSubscript_((void *)v17, v58, v56, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)v57;
    objc_msgSend_objectForKeyedSubscript_(v39, v61, v57, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    v113 = v60;
    v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v64, (uint64_t)&v116, (uint64_t)v125, 16);
    if (!v65)
      goto LABEL_28;
    v68 = v65;
    v69 = *(_QWORD *)v117;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v117 != v69)
          objc_enumerationMutation(v113);
        if ((objc_msgSend_containsObject_(v63, v66, *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j), v67) & 1) == 0)
        {
          handleForCategory(0);
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
            sub_21456F48C();

          goto LABEL_63;
        }
      }
      v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v113, v66, (uint64_t)&v116, (uint64_t)v125, 16);
    }
    while (v68);
LABEL_28:

    v56 = v107 + 1;
    v41 = obj;
  }
  while (objc_msgSend_count(obj, v71, v72, v73) > (unint64_t)(v107 + 1));
LABEL_29:
  if (!objc_msgSend_count(v41, v53, v54, v55))
  {
    v102 = 1;
    goto LABEL_64;
  }
  v76 = 0;
  v19 = v111;
LABEL_31:
  objc_msgSend_objectAtIndexedSubscript_(obj, v74, v76, v75);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v76;
  objc_msgSend_objectAtIndexedSubscript_((void *)v16, v78, v76, v79);
  v114 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v18, v80, v81, v82))
  {
    v85 = 0;
    v110 = v77;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(v18, v83, v85, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqual_(v77, v87, (uint64_t)v86, v88) & 1) != 0)
      {
        objc_msgSend_objectAtIndexedSubscript_(v111, v89, v85, v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        isEqual = objc_msgSend_isEqual_(v114, v92, (uint64_t)v91, v93);

        v77 = v110;
        if ((isEqual & 1) != 0)
        {

          v76 = v108 + 1;
          v101 = objc_msgSend_count(obj, v98, v99, v100);
          v102 = 1;
          if (v101 <= v76)
            goto LABEL_68;
          goto LABEL_31;
        }
      }
      else
      {

      }
      ++v85;
    }
    while (objc_msgSend_count(v18, v95, v96, v97) > v85);
  }
  handleForCategory(0);
  v106 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    sub_21456F42C();

  v102 = 0;
LABEL_68:
  v14 = v112;
LABEL_55:

LABEL_56:
  return v102;
}

- (BOOL)getPatchExpectedDataWithPartSPC:(id)a3 amfdr:(__AMFDR *)a4 expectedClasses:(id *)a5 expectedInstances:(id *)a6 expectedValues:(id *)a7 expectedDatas:(id *)a8 validClasses:(id)a9 validInstances:(id)a10 error:(id *)a11
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  int isEqual;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  uint64_t v53;
  const char *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  int v67;
  NSObject *v68;
  NSObject *v69;
  char v70;
  NSObject *v71;
  NSObject *v72;
  uint64_t v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  void *v83;
  id obj;
  id v85;
  id v86;
  NSObject *v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t v96;
  char v97[15];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  NSObject *v102;
  uint8_t buf[4];
  uint64_t v104;
  __int16 v105;
  void *v106;
  __int16 v107;
  NSObject *v108;
  __int16 v109;
  void *v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  v12 = a9;
  v88 = a10;
  if ((objc_msgSend_supportPatch(self, v13, v14, v15) & 1) == 0)
  {
    handleForCategory(0);
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v42, OS_LOG_TYPE_DEFAULT, "Patch not supported, skipping.", buf, 2u);
    }
    v70 = 1;
    goto LABEL_69;
  }
  v102 = 0;
  v16 = objc_opt_new();
  v86 = (id)objc_opt_new();
  v85 = (id)objc_opt_new();
  v17 = objc_opt_new();
  v20 = (void *)v17;
  obj = (id)v16;
  if (!v16 || !v86 || !v85 || !v17)
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_21456F6D0();
    goto LABEL_74;
  }
  if (!v12 || !v88)
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_21456F668();
LABEL_74:
    v71 = 0;
    v26 = 0;
    v70 = 0;
    goto LABEL_53;
  }
  objc_msgSend_getExpectedPatchInfo_(self, v18, (uint64_t)v80, v19);
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v98, (uint64_t)v112, 16);
  v26 = 0;
  if (!v78)
    goto LABEL_52;
  v79 = *(_QWORD *)v99;
  v82 = v12;
  v83 = v20;
  v87 = v21;
LABEL_10:
  v27 = 0;
  while (1)
  {
    if (*(_QWORD *)v99 != v79)
      objc_enumerationMutation(v21);
    v81 = v27;
    v91 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * v27);
    if (objc_msgSend_count(v12, v23, v24, v25))
      break;
LABEL_50:
    v27 = v81 + 1;
    v21 = v87;
    if (v81 + 1 == v78)
    {
      v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v23, (uint64_t)&v98, (uint64_t)v112, 16);
      if (!v78)
      {
LABEL_52:
        v70 = 1;
        v71 = v21;
LABEL_53:

        v72 = v71;
        v42 = v26;
        goto LABEL_58;
      }
      goto LABEL_10;
    }
  }
  v28 = 0;
  while (1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v12, v23, v28, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v91, v30, (uint64_t)v29, v31);

    if (isEqual)
      break;
LABEL_39:
    if (objc_msgSend_count(v12, v33, v34, v35) <= (unint64_t)++v28)
      goto LABEL_50;
  }
  v36 = (void *)MEMORY[0x2199D19CC]();
  objc_msgSend_objectAtIndexedSubscript_(v88, v37, v28, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_opt_new();
  v90 = (void *)v39;
  if (v40)
  {
    v41 = AMFDRDataDictCopy();
    v42 = v102;

    if (!v41 || v42)
    {
      handleForCategory(0);
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v104 = (uint64_t)v42;
        _os_log_error_impl(&dword_214503000, v68, OS_LOG_TYPE_ERROR, "AMFDRDataDictCopy failed with error: %@", buf, 0xCu);
      }

      v67 = 4;
    }
    else
    {
      v89 = v36;
      objc_msgSend_objectForKeyedSubscript_(v87, v43, (uint64_t)v91, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v95 = 0u;
      v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v92, (uint64_t)v111, 16);
      if (v47)
      {
        v50 = v47;
        v51 = *(_QWORD *)v93;
        do
        {
          for (i = 0; i != v50; ++i)
          {
            if (*(_QWORD *)v93 != v51)
              objc_enumerationMutation(v45);
            v53 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);
            objc_msgSend_objectForKeyedSubscript_(v41, v48, v53, v49);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
            {
              objc_msgSend_setObject_forKey_(v40, v54, (uint64_t)v55, v53);
            }
            else
            {
              handleForCategory(0);
              v56 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v104 = v53;
                _os_log_error_impl(&dword_214503000, v56, OS_LOG_TYPE_ERROR, "Missing expect tag %@. Ignored.", buf, 0xCu);
              }

            }
          }
          v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v92, (uint64_t)v111, 16);
        }
        while (v50);
      }
      handleForCategory(0);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v104 = (uint64_t)v91;
        v105 = 2112;
        v106 = v90;
        v107 = 2112;
        v108 = v41;
        v109 = 2112;
        v110 = v40;
        _os_log_impl(&dword_214503000, v57, OS_LOG_TYPE_DEFAULT, "%@-%@ dict: %@ result dict: %@", buf, 0x2Au);
      }

      v60 = (void *)AMFDRDataCopy();
      v42 = v102;
      v20 = v83;
      if (!v60 || v102)
      {
        handleForCategory(0);
        v69 = objc_claimAutoreleasedReturnValue();
        v12 = v82;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v104 = (uint64_t)v42;
          _os_log_error_impl(&dword_214503000, v69, OS_LOG_TYPE_ERROR, "Failed to copy local data, error: %@", buf, 0xCu);
        }

        v67 = 4;
      }
      else
      {
        objc_msgSend_addObject_(obj, v58, (uint64_t)v91, v59);
        objc_msgSend_addObject_(v86, v61, (uint64_t)v90, v62);
        objc_msgSend_addObject_(v85, v63, (uint64_t)v40, v64);
        objc_msgSend_addObject_(v83, v65, (uint64_t)v60, v66);
        v67 = 0;
        v12 = v82;
      }

      v36 = v89;
    }
  }
  else
  {
    handleForCategory(0);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      sub_21456F694(&v96, v97, v41);
    v67 = 4;
    v42 = v26;
  }

  objc_autoreleasePoolPop(v36);
  if (!v67)
  {
    v26 = v42;
    goto LABEL_39;
  }
  v72 = v87;

  v70 = 0;
LABEL_58:
  if (a11)
    *a11 = objc_retainAutorelease(v42);
  if (a5)
    objc_storeStrong(a5, obj);
  if (a6)
    objc_storeStrong(a6, v86);
  if (a7)
    objc_storeStrong(a7, v85);
  if (a8)
    objc_storeStrong(a8, v20);

LABEL_69:
  return v70 & 1;
}

- (id)getUpdatePropertyWithPartSPC:(id)a3 propertiesFromParam:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "No update properties, skipping.", v6, 2u);
  }

  return 0;
}

- (id)getExcludedPropertiesForFactoryReset
{
  NSObject *v2;
  uint8_t v4[16];

  handleForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214503000, v2, OS_LOG_TYPE_DEFAULT, "No excluded properties, skipping.", v4, 2u);
  }

  return 0;
}

- (BOOL)validateAndSetSerialNumbersUsingPartSPC:(id)a3 KGBSerialNumber:(id)a4 KBBSerialNumber:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  NSDictionary *currentProperties;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v14 = a5;
  currentProperties = self->currentProperties;
  if (currentProperties)
  {
    objc_msgSend_objectForKeyedSubscript_(currentProperties, v12, (uint64_t)CFSTR("SrNm"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16 && (objc_msgSend_isEqualToString_(v16, v12, (uint64_t)v11, v13) & 1) != 0)
    {
      v18 = 0;
      v19 = 1;
      if (!a6)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v12, (uint64_t)CFSTR("Current serial number: %@ doesn't match SPC KGBSerialNumber: %@"), v13, v17, v11);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_214512470((void *)0xFFFFFFFFFFFFFFE5, v20, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  if (a6)
LABEL_8:
    *a6 = objc_retainAutorelease(v18);
LABEL_9:

  return v19;
}

- (double)timeIntervalSinceLastSealing:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  double v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  int v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend_setDateFormat_(v5, v6, (uint64_t)CFSTR("yyMMddHHmmssZ"), v7);
  objc_msgSend_dateFromString_(v5, v8, (uint64_t)v4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = *(double *)&v10;
    _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "Sealing date: %@", (uint8_t *)&v23, 0xCu);
  }

  v12 = (void *)objc_opt_new();
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = *(double *)&v12;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Current date: %@", (uint8_t *)&v23, 0xCu);
  }

  if (v10 && v12)
  {
    objc_msgSend_timeIntervalSinceDate_(v12, v14, (uint64_t)v10, v15);
    v17 = v16;
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 134217984;
      v24 = v17;
      v19 = "time diff: %lf";
      v20 = v18;
      v21 = 12;
LABEL_11:
      _os_log_impl(&dword_214503000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v23, v21);
    }
  }
  else
  {
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v17 = 0.0;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      v19 = "Date information is missing";
      v20 = v18;
      v21 = 2;
      goto LABEL_11;
    }
  }

  return v17;
}

- (BOOL)validateSwappedForDays:(int64_t)a3 currentSN:(id)a4 previousSN:(id)a5 sealDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  BOOL v26;
  int v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = (int64_t)v10;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Current SN: %@", (uint8_t *)&v28, 0xCu);
  }

  handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v28 = 138412290;
    v29 = (int64_t)v11;
    _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "Previous SN: %@", (uint8_t *)&v28, 0xCu);
  }

  if (!v10)
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    LOWORD(v28) = 0;
    v23 = "Missing current serial number.";
LABEL_17:
    v24 = v22;
    v25 = 2;
    goto LABEL_18;
  }
  if (!v11)
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    LOWORD(v28) = 0;
    v23 = "Missing previous serial number.";
    goto LABEL_17;
  }
  if ((objc_msgSend_isEqual_(v10, v15, (uint64_t)v11, v16) & 1) == 0)
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    LOWORD(v28) = 0;
    v23 = "SN are different. No check needed.";
    goto LABEL_17;
  }
  objc_msgSend_timeIntervalSinceLastSealing_(self, v17, (uint64_t)v12, v18);
  v20 = v19;
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v20 <= (double)(86400 * a3))
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v28 = 134217984;
      v29 = a3;
      v23 = "SN are same and last sealing date is within %ld days.";
      v24 = v22;
      v25 = 12;
LABEL_18:
      _os_log_impl(&dword_214503000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v28, v25);
    }
LABEL_19:
    v26 = 1;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_21456F6FC();
  v26 = 0;
LABEL_20:

  return v26;
}

- (int64_t)validateDisplaySwapped:(id)a3 lessThan:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Validate display swapped, unsupported.", v6, 2u);
  }

  return 0;
}

- (BOOL)storeWarningStrings:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend_warnings(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v8, v9, (uint64_t)v4, v10);

  return 1;
}

- (id)getSealDateFromSealingManifestData:(id)a3
{
  const __CFAllocator *v3;
  id v4;
  __CFDictionary *Mutable;
  NSObject *v6;
  CFDataRef theData;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  theData = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = a3;
  Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("DataStore"), CFSTR("Local"));
  AMFDRCreateWithOptions();
  AMFDRDataDecodeAndSetSealingManifest();

  AMSupportSafeRelease();
  AMSupportSafeRelease();
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_21456F80C();

  return 0;
}

- (int64_t)performPostSealingStage:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "performPostSealingStage, no-ops.", v5, 2u);
  }

  return 0;
}

- (id)spcInPartSPC:(id)a3 withDataClass:(id)a4
{
  NSObject *v4;
  uint8_t v6[16];

  handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_214503000, v4, OS_LOG_TYPE_DEFAULT, "Unsupported, no-ops", v6, 2u);
  }

  return 0;
}

- (id)spcWithComponent:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "Unsupported, no-ops", v5, 2u);
  }

  return 0;
}

- (BOOL)isServicePart
{
  return self->isServicePart;
}

- (void)setIsServicePart:(BOOL)a3
{
  self->isServicePart = a3;
}

- (BOOL)allowFactoryReset
{
  return self->allowFactoryReset;
}

- (void)setAllowFactoryReset:(BOOL)a3
{
  self->allowFactoryReset = a3;
}

- (NSDictionary)currentProperties
{
  return self->currentProperties;
}

- (void)setCurrentProperties:(id)a3
{
  objc_storeStrong((id *)&self->currentProperties, a3);
}

- (NSArray)currentDataClasses
{
  return self->currentDataClasses;
}

- (void)setCurrentDataClasses:(id)a3
{
  objc_storeStrong((id *)&self->currentDataClasses, a3);
}

- (NSArray)currentDataInstances
{
  return self->currentDataInstances;
}

- (void)setCurrentDataInstances:(id)a3
{
  objc_storeStrong((id *)&self->currentDataInstances, a3);
}

- (NSMutableArray)warnings
{
  return self->warnings;
}

- (void)setWarnings:(id)a3
{
  objc_storeStrong((id *)&self->warnings, a3);
}

- (NSString)sealDate
{
  return self->_sealDate;
}

- (void)setSealDate:(id)a3
{
  objc_storeStrong((id *)&self->_sealDate, a3);
}

- (NSString)kbbSealDate
{
  return self->_kbbSealDate;
}

- (void)setKbbSealDate:(id)a3
{
  objc_storeStrong((id *)&self->_kbbSealDate, a3);
}

- (NSData)kbbSealingManifest
{
  return self->_kbbSealingManifest;
}

- (void)setKbbSealingManifest:(id)a3
{
  objc_storeStrong((id *)&self->_kbbSealingManifest, a3);
}

- (NSString)previousCGSN
{
  return self->_previousCGSN;
}

- (void)setPreviousCGSN:(id)a3
{
  objc_storeStrong((id *)&self->_previousCGSN, a3);
}

- (NSString)kbbCGSN
{
  return self->_kbbCGSN;
}

- (void)setKbbCGSN:(id)a3
{
  objc_storeStrong((id *)&self->_kbbCGSN, a3);
}

- (NSMutableDictionary)updateProperties
{
  return self->_updateProperties;
}

- (void)setUpdateProperties:(id)a3
{
  objc_storeStrong((id *)&self->_updateProperties, a3);
}

- (NSString)KBBSerialNumber
{
  return self->_KBBSerialNumber;
}

- (void)setKBBSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_KBBSerialNumber, a3);
}

- (NSString)KGBSerialNumber
{
  return self->_KGBSerialNumber;
}

- (void)setKGBSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_KGBSerialNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_KGBSerialNumber, 0);
  objc_storeStrong((id *)&self->_KBBSerialNumber, 0);
  objc_storeStrong((id *)&self->_updateProperties, 0);
  objc_storeStrong((id *)&self->_kbbCGSN, 0);
  objc_storeStrong((id *)&self->_previousCGSN, 0);
  objc_storeStrong((id *)&self->_kbbSealingManifest, 0);
  objc_storeStrong((id *)&self->_kbbSealDate, 0);
  objc_storeStrong((id *)&self->_sealDate, 0);
  objc_storeStrong((id *)&self->warnings, 0);
  objc_storeStrong((id *)&self->currentDataInstances, 0);
  objc_storeStrong((id *)&self->currentDataClasses, 0);
  objc_storeStrong((id *)&self->currentProperties, 0);
}

@end
