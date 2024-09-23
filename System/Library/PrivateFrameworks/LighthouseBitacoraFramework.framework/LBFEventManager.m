@implementation LBFEventManager

+ (id)sharedInstance
{
  if (qword_254355860 != -1)
    dispatch_once(&qword_254355860, &unk_2510950B0);
  return (id)qword_254355868;
}

- (LBFEventManager)init
{
  LBFEventManager *v2;
  LBFBiomeManager *biomeManagerLighthouse;
  LBFBiomeManager *biomeManagerMLRuntimed;
  LBFBiomeManager *biomeManagerTrial;
  LBFBiomeManager *biomeManagerDprivacyd;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LBFEventManager;
  v2 = -[LBFEventManager init](&v8, sel_init);
  if (v2)
  {
    LBFLoggingUtilsInit();
    biomeManagerLighthouse = v2->_biomeManagerLighthouse;
    v2->_biomeManagerLighthouse = 0;

    biomeManagerMLRuntimed = v2->_biomeManagerMLRuntimed;
    v2->_biomeManagerMLRuntimed = 0;

    biomeManagerTrial = v2->_biomeManagerTrial;
    v2->_biomeManagerTrial = 0;

    biomeManagerDprivacyd = v2->_biomeManagerDprivacyd;
    v2->_biomeManagerDprivacyd = 0;

  }
  return v2;
}

- (id)ensureBiomeManagerLighthouse
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2402FA068;
  block[3] = &unk_251095338;
  block[4] = self;
  if (onceTokenBiomeManagerLighthouse != -1)
    dispatch_once(&onceTokenBiomeManagerLighthouse, block);
  return self->_biomeManagerLighthouse;
}

- (id)ensureBiomeManagerTrial
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2402FA1B8;
  block[3] = &unk_251095338;
  block[4] = self;
  if (onceTokenBiomeManagerTrial != -1)
    dispatch_once(&onceTokenBiomeManagerTrial, block);
  return self->_biomeManagerTrial;
}

- (id)ensureBiomeManagerMLRuntimed
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2402FA308;
  block[3] = &unk_251095338;
  block[4] = self;
  if (onceTokenBiomeManagerMLRuntimed != -1)
    dispatch_once(&onceTokenBiomeManagerMLRuntimed, block);
  return self->_biomeManagerMLRuntimed;
}

- (id)ensureBiomeManagerDprivacyd
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2402FA458;
  block[3] = &unk_251095338;
  block[4] = self;
  if (onceTokenBiomeManagerDprivacyd != -1)
    dispatch_once(&onceTokenBiomeManagerDprivacyd, block);
  return self->_biomeManagerDprivacyd;
}

- (BOOL)addTrialdEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  BOOL v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint8_t v57[16];
  uint8_t v58[16];
  uint8_t buf[16];

  v8 = a3;
  v13 = a4;
  if (!v13)
  {
    if (objc_msgSend_eventType(v8, v9, v10, v11, v12) == 1)
    {
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
        sub_240315834();
      v32 = objc_alloc(MEMORY[0x24BDBCE70]);
      v36 = objc_msgSend_initWithObjectsAndKeys_(v32, v33, (uint64_t)CFSTR("Allocation event cannot have identifiers."), v34, v35, CFSTR("NSLocalizedDescriptionKey"), 0);
    }
    else if (objc_msgSend_eventType(v8, v28, v29, v30, v31) == 2)
    {
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
        sub_240315860();
      v48 = objc_alloc(MEMORY[0x24BDBCE70]);
      v36 = objc_msgSend_initWithObjectsAndKeys_(v48, v49, (uint64_t)CFSTR("Activation event must have identifiers."), v50, v51, CFSTR("NSLocalizedDescriptionKey"), 0);
    }
    else
    {
      if (objc_msgSend_eventType(v8, v44, v45, v46, v47) != 3)
        goto LABEL_2;
      if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
        sub_24031588C();
      v52 = objc_alloc(MEMORY[0x24BDBCE70]);
      v36 = objc_msgSend_initWithObjectsAndKeys_(v52, v53, (uint64_t)CFSTR("Deactivation event must have identifiers."), v54, v55, CFSTR("NSLocalizedDescriptionKey"), 0);
    }
    v16 = (void *)v36;
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v37, (uint64_t)CFSTR("com.apple.LighthouseBitacoraFramework"), 1, v36);
      v27 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
