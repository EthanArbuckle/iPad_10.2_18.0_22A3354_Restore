@implementation CRChassisController

- (void)seal:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  void *v44;
  const char *v45;
  const char *v46;
  void *v47;
  const char *v48;
  const char *v49;
  id v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  const char *v66;
  _QWORD v67[5];
  id v68;
  id v69;
  void *v70;
  void *v71;
  uint8_t buf[4];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend_checkRepairEnvironment(self, v8, v9, v10) & 1) != 0)
  {
    objc_msgSend_overrideParameters_(self, v11, (uint64_t)v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend_mutableCopy(v13, v14, v15, v16);

    objc_msgSend_getAndVerifyDataInstance_(self, v18, (uint64_t)CFSTR("ChMf"), v19);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v22 = (void *)v20;
      objc_msgSend_getDataPayloadDictWithClass_instance_(self, v21, (uint64_t)CFSTR("ChMf"), v20);
      v23 = objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v25 = (void *)v23;
        handleForCategory(0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v73 = v25;
          _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "Sealed system manifest %@", buf, 0xCu);
        }

        objc_msgSend_getLiveChMf(self, v27, v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v32 = (void *)v30;
          handleForCategory(0);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v73 = v32;
            _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "Live system manifest %@", buf, 0xCu);
          }

          objc_msgSend_diffWithSealed_live_(self, v34, (uint64_t)v25, (uint64_t)v32);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v35;
          if (v35 && objc_msgSend_count(v35, v36, v37, v38))
          {
            v40 = (void *)MGCopyAnswer();
            objc_msgSend_setObject_forKeyedSubscript_(v17, v41, (uint64_t)v40, (uint64_t)CFSTR("KGBSerialNumber"));

            objc_msgSend_setObject_forKeyedSubscript_(v17, v42, (uint64_t)&unk_24D1B84D0, (uint64_t)CFSTR("patchDataClasses"));
            v71 = v22;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v43, (uint64_t)&v71, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v17, v45, (uint64_t)v44, (uint64_t)CFSTR("patchDataInstances"));

            v70 = v39;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v46, (uint64_t)&v70, 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v17, v48, (uint64_t)v47, (uint64_t)CFSTR("patchValues"));

            objc_msgSend_setObject_forKeyedSubscript_(v17, v49, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("doSeal"));
            v50 = objc_alloc(MEMORY[0x24BDD1988]);
            v52 = (void *)objc_msgSend_initWithMachServiceName_options_(v50, v51, (uint64_t)CFSTR("com.apple.corerepair"), 0);
            objc_msgSend_interfaceWithProtocol_(MEMORY[0x24BDD1990], v53, (uint64_t)&unk_254D80008, v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setRemoteObjectInterface_(v52, v56, (uint64_t)v55, v57);

            objc_msgSend_resume(v52, v58, v59, v60);
            objc_msgSend_remoteObjectProxy(v52, v61, v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v67[0] = MEMORY[0x24BDAC760];
            v67[1] = 3221225472;
            v67[2] = sub_214504FF8;
            v67[3] = &unk_24D1A9E98;
            v67[4] = self;
            v68 = v52;
            v69 = v7;
            v65 = v52;
            objc_msgSend_seal_withReply_(v64, v66, (uint64_t)v17, (uint64_t)v67);

          }
          else
          {
            objc_msgSend_replyWithMessage_status_results_reply_(self, v36, (uint64_t)CFSTR("Nothing to patch"), (uint64_t)&unk_24D1B7B60, 0, v7);
          }

        }
        else
        {
          objc_msgSend_replyWithError_reply_(self, v31, (uint64_t)CFSTR("Failed to get live system manifest"), (uint64_t)v7);

        }
      }
      else
      {
        objc_msgSend_replyWithError_reply_(self, v24, (uint64_t)CFSTR("Failed to get sealed system manifest"), (uint64_t)v7);
      }

    }
    else
    {
      objc_msgSend_replyWithError_reply_(self, v21, (uint64_t)CFSTR("Failed to get data instance"), (uint64_t)v7);
    }

  }
  else
  {
    objc_msgSend_replyWithError_reply_(self, v11, (uint64_t)CFSTR("Not supported under current environment"), (uint64_t)v7);
  }

}

- (void)replyWithError:(id)a3 reply:(id)a4
{
  objc_msgSend_replyWithMessage_status_results_reply_(self, a2, (uint64_t)a3, (uint64_t)&unk_24D1B7B78, 0, a4);
}