LABEL_28:
    v27 = 0;
    goto LABEL_29;
  }
LABEL_2:
  v14 = LBFLogContextEventManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2402DE000, v14, OS_LOG_TYPE_INFO, "Converting dict to event.", buf, 2u);
  }
  objc_msgSend_createTrialdEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v15, (uint64_t)v8, (uint64_t)v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = LBFLogContextEventManager;
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403145E0();
    v38 = objc_alloc(MEMORY[0x24BDBCE70]);
    v43 = (void *)objc_msgSend_initWithObjectsAndKeys_(v38, v39, (uint64_t)CFSTR("Biome event could not be generated."), v40, v41, CFSTR("NSLocalizedDescriptionKey"), 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v42, (uint64_t)CFSTR("com.apple.LighthouseBitacoraFramework"), 1, (uint64_t)v43);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v58 = 0;
    _os_log_impl(&dword_2402DE000, v17, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", v58, 2u);
  }
  objc_msgSend_ensureBiomeManagerTrial(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeData_(v22, v23, (uint64_t)v16, v24, v25);

  v26 = LBFLogContextEventManager;
  v27 = 1;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v57 = 0;
    _os_log_impl(&dword_2402DE000, v26, OS_LOG_TYPE_INFO, "Finished writing proto.", v57, 2u);
  }
LABEL_29:

  return v27;
}

- (BOOL)addLighthousePluginEvent:(id)a3
{
  NSObject *v3;
  uint8_t v5[16];

  v3 = LBFLogContextEventManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2402DE000, v3, OS_LOG_TYPE_INFO, "Call to deprecated addLighthousePluginEvent method.", v5, 2u);
  }
  return 1;
}

- (BOOL)addLighthousePluginEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint8_t v28[16];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = LBFLogContextEventManager;
  if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2402DE000, v10, OS_LOG_TYPE_INFO, "Converting dict to proto.", buf, 2u);
  }
  objc_msgSend_createLighthousePluginEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, v11, (uint64_t)v8, (uint64_t)v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = LBFLogContextEventManager;
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_2402DE000, v13, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", v28, 2u);
    }
    objc_msgSend_ensureBiomeManagerLighthouse(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v18, v19, (uint64_t)v12, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403145E0();
    v22 = objc_alloc(MEMORY[0x24BDBCE70]);
    v18 = (void *)objc_msgSend_initWithObjectsAndKeys_(v22, v23, (uint64_t)CFSTR("Biome event could not be generated."), v24, v25, CFSTR("NSLocalizedDescriptionKey"), 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v26, (uint64_t)CFSTR("com.apple.LighthouseBitacoraFramework"), 1, (uint64_t)v18);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12 != 0;
}

- (BOOL)addMLRuntimedEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint8_t v25[16];
  uint8_t buf[16];

  objc_msgSend_createMLRuntimedEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, a2, (uint64_t)a3, (uint64_t)a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = LBFLogContextEventManager;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2402DE000, v8, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", buf, 2u);
    }
    objc_msgSend_ensureBiomeManagerMLRuntimed(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v13, v14, (uint64_t)v7, v15, v16);

    v17 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2402DE000, v17, OS_LOG_TYPE_INFO, "Finished writing proto.", v25, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403145E0();
    v18 = objc_alloc(MEMORY[0x24BDBCE70]);
    v23 = (void *)objc_msgSend_initWithObjectsAndKeys_(v18, v19, (uint64_t)CFSTR("Biome event could not be generated."), v20, v21, CFSTR("NSLocalizedDescriptionKey"), 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("com.apple.LighthouseBitacoraFramework"), 1, (uint64_t)v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7 != 0;
}

- (BOOL)addDprivacydEvent:(id)a3 identifiers:(id)a4 error:(id *)a5
{
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  uint8_t v25[16];
  uint8_t buf[16];

  objc_msgSend_createDprivacydEvent_identifiers_timestamp_(LBFBiomeStoreDataConverter, a2, (uint64_t)a3, (uint64_t)a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = LBFLogContextEventManager;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2402DE000, v8, OS_LOG_TYPE_INFO, "Biome event generation finished, writing.", buf, 2u);
    }
    objc_msgSend_ensureBiomeManagerDprivacyd(self, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeData_(v13, v14, (uint64_t)v7, v15, v16);

    v17 = LBFLogContextEventManager;
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2402DE000, v17, OS_LOG_TYPE_INFO, "Finished writing proto.", v25, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_ERROR))
      sub_2403145E0();
    v18 = objc_alloc(MEMORY[0x24BDBCE70]);
    v23 = (void *)objc_msgSend_initWithObjectsAndKeys_(v18, v19, (uint64_t)CFSTR("Biome event could not be generated."), v20, v21, CFSTR("NSLocalizedDescriptionKey"), 0);
    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v22, (uint64_t)CFSTR("com.apple.LighthouseBitacoraFramework"), 1, (uint64_t)v23);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v7 != 0;
}

- (BOOL)isEqualIdentifiers:(id)a3 identifiers:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int isEqualToString;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  v11 = (void *)v6;
  if (!(v5 | v6))
  {
    LOBYTE(v12) = 1;
    goto LABEL_22;
  }
  LOBYTE(v12) = 0;
  if (v6)
    v13 = 0;
  else
    v13 = v5 != 0;
  if (v6)
    v14 = v5 == 0;
  else
    v14 = 0;
  if (!v14 && !v13)
  {
    objc_msgSend_bmltIdentifiers((void *)v5, v7, v8, v9, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15
      && (v20 = (void *)v15, v21 = objc_msgSend_identifierType(v11, v16, v17, v18, v19), v20, v21 == 2))
    {
      objc_msgSend_bmltIdentifiers((void *)v5, v16, v17, v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trialDeploymentID(v22, v23, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deploymentID(v11, v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v27, v33, (uint64_t)v32, v34, v35);

      if (isEqualToString)
      {
        objc_msgSend_bmltIdentifiers((void *)v5, v37, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialTaskID(v41, v42, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialTaskID(v11, v47, v48, v49, v50);
        v51 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v110 = (void *)v51;
        LOBYTE(v12) = objc_msgSend_isEqualToString_(v46, v52, v51, v53, v54);

        goto LABEL_22;
      }
    }
    else
    {
      objc_msgSend_experimentIdentifiers((void *)v5, v16, v17, v18, v19);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_22;
      v59 = objc_msgSend_identifierType(v11, v55, v56, v57, v58);

      if (v59 == 1)
      {
        objc_msgSend_experimentIdentifiers((void *)v5, v60, v61, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialDeploymentID(v64, v65, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_deploymentID(v11, v70, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_isEqualToString_(v69, v75, (uint64_t)v74, v76, v77);

        if (v78)
        {
          objc_msgSend_experimentIdentifiers((void *)v5, v79, v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_trialExperimentID(v83, v84, v85, v86, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_experimentID(v11, v89, v90, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend_isEqualToString_(v88, v94, (uint64_t)v93, v95, v96);

          if (v97)
          {
            objc_msgSend_experimentIdentifiers((void *)v5, v98, v99, v100, v101);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_trialTreatmentID(v41, v102, v103, v104, v105);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_treatmentID(v11, v106, v107, v108, v109);
            v51 = objc_claimAutoreleasedReturnValue();
            goto LABEL_20;
          }
        }
      }
    }
    LOBYTE(v12) = 0;
  }
LABEL_22:

  return (char)v12;
}

- (id)convertToLBFTrialIdentifiers:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LBFTrialIdentifiers *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  LBFTrialIdentifiers *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;

  v3 = a3;
  objc_msgSend_bmltIdentifiers(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = [LBFTrialIdentifiers alloc];
    objc_msgSend_bmltIdentifiers(v3, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v18, v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v3, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend_intValue(v33, v34, v35, v36, v37);
    v41 = (void *)objc_msgSend_initWithBMLTTaskID_deploymentID_(v13, v39, (uint64_t)v23, v38, v40);
  }
  else
  {
    objc_msgSend_experimentIdentifiers(v3, v9, v10, v11, v12);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
      v41 = 0;
      goto LABEL_6;
    }
    v43 = [LBFTrialIdentifiers alloc];
    objc_msgSend_experimentIdentifiers(v3, v44, v45, v46, v47);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v18, v48, v49, v50, v51);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v3, v52, v53, v54, v55);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v28, v56, v57, v58, v59);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend_intValue(v33, v60, v61, v62, v63);
    objc_msgSend_experimentIdentifiers(v3, v65, v66, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v69, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend_initWithExperimentID_deploymentID_treatmentID_(v43, v75, (uint64_t)v23, v64, (uint64_t)v74);

  }
LABEL_6:

  return v41;
}

- (void)enumerateLastTrialEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  LBFEventManager *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = a6;
  if (v10)
  {
    objc_msgSend_ensureBiomeManagerMLRuntimed(self, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_2402FB20C;
    v20[3] = &unk_251095430;
    v21 = v10;
    v22 = self;
    v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);

  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2403158B8();
  }

}

- (id)getLastTrialEvent:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_2402FB494;
  v13 = sub_2402FB4A4;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2402FB4AC;
  v8[3] = &unk_251095458;
  v8[4] = &v9;
  objc_msgSend_enumerateLastTrialEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)enumerateLastLighthousePluginEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  LBFEventManager *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = a6;
  if (v10)
  {
    objc_msgSend_ensureBiomeManagerMLRuntimed(self, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_2402FB5EC;
    v20[3] = &unk_251095430;
    v21 = v10;
    v22 = self;
    v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);

  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2403158B8();
  }

}

- (id)getLastLighthousePluginEvent:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_2402FB494;
  v13 = sub_2402FB4A4;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2402FBA90;
  v8[3] = &unk_251095480;
  v8[4] = &v9;
  objc_msgSend_enumerateLastLighthousePluginEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)enumerateLastMLRuntimeEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  LBFEventManager *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = a6;
  if (v10)
  {
    objc_msgSend_ensureBiomeManagerMLRuntimed(self, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_2402FBBD0;
    v20[3] = &unk_251095430;
    v21 = v10;
    v22 = self;
    v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);

  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2403158B8();
  }

}

- (id)getLastMLRuntimeEvent:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_2402FB494;
  v13 = sub_2402FB4A4;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2402FC0D0;
  v8[3] = &unk_2510954A8;
  v8[4] = &v9;
  objc_msgSend_enumerateLastMLRuntimeEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)enumerateLastDprivacyEvents:(id)a3 startDate:(id)a4 endDate:(id)a5 shouldContinue:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  const char *v19;
  _QWORD v20[4];
  id v21;
  LBFEventManager *v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v17 = a6;
  if (v10)
  {
    objc_msgSend_ensureBiomeManagerDprivacyd(self, v13, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = sub_2402FC210;
    v20[3] = &unk_251095430;
    v21 = v10;
    v22 = self;
    v23 = v17;
    objc_msgSend_enumerateData_endDate_reversed_shouldContinue_(v18, v19, (uint64_t)v11, (uint64_t)v12, 1, v20);

  }
  else if (os_log_type_enabled((os_log_t)LBFLogContextEventManager, OS_LOG_TYPE_DEBUG))
  {
    sub_2403158B8();
  }

}