- (void)replyWithMessage:(id)a3 status:(id)a4 results:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(id, void *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15 = (void (**)(id, void *))a6;
  v20[0] = CFSTR("status");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[0] = v16;
  v20[1] = CFSTR("description");
  v17 = v9;
  if (!v9)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[1] = v17;
  v20[2] = CFSTR("results");
  v18 = v11;
  if (!v11)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21[2] = v18;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v12, (uint64_t)v21, (uint64_t)v20, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2](v15, v19);

  if (v11)
  {
    if (v9)
      goto LABEL_9;
LABEL_12:

    if (v10)
      goto LABEL_10;
LABEL_13:

    goto LABEL_10;
  }

  if (!v9)
    goto LABEL_12;
LABEL_9:
  if (!v10)
    goto LABEL_13;
LABEL_10:

}

- (id)overrideParameters:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
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
  const char *v24;
  uint64_t v25;
  id v26;
  void *v27;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    v9 = (void *)objc_msgSend_mutableCopy(v4, v5, v6, v7);
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;
  objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)CFSTR("CAURL"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v14, (uint64_t)CFSTR("https://gg.apple.com"), (uint64_t)CFSTR("CAURL"));
  objc_msgSend_objectForKeyedSubscript_(v12, v14, (uint64_t)CFSTR("DSURL"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v17, (uint64_t)CFSTR("https://skl.apple.com"), (uint64_t)CFSTR("DSURL"));
  objc_msgSend_objectForKeyedSubscript_(v12, v17, (uint64_t)CFSTR("TrustObjectURL"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v20, (uint64_t)CFSTR("http://gg.apple.com/fdrtrustobject"), (uint64_t)CFSTR("TrustObjectURL"));
  objc_msgSend_objectForKeyedSubscript_(v12, v20, (uint64_t)CFSTR("SealingURL"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v23, (uint64_t)CFSTR("https://ig.apple.com"), (uint64_t)CFSTR("SealingURL"));
  if (os_variant_has_internal_content())
  {
    objc_msgSend_overrideFromNVRam_(self, v24, (uint64_t)v12, v25);
    v26 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = v12;
  }
  v27 = v26;

  return v27;
}

- (id)overrideFromNVRam:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
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
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  id v50;
  id v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v51 = 0;
  objc_msgSend_readNVRAMValueForKey_error_(CRNVRAMController, v4, (uint64_t)CFSTR("corerepair-override"), (uint64_t)&v51);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v51;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v50 = 0;
    objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x24BDD1608], v7, (uint64_t)v5, 4, &v50);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v50;
    v9 = v13;
    if (v12)
      v14 = v13 == 0;
    else
      v14 = 0;
    if (!v14)
    {
      handleForCategory(0);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_214566554((uint64_t)v9, v15, v16, v17, v18, v19, v20, v21);

    }
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v12;
      _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "nvram overriede: %@", buf, 0xCu);
    }

    if (v3)
    {
      v26 = objc_msgSend_mutableCopy(v3, v23, v24, v25);
    }
    else
    {
      objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v23, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (id)v26;
    objc_msgSend_objectForKeyedSubscript_(v12, v27, (uint64_t)CFSTR("CAURL"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend_objectForKeyedSubscript_(v12, v30, (uint64_t)CFSTR("CAURL"), v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v11, v33, (uint64_t)v32, (uint64_t)CFSTR("CAURL"));

    }
    objc_msgSend_objectForKeyedSubscript_(v12, v30, (uint64_t)CFSTR("DSURL"), v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend_objectForKeyedSubscript_(v12, v35, (uint64_t)CFSTR("DSURL"), v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v11, v38, (uint64_t)v37, (uint64_t)CFSTR("DSURL"));

    }
    objc_msgSend_objectForKeyedSubscript_(v12, v35, (uint64_t)CFSTR("TrustObjectURL"), v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      objc_msgSend_objectForKeyedSubscript_(v12, v40, (uint64_t)CFSTR("TrustObjectURL"), v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v11, v43, (uint64_t)v42, (uint64_t)CFSTR("TrustObjectURL"));

    }
    objc_msgSend_objectForKeyedSubscript_(v12, v40, (uint64_t)CFSTR("SealingURL"), v41);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend_objectForKeyedSubscript_(v12, v45, (uint64_t)CFSTR("SealingURL"), v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v11, v48, (uint64_t)v47, (uint64_t)CFSTR("SealingURL"));

    }
  }
  else
  {
    v9 = v6;
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "No nvram override: %@", buf, 0xCu);
    }

    v11 = v3;
  }

  return v11;
}