- (id)getLastDprivacyEvent:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_2402FB494;
  v13 = sub_2402FB4A4;
  v14 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = sub_2402FC510;
  v8[3] = &unk_2510954D0;
  v8[4] = &v9;
  objc_msgSend_enumerateLastDprivacyEvents_startDate_endDate_shouldContinue_(self, v5, (uint64_t)v4, 0, 0, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (LBFBiomeManager)biomeManagerLighthouse
{
  return self->_biomeManagerLighthouse;
}

- (void)setBiomeManagerLighthouse:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManagerLighthouse, a3);
}

- (LBFBiomeManager)biomeManagerTrial
{
  return self->_biomeManagerTrial;
}

- (void)setBiomeManagerTrial:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManagerTrial, a3);
}

- (LBFBiomeManager)biomeManagerMLRuntimed
{
  return self->_biomeManagerMLRuntimed;
}

- (void)setBiomeManagerMLRuntimed:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManagerMLRuntimed, a3);
}

- (LBFBiomeManager)biomeManagerDprivacyd
{
  return self->_biomeManagerDprivacyd;
}

- (void)setBiomeManagerDprivacyd:(id)a3
{
  objc_storeStrong((id *)&self->_biomeManagerDprivacyd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeManagerDprivacyd, 0);
  objc_storeStrong((id *)&self->_biomeManagerMLRuntimed, 0);
  objc_storeStrong((id *)&self->_biomeManagerTrial, 0);
  objc_storeStrong((id *)&self->_biomeManagerLighthouse, 0);
}

@end