- (id)diffWithSealed:(id)a3 live:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  const char *v33;
  id v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v7, v8, v9);
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = v5;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v37, (uint64_t)v45, 16);
  if (v12)
  {
    v15 = v12;
    v16 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v10);
        v18 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v10, v13, v18, v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v6, v20, v18, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (v22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if ((objc_msgSend_isEqualToData_(v19, v23, (uint64_t)v22, v24) & 1) != 0)
              goto LABEL_23;
            handleForCategory(0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v42 = v18;
              _os_log_impl(&dword_214503000, v25, OS_LOG_TYPE_DEFAULT, "Found diff values of %@", buf, 0xCu);
            }

            if (objc_msgSend_shouldIgnorePatching_(self, v26, v18, v27))
            {
              handleForCategory(0);
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v18;
                _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "Ignore %@", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend_objectForKeyedSubscript_(v6, v28, v18, v29);
              v30 = objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v35, v33, (uint64_t)v30, v18);
            }
          }
          else
          {
            handleForCategory(0);
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v42 = v18;
              v43 = 2112;
              v44 = v22;
              v31 = v30;
              v32 = "Invalid type of %@ in live data: %@";
              goto LABEL_20;
            }
          }
        }
        else
        {
          handleForCategory(0);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v42 = v18;
            v43 = 2112;
            v44 = v19;
            v31 = v30;
            v32 = "Invalid type of %@ in sealed data: %@";
LABEL_20:
            _os_log_error_impl(&dword_214503000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
          }
        }

LABEL_23:
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v37, (uint64_t)v45, 16);
    }
    while (v15);
  }

  return v35;
}

- (BOOL)shouldIgnorePatching:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  BOOL v10;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v12 = -1281988531;
  v10 = MGIsDeviceOfType()
     && ((objc_msgSend_isEqualToString_(v3, v4, (uint64_t)CFSTR("BM05"), v5, 0xD4C83437A3FD0C4FLL, 0x2B927B663C22D954, v12, v13) & 1) != 0|| objc_msgSend_hasPrefix_(v3, v6, (uint64_t)CFSTR("N"), v7)&& (objc_msgSend_hasSuffix_(v3, v8, (uint64_t)CFSTR("4"), v9) & 1) != 0);

  return v10;
}

- (id)getLiveChMf
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!copyFdrBlob())
    return 0;
  handleForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_2145665BC(v2, v3, v4, v5, v6, v7, v8, v9);

  return 0;
}

- (id)getAndVerifyDataInstance:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)AMFDRSealingMapCopyInstanceForClass();
  handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v3;
      v26 = 2112;
      v27 = v4;
      _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "Instance of %@ from sealing map: %@", buf, 0x16u);
    }

    v7 = (void *)AMFDRSealingManifestCopyInstanceForClass();
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v3;
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "Instance of %@ from sealing manifest: %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_21456661C(v6, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_2145665EC(v6, v10, v11, v12, v13, v14, v15, v16);
    v7 = 0;
  }

  AMSupportSafeRelease();
  return v7;
}

- (id)getDataPayloadDictWithClass:(id)a3 instance:(id)a4
{
  void *v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = CFSTR("DataStore");
  v23[0] = CFSTR("Local");
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a4;
  v7 = a3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(v5, v8, (uint64_t)v23, (uint64_t)&v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)AMFDRSealingMapCopyLocalDict();

  if (v10)
    v11 = v21 == 0;
  else
    v11 = 0;
  if (!v11)
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21456664C((uint64_t)&v21, v13, v15, v16, v17, v18, v19, v20);

  }
  AMSupportSafeRelease();

  return v10;
}

- (BOOL)checkRepairEnvironment
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  char isEqualToString;

  objc_msgSend_getOSEnvironment(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("repair"), v6);

  return isEqualToString;
}

- (id)getOSEnvironment
{
  io_registry_entry_t v2;
  io_object_t v3;
  void *CFProperty;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;

  v2 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  if (v2)
  {
    v3 = v2;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v2, CFSTR("osenvironment"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v5 = CFProperty;
    if (CFProperty)
    {
      v6 = objc_retainAutorelease(CFProperty);
      v10 = (const char *)objc_msgSend_bytes(v6, v7, v8, v9);
      v14 = objc_msgSend_length(v6, v11, v12, v13);
      v15 = strnlen(v10, v14);
      v16 = objc_alloc(MEMORY[0x24BDD17C8]);
      v17 = objc_retainAutorelease(v6);
      v21 = objc_msgSend_bytes(v17, v18, v19, v20);
      v23 = (void *)objc_msgSend_initWithBytes_length_encoding_(v16, v22, v21, v15, 1);
    }
    else
    {
      v23 = 0;
    }
    IOObjectRelease(v3);

  }
  else
  {
    v23 = 0;
  }
  return v23;
}

@end
